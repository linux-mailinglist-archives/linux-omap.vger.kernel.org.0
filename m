Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E468A29D8C8
	for <lists+linux-omap@lfdr.de>; Wed, 28 Oct 2020 23:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388363AbgJ1WgU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 18:36:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:47618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388435AbgJ1Wds (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:33:48 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4657620714;
        Wed, 28 Oct 2020 22:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924428;
        bh=+3+rZMhFJYQcM+CPB1sCdkixsb4UcB1JJHItd8PmXwM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sTuzb6tdZMy1AfQS7NxlZ/N6cfGJf6l/SKb3F25+EwCANmCqJrjLPzv+wUi5l7/LL
         4AxIUh8UtG3xD1uAv0oJ6EWiA5/nj9kyTRKqafPPQSMlQudwEfnS25wz0Xbm1zPZY2
         ZaflMJoHfKeNOPUp6+SiZBTVZiRY87aqJbzmO2u4=
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
        Andy Shevchenko <andy@kernel.org>, Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [RESEND PATCH 40/42] mfd: wl1273: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:30:07 +0100
Message-Id: <20201028223009.369824-40-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028223009.369824-1-krzk@kernel.org>
References: <20201028223009.369824-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use PLATFORM_DEVID_NONE define instead of "-1" value because:
 - it brings some meaning,
 - it might point attention why auto device ID was not used.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/wl1273-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wl1273-core.c b/drivers/mfd/wl1273-core.c
index 1ab5e15a65eb..0af1322fd393 100644
--- a/drivers/mfd/wl1273-core.c
+++ b/drivers/mfd/wl1273-core.c
@@ -214,7 +214,7 @@ static int wl1273_core_probe(struct i2c_client *client,
 	dev_dbg(&client->dev, "%s: number of children: %d.\n",
 		__func__, children);
 
-	r = devm_mfd_add_devices(&client->dev, -1, core->cells,
+	r = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE, core->cells,
 				 children, NULL, 0, NULL);
 	if (r)
 		goto err;
-- 
2.25.1

