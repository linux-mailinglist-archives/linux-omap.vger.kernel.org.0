Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC66429BF
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 16:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731996AbfFLOpr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 10:45:47 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36680 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728707AbfFLOpq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Jun 2019 10:45:46 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CEjhlO123299;
        Wed, 12 Jun 2019 09:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560350743;
        bh=xyAWNTrYH0QoNd9ukAbvyzeuxkpCV6ALotpkbQS0afA=;
        h=From:To:CC:Subject:Date;
        b=NGU+gcXHrfLDdBMjSjJW29qFwrVKeVVvnTBrDiINwHuZzOcnJWCMSJYCkR+HIGIbu
         a+9WF7E0LU/XEfGyUp5yCtIU1h8WO2alp8x7KMsaVKeHYeC5MdJ5GNC52CgmuhR2Ft
         Wpd4TGQqjVBaeIVBoyjY0kE8ACWUvDUTmWeXUEQE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CEjhJS079595
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 12 Jun 2019 09:45:43 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 12
 Jun 2019 09:45:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 12 Jun 2019 09:45:43 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CEjf5P083688;
        Wed, 12 Jun 2019 09:45:41 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <lee.jones@linaro.org>, <broonie@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <t-kristo@ti.com>, <j-keerthy@ti.com>
Subject: [RESEND PATCH v2 3/3] regulator: lp87565: Add 4-phase lp87561 regulator support
Date:   Wed, 12 Jun 2019 20:16:20 +0530
Message-ID: <20190612144620.28331-1-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
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
Acked-by: Mark Brown <broonie@kernel.org>
---

patches 1/3 2/3 are already applied to linux-next.

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

