Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D9527342B
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 22:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728530AbgIUUxA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 16:53:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:58980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726467AbgIUUw5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 16:52:57 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5C27239E7;
        Mon, 21 Sep 2020 20:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721576;
        bh=tV83lbckL3BUbusSp+k2ben0NRWIywBFOecylgZRFzU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=E+RGMGs0y1au3y8G/YoZX5va4ym8jLAJVdPslKDcnTJfrtBC5wofWJASM+BWB9fjC
         fWx2+6ZhiIGkIk+OBLGY5BJYtpQD2Kk7rl9o305hcetDfabvEnDVepx2CcFpZRAcxg
         81O6vo4O9y/gq35y72re5tfX4qW42k1/QiQguzWA=
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
Subject: [PATCH 25/42] mfd: retu: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:49:59 +0200
Message-Id: <20200921205016.20461-25-krzk@kernel.org>
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
 drivers/mfd/retu-mfd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/retu-mfd.c b/drivers/mfd/retu-mfd.c
index e7d27b7861c1..55e24e8343f3 100644
--- a/drivers/mfd/retu-mfd.c
+++ b/drivers/mfd/retu-mfd.c
@@ -271,9 +271,9 @@ static int retu_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	if (ret < 0)
 		return ret;
 
-	ret = mfd_add_devices(rdev->dev, -1, rdat->children, rdat->nchildren,
-			      NULL, regmap_irq_chip_get_base(rdev->irq_data),
-			      NULL);
+	ret = mfd_add_devices(rdev->dev, PLATFORM_DEVID_NONE, rdat->children,
+			      rdat->nchildren, NULL,
+			      regmap_irq_chip_get_base(rdev->irq_data), NULL);
 	if (ret < 0) {
 		regmap_del_irq_chip(i2c->irq, rdev->irq_data);
 		return ret;
-- 
2.17.1

