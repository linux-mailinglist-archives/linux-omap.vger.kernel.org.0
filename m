Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 001EC1DC10F
	for <lists+linux-omap@lfdr.de>; Wed, 20 May 2020 23:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbgETVNv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 May 2020 17:13:51 -0400
Received: from muru.com ([72.249.23.125]:55326 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728439AbgETVNv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 20 May 2020 17:13:51 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2F99D8108;
        Wed, 20 May 2020 21:14:40 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 4/6] soc: ti: omap-prm: Configure omap4 and 5 l4_abe power domain
Date:   Wed, 20 May 2020 14:13:32 -0700
Message-Id: <20200520211334.61814-5-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520211334.61814-1-tony@atomide.com>
References: <20200520211334.61814-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's add omap4 and 5 l4_abe interconnect instance for the power
domain.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/soc/ti/omap_prm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -145,6 +145,10 @@ static const struct omap_rst_map rst_map_012[] = {
 
 static const struct omap_prm_data omap4_prm_data[] = {
 	{ .name = "tesla", .base = 0x4a306400, .rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_01 },
+	{
+		.name = "abe", .base = 0x4a306500,
+		.pwrstctrl = 0, .pwrstst = 0x4, .dmap = &omap_prm_all,
+	},
 	{ .name = "core", .base = 0x4a306700, .rstctrl = 0x210, .rstst = 0x214, .clkdm_name = "ducati", .rstmap = rst_map_012 },
 	{ .name = "ivahd", .base = 0x4a306f00, .rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_012 },
 	{ .name = "device", .base = 0x4a307b00, .rstctrl = 0x0, .rstst = 0x4, .rstmap = rst_map_01, .flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM },
@@ -153,6 +157,10 @@ static const struct omap_prm_data omap4_prm_data[] = {
 
 static const struct omap_prm_data omap5_prm_data[] = {
 	{ .name = "dsp", .base = 0x4ae06400, .rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_01 },
+	{
+		.name = "abe", .base = 0x4ae06500,
+		.pwrstctrl = 0, .pwrstst = 0x4, .dmap = &omap_prm_nooff,
+	},
 	{ .name = "core", .base = 0x4ae06700, .rstctrl = 0x210, .rstst = 0x214, .clkdm_name = "ipu", .rstmap = rst_map_012 },
 	{ .name = "iva", .base = 0x4ae07200, .rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_012 },
 	{ .name = "device", .base = 0x4ae07c00, .rstctrl = 0x0, .rstst = 0x4, .rstmap = rst_map_01, .flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM },
-- 
2.26.2
