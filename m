Return-Path: <linux-omap+bounces-4021-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED3AF0F7D
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jul 2025 11:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B76816DD59
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jul 2025 09:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F260F23F421;
	Wed,  2 Jul 2025 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0xj1xrtP"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC889245008
	for <linux-omap@vger.kernel.org>; Wed,  2 Jul 2025 09:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447655; cv=none; b=fzDGreRWvwiZOeOpv1n744XN6WXUEfTPvQZojsGO/ecFzfa1FfOygiu3XAPtMv5EpM6+9mMkILU0BBN4m18OxTpNi5JjFG9LFXhEROS5LAFcY/ErmFrT+yrBdlliBQ1J/sXJm5dHYpqjR5x3WDcxytN8Vf64D0phZyPQc0kp0Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447655; c=relaxed/simple;
	bh=vlWos34yRED/o/ej5hygk3znQ4/3QzLL9YsUqSMGkEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n8+Ncc61oZbIY/XDk34UUEQnahaVGowJH4BnpkK8OSggDDtclQbbsoiQK1U/zI8y38c/k/mBJ4IE84CFXmhBi9rAiRfCbHV+mYC5PzpI8HSbYiNkQlwRxs7/cOkPsZh9Zn5ychub2rm/TdgJt0Sh07o55V8O98YpYEp76abByO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0xj1xrtP; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so2557557f8f.3
        for <linux-omap@vger.kernel.org>; Wed, 02 Jul 2025 02:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447652; x=1752052452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1YZckgbGxJ1hnYLvQegjvXHpxK5P631feiXbEW2g4Cw=;
        b=0xj1xrtPJMC04YUKqyVYo9cUW5+74PZKNGEJpdVwLy05vfxQ/QG/FgONOTsfc5lfGE
         qwWr1mQwXqvMmqGM/8GdAwiNH97jXzKICcdrNvkzPStrXshiZKlmPOHkrib3PqLhQoDE
         ekqIcn5oGnCDUWXLwKZ+J3FxbCsauuyqgA6g4Oz6G/cXIlq9P2jNAkKqb180OvnRVdSO
         aWq6vovTe5usH3lDFf3neIChOmRQ24Ip849eHAX1WQpICmYnnCoNYO6z7vLrRtl6RzUo
         dDadXylPFDtckhSt+eN7bOU5ljcMQittboEtDBe3UHpqBuK0Kq/5r+cdP25c31FSv4Xl
         onzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447652; x=1752052452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YZckgbGxJ1hnYLvQegjvXHpxK5P631feiXbEW2g4Cw=;
        b=HbfhLvKMV+jYaARrOsaHvmqMltBeuxFzYLME1e6Dp7SkhnoLR5IU9BGHOQIXx8+9ai
         p0DnWc6iUJ6CrpHgeBUe8NIDrEhDYOjSKh5qUYQu3HpH6LoRyPCVYF6jr+BLaRaNt5AV
         chSupyVYRibZMhk3IREgFhDnmOQxHy4m5Xijaxk+Co+2BvvqpVMaGvHwYZFIUXboyv2n
         qobPU0nlf/0ILYKZ8P6R/HcAss28ssOiC1QFw+CZrqOCpdqJulMalSDrrAHEq67JYMww
         CnuP815sQ1AX/cxVrFnAZiViZ6AwjdSHiJRVEDYwLsyDdAtHfcHid2QXyWZH9JoLRM+Y
         6M3A==
X-Forwarded-Encrypted: i=1; AJvYcCXatFKxZ4/gRLem9gwVW9zyUPkhUIC626JNvss1hsW6hTOTpa5586KZWEuI+snFT+G1/0x+C8fGImb2@vger.kernel.org
X-Gm-Message-State: AOJu0YznY5mOwZhAtSo4Knk7U3QU7x4LMLuxzs/SHGGthWqssALp1L+s
	9wNnbyIbSqQQqW9wEGVorOTJ8dhznHW75DT0T0+5/ntxSeCq/vvz8xg8MnD3WcH9Pmw=
X-Gm-Gg: ASbGncur7+XTbXM/ujZWfwKrxgcPyr+Ozx2Wg2yBClAyIGVFna6swSAG6X72EkSv3lC
	3tYjHEJZ+DkbkJBqVocL9XkdIMQkUuJk7NZOn3/5LdcjZQoDdIAmuVmJgJRWRVqDviPPNQX+Avb
	r3ET6jVIvfzn2Rw8FR4/mBl6WLHnFj5VyU1I4aU5fOFTY6fxPFU/FaQgcoFI3RivS1GMuA4zGoC
	6oDa5tlvng7EAyQEE94zEKTtxWg9Tp2i++5c+1njbe7wVQcu5kpZ6olIYbo47xV3175bvPwqY4O
	BkfYqxoM3H1IBC01B3xb29IpwYRUqtkfwyp/ygTtFzWjBZK/b1HUjw==
X-Google-Smtp-Source: AGHT+IFLfzi/BCJ/h+mSdQ9xGwiNV5G7jBvFCAXe3W2of4zOmeQyAuTVDpN9h6oQsHMDpXT+EB5rNg==
X-Received: by 2002:a05:6000:1ac8:b0:3a4:e5bc:9892 with SMTP id ffacd0b85a97d-3b1ffdcdb14mr1602151f8f.21.1751447652166;
        Wed, 02 Jul 2025 02:14:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:14:02 +0200
