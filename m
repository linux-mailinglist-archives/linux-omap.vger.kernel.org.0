Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 297D529D8B7
	for <lists+linux-omap@lfdr.de>; Wed, 28 Oct 2020 23:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388291AbgJ1WgB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 18:36:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:47714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731063AbgJ1Wd7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:33:59 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C340020714;
        Wed, 28 Oct 2020 22:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924438;
        bh=B/Vu+6xItSMaZHGt13GUipfykI5xbdYfX/hIHb/tkjs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gH5DZMP8j3zLEJjFKHVUigdfh2IdjmvsKy62IkVyMupbuxo8/Kf+ZtkY5rhl29wDc
         jY7A8wCmNJKi9wgks7zS6IuUVfk+y6Gu+JrSXN2OVSC5huWEcn34KU6LMvcRtcndSp
         Gvb11NTwHdH+iTwPODHuSShfCdYyq/rwYMS3mVdY=
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
Cc:     Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [RESEND PATCH 42/42] mfd: wm8994: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:30:09 +0100
Message-Id: <20201028223009.369824-42-krzk@kernel.org>
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
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/mfd/wm8994-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
index 3b2b93c5bbcb..5a8d4cc00cc1 100644
--- a/drivers/mfd/wm8994-core.c
+++ b/drivers/mfd/wm8994-core.c
@@ -578,7 +578,7 @@ static int wm8994_device_init(struct wm8994 *wm8994, int irq)
 
 	wm8994_irq_init(wm8994);
 
-	ret = mfd_add_devices(wm8994->dev, -1,
+	ret = mfd_add_devices(wm8994->dev, PLATFORM_DEVID_NONE,
 			      wm8994_devs, ARRAY_SIZE(wm8994_devs),
 			      NULL, 0, NULL);
 	if (ret != 0) {
-- 
2.25.1

