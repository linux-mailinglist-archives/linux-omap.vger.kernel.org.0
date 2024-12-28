Return-Path: <linux-omap+bounces-2912-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D17469FDA3E
	for <lists+linux-omap@lfdr.de>; Sat, 28 Dec 2024 12:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABFD01883673
	for <lists+linux-omap@lfdr.de>; Sat, 28 Dec 2024 11:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3D8166F0C;
	Sat, 28 Dec 2024 11:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3WFk4kx"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2596515A86A;
	Sat, 28 Dec 2024 11:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735386344; cv=none; b=UzNaHlWkWmeDvRKQjsf2EHG5+RV4K1nD/Q8ItrOixv85QLcbNPjvaGxukfZHjREv2bmCtLEIzqUHulHUSfYi8JKZ/YC7jsIV38BwVucy6Vle31IF89kafdnav3bK8toSzKos+gQbzEvgZQmsKQJKBSv/5grU0zh485to5l7UyQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735386344; c=relaxed/simple;
	bh=NzRExqpkK2k3V1BJ5+RA3LQYtctyC4tI2jnse+BOts0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aOzUVcctW0F+JShsZx9PyndqxB/E8Eh+X2xcVRHBWuZfjKSy7k/s49gxBCZoNMeW5hS+1r+ckuLg9cdZU3ppV9b/DrxRIYvCU3GnOUlgk1rBdg1qJbhL5r1BkFddWzaRXPw5CZ9pdJ017yeJKDP/PvgYBHihQSl3gMCX/iWp7oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3WFk4kx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43621d27adeso54384535e9.2;
        Sat, 28 Dec 2024 03:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735386339; x=1735991139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK+HJ7pKNRleFOF1/JHbnEYu3ZqRo0XiGD0AOm+5j54=;
        b=D3WFk4kxuXbZJwLH71vnu6Qmp2pKGPpvkAYS1KjyXvsSuqBjR8/x/ZIOhZe+7WIIAf
         ODbF60VMFAQr7YdsuNTDm2DerKBby6uAP4JPCKCYyjqXwiXuCKieXqQcj6D39jqSOFDJ
         FtWkUIGxuW0pyg+Wgc/cuyphVx0Tj1pRL3+4aG+cI9Qz4QtMxxBOhehMmFMw1NiMxAr1
         lM/LQl3nMQkVwgOdhcj6Esk53kXXyGcQcbdnzLr3jg0FFDQtKt2s2r860k7UaCaGWZ5v
         L0+7pqGw4TwNRhusHV8Q9xeOfUMiX99QCiNMFNOyOFEbmmeFz++4RDLIHBO5hN2rGhe1
         D42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735386339; x=1735991139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sK+HJ7pKNRleFOF1/JHbnEYu3ZqRo0XiGD0AOm+5j54=;
        b=legeVGxUcuX+1QYVw3i0KnpOq8/SgI+xT+RZiQvGyl23V5xzdW1HLNy0bmQuSAwWh2
         ObzchnkZBWoXHOF3AHIO1tBU3eB242MgwnH6mK0dHOIa/4b1KLP+yGiGv+99Fn8xAVdW
         IW1GTXDO9GPMPwzwamjpPWFDpc5LML/JmYW1/hqyth+13/Ihx1f3CNn1SpSgKAoWYB65
         H71RR9ETOTlR4rZ+yVgfgjV7kMOhDui6nwbnKxMbFLnhurLfN/ZVluppYFZosUcGunBy
         VU8TYaxBEYdkurx4q58ogkh0KVp0YvXItl5lJ69CMvanB4a2igWT6/Lqk4tfC+K13ozO
         6NAA==
X-Forwarded-Encrypted: i=1; AJvYcCUP836/1FGL9txqfRbD9lzEAwO0Xmh+IOhuJBIDejrp3NdM0/LvFkxknxv5cSY4vJd4S5E4DcvvF4GGIg==@vger.kernel.org, AJvYcCUSoR2CJMaReZxt+63vAhpZQbrpaDMlOqP35qfJAyS9EOsYGi80qrLhgwYFXBeu3i6hSgQQEInXFnuST4s=@vger.kernel.org, AJvYcCX6bTt/xmBrT/2thQDAnTavz5VIc6rW11EUbaDx8YfKxf4EXIhiL9nAb0GXpoC4or2BUfk6TMF+nDHHyFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnNx+8j+8u8ivImhkmBM/EyAX/4eHqtt7lAXAira+maxbls464
	Q5OD1X7yxk6JRZk8RoUwCyDXh0TSVU1HpvBt5keVvc5+Nju9FhQ1
X-Gm-Gg: ASbGncvUhpT+ESEkg9ZR2CQV6Wsq1cEG0WKr76znJgfkpnjISbw0hS3UvsbIY3qCKMI
	ejCmTwvqPAhn0xzNz4T4vrTiC3jfHtNiwPwWmyRZOnHsu24cdITNp+0DRT3jD9ZL88+nCBP1ObL
	Q3wFLKn78hwh3xMGGj1a1A+8GFLvkeCoE121geJA+UXr72xtinxid36t4ndgI0Vz4zEAGzxsQt/
	COMnXERfkXu9f+QzO/6b+gYEpSGXRY29z9BxIu28DXNj4Qjnq+lpRM7BPJu0KgcAQ42PAYs6xDr
	cu0=
X-Google-Smtp-Source: AGHT+IFq98uSaqZeHXs3HN51svibaMg0jD14Q06JIIubPHUOyYQ7RJvCZUtyN00T/MouHjbER294oQ==
X-Received: by 2002:a05:600c:138d:b0:434:a852:ba6d with SMTP id 5b1f17b1804b1-43668642fa8mr259919855e9.9.1735386339393;
        Sat, 28 Dec 2024 03:45:39 -0800 (PST)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436604e9c2csm295344975e9.43.2024.12.28.03.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 03:45:39 -0800 (PST)
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
Subject: [PATCH 2/5] ASoC: cpcap: Implement .set_bias_level
Date: Sat, 28 Dec 2024 13:45:11 +0200
Message-Id: <20241228114514.91594-3-ivo.g.dimitrov.75@gmail.com>
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


