Return-Path: <linux-omap+bounces-3173-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5A8A196BB
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 17:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC27A7A2877
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 16:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082B22153F0;
	Wed, 22 Jan 2025 16:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNUbR3v2"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DD0215188;
	Wed, 22 Jan 2025 16:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564104; cv=none; b=mL2lr0YUIlBPs18q4lu+kAZbn29tOhy3qCrQOo8ca23UdvJiicWF0//qcVhkyAiE3NQtyLJbZg8d6uCG0bCgI4to9v57LXsDo/1+6tNmEZj3VKSMmcH6soO9G29v0aAgjK+75k8siwPMQ9mJHq7tKUroyNdPaT46BOGEyRTb9uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564104; c=relaxed/simple;
	bh=NzRExqpkK2k3V1BJ5+RA3LQYtctyC4tI2jnse+BOts0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gHq0aJgMoghpbkPqOeTl2XuCBev2ZeVVD/+p8cc4KP4d8KB01J6UbWnIVJi0vsPajqY2SxxX0WtuqZnQkWsm0wg1EPjcp2PF2oC2TrX8JKAAsCYWgSVK4YHz/SSgvA+jJnYRbLnBdXRUcFlHEgG4dpwqd9axOxZ9cRb8EfAx4OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNUbR3v2; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so2355759a12.1;
        Wed, 22 Jan 2025 08:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737564101; x=1738168901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK+HJ7pKNRleFOF1/JHbnEYu3ZqRo0XiGD0AOm+5j54=;
        b=VNUbR3v28EpVcvzMxIDLlNgZJ3pA6eNtfQOh/LcxiJdYIz9x39q+sVIdB404BPdq8Z
         bUyL/li1/fF4Cy3fS5uiPCe4qNZmeEPv/4jn1JmcgbS1O0Q6dC0RnjZkN0Ko9XbPpu+2
         phRMFqBBrafRRdXEiyYE0emOmVmhU0OTOdr6k+E1ZXOZOH9mF0iAymT1GN0hzXT4w2S0
         +KRdQXfiPbEmk1YJssSUZQQUjNgy79QpCKPAu3ZkJQfy1dEj6eq0RAPR7f/URt5wq85h
         IG5+Z7Ku4LtJPsibYGDTmS01ga6zVBcuk7D28C7VTaEs3DjBfIGcfMT3qooLYeVO8CqR
         xjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737564101; x=1738168901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sK+HJ7pKNRleFOF1/JHbnEYu3ZqRo0XiGD0AOm+5j54=;
        b=Unac0bfB2b0F/06utIYwcfxcnJY5AjRMdPoXhjJCWjCCtSmUvU7EVs5A2jzKXW12+u
         YU7bK+e6Vs7a2fIErDSajjwszzh1AVRI01PK8D2KqdwQa1DOYLQjOVcYu7PlCNwI5Lpn
         CXtEVK0hqofvBfw+Wf6qdJZXvmiVguBAD+pzraXABwJXozps6z+ka9orxeMderS5Jt29
         /1ivSiwSOzleZALWRpafgQkwXJgvhrZMuR8R5FaLq7y08FqK4fIDCIALaUoeBupQl180
         9WFwYZKRUYdbQhsy8LP7KBn1ss8jit/UlNonthFybz6ebb0NbWUditlp6AAfEfvRMMSR
         qaUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9cNH61yQhO2cc+dXLBjhyzKLWOQayN5cxcnvbw49D+bu65O4wcMt7uWE7ADS/OkNM3R7LSSZOfykNZK8=@vger.kernel.org, AJvYcCUSPhjQTMxsCs88mj5VdTeMZFivp26pfrc6WSDuVBeBRv2sNRLfWmEaMccxboLEBjjqlRCCcUlWk7ahbQ==@vger.kernel.org, AJvYcCUl9TPOYBb8trZwdQ01sZ2IZhJubofdewwJqs8DswxpmXN4q4YhsIm38//pQEZ8KoGR9GSVENlZlw378TA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAwldWMJ6Cu/lam2500joxuA8EN5B/fbJdT9fsilBZIuswEAU7
	yL6d0k1MnMXEfCZrbdRRzn/tbk+JbJEUpxOssszbaf6f4ZnNl+JQ
