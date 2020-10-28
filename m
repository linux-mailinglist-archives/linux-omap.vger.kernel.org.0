Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9192029DC9D
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 01:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387906AbgJ2Ab0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 20:31:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:45398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387935AbgJ1Wbi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:31:38 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ECC382072C;
        Wed, 28 Oct 2020 22:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924297;
        bh=Br7/A1aJF5ODiCg0FsDq01zwMxR88GgRHrmoHNXqQC0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SaRkreUHbgK/buOR5NL6D7XZipzhovGbhAS3L6jxXD/Eintbf/pQMmgee5jFimnb5
         J2vvEeFq52K4buneR3ZiHqha4N8E/q5qnAFHIRZ2yBmeaOdRwOS1IY0CPSHPrUbmYc
         EppNgifIdTC05Y2PQN1Qjl1nBzocM/FxUdG7Ee2s=
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
Subject: [RESEND PATCH 16/42] mfd: max77686: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:29:43 +0100
Message-Id: <20201028223009.369824-16-krzk@kernel.org>
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
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/mfd/max77686.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
index 71faf503844b..1f26d00fdd37 100644
--- a/drivers/mfd/max77686.c
+++ b/drivers/mfd/max77686.c
@@ -217,8 +217,8 @@ static int max77686_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
-	ret = devm_mfd_add_devices(max77686->dev, -1, cells, n_devs, NULL,
-				   0, NULL);
+	ret = devm_mfd_add_devices(max77686->dev, PLATFORM_DEVID_NONE, cells,
+				   n_devs, NULL, 0, NULL);
 	if (ret < 0) {
 		dev_err(&i2c->dev, "failed to add MFD devices: %d\n", ret);
 		return ret;
-- 
2.25.1

