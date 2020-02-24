Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA4816B53C
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728423AbgBXXWG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:22:06 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41300 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728569AbgBXXWG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:22:06 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01ONM0NJ112718;
        Mon, 24 Feb 2020 17:22:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582586520;
        bh=ZVSUMQFxNeZRVQyvOiDtYbyJXJEga1SqaPqBVAWiyrA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ik6kW5Obui2h57ezbUa+FLLkzxlHJ1x/unPPEs2wTNyQBTw4Gi2dmSGJ+hUjkBUhU
         6CZ1VZsvgypbr+x+ZwvAjY8Gr9MaYAMR6ry9snMr/CpZ0r4dc4pVJ/3rq7yLsbaXOO
         USS1+7YMmdTjqQplw1SjqM+8H8GTW619CxZEDs7A=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01ONM0U9074852;
        Mon, 24 Feb 2020 17:22:00 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 24
 Feb 2020 17:22:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 24 Feb 2020 17:22:00 -0600
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01ONM05D060856;
        Mon, 24 Feb 2020 17:22:00 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 01ONM0CS021246;
        Mon, 24 Feb 2020 17:22:00 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, Roger Quadros <rogerq@ti.com>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 3/3] ARM: OMAP4: hwmod_data: Remove OMAP4 IPU hwmod data
Date:   Mon, 24 Feb 2020 17:21:52 -0600
Message-ID: <20200224232152.25562-4-s-anna@ti.com>
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

The OMAP4 IPU hwmod is currently not used in DT, and the new DTS
node shall be added as per the new OMAP remoteproc bindings with
the underneath MMU device relying on the ti-sysc infrastructure.
Drop the legacy hwmod data for OMAP4 IPU as this will not be used
going forward.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/mach-omap2/omap_hwmod_44xx_data.c | 51 ----------------------
 1 file changed, 51 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
index 1d4359a43cab..a616ddf8fb52 100644
--- a/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_44xx_data.c
@@ -706,39 +706,6 @@ static struct omap_hwmod omap44xx_gpmc_hwmod = {
 	},
 };
 
-
-/*
- * 'ipu' class
- * imaging processor unit
- */
-
-static struct omap_hwmod_class omap44xx_ipu_hwmod_class = {
-	.name	= "ipu",
-};
-
-/* ipu */
-static struct omap_hwmod_rst_info omap44xx_ipu_resets[] = {
-	{ .name = "cpu0", .rst_shift = 0 },
-	{ .name = "cpu1", .rst_shift = 1 },
-};
-
-static struct omap_hwmod omap44xx_ipu_hwmod = {
-	.name		= "ipu",
-	.class		= &omap44xx_ipu_hwmod_class,
-	.clkdm_name	= "ducati_clkdm",
-	.rst_lines	= omap44xx_ipu_resets,
-	.rst_lines_cnt	= ARRAY_SIZE(omap44xx_ipu_resets),
-	.main_clk	= "ducati_clk_mux_ck",
-	.prcm = {
-		.omap4 = {
-			.clkctrl_offs = OMAP4_CM_DUCATI_DUCATI_CLKCTRL_OFFSET,
-			.rstctrl_offs = OMAP4_RM_DUCATI_RSTCTRL_OFFSET,
-			.context_offs = OMAP4_RM_DUCATI_DUCATI_CONTEXT_OFFSET,
-			.modulemode   = MODULEMODE_HWCTRL,
-		},
-	},
-};
-
 /*
  * 'iss' class
  * external images sensor pixel data processor
@@ -1245,14 +1212,6 @@ static struct omap_hwmod_ocp_if omap44xx_debugss__l3_main_2 = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* ipu -> l3_main_2 */
-static struct omap_hwmod_ocp_if omap44xx_ipu__l3_main_2 = {
-	.master		= &omap44xx_ipu_hwmod,
-	.slave		= &omap44xx_l3_main_2_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* iss -> l3_main_2 */
 static struct omap_hwmod_ocp_if omap44xx_iss__l3_main_2 = {
 	.master		= &omap44xx_iss_hwmod,
@@ -1549,14 +1508,6 @@ static struct omap_hwmod_ocp_if omap44xx_l3_main_2__gpmc = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l3_main_2 -> ipu */
-static struct omap_hwmod_ocp_if omap44xx_l3_main_2__ipu = {
-	.master		= &omap44xx_l3_main_2_hwmod,
-	.slave		= &omap44xx_ipu_hwmod,
-	.clk		= "l3_div_ck",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /* l3_main_2 -> iss */
 static struct omap_hwmod_ocp_if omap44xx_l3_main_2__iss = {
 	.master		= &omap44xx_l3_main_2_hwmod,
@@ -1696,7 +1647,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l4_cfg__l3_main_1,
 	&omap44xx_mpu__l3_main_1,
 	&omap44xx_debugss__l3_main_2,
-	&omap44xx_ipu__l3_main_2,
 	&omap44xx_iss__l3_main_2,
 	&omap44xx_iva__l3_main_2,
 	&omap44xx_l3_main_1__l3_main_2,
@@ -1734,7 +1684,6 @@ static struct omap_hwmod_ocp_if *omap44xx_hwmod_ocp_ifs[] __initdata = {
 	&omap44xx_l3_main_2__dss_venc,
 	&omap44xx_l4_per__dss_venc,
 	&omap44xx_l3_main_2__gpmc,
-	&omap44xx_l3_main_2__ipu,
 	&omap44xx_l3_main_2__iss,
 	/* &omap44xx_iva__sl2if, */
 	&omap44xx_l3_main_2__iva,
-- 
2.23.0