X-Gm-Gg: ASbGncsRQKgaqfE94dE1hTGn8ZzjKagXInn8jfo63ozP2hfjjgysrL2khEZQQScYuYJ
	T9nhhpQBCMOEfmZKT4lMpXSXwQ/WP1liKHNWaz9bibuMt1iiBN6HIO08m+UWaL3k/8KTURfR3E5
	JhuEUgiGdjUUDd1rrtTx7ZtDokRsGEyrlS40r4c2onTOw42YaXrq6nT4LdmIgZ3o5MGZ4P1GhQr
	WgqkjhCFoPypPute76ANw1I0sAd2O/RxpQZJIHLCZLLP9WPKts8OakDgg6UWS70+D1CsAW01NRB
	oUmlbN4oDUbUXxoL
X-Google-Smtp-Source: AGHT+IFtaUrnZAFORdIcwIO23BW3nt8ER23QIneXVCJ2omKzoifty/XjhqXVBZ2P+L2DCBpUIsYlSA==
X-Received: by 2002:a05:6402:2105:b0:5d8:8292:5674 with SMTP id 4fb4d7f45d1cf-5db7dc69528mr19561635a12.7.1737564100639;
        Wed, 22 Jan 2025 08:41:40 -0800 (PST)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73642580sm8647061a12.15.2025.01.22.08.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 08:41:40 -0800 (PST)
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
Subject: [PATCH v2 2/5] ASoC: cpcap: Implement .set_bias_level
Date: Wed, 22 Jan 2025 18:41:26 +0200
Message-Id: <20250122164129.807247-3-ivo.g.dimitrov.75@gmail.com>
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

With VAUDIO regulator being always on, we have to put it in low-power mode
when codec is not in use to decrease power usage.

Do so by implementing driver .set_bias_level callback.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 sound/soc/codecs/cpcap.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 04304a7ad915..53f549ede6a6 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/mfd/motorola-cpcap.h>
 #include <sound/core.h>
 #include <sound/soc.h>
@@ -260,6 +261,7 @@ struct cpcap_audio {
 	int codec_clk_id;
 	int codec_freq;
 	int codec_format;
+	struct regulator *vaudio;
 };
 
 static int cpcap_st_workaround(struct snd_soc_dapm_widget *w,
@@ -1637,6 +1639,11 @@ static int cpcap_soc_probe(struct snd_soc_component *component)
 	snd_soc_component_set_drvdata(component, cpcap);
 	cpcap->component = component;
 
+	cpcap->vaudio = devm_regulator_get(component->dev, "VAUDIO");
+	if (IS_ERR(cpcap->vaudio))
+		return dev_err_probe(component->dev, PTR_ERR(cpcap->vaudio),
+				     "Cannot get VAUDIO regulator\n");
+
 	cpcap->regmap = dev_get_regmap(component->dev->parent, NULL);
 	if (!cpcap->regmap)
 		return -ENODEV;
@@ -1649,6 +1656,27 @@ static int cpcap_soc_probe(struct snd_soc_component *component)
 	return cpcap_audio_reset(component, false);
 }
 
+static int cpcap_set_bias_level(struct snd_soc_component *component,
+		enum snd_soc_bias_level level)
+{
+	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
+
+	switch (level) {
+	case SND_SOC_BIAS_OFF:
+		break;
+	case SND_SOC_BIAS_PREPARE:
+		regulator_set_mode(cpcap->vaudio, REGULATOR_MODE_NORMAL);
+		break;
+	case SND_SOC_BIAS_STANDBY:
+		regulator_set_mode(cpcap->vaudio, REGULATOR_MODE_STANDBY);
+		break;
+	case SND_SOC_BIAS_ON:
+		break;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver soc_codec_dev_cpcap = {
 	.probe			= cpcap_soc_probe,
 	.controls		= cpcap_snd_controls,
@@ -1657,6 +1685,7 @@ static const struct snd_soc_component_driver soc_codec_dev_cpcap = {
 	.num_dapm_widgets	= ARRAY_SIZE(cpcap_dapm_widgets),
 	.dapm_routes		= intercon,
 	.num_dapm_routes	= ARRAY_SIZE(intercon),
+	.set_bias_level		= cpcap_set_bias_level,
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
 	.endianness		= 1,
-- 
2.30.2


