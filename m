Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47BE5AC647
	for <lists+linux-omap@lfdr.de>; Sat,  7 Sep 2019 13:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbfIGLR0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 7 Sep 2019 07:17:26 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34087 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfIGLR0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 7 Sep 2019 07:17:26 -0400
Received: by mail-lj1-f195.google.com with SMTP id h2so1831328ljk.1
        for <linux-omap@vger.kernel.org>; Sat, 07 Sep 2019 04:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rb/yzZzQwRQ8fy1RC3CpSGeeNV/NzBEBHsdpVswPgSk=;
        b=s7luqUqoYTSiz38spY75YXIBcpWyiH5eaY1MtZubo/nnuTlbgm5e9h+LQARrhrYZTf
         Y66OAVdoDtYS6OMejay0lA3AngVTqHvSVkn5aJk+YSUSL8dfPhWGpLz7nYBnJhiXbWZ1
         4Y440WKDSG/ITtCPAy5PMzWeBNmsu94G1Pqhl871ljKH6IjgfGPvZfla4EPpgaV4MQMm
         88X8EfM2SBWPsbypEuymFtmKvJMR6wg+XDm3qYBewr+MOZXqxvU83/8jAQ/6F25G2AiW
         RoE+eD1Hbtb98eTPbSDf88D3qjK9JwQF6hT5jqOjkmbeJU28masTsVj2bJyzw3YsCT2a
         /wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rb/yzZzQwRQ8fy1RC3CpSGeeNV/NzBEBHsdpVswPgSk=;
        b=HVR++fZSg2QhWsBnF8VFUFpqRgy7N0HoEHHNh1FheSIiLYNcPAx8TFcQw/Vqk7wEJE
         SzEY2huzB7XGQwbUjc7WY1RYcm+gH5elS44qZ/6jvhmqrTDcR4N3nlAiHILn0/5W0azf
         IStHq40cYutfOE/IifyZqlDdrkYH9U5yFwypnrtLiynVEkN7t5uYUdodhByJUbeuiR+2
         57dgPW5+lBzpr82P2KyqUL41sBjR333/vteOeFX1Gcp+MonZqoQQioS39UVNRcumaYhA
         yHykHEIlF5A2z9XNeozhwq6GUrw/SUJtF0Q2jsKa2nfrAvHgWDucIDbNxOE4qwQIybll
         vvDQ==
X-Gm-Message-State: APjAAAUfSdKqMQakn7sidz/FUXtPIh3k2RV85coAlK2EW2P8FviYEHdU
        MIZd81OiUl6CDnxhoylzTEo=
X-Google-Smtp-Source: APXvYqyb8Nsc49DfrXMB01RwgWnIJnbgFnkeu/HYpgo5Vq+pXzAMdj4S9tqeeRIq1+TupqRaHBrqlw==
X-Received: by 2002:a2e:8814:: with SMTP id x20mr9035873ljh.221.1567855043437;
        Sat, 07 Sep 2019 04:17:23 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id c10sm1673419lfp.65.2019.09.07.04.17.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 07 Sep 2019 04:17:22 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH] ASoC: ams-delta: Take control over audio mute GPIO pins
