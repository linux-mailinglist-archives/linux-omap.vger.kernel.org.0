Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1C62733F2
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 22:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgIUUvI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 16:51:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:56768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727030AbgIUUvI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 16:51:08 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8611A23718;
        Mon, 21 Sep 2020 20:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721467;
        bh=GrcQBuUzkSCE7UvOvr0XUftHS4HEZMx37swbChp5jCo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ikKAlphicMPpC2drKkw3KPtmkHQi3DzT4A1RTByNMNMNnEpkoXl3wH0e4lb4ArrJd
         6fGKBc2kzqUw8jEXgGHjUTGYLldycbl6R4Ep5pSBy/5TD/NkFypyPV93TchEpqA30C
         tU7lpoAl5j20Hh04qJ3zEmC82/SfzJETKkjARVac=
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
Subject: [PATCH 07/42] mfd: bcm590xx: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:49:41 +0200
Message-Id: <20200921205016.20461-7-krzk@kernel.org>
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
2.17.1

