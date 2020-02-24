Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1469316B1C9
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgBXVKu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:10:50 -0500
Received: from muru.com ([72.249.23.125]:57336 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727459AbgBXVKu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:10:50 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id F3E3B8030;
        Mon, 24 Feb 2020 21:11:33 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 23/23] ARM: OMAP2+: Drop legacy platform data for am437x DSS
Date:   Mon, 24 Feb 2020 13:09:59 -0800
Message-Id: <20200224210959.56146-24-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200224210959.56146-1-tony@atomide.com>
References: <20200224210959.56146-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can now probe devices with ti-sysc interconnect driver and dts
data. Let's drop the related platform data and custom ti,hwmods
dts property.

As we're just dropping data, and the early platform data init
is based on the custom ti,hwmods property, we want to drop both
the platform data and ti,hwmods property in a single patch.

Cc: Jyri Sarha <jsarha@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am437x-l4.dtsi           |   2 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c | 101 ---------------------
 2 files changed, 103 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -2117,7 +2117,6 @@ vpfe1: vpfe@0 {
 
 		target-module@2a000 {			/* 0x4832a000, ap 88 3c.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "dss_core";
 			reg = <0x2a000 0x4>,
 			      <0x2a010 0x4>,
 			      <0x2a014 0x4>;
@@ -2152,7 +2151,6 @@ dss: dss@0 {
 
 				target-module@400 {
 					compatible = "ti,sysc-omap2", "ti,sysc";
-					ti,hwmods = "dss_dispc";
 					reg = <0x400 0x4>,
 					      <0x410 0x4>,
 					      <0x414 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -156,75 +156,6 @@ static struct omap_hwmod am43xx_usb_otg_ss1_hwmod = {
 	},
 };
 
-/* dss */
-
-static struct omap_hwmod am43xx_dss_core_hwmod = {
-	.name		= "dss_core",
-	.class		= &omap2_dss_hwmod_class,
-	.clkdm_name	= "dss_clkdm",
-	.main_clk	= "disp_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = AM43XX_CM_PER_DSS_CLKCTRL_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
-/* dispc */
-
-static struct omap_dss_dispc_dev_attr am43xx_dss_dispc_dev_attr = {
-	.manager_count		= 1,
-	.has_framedonetv_irq	= 0
-};
-
-static struct omap_hwmod_class_sysconfig am43xx_dispc_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_SOFTRESET |
-			   SYSC_HAS_ENAWAKEUP | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_CLOCKACTIVITY | SYSC_HAS_MIDLEMODE),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   MSTANDBY_FORCE | MSTANDBY_NO | MSTANDBY_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class am43xx_dispc_hwmod_class = {
-	.name	= "dispc",
-	.sysc	= &am43xx_dispc_sysc,
-};
-
-static struct omap_hwmod am43xx_dss_dispc_hwmod = {
-	.name		= "dss_dispc",
-	.class		= &am43xx_dispc_hwmod_class,
-	.clkdm_name	= "dss_clkdm",
-	.main_clk	= "disp_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = AM43XX_CM_PER_DSS_CLKCTRL_OFFSET,
-		},
-	},
-	.dev_attr	= &am43xx_dss_dispc_dev_attr,
-	.parent_hwmod	= &am43xx_dss_core_hwmod,
-};
-
-/* rfbi */
-
-static struct omap_hwmod am43xx_dss_rfbi_hwmod = {
-	.name		= "dss_rfbi",
-	.class		= &omap2_rfbi_hwmod_class,
-	.clkdm_name	= "dss_clkdm",
-	.main_clk	= "disp_clk",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = AM43XX_CM_PER_DSS_CLKCTRL_OFFSET,
-		},
-	},
-	.parent_hwmod	= &am43xx_dss_core_hwmod,
-};
-
-
 /* Interfaces */
 static struct omap_hwmod_ocp_if am43xx_l3_main__emif = {
 	.master		= &am33xx_l3_main_hwmod,
@@ -310,34 +241,6 @@ static struct omap_hwmod_ocp_if am43xx_l3_s__usbotgss1 = {
 	.user           = OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-static struct omap_hwmod_ocp_if am43xx_dss__l3_main = {
-	.master		= &am43xx_dss_core_hwmod,
-	.slave		= &am33xx_l3_main_hwmod,
-	.clk		= "l3_gclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-static struct omap_hwmod_ocp_if am43xx_l4_ls__dss = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am43xx_dss_core_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-static struct omap_hwmod_ocp_if am43xx_l4_ls__dss_dispc = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am43xx_dss_dispc_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
-static struct omap_hwmod_ocp_if am43xx_l4_ls__dss_rfbi = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am43xx_dss_rfbi_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_wkup__synctimer,
 	&am43xx_l3_main__pruss,
@@ -368,10 +271,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l3_main__ocmc,
 	&am43xx_l3_s__usbotgss0,
 	&am43xx_l3_s__usbotgss1,
-	&am43xx_dss__l3_main,
-	&am43xx_l4_ls__dss,
-	&am43xx_l4_ls__dss_dispc,
-	&am43xx_l4_ls__dss_rfbi,
 	NULL,
 };
 
-- 
2.25.1
