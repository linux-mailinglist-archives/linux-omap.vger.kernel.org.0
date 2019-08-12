Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 744C189F45
	for <lists+linux-omap@lfdr.de>; Mon, 12 Aug 2019 15:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728880AbfHLNK1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Aug 2019 09:10:27 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:40776 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728822AbfHLNKQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 12 Aug 2019 09:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=tdwbDc9ozmiieCL3ejG4RI9chQxqK4fCWHKdUNUZf2c=; b=FEtpIUoyrGWn
        hEqnFcgZUkZwsrxYCzCVMcucSDs8mPpvwWoRCF8OYpEsWbkc4/eMHQUBTb5sqmXhOt3G32gB1nvtc
        j8To+Mt/y8pVrdAkXN/tyjsYOy8r2EydEc5pc6S+ytHENgiX75O0bwq6ebmcjOTNvYKkJGiVXzQ8U
        lQbG0=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hxA5T-0001Qu-1G; Mon, 12 Aug 2019 13:10:11 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 3E5682740CBD; Mon, 12 Aug 2019 14:10:09 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Applied "regulator: twl6030: use variable for device node" to the regulator tree
In-Reply-To: <20190725094542.16547-3-gregory.clement@bootlin.com>
X-Patchwork-Hint: ignore
Message-Id: <20190812131009.3E5682740CBD@ypsilon.sirena.org.uk>
Date:   Mon, 12 Aug 2019 14:10:09 +0100 (BST)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The patch

   regulator: twl6030: use variable for device node

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 621d3ce830649d56ef1c9611e370d05ceaffd7fc Mon Sep 17 00:00:00 2001
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 25 Jul 2019 11:45:41 +0200
Subject: [PATCH] regulator: twl6030: use variable for device node

Instead of refering the full pdev->dev.of_node use a local variable.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Link: https://lore.kernel.org/r/20190725094542.16547-3-gregory.clement@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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

