Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE5942E77BD
	for <lists+linux-omap@lfdr.de>; Wed, 30 Dec 2020 11:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgL3KVu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Dec 2020 05:21:50 -0500
Received: from muru.com ([72.249.23.125]:40586 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbgL3KVu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 30 Dec 2020 05:21:50 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 64C2980BA;
        Wed, 30 Dec 2020 10:21:22 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH] phy: cpcap-usb: Fix warning for missing regulator_disable
Date:   Wed, 30 Dec 2020 12:21:05 +0200
Message-Id: <20201230102105.11826-1-tony@atomide.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On deferred probe, we will get the following splat:

cpcap-usb-phy cpcap-usb-phy.0: could not initialize VBUS or ID IIO: -517
WARNING: CPU: 0 PID: 21 at drivers/regulator/core.c:2123 regulator_put+0x68/0x78
...
(regulator_put) from [<c068ebf0>] (release_nodes+0x1b4/0x1fc)
(release_nodes) from [<c068a9a4>] (really_probe+0x104/0x4a0)
(really_probe) from [<c068b034>] (driver_probe_device+0x58/0xb4)

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/phy/motorola/phy-cpcap-usb.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
--- a/drivers/phy/motorola/phy-cpcap-usb.c
+++ b/drivers/phy/motorola/phy-cpcap-usb.c
@@ -662,35 +662,42 @@ static int cpcap_usb_phy_probe(struct platform_device *pdev)
 	generic_phy = devm_phy_create(ddata->dev, NULL, &ops);
 	if (IS_ERR(generic_phy)) {
 		error = PTR_ERR(generic_phy);
-		return PTR_ERR(generic_phy);
+		goto out_reg_disable;
 	}
 
 	phy_set_drvdata(generic_phy, ddata);
 
 	phy_provider = devm_of_phy_provider_register(ddata->dev,
 						     of_phy_simple_xlate);
-	if (IS_ERR(phy_provider))
-		return PTR_ERR(phy_provider);
+	if (IS_ERR(phy_provider)) {
+		error = PTR_ERR(phy_provider);
+		goto out_reg_disable;
+	}
 
 	error = cpcap_usb_init_optional_pins(ddata);
 	if (error)
-		return error;
+		goto out_reg_disable;
 
 	cpcap_usb_init_optional_gpios(ddata);
 
 	error = cpcap_usb_init_iio(ddata);
 	if (error)
-		return error;
+		goto out_reg_disable;
 
 	error = cpcap_usb_init_interrupts(pdev, ddata);
 	if (error)
-		return error;
+		goto out_reg_disable;
 
 	usb_add_phy_dev(&ddata->phy);
 	atomic_set(&ddata->active, 1);
 	schedule_delayed_work(&ddata->detect_work, msecs_to_jiffies(1));
 
 	return 0;
+
+out_reg_disable:
+	regulator_disable(ddata->vusb);
+
+	return error;
 }
 
 static int cpcap_usb_phy_remove(struct platform_device *pdev)
-- 
2.29.2
