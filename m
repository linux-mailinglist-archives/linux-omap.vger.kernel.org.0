Return-Path: <linux-omap+bounces-1322-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D24EF8B78A3
	for <lists+linux-omap@lfdr.de>; Tue, 30 Apr 2024 16:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8867A28574D
	for <lists+linux-omap@lfdr.de>; Tue, 30 Apr 2024 14:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F3A1C8FD3;
	Tue, 30 Apr 2024 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="POFKTWs1"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FCF1C65E5
	for <linux-omap@vger.kernel.org>; Tue, 30 Apr 2024 14:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714485793; cv=none; b=MiFbm85Y1cwnaJ/rzUmO+87veJ/CH46JhQldrWvuVf+AmMBsKE85WelWDzbfAS/okAOjLyJgc9wQeK8V4gpNpoOzffOLjyZZkNr8rV0t0OYDj25PRaCmeiBf/WvgXx1JSOHog4fS2TJE9jF9EOPB4mR1qV+mE+KSmxy3fyzDylI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714485793; c=relaxed/simple;
	bh=XOQ3D1Q+qL3SzysXsYcm80LUwBWHBaXzmlHz6/Wj4iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WX4mPRT7PExPQzcCFsnJtl+3Yet35RJrzNyyoDU2iXTnxEeVr6nww+khbCoc7U1JoQmGdWZSVnMezsSs646GMPhcFdZ3PdBUujgUmw5WdcewQipIzybncKqF9bE2OfZ7HBBiX0roQMkJFNwRnXaaPnugKLVBx7R2wCcUVQcGjpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=POFKTWs1; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a58fbbcd77aso301127766b.2
        for <linux-omap@vger.kernel.org>; Tue, 30 Apr 2024 07:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485787; x=1715090587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJJbSwuzaR0w7NGJdc7U0qNxw71mhhvz2h+n/8bje3M=;
        b=POFKTWs12Tc02ab3xQdrltXnjezd8qZowxHju4xh8sOAvreJlbZp/nFZDi4H2rbj6U
         5DB/J8LnaCZC58y7iO6PPeLTqv8Xn1R/XC40jggUPo2zh1ozO/w/Rmai3c54meLWZftH
         rb9bYWn9s3NVXqVk78WkLrcp9lCMoGUHkqZka/5x+lJolpqVqOaUHlqgeVnBzHbYSbWs
         vtXrjyFazTXYJVQYMMWByGYWcbdTWg4mhJKxtXc13VKYMegNICZWQBUnkF4JN9PNtTXF
         xYh76YA8SV0dESMeSqr+/fVMheZM9L4mua3m/Imu2WFvpAybvusXkFEbdNmGJ9iSXpQ+
         3bzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485787; x=1715090587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJJbSwuzaR0w7NGJdc7U0qNxw71mhhvz2h+n/8bje3M=;
        b=YOqcUUcrIozrG6GFSlORKonzMfjHb98jz0BxRpVTKvWSFT4K/GhMw6AbFL+AuZCI1x
         AelpZrtfyATLbq95u9eXtQKUF0S3zfqqRwO1LNBH4MYEOcQ2w+lYCJ/TtcwMdeCUwyoC
         QelFAWJi3dc7hqK5BtzgT/YZSG0rYFeI3WKQrScE7if/6C4O/5lO3Gb69gLhTVuG+DaD
         HzV9RUzPzNxLZrwHsB+SdmitVk+E8a7We7MIfRqhhSmSt4B31LVykLiR/4iChqm9RsGn
         xZt8gD2T1nbCXIwUOLNBdX6KsFmNEqVqXpjuElydcbULDcGekM5cIrY6Y2slHde7XHeZ
         feMA==
X-Forwarded-Encrypted: i=1; AJvYcCVIQM25WR7dzepjGNxgGwQdAvntBCpLs9j/1690LQTwcxsthMglJ82wuAWMJJPPJG64Ca6uxJ+EpiTYJV7PKeRn9FA0etcgLDO2Rg==
X-Gm-Message-State: AOJu0YyehsYsEMr/DsMGy6+Y9Luf1u89iFUUkb9OgWEySMBUq/DtQRpO
	7haCpYh+5WSh/+e3Pk3rz+hwa+H7U+Fl0v0XKbobOEtaUttvKyH9GqQyQhAS2wQ=
X-Google-Smtp-Source: AGHT+IGuEd/p4bNUH8qGU+eaFSK8VAtxB3CIFoT6x1kpuMcKSCXiGNBYxe9tpKOFHZ0t3goA5+TDFQ==
X-Received: by 2002:a17:906:5d1:b0:a52:5460:a1c6 with SMTP id t17-20020a17090605d100b00a525460a1c6mr8141356ejt.48.1714485786717;
        Tue, 30 Apr 2024 07:03:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:17 +0200
Subject: [PATCH 08/13] ASoC: kirkwood: Use snd_soc_substream_to_rtd() for
 accessing private_data
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-8-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=764;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XOQ3D1Q+qL3SzysXsYcm80LUwBWHBaXzmlHz6/Wj4iY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn0JcifyNVMar6zygwpR2fCs5/vlSNdY5zrU
 P/gTARf59qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59AAKCRDBN2bmhouD
 1zGnD/4/+HNhnrisX+IxTCcgOIYVGlhMNGY5vKejxjMo983A81khcr7uNg3V39Ut/IpxeMUDDM2
 Rk6W37xxCNkLbnV8wmT6q0+6JYwo8P4avbWhlcyWX4f/X54F3DagobrxkUqSfNm3z/Ohm2iMNsI
 5ugz6Ay/15M8khl/LqKWzwuHNFkFgmxkcWkPSduL9KTHrRilAIDNLYrHPm02HPDdxNLtZNU+BHW
 HTvM9E0VR5hTDhkw7zVMnhr+YV3QpwCclGbZOhu0Cp0nBuhuyLS6jviuYyHCMCY6GkcreN+twHB
 cXmh7Xs1u91x/WYnyYmDtSjzvRIkkxVrWxw/QN9qTHQ1RYB/Xx60ra0zeLmBEmOfRz9SMfyGoUn
 vRlI/JhDNPgNBYSjjkyIBwajOY5i3uiToFIm6XjRwuDnhvfIY1W7C/uwA0GMStEoF+JFVDyw8pW
 XIHJD1hjJyGYX0RH/SbX84Zx3pQWMS27eL7z7lzWdJWctPFRnKSWOGotjeOgM72adhckEHzGgIF
 QJDjo4+G5LVVPbCJwrxnbN0CSfbzPMsVVru2jraEYMcMNH7CzrolNQXfdPgbEj/6nlHJvhm8a5t
 qifBptWPRDKql5mFD1fojt0Pdiv7EWmzeVOR/7d4Fw5AkjTCjcEbUzTHSDxxQlJZ3JQ4G9+PKsH
 o8NVxPN16vhnqFQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Do not open-code snd_soc_substream_to_rtd().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/kirkwood/kirkwood-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-dma.c b/sound/soc/kirkwood/kirkwood-dma.c
index ef00792e1d49..036b42058272 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -19,7 +19,7 @@
 
 static struct kirkwood_dma_data *kirkwood_priv(struct snd_pcm_substream *subs)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = subs->private_data;
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(subs);
 	return snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(soc_runtime, 0));
 }
 

-- 
2.43.0


