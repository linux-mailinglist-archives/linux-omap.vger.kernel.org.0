Return-Path: <linux-omap+bounces-2914-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D599FDA47
	for <lists+linux-omap@lfdr.de>; Sat, 28 Dec 2024 12:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9EBE7A1C86
	for <lists+linux-omap@lfdr.de>; Sat, 28 Dec 2024 11:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7ED017C990;
	Sat, 28 Dec 2024 11:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5CWRcPI"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7080E16A92E;
	Sat, 28 Dec 2024 11:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735386347; cv=none; b=P45VNMh96HTRw5mGawYZWUimhTBiGsxso/w6alq64jIaf2IyWTOLg5Gu4Ur2IkkD13aduRVqweMxIwNddp3FfhrcdUaB5Dpgz8wWhfbUEIIxPaOSlSf7Ur7ogj3iF1FodLK2z3wYZQKPwSF4s55vp2nMaMuaVpcEpzyn/pinU0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735386347; c=relaxed/simple;
	bh=I+XbE+O1GMpNXKOjk7mDvRYZZ5SHkdDbzIw7sXcb4cg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U2vXHtNufjM0bQWiBFZ46g4UDQaz+zR7CTT8KjzOHCOfJNh0C5KCv9aHZeR+8nQXtQkxWkrGdxDy/jW4NxqLbN2IDP0mzCl9vGaLIi56kDLM6HPIQBzKTlTMp+nDP09XuGdKCCpLi/vQPbdoSNtkgOHbQTSpYjq0i+/xnK1FcOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5CWRcPI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso52456195e9.0;
        Sat, 28 Dec 2024 03:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735386344; x=1735991144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBw8BVSD11OXwlS6ruYnSHe7nASCCdh0cfHlL7Ue7jw=;
        b=a5CWRcPIjhbsBCgkpJf43Vv6+EzHNsvL1qNy0GLdregabGejGt8qJkAdjeTbqWjQr6
         T6gfnUFcfX8YwjI/ySIrz0ufP2kIuTGyD8kSy2HHfV2GUviLACA4dH0KnQvV/qIv/EHd
         YaZcKFDJkX1KdIeWrejO1MClRNatEGML7SrrG4wMMas7McAyFvdPPPn653sLMTtSTvQL
         zv7W/u9EdEQmXd2hc3SZG7ZFTOm93QWeSkby9hsbYYI7Z5So43TUaVnhSpedXS9XB06I
         7O/2JTiT5VYFSyHK3Cqi/8B1XriNG8xbKoazdDeoVw0i2wPNr1pv7kyj9tkh+Fv358EW
         WDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735386344; x=1735991144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBw8BVSD11OXwlS6ruYnSHe7nASCCdh0cfHlL7Ue7jw=;
        b=U5I4gmqFkmC9gXNf2VJXCYfknH9Z8Rgo1y/pdBmcsu6IM1Lr4WMLP5iGURCNufxD1a
         llZNLXKVoLBvErkJnmxuHgHanWSCTV+V5IHY4R7YmmxbV96RgL0uAr0IMGN+o1dheobf
         E1cqMXjULSqGGhlgpB/uICz/016ZzrzRiRJKGAjrf8rExknbtT7SuX9G0Ts908ZErOjx
         mfhVMIFEsHgnCEyQzFgWdblWXeLlGe6P0y+5YFFr7DLssfs4JhiT+rDT51nHC828UcVF
         0/qOnxy88LWIm2+y0lu9++QGNrDhijFdFTg0FMhMypjXGr97c/yDYxQ33IFwQgXj3011
         tPcw==
X-Forwarded-Encrypted: i=1; AJvYcCVKI3GJ5AfyDECbXj6r/w+QYCBJDI64mhKdT4wihRqOM3MrhJAdhmYJN/C+A8bG3C7hm5s+1stqCnurqCA=@vger.kernel.org, AJvYcCWCZ+OEJLFTmCkA36Ocw5q2p1m65SEmo1zBLwcnqah6267myARV7OTBLxDDoqnLdB05M3R6H+ntBu58inU=@vger.kernel.org, AJvYcCWTE74cPxywlc9+gSPYiZYu5bC8FdgGVgxegATh46HkVKoZOhJ3GL3hYzznUsTvxqZFIlrBlOQRuYLOOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbrgOyUNgec1Lehtvt/YbBeFMtpnhpVgc0+PxE7a1V/HYZKjBX
	mDFygzcSAe/0nLoasT7K5jgBNNrpXSJgdOmLaWzlSdaKcqza70Q3
X-Gm-Gg: ASbGncuvvd7sPAzo4Z2N2U4Lh35DbAJgievDK47iw8I8WUttxhpB5dyltyfvbmmO9gn
	ZHSO5wD3DLCO72ilWNmP0bb8NPQksEG5miyPfkYShiDcE8u2AKGrPNtFfVA4PeG8QtX4Dwie5g+
	igmibyIMP9AluaShsPxZKyqJ9YAIOEK1EpAWfc7HMrdlGRRVTWgVrN2Hkzr5KLDIYpvHc3m5uOb
	ZiQjrmQOS6DitYWy7t+EwA1Hw6KqZzDNKZveXH4EvH3jzo4mE1LHM547MNru4Hp0yM9O5+tdnqT
	c8E=
X-Google-Smtp-Source: AGHT+IEX4aaEt5f72x3lb7XK5hUpQgAUH/yAKwqBjzghvpNV66dC3oP6NufsGD6tFeTfXcW3P/Ejlg==
X-Received: by 2002:a05:600c:3596:b0:434:f1bd:1e40 with SMTP id 5b1f17b1804b1-436697f917fmr248830325e9.6.1735386343639;
        Sat, 28 Dec 2024 03:45:43 -0800 (PST)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436604e9c2csm295344975e9.43.2024.12.28.03.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 03:45:43 -0800 (PST)
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
Subject: [PATCH 5/5] ASoC: cpcap: Implement jack detection
Date: Sat, 28 Dec 2024 13:45:14 +0200
Message-Id: <20241228114514.91594-6-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241228114514.91594-1-ivo.g.dimitrov.75@gmail.com>
References: <20241228114514.91594-1-ivo.g.dimitrov.75@gmail.com>
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
index 53f549ede6a6..82c14ba6e8bc 100644
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
+/* Register 9 - CPCAP_REG_INTS2   --- Interrupt Sense 1 */
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


