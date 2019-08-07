Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66EE984637
	for <lists+linux-omap@lfdr.de>; Wed,  7 Aug 2019 09:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387471AbfHGHtj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 03:49:39 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57910 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387402AbfHGHtj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Aug 2019 03:49:39 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x777nYsn026506;
        Wed, 7 Aug 2019 02:49:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565164174;
        bh=CqHLqeTvLwqY9yjJT7RoxOx9D6Uv+3KwF7okndJxyzM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=nlM39HucyCjI3kq5RvBT+Tcjdgeso1P1eyTCjh7sZuYgj5wloqH63Qv2M+vxGImD7
         qDmP3UHsiqkdSnzTeOuSyR6FbI2UKfXevk6nr3YJf7HEnxF+lp+rBUDRQBtjkDNu0R
         XdAUZjmHq+bVSBFK8dPXcWsjwq5G7yoTWVEs8EWc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x777nYMs078588
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 02:49:34 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 02:49:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 02:49:33 -0500
Received: from gomoku.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x777nNHh118711;
        Wed, 7 Aug 2019 02:49:32 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
Subject: [PATCH 5/8] soc: ti: omap-prm: add omap4 PRM data
Date:   Wed, 7 Aug 2019 10:48:56 +0300
Message-ID: <1565164139-21886-6-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add PRM data for omap4 family of SoCs.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/soc/ti/omap_prm.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
index 870515e3..9b8d5945 100644
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -54,7 +54,27 @@ struct omap_reset_data {
 
 #define OMAP_PRM_NO_RSTST	BIT(0)
 
+struct omap_prm_data omap4_prm_data[] = {
+	{ .name = "mpu", .base = 0x4a306300, .pwstst = 0x4 },
+	{ .name = "tesla", .base = 0x4a306400, .pwstst = 0x4, .rstctl = 0x10, .rstst = 0x14 },
+	{ .name = "abe", .base = 0x4a306500, .pwstst = 0x4 },
+	{ .name = "always_on_core", .base = 0x4a306600, .pwstst = 0x4 },
+	{ .name = "core", .base = 0x4a306700, .pwstst = 0x4, .rstctl = 0x210, .rstst = 0x214 },
+	{ .name = "ivahd", .base = 0x4a306f00, .pwstst = 0x4, .rstctl = 0x10, .rstst = 0x14 },
+	{ .name = "cam", .base = 0x4a307000, .pwstst = 0x4 },
+	{ .name = "dss", .base = 0x4a307100, .pwstst = 0x4 },
+	{ .name = "gfx", .base = 0x4a307200, .pwstst = 0x4 },
+	{ .name = "l3init", .base = 0x4a307300, .pwstst = 0x4 },
+	{ .name = "l4per", .base = 0x4a307400, .pwstst = 0x4 },
+	{ .name = "cefuse", .base = 0x4a307600, .pwstst = 0x4 },
+	{ .name = "wkup", .base = 0x4a307700, .pwstst = 0x4 },
+	{ .name = "emu", .base = 0x4a307900, .pwstst = 0x4 },
+	{ .name = "device", .base = 0x4a307b00, .rstctl = 0x0, .rstst = 0x4 },
+	{ },
+};
+
 static const struct of_device_id omap_prm_id_table[] = {
+	{ .compatible = "ti,omap4-prm-inst", .data = omap4_prm_data },
 	{ },
 };
 
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
