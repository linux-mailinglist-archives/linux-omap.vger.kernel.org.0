Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D914B29DCAC
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 01:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387797AbgJ1Way (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 18:30:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:44176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387785AbgJ1Wav (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:30:51 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 290CF20719;
        Wed, 28 Oct 2020 22:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924249;
        bh=yrIDtrUhmYNv3dPSz7tBCP/xxyCCBmLUAke1TAMzkTs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fThgRFzhG7hREyoN1dFzgfDBr8/saK8IOJlOAd2ZDKqo9NrM/J8Z7zjPtzlS+iUOe
         Fy94aO3kHfGYhjnXuDitbKfip4sliWtWRVmMBluLOfZZdGQgcvGDRNUvFDJ0NVfF8q
         WaXmVw9Lk7FB80MCRMIcpAz30W2AtUp+DfXOqdNc=
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
Subject: [RESEND PATCH 07/42] mfd: bcm590xx: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:29:34 +0100
Message-Id: <20201028223009.369824-7-krzk@kernel.org>
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
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mfd/bcm590xx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index bfac5dc091ca..2f7186a6f6c0 100644
--- a/drivers/mfd/bcm590xx.c
+++ b/drivers/mfd/bcm590xx.c
@@ -78,8 +78,9 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri,
 		goto err;
 	}
 
-	ret = devm_mfd_add_devices(&i2c_pri->dev, -1, bcm590xx_devs,
-				   ARRAY_SIZE(bcm590xx_devs), NULL, 0, NULL);
+	ret = devm_mfd_add_devices(&i2c_pri->dev, PLATFORM_DEVID_NONE,
+				   bcm590xx_devs, ARRAY_SIZE(bcm590xx_devs),
+				   NULL, 0, NULL);
 	if (ret < 0) {
 		dev_err(&i2c_pri->dev, "failed to add sub-devices: %d\n", ret);
 		goto err;
-- 
2.25.1

