Return-Path: <linux-omap+bounces-1324-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F658B78CC
	for <lists+linux-omap@lfdr.de>; Tue, 30 Apr 2024 16:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44B851F22E68
	for <lists+linux-omap@lfdr.de>; Tue, 30 Apr 2024 14:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1098320127D;
	Tue, 30 Apr 2024 14:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ovWkDryA"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAE21C9ECE
	for <linux-omap@vger.kernel.org>; Tue, 30 Apr 2024 14:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714485804; cv=none; b=I3yeafDjEiFYCj3SZIYGv4Ke73T60dMns+AZia0YSrJ/RIHmi3Zt7qBSyoXpBK8KL+ECiYynsnGBY97qqCWyoq42PtAlxpIrvtjI/hwbun/Yk5wikZkp7N/DKIo/3P+uHWsnAWW56mg62TYm9ZjZWabxcKM5N9/Z0tUapyX8h2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714485804; c=relaxed/simple;
	bh=2L2Sd/bZA9DPmGMKb1blU4asO9ABeFUMOyqlFuFMjDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U3wImXmK/7Q9k0WHGwCTg/8xZ8PbDlspjRDH8ZRWU8SlvKes5+rfTpCZDKmTTJzTZzv/kwraSMEhkZHSbLvK8VFApILav6KhWBWMXsM+t4LREeOouF+APBHCagwFZhPk+Zc3ISfPeU7PdvHJ41B/zmkTjTrgfFJ5zLsviEZ+nwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ovWkDryA; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a5883518135so651529366b.3
        for <linux-omap@vger.kernel.org>; Tue, 30 Apr 2024 07:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485797; x=1715090597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWJR2WoIWwHgA1WyLmTI5AFP9P56iC3vbRDROZEp3Cc=;
        b=ovWkDryAi9hNgXJLkL9nKOPjgHzI2OsrE9ChwGtFoQH8etYJaloV69GO7bJB5xJ5wm
         LWNE7rodEUJdNML+5kVwG2B0Rb4Ta5vk4pkOkn5WTOWAh+NNQz/L2lghkB6uzUn6C8Lz
         rQl4tbZoMdBJ4Uiu/hPK34rgC7KlISVxRSNzQqXzUkZ9TEem9pltgF0RJ+XEvLadXO3x
         M8BoaaIhI/yb3U7hTdlzjnZiZ7u1TO0bUEdr/J6jujnIrog6lWIjbspoV3o30q8GoXOl
         8RU0wmehf89UyXy4e8OFPy2xHT++nev272joGKHSIR10KGxnrkjnVM6LnZL1wOnsdXPd
         qFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485797; x=1715090597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWJR2WoIWwHgA1WyLmTI5AFP9P56iC3vbRDROZEp3Cc=;
        b=QsJcSD9s84OghhF+WUGQbbBpkebohlq0mNojP7GZcZFm51RoLQlubs1wqXcYJu1shq
         pMovNcm4LS0CwA+RUs33Ame060W2hfb+/oC6JPW9aAlInLt6uSh6pDluizWW81piIuNN
         j1cFvncMRoYJGPuQ0WPBB/lYeguvQLemYN58LJXKv7Wyj8buq4pnswUkKF7yn3lcWrCv
         64criKQ9h3EgevOy0iH+M6zvE2TiYfmueBKLbW0iYOxrc3xp/Bx6KG5wc8le4moP/K6s
         oTFosxfreiOqQX4bZZcqVPWl6if/M4couiPcg6+KmKt2HJ0EDtcBUYUDRF5tr+/47cS7
         mf1w==
X-Forwarded-Encrypted: i=1; AJvYcCXNPxprK1mvspXoPtQNxJs1PXnj+YB/yJivR9izsMho3xfAkj3zRsR7hrVL+av8F59UcoqYDvS8jswvQ7MlkfxIiB5C1GpBrgAQFA==
X-Gm-Message-State: AOJu0YwlsiT/dOlUFnpQmXKStKcs4OdCqGNniIWWAETm5m4kmcbJwUYq
	mfM+wi9DBiI/vYm9RceZs6FMGJM0TyAEvmVOCJwgP9gruwSLmtFZJUMRFSaOrVY=
