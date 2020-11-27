Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 067682C602D
	for <lists+linux-omap@lfdr.de>; Fri, 27 Nov 2020 07:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgK0Gcx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Nov 2020 01:32:53 -0500
Received: from muru.com ([72.249.23.125]:49386 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbgK0Gcx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 27 Nov 2020 01:32:53 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 7F1A78063;
        Fri, 27 Nov 2020 06:32:59 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, Nishanth Menon <nm@ti.com>
Subject: [PATCH] ARM: OMAP2+: Fix am4 only build after genpd changes
Date:   Fri, 27 Nov 2020 08:32:45 +0200
Message-Id: <20201127063245.62153-1-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With commit df6c2ec872a6 ("ARM: OMAP2+: Drop legacy remaining legacy
platform data for am4") we moved am4 to boot with simple-pm-bus using
genpd and devicetree based data. But I forgot to test am4 only build
that still has few references to the old platform data left, and cause
undefined reference errors with omap_hwmod_set_postsetup_state and
omap_hwmod_for_each. We can just drop the related calls for am4 now,
and also drop the references to unused struct wkup_m3_platform_data.

Reported-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

I'm applying this into omap-for-v5.11/genpd branch to fix build for
am4 config.

---
 arch/arm/mach-omap2/io.c           |  1 -
 arch/arm/mach-omap2/pdata-quirks.c | 12 ------------
 2 files changed, 13 deletions(-)

diff --git a/arch/arm/mach-omap2/io.c b/arch/arm/mach-omap2/io.c
--- a/arch/arm/mach-omap2/io.c
+++ b/arch/arm/mach-omap2/io.c
@@ -588,7 +588,6 @@ void __init am43xx_init_early(void)
 	omap2_prcm_base_init();
 	am43xx_powerdomains_init();
 	am43xx_clockdomains_init();
-	omap_hwmod_init_postsetup();
 	omap_l2_cache_init();
 	omap_clk_soc_init = am43xx_dt_clk_init;
 	omap_secure_init();
diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -274,14 +274,6 @@ static void __init omap3_pandora_legacy_init(void)
 }
 #endif /* CONFIG_ARCH_OMAP3 */
 
-#if defined(CONFIG_SOC_AM43XX)
-static struct wkup_m3_platform_data wkup_m3_data = {
-	.reset_name = "wkup_m3",
-	.assert_reset = omap_device_assert_hardreset,
-	.deassert_reset = omap_device_deassert_hardreset,
-};
-#endif
-
 #ifdef CONFIG_SOC_OMAP5
 static void __init omap5_uevm_legacy_init(void)
 {
@@ -507,10 +499,6 @@ static struct of_dev_auxdata omap_auxdata_lookup[] = {
 	OF_DEV_AUXDATA("ti,omap3-mcbsp", 0x49024000, "49024000.mcbsp", &mcbsp_pdata),
 #endif
 #endif
-#ifdef CONFIG_SOC_AM43XX
-	OF_DEV_AUXDATA("ti,am4372-wkup-m3", 0x44d00000, "44d00000.wkup_m3",
-		       &wkup_m3_data),
-#endif
 #if defined(CONFIG_ARCH_OMAP4) || defined(CONFIG_SOC_OMAP5)
 	OF_DEV_AUXDATA("ti,omap4-smartreflex-iva", 0x4a0db000,
 		       "4a0db000.smartreflex", &omap_sr_pdata[OMAP_SR_IVA]),
-- 
2.29.2
