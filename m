Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAA0B0E0D
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2019 13:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731420AbfILLju (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Sep 2019 07:39:50 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47886 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731375AbfILLju (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Sep 2019 07:39:50 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CBdh5w074122;
        Thu, 12 Sep 2019 06:39:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568288383;
        bh=TLJzFaDGrfR7zYUgMJnTM6uHF4H+5qrJ9lcRIUGwjDw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=W7fE6qp1KGKY7xSBb/y+dmunDruBcpsyv3xXXy7Qm8tbgaNrTuU9mvNoc6maphQXb
         2FTjsyRcdvUNNMZ/LDhqBk/IbWofcLsliensdhLMgEScyYeP0SLJKmkn16gQUi6Gxi
         F4QsdJ4MaOZybKMUtDr7sLhjiKSTnLacD3+3cFDM=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CBdhRT074110;
        Thu, 12 Sep 2019 06:39:43 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 12
 Sep 2019 06:39:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 12 Sep 2019 06:39:41 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CBdKcx120606;
        Thu, 12 Sep 2019 06:39:39 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <ssantosh@kernel.org>,
        <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <tony@atomide.com>,
        <s-anna@ti.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCHv5 08/10] soc: ti: omap-prm: add am4 PRM data
Date:   Thu, 12 Sep 2019 14:39:14 +0300
Message-ID: <20190912113916.20093-9-t-kristo@ti.com>
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

Add PRM instance data for am4 family of SoCs. Initially this is just
used to provide reset support.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/soc/ti/omap_prm.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
index de11ce08ff7b..73ea64896770 100644
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -115,10 +115,30 @@ static const struct omap_prm_data am3_prm_data[] = {
 	{ },
 };
 
+static const struct omap_rst_map am4_per_rst_map[] = {
+	{ .rst = 1, .st = 0 },
+	{ .rst = -1 },
+};
+
+static const struct omap_rst_map am4_device_rst_map[] = {
+	{ .rst = 0, .st = 1 },
+	{ .rst = 1, .st = 0 },
+	{ .rst = -1 },
+};
+
+static const struct omap_prm_data am4_prm_data[] = {
+	{ .name = "gfx", .base = 0x44df0400, .rstctrl = 0x10, .rstst = 0x14, .rstmap = rst_map_0, .clkdm_name = "gfx_l3" },
+	{ .name = "per", .base = 0x44df0800, .rstctrl = 0x10, .rstst = 0x14, .rstmap = am4_per_rst_map, .clkdm_name = "pruss_ocp" },
+	{ .name = "wkup", .base = 0x44df2000, .rstctrl = 0x10, .rstst = 0x14, .rstmap = am3_wkup_rst_map, .flags = OMAP_PRM_HAS_NO_CLKDM },
+	{ .name = "device", .base = 0x44df4000, .rstctrl = 0x0, .rstst = 0x4, .rstmap = am4_device_rst_map, .flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_NO_CLKDM },
+	{ },
+};
+
 static const struct of_device_id omap_prm_id_table[] = {
 	{ .compatible = "ti,omap4-prm-inst", .data = omap4_prm_data },
 	{ .compatible = "ti,dra7-prm-inst", .data = dra7_prm_data },
 	{ .compatible = "ti,am3-prm-inst", .data = am3_prm_data },
+	{ .compatible = "ti,am4-prm-inst", .data = am4_prm_data },
 	{ },
 };
 
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
