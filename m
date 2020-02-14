Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B58115ED9B
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 18:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390284AbgBNQGB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 11:06:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:56178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390278AbgBNQGB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 14 Feb 2020 11:06:01 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 602442187F;
        Fri, 14 Feb 2020 16:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581696360;
        bh=V1uCnsEmX49LJ2ydtXkP/swSg4Sx68+/0ijzYCeDjIM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Pu5AHOCpzxDcEIXZ7P/AUfbLNPucTwmA/mLlEyYNJF84JjFZ26xLezj7fy+HcAEdX
         iPbKEkFAg7+PAJq1sFmsJ0XZ2XxNjiKDcVUWrP1j8gUL3lbsTpDUOSaZUYCPLUm1Dj
         WC+FqkONfWHlhS6dBpqIEyIH9paT2p5ipFTVyRAk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Suman Anna <s-anna@ti.com>, Tony Lindgren <tony@atomide.com>,
        Sasha Levin <sashal@kernel.org>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 192/459] ARM: OMAP2+: use separate IOMMU pdata to fix DRA7 IPU1 boot
Date:   Fri, 14 Feb 2020 10:57:22 -0500
Message-Id: <20200214160149.11681-192-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

[ Upstream commit 4601832f40501efc3c2fd264a5a69bd1ac17d520 ]

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
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/mach-omap2/pdata-quirks.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
index 2657752b90670..e13dcc0083a05 100644
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -45,6 +45,17 @@ struct pdata_init {
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
@@ -337,6 +348,10 @@ static void __init omap5_uevm_legacy_init(void)
 #endif
 
 #ifdef CONFIG_SOC_DRA7XX
+static struct iommu_platform_data dra7_ipu1_dsp_iommu_pdata = {
+	.set_pwrdm_constraint = omap_iommu_set_pwrdm_constraint,
+};
+
 static struct omap_hsmmc_platform_data dra7_hsmmc_data_mmc1;
 static struct omap_hsmmc_platform_data dra7_hsmmc_data_mmc2;
 static struct omap_hsmmc_platform_data dra7_hsmmc_data_mmc3;
@@ -568,6 +583,12 @@ static struct of_dev_auxdata omap_auxdata_lookup[] = {
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
2.20.1

