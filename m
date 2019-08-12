Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D933189F3D
	for <lists+linux-omap@lfdr.de>; Mon, 12 Aug 2019 15:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728873AbfHLNKQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Aug 2019 09:10:16 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:40790 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728862AbfHLNKQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 12 Aug 2019 09:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=Xhn/8B6kbiuvTN3BDf9Fe0aYmhI5udi+TdwPGifX7cc=; b=EtMnFiJ3PKSe
        enV0OHnnm5z8c3A2d6ssnCX2i0mXWU+ZyR7W1nvBscikvaYc0xQmB99Z/OMg3l6cL7cjG4aRVApyN
        16cHjlGjq5idfXxAkFQCSVXli6ainCY1gtMiemxALWgQl5e0svqaMlRZP9IWlDZYznUXmIb7Kx0VO
        F3elA=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hxA5R-0001Qp-QL; Mon, 12 Aug 2019 13:10:09 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 012B92740CB7; Mon, 12 Aug 2019 14:10:08 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Applied "regulator: twl6030: workaround the VMMC reset behavior" to the regulator tree
In-Reply-To: <20190725094542.16547-4-gregory.clement@bootlin.com>
X-Patchwork-Hint: ignore
Message-Id: <20190812131009.012B92740CB7@ypsilon.sirena.org.uk>
Date:   Mon, 12 Aug 2019 14:10:08 +0100 (BST)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The patch

   regulator: twl6030: workaround the VMMC reset behavior

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

From d9df0187b6edd5871255cee29128c63f134e599c Mon Sep 17 00:00:00 2001
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 25 Jul 2019 11:45:42 +0200
Subject: [PATCH] regulator: twl6030: workaround the VMMC reset behavior

During reset the VMMC regulator doesn't reach 0V and only drops to
1.8V, furthermore the pulse width is under 200us whereas the SD
specification expect 1ms.

The WR_S bit allows the TWL6030 to no reset at all the VMMC during warm
reset and keep the current voltage. Thanks to this workaround the SD
card doesn't reach a undefined reset stage.

Actually this behavior is available for all the LDO regulator, so the
driver will also allow to use it with any of these regulator.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Link: https://lore.kernel.org/r/20190725094542.16547-4-gregory.clement@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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

