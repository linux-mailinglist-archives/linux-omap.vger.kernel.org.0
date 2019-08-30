Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7D16A369E
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2019 14:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728165AbfH3MS4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Aug 2019 08:18:56 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44100 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727739AbfH3MSz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Aug 2019 08:18:55 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UCIkdG099668;
        Fri, 30 Aug 2019 07:18:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1567167526;
        bh=QcXAIWwT6vALVIQWT9+wzZ4g0FGWezy41x40Ykr/5h8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=I4PG9PN/uVRTBf6N2j482GBLeMSjbn/l7Bi34dQqzGnKebJRPgGg5DGLPsDk8xcOi
         lPo+G4fg+Kekb9B4YrVsdIPZI63LCyPK2OFOQtwtAAxDSLrKUhArXuluFvWoudIWtk
         +suFUmnpaaqYeIrnh6eaUzuPB1N6wfG0NTsb0hpA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UCIk0S031794
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 30 Aug 2019 07:18:46 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 30
 Aug 2019 07:18:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 30 Aug 2019 07:18:46 -0500
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UCIP6P083824;
        Fri, 30 Aug 2019 07:18:44 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <ssantosh@kernel.org>, <linux-omap@vger.kernel.org>,
        <tony@atomide.com>, <s-anna@ti.com>, <p.zabel@pengutronix.de>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCHv3 09/10] soc: ti: omap-prm: add am4 PRM data
Date:   Fri, 30 Aug 2019 15:18:15 +0300
Message-ID: <20190830121816.30034-10-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190830121816.30034-1-t-kristo@ti.com>
References: <20190830121816.30034-1-t-kristo@ti.com>
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
index bb03afe1a95c..216a4b69a6c9 100644
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -118,10 +118,30 @@ static const struct omap_prm_data am3_prm_data[] = {
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
