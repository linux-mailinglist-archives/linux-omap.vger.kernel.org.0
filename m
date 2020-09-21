Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4D6273457
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 22:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbgIUUyQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 16:54:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:60630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726727AbgIUUyP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 16:54:15 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A01A23A53;
        Mon, 21 Sep 2020 20:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721654;
        bh=ED1zTFo33SaOTQ4JwOgJrrKPCNBVmvl9bBp0MCoLMy4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=q8oTtEsVaOj+/qqDstPtGP5zM2+wRZwuuhGtx9hxNNH9eCkNFkuPw7vNxLg/kRxXw
         Ri/nDPKUdQytCbirEehPAs8CSnowW+IIgYOdpGt5fD0GCgeN9MEsJMGo7zDQXBSR8Z
         Z1qhGKPQLsGfO94xwPNQsyN7pPpsYGtTEiojk8dY=
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
Subject: [PATCH 38/42] mfd: twl6040: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:50:12 +0200
Message-Id: <20200921205016.20461-38-krzk@kernel.org>
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
 drivers/mfd/twl6040.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/twl6040.c b/drivers/mfd/twl6040.c
index b9c6d94b4002..702f9e216d42 100644
--- a/drivers/mfd/twl6040.c
+++ b/drivers/mfd/twl6040.c
@@ -794,8 +794,8 @@ static int twl6040_probe(struct i2c_client *client,
 	regcache_cache_only(twl6040->regmap, true);
 	regcache_mark_dirty(twl6040->regmap);
 
-	ret = mfd_add_devices(&client->dev, -1, twl6040->cells, children,
-			      NULL, 0, NULL);
+	ret = mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE, twl6040->cells,
+			      children, NULL, 0, NULL);
 	if (ret)
 		goto readyirq_err;
 
-- 
2.17.1

