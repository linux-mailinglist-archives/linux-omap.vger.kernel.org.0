Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAAA2733F7
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 22:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgIUUvV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 16:51:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:57024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbgIUUvV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 16:51:21 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A864522B2D;
        Mon, 21 Sep 2020 20:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721480;
        bh=/UVn5s6TKv7Fe31CTRFQoHHpELb0l/2EMST2zTJbsz4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=In5u7siPnNJ4MvBPNhDHVin5mWvPSYDvm4ktZjP8n0MQ1LyeTPfjnMQe8QbJcX/nr
         1ZoDarv6uGRkLICVY03tSUJnuSizAxp58Iazj6IngA38BxCIIXGl6+RrkeZZvgS61L
         9m6KeDLqOHoeC3L3zCAPcvfj2leO1muK3w4mIhkk=
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
Subject: [PATCH 09/42] mfd: da9150: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:49:43 +0200
Message-Id: <20200921205016.20461-9-krzk@kernel.org>
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
 drivers/mfd/da9150-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
index 7f0aa1e8db96..e335cf718442 100644
--- a/drivers/mfd/da9150-core.c
+++ b/drivers/mfd/da9150-core.c
@@ -453,7 +453,7 @@ static int da9150_probe(struct i2c_client *client,
 
 	enable_irq_wake(da9150->irq);
 
-	ret = mfd_add_devices(da9150->dev, -1, da9150_devs,
+	ret = mfd_add_devices(da9150->dev, PLATFORM_DEVID_NONE, da9150_devs,
 			      ARRAY_SIZE(da9150_devs), NULL,
 			      da9150->irq_base, NULL);
 	if (ret) {
-- 
2.17.1

