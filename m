Return-Path: <linux-omap+bounces-3176-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4B0A196C4
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 17:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3656E163FF0
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 16:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E6D215F6C;
	Wed, 22 Jan 2025 16:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ht36CnJx"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E423215780;
	Wed, 22 Jan 2025 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564108; cv=none; b=BT0jXngKbq5EzaCCG2D/cTAvhR23gLVR+gYif2zlLHtxYYqesTFusrnshn5MxTnr+RKTHUIrHxnWRGtoiDIPVgPqZAAmSpsBde+8jm+Go3LdLLXBgh/BTzorsEw/jhIPCjkZyWuPy8jGg1quGylu6NB7OJI7vvdXyij80WM15UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564108; c=relaxed/simple;
	bh=fyLy/vZjco4PRjdJG3nWihhqDObvGLzrPgQeIouYvVM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FWzF8M2ZnSC78xASptgVrrHGsI7p8jYNIuCKxbvlzPEAWJMKLVoGLeXjzivZGplk2kiNgcNCD1sYHWNDJ6dKUIfksboDhOOJPgHeOp00F2gfgfGiDxnI2UFh+rjzQpq0krYG3hj/tNJm4tr6qtU1NjVf9pxFvzD8oEFVPLb7lzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ht36CnJx; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so12002743a12.2;
        Wed, 22 Jan 2025 08:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737564105; x=1738168905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8KmBOGMVD87OSi+izI42gTXfv8egfKFz47YiWRpqDE=;
        b=Ht36CnJx3rC3USKYenhMY17UPEQR429Id7UiL71tMgyqxGeI84XJeUIB+TS/xZU9Gt
         YB/HWYydvil6pgk4rALIl1zUI2SAco5Pu7lLp+tGhBR1ELfaYYS4vXm8XmTvylR/N839
         +ManW2KW1qRdBQNq/OR3305CgQIN5bErzRaVTHymb2hisnJ9XercttJUiQfsFEeTLJbk
         ceR0eQqZcuVCLr9iwuiO6gcIo3x2LHuHakMq1b5CF1BcLO8nEBZFM68qp2H5CkqmlYgm
         qU1LLYZI3XGKFao/quCT2bIgAAZdAnXLhLWgcXkFfKVKkqpeD5Ldva6/KdhWDj81qUlP
         g6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737564105; x=1738168905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8KmBOGMVD87OSi+izI42gTXfv8egfKFz47YiWRpqDE=;
        b=GzlbwOSBL3FLk/WsBuW0rjBt+VDYh4TaOF8OtGZI+cBgMlw61ru8SK/TzG6fJ6sySB
         uAtqoZVDNnDnG87xLudnpl1m7ads+PxvbzdBJUV7N7iwmvemakiNTzrZdGqS/Thne5dQ
         WD+/f5TD362m17EmDYn6eJSJZGpHgakKYauU7ZX73w6bd9spqkpULivEXLIZiBrT6OEX
         4lJIIkGI3wgTT1EVSYVdbXBW6SHNf6wfwGbksR4ZslqFHaYvCUNfhcxzw+Em510rqvSA
         A8q6JfJFZF/Q8zRt+n4L7CG0Bw+v4IWEqjwBmqj0w5zWYNghNelVyVyzjzVElw+pOj3p
         ldhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP9/Pr+9t5sqdrR0oiBR4S/tXxH6VF2tSeOcYMhlcREjT4sy9rhr3zJFOVdSuXCgQuuIE8KPnkYN4zlg==@vger.kernel.org, AJvYcCW+kCF/tuy0ctopYWQfiddQLKGafJWbrlcEFAu/W4/Cuq7iGPJuVgHmmYOKpy8iUVT2K97LlGtC0p300fk=@vger.kernel.org, AJvYcCWB2sB7LMG0gmUPQ2S0XzyttjlD8KlmlNUf8FZMxLo7uyZWFM5L1SaFkbVg/nqJ3kGOlR3KzabA5MHt9yE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcgTAUb8oEntmZN9YAb8g2CHkFujx6fzIOzD0Y9eLWPznElLp2
	lrNostzND+1peDMBw1pKMDMThNwven3L9nAlx7aRK6rjVDUGHNmZ
