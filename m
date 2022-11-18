Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43F2562F2C7
	for <lists+linux-omap@lfdr.de>; Fri, 18 Nov 2022 11:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241173AbiKRKmw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Nov 2022 05:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbiKRKmv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Nov 2022 05:42:51 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2940397082
        for <linux-omap@vger.kernel.org>; Fri, 18 Nov 2022 02:42:50 -0800 (PST)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 28796807E;
        Fri, 18 Nov 2022 10:32:43 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sicelo Mhlongo <absicsz@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3/3] ARM: OMAP2+: Drop legacy hwmod data for omap3 otg
Date:   Fri, 18 Nov 2022 12:42:26 +0200
Message-Id: <20221118104226.46223-4-tony@atomide.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118104226.46223-1-tony@atomide.com>
References: <20221118104226.46223-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

With complete devicetree data available to probe with ti-sysc interconnect
target module driver, we can now drop the related SoC data.

Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Sicelo Mhlongo <absicsz@gmail.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap_hwmod_3xxx_data.c | 99 ----------------------
 1 file changed, 99 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c b/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c
@@ -1135,65 +1135,6 @@ static struct omap_hwmod omap34xx_mcspi4 = {
 	.class		= &omap34xx_mcspi_class,
 };
 
-/* usbhsotg */
-static struct omap_hwmod_class_sysconfig omap3xxx_usbhsotg_sysc = {
-	.rev_offs	= 0x0400,
-	.sysc_offs	= 0x0404,
-	.syss_offs	= 0x0408,
-	.sysc_flags	= (SYSC_HAS_SIDLEMODE | SYSC_HAS_MIDLEMODE|
-			  SYSC_HAS_ENAWAKEUP | SYSC_HAS_SOFTRESET |
-			  SYSC_HAS_AUTOIDLE),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			  MSTANDBY_FORCE | MSTANDBY_NO | MSTANDBY_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class usbotg_class = {
-	.name = "usbotg",
-	.sysc = &omap3xxx_usbhsotg_sysc,
-};
-
-/* usb_otg_hs */
-
-static struct omap_hwmod omap3xxx_usbhsotg_hwmod = {
-	.name		= "usb_otg_hs",
-	.main_clk	= "hsotgusb_ick",
-	.prcm		= {
-		.omap2 = {
-			.module_offs = CORE_MOD,
-			.idlest_reg_id = 1,
-			.idlest_idle_bit = OMAP3430ES2_ST_HSOTGUSB_IDLE_SHIFT,
-		},
-	},
-	.class		= &usbotg_class,
-
-	/*
-	 * Erratum ID: i479  idle_req / idle_ack mechanism potentially
-	 * broken when autoidle is enabled
-	 * workaround is to disable the autoidle bit at module level.
-	 *
-	 * Enabling the device in any other MIDLEMODE setting but force-idle
-	 * causes core_pwrdm not enter idle states at least on OMAP3630.
-	 * Note that musb has OTG_FORCESTDBY register that controls MSTANDBY
-	 * signal when MIDLEMODE is set to force-idle.
-	 */
-	.flags		= HWMOD_NO_OCP_AUTOIDLE | HWMOD_SWSUP_SIDLE |
-			  HWMOD_FORCE_MSTANDBY | HWMOD_RECONFIG_IO_CHAIN,
-};
-
-/* usb_otg_hs */
-
-static struct omap_hwmod_class am35xx_usbotg_class = {
-	.name = "am35xx_usbotg",
-};
-
-static struct omap_hwmod am35xx_usbhsotg_hwmod = {
-	.name		= "am35x_otg_hs",
-	.main_clk	= "hsotgusb_fck",
-	.class		= &am35xx_usbotg_class,
-	.flags		= HWMOD_NO_IDLEST,
-};
-
 /* MMC/SD/SDIO common */
 static struct omap_hwmod_class_sysconfig omap34xx_mmc_sysc = {
 	.rev_offs	= 0x1fc,
@@ -1561,22 +1502,6 @@ static struct omap_hwmod_ocp_if omap3xxx_dss__l3 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_core -> usbhsotg interface */
-static struct omap_hwmod_ocp_if omap3xxx_usbhsotg__l3 = {
-	.master		= &omap3xxx_usbhsotg_hwmod,
-	.slave		= &omap3xxx_l3_main_hwmod,
-	.clk		= "core_l3_ick",
-	.user		= OCP_USER_MPU,
-};
-
-/* l3_core -> am35xx_usbhsotg interface */
-static struct omap_hwmod_ocp_if am35xx_usbhsotg__l3 = {
-	.master		= &am35xx_usbhsotg_hwmod,
-	.slave		= &omap3xxx_l3_main_hwmod,
-	.clk		= "hsotgusb_ick",
-	.user		= OCP_USER_MPU,
-};
-
 /* l3_core -> sad2d interface */
 static struct omap_hwmod_ocp_if omap3xxx_sad2d__l3 = {
 	.master		= &omap3xxx_sad2d_hwmod,
@@ -1758,24 +1683,6 @@ static struct omap_hwmod_ocp_if omap36xx_l4_core__sr2 = {
 	.user		= OCP_USER_MPU,
 };
 
-
-/* l4_core -> usbhsotg  */
-static struct omap_hwmod_ocp_if omap3xxx_l4_core__usbhsotg = {
-	.master		= &omap3xxx_l4_core_hwmod,
-	.slave		= &omap3xxx_usbhsotg_hwmod,
-	.clk		= "l4_ick",
-	.user		= OCP_USER_MPU,
-};
-
-
-/* l4_core -> usbhsotg  */
-static struct omap_hwmod_ocp_if am35xx_l4_core__usbhsotg = {
-	.master		= &omap3xxx_l4_core_hwmod,
-	.slave		= &am35xx_usbhsotg_hwmod,
-	.clk		= "hsotgusb_ick",
-	.user		= OCP_USER_MPU,
-};
-
 /* L4_WKUP -> L4_SEC interface */
 static struct omap_hwmod_ocp_if omap3xxx_l4_wkup__l4_sec = {
 	.master = &omap3xxx_l4_wkup_hwmod,
@@ -2465,8 +2372,6 @@ static struct omap_hwmod_ocp_if *omap3430es1_hwmod_ocp_ifs[] __initdata = {
 static struct omap_hwmod_ocp_if *omap3430es2plus_hwmod_ocp_ifs[] __initdata = {
 	&omap3xxx_dss__l3,
 	&omap3xxx_l4_core__dss,
-	&omap3xxx_usbhsotg__l3,
-	&omap3xxx_l4_core__usbhsotg,
 	&omap3xxx_usb_host_hs__l3_main_2,
 	&omap3xxx_l4_core__usb_host_hs,
 	&omap3xxx_l4_core__usb_tll_hs,
@@ -2509,8 +2414,6 @@ static struct omap_hwmod_ocp_if *omap36xx_hwmod_ocp_ifs[] __initdata = {
 	&omap3xxx_l4_core__dss,
 	&omap36xx_l4_core__sr1,
 	&omap36xx_l4_core__sr2,
-	&omap3xxx_usbhsotg__l3,
-	&omap3xxx_l4_core__usbhsotg,
 	&omap3xxx_l4_core__mailbox,
 	&omap3xxx_usb_host_hs__l3_main_2,
 	&omap3xxx_l4_core__usb_host_hs,
@@ -2528,8 +2431,6 @@ static struct omap_hwmod_ocp_if *omap36xx_hwmod_ocp_ifs[] __initdata = {
 static struct omap_hwmod_ocp_if *am35xx_hwmod_ocp_ifs[] __initdata = {
 	&omap3xxx_dss__l3,
 	&omap3xxx_l4_core__dss,
-	&am35xx_usbhsotg__l3,
-	&am35xx_l4_core__usbhsotg,
 	&am35xx_l4_core__uart4,
 	&omap3xxx_usb_host_hs__l3_main_2,
 	&omap3xxx_l4_core__usb_host_hs,
-- 
2.38.1