Subject: [PATCH 01/12] gpio: tegra186: don't call the set() callback
 directly
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-1-0d23be74f71d@linaro.org>
References: <20250702-gpiochip-set-rv-gpio-round3-v1-0-0d23be74f71d@linaro.org>
In-Reply-To: <20250702-gpiochip-set-rv-gpio-round3-v1-0-0d23be74f71d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Robert Richter <rric@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2460;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7sWctEykrkqk6kYWh/FDX1BbGBSXDLqJlAMoLkCHSyw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhfHAx9yu9sVGaYUJpQKy3p/DsY1uFA2E2PJ
 dw2rteNfFSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4XwAKCRARpy6gFHHX
 crrWEADNO3YgH2sFCwknhWS5gSLq6uoC3TtC/1AZ+gw/8JXgB0xDrRk44uWBlNhzIxcjeyA3a1D
 NOC17eX9+Gizfeu9aBdfT0XFJ6Y4+ubDnN3VTUtJlvtfAnrGfSIGo1ePdBhBvNUPO/UH2IyULa6
 sPuMfT6h9nyhD6EOa7b/avX/5aEDV/iP/3V4YzAb8ScflVzJECzdNfMbmUySMGO03AUF/2HAGSa
 h6lfs6AtQhvHX/y3y+USH4Y3wTlIIs7tvkfPdN7sTP/ecxeMUaoIb/fHDoywq+aql5JufdNJ2Iv
 kHwzqJT72tp7EHKlr1SCkC+DQPThqRm1RTHUHZMad3FKwtNfWzcBU8hN19jofknqGEJrYI2Cht2
 GCmjx/Mtp//IVxDPqD/U27l0xEj+E2AWnI3V5rV9T6/TAmPcGiEgMSM30Gdf6W23s+frYX2ffwm
 l+yZ7yil38/vgV+vuXTMqrqZ9LVTcF9SNYWWMzizIKaoxOAvJCvyy/4wYmfICH8JKYIzL5xlOZM
 CoUltAKCdelNK54P+IlbpB4x7G9VWaNnlj25J3abIsSqfGjJX6hWy45nz18pjia9MghfMNTsIlf
 CjxWNWrxMmH9AxcXn0ZFiu9s5BEGHvGFhUA/dH4m+2BcBABYCetZWNV7GxCU6JkEVVpz59rx/uV
 dgKFr/7YNY00LLQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Drivers should not dereference GPIO chip callbacks directly. Move the
module's set() function higher to make it available to the
direction_output() callback and call it instead.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tegra186.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index d27bfac6c9f53d23806725f5fc89fd0331f4afb0..04effccf9ecdf0828bc50455dace3ba8e8bdbbef 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -202,6 +202,26 @@ static int tegra186_init_valid_mask(struct gpio_chip *chip,
 	return 0;
 }
 
+static void tegra186_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			      int level)
+{
+	struct tegra_gpio *gpio = gpiochip_get_data(chip);
+	void __iomem *base;
+	u32 value;
+
+	base = tegra186_gpio_get_base(gpio, offset);
+	if (WARN_ON(base == NULL))
+		return;
+
+	value = readl(base + TEGRA186_GPIO_OUTPUT_VALUE);
+	if (level == 0)
+		value &= ~TEGRA186_GPIO_OUTPUT_VALUE_HIGH;
+	else
+		value |= TEGRA186_GPIO_OUTPUT_VALUE_HIGH;
+
+	writel(value, base + TEGRA186_GPIO_OUTPUT_VALUE);
+}
+
 static int tegra186_gpio_get_direction(struct gpio_chip *chip,
 				       unsigned int offset)
 {
@@ -251,7 +271,7 @@ static int tegra186_gpio_direction_output(struct gpio_chip *chip,
 	u32 value;
 
 	/* configure output level first */
-	chip->set(chip, offset, level);
+	tegra186_gpio_set(chip, offset, level);
 
 	base = tegra186_gpio_get_base(gpio, offset);
 	if (WARN_ON(base == NULL))
@@ -359,26 +379,6 @@ static int tegra186_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return value & BIT(0);
 }
 
-static void tegra186_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			      int level)
-{
-	struct tegra_gpio *gpio = gpiochip_get_data(chip);
-	void __iomem *base;
-	u32 value;
-
-	base = tegra186_gpio_get_base(gpio, offset);
-	if (WARN_ON(base == NULL))
-		return;
-
-	value = readl(base + TEGRA186_GPIO_OUTPUT_VALUE);
-	if (level == 0)
-		value &= ~TEGRA186_GPIO_OUTPUT_VALUE_HIGH;
-	else
-		value |= TEGRA186_GPIO_OUTPUT_VALUE_HIGH;
-
-	writel(value, base + TEGRA186_GPIO_OUTPUT_VALUE);
-}
-
 static int tegra186_gpio_set_config(struct gpio_chip *chip,
 				    unsigned int offset,
 				    unsigned long config)

-- 
2.48.1