X-Gm-Gg: ASbGncuwfIoQTMaYmU5fHoNCAvPjRMWcw4DUIXMgYtBCxOAqXZicWWKu4ajZtPdWoWF
	M+Bk+sxSrxPYPxwN/tPB4y+peIOvOK8nTtBzwJ6rIa6c3F3GWASDkHg5Ik9icjeR22NDUmVij6p
	bKPJvKFuYJoHRg6U9fNlK9MXS6CV1z+zziKXvGRhrtXZaYfZg9rFywCDcO8KIo1RjuRJYc1rTyy
	6n1GbIbVJNCdom2D8wTrs52EvJbDOsoI7+G3VLcTAiUSxESJ+4NikzdwuHZjw74OMJXfN8wyZIP
	LeXrxBVF/499QyX1
X-Google-Smtp-Source: AGHT+IF4YMq+hMP7AxAhdTzDXsLB4StAV6ZC+iG75qBfXBG3506kY7SGVBVmQNqH+ZSiGEujkwixSA==
X-Received: by 2002:a05:6402:3550:b0:5d3:ce7f:abee with SMTP id 4fb4d7f45d1cf-5db7db08623mr20774711a12.25.1737564104481;
        Wed, 22 Jan 2025 08:41:44 -0800 (PST)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73642580sm8647061a12.15.2025.01.22.08.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 08:41:44 -0800 (PST)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v2 5/5] ASoC: cpcap: Implement jack detection
Date: Wed, 22 Jan 2025 18:41:29 +0200
Message-Id: <20250122164129.807247-6-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
References: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpcap has headphones/microphone and PTT button detection logic, implement
code to support it.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 sound/soc/codecs/cpcap.c | 171 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 170 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 53f549ede6a6..3eb862643b53 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -14,9 +14,18 @@
 #include <linux/regulator/consumer.h>
 #include <linux/mfd/motorola-cpcap.h>
 #include <sound/core.h>
+#include <linux/input.h>
+#include <sound/jack.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
 
+/* Register 8 - CPCAP_REG_INTS1  --- Interrupt Sense 1 */
+#define CPCAP_BIT_HS_S                    9  /* Headset */
+#define CPCAP_BIT_MB2_S                   10 /* Mic Bias2 */
+
+/* Register 9 - CPCAP_REG_INTS2   --- Interrupt Sense 2 */
+#define CPCAP_BIT_PTT_S                   11 /* Push To Talk */
+
 /* Register 512 CPCAP_REG_VAUDIOC --- Audio Regulator and Bias Voltage */
 #define CPCAP_BIT_AUDIO_LOW_PWR           6
 #define CPCAP_BIT_AUD_LOWPWR_SPEED        5
