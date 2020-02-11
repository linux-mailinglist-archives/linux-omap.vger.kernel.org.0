Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C19031597C7
	for <lists+linux-omap@lfdr.de>; Tue, 11 Feb 2020 19:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728592AbgBKSKL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Feb 2020 13:10:11 -0500
Received: from muru.com ([72.249.23.125]:54794 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727764AbgBKSKL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 11 Feb 2020 13:10:11 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BCA5080D4;
        Tue, 11 Feb 2020 18:10:53 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        "Arthur D ." <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] ASoC: cpcap: Implement set_tdm_slot for voice call support
Date:   Tue, 11 Feb 2020 10:10:05 -0800
Message-Id: <20200211181005.54008-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

For using cpcap for voice calls, we need to route audio directly from
the modem to cpcap for TDM (Time Division Multiplexing). The voice call
is direct data between the modem and cpcap with no CPU involvment. In
this mode, the cpcap related audio mixer controls work for the speaker
selection and volume though.

To do this, we need to implement standard snd_soc_dai_set_tdm_slot()
for cpcap. Then the modem codec driver can use snd_soc_dai_set_sysclk(),
snd_soc_dai_set_fmt(), and snd_soc_dai_set_tdm_slot() to configure a
voice call.

Let's add cpcap_voice_set_tdm_slot() for this, and cpcap_voice_call()
helper to configure the additional registers needed for voice call.

Let's also clear CPCAP_REG_VAUDIOC on init in case we have the bit for
CPCAP_BIT_VAUDIO_MODE0 set on init.

Cc: Arthur D. <spinal.by@gmail.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 sound/soc/codecs/cpcap.c | 123 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -16,6 +16,14 @@
 #include <sound/soc.h>
 #include <sound/tlv.h>
 
+/* Register 512 CPCAP_REG_VAUDIOC --- Audio Regulator and Bias Voltage */
+#define CPCAP_BIT_AUDIO_LOW_PWR           6
+#define CPCAP_BIT_AUD_LOWPWR_SPEED        5
+#define CPCAP_BIT_VAUDIOPRISTBY           4
+#define CPCAP_BIT_VAUDIO_MODE1            2
+#define CPCAP_BIT_VAUDIO_MODE0            1
+#define CPCAP_BIT_V_AUDIO_EN              0
+
 /* Register 513 CPCAP_REG_CC     --- CODEC */
 #define CPCAP_BIT_CDC_CLK2                15
 #define CPCAP_BIT_CDC_CLK1                14