X-Google-Smtp-Source: AGHT+IGzpv19AvraaJONqek/5WZ+vpK0ygTzaKpESURpr1fKUPncz+rrCHoTLxWTmS70O2gF9usxBg==
X-Received: by 2002:a17:906:fb19:b0:a46:cef3:4aba with SMTP id lz25-20020a170906fb1900b00a46cef34abamr6908081ejb.75.1714485797197;
        Tue, 30 Apr 2024 07:03:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:20 +0200
Subject: [PATCH 11/13] ASoC: meson: Use snd_soc_substream_to_rtd() for
 accessing private_data
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-11-6f8a8902b479@linaro.org>
References: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
In-Reply-To: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Ban Tao <fengzheng923@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2L2Sd/bZA9DPmGMKb1blU4asO9ABeFUMOyqlFuFMjDE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn2JvN54IaqcYA5GLEuMvhDQe+mNVTJTI3Tr
 QdG3HJ5mpaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59gAKCRDBN2bmhouD
 197sD/4lVw4vRS0TaJQoEqN1/VKp4Q9D5lysYmYFjuJDSklcrh+mHGjmHyG95rjuMpfUp5WdZ9F
 iytvncSSC/Cuz5v/Jf8fvm3m9JjwXFFBP5Lc4SMyVJAeiWnSKjzxXSJpUg4BiTtCWCFACQ+V2Bb
 YGk8kFBRlLhu+hIsRVvO7YExMVKSyWC+LUviOI2MtzsH1IZm+J1MJ32ygUWTM2XfMun8P6JaMaS
 zdUyUnJjZrzCI9/u7V7zlNe7qD1tuI5xufOqCOiAa6z0lCBNjRJeSVaVzniiHsE9d/ko9UTugjE
 fj2ylpg5b6Vgg5XqItpdB+YsDKsAIWOpQw+4DM9EyACs1+eZoj3ODueF18BqqnON9iBFHyQC+PS
 tFWPcxkNUPvKTgBAo35M7FSPkECi12I5S4WqPZrRjoTs1lUtOhRGq3DjzGjtxPPe1fgDGvsk4Mf
 4VM/tTJWrMOhnmX9/Vm3iZWKyJcLwmff0kZYETc6VVP4YKbsUIvlZbkhmLuh4EY05gpbzW/i98e
 2SqiRpAD6/3HhVAbX7RcNsQAFGYv0XBd6/7ewRdKkn2ly0KIqT3t5dloWm1fn8iCmzLrSnDN+mR
 h9asUnfi+hgioFVTE27PhDIzW+cxFlTOVreYfN8Fh5JIFmJW8FNL9xUzP6zwTdjGwt18Z9Ey1s3
 y25Qq5uL4jC7B2Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Do not open-code snd_soc_substream_to_rtd().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/meson/aiu-fifo.c | 2 +-
 sound/soc/meson/axg-fifo.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index 4041ff8e437f..b222bde1f61b 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -25,7 +25,7 @@
 
 static struct snd_soc_dai *aiu_fifo_dai(struct snd_pcm_substream *ss)
 {
-	struct snd_soc_pcm_runtime *rtd = ss->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(ss);
 
 	return snd_soc_rtd_to_cpu(rtd, 0);
 }
diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index bebee0ca8e38..1ead5ebc84c4 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -46,7 +46,7 @@ static struct snd_pcm_hardware axg_fifo_hw = {
 
 static struct snd_soc_dai *axg_fifo_dai(struct snd_pcm_substream *ss)
 {
-	struct snd_soc_pcm_runtime *rtd = ss->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(ss);
 
 	return snd_soc_rtd_to_cpu(rtd, 0);
 }

-- 
2.43.0


