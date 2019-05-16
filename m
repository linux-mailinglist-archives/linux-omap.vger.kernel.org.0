Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4786F1FE82
	for <lists+linux-omap@lfdr.de>; Thu, 16 May 2019 06:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfEPEcC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 00:32:02 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54450 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfEPEcC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 May 2019 00:32:02 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4G4W046126411;
        Wed, 15 May 2019 23:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557981120;
        bh=uEVCSV19YfhFYWQvWChkq8hxy9erGlYnGHbP6Twl6FI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=IJnJ+h9LVoELo+NxLX3Q+6P599BawnnbHM8YvNgByN7rszhmZtTPvzlmg6ginoTIP
         Cx+xTK/u3hmAcPWARnRkRgmlACBCYB/K9uZ0ci4XIXrTlgdz1AGqbZihBekazkR/9U
         3kofJUMXnlESY8OaAnqrM24ElzF6BIXH4Qbe/hws=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4G4W0WY042242
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 May 2019 23:32:00 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 15
 May 2019 23:31:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 15 May 2019 23:31:59 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4G4Vmio094857;
        Wed, 15 May 2019 23:31:57 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <lee.jones@linaro.org>, <robh+dt@kernel.org>, <broonie@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <t-kristo@ti.com>, <j-keerthy@ti.com>
Subject: [PATCH v2 3/3] regulator: lp87565: Add 4-phase lp87561 regulator support
Date:   Thu, 16 May 2019 10:02:18 +0530
Message-ID: <20190516043218.8222-4-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516043218.8222-1-j-keerthy@ti.com>
References: <20190516043218.8222-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The LP8756x family has a single output 4-phase regulator
configuration. Add support for the same. The control
lies in the master buck which is buck0 for 4-phase
configuration. Enable/disable/voltage set happen via
buck0 registers.

Data Sheet: https://www.ti.com/lit/ds/symlink/lp87561-q1.pdf

Signed-off-by: Keerthy <j-keerthy@ti.com>
---

Changes in v2:

  * Changed if/else block to switch statement.

 drivers/regulator/lp87565-regulator.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/lp87565-regulator.c b/drivers/regulator/lp87565-regulator.c
index 81eb4b890c0c..af00d1ffcf33 100644
--- a/drivers/regulator/lp87565-regulator.c
+++ b/drivers/regulator/lp87565-regulator.c
@@ -153,6 +153,12 @@ static const struct lp87565_regulator regulators[] = {
 			  LP87565_REG_BUCK2_CTRL_1,
 			  LP87565_BUCK_CTRL_1_EN, 3230,
 			  buck0_1_2_3_ranges, LP87565_REG_BUCK2_CTRL_2),
+	LP87565_REGULATOR("BUCK3210", LP87565_BUCK_3210, "buck3210",
+			  lp87565_buck_ops, 256, LP87565_REG_BUCK0_VOUT,
+			  LP87565_BUCK_VSET, LP87565_REG_BUCK0_CTRL_1,
+			  LP87565_BUCK_CTRL_1_EN |
+			  LP87565_BUCK_CTRL_1_FPWM_MP_0_2, 3230,
+			  buck0_1_2_3_ranges, LP87565_REG_BUCK0_CTRL_2),
 };
 
 static int lp87565_regulator_probe(struct platform_device *pdev)
@@ -169,9 +175,18 @@ static int lp87565_regulator_probe(struct platform_device *pdev)
 	config.driver_data = lp87565;
 	config.regmap = lp87565->regmap;
 
-	if (lp87565->dev_type == LP87565_DEVICE_TYPE_LP87565_Q1) {
+	switch (lp87565->dev_type) {
+	case LP87565_DEVICE_TYPE_LP87565_Q1:
 		min_idx = LP87565_BUCK_10;
 		max_idx = LP87565_BUCK_23;
+		break;
+	case LP87565_DEVICE_TYPE_LP87561_Q1:
+		min_idx = LP87565_BUCK_3210;
+		max_idx = LP87565_BUCK_3210;
+	default:
+		dev_err(lp87565->dev, "Invalid lp config %d\n",
+			lp87565->dev_type);
+		return -EINVAL;
 	}
 
 	for (i = min_idx; i <= max_idx; i++) {
-- 
2.17.1

