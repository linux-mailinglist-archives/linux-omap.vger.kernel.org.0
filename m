Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0BA67AEDE9
	for <lists+linux-omap@lfdr.de>; Tue, 26 Sep 2023 15:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbjIZNZq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Sep 2023 09:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232437AbjIZNZp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Sep 2023 09:25:45 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5C2E6
        for <linux-omap@vger.kernel.org>; Tue, 26 Sep 2023 06:25:37 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-504427aae4fso7906738e87.1
        for <linux-omap@vger.kernel.org>; Tue, 26 Sep 2023 06:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695734735; x=1696339535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XQ+0fmcxQn7hNEx2giW0ptNoy4+ucZSflc29tgLhQk=;
        b=nqTbwMB0SgKy2vYKBDGvTSbVSKUqFDqLUOJBeXATrrnpY2D0jSD4IFU/FMlx0QHokM
         ntuj341ib9KaQTRwpyWlsA0zvHL36ZAoEglywEJWpuDgUCv9Pmk+zYsumUOf34UuFut5
         HtvRZguMXhKYc3XpvygV8IHYeLa4NuS9B/cSpBgKAH0KBo76YYdoCqCNzywh7DOW+gy3
         VPewmz/8pRshL68ULxJtw+J0BkMWgnFoKVeE0PRKks6U2g7hnsDk2Xm1S9q2S8vEDHWF
         EmLccx8NhgJi48s9zlH+uLBtrPsUVhxe3UFpBHMPpGWr4aDJeEpY5uiCi3nRjiRkFXqV
         T26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695734735; x=1696339535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XQ+0fmcxQn7hNEx2giW0ptNoy4+ucZSflc29tgLhQk=;
        b=IMwWYOZoyfQhhDU3/yqT8jpCY/JBu4ax4iunvyINZWnOcHmt7cLwcduoGKhMNZB0qH
         ZQTwvmCzXnTeTuFqt5CO2hNloHpcb/2F24ERh1832trOm7BZG0w7MoO7MW8Sl7vGDX1K
         Q1vPLtCK4R/MtDrmhyYAITzFGPgZv+rikuQovHdswNVuDfIc+afcaAfrD53g5c3cBqfV
         4FTUwVhPgK7eYRCNqFAscT0ybtmq9mpYVgAt/UHZcYYvb++rzN/HDc2FVvUOarEcU/9R
         JcjsOC1hTzhMguxM0IEgtK/ewk1AfeaFrSHFkQ6y0gCk4klhEi74Uw/kN8CzsDPSTcuh
         liyg==
X-Gm-Message-State: AOJu0YwnnnW/z+p6iYpnp6b1X8TERS9/U4A2OnrY7aUnojMKh5b0trEN
        dFZ/r7lxvCFEGHl9ROnsdothrA==
X-Google-Smtp-Source: AGHT+IFPY5U0WllM4x+pCqepZzgVMk893pXwxBLYC4R7FotIFz3M4lxB3pAWd8pzSINV2/2J4ivVlA==
X-Received: by 2002:ac2:4c45:0:b0:501:c6d8:6029 with SMTP id o5-20020ac24c45000000b00501c6d86029mr998788lfk.33.1695734735650;
        Tue, 26 Sep 2023 06:25:35 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id eq25-20020a056512489900b0050307bf2bcdsm2221540lfb.247.2023.09.26.06.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 06:25:35 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Sep 2023 15:25:29 +0200
Subject: [PATCH 1/5] ASoC: ti: Convert N810 ASoC to GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-descriptors-asoc-ti-v1-1-60cf4f8adbc5@linaro.org>
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

The N810 uses GPIO descriptors pretty much exclusively, but not
for ASoC, so let's fix it. Register the pins in a descriptor table
in the machine since the ASoC device is not using device tree.

Use static locals for the GPIO descriptors because I'm not able
to experient with better state storage on any real hardware. Others
using the N810 can come afterwards and improve this.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap2/board-n8x0.c | 10 ++++++++++
 sound/soc/ti/n810.c              | 31 +++++++++++++++++--------------
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board-n8x0.c
index 8e3b5068d4ab..31755a378c73 100644
--- a/arch/arm/mach-omap2/board-n8x0.c
+++ b/arch/arm/mach-omap2/board-n8x0.c
@@ -498,6 +498,15 @@ struct menelaus_platform_data n8x0_menelaus_platform_data = {
 	.late_init = n8x0_menelaus_late_init,
 };
 
