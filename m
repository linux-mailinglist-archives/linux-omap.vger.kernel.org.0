Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE659CFA97
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 14:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730980AbfJHM4I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 08:56:08 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36000 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730915AbfJHM4H (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Oct 2019 08:56:07 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98Cu1X7128857;
        Tue, 8 Oct 2019 07:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570539361;
        bh=jVjHqDUh4JTBppk9XVlo05dAGntMMljP5k/tZSWLMM4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=jQ2cWviIii3om3WFKJ70rSXyIleSFElQW/R8jv3yeNKm+tn/ZZusxXa0untQ3zwtb
         lY6rJxvhvUlI87DfHSwjHKAATxg9wPzhbqNXc5k1O1d+Zohsmo4wXy9xfwXZ02fqbV
         LQTG9rrqCcL2zlckA4m4+bKQpVvMi7HmPnpBuLcg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98Cu1N2104117;
        Tue, 8 Oct 2019 07:56:01 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 07:55:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 07:55:58 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98Ctk5D046741;
        Tue, 8 Oct 2019 07:55:59 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <ssantosh@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <p.zabel@pengutronix.de>
Subject: [PATCHv8 6/9] soc: ti: omap-prm: add data for am33xx
Date:   Tue, 8 Oct 2019 15:55:41 +0300
Message-ID: <20191008125544.20679-7-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191008125544.20679-1-t-kristo@ti.com>
References: <20191008125544.20679-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add PRM instance data for AM33xx SoC. Includes some basic register
definitions and reset data for now.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/soc/ti/omap_prm.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
index 24b1da3492c0..a5fde34f6afd 100644
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -58,6 +58,11 @@ struct omap_reset_data {
 
 #define OMAP_PRM_HAS_RESETS	(OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_RSTST)
 
+static const struct omap_rst_map rst_map_0[] = {
+	{ .rst = 0, .st = 0 },
+	{ .rst = -1 },
+};
+
 static const struct omap_rst_map rst_map_01[] = {
 	{ .rst = 0, .st = 0 },
 	{ .rst = 1, .st = 1 },
@@ -79,8 +84,27 @@ static const struct omap_prm_data omap4_prm_data[] = {
 	{ },
 };
 
+static const struct omap_rst_map am3_per_rst_map[] = {
+	{ .rst = 1 },
+	{ .rst = -1 },
+};
+
+static const struct omap_rst_map am3_wkup_rst_map[] = {
+	{ .rst = 3, .st = 5 },
+	{ .rst = -1 },
+};
+
+static const struct omap_prm_data am3_prm_data[] = {
+	{ .name = "per", .base = 0x44e00c00, .rstctrl = 0x0, .rstmap = am3_per_rst_map, .flags = OMAP_PRM_HAS_RSTCTRL, .clkdm_name = "pruss_ocp" },
+	{ .name = "wkup", .base = 0x44e00d00, .rstctrl = 0x0, .rstst = 0xc, .rstmap = am3_wkup_rst_map, .flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM },
+	{ .name = "device", .base = 0x44e00f00, .rstctrl = 0x0, .rstst = 0x8, .rstmap = rst_map_01, .flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM },
+	{ .name = "gfx", .base = 0x44e01100, .rstctrl = 0x4, .rstst = 0x14, .rstmap = rst_map_0, .clkdm_name = "gfx_l3" },
+	{ },
+};
+
 static const struct of_device_id omap_prm_id_table[] = {
 	{ .compatible = "ti,omap4-prm-inst", .data = omap4_prm_data },
+	{ .compatible = "ti,am3-prm-inst", .data = am3_prm_data },
 	{ },
 };
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
