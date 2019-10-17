Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACC89DB7D4
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 21:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436788AbfJQTo1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 15:44:27 -0400
Received: from muru.com ([72.249.23.125]:37898 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394675AbfJQTo0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 17 Oct 2019 15:44:26 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E45D3816A;
        Thu, 17 Oct 2019 19:44:59 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>,
        Suman Anna <s-anna@ti.com>,
        Ankur Tyagi <ankur.tyagi@gallagher.com>
Subject: [PATCH 05/21] ARM: OMAP2+: Drop legacy platform data for am3 and am4 mailbox
Date:   Thu, 17 Oct 2019 12:43:55 -0700
Message-Id: <20191017194411.18258-6-tony@atomide.com>
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

Cc: Keerthy <j-keerthy@ti.com>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi              |  1 -
 arch/arm/boot/dts/am437x-l4.dtsi              |  1 -
 .../omap_hwmod_33xx_43xx_common_data.h        |  2 --
 .../omap_hwmod_33xx_43xx_interconnect_data.c  |  8 -----
 .../omap_hwmod_33xx_43xx_ipblock_data.c       | 33 -------------------
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c    |  1 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c    |  1 -
 7 files changed, 47 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1383,7 +1383,6 @@
 
 		target-module@c8000 {			/* 0x480c8000, ap 87 06.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mailbox";
 			reg = <0xc8000 0x4>,
 			      <0xc8010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -1147,7 +1147,6 @@
 
 		target-module@c8000 {			/* 0x480c8000, ap 73 06.0 */
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "mailbox";
 			reg = <0xc8000 0x4>,
 			      <0xc8010 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_common_data.h
@@ -35,7 +35,6 @@ extern struct omap_hwmod_ocp_if am33xx_l4_ls__epwmss0;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__epwmss1;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__epwmss2;
 extern struct omap_hwmod_ocp_if am33xx_l3_s__gpmc;
-extern struct omap_hwmod_ocp_if am33xx_l4_per__mailbox;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__spinlock;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__mcasp0;
 extern struct omap_hwmod_ocp_if am33xx_l4_ls__mcasp1;
@@ -78,7 +77,6 @@ extern struct omap_hwmod am33xx_epwmss0_hwmod;
 extern struct omap_hwmod am33xx_epwmss1_hwmod;
 extern struct omap_hwmod am33xx_epwmss2_hwmod;
 extern struct omap_hwmod am33xx_gpmc_hwmod;
-extern struct omap_hwmod am33xx_mailbox_hwmod;
 extern struct omap_hwmod am33xx_mcasp0_hwmod;
 extern struct omap_hwmod am33xx_mcasp1_hwmod;
 extern struct omap_hwmod am33xx_rtc_hwmod;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_interconnect_data.c
@@ -158,14 +158,6 @@ struct omap_hwmod_ocp_if am33xx_l3_s__gpmc = {
 	.user		= OCP_USER_MPU,
 };
 
-/* l4 ls -> mailbox */
-struct omap_hwmod_ocp_if am33xx_l4_per__mailbox = {
-	.master		= &am33xx_l4_ls_hwmod,
-	.slave		= &am33xx_mailbox_hwmod,
-	.clk		= "l4ls_gclk",
-	.user		= OCP_USER_MPU,
-};
-
 /* l4 ls -> spinlock */
 struct omap_hwmod_ocp_if am33xx_l4_ls__spinlock = {
 	.master		= &am33xx_l4_ls_hwmod,
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_43xx_ipblock_data.c
@@ -496,37 +496,6 @@ struct omap_hwmod am33xx_gpmc_hwmod = {
 	},
 };
 
-/*
- * 'mailbox' class
- * mailbox module allowing communication between the on-chip processors using a
- * queued mailbox-interrupt mechanism.
- */
-static struct omap_hwmod_class_sysconfig am33xx_mailbox_sysc = {
-	.rev_offs	= 0x0000,
-	.sysc_offs	= 0x0010,
-	.sysc_flags	= (SYSC_HAS_RESET_STATUS | SYSC_HAS_SIDLEMODE |
-			  SYSC_HAS_SOFTRESET),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class am33xx_mailbox_hwmod_class = {
-	.name	= "mailbox",
-	.sysc	= &am33xx_mailbox_sysc,
-};
-
-struct omap_hwmod am33xx_mailbox_hwmod = {
-	.name		= "mailbox",
-	.class		= &am33xx_mailbox_hwmod_class,
-	.clkdm_name	= "l4ls_clkdm",
-	.main_clk	= "l4ls_gclk",
-	.prcm = {
-		.omap4 = {
-			.modulemode	= MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /*
  * 'mcasp' class
  */
@@ -912,7 +881,6 @@ static void omap_hwmod_am33xx_clkctrl(void)
 	CLKCTRL(am33xx_epwmss0_hwmod, AM33XX_CM_PER_EPWMSS0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_epwmss1_hwmod, AM33XX_CM_PER_EPWMSS1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_epwmss2_hwmod, AM33XX_CM_PER_EPWMSS2_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_mailbox_hwmod, AM33XX_CM_PER_MAILBOX0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mcasp0_hwmod, AM33XX_CM_PER_MCASP0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mcasp1_hwmod, AM33XX_CM_PER_MCASP1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spi0_hwmod, AM33XX_CM_PER_SPI0_CLKCTRL_OFFSET);
@@ -971,7 +939,6 @@ static void omap_hwmod_am43xx_clkctrl(void)
 	CLKCTRL(am33xx_epwmss0_hwmod, AM43XX_CM_PER_EPWMSS0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_epwmss1_hwmod, AM43XX_CM_PER_EPWMSS1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_epwmss2_hwmod, AM43XX_CM_PER_EPWMSS2_CLKCTRL_OFFSET);
-	CLKCTRL(am33xx_mailbox_hwmod, AM43XX_CM_PER_MAILBOX0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mcasp0_hwmod, AM43XX_CM_PER_MCASP0_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_mcasp1_hwmod, AM43XX_CM_PER_MCASP1_CLKCTRL_OFFSET);
 	CLKCTRL(am33xx_spi0_hwmod, AM43XX_CM_PER_SPI0_CLKCTRL_OFFSET);
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -431,7 +431,6 @@ static struct omap_hwmod_ocp_if *am33xx_hwmod_ocp_ifs[] __initdata = {
 	&am33xx_l4_hs__pruss,
 	&am33xx_l4_per__dcan0,
 	&am33xx_l4_per__dcan1,
-	&am33xx_l4_per__mailbox,
 	&am33xx_l4_ls__mcasp0,
 	&am33xx_l4_ls__mcasp1,
 	&am33xx_l4_ls__timer2,
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -829,7 +829,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am43xx_l3_s__qspi,
 	&am33xx_l4_per__dcan0,
 	&am33xx_l4_per__dcan1,
-	&am33xx_l4_per__mailbox,
 	&am33xx_l4_per__rng,
 	&am33xx_l4_ls__mcasp0,
 	&am33xx_l4_ls__mcasp1,
-- 
2.23.0
