Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13414AD657
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 12:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390205AbfIIKHZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Sep 2019 06:07:25 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:56024 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728993AbfIIKHY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Sep 2019 06:07:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=zX7d5tNh9pcuT2TAK18zG/gSN+A4mBlh5BXib2G7T7M=; b=SMbhGbPGVEOR
        6ExVZ5Czk6At2nP4YJZMJsV+H+Mt4jFvFrYHtd+54QHfevbmQvMtto0pRQmM9uPHYiI2ZzJK0vBjU
        o53o61ykCw7YpZQCt/VhH4lutejnjx5rMJZsjFbs+EEsSXDJxQbIJyx8dyumKVwkdp8vTCGTYPZNG
        j5r3k=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1i7GZq-0001sL-4p; Mon, 09 Sep 2019 10:07:18 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id 7F4E7D02D5A; Mon,  9 Sep 2019 11:07:17 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>, alsa-devel@alsa-project.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-omap@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Applied "ASoC: ams-delta: Take control over audio mute GPIO pins" to the asoc tree
In-Reply-To: <20190907111650.15440-1-jmkrzyszt@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190909100717.7F4E7D02D5A@fitzroy.sirena.org.uk>
Date:   Mon,  9 Sep 2019 11:07:17 +0100 (BST)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The patch

   ASoC: ams-delta: Take control over audio mute GPIO pins

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 73681f4f1426847b421649c6aa6c2dc303acc7c8 Mon Sep 17 00:00:00 2001
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Date: Sat, 7 Sep 2019 13:16:50 +0200
Subject: [PATCH] ASoC: ams-delta: Take control over audio mute GPIO pins

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
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20190907111650.15440-1-jmkrzyszt@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm/mach-omap1/board-ams-delta.c | 10 +++++----
 sound/soc/ti/ams-delta.c              | 31 +++++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 36498ea1b2f3..c2affc727967 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -245,8 +245,8 @@ static struct platform_device latch2_gpio_device = {
 #define LATCH2_PIN_SCARD_CMDVCC		11
 #define LATCH2_PIN_MODEM_NRESET		12
 #define LATCH2_PIN_MODEM_CODEC		13
-#define LATCH2_PIN_AUDIO_MUTE		14
-#define LATCH2_PIN_HOOKFLASH		15
+#define LATCH2_PIN_HANDSFREE_MUTE	14
+#define LATCH2_PIN_HANDSET_MUTE		15
 
 static struct regulator_consumer_supply modem_nreset_consumers[] = {
 	REGULATOR_SUPPLY("RESET#", "serial8250.1"),
@@ -475,6 +475,10 @@ static struct gpiod_lookup_table ams_delta_audio_gpio_table = {
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
@@ -589,8 +593,6 @@ static int gpiochip_match_by_label(struct gpio_chip *chip, void *data)
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
2.20.1

