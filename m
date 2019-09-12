Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37049B0E10
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 13:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731421AbfILLjv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 07:39:51 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47890 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731375AbfILLjv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 07:39:51 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CBdiKf074127;
        Thu, 12 Sep 2019 06:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568288384;
        bh=fLZbcw5wepXuSeFrsWtd637NuzfIOkB+KDiZWWlKW2M=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=OJy/BAwdAkD5gi8zkwckGHfcjKsG/npDDYEjsdgICUC9l9hfjW3fNtkHA+2hb/JhU
         uwzo/7gfpkIkxNGVyNNpBmS5CCjp4sgTtBojPQvsgRZBAucmxSowzr5QFKSVnsbMlC
         VSgvC2J6FSnqz1TAobjjtwOP177GEBajKYcKZC8Y=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CBdisK012872
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Sep 2019 06:39:44 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 06:39:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 06:39:43 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CBdKd0120606;
        Thu, 12 Sep 2019 06:39:42 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <ssantosh@kernel.org>,
        <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <tony@atomide.com>,
        <s-anna@ti.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCHv5 09/10] soc: ti: omap-prm: add omap5 PRM data
Date:   Thu, 12 Sep 2019 14:39:15 +0300
Message-ID: <20190912113916.20093-10-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912113916.20093-1-t-kristo@ti.com>
References: <20190912113916.20093-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add PRM instance data for omap5 family of SoCs. Initially this is just
used to provide reset support.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/soc/ti/omap_prm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
index 73ea64896770..38e8704c51ad 100644
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -84,6 +84,14 @@ static const struct omap_prm_data omap4_prm_data[] = {
 	{ },
 };
 
+static const struct omap_prm_data omap5_prm_data[] = {
+	{ .name = "dsp", .base = 0x4ae06400, .rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_01 },
+	{ .name = "core", .base = 0x4ae06700, .rstctrl = 0x210, .rstst = 0x214, .clkdm_name = "ipu", .rstmap = rst_map_012 },
+	{ .name = "iva", .base = 0x4ae07200, .rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_012 },
+	{ .name = "device", .base = 0x4ae07c00, .rstctrl = 0x0, .rstst = 0x4, .rstmap = rst_map_01, .flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM },
+	{ },
+};
+
 static const struct omap_prm_data dra7_prm_data[] = {
 	{ .name = "dsp1", .base = 0x4ae06400, .rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_01 },
 	{ .name = "ipu", .base = 0x4ae06500, .rstctrl = 0x10, .rstst = 0x14, .clkdm_name = "ipu1", .rstmap = rst_map_012 },
@@ -136,6 +144,7 @@ static const struct omap_prm_data am4_prm_data[] = {
 
 static const struct of_device_id omap_prm_id_table[] = {
 	{ .compatible = "ti,omap4-prm-inst", .data = omap4_prm_data },
+	{ .compatible = "ti,omap5-prm-inst", .data = omap5_prm_data },
 	{ .compatible = "ti,dra7-prm-inst", .data = dra7_prm_data },
 	{ .compatible = "ti,am3-prm-inst", .data = am3_prm_data },
 	{ .compatible = "ti,am4-prm-inst", .data = am4_prm_data },
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
