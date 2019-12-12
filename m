Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88C2F11CDCC
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 14:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729373AbfLLNGV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 08:06:21 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34598 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729297AbfLLNGV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 08:06:21 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCD6FjJ046822;
        Thu, 12 Dec 2019 07:06:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576155975;
        bh=dUt9cxzXT8ATche9ypvfUEfMBASy8mLvyF9jE25xr7I=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=EfTX/xOn3867wEpyy2klKs6fBoCflFkiZEHSo0HfTKE9s6DikcL4Cp/NXfVO1jFvw
         yWoctgd/7PlwcJGaTdzD8UPRNWQoCt3AOsPfFp04Af1dfrTTxdViprD7E3yqA6yzCE
         pDQO1nZOh9luicibwUUfukTDPHzBtmQ5vIEpYk+w=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCD6FLW098104
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 07:06:15 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 07:06:15 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 07:06:15 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCD66KG069503;
        Thu, 12 Dec 2019 07:06:14 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>, <s-anna@ti.com>
Subject: [PATCH 5/5] ARM: OMAP2+: use separate IOMMU pdata to fix DRA7 IPU1 boot
Date:   Thu, 12 Dec 2019 15:05:41 +0200
Message-ID: <20191212130541.3657-6-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212130541.3657-1-t-kristo@ti.com>
References: <20191212130541.3657-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The IPU1 MMU has been using common IOMMU pdata quirks defined and
used by all IPU IOMMU devices on OMAP4 and beyond. Separate out the
pdata for IPU1 MMU with the additional .set_pwrdm_constraint ops
plugged in, so that the IPU1 power domain can be restricted to ON
state during the boot and active period of the IPU1 remote processor.
This eliminates the pre-conditions for the IPU1 boot issue as
described in commit afe518400bdb ("iommu/omap: fix boot issue on
remoteprocs with AMMU/Unicache").

NOTE:
1. RET is not a valid target power domain state on DRA7 platforms,
   and IPU power domain is normally programmed for OFF. The IPU1
   still fails to boot though, and an unclearable l3_noc error is
   thrown currently on 4.14 kernel without this fix. This behavior
   is slightly different from previous 4.9 LTS kernel.
2. The fix is currently applied only to IPU1 on DRA7xx SoC, as the
   other affected processors on OMAP4/OMAP5/DRA7 are in domains
   that are not entering RET. IPU2 on DRA7 is in CORE power domain
   which is only programmed for ON power state. The fix can be easily
   scaled if these domains do hit RET in the future.
3. The issue was not seen on current DRA7 platforms if any of the
   DSP remote processors were booted and using one of the GPTimers
   5, 6, 7 or 8 on previous 4.9 LTS kernel. This was due to the
   errata fix for i874 implemented in commit 1cbabcb9807e ("ARM:
   DRA7: clockdomain: Implement timer workaround for errata i874")
   which keeps the IPU1 power domain from entering RET when the
   timers are active. But the timer workaround did not make any
   difference on 4.14 kernel, and an l3_noc error was seen still
   without this fix.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/mach-omap2/pdata-quirks.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
index 88ca7f82510a..7c6e57e4bcb2 100644
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -43,6 +43,17 @@ struct pdata_init {
 static struct of_dev_auxdata omap_auxdata_lookup[];
 static struct twl4030_gpio_platform_data twl_gpio_auxdata;
 
+#if IS_ENABLED(CONFIG_OMAP_IOMMU)
+int omap_iommu_set_pwrdm_constraint(struct platform_device *pdev, bool request,
+				    u8 *pwrst);
+#else
+static inline int omap_iommu_set_pwrdm_constraint(struct platform_device *pdev,
+						  bool request, u8 *pwrst)
+{
+	return 0;
+}
+#endif
+
 #ifdef CONFIG_MACH_NOKIA_N8X0
 static void __init omap2420_n8x0_legacy_init(void)
 {
@@ -276,6 +287,10 @@ static void __init omap5_uevm_legacy_init(void)
 #endif
 
 #ifdef CONFIG_SOC_DRA7XX
+static struct iommu_platform_data dra7_ipu1_dsp_iommu_pdata = {
+	.set_pwrdm_constraint = omap_iommu_set_pwrdm_constraint,
+};
+
 static struct omap_hsmmc_platform_data dra7_hsmmc_data_mmc1;
 static struct omap_hsmmc_platform_data dra7_hsmmc_data_mmc2;
 static struct omap_hsmmc_platform_data dra7_hsmmc_data_mmc3;
@@ -499,6 +514,12 @@ static struct of_dev_auxdata omap_auxdata_lookup[] = {
 		       &dra7_hsmmc_data_mmc2),
 	OF_DEV_AUXDATA("ti,dra7-hsmmc", 0x480ad000, "480ad000.mmc",
 		       &dra7_hsmmc_data_mmc3),
+	OF_DEV_AUXDATA("ti,dra7-dsp-iommu", 0x40d01000, "40d01000.mmu",
+		       &dra7_ipu1_dsp_iommu_pdata),
+	OF_DEV_AUXDATA("ti,dra7-dsp-iommu", 0x41501000, "41501000.mmu",
+		       &dra7_ipu1_dsp_iommu_pdata),
+	OF_DEV_AUXDATA("ti,dra7-iommu", 0x58882000, "58882000.mmu",
+		       &dra7_ipu1_dsp_iommu_pdata),
 #endif
 	/* Common auxdata */
 	OF_DEV_AUXDATA("ti,sysc", 0, NULL, &ti_sysc_pdata),
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
