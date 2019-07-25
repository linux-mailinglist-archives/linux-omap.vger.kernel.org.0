Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE0B774A3A
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jul 2019 11:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729712AbfGYJqD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jul 2019 05:46:03 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:46217 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729162AbfGYJqC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Jul 2019 05:46:02 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id ED6D040006;
        Thu, 25 Jul 2019 09:45:58 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 3/3] regulator: twl6030: workaround the VMMC reset behavior
Date:   Thu, 25 Jul 2019 11:45:42 +0200
Message-Id: <20190725094542.16547-4-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725094542.16547-1-gregory.clement@bootlin.com>
References: <20190725094542.16547-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

During reset the VMMC regulator doesn't reach 0V and only drops to
1.8V, furthermore the pulse width is under 200us whereas the SD
specification expect 1ms.

The WR_S bit allows the TWL6030 to no reset at all the VMMC during warm
reset and keep the current voltage. Thanks to this workaround the SD
card doesn't reach a undefined reset stage.

Actually this behavior is available for all the LDO regulator, so the
driver will also allow to use it with any of these regulator.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/regulator/twl6030-regulator.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/twl6030-regulator.c b/drivers/regulator/twl6030-regulator.c
index d73c81542ceb..b8100c3cedad 100644
--- a/drivers/regulator/twl6030-regulator.c
+++ b/drivers/regulator/twl6030-regulator.c
@@ -57,6 +57,9 @@ struct twlreg_info {
 #define VREG_BC_PROC		3
 #define VREG_BC_CLK_RST		4
 
+/* TWL6030 LDO register values for VREG_VOLTAGE */
+#define TWL6030_VREG_VOLTAGE_WR_S   BIT(7)
+
 /* TWL6030 LDO register values for CFG_STATE */
 #define TWL6030_CFG_STATE_OFF	0x00
 #define TWL6030_CFG_STATE_ON	0x01
@@ -68,9 +71,10 @@ struct twlreg_info {
 #define TWL6030_CFG_STATE_APP(v)	(((v) & TWL6030_CFG_STATE_APP_MASK) >>\
 						TWL6030_CFG_STATE_APP_SHIFT)
 
-/* Flags for SMPS Voltage reading */
+/* Flags for SMPS Voltage reading and LDO reading*/
 #define SMPS_OFFSET_EN		BIT(0)
 #define SMPS_EXTENDED_EN	BIT(1)
+#define TWL_6030_WARM_RESET	BIT(3)
 
 /* twl6032 SMPS EPROM values */
 #define TWL6030_SMPS_OFFSET		0xB0
@@ -250,6 +254,9 @@ twl6030ldo_set_voltage_sel(struct regulator_dev *rdev, unsigned selector)
 {
 	struct twlreg_info	*info = rdev_get_drvdata(rdev);
 
+	if (info->flags & TWL_6030_WARM_RESET)
+		selector |= TWL6030_VREG_VOLTAGE_WR_S;
+
 	return twlreg_write(info, TWL_MODULE_PM_RECEIVER, VREG_VOLTAGE,
 			    selector);
 }
@@ -259,6 +266,9 @@ static int twl6030ldo_get_voltage_sel(struct regulator_dev *rdev)
 	struct twlreg_info	*info = rdev_get_drvdata(rdev);
 	int vsel = twlreg_read(info, TWL_MODULE_PM_RECEIVER, VREG_VOLTAGE);
 
+	if (info->flags & TWL_6030_WARM_RESET)
+		vsel &= ~TWL6030_VREG_VOLTAGE_WR_S;
+
 	return vsel;
 }
 
@@ -710,6 +720,9 @@ static int twlreg_probe(struct platform_device *pdev)
 		break;
 	}
 
+	if (of_get_property(np, "ti,retain-on-reset", NULL))
+		info->flags |= TWL_6030_WARM_RESET;
+
 	config.dev = &pdev->dev;
 	config.init_data = initdata;
 	config.driver_data = info;
-- 
2.20.1

