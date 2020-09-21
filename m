Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21248273409
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 22:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbgIUUv5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 16:51:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:57790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726599AbgIUUv5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 16:51:57 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E53A82388E;
        Mon, 21 Sep 2020 20:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721516;
        bh=s3lYeJolGTVwOoaBPA0aqpWf85mxmbshnqYq80JIl3s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bz8HYfcInmU/KgG2mw/AlR8zQ7YftYuRwaZTmYTyz0gGZe4JTOGsHTWaHSgghYAb3
         lCuZC9JtzHwzXAyh7urgZr67tTGkjTxOC7EAtHEBdgvCXSPfgHH+iZMMadWMjRJCWu
         TU4TZeCMkwcwnFbraBPgLT/uZNPeSFhfXuKViUKc=
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
Subject: [PATCH 15/42] mfd: max14577: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:49:49 +0200
Message-Id: <20200921205016.20461-15-krzk@kernel.org>
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
 drivers/mfd/max14577.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
index be185e9d5f16..93df79748a45 100644
--- a/drivers/mfd/max14577.c
+++ b/drivers/mfd/max14577.c
@@ -445,7 +445,7 @@ static int max14577_i2c_probe(struct i2c_client *i2c,
 			goto err_max77836;
 	}
 
-	ret = mfd_add_devices(max14577->dev, -1, mfd_devs,
+	ret = mfd_add_devices(max14577->dev, PLATFORM_DEVID_NONE, mfd_devs,
 			mfd_devs_size, NULL, 0, NULL);
 	if (ret < 0)
 		goto err_mfd;
-- 
2.17.1

