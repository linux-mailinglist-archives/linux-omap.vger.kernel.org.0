Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69CBEDB7D8
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436941AbfJQToa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:30 -0400
Received: from muru.com ([72.249.23.125]:37910 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394675AbfJQToa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:30 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 445FE81AC;
        Thu, 17 Oct 2019 19:45:03 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Suman Anna <s-anna@ti.com>,
        Ankur Tyagi <ankur.tyagi@gallagher.com>,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 07/21] ARM: OMAP2+: Drop legacy platform data for omap5 mailbox
Date:   Thu, 17 Oct 2019 12:43:57 -0700
Message-Id: <20191017194411.18258-8-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017194411.18258-1-tony@atomide.com>
References: <20191017194411.18258-1-tony@atomide.com>
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

Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap5-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_54xx_data.c | 41 ----------------------
 2 files changed, 42 deletions(-)

diff --git a/arch/arm/boot/dts/omap5-l4.dtsi b/arch/arm/boot/dts/omap5-l4.dtsi
--- a/arch/arm/boot/dts/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/omap5-l4.dtsi
@@ -593,7 +593,6 @@
 
 		target-module@74000 {			/* 0x4a0f4000, ap 25 04.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mailbox";
 			reg = <0x74000 0x4>,
 			      <0x74010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_54xx_data.c
@@ -628,38 +628,6 @@ static struct omap_hwmod omap54xx_kbd_hwmod = {
 	},
 };
 
-/*
- * 'mailbox' class
- * mailbox module allowing communication between the on-chip processors using a
- * queued mailbox-interrupt mechanism.
- */
-
-static struct omap_hwmod_class_sysconfig omap54xx_mailbox_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_RESET_STATUS | SYSC_HAS_SIDLEMODE |
-			   SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap54xx_mailbox_hwmod_class = {
-	.name	= "mailbox",
-	.sysc	= &omap54xx_mailbox_sysc,
-};
-
-/* mailbox */
-static struct omap_hwmod omap54xx_mailbox_hwmod = {
-	.name		= "mailbox",
-	.class		= &omap54xx_mailbox_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP54XX_CM_L4CFG_MAILBOX_CLKCTRL_OFFSET,
-			.context_offs = OMAP54XX_RM_L4CFG_MAILBOX_CONTEXT_OFFSET,
-		},
-	},
-};
 
 /*
  * 'mcbsp' class
@@ -1747,14 +1715,6 @@ static struct omap_hwmod_ocp_if omap54xx_l4_wkup__kbd = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> mailbox */
-static struct omap_hwmod_ocp_if omap54xx_l4_cfg__mailbox = {
-	.master		= &omap54xx_l4_cfg_hwmod,
-	.slave		= &omap54xx_mailbox_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_abe -> mcbsp1 */
 static struct omap_hwmod_ocp_if omap54xx_l4_abe__mcbsp1 = {
 	.master		= &omap54xx_l4_abe_hwmod,
@@ -1994,7 +1954,6 @@ static struct omap_hwmod_ocp_if *omap54xx_hwmod_ocp_ifs[] __initdata = {
 	&omap54xx_mpu__emif2,
 	&omap54xx_l3_main_2__mmu_ipu,
 	&omap54xx_l4_wkup__kbd,
-	&omap54xx_l4_cfg__mailbox,
 	&omap54xx_l4_abe__mcbsp1,
 	&omap54xx_l4_abe__mcbsp2,
 	&omap54xx_l4_abe__mcbsp3,
-- 
2.23.0