@@ -262,6 +271,9 @@ struct cpcap_audio {
 	int codec_freq;
 	int codec_format;
 	struct regulator *vaudio;
+	int hsirq;
+	int mb2irq;
+	struct snd_soc_jack jack;
 };
 
 static int cpcap_st_workaround(struct snd_soc_dapm_widget *w,
@@ -1628,14 +1640,105 @@ static int cpcap_audio_reset(struct snd_soc_component *component,
 	return 0;
 }
 
+static irqreturn_t cpcap_hs_irq_thread(int irq, void *data)
+{
+	struct snd_soc_component *component = data;
+	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
+	struct regmap *regmap = cpcap->regmap;
+	int status = 0;
+	int mask = SND_JACK_HEADSET;
+	int val;
+
+	if (!regmap_test_bits(regmap, CPCAP_REG_INTS1, BIT(CPCAP_BIT_HS_S))) {
+		val = BIT(CPCAP_BIT_MB_ON2) | BIT(CPCAP_BIT_PTT_CMP_EN);
+		regmap_update_bits(regmap, CPCAP_REG_TXI, val, val);
+
+		val = BIT(CPCAP_BIT_ST_HS_CP_EN);
+		regmap_update_bits(regmap, CPCAP_REG_RXOA, val, val);
+
+		regulator_set_mode(cpcap->vaudio, REGULATOR_MODE_NORMAL);
+
+		/* Give PTTS time to settle */
+		msleep(20);
+
+		if (!regmap_test_bits(regmap, CPCAP_REG_INTS2,
+				      BIT(CPCAP_BIT_PTT_S))) {
+			/* Headphones detected. (May also be a headset with the
+			 * MFB pressed.)
+			 */
+			status = SND_JACK_HEADPHONE;
+			dev_info(component->dev, "HP plugged in\n");
+		} else if (regmap_test_bits(regmap, CPCAP_REG_INTS1,
+					    BIT(CPCAP_BIT_MB2_S)) == 1) {
+			status = SND_JACK_HEADSET;
+			dev_info(component->dev, "HS plugged in\n");
+		} else
+			dev_info(component->dev, "Unsupported HS plugged in\n");
+	} else {
+		bool mic = cpcap->jack.status & SND_JACK_MICROPHONE;
+
+		dev_info(component->dev, "H%s disconnect\n", mic ? "S" : "P");
+		val = BIT(CPCAP_BIT_MB_ON2) | BIT(CPCAP_BIT_PTT_CMP_EN);
+		regmap_update_bits(cpcap->regmap, CPCAP_REG_TXI, val, 0);
+
+		val = BIT(CPCAP_BIT_ST_HS_CP_EN);
+		regmap_update_bits(cpcap->regmap, CPCAP_REG_RXOA, val, 0);
+
+		regulator_set_mode(cpcap->vaudio, REGULATOR_MODE_STANDBY);
+
+		mask |= SND_JACK_BTN_0;
+	}
+
+	snd_soc_jack_report(&cpcap->jack, status, mask);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t cpcap_mb2_irq_thread(int irq, void *data)
+{
+	struct snd_soc_component *component = data;
+	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
+	struct regmap *regmap = cpcap->regmap;
+	int status = 0;
+	int mb2;
+	int ptt;
+
+	if (regmap_test_bits(regmap, CPCAP_REG_INTS1, BIT(CPCAP_BIT_HS_S)) == 1)
+		return IRQ_HANDLED;
+
+	mb2 = regmap_test_bits(regmap, CPCAP_REG_INTS1, BIT(CPCAP_BIT_MB2_S));
+	ptt = regmap_test_bits(regmap, CPCAP_REG_INTS2, BIT(CPCAP_BIT_PTT_S));
+
+	/* Initial detection might have been with MFB pressed */
+	if (!(cpcap->jack.status & SND_JACK_MICROPHONE)) {
+		if (ptt == 1 && mb2 == 1) {
+			dev_info(component->dev, "MIC plugged in\n");
+			snd_soc_jack_report(&cpcap->jack, SND_JACK_MICROPHONE,
+					    SND_JACK_MICROPHONE);
+		}
+
+		return IRQ_HANDLED;
+	}
+
+	if (!mb2 || !ptt)
+		status = SND_JACK_BTN_0;
+
+	snd_soc_jack_report(&cpcap->jack, status, SND_JACK_BTN_0);
+
+	return IRQ_HANDLED;
+}
+
 static int cpcap_soc_probe(struct snd_soc_component *component)
 {
+	struct platform_device *pdev = to_platform_device(component->dev);
+	struct snd_soc_card *card = component->card;
 	struct cpcap_audio *cpcap;
 	int err;
 
 	cpcap = devm_kzalloc(component->dev, sizeof(*cpcap), GFP_KERNEL);
 	if (!cpcap)
 		return -ENOMEM;
+
 	snd_soc_component_set_drvdata(component, cpcap);
 	cpcap->component = component;
 
@@ -1644,6 +1747,16 @@ static int cpcap_soc_probe(struct snd_soc_component *component)
 		return dev_err_probe(component->dev, PTR_ERR(cpcap->vaudio),
 				     "Cannot get VAUDIO regulator\n");
 
+	err = snd_soc_card_jack_new(card, "Headphones",
+				    SND_JACK_HEADSET | SND_JACK_BTN_0,
+				    &cpcap->jack);
+	if (err < 0) {
+		dev_err(component->dev, "Cannot create HS jack: %i\n", err);
+		return err;
+	}
+
+	snd_jack_set_key(cpcap->jack.jack, SND_JACK_BTN_0, KEY_MEDIA);
+
 	cpcap->regmap = dev_get_regmap(component->dev->parent, NULL);
 	if (!cpcap->regmap)
 		return -ENODEV;
@@ -1653,7 +1766,58 @@ static int cpcap_soc_probe(struct snd_soc_component *component)
 	if (err)
 		return err;
 
-	return cpcap_audio_reset(component, false);
+	cpcap->hsirq = platform_get_irq_byname(pdev, "hs");
+	if (cpcap->hsirq < 0)
+		return cpcap->hsirq;
+
+	err = devm_request_threaded_irq(component->dev, cpcap->hsirq, NULL,
+					cpcap_hs_irq_thread,
+					IRQF_TRIGGER_RISING |
+					IRQF_TRIGGER_FALLING |
+					IRQF_ONESHOT,
+					"cpcap-codec-hs",
+					component);
+	if (err) {
+		dev_warn(component->dev, "no HS irq%i: %i\n",
+			 cpcap->hsirq, err);
+		return err;
+	}
+
+	cpcap->mb2irq = platform_get_irq_byname(pdev, "mb2");
+	if (cpcap->mb2irq < 0)
+		return cpcap->mb2irq;
+
+	err = devm_request_threaded_irq(component->dev, cpcap->mb2irq, NULL,
+					cpcap_mb2_irq_thread,
+					IRQF_TRIGGER_RISING |
+					IRQF_TRIGGER_FALLING |
+					IRQF_ONESHOT,
+					"cpcap-codec-mb2",
+					component);
+	if (err) {
+		dev_warn(component->dev, "no MB2 irq%i: %i\n",
+			 cpcap->mb2irq, err);
+		return err;
+	}
+
+	err = cpcap_audio_reset(component, false);
+	if (err)
+		return err;
+
+	cpcap_hs_irq_thread(cpcap->hsirq, component);
+
+	enable_irq_wake(cpcap->hsirq);
+	enable_irq_wake(cpcap->mb2irq);
+
+	return 0;
+}
+
+static void cpcap_soc_remove(struct snd_soc_component *component)
+{
+	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
+
+	disable_irq_wake(cpcap->hsirq);
+	disable_irq_wake(cpcap->mb2irq);
 }
 
 static int cpcap_set_bias_level(struct snd_soc_component *component,
@@ -1661,6 +1825,10 @@ static int cpcap_set_bias_level(struct snd_soc_component *component,
 {
 	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
 
+	/* VAIDIO should be kept in normal mode in order MIC/PTT to work */
+	if (cpcap->jack.status & SND_JACK_MICROPHONE)
+		return 0;
+
 	switch (level) {
 	case SND_SOC_BIAS_OFF:
 		break;
@@ -1679,6 +1847,7 @@ static int cpcap_set_bias_level(struct snd_soc_component *component,
 
 static const struct snd_soc_component_driver soc_codec_dev_cpcap = {
 	.probe			= cpcap_soc_probe,
+	.remove			= cpcap_soc_remove,
 	.controls		= cpcap_snd_controls,
 	.num_controls		= ARRAY_SIZE(cpcap_snd_controls),
 	.dapm_widgets		= cpcap_dapm_widgets,
-- 
2.30.2


