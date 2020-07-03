Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32EB4213D45
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jul 2020 18:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgGCQHq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Jul 2020 12:07:46 -0400
Received: from muru.com ([72.249.23.125]:60634 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbgGCQHq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 3 Jul 2020 12:07:46 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 62D318087;
        Fri,  3 Jul 2020 16:08:38 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Keerthy <j-keerthy@ti.com>
Subject: [PATCH 3/3] ARM: OMAP2+: Drop legacy platform data for dra7 rtcss
Date:   Fri,  3 Jul 2020 09:07:31 -0700
Message-Id: <20200703160731.53698-4-tony@atomide.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200703160731.53698-1-tony@atomide.com>
References: <20200703160731.53698-1-tony@atomide.com>
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
@@ -418,41 +418,6 @@ static struct omap_hwmod dra7xx_qspi_hwmod = {
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
@@ -797,14 +762,6 @@ static struct omap_hwmod_ocp_if dra7xx_l3_main_1__qspi = {
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
@@ -930,7 +887,6 @@ static struct omap_hwmod_ocp_if *dra72x_hwmod_ocp_ifs[] __initdata = {
 };
 
 static struct omap_hwmod_ocp_if *rtc_hwmod_ocp_ifs[] __initdata = {
-	&dra7xx_l4_per3__rtcss,
 	NULL,
 };
 
-- 
2.27.0
