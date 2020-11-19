Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057022B9371
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 14:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727764AbgKSNNT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 08:13:19 -0500
Received: from muru.com ([72.249.23.125]:48904 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726853AbgKSNNT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Nov 2020 08:13:19 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E0CEE80C1;
        Thu, 19 Nov 2020 13:13:23 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Roger Quadros <rogerq@ti.com>, Stephen Boyd <sboyd@kernel.org>,
        Suman Anna <s-anna@ti.com>, linux-clk@vger.kernel.org
Subject: [PATCH 6/8] soc: ti: omap-prm: omap5: add genpd support for remaining PRM instances
Date:   Thu, 19 Nov 2020 15:12:57 +0200
Message-Id: <20201119131259.63829-7-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119131259.63829-1-tony@atomide.com>
References: <20201119131259.63829-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

Add genpd support for mpu, dsp, coreaon, core, iva, cam, dss, gpu,
l3init, custefuse, wkupaon and emu instances.

Cc: Santosh Shilimkar <ssantosh@kernel.org>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/soc/ti/omap_prm.c | 61 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -222,14 +222,67 @@ static const struct omap_prm_data omap4_prm_data[] = {
 };
 
 static const struct omap_prm_data omap5_prm_data[] = {
-	{ .name = "dsp", .base = 0x4ae06400, .rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_01 },
+	{
+		.name = "mpu", .base = 0x4ae06300,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_reton,
+	},
+	{
+		.name = "dsp", .base = 0x4ae06400,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_noinact,
+		.rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_01
+	},
 	{
 		.name = "abe", .base = 0x4ae06500,
 		.pwrstctrl = 0, .pwrstst = 0x4, .dmap = &omap_prm_nooff,
 	},
-	{ .name = "core", .base = 0x4ae06700, .rstctrl = 0x210, .rstst = 0x214, .clkdm_name = "ipu", .rstmap = rst_map_012 },
-	{ .name = "iva", .base = 0x4ae07200, .rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_012 },
-	{ .name = "device", .base = 0x4ae07c00, .rstctrl = 0x0, .rstst = 0x4, .rstmap = rst_map_01, .flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM },
+	{
+		.name = "coreaon", .base = 0x4ae06600,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_alwon
+	},
+	{
+		.name = "core", .base = 0x4ae06700,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_reton,
+		.rstctrl = 0x210, .rstst = 0x214, .clkdm_name = "ipu",
+		.rstmap = rst_map_012
+	},
+	{
+		.name = "iva", .base = 0x4ae07200,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_noinact,
+		.rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_012
+	},
+	{
+		.name = "cam", .base = 0x4ae07300,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_onoff_noauto
+	},
+	{
+		.name = "dss", .base = 0x4ae07400,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_noinact
+	},
+	{
+		.name = "gpu", .base = 0x4ae07500,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_onoff_noauto
+	},
+	{
+		.name = "l3init", .base = 0x4ae07600,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_reton
+	},
+	{
+		.name = "custefuse", .base = 0x4ae07700,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_onoff_noauto
+	},
+	{
+		.name = "wkupaon", .base = 0x4ae07800,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_alwon
+	},
+	{
+		.name = "emu", .base = 0x4ae07a00,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_onoff_noauto
+	},
+	{
+		.name = "device", .base = 0x4ae07c00,
+		.rstctrl = 0x0, .rstst = 0x4, .rstmap = rst_map_01,
+		.flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM
+	},
 	{ },
 };
 
-- 
2.29.2
