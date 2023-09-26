Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 332167AEDEA
	for <lists+linux-omap@lfdr.de>; Tue, 26 Sep 2023 15:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbjIZNZq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Sep 2023 09:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjIZNZp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Sep 2023 09:25:45 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9550B101
        for <linux-omap@vger.kernel.org>; Tue, 26 Sep 2023 06:25:38 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5041335fb9cso14071136e87.0
        for <linux-omap@vger.kernel.org>; Tue, 26 Sep 2023 06:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695734737; x=1696339537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQREjlFdBBHyFFcqZ7B0gSxB7/oIU5kFAtRf/hN0PRg=;
        b=ffhWtff7BOQVYOSwv121Ol3vNNPlSOc7qiCXXa837pZRFirr1//M7WZHdsVTqMr3pG
         h9WjH77hd6bPFstYYEYWiJ7+z+ZU4xYBq5dCAWGHISIuOp6dBMIYhNKsyFt3siygHSv0
         fEJdaVIF+m4HysE2QgRycVq6LCW8kpIeZYnIqn7RmEcR9xx/JiXDJQkYKbhjN3ScliJs
         SVfSFwVNWHtz2KufAR3/0PCHVzaxz6LKezifpYLrcOltpP7E9DWIBXHj4hE/w4y5181n
         DJXhh9QNxJMAMt31G4+OS4N+joIRUETXAngVVIyIXzVU6o1dcDMPmfGfAmV0EINLJqUL
         rThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695734737; x=1696339537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQREjlFdBBHyFFcqZ7B0gSxB7/oIU5kFAtRf/hN0PRg=;
        b=UcojEFdTUU2UhfohuZEipNlHcoEEEokDk1d1uFP3uSBG+RHXhQ1zAkRaIORivLZRcG
         /NHb7y7+7IUEU2JyqzOgFKLwQHowJZGGfOg9jMve0kKUlNbVktHmW2bYcebyiFEe7SNF
         N+Gk2XWKrTOc4TwFCWQyAotSGNGPD0yf6pef4bpmna2AyZCGvt8z2dadxyLS05h5l6NF
         Nz5tfEr/zLKb5Rk7/O7XWvx87LlJwozr+2vJm/KEZKx5EarRSX6ApXkKh7sj4RBjtrrk
         /vvi4n3/nAQifTMJwZCPLuxpLGKkd52HnlZdEzeTq6ipKz/+C2BDrgpeE4b8C/bQQ1GU
         vf8g==
X-Gm-Message-State: AOJu0Yzx8Bc6REQkGdh2lRSrPLzBObd0r/U0oi4zscxM1XMdqxg6hbaO
        sP3HAxTk04iDCjlMsShJr3WzvQ==
X-Google-Smtp-Source: AGHT+IHMuys/v1z41Pq9CuIIy/ftelPDGx7bWyJ6wtsGQexyv6AD5OHzXbCy8nEIXF0Y020uO07SZQ==
X-Received: by 2002:a05:6512:104f:b0:500:b7dc:6c90 with SMTP id c15-20020a056512104f00b00500b7dc6c90mr9505051lfb.36.1695734736594;
        Tue, 26 Sep 2023 06:25:36 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id eq25-20020a056512489900b0050307bf2bcdsm2221540lfb.247.2023.09.26.06.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 06:25:36 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Sep 2023 15:25:30 +0200
Subject: [PATCH 2/5] ASoC: ti: Convert RX51 to use exclusively GPIO
 descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-descriptors-asoc-ti-v1-2-60cf4f8adbc5@linaro.org>
References: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
In-Reply-To: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
To:     Tony Lindgren <tony@atomide.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        alsa-devel@alsa-project.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The RX51/Nokia n900 uses the legacy GPIO header to convert a GPIO
back to the global GPIO numberspace and then the jack using it
in the snd_soc_jack_add_gpios() call immediately looks up the
corresponding descriptor again.

The snd_soc_jack_add_gpios() handles GPIOs passed with devices
just fine: pass in the device instead, and rename the GPIO
to match the property in the device tree, and it should work
all the same but without all the trouble.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/ti/rx51.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index 322c398d209b..047f852c79a9 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -10,7 +10,6 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/platform_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -33,7 +32,6 @@ enum {
 
 struct rx51_audio_pdata {
 	struct gpio_desc *tvout_selection_gpio;
-	struct gpio_desc *jack_detection_gpio;
 	struct gpio_desc *eci_sw_gpio;
 	struct gpio_desc *speaker_amp_gpio;
 };
@@ -198,7 +196,7 @@ static struct snd_soc_jack rx51_av_jack;
 
 static struct snd_soc_jack_gpio rx51_av_jack_gpios[] = {
 	{
-		.name = "avdet-gpio",
+		.name = "jack-detection",
 		.report = SND_JACK_HEADSET,
 		.invert = 1,
 		.debounce_time = 200,
@@ -263,7 +261,6 @@ static const struct snd_kcontrol_new aic34_rx51_controls[] = {
 static int rx51_aic34_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct rx51_audio_pdata *pdata = snd_soc_card_get_drvdata(card);
 	int err;
 
 	snd_soc_limit_volume(card, "TPA6130A2 Headphone Playback Volume", 42);
@@ -283,9 +280,9 @@ static int rx51_aic34_init(struct snd_soc_pcm_runtime *rtd)
 		return err;
 	}
 
-	/* prepare gpio for snd_soc_jack_add_gpios */
-	rx51_av_jack_gpios[0].gpio = desc_to_gpio(pdata->jack_detection_gpio);
-	devm_gpiod_put(card->dev, pdata->jack_detection_gpio);
+	rx51_av_jack_gpios[0].gpiod_dev = card->dev;
+	/* Name is assigned in the struct */
+	rx51_av_jack_gpios[0].idx = 0;
 
 	err = snd_soc_jack_add_gpios(&rx51_av_jack,
 				     ARRAY_SIZE(rx51_av_jack_gpios),
@@ -425,14 +422,6 @@ static int rx51_soc_probe(struct platform_device *pdev)
 		return PTR_ERR(pdata->tvout_selection_gpio);
 	}
 
-	pdata->jack_detection_gpio = devm_gpiod_get(card->dev,
-						    "jack-detection",
-						    GPIOD_ASIS);
-	if (IS_ERR(pdata->jack_detection_gpio)) {
-		dev_err(card->dev, "could not get jack detection gpio\n");
-		return PTR_ERR(pdata->jack_detection_gpio);
-	}
-
 	pdata->eci_sw_gpio = devm_gpiod_get(card->dev, "eci-switch",
 					    GPIOD_OUT_HIGH);
 	if (IS_ERR(pdata->eci_sw_gpio)) {

-- 
2.34.1

