Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B1B414526
	for <lists+linux-omap@lfdr.de>; Wed, 22 Sep 2021 11:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234396AbhIVJck (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Sep 2021 05:32:40 -0400
Received: from muru.com ([72.249.23.125]:36064 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234327AbhIVJck (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 22 Sep 2021 05:32:40 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D543B80FC;
        Wed, 22 Sep 2021 09:31:37 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: OMAP2+: Drop unused old auxdata for dra7x_evm_mmc_quirk()
Date:   Wed, 22 Sep 2021 12:31:02 +0300
Message-Id: <20210922093102.12748-2-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922093102.12748-1-tony@atomide.com>
References: <20210922093102.12748-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is no longer used as dra7 uses sdhci-omap instead of omap_hsmmc,
and the quirk is already implemented in the sdhci-omap driver.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/pdata-quirks.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -278,24 +278,6 @@ static void __init omap3_pandora_legacy_init(void)
 static struct iommu_platform_data dra7_ipu1_dsp_iommu_pdata = {
 	.set_pwrdm_constraint = omap_iommu_set_pwrdm_constraint,
 };
-
-static struct omap_hsmmc_platform_data dra7_hsmmc_data_mmc1;
-static struct omap_hsmmc_platform_data dra7_hsmmc_data_mmc2;
-static struct omap_hsmmc_platform_data dra7_hsmmc_data_mmc3;
-
-static void __init dra7x_evm_mmc_quirk(void)
-{
-	if (omap_rev() == DRA752_REV_ES1_1 || omap_rev() == DRA752_REV_ES1_0) {
-		dra7_hsmmc_data_mmc1.version = "rev11";
-		dra7_hsmmc_data_mmc1.max_freq = 96000000;
-
-		dra7_hsmmc_data_mmc2.version = "rev11";
-		dra7_hsmmc_data_mmc2.max_freq = 48000000;
-
-		dra7_hsmmc_data_mmc3.version = "rev11";
-		dra7_hsmmc_data_mmc3.max_freq = 48000000;
-	}
-}
 #endif
 
 static struct clockdomain *ti_sysc_find_one_clockdomain(struct clk *clk)
@@ -502,12 +484,6 @@ static struct of_dev_auxdata omap_auxdata_lookup[] = {
 		       "4a0d9000.smartreflex", &omap_sr_pdata[OMAP_SR_MPU]),
 #endif
 #ifdef CONFIG_SOC_DRA7XX
-	OF_DEV_AUXDATA("ti,dra7-hsmmc", 0x4809c000, "4809c000.mmc",
-		       &dra7_hsmmc_data_mmc1),
-	OF_DEV_AUXDATA("ti,dra7-hsmmc", 0x480b4000, "480b4000.mmc",
-		       &dra7_hsmmc_data_mmc2),
-	OF_DEV_AUXDATA("ti,dra7-hsmmc", 0x480ad000, "480ad000.mmc",
-		       &dra7_hsmmc_data_mmc3),
 	OF_DEV_AUXDATA("ti,dra7-dsp-iommu", 0x40d01000, "40d01000.mmu",
 		       &dra7_ipu1_dsp_iommu_pdata),
 	OF_DEV_AUXDATA("ti,dra7-dsp-iommu", 0x41501000, "41501000.mmu",
@@ -542,9 +518,6 @@ static struct pdata_init pdata_quirks[] __initdata = {
 	{ "technexion,omap3-tao3530", omap3_tao3530_legacy_init, },
 	{ "openpandora,omap3-pandora-600mhz", omap3_pandora_legacy_init, },
 	{ "openpandora,omap3-pandora-1ghz", omap3_pandora_legacy_init, },
-#endif
-#ifdef CONFIG_SOC_DRA7XX
-	{ "ti,dra7-evm", dra7x_evm_mmc_quirk, },
 #endif
 	{ /* sentinel */ },
 };
-- 
2.33.0
