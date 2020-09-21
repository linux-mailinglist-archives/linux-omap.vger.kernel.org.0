Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7D827341E
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 22:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgIUUwd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 16:52:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:58520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgIUUwd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 16:52:33 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8AECB23998;
        Mon, 21 Sep 2020 20:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721553;
        bh=Whd+JvoTRUD6O5CJPDtNs6sNnmIrBGRuk8YsJQaT9EA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=sNhiWDGeIHNkbAoote6tsKEdItFPJIo8GJpUiEdfAbhZPJxLRJ7lk6VWJadufd9KM
         TTXDzHQ1xNaJU/2I4STKmYq1U4uKiCvsKHjsiBw2gYViezkNwQ7fwtD8fX/GRfHl06
         4nH7FJ0BG4eqMMrLca+OmY7uDBatZN79o8L1xqrU=
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
Subject: [PATCH 21/42] mfd: max8998: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:49:55 +0200
Message-Id: <20200921205016.20461-21-krzk@kernel.org>
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
 drivers/mfd/max8998.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
index 785f8e9841b7..33d92eddfd06 100644
--- a/drivers/mfd/max8998.c
+++ b/drivers/mfd/max8998.c
@@ -208,12 +208,12 @@ static int max8998_i2c_probe(struct i2c_client *i2c,
 
 	switch (max8998->type) {
 	case TYPE_LP3974:
-		ret = mfd_add_devices(max8998->dev, -1,
+		ret = mfd_add_devices(max8998->dev, PLATFORM_DEVID_NONE,
 				      lp3974_devs, ARRAY_SIZE(lp3974_devs),
 				      NULL, 0, NULL);
 		break;
 	case TYPE_MAX8998:
-		ret = mfd_add_devices(max8998->dev, -1,
+		ret = mfd_add_devices(max8998->dev, PLATFORM_DEVID_NONE,
 				      max8998_devs, ARRAY_SIZE(max8998_devs),
 				      NULL, 0, NULL);
 		break;
-- 
2.17.1

