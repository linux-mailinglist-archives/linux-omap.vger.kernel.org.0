Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDD7874A36
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jul 2019 11:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729650AbfGYJqA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jul 2019 05:46:00 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:35119 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfGYJp7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Jul 2019 05:45:59 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 3A7ADE0002;
        Thu, 25 Jul 2019 09:45:57 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 2/3] regulator: twl6030: use variable for device node
Date:   Thu, 25 Jul 2019 11:45:41 +0200
Message-Id: <20190725094542.16547-3-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725094542.16547-1-gregory.clement@bootlin.com>
References: <20190725094542.16547-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Instead of refering the full pdev->dev.of_node use a local variable.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/regulator/twl6030-regulator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/twl6030-regulator.c b/drivers/regulator/twl6030-regulator.c
index 5fe208b381eb..d73c81542ceb 100644
--- a/drivers/regulator/twl6030-regulator.c
+++ b/drivers/regulator/twl6030-regulator.c
@@ -665,14 +665,14 @@ static int twlreg_probe(struct platform_device *pdev)
 	struct regulation_constraints	*c;
 	struct regulator_dev		*rdev;
 	struct regulator_config		config = { };
+	struct device_node		*np = pdev->dev.of_node;
 
 	template = of_device_get_match_data(&pdev->dev);
 	if (!template)
 		return -ENODEV;
 
 	id = template->desc.id;
-	initdata = of_get_regulator_init_data(&pdev->dev, pdev->dev.of_node,
-						&template->desc);
+	initdata = of_get_regulator_init_data(&pdev->dev, np, &template->desc);
 	if (!initdata)
 		return -EINVAL;
 
@@ -713,7 +713,7 @@ static int twlreg_probe(struct platform_device *pdev)
 	config.dev = &pdev->dev;
 	config.init_data = initdata;
 	config.driver_data = info;
-	config.of_node = pdev->dev.of_node;
+	config.of_node = np;
 
 	rdev = devm_regulator_register(&pdev->dev, &info->desc, &config);
 	if (IS_ERR(rdev)) {
-- 
2.20.1