@@ -221,6 +229,7 @@ struct cpcap_reg_info {
 };
 
 static const struct cpcap_reg_info cpcap_default_regs[] = {
+	{ CPCAP_REG_VAUDIOC, 0x003F, 0x0000 },
 	{ CPCAP_REG_CC, 0xFFFF, 0x0000 },
 	{ CPCAP_REG_CC, 0xFFFF, 0x0000 },
 	{ CPCAP_REG_CDI, 0xBFFF, 0x0000 },
@@ -1370,6 +1379,119 @@ static int cpcap_voice_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
+/*
+ * Configure codec for voice call if requested.
+ *
+ * We can configure most with snd_soc_dai_set_sysclk(), snd_soc_dai_set_fmt()
+ * and snd_soc_dai_set_tdm_slot(). This function configures the rest of the
+ * cpcap related hardware as CPU is not involved in the voice call.
+ */
+static int cpcap_voice_call(struct cpcap_audio *cpcap, struct snd_soc_dai *dai,
+			    bool voice_call)
+{
+	int mask, err;
+
+	/* Modem to codec VAUDIO_MODE1 */
+	mask = BIT(CPCAP_BIT_VAUDIO_MODE1);
+	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_VAUDIOC,
+				 mask, voice_call ? mask : 0);
+	if (err)
+		return err;
+
+	/* Clear MIC1_MUX for call */
+	mask = BIT(CPCAP_BIT_MIC1_MUX);
+	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_TXI,
+				 mask, voice_call ? 0 : mask);
+	if (err)
+		return err;
+
+	/* Set MIC2_MUX for call */
+	mask = BIT(CPCAP_BIT_MB_ON1L) | BIT(CPCAP_BIT_MB_ON1R) |
+		BIT(CPCAP_BIT_MIC2_MUX) | BIT(CPCAP_BIT_MIC2_PGA_EN);
+	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_TXI,
+				 mask, voice_call ? mask : 0);
+	if (err)
+		return err;
+
+	/* Enable LDSP for call */
+	mask = BIT(CPCAP_BIT_A2_LDSP_L_EN) | BIT(CPCAP_BIT_A2_LDSP_R_EN);
+	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_RXOA,
+				 mask, voice_call ? mask : 0);
+	if (err)
+		return err;
+
+	/* Enable CPCAP_BIT_PGA_CDC_EN for call */
+	mask = BIT(CPCAP_BIT_PGA_CDC_EN);
+	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_RXCOA,
+				 mask, voice_call ? mask : 0);
+	if (err)
+		return err;
+
+	/* Unmute voice for call */
+	if (dai) {
+		err = snd_soc_dai_digital_mute(dai, !voice_call,
+					       SNDRV_PCM_STREAM_PLAYBACK);
+		if (err)
+			return err;
+	}
+
+	/* Set modem to codec mic CDC and HPF for call */
+	mask = BIT(CPCAP_BIT_MIC2_CDC_EN) | BIT(CPCAP_BIT_CDC_EN_RX) |
+	       BIT(CPCAP_BIT_AUDOHPF_1) | BIT(CPCAP_BIT_AUDOHPF_0) |
+	       BIT(CPCAP_BIT_AUDIHPF_1) | BIT(CPCAP_BIT_AUDIHPF_0);
+	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_CC,
+				 mask, voice_call ? mask : 0);
+	if (err)
+		return err;
+
+	/* Enable modem to codec CDC for call*/
+	mask = BIT(CPCAP_BIT_CDC_CLK_EN);
+	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_CDI,
+				 mask, voice_call ? mask : 0);
+
+	return err;
+}
+
+static int cpcap_voice_set_tdm_slot(struct snd_soc_dai *dai,
+				    unsigned int tx_mask, unsigned int rx_mask,
+				    int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
+	int err, ts_mask, mask;
+	bool voice_call;
+
+	/*
+	 * Primitive test for voice call, probably needs more checks
+	 * later on for 16-bit calls detected, Bluetooth headset etc.
+	 */
+	if (tx_mask == 0 && rx_mask == 1 && slot_width == 8)
+		voice_call = true;
+	else
+		voice_call = false;
+
+	ts_mask = 0x7 << CPCAP_BIT_MIC2_TIMESLOT0;
+	ts_mask |= 0x7 << CPCAP_BIT_MIC1_RX_TIMESLOT0;
+
+	mask = (tx_mask & 0x7) << CPCAP_BIT_MIC2_TIMESLOT0;
+	mask |= (rx_mask & 0x7) << CPCAP_BIT_MIC1_RX_TIMESLOT0;
+
+	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_CDI,
+				 ts_mask, mask);
+	if (err)
+		return err;
+
+	err = cpcap_set_samprate(cpcap, CPCAP_DAI_VOICE, slot_width * 1000);
+	if (err)
+		return err;
+
+	err = cpcap_voice_call(cpcap, dai, voice_call);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 static int cpcap_voice_set_mute(struct snd_soc_dai *dai, int mute)
 {
 	struct snd_soc_component *component = dai->component;
@@ -1391,6 +1513,7 @@ static const struct snd_soc_dai_ops cpcap_dai_voice_ops = {
 	.hw_params	= cpcap_voice_hw_params,
 	.set_sysclk	= cpcap_voice_set_dai_sysclk,
 	.set_fmt	= cpcap_voice_set_dai_fmt,
+	.set_tdm_slot	= cpcap_voice_set_tdm_slot,
 	.digital_mute	= cpcap_voice_set_mute,
 };
 
-- 
2.25.0
