Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DEE49FB61
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 09:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfH1HUQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 03:20:16 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59438 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbfH1HUQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 03:20:16 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S7K8fg116225;
        Wed, 28 Aug 2019 02:20:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566976808;
        bh=YN1mTOuLTNP+kJXj7vQ1LNJarTAWZ6U/EhWx8gi2dsM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=UjZ65xWt6Rz98jas+kJDH3+GqkYlEf6G15KbGynvIwHo3Yjr+Sf5PGfHytlrTLD3M
         TDjxUbYtzSkc7Nm36CbGFiXnGm4WYJpT5L4Y8FYVynSqlga+oMjRPT3Yi9osmKHsby
         DB6hu7DFoSHOErn7hNlMsYoBeHbAYRaDkUDu/B4c=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S7K8Be078691
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 02:20:08 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 02:20:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 02:20:08 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S7JmfK052201;
        Wed, 28 Aug 2019 02:20:06 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>,
        <p.zabel@pengutronix.de>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
Subject: [PATCHv2 08/11] soc: ti: omap-prm: add data for am33xx
Date:   Wed, 28 Aug 2019 10:19:38 +0300
Message-ID: <20190828071941.32378-9-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828071941.32378-1-t-kristo@ti.com>
References: <20190828071941.32378-1-t-kristo@ti.com>
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
index 192eeae67dfc..c4b33214bce1 100644
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -60,6 +60,11 @@ struct omap_reset_data {
 
 #define OMAP_PRM_HAS_RESETS	(OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_RSTST)
 
+static const struct omap_rst_map rst_map_0[] = {
+	{ .rst = 0, .st = 0 },
+	{ .rst = -1 },
+};
+
 static const struct omap_rst_map rst_map_01[] = {
 	{ .rst = 0, .st = 0 },
 	{ .rst = 1, .st = 1 },
@@ -81,8 +86,27 @@ static const struct omap_prm_data omap4_prm_data[] = {
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
