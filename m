Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75A0E2B427F
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729567AbgKPLUJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:20:09 -0500
Received: from muru.com ([72.249.23.125]:48420 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727228AbgKPLUI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:20:08 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9CD4B8192;
        Mon, 16 Nov 2020 11:20:13 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Dave Gerlach <d-gerlach@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH 02/17] soc: ti: omap-prm: am4: add genpd support for remaining PRM instances
Date:   Mon, 16 Nov 2020 13:19:24 +0200
Message-Id: <20201116111939.21405-3-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116111939.21405-1-tony@atomide.com>
References: <20201116111939.21405-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

Add genpd support for mpu, rtc, tamper, cefuse, per and wkup instances.

Cc: Santosh Shilimkar <ssantosh@kernel.org>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/soc/ti/omap_prm.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -243,14 +243,44 @@ static const struct omap_rst_map am4_device_rst_map[] = {
 };
 
 static const struct omap_prm_data am4_prm_data[] = {
+	{
+		.name = "mpu", .base = 0x44df0300,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_noinact,
+	},
 	{
 		.name = "gfx", .base = 0x44df0400,
 		.pwrstctrl = 0, .pwrstst = 0x4, .dmap = &omap_prm_onoff_noauto,
 		.rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_0, .clkdm_name = "gfx_l3",
 	},
-	{ .name = "per", .base = 0x44df0800, .rstctrl = 0x10, .rstst = 0x14, .rstmap = am4_per_rst_map, .clkdm_name = "pruss_ocp" },
-	{ .name = "wkup", .base = 0x44df2000, .rstctrl = 0x10, .rstst = 0x14, .rstmap = am3_wkup_rst_map, .flags = OMAP_PRM_HAS_NO_CLKDM },
-	{ .name = "device", .base = 0x44df4000, .rstctrl = 0x0, .rstst = 0x4, .rstmap = am4_device_rst_map, .flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM },
+	{
+		.name = "rtc", .base = 0x44df0500,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_alwon,
+	},
+	{
+		.name = "tamper", .base = 0x44df0600,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_alwon,
+	},
+	{
+		.name = "cefuse", .base = 0x44df0700,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_onoff_noauto,
+	},
+	{
+		.name = "per", .base = 0x44df0800,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_noinact,
+		.rstctrl = 0x10, .rstst = 0x14, .rstmap = am4_per_rst_map,
+		.clkdm_name = "pruss_ocp"
+	},
+	{
+		.name = "wkup", .base = 0x44df2000,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_alwon,
+		.rstctrl = 0x10, .rstst = 0x14, .rstmap = am3_wkup_rst_map,
+		.flags = OMAP_PRM_HAS_NO_CLKDM
+	},
+	{
+		.name = "device", .base = 0x44df4000,
+		.rstctrl = 0x0, .rstst = 0x4, .rstmap = am4_device_rst_map,
+		.flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM
+	},
 	{ },
 };
 
-- 
2.29.2
