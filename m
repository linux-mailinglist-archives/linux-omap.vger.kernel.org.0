Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C361DC119
	for <lists+linux-omap@lfdr.de>; Wed, 20 May 2020 23:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbgETVOE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 May 2020 17:14:04 -0400
Received: from muru.com ([72.249.23.125]:55320 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728421AbgETVNu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 20 May 2020 17:13:50 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3873C81C7;
        Wed, 20 May 2020 21:14:38 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 3/6] soc: ti: omap-prm: Configure sgx power domain for am3 and am4
Date:   Wed, 20 May 2020 14:13:31 -0700
Message-Id: <20200520211334.61814-4-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520211334.61814-1-tony@atomide.com>
References: <20200520211334.61814-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's configure only sgx power domain for am3 and am4 to start with.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/soc/ti/omap_prm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -186,7 +186,11 @@ static const struct omap_prm_data am3_prm_data[] = {
 	{ .name = "per", .base = 0x44e00c00, .rstctrl = 0x0, .rstmap = am3_per_rst_map, .flags = OMAP_PRM_HAS_RSTCTRL, .clkdm_name = "pruss_ocp" },
 	{ .name = "wkup", .base = 0x44e00d00, .rstctrl = 0x0, .rstst = 0xc, .rstmap = am3_wkup_rst_map, .flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM },
 	{ .name = "device", .base = 0x44e00f00, .rstctrl = 0x0, .rstst = 0x8, .rstmap = rst_map_01, .flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM },
-	{ .name = "gfx", .base = 0x44e01100, .rstctrl = 0x4, .rstst = 0x14, .rstmap = rst_map_0, .clkdm_name = "gfx_l3" },
+	{
+		.name = "gfx", .base = 0x44e01100,
+		.pwrstctrl = 0, .pwrstst = 0x10, .dmap = &omap_prm_noinact,
+		.rstctrl = 0x4, .rstst = 0x14, .rstmap = rst_map_0, .clkdm_name = "gfx_l3",
+	},
 	{ },
 };
 
@@ -202,7 +206,11 @@ static const struct omap_rst_map am4_device_rst_map[] = {
 };
 
 static const struct omap_prm_data am4_prm_data[] = {
-	{ .name = "gfx", .base = 0x44df0400, .rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_0, .clkdm_name = "gfx_l3" },
+	{
+		.name = "gfx", .base = 0x44df0400,
+		.pwrstctrl = 0, .pwrstst = 0x4, .dmap = &omap_prm_onoff_noauto,
+		.rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_0, .clkdm_name = "gfx_l3",
+	},
 	{ .name = "per", .base = 0x44df0800, .rstctrl = 0x10, .rstst = 0x14, .rstmap = am4_per_rst_map, .clkdm_name = "pruss_ocp" },
 	{ .name = "wkup", .base = 0x44df2000, .rstctrl = 0x10, .rstst = 0x14, .rstmap = am3_wkup_rst_map, .flags = OMAP_PRM_HAS_NO_CLKDM },
 	{ .name = "device", .base = 0x44df4000, .rstctrl = 0x0, .rstst = 0x4, .rstmap = am4_device_rst_map, .flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM },
-- 
2.26.2