+static struct gpiod_lookup_table nokia810_asoc_gpio_table = {
+	.dev_id = "soc-audio",
+	.table = {
+		GPIO_LOOKUP("gpio-0-15", 10, "headset", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-80-111", 21, "speaker", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 static int __init n8x0_late_initcall(void)
 {
 	if (!board_caps)
@@ -505,6 +514,7 @@ static int __init n8x0_late_initcall(void)
 
 	n8x0_mmc_init();
 	n8x0_usb_init();
+	gpiod_add_lookup_table(&nokia810_asoc_gpio_table);
 
 	return 0;
 }
diff --git a/sound/soc/ti/n810.c b/sound/soc/ti/n810.c
index ed217b34f846..71a2a90bad2b 100644
--- a/sound/soc/ti/n810.c
+++ b/sound/soc/ti/n810.c
@@ -15,14 +15,14 @@
 #include <sound/soc.h>
 
 #include <asm/mach-types.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/platform_data/asoc-ti-mcbsp.h>
 
 #include "omap-mcbsp.h"
 
-#define N810_HEADSET_AMP_GPIO	10
-#define N810_SPEAKER_AMP_GPIO	101
+static struct gpio_desc *n810_headset_amp;
+static struct gpio_desc *n810_speaker_amp;
 
 enum {
 	N810_JACK_DISABLED,
@@ -187,9 +187,9 @@ static int n810_spk_event(struct snd_soc_dapm_widget *w,
 			  struct snd_kcontrol *k, int event)
 {
 	if (SND_SOC_DAPM_EVENT_ON(event))
-		gpio_set_value(N810_SPEAKER_AMP_GPIO, 1);
+		gpiod_set_value(n810_speaker_amp, 1);
 	else
-		gpio_set_value(N810_SPEAKER_AMP_GPIO, 0);
+		gpiod_set_value(n810_speaker_amp, 0);
 
 	return 0;
 }
@@ -198,9 +198,9 @@ static int n810_jack_event(struct snd_soc_dapm_widget *w,
 			   struct snd_kcontrol *k, int event)
 {
 	if (SND_SOC_DAPM_EVENT_ON(event))
-		gpio_set_value(N810_HEADSET_AMP_GPIO, 1);
+		gpiod_set_value(n810_headset_amp, 1);
 	else
-		gpio_set_value(N810_HEADSET_AMP_GPIO, 0);
+		gpiod_set_value(n810_headset_amp, 0);
 
 	return 0;
 }
@@ -327,14 +327,19 @@ static int __init n810_soc_init(void)
 	clk_set_parent(sys_clkout2_src, func96m_clk);
 	clk_set_rate(sys_clkout2, 12000000);
 
-	if (WARN_ON((gpio_request(N810_HEADSET_AMP_GPIO, "hs_amp") < 0) ||
-		    (gpio_request(N810_SPEAKER_AMP_GPIO, "spk_amp") < 0))) {
-		err = -EINVAL;
+	n810_headset_amp = devm_gpiod_get(&n810_snd_device->dev,
+					  "headphone", GPIOD_OUT_LOW);
+	if (IS_ERR(n810_headset_amp)) {
+		err = PTR_ERR(n810_headset_amp);
 		goto err4;
 	}
 
-	gpio_direction_output(N810_HEADSET_AMP_GPIO, 0);
-	gpio_direction_output(N810_SPEAKER_AMP_GPIO, 0);
+	n810_speaker_amp = devm_gpiod_get(&n810_snd_device->dev,
+					  "speaker", GPIOD_OUT_LOW);
+	if (IS_ERR(n810_speaker_amp)) {
+		err = PTR_ERR(n810_speaker_amp);
+		goto err4;
+	}
 
 	return 0;
 err4:
@@ -351,8 +356,6 @@ static int __init n810_soc_init(void)
 
 static void __exit n810_soc_exit(void)
 {
-	gpio_free(N810_SPEAKER_AMP_GPIO);
-	gpio_free(N810_HEADSET_AMP_GPIO);
 	clk_put(sys_clkout2_src);
 	clk_put(sys_clkout2);
 	clk_put(func96m_clk);

-- 
2.34.1

