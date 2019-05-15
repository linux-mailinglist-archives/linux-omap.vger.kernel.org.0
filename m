Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB51B1EBCE
	for <lists+linux-omap@lfdr.de>; Wed, 15 May 2019 12:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfEOKIh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 May 2019 06:08:37 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53712 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbfEOKId (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 May 2019 06:08:33 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4FA8VNU031057;
        Wed, 15 May 2019 05:08:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557914911;
        bh=maiixD2C9/cpXNFaxOfAzhS0X1MxLb4YsFQp5c8gz6E=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=b8dUMfLXUesygfUeDIzP/O05vbzJuH+jPVH5BLIabb5c89iIjkxgjCJR1CGRj/iYm
         bfh9f8jVGL+Vo4+5RDh3QyfTWO63cQRlhjeFD8Wsf3pli270Oble6szK92fxv334mC
         181JvkucwKS6hBSSbKobw7aFUZtI3qD0f+Uen/MI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4FA8VtV099717
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 May 2019 05:08:31 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 15
 May 2019 05:08:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 15 May 2019 05:08:31 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4FA8Jdb030606;
        Wed, 15 May 2019 05:08:29 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <lee.jones@linaro.org>, <robh+dt@kernel.org>, <broonie@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <t-kristo@ti.com>, <j-keerthy@ti.com>
Subject: [PATCH 3/3] regulator: lp87565: Add 4-phase lp87561 regulator support
Date:   Wed, 15 May 2019 15:38:48 +0530
Message-ID: <20190515100848.19560-4-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190515100848.19560-1-j-keerthy@ti.com>
References: <20190515100848.19560-1-j-keerthy@ti.com>
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
 drivers/regulator/lp87565-regulator.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/regulator/lp87565-regulator.c b/drivers/regulator/lp87565-regulator.c
index 81eb4b890c0c..8255650df1cd 100644
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
@@ -172,6 +178,9 @@ static int lp87565_regulator_probe(struct platform_device *pdev)
 	if (lp87565->dev_type == LP87565_DEVICE_TYPE_LP87565_Q1) {
 		min_idx = LP87565_BUCK_10;
 		max_idx = LP87565_BUCK_23;
+	} else if (lp87565->dev_type == LP87565_DEVICE_TYPE_LP87561_Q1) {
+		min_idx = LP87565_BUCK_3210;
+		max_idx = LP87565_BUCK_3210;
 	}
 
 	for (i = min_idx; i <= max_idx; i++) {
-- 
2.17.1

