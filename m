Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B611D1806B7
	for <lists+linux-omap@lfdr.de>; Tue, 10 Mar 2020 19:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbgCJSfR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Mar 2020 14:35:17 -0400
Received: from muru.com ([72.249.23.125]:59590 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727556AbgCJSfP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Mar 2020 14:35:15 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 20D46810A;
        Tue, 10 Mar 2020 18:36:00 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 03/10] ARM: OMAP2+: Drop legacy platform data for dm814x cpsw
Date:   Tue, 10 Mar 2020 11:34:57 -0700
Message-Id: <20200310183504.65358-4-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310183504.65358-1-tony@atomide.com>
References: <20200310183504.65358-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data.
dts property.

Cc: Graeme Smecher <gsmecher@threespeedlogic.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 58 ----------------------
 1 file changed, 58 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
@@ -867,62 +867,6 @@ static struct omap_hwmod_ocp_if dm816x_l4_ls__timer7 = {
 	.user		= OCP_USER_MPU,
 };
 
-/* CPSW on dm814x */
-static struct omap_hwmod_class_sysconfig dm814x_cpgmac_sysc = {
-	.rev_offs	= 0x0,
-	.sysc_offs	= 0x8,
-	.syss_offs	= 0x4,
-	.sysc_flags	= SYSC_HAS_SIDLEMODE | SYSC_HAS_MIDLEMODE |
-			  SYSS_HAS_RESET_STATUS,
-	.idlemodes	= SIDLE_FORCE | SIDLE_NO | MSTANDBY_FORCE |
-			  MSTANDBY_NO,
-	.sysc_fields	= &omap_hwmod_sysc_type3,
-};
-
-static struct omap_hwmod_class dm814x_cpgmac0_hwmod_class = {
-	.name		= "cpgmac0",
-	.sysc		= &dm814x_cpgmac_sysc,
-};
-
-static struct omap_hwmod dm814x_cpgmac0_hwmod = {
-	.name		= "cpgmac0",
-	.class		= &dm814x_cpgmac0_hwmod_class,
-	.clkdm_name	= "alwon_ethernet_clkdm",
-	.flags		= HWMOD_SWSUP_SIDLE | HWMOD_SWSUP_MSTANDBY,
-	.main_clk	= "cpsw_125mhz_gclk",
-	.prcm		= {
-		.omap4	= {
-			.clkctrl_offs = DM81XX_CM_ALWON_ETHERNET_0_CLKCTRL,
-			.modulemode = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-static struct omap_hwmod_class dm814x_mdio_hwmod_class = {
-	.name		= "davinci_mdio",
-};
-
-static struct omap_hwmod dm814x_mdio_hwmod = {
-	.name		= "davinci_mdio",
-	.class		= &dm814x_mdio_hwmod_class,
-	.clkdm_name	= "alwon_ethernet_clkdm",
-	.main_clk	= "cpsw_125mhz_gclk",
-};
-
-static struct omap_hwmod_ocp_if dm814x_l4_hs__cpgmac0 = {
-	.master		= &dm81xx_l4_hs_hwmod,
-	.slave		= &dm814x_cpgmac0_hwmod,
-	.clk		= "cpsw_125mhz_gclk",
-	.user		= OCP_USER_MPU,
-};
-
-static struct omap_hwmod_ocp_if dm814x_cpgmac0__mdio = {
-	.master		= &dm814x_cpgmac0_hwmod,
-	.slave		= &dm814x_mdio_hwmod,
-	.user		= OCP_USER_MPU,
-	.flags		= HWMOD_NO_IDLEST,
-};
-
 /* EMAC Ethernet */
 static struct omap_hwmod_class_sysconfig dm816x_emac_sysc = {
 	.rev_offs	= 0x0,
@@ -1510,8 +1454,6 @@ static struct omap_hwmod_ocp_if *dm814x_hwmod_ocp_ifs[] __initdata = {
 	&dm81xx_tptc3__alwon_l3_fast,
 	&dm814x_l4_ls__timer1,
 	&dm814x_l4_ls__timer2,
-	&dm814x_l4_hs__cpgmac0,
-	&dm814x_cpgmac0__mdio,
 	&dm81xx_alwon_l3_slow__gpmc,
 	&dm814x_default_l3_slow__usbss,
 	&dm814x_alwon_l3_med__mmc3,
-- 
2.25.1
