Return-Path: <linux-omap+bounces-1327-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DC88B78D3
	for <lists+linux-omap@lfdr.de>; Tue, 30 Apr 2024 16:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FA9AB2261F
	for <lists+linux-omap@lfdr.de>; Tue, 30 Apr 2024 14:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22BF210193;
	Tue, 30 Apr 2024 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LKEH6q2H"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB1B201243
	for <linux-omap@vger.kernel.org>; Tue, 30 Apr 2024 14:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714485806; cv=none; b=BsZZ9iGEY1rC9b4/hXBX0tTWy2/kcoNwGKygm86h2Is0nLu4vTJthakdRk86TFxhdNdH0b6YvwjS2sG0hh2WaoVab6ncN0Y9aDbmNHhqbcxgt4sz7ui5JDMJP9Yz9E7SA8kfK0isYejaRIva9khCHQyuLviJuiASuszismxKw3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714485806; c=relaxed/simple;
	bh=skJQwkduJ0UqVILLbpIVR8oru+2QUc2pKBYrAAVKHLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LRfmVrECEsIt1wUDGbV3BYaSn8nyaQ03hlrhiDAYiCq1BriWWGDd0z7RBXwSgf0BVqmj7B4dOeMA+CT4hsqAs+mgCPor49OIdm4jn/2Iuh5b9GxJgauAlkp2tUy5fo9TjmBKdJTTugkPWl0iuQQtvSjH9iPfb9LN9wqG8WJpclg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LKEH6q2H; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a5872b74c44so646259266b.3
        for <linux-omap@vger.kernel.org>; Tue, 30 Apr 2024 07:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485802; x=1715090602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yC31R3m8W6wP+grnNVF/H3dyhG6qnKQukTpoDRo2U3E=;
        b=LKEH6q2Hw1mKS2oplomzGEuGnO94ttqC57D1d3xMNBgR0DcC1YyeZ2E5T7p1ZF5h+5
         ZPwYWk5xe16+qswAaD0/7CdUuUvogrbYp9YLbR+JWZEOpq8lYVLyCVVaijP88L9EkPuH
         dPdwshharOYpIglQaxV3b3tqpaxj3ucFvGqCsy7cMBi/N2ve50FOjoZwzBIW8Ak+fW/Q
         BaxAv/hH8wIseK7Xj9vWvr1aVVojsKFh84ijuWDnYM/d0Os6sqbuBx40hQbyiC/WHKDb
         23wZgNqdTXcn3T+o2giU4KviHWva2SAG8/E/wTsPQn3lfYihgtwG84om5DavUL4YxU17
         kALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485802; x=1715090602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yC31R3m8W6wP+grnNVF/H3dyhG6qnKQukTpoDRo2U3E=;
        b=gJZjf93BEtb19wHnScrGVGCHqpLCfFymXsKioRPE92zkh7xA2gNbqk0mc44iDEibEy
         O6R7gFiewpVK3AdO/doixpcVz+c5mH6iV7UV9PnuZhHb/B0/Ul1+SfZxXAY9XewxMepJ
         zPa+Wh/CuF7oUnmf7ci/BZQJlFWE4KL7h8pGOSo3DowHHEVlRzZgsOXliPhbsM92p/2m
         +GkbhxvgOjKB8rrI+5asE11Lj64q4wB8hqwBrnjfeB+T1T4yDkJDmNYFcNlo0OVTbQsX
         ZweCCyVr+WlqXP2RF7ZsEKuMoZQ6yfU8gInxPJwHzsF82Fd0RMSkWDoIGq9IcIwbiU9H
         pBiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmHCutVAT6LsyVwSsinZwBqBsNPzSyXR3VMUgmr29ZA8Y0UGWWUhhVlAEpQ05iazsS8hg0MmL11FJlNsmvv373PeWgL1dgwyI6zA==
X-Gm-Message-State: AOJu0YzM6E4PdwEYFx0Wy/iTQ89iMqEzaqkbzaaxbL2yJF8Jf+vivFju
	7cdsbkDPnJhHuh4Cw/i+3jRKEkHZZfO+8P7SbP68LHUMgDuwYsmZgGsoWX0Gx0E=
X-Google-Smtp-Source: AGHT+IHSymzbs0C8MGLs3EVai6AvWaGt9IGpYcAnz/QtQsZ0owRN86WOYk4l43txKHjNaleFCNL96Q==
X-Received: by 2002:a17:906:b78c:b0:a58:ff19:1bd7 with SMTP id dt12-20020a170906b78c00b00a58ff191bd7mr4814671ejb.24.1714485802359;
        Tue, 30 Apr 2024 07:03:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:22 +0200
Subject: [PATCH 13/13] ASoC: sunxi: Use snd_soc_substream_to_rtd() for
 accessing private_data
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-13-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=skJQwkduJ0UqVILLbpIVR8oru+2QUc2pKBYrAAVKHLI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn42nKdNBa2rMr1pgKaAGhX7w0XUyPtyKW9V
 bUEsOjG4LCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD5+AAKCRDBN2bmhouD
 147DD/4ieg9gyFCb0g9PJBqL29gkEXs/qxtb2TaodG03VYLhq+fFzv2vOzJZhszAb1VOkS8eI0F
 KlbKY9lyGbdzA1h6zSNA0p/UgvlOtsdv4xC+0KT0yy7TXAza83A9DSl1qDnkNTdOFgc42e1+9FU
 eaGGfDloUavMXd6rNB7SRZMQRcm41b47P/mRzEa2cA1bjkAlrlBm6NwPeVLP5A/Kcr3Tb3EZ2pI
 HgLvCY5h27fuJYugwmxUMfqOjXMdWLx9SSAQ5yfhuYZZBgKU100MiFOvcW2nlDlhncmjU0WcU5t
 H7ySW9GYOdqAqEkELNGxb97j0Ov7StcHdE1uz4YmdansE+m8dNQTp3CaZ4LdH2+2TFF/sP4aynu
 H2GUeJKaC1N/Ng+cEI1h0gMDXKbR8qyTg+SjoM6i7+5UP1I2coCVMYrneh2dpEyJOp9MNFOvj5d
 UzzEQMRQeFilQTHwB3xynjKLIUqJbjhqfafH5A0FECh/lb7OoM+PTU7VciDC4L/s1Xl/NOiJCnq
 69WLOXnti2pJsaGzvUMsSHAlokIA+7NRIpUewkiHs/lN9zgB7QfsX/zvrQTookURZBTMehAN/cd
 yW7Vl73L2bSpn6CppvaD8hpkm5+NhqYeNWbMxnKsVdyQiMo84C2YNgI+3cBxRRpVQUYuh98RXgk
 h6j6UQIf5KNOdKQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Do not open-code snd_soc_substream_to_rtd().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/sunxi/sun50i-dmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index c76628bc86c6..fedfa4fc95fb 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -74,7 +74,7 @@ static const struct dmic_rate dmic_rate_s[] = {
 static int sun50i_dmic_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	/* only support capture */

-- 
2.43.0


