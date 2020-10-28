Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC49C29D833
	for <lists+linux-omap@lfdr.de>; Wed, 28 Oct 2020 23:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387689AbgJ1WaZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 18:30:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:43538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387665AbgJ1WaY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:30:24 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BC70720720;
        Wed, 28 Oct 2020 22:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924223;
        bh=GBQ0jA1UbDnOOxIlEwQgVuqIYDKm0O9dv+Q1uOL6pdA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tIn300E8Rzj6BZFs3bCXHp75IHLpBjGoOYIqtoovMUMHGn0FHLBGyVHUD48m7tUDX
         /Za588QEIRJrpHNilXkNTADwp8hua11g9jS+fzjo9eQnezVpQrclTURxm+3+eL2hL1
         5nG6mYSYxD3yprPQXPjmtMWOFeYbRLZIfCcgC/pY=
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
Subject: [RESEND PATCH 02/42] mfd: as3711: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:29:29 +0100
Message-Id: <20201028223009.369824-2-krzk@kernel.org>
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
 drivers/mfd/as3711.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/as3711.c b/drivers/mfd/as3711.c
index 3adaec6c37df..5933f322ad52 100644
--- a/drivers/mfd/as3711.c
+++ b/drivers/mfd/as3711.c
@@ -184,8 +184,9 @@ static int as3711_i2c_probe(struct i2c_client *client,
 		as3711_subdevs[AS3711_BACKLIGHT].pdata_size = 0;
 	}
 
-	ret = devm_mfd_add_devices(as3711->dev, -1, as3711_subdevs,
-				   ARRAY_SIZE(as3711_subdevs), NULL, 0, NULL);
+	ret = devm_mfd_add_devices(as3711->dev, PLATFORM_DEVID_NONE,
+				   as3711_subdevs, ARRAY_SIZE(as3711_subdevs),
+				   NULL, 0, NULL);
 	if (ret < 0)
 		dev_err(&client->dev, "add mfd devices failed: %d\n", ret);
 
-- 
2.25.1

