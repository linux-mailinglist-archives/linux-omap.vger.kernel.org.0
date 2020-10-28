Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A919029D880
	for <lists+linux-omap@lfdr.de>; Wed, 28 Oct 2020 23:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388099AbgJ1Wc1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 18:32:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:46468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388088AbgJ1Wc0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:32:26 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 495F52072C;
        Wed, 28 Oct 2020 22:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924346;
        bh=meaQ0IR2jwXG9zW2MTz/Y7kVlJwyJ/afU4Plo2uMxQw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=F0HVZBBqmayY52kexyzQsibompPgPC8phmy41M+yT+CyKuRXa+pKlsP9iUcjHNQfr
         kGMVcILpwb6yCcztStrrYQa0Fln7VGxwNVgByKmRJaGR3PVtA40hPs739qdLzc/gvR
         UpZ7lVhA2YHhe859fxsGGMcpxohB/umMHjLvet2A=
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
Subject: [RESEND PATCH 25/42] mfd: retu: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:29:52 +0100
Message-Id: <20201028223009.369824-25-krzk@kernel.org>
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
 drivers/mfd/retu-mfd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/retu-mfd.c b/drivers/mfd/retu-mfd.c
index e7d27b7861c1..55e24e8343f3 100644
--- a/drivers/mfd/retu-mfd.c
+++ b/drivers/mfd/retu-mfd.c
@@ -271,9 +271,9 @@ static int retu_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 	if (ret < 0)
 		return ret;
 
-	ret = mfd_add_devices(rdev->dev, -1, rdat->children, rdat->nchildren,
-			      NULL, regmap_irq_chip_get_base(rdev->irq_data),
-			      NULL);
+	ret = mfd_add_devices(rdev->dev, PLATFORM_DEVID_NONE, rdat->children,
+			      rdat->nchildren, NULL,
+			      regmap_irq_chip_get_base(rdev->irq_data), NULL);
 	if (ret < 0) {
 		regmap_del_irq_chip(i2c->irq, rdev->irq_data);
 		return ret;
-- 
2.25.1

