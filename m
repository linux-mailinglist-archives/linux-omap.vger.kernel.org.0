Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE3ED848CA
	for <lists+linux-omap@lfdr.de>; Wed,  7 Aug 2019 11:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbfHGJo4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 05:44:56 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51096 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbfHGJo4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Aug 2019 05:44:56 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x779ioO7102937;
        Wed, 7 Aug 2019 04:44:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565171090;
        bh=WYojn9LceY76Mlk7Y/OrkqTjskWrmEg3mDRct7IOXUk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=BBrlzK/4ZjX/bMNgogTjSTtX1euRW11CG3ZBYen8IAbGG9eHMkgOEmQZltrcHa5gC
         1hY1s5zdLjyE7mGAzZixVUD6VRJNP8MwTDX9fxRLqPzZUnM/haFhqITRrdSzYRv84l
         0hhtOh+U/fcOEiUw8I4c0nsrHAKPCwnqCYs9h2i0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x779iovK067638
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 04:44:50 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 04:44:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 04:44:50 -0500
Received: from gomoku.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x779imdS037583;
        Wed, 7 Aug 2019 04:44:49 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>, <s-anna@ti.com>
Subject: [PATCH 1/3] ARM: OMAP4+: remove pdata quirks for omap4+ iommus
Date:   Wed, 7 Aug 2019 12:44:39 +0300
Message-ID: <1565171081-7899-2-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565171081-7899-1-git-send-email-t-kristo@ti.com>
References: <1565171081-7899-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

IOMMU driver will be using ti-sysc bus driver for power management control
going forward, and the pdata quirks are not needed for anything anymore.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/mach-omap2/pdata-quirks.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
index 6c6f8fc..58fb0de 100644
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -419,14 +419,6 @@ static void __init omap3_pandora_legacy_init(void)
 }
 #endif /* CONFIG_ARCH_OMAP3 */
 
-#if defined(CONFIG_ARCH_OMAP4) || defined(CONFIG_SOC_OMAP5)
-static struct iommu_platform_data omap4_iommu_pdata = {
-	.reset_name = "mmu_cache",
-	.assert_reset = omap_device_assert_hardreset,
-	.deassert_reset = omap_device_deassert_hardreset,
-};
-#endif
-
 #if defined(CONFIG_SOC_AM33XX) || defined(CONFIG_SOC_AM43XX)
 static struct wkup_m3_platform_data wkup_m3_data = {
 	.reset_name = "wkup_m3",
@@ -642,10 +634,6 @@ static void __init omap3_mcbsp_init(void) {}
 		       &wkup_m3_data),
 #endif
 #if defined(CONFIG_ARCH_OMAP4) || defined(CONFIG_SOC_OMAP5)
-	OF_DEV_AUXDATA("ti,omap4-iommu", 0x4a066000, "4a066000.mmu",
-		       &omap4_iommu_pdata),
-	OF_DEV_AUXDATA("ti,omap4-iommu", 0x55082000, "55082000.mmu",
-		       &omap4_iommu_pdata),
 	OF_DEV_AUXDATA("ti,omap4-smartreflex-iva", 0x4a0db000,
 		       "4a0db000.smartreflex", &omap_sr_pdata[OMAP_SR_IVA]),
 	OF_DEV_AUXDATA("ti,omap4-smartreflex-core", 0x4a0dd000,
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
