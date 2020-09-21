Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A09273451
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 22:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728315AbgIUUyD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 16:54:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:60392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728307AbgIUUyD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 16:54:03 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5EE5323A50;
        Mon, 21 Sep 2020 20:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721642;
        bh=fnjIy/DliToaumnIWwx3aFKqD96GjNIH8p0ilhLZR0g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=op3Iz1jq2I/88tVIcwClgxjqmyVNlSnThEWlklT/sk5RrdAWpoC78Mmcuzqb9nbLr
         Fipez+ZAle820HIeu8w9XiJzd6prizZ0iJ6ynEXOh8JMtm1j4p+kiCoLukC2cdHE/8
         2mgh6fEL1UnXhnYpvefYz6hidft9GMfunD/ojh8s=
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
Subject: [PATCH 36/42] mfd: tps65910: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:50:10 +0200
Message-Id: <20200921205016.20461-36-krzk@kernel.org>
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
 drivers/mfd/tps65910.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 11959021b50a..d332072ee9de 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -502,7 +502,7 @@ static int tps65910_i2c_probe(struct i2c_client *i2c,
 		pm_power_off = tps65910_power_off;
 	}
 
-	ret = devm_mfd_add_devices(tps65910->dev, -1,
+	ret = devm_mfd_add_devices(tps65910->dev, PLATFORM_DEVID_NONE,
 				   tps65910s, ARRAY_SIZE(tps65910s),
 				   NULL, 0,
 				   regmap_irq_get_domain(tps65910->irq_data));
-- 
2.17.1

