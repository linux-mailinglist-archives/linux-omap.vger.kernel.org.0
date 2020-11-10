Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513672AD4C7
	for <lists+linux-omap@lfdr.de>; Tue, 10 Nov 2020 12:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731878AbgKJLVR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Nov 2020 06:21:17 -0500
Received: from muru.com ([72.249.23.125]:47760 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731848AbgKJLVQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Nov 2020 06:21:16 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C93DA80BA;
        Tue, 10 Nov 2020 11:21:18 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH 7/9] soc: ti: omap-prm: am3: add genpd support for remaining PRM instances
Date:   Tue, 10 Nov 2020 13:20:40 +0200
Message-Id: <20201110112042.65489-8-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201110112042.65489-1-tony@atomide.com>
References: <20201110112042.65489-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tero Kristo <t-kristo@ti.com>

Add genpd support for per, wkup, mpu, rtc and cefuse instances.

Cc: Santosh Shilimkar <ssantosh@kernel.org>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/soc/ti/omap_prm.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -124,6 +124,10 @@ static const struct omap_prm_domain_map omap_prm_onoff_noauto = {
 	.statechange = 1,
 };
 
+static const struct omap_prm_domain_map omap_prm_alwon = {
+	.usable_modes = BIT(OMAP_PRMD_ON_ACTIVE),
+};
+
 static const struct omap_rst_map rst_map_0[] = {
 	{ .rst = 0, .st = 0 },
 	{ .rst = -1 },
@@ -190,14 +194,40 @@ static const struct omap_rst_map am3_wkup_rst_map[] = {
 };
 
 static const struct omap_prm_data am3_prm_data[] = {
-	{ .name = "per", .base = 0x44e00c00, .rstctrl = 0x0, .rstmap = am3_per_rst_map, .flags = OMAP_PRM_HAS_RSTCTRL, .clkdm_name = "pruss_ocp" },
-	{ .name = "wkup", .base = 0x44e00d00, .rstctrl = 0x0, .rstst = 0xc, .rstmap = am3_wkup_rst_map, .flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM },
-	{ .name = "device", .base = 0x44e00f00, .rstctrl = 0x0, .rstst = 0x8, .rstmap = rst_map_01, .flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM },
+	{
+		.name = "per", .base = 0x44e00c00,
+		.pwrstctrl = 0xc, .pwrstst = 0x8, .dmap = &omap_prm_noinact,
+		.rstctrl = 0x0, .rstmap = am3_per_rst_map,
+		.flags = OMAP_PRM_HAS_RSTCTRL, .clkdm_name = "pruss_ocp"
+	},
+	{
+		.name = "wkup", .base = 0x44e00d00,
+		.pwrstctrl = 0x4, .pwrstst = 0x4, .dmap = &omap_prm_alwon,
+		.rstctrl = 0x0, .rstst = 0xc, .rstmap = am3_wkup_rst_map,
+		.flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM
+	},
+	{
+		.name = "mpu", .base = 0x44e00e00,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_noinact,
+	},
+	{
+		.name = "device", .base = 0x44e00f00,
+		.rstctrl = 0x0, .rstst = 0x8, .rstmap = rst_map_01,
+		.flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM
+	},
+	{
+		.name = "rtc", .base = 0x44e01000,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_alwon,
+	},
 	{
 		.name = "gfx", .base = 0x44e01100,
 		.pwrstctrl = 0, .pwrstst = 0x10, .dmap = &omap_prm_noinact,
 		.rstctrl = 0x4, .rstst = 0x14, .rstmap = rst_map_0, .clkdm_name = "gfx_l3",
 	},
+	{
+		.name = "cefuse", .base = 0x44e01200,
+		.pwrstctrl = 0x0, .pwrstst = 0x4, .dmap = &omap_prm_onoff_noauto,
+	},
 	{ },
 };
 
-- 
2.29.2
