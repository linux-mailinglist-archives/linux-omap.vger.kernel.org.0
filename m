Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC73F7AEDEB
	for <lists+linux-omap@lfdr.de>; Tue, 26 Sep 2023 15:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjIZNZr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Sep 2023 09:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233704AbjIZNZq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Sep 2023 09:25:46 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 794A310A
        for <linux-omap@vger.kernel.org>; Tue, 26 Sep 2023 06:25:39 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-503012f4e71so12013968e87.0
        for <linux-omap@vger.kernel.org>; Tue, 26 Sep 2023 06:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695734738; x=1696339538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PP4dsIT0hsQMnKCfQfmUy8AzAauOm+H9b2ueCh3mGC0=;
        b=sOm22iwHIneeLfztEjXX4qhZuTy9sCPxsrrZhSsyIJLL5ku+rbYJCj9vvbCJa2uPzB
         9l2uAoFcyeRZOhIg41RNYxyzS8iXPiNQhWpj/ErogkEt25FkC9TvA3yfDdEIM2AyuVSK
         Jrb+NPun47vWZA677Mnmm+s4NiITgrR1JTkyVCuMrZWvkL3riqoEIhTeD/JtWLWG/kZl
         LL8KbAvyJTBM2Fb99cl25el8DmUfzohVuiBrgT3Fe5YDwnst9UnsN7zuvp5x0kSM7L9W
         9wrdxKFZOa2MTpqroKBIz2Yvt5JnjxO86NnZAEwC3vVz+z7PSExBx1u5+a7PV1Mnyqtd
         pyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695734738; x=1696339538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PP4dsIT0hsQMnKCfQfmUy8AzAauOm+H9b2ueCh3mGC0=;
        b=g4tX+UK0xg6T1KSFvcToSuWzHRbPsStlWasntjrH2gvc/vxtxrtLbY4X5j1w2LLAoe
         ApYDCMr++PzuA2XNwjYA1jd5gpcO2HJ1e+U1j/N2YFdAkMbTfmQ+vUgsrh4l+WjPhMwm
         JwsvSXIpIn8hkSuCOs6hVj5lK2QiB3SsHrwU6qu6OPzWAvPCaN9ZmAIGQa2stw02V97W
         6t1XlB34Z3AFaw89Xd+W+dZq/ByYGgo4f8+Ob4/YOUDns9pu8bQJRnQuWYPbPJrb18de
         xEfHX9r4VzoPWPzz8WzrZC5fKO3D3N0oYJmZN3U5WICSHcdQ8RdRf3+yXkfuwadUiMk8
         if4A==
X-Gm-Message-State: AOJu0YxIGgUNxcrVU6u6/tGcS4wJJD8tFRuFrdC7b2qMMaf9rYyk1Q9m
        /mcOxOrYMbvFiABXLMN5GVR8CA==
X-Google-Smtp-Source: AGHT+IHjNjM07GGKUJBQohAZCxjfCTTm3uisP+onS6McTyzKEkNGgzi9C5o8RDP6x4JphD2R52UnRg==
X-Received: by 2002:a05:6512:304b:b0:503:2567:c42f with SMTP id b11-20020a056512304b00b005032567c42fmr1048278lfb.0.1695734737749;
        Tue, 26 Sep 2023 06:25:37 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id eq25-20020a056512489900b0050307bf2bcdsm2221540lfb.247.2023.09.26.06.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 06:25:37 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Sep 2023 15:25:31 +0200
Subject: [PATCH 3/5] ASoC: ti: Convert TWL4030 to use GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-descriptors-asoc-ti-v1-3-60cf4f8adbc5@linaro.org>
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

The TWL4030 is actually only ever populated from the device tree,
so we can just pass the right device and headphone jack GPIO name
to snd_soc_jack_add_gpios() and it will pick the right GPIO right
from the device tree.

The platform data patch is unused (no in-tree users of the pdata
method) but these can use GPIO descriptor tables rather than global
GPIO numbers if they need this.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/platform_data/omap-twl4030.h |  3 ---
 sound/soc/ti/omap-twl4030.c                | 20 ++++++++------------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/include/linux/platform_data/omap-twl4030.h b/include/linux/platform_data/omap-twl4030.h
index 0dd851ea1c72..7fcb55fe21c9 100644
--- a/include/linux/platform_data/omap-twl4030.h
+++ b/include/linux/platform_data/omap-twl4030.h
@@ -37,9 +37,6 @@ struct omap_tw4030_pdata {
 	bool	has_digimic0;
 	bool	has_digimic1;
 	u8	has_linein;
-
-	/* Jack detect GPIO or  <= 0 if it is not implemented */
-	int jack_detect;
 };
 
 #endif /* _OMAP_TWL4030_H_ */
diff --git a/sound/soc/ti/omap-twl4030.c b/sound/soc/ti/omap-twl4030.c
index 950eec44503b..c7055bb424e6 100644
--- a/sound/soc/ti/omap-twl4030.c
+++ b/sound/soc/ti/omap-twl4030.c
@@ -20,8 +20,6 @@
 #include <linux/platform_data/omap-twl4030.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -31,7 +29,6 @@
 #include "omap-mcbsp.h"
 
 struct omap_twl4030 {
-	int jack_detect;	/* board can detect jack events */
 	struct snd_soc_jack hs_jack;
 };
 
@@ -130,7 +127,7 @@ static struct snd_soc_jack_pin hs_jack_pins[] = {
 /* Headset jack detection gpios */
 static struct snd_soc_jack_gpio hs_jack_gpios[] = {
 	{
-		.name = "hsdet-gpio",
+		.name = "ti,jack-det",
 		.report = SND_JACK_HEADSET,
 		.debounce_time = 200,
 	},
@@ -151,9 +148,13 @@ static int omap_twl4030_init(struct snd_soc_pcm_runtime *rtd)
 	struct omap_twl4030 *priv = snd_soc_card_get_drvdata(card);
 	int ret = 0;
 
-	/* Headset jack detection only if it is supported */
-	if (priv->jack_detect > 0) {
-		hs_jack_gpios[0].gpio = priv->jack_detect;
+	/*
+	 * This is a bit of a hack, but the GPIO is optional so we
+	 * only want to add the jack detection if the GPIO is there.
+	 */
+	if (of_property_present(card->dev->of_node, "ti,jack-det-gpio")) {
+		hs_jack_gpios[0].gpiod_dev = card->dev;
+		hs_jack_gpios[0].idx = 0;
 
 		ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
 						 SND_JACK_HEADSET,
@@ -279,9 +280,6 @@ static int omap_twl4030_probe(struct platform_device *pdev)
 			omap_twl4030_dai_links[1].platforms->of_node = dai_node;
 		}
 
-		priv->jack_detect = of_get_named_gpio(node,
-						      "ti,jack-det-gpio", 0);
-
 		/* Optional: audio routing can be provided */
 		prop = of_find_property(node, "ti,audio-routing", NULL);
 		if (prop) {
@@ -302,8 +300,6 @@ static int omap_twl4030_probe(struct platform_device *pdev)
 
 		if (!pdata->voice_connected)
 			card->num_links = 1;
-
-		priv->jack_detect = pdata->jack_detect;
 	} else {
 		dev_err(&pdev->dev, "Missing pdata\n");
 		return -ENODEV;

-- 
2.34.1

