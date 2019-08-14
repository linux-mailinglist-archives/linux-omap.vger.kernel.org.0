Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 550F38D454
	for <lists+linux-omap@lfdr.de>; Wed, 14 Aug 2019 15:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbfHNNOU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Aug 2019 09:14:20 -0400
Received: from muru.com ([72.249.23.125]:57620 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbfHNNOU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Aug 2019 09:14:20 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id CA6E18176;
        Wed, 14 Aug 2019 13:14:45 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Filip=20Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 1/6] ARM: OMAP2+: Drop legacy platform data for omap4 gpu
Date:   Wed, 14 Aug 2019 06:14:03 -0700
Message-Id: <20190814131408.57162-2-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814131408.57162-1-tony@atomide.com>
References: <20190814131408.57162-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I've tested that the interconnect target module enables and idles
just fine when probed with ti-sysc with PM runtime control via sys:

# echo on > $(find /sys -name control | grep \/5601)
# rwmem 0x56000024
0x56000024 = 0x00010200		# SGX540 CORE_REVISION
# echo auto > $(find /sys -name control | grep \/5601)
# rwmem 0x56000024
And when idled, it will produce "Bus error" as expected.

Cc: Adam Ford <aford173@gmail.com>
Cc: Filip Matijević <filip.matijevic.pz@gmail.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: moaz korena <moaz@korena.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: Philipp Rossak <embed3d@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi               |  1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 53 ----------------------
 2 files changed, 54 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -330,7 +330,6 @@
 
 		target-module@56000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			ti,hwmods = "gpu";
 			reg = <0x5601fc00 0x4>,
 			      <0x5601fc10 0x4>;
 			reg-names = "rev", "sysc";
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -1085,41 +1085,6 @@ static struct omap_hwmod omap44xx_gpmc_hwmod = {
 	},
 };
 
-/*
- * 'gpu' class
- * 2d/3d graphics accelerator
- */
-
-static struct omap_hwmod_class_sysconfig omap44xx_gpu_sysc = {
-	.rev_offs	= 0x1fc00,
-	.sysc_offs	= 0x1fc10,
-	.sysc_flags	= (SYSC_HAS_MIDLEMODE | SYSC_HAS_SIDLEMODE),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
-			   SIDLE_SMART_WKUP | MSTANDBY_FORCE | MSTANDBY_NO |
-			   MSTANDBY_SMART | MSTANDBY_SMART_WKUP),
-	.sysc_fields	= &omap_hwmod_sysc_type2,
-};
-
-static struct omap_hwmod_class omap44xx_gpu_hwmod_class = {
-	.name	= "gpu",
-	.sysc	= &omap44xx_gpu_sysc,
-};
-
-/* gpu */
-static struct omap_hwmod omap44xx_gpu_hwmod = {
-	.name		= "gpu",
-	.class		= &omap44xx_gpu_hwmod_class,
-	.clkdm_name	= "l3_gfx_clkdm",
-	.main_clk	= "sgx_clk_mux",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_GFX_GFX_CLKCTRL_OFFSET,
-			.context_offs = OMAP4_RM_GFX_GFX_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_SWCTRL,
-		},
-	},
-};
-
 /*
  * 'hdq1w' class
  * hdq / 1-wire serial interface controller
@@ -2596,14 +2561,6 @@ static struct omap_hwmod_ocp_if omap44xx_fdif__l3_main_2 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* gpu -> l3_main_2 */
-static struct omap_hwmod_ocp_if omap44xx_gpu__l3_main_2 = {
-	.master		= &omap44xx_gpu_hwmod,
-	.slave		= &omap44xx_l3_main_2_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* hsi -> l3_main_2 */
 static struct omap_hwmod_ocp_if omap44xx_hsi__l3_main_2 = {
 	.master		= &omap44xx_hsi_hwmod,
@@ -3028,14 +2985,6 @@ static struct omap_hwmod_ocp_if omap44xx_l3_main_2__gpmc = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_2 -> gpu */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__gpu = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_gpu_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l4_per -> hdq1w */
 static struct omap_hwmod_ocp_if omap44xx_l4_per__hdq1w = {
 	.master		= &omap44xx_l4_per_hwmod,
@@ -3450,7 +3399,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_debugss__l3_main_2,
 	&omap44xx_dma_system__l3_main_2,
 	&omap44xx_fdif__l3_main_2,
-	&omap44xx_gpu__l3_main_2,
 	&omap44xx_hsi__l3_main_2,
 	&omap44xx_ipu__l3_main_2,
 	&omap44xx_iss__l3_main_2,
@@ -3503,7 +3451,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_per__elm,
 	&omap44xx_l4_cfg__fdif,
 	&omap44xx_l3_main_2__gpmc,
-	&omap44xx_l3_main_2__gpu,
 	&omap44xx_l4_per__hdq1w,
 	&omap44xx_l4_cfg__hsi,
 	&omap44xx_l3_main_2__ipu,
-- 
2.21.0
