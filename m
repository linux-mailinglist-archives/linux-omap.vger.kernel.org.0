Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA9311B9FC
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 18:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731050AbfLKRUc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 12:20:32 -0500
Received: from muru.com ([72.249.23.125]:45662 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730865AbfLKRUb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 12:20:31 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8386781A8;
        Wed, 11 Dec 2019 17:21:09 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, Suman Anna <s-anna@ti.com>,
        Keerthy <j-keerthy@ti.com>, "Andrew F. Davis" <afd@ti.com>,
        Franklin S Cooper Jr <fcooper@ti.com>,
        Jyri Sarha <jsarha@ti.com>, Roger Quadros <rogerq@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Vignesh R <vigneshr@ti.com>
Subject: [PATCH 06/16] ARM: OMAP2+: Drop legacy platform data for dra7 spinlock
Date:   Wed, 11 Dec 2019 09:20:04 -0800
Message-Id: <20191211172014.35201-7-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191211172014.35201-1-tony@atomide.com>
References: <20191211172014.35201-1-tony@atomide.com>
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
Cc: Keerthy <j-keerthy@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 43 -----------------------
 2 files changed, 44 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -471,7 +471,6 @@ mailbox1: mailbox@0 {
 
 		target-module@f6000 {			/* 0x4a0f6000, ap 25 78.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "spinlock";
 			reg = <0xf6000 0x4>,
 			      <0xf6010 0x4>,
 			      <0xf6014 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -962,40 +962,6 @@ static struct omap_hwmod dra7xx_smartreflex_mpu_hwmod = {
 	.dev_attr	= &smartreflex_mpu_dev_attr,
 };
 
-/*
- * 'spinlock' class
- *
- */
-
-static struct omap_hwmod_class_sysconfig dra7xx_spinlock_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.syss_offs	= 0x0014,
-	.sysc_flags	= (SYSC_HAS_AUTOIDLE | SYSC_HAS_ENAWAKEUP |
-			   SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET |
-			   SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class dra7xx_spinlock_hwmod_class = {
-	.name	= "spinlock",
-	.sysc	= &dra7xx_spinlock_sysc,
-};
-
-/* spinlock */
-static struct omap_hwmod dra7xx_spinlock_hwmod = {
-	.name		= "spinlock",
-	.class		= &dra7xx_spinlock_hwmod_class,
-	.clkdm_name	= "l4cfg_clkdm",
-	.main_clk	= "l3_iclk_div",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4CFG_SPINLOCK_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4CFG_SPINLOCK_CONTEXT_OFFSET,
-		},
-	},
-};
 
 /*
  * 'timer' class
@@ -1536,14 +1502,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_cfg__smartreflex_mpu = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_cfg -> spinlock */
-static struct omap_hwmod_ocp_if dra7xx_l4_cfg__spinlock = {
-	.master		= &dra7xx_l4_cfg_hwmod,
-	.slave		= &dra7xx_spinlock_hwmod,
-	.clk		= "l3_iclk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_wkup -> timer1 */
 static struct omap_hwmod_ocp_if dra7xx_l4_wkup__timer1 = {
 	.master		= &dra7xx_l4_wkup_hwmod,
@@ -1678,7 +1636,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l4_cfg__sata,
 	&dra7xx_l4_cfg__smartreflex_core,
 	&dra7xx_l4_cfg__smartreflex_mpu,
-	&dra7xx_l4_cfg__spinlock,
 	&dra7xx_l4_wkup__timer1,
 	&dra7xx_l4_per1__timer2,
 	&dra7xx_l4_per1__timer3,
-- 
2.24.1
