Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F24BDCB5F
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 18:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409056AbfJRQcf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 12:32:35 -0400
Received: from muru.com ([72.249.23.125]:38122 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409049AbfJRQcf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Oct 2019 12:32:35 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A7AD6809F;
        Fri, 18 Oct 2019 16:33:08 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 03/10] ARM: OMAP2+: Drop legacy platform data for am4 hdq1w
Date:   Fri, 18 Oct 2019 09:32:13 -0700
Message-Id: <20191018163220.3504-4-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191018163220.3504-1-tony@atomide.com>
References: <20191018163220.3504-1-tony@atomide.com>
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

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am437x-l4.dtsi           |  1 -
 arch/arm/mach-omap2/omap_hwmod_43xx_data.c | 36 ----------------------
 2 files changed, 37 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -2277,7 +2277,6 @@
 
 		target-module@47000 {			/* 0x48347000, ap 110 70.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "hdq1w";
 			reg = <0x47000 0x4>,
 			      <0x47014 0x4>,
 			      <0x47018 0x4>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_43xx_data.c
@@ -18,8 +18,6 @@
 #include "omap_hwmod_33xx_43xx_common_data.h"
 #include "prcm43xx.h"
 #include "omap_hwmod_common_data.h"
-#include "hdq1w.h"
-
 
 /* IP blocks */
 static struct omap_hwmod am43xx_emif_hwmod = {
@@ -468,32 +466,6 @@ static struct omap_hwmod am43xx_dss_rfbi_hwmod = {
 	.parent_hwmod	= &am43xx_dss_core_hwmod,
 };
 
-/* HDQ1W */
-static struct omap_hwmod_class_sysconfig am43xx_hdq1w_sysc = {
-	.rev_offs       = 0x0000,
-	.sysc_offs      = 0x0014,
-	.syss_offs      = 0x0018,
-	.sysc_flags     = (SYSC_HAS_SOFTRESET | SYSC_HAS_AUTOIDLE),
-	.sysc_fields    = &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class am43xx_hdq1w_hwmod_class = {
-	.name   = "hdq1w",
-	.sysc   = &am43xx_hdq1w_sysc,
-	.reset	= &omap_hdq1w_reset,
-};
-
-static struct omap_hwmod am43xx_hdq1w_hwmod = {
-	.name           = "hdq1w",
-	.class          = &am43xx_hdq1w_hwmod_class,
-	.clkdm_name     = "l4ls_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = AM43XX_CM_PER_HDQ1W_CLKCTRL_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
 
 static struct omap_hwmod_class_sysconfig am43xx_vpfe_sysc = {
 	.rev_offs       = 0x0,
@@ -744,13 +716,6 @@ static struct omap_hwmod_ocp_if am43xx_l4_ls__dss_rfbi = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-static struct omap_hwmod_ocp_if am43xx_l4_ls__hdq1w = {
-	.master         = &am33xx_l4_ls_hwmod,
-	.slave          = &am43xx_hdq1w_hwmod,
-	.clk            = "l4ls_gclk",
-	.user           = OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 static struct omap_hwmod_ocp_if am43xx_l3__vpfe0 = {
 	.master         = &am43xx_vpfe0_hwmod,
 	.slave          = &am33xx_l3_main_hwmod,
@@ -854,7 +819,6 @@ static struct omap_hwmod_ocp_if *am43xx_hwmod_ocp_ifs[] __initdata = {
 	&am43xx_l4_ls__dss,
 	&am43xx_l4_ls__dss_dispc,
 	&am43xx_l4_ls__dss_rfbi,
-	&am43xx_l4_ls__hdq1w,
 	&am43xx_l3__vpfe0,
 	&am43xx_l3__vpfe1,
 	&am43xx_l4_ls__vpfe0,
-- 
2.23.0
