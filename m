Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AECB29D843
	for <lists+linux-omap@lfdr.de>; Wed, 28 Oct 2020 23:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387810AbgJ1Wa5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 18:30:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:44326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387793AbgJ1Wa4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:30:56 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6131F20725;
        Wed, 28 Oct 2020 22:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924255;
        bh=ZhHhkh6o1JF/ds+3rdUTx+1vE3mzIzoPH4I1vjLLy5w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=viEbwuZDoYAR+E4LAsjCYAH8P8MbPR/9VNMiQXeZjcvtQ4o7mavRbVdZEiQJrGbN8
         IZKQeADuKwgi++NkOMLojI0vZZ+OF54G4+fIBtUAw3IRGX8g4EY6ATwrT4zdksi+iG
         ij1Ro79mS1Sy5op8AQNgV4NlIh6gvdzZRKBQANFg=
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
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: [RESEND PATCH 08/42] mfd: da9055: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:29:35 +0100
Message-Id: <20201028223009.369824-8-krzk@kernel.org>
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
Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
---
 drivers/mfd/da9055-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/da9055-core.c b/drivers/mfd/da9055-core.c
index 6d0af8486269..ff8fe165b937 100644
--- a/drivers/mfd/da9055-core.c
+++ b/drivers/mfd/da9055-core.c
@@ -400,7 +400,7 @@ int da9055_device_init(struct da9055 *da9055)
 
 	da9055->irq_base = regmap_irq_chip_get_base(da9055->irq_data);
 
-	ret = mfd_add_devices(da9055->dev, -1,
+	ret = mfd_add_devices(da9055->dev, PLATFORM_DEVID_NONE,
 			      da9055_devs, ARRAY_SIZE(da9055_devs),
 			      NULL, da9055->irq_base, NULL);
 	if (ret)
-- 
2.25.1

