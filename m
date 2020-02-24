Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCE3916B53B
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728572AbgBXXWG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:22:06 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:53440 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728423AbgBXXWF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:22:05 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01ONLxv8102922;
        Mon, 24 Feb 2020 17:21:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582586519;
        bh=vay2LoEaC3QocU8ZaOGWOzTWKhalWfYPbKQHNAgB/Ng=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=qG1/srkwsrG6iml94j23LvjlTX1IBu2wBbcWS8N+DAPN+gqrQiiBvWx/33YYQnUWU
         F1Oupz+9/yR54f0tHY99960nlcJBb6ljBwHmhMxxeTMWVDJ8ozXHqbeE7pi6d/QK4z
         wLQBwcYNeJaD0Xt/LUBSufzAoyTIY5feGkoQitW8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01ONLx8u109527
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 Feb 2020 17:21:59 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 24
 Feb 2020 17:21:59 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 24 Feb 2020 17:21:59 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01ONLxcu060845;
        Mon, 24 Feb 2020 17:21:59 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 01ONLx2W021241;
        Mon, 24 Feb 2020 17:21:59 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 2/3] ARM: OMAP2+: Drop legacy platform data for OMAP4 DSP
Date:   Mon, 24 Feb 2020 17:21:51 -0600
Message-ID: <20200224232152.25562-3-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200224232152.25562-1-s-anna@ti.com>
References: <20200224232152.25562-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The OMAP4 DSP hwmod is used in DT, but the DT node is not
probing any real driver. The DSP device-tree node shall be
updated as per the new OMAP remoteproc bindings with the
underneath MMU device relying on the ti-sysc infrastructure.

Drop the legacy hwmod data for the DSP device along with the
custom ti,hwmods property. They have to be dropped together
since the early platform data init code is based on the custom
ti,hwmods property.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/omap4.dtsi               |  1 -
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 76 ----------------------
 2 files changed, 77 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index 9a87440d0b9d..48b97f818a68 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -108,7 +108,6 @@
 
 		dsp {
 			compatible = "ti,omap3-c64";
-			ti,hwmods = "dsp";
 		};
 
 		iva {
diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
index b7c51ea8c9a6..1d4359a43cab 100644
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -355,37 +355,6 @@ static struct omap_hwmod omap44xx_debugss_hwmod = {
 	},
 };
 
-/*
- * 'dsp' class
- * dsp sub-system
- */
-
-static struct omap_hwmod_class omap44xx_dsp_hwmod_class = {
-	.name	= "dsp",
-};
-
-/* dsp */
-static struct omap_hwmod_rst_info omap44xx_dsp_resets[] = {
-	{ .name = "dsp", .rst_shift = 0 },
-};
-
-static struct omap_hwmod omap44xx_dsp_hwmod = {
-	.name		= "dsp",
-	.class		= &omap44xx_dsp_hwmod_class,
-	.clkdm_name	= "tesla_clkdm",
-	.rst_lines	= omap44xx_dsp_resets,
-	.rst_lines_cnt	= ARRAY_SIZE(omap44xx_dsp_resets),
-	.main_clk	= "dpll_iva_m4x2_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_TESLA_TESLA_CLKCTRL_OFFSET,
-			.rstctrl_offs = OMAP4_RM_TESLA_RSTCTRL_OFFSET,
-			.context_offs = OMAP4_RM_TESLA_TESLA_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * 'dss' class
  * display sub-system
@@ -1236,14 +1205,6 @@ static struct omap_hwmod_ocp_if omap44xx_ocp_wp_noc__l3_instr = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* dsp -> l3_main_1 */
-static struct omap_hwmod_ocp_if omap44xx_dsp__l3_main_1 = {
-	.master		= &omap44xx_dsp_hwmod,
-	.slave		= &omap44xx_l3_main_1_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* dss -> l3_main_1 */
 static struct omap_hwmod_ocp_if omap44xx_dss__l3_main_1 = {
 	.master		= &omap44xx_dss_hwmod,
@@ -1364,14 +1325,6 @@ static struct omap_hwmod_ocp_if omap44xx_l4_cfg__l3_main_3 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* dsp -> l4_abe */
-static struct omap_hwmod_ocp_if omap44xx_dsp__l4_abe = {
-	.master		= &omap44xx_dsp_hwmod,
-	.slave		= &omap44xx_l4_abe_hwmod,
-	.clk		= "ocp_abe_iclk",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_1 -> l4_abe */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_1__l4_abe = {
 	.master		= &omap44xx_l3_main_1_hwmod,
@@ -1476,30 +1429,6 @@ static struct omap_hwmod_ocp_if omap44xx_l3_instr__debugss = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* dsp -> iva */
-static struct omap_hwmod_ocp_if omap44xx_dsp__iva = {
-	.master		= &omap44xx_dsp_hwmod,
-	.slave		= &omap44xx_iva_hwmod,
-	.clk		= "dpll_iva_m5x2_ck",
-	.user		= OCP_USER_DSP,
-};
-
-/* dsp -> sl2if */
-static struct omap_hwmod_ocp_if __maybe_unused omap44xx_dsp__sl2if = {
-	.master		= &omap44xx_dsp_hwmod,
-	.slave		= &omap44xx_sl2if_hwmod,
-	.clk		= "dpll_iva_m5x2_ck",
-	.user		= OCP_USER_DSP,
-};
-
-/* l4_cfg -> dsp */
-static struct omap_hwmod_ocp_if omap44xx_l4_cfg__dsp = {
-	.master		= &omap44xx_l4_cfg_hwmod,
-	.slave		= &omap44xx_dsp_hwmod,
-	.clk		= "l4_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_2 -> dss */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_2__dss = {
 	.master		= &omap44xx_l3_main_2_hwmod,
@@ -1762,7 +1691,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_iva__l3_instr,
 	&omap44xx_l3_main_3__l3_instr,
 	&omap44xx_ocp_wp_noc__l3_instr,
-	&omap44xx_dsp__l3_main_1,
 	&omap44xx_dss__l3_main_1,
 	&omap44xx_l3_main_2__l3_main_1,
 	&omap44xx_l4_cfg__l3_main_1,
@@ -1778,7 +1706,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l3_main_1__l3_main_3,
 	&omap44xx_l3_main_2__l3_main_3,
 	&omap44xx_l4_cfg__l3_main_3,
-	&omap44xx_dsp__l4_abe,
 	&omap44xx_l3_main_1__l4_abe,
 	&omap44xx_mpu__l4_abe,
 	&omap44xx_l3_main_1__l4_cfg,
@@ -1792,9 +1719,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_wkup__ctrl_module_wkup,
 	&omap44xx_l4_wkup__ctrl_module_pad_wkup,
 	&omap44xx_l3_instr__debugss,
-	&omap44xx_dsp__iva,
-	/* &omap44xx_dsp__sl2if, */
-	&omap44xx_l4_cfg__dsp,
 	&omap44xx_l3_main_2__dss,
 	&omap44xx_l4_per__dss,
 	&omap44xx_l3_main_2__dss_dispc,
-- 
2.23.0

