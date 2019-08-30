Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5CCA3FC1
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2019 23:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbfH3VnU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Aug 2019 17:43:20 -0400
Received: from muru.com ([72.249.23.125]:59170 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728079AbfH3VnU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 30 Aug 2019 17:43:20 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8817480D4;
        Fri, 30 Aug 2019 21:43:48 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] phy: mapphone-mdm6600: Fix uninitialized status value regression
Date:   Fri, 30 Aug 2019 14:43:12 -0700
Message-Id: <20190830214312.48950-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Only the used bits get cleared with bitmap_zero() when we call
gpiod_get_array_value_cansleep(). We must mask only the bits we're
using for ddata->status as the other bits in the bitmap may not be
initialized.

And let's also drop useless debug code accidentally left over while
at it.

Fixes: b9762bebc633 ("gpiolib: Pass bitmaps, not integer arrays, to get/set array")
Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Marcel Partap <mpartap@gmx.net>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Michael Scott <hashcode0f@gmail.com>
Cc: NeKit <nekit1000@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/phy/motorola/phy-mapphone-mdm6600.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/motorola/phy-mapphone-mdm6600.c b/drivers/phy/motorola/phy-mapphone-mdm6600.c
--- a/drivers/phy/motorola/phy-mapphone-mdm6600.c
+++ b/drivers/phy/motorola/phy-mapphone-mdm6600.c
@@ -200,7 +200,7 @@ static void phy_mdm6600_status(struct work_struct *work)
 	struct phy_mdm6600 *ddata;
 	struct device *dev;
 	DECLARE_BITMAP(values, PHY_MDM6600_NR_STATUS_LINES);
-	int error, i, val = 0;
+	int error;
 
 	ddata = container_of(work, struct phy_mdm6600, status_work.work);
 	dev = ddata->dev;
@@ -212,16 +212,11 @@ static void phy_mdm6600_status(struct work_struct *work)
 	if (error)
 		return;
 
-	for (i = 0; i < PHY_MDM6600_NR_STATUS_LINES; i++) {
-		val |= test_bit(i, values) << i;
-		dev_dbg(ddata->dev, "XXX %s: i: %i values[i]: %i val: %i\n",
-			__func__, i, test_bit(i, values), val);
-	}
-	ddata->status = values[0];
+	ddata->status = values[0] & ((1 << PHY_MDM6600_NR_STATUS_LINES) - 1);
 
 	dev_info(dev, "modem status: %i %s\n",
 		 ddata->status,
-		 phy_mdm6600_status_name[ddata->status & 7]);
+		 phy_mdm6600_status_name[ddata->status]);
 	complete(&ddata->ack);
 }
 
-- 
2.23.0
