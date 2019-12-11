Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3692511BC9C
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 20:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbfLKTM2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 14:12:28 -0500
Received: from muru.com ([72.249.23.125]:45874 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbfLKTM2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 14:12:28 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 18C038185;
        Wed, 11 Dec 2019 19:13:07 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Benoit Parrot <bparrot@ti.com>, Bin Liu <b-liu@ti.com>,
        Roger Quadros <rogerq@ti.com>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 12/13] ARM: OMAP2+: Drop legacy platform data for dra7 rtcss
Date:   Wed, 11 Dec 2019 11:12:05 -0800
Message-Id: <20191211191206.12190-13-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191211191206.12190-1-tony@atomide.com>
References: <20191211191206.12190-1-tony@atomide.com>
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
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 44 -----------------------
 2 files changed, 45 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -3561,7 +3561,6 @@ timer16: timer@0 {
 
 		rtctarget: target-module@38000 {			/* 0x48838000, ap 29 12.0 */
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
-			ti,hwmods = "rtcss";
 			reg = <0x38074 0x4>,
 			      <0x38078 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -700,41 +700,6 @@ static struct omap_hwmod dra7xx_qspi_hwmod = {
 	},
 };
 
-/*
- * 'rtcss' class
- *
- */
-static struct omap_hwmod_class_sysconfig dra7xx_rtcss_sysc = {
-	.rev_offs	= 0x0074,
-	.sysc_offs	= 0x0078,
-	.sysc_flags	= SYSC_HAS_SIDLEMODE,
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type3,
-};
-
-static struct omap_hwmod_class dra7xx_rtcss_hwmod_class = {
-	.name	= "rtcss",
-	.sysc	= &dra7xx_rtcss_sysc,
-	.unlock	= &omap_hwmod_rtc_unlock,
-	.lock	= &omap_hwmod_rtc_lock,
-};
-
-/* rtcss */
-static struct omap_hwmod dra7xx_rtcss_hwmod = {
-	.name		= "rtcss",
-	.class		= &dra7xx_rtcss_hwmod_class,
-	.clkdm_name	= "rtc_clkdm",
-	.main_clk	= "sys_32k_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_RTC_RTCSS_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_RTC_RTCSS_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /*
  * 'sata' class
  *
@@ -1240,14 +1205,6 @@ static struct omap_hwmod_ocp_if dra7xx_l3_main_1__qspi = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_per3 -> rtcss */
-static struct omap_hwmod_ocp_if dra7xx_l4_per3__rtcss = {
-	.master		= &dra7xx_l4_per3_hwmod,
-	.slave		= &dra7xx_rtcss_hwmod,
-	.clk		= "l4_root_clk_div",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_cfg -> sata */
 static struct omap_hwmod_ocp_if dra7xx_l4_cfg__sata = {
 	.master		= &dra7xx_l4_cfg_hwmod,
@@ -1417,7 +1374,6 @@ static struct omap_hwmod_ocp_if *dra72x_hwmod_ocp_ifs[] __initdata = {
 };
 
 static struct omap_hwmod_ocp_if *rtc_hwmod_ocp_ifs[] __initdata = {
-	&dra7xx_l4_per3__rtcss,
 	NULL,
 };
 
-- 
2.24.1
