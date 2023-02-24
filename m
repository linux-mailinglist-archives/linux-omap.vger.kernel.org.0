Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 719616A1B82
	for <lists+linux-omap@lfdr.de>; Fri, 24 Feb 2023 12:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjBXLi4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Feb 2023 06:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjBXLiv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Feb 2023 06:38:51 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910E44D627
        for <linux-omap@vger.kernel.org>; Fri, 24 Feb 2023 03:38:48 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id 6so13200468wrb.11
        for <linux-omap@vger.kernel.org>; Fri, 24 Feb 2023 03:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIyri+jpwJVpMIMhA1b9A/4ppRSy9kvCMb+aoYF2b5g=;
        b=oJaEWcdJ75XrXsvikn4wguWJWYoT0aUHKKRBWrF6kVta1DbvAWNBusnvfasCdFYQDn
         3vUKA+dXjGDs6NW67uARS/WIbtk04zqFdOwcm00259Hg4Xa4EtyqnONdmQEX//fBmttm
         /0azs3haKYLhkcyEoU2b3gAOIwHM5kX1t3gb5jqjyqp/GQj+HOONSWrvFzls0lY60UnY
         R78MGG3kAsoT2Hp/nwmeB+EQ70YOqL5mFUVd6uAGJ+unVqWveaV7Txl9BudmIkbZR2w4
         ez9wU61H3gwZvMgpZsmX5eeS2A36+jU6dBpErf3qfwk2QxIbN/cNicjSc4RmjgvoOlGz
         fyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIyri+jpwJVpMIMhA1b9A/4ppRSy9kvCMb+aoYF2b5g=;
        b=ROu1dRlxB2jad1JO7azj0vTYN+HBYeMAQ+DUkn5Vbc4MeyIeGe1cEIo+ewHCknfTkX
         FhciqEEm45fg+2j4BPCuctD2SK2/HOG7V0BL/JSknM1ZLBz70RUWw1lGYS1Y6YzSrOUo
         lzejwWrxSJSFQT5E7t/8NwLQfOu5zI1P83QKOEjWEB4dZse7Tj+bmvHuEOABYsnNIKMl
         ZsF8mLTEAsgLl7ZpD9r5TJ12uqlU7maWWdEi8nX8o1u9TdGnASU9wbPXAFGdme8EvyPO
         4bHfgKZGmPDcjPQgBzHwGdE/i3YYOE3j3f/qnzFFJ5u9XUBtT7LMTKpIJz+zBm/ATlO6
         7BaQ==
X-Gm-Message-State: AO0yUKU/1jpgXcutVRo7A4QjZVFbWIE9k++jITaNC990XAd/DCmE645w
        V0fp0PWbA0JBsBXo5Qq63TdHqQ==
X-Google-Smtp-Source: AK7set9G60A/vsV//7U0/2OEtUJ74i4QRkoaXB8A3mO0pasqiLnBrT0p6AzMCtEoLMIBqhoSIg248w==
X-Received: by 2002:adf:dccb:0:b0:2c7:691:18b4 with SMTP id x11-20020adfdccb000000b002c7069118b4mr10712190wrm.39.1677238727090;
        Fri, 24 Feb 2023 03:38:47 -0800 (PST)
Received: from jerome-BL.. (2a02-8440-5241-7427-e801-6f64-356d-2fd7.rev.sfr.net. [2a02:8440:5241:7427:e801:6f64:356d:2fd7])
        by smtp.gmail.com with ESMTPSA id l11-20020adff48b000000b002c592535839sm12769679wro.17.2023.02.24.03.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 03:38:46 -0800 (PST)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     linus.walleij@linaro.org, brgl@bgdev.pl, tony@atomide.com,
        lee@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org, Jerome Neanne <jneanne@baylibre.com>,
        Jonathan Cormier <jcormier@criticallink.com>
Subject: [PATCH 2/2] mfd: tps65219: Add gpio cell instance
Date:   Fri, 24 Feb 2023 12:38:37 +0100
Message-Id: <20230224113837.874264-3-jneanne@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230224113837.874264-1-jneanne@baylibre.com>
References: <20230224113837.874264-1-jneanne@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tps65219 PMIC GPIOs are exposed in a standard way:
gpiodetect
gpiochip0 [tps65219-gpio] (3 lines)

Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
---
 drivers/mfd/tps65219.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index c134f3f6e202..5ce62e480ff9 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -115,7 +115,7 @@ static const struct mfd_cell tps65219_cells[] = {
 		.resources = tps65219_regulator_resources,
 		.num_resources = ARRAY_SIZE(tps65219_regulator_resources),
 	},
-	{ .name = "tps65219-gpios", },
+	{ .name = "tps65219-gpio", },
 };
 
 static const struct mfd_cell tps65219_pwrbutton_cell = {
@@ -267,6 +267,11 @@ static int tps65219_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	if (ret) {
+		dev_err(tps->dev, "Failed to add gpio: %d\n", ret);
+		return ret;
+	}
+
 	pwr_button = of_property_read_bool(tps->dev->of_node, "ti,power-button");
 	if (pwr_button) {
 		ret = devm_mfd_add_devices(tps->dev, PLATFORM_DEVID_AUTO,
-- 
2.34.1

