Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD8429DC7C
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 01:30:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388577AbgJ2Aah (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 20:30:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:47326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388307AbgJ1WdV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:33:21 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B691F20728;
        Wed, 28 Oct 2020 22:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924400;
        bh=bjtNNGrQ1Gy69nItNmXzX7/lnZLGq9l8CRTCQoueuT4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CFU1veD84bch2JfRXsz0nUv9UCE3Tk3x1thM2T6Ps2K2b59kABatTQM98pmARVXd8
         SusJNNEvYJPRrDjbU1DPgGDblhzb5/zo4wEkpkgGQGoUqoiFLkg27LP7uniymi4vPr
         nMTXB7zXuc90hbQIkXYGEEnzwMIJCYRCnLkAEjhE=
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
Subject: [RESEND PATCH 35/42] mfd: tps6586x: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:30:02 +0100
Message-Id: <20201028223009.369824-35-krzk@kernel.org>
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
 drivers/mfd/tps6586x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index c36597797ddd..18158fd8aa7d 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -550,7 +550,7 @@ static int tps6586x_i2c_probe(struct i2c_client *client,
 		}
 	}
 
-	ret = mfd_add_devices(tps6586x->dev, -1,
+	ret = mfd_add_devices(tps6586x->dev, PLATFORM_DEVID_NONE,
 			      tps6586x_cell, ARRAY_SIZE(tps6586x_cell),
 			      NULL, 0, tps6586x->irq_domain);
 	if (ret < 0) {
-- 
2.25.1

