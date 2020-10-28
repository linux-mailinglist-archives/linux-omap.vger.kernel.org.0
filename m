Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32F0629DC86
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 01:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388607AbgJ2Aaz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 20:30:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:47172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388176AbgJ1WdK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:33:10 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 166E620728;
        Wed, 28 Oct 2020 22:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924389;
        bh=q4ewlq6+5TU/aXmlFx1DhX/KRpEoZg7JSVY6SR9RAQg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IECvjWQ+dhjOgtvvSy48Rt7uWnMk36KnEXN9GLi4iNPXBHn3g2LyX2mAk1ngkH8wa
         ef7Vu+jbxm3P5qmSiFOZ11zEUqicHz/ZRhDvybTYfzUPhOzJQacWWKSgVY3eTVIp3V
         vpllfVWQihpM7zVlSSw9VvimbO5YsAueVOPhFpoQ=
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
Subject: [RESEND PATCH 33/42] mfd: tps65090: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:30:00 +0100
Message-Id: <20201028223009.369824-33-krzk@kernel.org>
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
 drivers/mfd/tps65090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index 6cdf6c315034..f8f7170f5822 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -209,7 +209,7 @@ static int tps65090_i2c_probe(struct i2c_client *client,
 		tps65090s[CHARGER].num_resources = 0;
 	}
 
-	ret = mfd_add_devices(tps65090->dev, -1, tps65090s,
+	ret = mfd_add_devices(tps65090->dev, PLATFORM_DEVID_NONE, tps65090s,
 			      ARRAY_SIZE(tps65090s), NULL,
 			      0, regmap_irq_get_domain(tps65090->irq_data));
 	if (ret) {
-- 
2.25.1

