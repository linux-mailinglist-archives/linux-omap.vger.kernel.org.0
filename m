Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62321DCB68
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 18:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409125AbfJRQcl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 12:32:41 -0400
Received: from muru.com ([72.249.23.125]:38138 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392259AbfJRQck (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Oct 2019 12:32:40 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D6209809F;
        Fri, 18 Oct 2019 16:33:14 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 07/10] ARM: OMAP2+: Drop legacy platform data for dra7 rng
Date:   Fri, 18 Oct 2019 09:32:17 -0700
Message-Id: <20191018163220.3504-8-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191018163220.3504-1-tony@atomide.com>
References: <20191018163220.3504-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

---
 arch/arm/boot/dts/dra7-l4.dtsi            |  1 -
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c | 36 -----------------------
 2 files changed, 37 deletions(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -1898,7 +1898,6 @@
 
 		target-module@90000 {			/* 0x48090000, ap 55 12.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
-			ti,hwmods = "rng";
 			reg = <0x91fe0 0x4>,
 			      <0x91fe4 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_7xx_data.c
@@ -1432,34 +1432,6 @@ static struct omap_hwmod dra7xx_des_hwmod = {
 	},
 };
 
-/* rng */
-static struct omap_hwmod_class_sysconfig dra7xx_rng_sysc = {
-	.rev_offs       = 0x1fe0,
-	.sysc_offs      = 0x1fe4,
-	.sysc_flags     = SYSC_HAS_AUTOIDLE | SYSC_HAS_SIDLEMODE,
-	.idlemodes      = SIDLE_FORCE | SIDLE_NO,
-	.sysc_fields    = &omap_hwmod_sysc_type1,
-};
-
-static struct omap_hwmod_class dra7xx_rng_hwmod_class = {
-	.name           = "rng",
-	.sysc           = &dra7xx_rng_sysc,
-};
-
-static struct omap_hwmod dra7xx_rng_hwmod = {
-	.name           = "rng",
-	.class          = &dra7xx_rng_hwmod_class,
-	.flags		= HWMOD_SWSUP_SIDLE,
-	.clkdm_name     = "l4sec_clkdm",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = DRA7XX_CM_L4SEC_RNG_CLKCTRL_OFFSET,
-			.context_offs = DRA7XX_RM_L4SEC_RNG_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * 'usb_otg_ss' class
  *
@@ -2070,13 +2042,6 @@ static struct omap_hwmod_ocp_if dra7xx_l4_per1__des = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_per1 -> rng */
-static struct omap_hwmod_ocp_if dra7xx_l4_per1__rng = {
-	.master         = &dra7xx_l4_per1_hwmod,
-	.slave          = &dra7xx_rng_hwmod,
-	.user           = OCP_USER_MPU,
-};
-
 /* l4_per3 -> usb_otg_ss1 */
 static struct omap_hwmod_ocp_if dra7xx_l4_per3__usb_otg_ss1 = {
 	.master		= &dra7xx_l4_per3_hwmod,
@@ -2239,7 +2204,6 @@ static struct omap_hwmod_ocp_if *dra7xx_hwmod_ocp_ifs[] __initdata = {
 /* GP-only hwmod links */
 static struct omap_hwmod_ocp_if *dra7xx_gp_hwmod_ocp_ifs[] __initdata = {
 	&dra7xx_l4_wkup__timer12,
-	&dra7xx_l4_per1__rng,
 	NULL,
 };
 
-- 
2.23.0
