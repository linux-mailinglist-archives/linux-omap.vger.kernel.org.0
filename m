Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52CCB298B88
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 12:12:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1773231AbgJZLMM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 07:12:12 -0400
Received: from muru.com ([72.249.23.125]:46594 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1773168AbgJZLLY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 07:11:24 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5851E81A0;
        Mon, 26 Oct 2020 11:11:26 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
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
Date:   Mon, 26 Oct 2020 13:10:47 +0200
Message-Id: <20201026111049.54835-8-tony@atomide.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201026111049.54835-1-tony@atomide.com>
References: <20201026111049.54835-1-tony@atomide.com>
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
@@ -123,6 +123,10 @@ static const struct omap_prm_domain_map omap_prm_onoff_noauto = {
 	.statechange = 1,
 };
 
+static const struct omap_prm_domain_map omap_prm_alwon = {
+	.usable_modes = BIT(OMAP_PRMD_ON_ACTIVE),
+};
+
 static const struct omap_rst_map rst_map_0[] = {
 	{ .rst = 0, .st = 0 },
 	{ .rst = -1 },
@@ -189,14 +193,40 @@ static const struct omap_rst_map am3_wkup_rst_map[] = {
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
2.29.1
