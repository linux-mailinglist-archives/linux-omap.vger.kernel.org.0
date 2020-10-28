Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4F3729DC8B
	for <lists+linux-omap@lfdr.de>; Thu, 29 Oct 2020 01:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbgJ2AbI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 20:31:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:47038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387996AbgJ1WdF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:33:05 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DBB322070E;
        Wed, 28 Oct 2020 22:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924384;
        bh=AYpOYrd8NHd0IN5fv60ahZIh1mXbfbbDY1XDX8gfWo0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VLmAC1LENqLPY4aOOje9K1sNCoHsv0QmUlpq8Sb8TQ81NaelXPLNkUw9d3cv8RG2b
         o83DF7prTyDv7q7OLp91M7v0FZd6ReFxcOWmnt1ZYf4bBFbmYDWzm1CMLDdVWQ8+jG
         38Lh8hX1AFCP20AKNJzP94CouxnolxzoFC5YnqHU=
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
Subject: [RESEND PATCH 32/42] mfd: tps6507x: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:29:59 +0100
Message-Id: <20201028223009.369824-32-krzk@kernel.org>
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
 drivers/mfd/tps6507x.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tps6507x.c b/drivers/mfd/tps6507x.c
index 1f308c4e3694..15bb92ef64c7 100644
--- a/drivers/mfd/tps6507x.c
+++ b/drivers/mfd/tps6507x.c
@@ -100,8 +100,9 @@ static int tps6507x_i2c_probe(struct i2c_client *i2c,
 	tps6507x->read_dev = tps6507x_i2c_read_device;
 	tps6507x->write_dev = tps6507x_i2c_write_device;
 
-	return devm_mfd_add_devices(tps6507x->dev, -1, tps6507x_devs,
-				    ARRAY_SIZE(tps6507x_devs), NULL, 0, NULL);
+	return devm_mfd_add_devices(tps6507x->dev, PLATFORM_DEVID_NONE,
+				    tps6507x_devs, ARRAY_SIZE(tps6507x_devs),
+				    NULL, 0, NULL);
 }
 
 static const struct i2c_device_id tps6507x_i2c_id[] = {
-- 
2.25.1

