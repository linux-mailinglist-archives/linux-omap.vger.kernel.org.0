Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9854D273406
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 22:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbgIUUvv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 16:51:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:57644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728371AbgIUUvu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 16:51:50 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B5DB238A0;
        Mon, 21 Sep 2020 20:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721510;
        bh=aqWptJpi754Tkq81g5aJ8LQnjJsO90yXBe1KJKIzaHU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mA4X5ppw0Kf1v6pMl3bwH3CY+GFFVmAfoRLoZa4IM0j1JeAKU5b9xee6/La+JhpXm
         BYOVggfJUGATEpowKOQ8zyEIQ4krzS1M3C7vPWaPUcChKBquF4FBTKOva93Ep5e4p+
         lpRuL5Fmy1OEBtMxr+cQl3jwT6GlQ/UFes+ZJFNw=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 14/42] mfd: lp3943: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:49:48 +0200
Message-Id: <20200921205016.20461-14-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921205016.20461-1-krzk@kernel.org>
References: <20200921205016.20461-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use PLATFORM_DEVID_NONE define instead of "-1" value because:
 - it brings some meaning,
 - it might point attention why auto device ID was not used.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/lp3943.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/lp3943.c b/drivers/mfd/lp3943.c
index 13cb89be3d66..3e5d7336f59b 100644
--- a/drivers/mfd/lp3943.c
+++ b/drivers/mfd/lp3943.c
@@ -120,9 +120,8 @@ static int lp3943_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 	lp3943->mux_cfg = lp3943_mux_cfg;
 	i2c_set_clientdata(cl, lp3943);
 
-	return devm_mfd_add_devices(dev, -1, lp3943_devs,
-				    ARRAY_SIZE(lp3943_devs),
-				    NULL, 0, NULL);
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, lp3943_devs,
+				    ARRAY_SIZE(lp3943_devs), NULL, 0, NULL);
 }
 
 static const struct i2c_device_id lp3943_ids[] = {
-- 
2.17.1

