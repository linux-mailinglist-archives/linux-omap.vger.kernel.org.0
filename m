Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D753273445
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 22:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbgIUUxk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 16:53:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:59820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727808AbgIUUxj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 16:53:39 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4424423A05;
        Mon, 21 Sep 2020 20:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721618;
        bh=rwcxHedviMWPck0GnAohh/fen5W24mFQK+Aj4ZWN5CQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZUiisC6xMElCEgCvcvp/5Dl3VPq01LXASpf7secFAPKMapn3dwV9P9rN50NzWddNC
         ykEY1501HmwA8msHcWeuO0FX74zHrhg5JVnDAkR9PAsCxm5Rqfuo3lQduF09bTCPZe
         JouzhCYwO+ry49IamxA8LwrnFos/6fjv3ipDl3x4=
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
Subject: [PATCH 32/42] mfd: tps6507x: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:50:06 +0200
Message-Id: <20200921205016.20461-32-krzk@kernel.org>
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
 drivers/mfd/tps6507x.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tps6507x.c b/drivers/mfd/tps6507x.c
index 1f308c4e3694..15bb92ef64c7 100644
--- a/drivers/mfd/tps6507x.c
+++ b/drivers/mfd/tps6507x.c
@@ -100,8 +100,9 @@ static int tps6507x_i2c_probe(struct i2c_client *i2c,
 	tps6507x->read_dev = tps6507x_i2c_read_device;
 	tps6507x->write_dev = tps6507x_i2c_write_device;
 
-	return devm_mfd_add_devices(tps6507x->dev, -1, tps6507x_devs,
-				    ARRAY_SIZE(tps6507x_devs), NULL, 0, NULL);
+	return devm_mfd_add_devices(tps6507x->dev, PLATFORM_DEVID_NONE,
+				    tps6507x_devs, ARRAY_SIZE(tps6507x_devs),
+				    NULL, 0, NULL);
 }
 
 static const struct i2c_device_id tps6507x_i2c_id[] = {
-- 
2.17.1

