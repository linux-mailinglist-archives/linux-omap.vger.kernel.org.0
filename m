Return-Path: <linux-omap+bounces-1323-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA18B8B78AC
	for <lists+linux-omap@lfdr.de>; Tue, 30 Apr 2024 16:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 153801C22820
	for <lists+linux-omap@lfdr.de>; Tue, 30 Apr 2024 14:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316EC1C9EDE;
	Tue, 30 Apr 2024 14:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MQ+wKUqU"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D811C6887
	for <linux-omap@vger.kernel.org>; Tue, 30 Apr 2024 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714485797; cv=none; b=N3CvnuehtMnT1PBsMJB7+txn2WdD2GKlHWPVz1rDgX0Da3SW+uRteqxYSLw0s7IoS7CVcASfZzA/zEV6dqBpeDZrx7TtgJzZpXW5RngHzUO6hC7J4n429D1mTaYe3JRi5NVR+hWBQj5Hu+fsuu3P0pPcNR+s6lOpcJ906mHTW8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714485797; c=relaxed/simple;
	bh=b6kuGLsh7Fncnab7O/x1sZHKoAE2to9yOPoWLkFWFoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/VhflSAH3wt+Xtf/2VuxNllmREwS6DUI0mLGZC8Wc6/wPzRBwGlAWUFWwcwWLqEvYK/xRU2F6AQ8K8amk1iHkkvcgohmlUZcCcf9tfLG8DhWz/Z6ztHa85YIYMnOm4SrccEnm4uo7Qkuk5cQJyj07IXFf13FPlky/KW/QTUkRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MQ+wKUqU; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51abd9fcbf6so9618724e87.1
        for <linux-omap@vger.kernel.org>; Tue, 30 Apr 2024 07:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485790; x=1715090590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMdvqht5zOkDrEgl++6w26ILXUpiKeLdEJgBolPMUp4=;
        b=MQ+wKUqUdmLOnrscMQ93jwOT3v+vrGXhHU6ngSRsvl7AHAoP0p9nLGueG7E10QSF1Z
         zUSeVauiHVfgFmws6/3oJjlRtgphYI03syDm/88ZseTk46DuDTACeU95tL+UhTgDFEnJ
         QBUWXS2ND5dHfogFpWMWRd+L7xqaBbTEqgtnXSDtcvvzJvqUDLm1HFUHbUfNfj4RHXIB
         OyJCIttnfo3u/CZlRZfstz+dF6+PYC0gH5PJa0TXencg66snkcc+G4xEKai3AAcUTnVx
         44fH/1rzWdRF+X30i5WwtAylxZyS5l34k5iRgL5140cu09kONKKOsaaV0UbKdnUN6W7C
         /Rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485790; x=1715090590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMdvqht5zOkDrEgl++6w26ILXUpiKeLdEJgBolPMUp4=;
        b=PAOwBHj/QITrOrjaqUHsHe/9/V3ATyTZY6VungS5CfBLgMVvn8sIBeJew/C+IfxUEG
         9SUic5TIL57eWcKiQ/g84iFKgiQnBhRzw9RW+sRI8bByST99TiDjs8s5kskSqFpe6UM8
         tlY6IPXJPTZxGTzZOy/ZTaCIKLsvcuHiLxCGVuupsRNBtUnarKsbCBJ7TXs3hOhaAu+l
         /Pj8ZOyGCkwsTLDVFw6Fyiaz6mH2btMysNsMdv3ZBEQnkegbG28z/PNY8XZ7CBP7GP8B
         8bGgm5Xxa8f636wg4QFWlmJnh1MSuRQ5F9guVe0GgacWkBP8pbb6TgssivCfel0pfnx9
         bW0w==
X-Forwarded-Encrypted: i=1; AJvYcCVZoVv0cMKas/UbSRm/8O3riEC75TDX9PybHC1hH+18MrePi7dZ3xICX6J+dwkUg2Hd59K4lVRveP+jJy7ytVVPbdxDGMV3SAPKUg==
X-Gm-Message-State: AOJu0YxhLDdh8ra0iQtXnwIh8A6Ghh8OwRxLkAQ3EvevLkmQm0Kfy/Bh
	hlQRHIGLL0pJY4WZHijhrA3jARzU+vKvpPSRVukCD6SITaLij/LUFfGs4QTWZmg=
X-Google-Smtp-Source: AGHT+IHF9BCm3Hpto4qRWqGnR6LWsHIvsR6psO89D0oVIbNwL85POL6TwPmXMEZNmxvO3lf19inFfA==
X-Received: by 2002:a05:6512:3982:b0:519:166a:d217 with SMTP id j2-20020a056512398200b00519166ad217mr13782162lfu.32.1714485789720;
        Tue, 30 Apr 2024 07:03:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:18 +0200
Subject: [PATCH 09/13] ASoC: loongson: Use snd_soc_substream_to_rtd() for
 accessing private_data
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-9-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=b6kuGLsh7Fncnab7O/x1sZHKoAE2to9yOPoWLkFWFoc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn1MXBzjTFYW1vw+HGX+bgAlb8xjIeAN12qT
 8heTgZA8qOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59QAKCRDBN2bmhouD
 18asD/sG4cfwm5/cvMuyWs/KhNg7FPcNnM4eFOVtUPz5xnRqVF4pt6jUcKqDJjRfrq3s5JoYJ3c
 vBUD9jgSmkuB8tYCeWM/fFAOimxAXRa1keWd3xM/+KL3qsLAqkpXIdkHwS20hkhT7fIF+E2cU34
 35Ajyyg+q/q32ZXoeF+z7chz0oMLOUq3jDN4mGTO2PE/l4xWHZqC30HaBVtVZLYOr2WdfJN14l+
 YsJUUR1UBA5aXsr++f01Vf/m5pPIFSvYtRQcrp5YyZeaWVGm24AD0kDXcfdaYuSD6hlnoVB1j9K
 LlP/ODUgDC6zWb68dtVEkLXAfru4YUdiN9M9PLsBzBz0IIoe1aPihWRNB80Uyu2Z/lWy8ceeaX/
 rMUdGMoXE+1AcbqrE0sZvujjGVmL/5axnumRcAJRvAi4jE27qyDapAyfgL2FTvrC5fHHC0WF/Pe
 zkWTZpTx4al2ZotNljcAD9imjfQSGKB+Iovem2sQW+eZIGnWm6EeDiADskK/J5bROpHvWbfLRMM
 rXaqxY9WzOy+EFocuuu+Vq9ckAOOUcikB/3Y6YS/odwg7AZZA9hLSefMdTXWrnaJnScqKcP/bAw
 gRWnITyzDhtzuAN/vsyQ5gi3lbBmCYNL5XhK6oDlLe5BamoqScRwdbTHBthRDUiaLtaYXHQGkXj
 jOwKVSiBpozJEaw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Do not open-code snd_soc_substream_to_rtd().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/loongson/loongson_card.c | 2 +-
 sound/soc/loongson/loongson_dma.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index e8432d466f60..fae5e9312bf0 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -23,7 +23,7 @@ struct loongson_card_data {
 static int loongson_card_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct loongson_card_data *ls_card = snd_soc_card_get_drvdata(rtd->card);
diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
index 8090662e8ff2..4fcc2868160b 100644
--- a/sound/soc/loongson/loongson_dma.c
+++ b/sound/soc/loongson/loongson_dma.c
@@ -226,7 +226,7 @@ static int loongson_pcm_open(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_card *card = substream->pcm->card;
 	struct loongson_runtime_data *prtd;
 	struct loongson_dma_data *dma_data;

-- 
2.43.0