Date:   Sat,  7 Sep 2019 13:16:50 +0200
Message-Id: <20190907111650.15440-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Since commit 1137ceee76ba ("ARM: OMAP1: ams-delta: Don't request unused
GPIOs"), on-board audio has appeared muted.  It has been discovered that
believed to be unused GPIO pins "hookflash1" and "hookflash2" need to be
set low for audible sound in handsfree and handset mode respectively.

According to Amstrad E3 wiki, the purpose of both pins hasn't been
clearly identified.  Original Amstrad software used to produce a high
pulse on them when the phone was taken off hook or recall was pressed.
With the current findings, we can assume the pins provide a kind of
audio mute function, separately for handset and handsfree operation
modes.

Commit 2afdb4c41d78 ("ARM: OMAP1: ams-delta: Fix audio permanently
muted") attempted to fix the issue temporarily by hogging the GPIO pin
"hookflash1" renamed to "audio_mute", however the fix occurred
incomplete as it restored audible sound only for handsfree mode.

Stop hogging that pin, rename the pins to "handsfree_mute" and
"handset_mute" respectively and implement appropriate DAPM event
callbacks for "Speaker" and "Earpiece" DAPM widgets.

Fixes: 1137ceee76ba ("ARM: OMAP1: ams-delta: Don't request unused GPIOs")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 arch/arm/mach-omap1/board-ams-delta.c | 10 +++++----
 sound/soc/ti/ams-delta.c              | 31 +++++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index e47a6fbcfd6e..a2aa7a12b374 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -246,8 +246,8 @@ static struct platform_device latch2_gpio_device = {
 #define LATCH2_PIN_SCARD_CMDVCC		11
 #define LATCH2_PIN_MODEM_NRESET		12
 #define LATCH2_PIN_MODEM_CODEC		13
-#define LATCH2_PIN_AUDIO_MUTE		14
-#define LATCH2_PIN_HOOKFLASH		15
+#define LATCH2_PIN_HANDSFREE_MUTE	14
+#define LATCH2_PIN_HANDSET_MUTE		15
 
 static struct regulator_consumer_supply modem_nreset_consumers[] = {
 	REGULATOR_SUPPLY("RESET#", "serial8250.1"),
@@ -476,6 +476,10 @@ static struct gpiod_lookup_table ams_delta_audio_gpio_table = {
 			    "hook_switch", 0),
 		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_MODEM_CODEC,
 			    "modem_codec", 0),
+		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_HANDSFREE_MUTE,
+			    "handsfree_mute", 0),
+		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_HANDSET_MUTE,
+			    "handset_mute", 0),
 		{ },
 	},
 };
@@ -590,8 +594,6 @@ static int gpiochip_match_by_label(struct gpio_chip *chip, void *data)
 static struct gpiod_hog ams_delta_gpio_hogs[] = {
 	GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_KEYBRD_DATAOUT, "keybrd_dataout",
 		 GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
-	GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_AUDIO_MUTE, "audio_mute",
-		 GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
 	{},
 };
 
diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index dee8fc70a64f..8e2fb81ad05c 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -23,14 +23,31 @@
 #include "omap-mcbsp.h"
 #include "../codecs/cx20442.h"
 
+static struct gpio_desc *handset_mute;
+static struct gpio_desc *handsfree_mute;
+
+static int ams_delta_event_handset(struct snd_soc_dapm_widget *w,
+				   struct snd_kcontrol *k, int event)
+{
+	gpiod_set_value_cansleep(handset_mute, !SND_SOC_DAPM_EVENT_ON(event));
+	return 0;
+}
+
+static int ams_delta_event_handsfree(struct snd_soc_dapm_widget *w,
+				     struct snd_kcontrol *k, int event)
+{
+	gpiod_set_value_cansleep(handsfree_mute, !SND_SOC_DAPM_EVENT_ON(event));
+	return 0;
+}
+
 /* Board specific DAPM widgets */
 static const struct snd_soc_dapm_widget ams_delta_dapm_widgets[] = {
 	/* Handset */
 	SND_SOC_DAPM_MIC("Mouthpiece", NULL),
-	SND_SOC_DAPM_HP("Earpiece", NULL),
+	SND_SOC_DAPM_HP("Earpiece", ams_delta_event_handset),
 	/* Handsfree/Speakerphone */
 	SND_SOC_DAPM_MIC("Microphone", NULL),
-	SND_SOC_DAPM_SPK("Speaker", NULL),
+	SND_SOC_DAPM_SPK("Speaker", ams_delta_event_handsfree),
 };
 
 /* How they are connected to codec pins */
@@ -542,6 +559,16 @@ static int ams_delta_probe(struct platform_device *pdev)
 
 	card->dev = &pdev->dev;
 
+	handset_mute = devm_gpiod_get(card->dev, "handset_mute",
+				      GPIOD_OUT_HIGH);
+	if (IS_ERR(handset_mute))
+		return PTR_ERR(handset_mute);
+
+	handsfree_mute = devm_gpiod_get(card->dev, "handsfree_mute",
+					GPIOD_OUT_HIGH);
+	if (IS_ERR(handsfree_mute))
+		return PTR_ERR(handsfree_mute);
+
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
-- 
2.21.0

