Return-Path: <linux-omap+bounces-3808-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA211AD366E
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 14:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64B8B177BB1
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 12:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3810E296173;
	Tue, 10 Jun 2025 12:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mHfDmKFq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90DD293B7E
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558811; cv=none; b=iRRR6M4sY/3WZyJM2s8tYrMK3HGiwQWI3wHK/S4IWp1RFzfs4pLtA4gsBiyZi6cQJwz4dPomQdmTlQfyiw6vV5OHbVQZ3oYEz8Z0ZAmSz1BamLZ+QEvhP4k1s8lJy5PGkMecp5Dx0yiUkOAN5A+M4et5x3ih6iiDyzhanuxu30c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558811; c=relaxed/simple;
	bh=tX2qQdRFlMfuL1OJoRvpsye2urs+/ARQOKQBkoHsuug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o18Y4OOcm5rgj1k3IY3rMifKydmdKAtSBRdQeYcEHgaf22VDGmsVUK5R+qKaCaIaDwoznrfyCxJP0bu4uBtshWelW/+l+WAIsithEUw1jtDBbkzCvP51enjqsffaOt0Fc7wcfY3cUHJDuhZTpKRRhsMiiWlGR34JKnV3c4kTF7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mHfDmKFq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so4383319f8f.2
        for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 05:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558808; x=1750163608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nEf5Gc8OIB6seM5Xwo8qWzla3rwazzwe65/yd6IeVS0=;
        b=mHfDmKFqEO51EIkFgA79Y+1jmK4QkdE9vW5SmXFA08nBYnQ2SMMVNLb88FuEnwP8ga
         UZqvB99PVvOTu5F7LGAX8YGaGXrrm8r0rLLF5S1Ft13XRMwbF5K3NGYxxBOyNdKoKTNt
         EMIqNibMRfUJam/U4ZZyyo4+t1pog1K8VNHTQhBtYet4AL69ThApV43Y6K2e14UNCk/w
         MR37zne7Fgwn6LgTbjIBvbsXIZAbCG43QHEL8HJoq4w3B6jst35EYCdXzrsphsZuvMsJ
         fapccbtbhFC5+edaRMSDoAK/s8uZnwYFUotJ1quj0LP1OSi+F6v17gzKVg/8D9ESK+r8
         OhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558808; x=1750163608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEf5Gc8OIB6seM5Xwo8qWzla3rwazzwe65/yd6IeVS0=;
        b=a5aiQ2+P/CJGIyfv10hyit+4xeJN5dStgeosWdGht5ho1cf5VTPjjaXYXojs6nzdWQ
         PYrdrbf2rKjMTxnqW/wi3ry2ZJTZf9NMpBOh1OLSH7daYHh2hDSWKWBLyx8x8JRUlpBN
         9j27dAzHzDvNDS8eVwJ1Lqyq6KdTfjFAyApOwUzqorjBRAfyzN9dOzU9Av2bnR+awGO7
         VeAVa87WJ0WhGdsmugb8JtPQxlx/crNGABzYIKJAMAQYoltvMv1FW3785oekI77UG1ky
         0qToLJOb4pj8ZA2UjpCiB1KUjeoqXmcNopOj7Hca2yV9WPiQKSSk8pn8Bv30B5BgWLp+
         xFzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2oy1EFc9WhIXE2WJqK80XabYMocVPCQ0YlPJuErl0RkDhzee+BBLr1CdRp7lPf5udBLuwu33TfLEG@vger.kernel.org
X-Gm-Message-State: AOJu0YxT2+r4nDtUyb4xLahjS+HfTRQgWQ6lW+LZUK+EVH2KoLAEfM0l
	e3JzSR/EJgUmiYaTzTwH+6RwuYCjhqWaIwng71N8Vx2g5CdRWigYWNWQYhL9vX0Xam0=
X-Gm-Gg: ASbGnct74xCpcTK94tWpS1mWfT/SzJA5L9O8Po+QQRc6b4o8QZIYkM4ZGEC2K3b5SxP
	v88tX3hiDJ00aICLxxvhENL7wSMbc6S+5MRSuiZSAchbBk57SM4NtANEi1AQIpAd0TVGRNRd+cY
	rcMTbYja2n+Xy+1kS6U06bIGF28Ir/lF8EcSO4p9nU2/ItO2K3My4b8jeTs0RPqzzgzi1G5MffL
	XAdKHnAMD2aW9Vx8y8UEKmGINctBoCweydu//61OXOE0yMwxXKSi0722w62Q2BC218yYsq5eEaG
	Y7ZB7w+tL4InEMKNRXd5pXZB7sHVp+Mu4k4dpzrL7SzmlEcmr02J9Q==
X-Google-Smtp-Source: AGHT+IETHAD7DnXMxmzo7SdLmc5/WglgRFKEzRxI0iE9dDNUlCk/3LFXQSCUEAkPp5r5aRCIVtcMtw==
X-Received: by 2002:a05:6000:438a:b0:3a4:f7af:db9c with SMTP id ffacd0b85a97d-3a5522e58c0mr2096741f8f.59.1749558808061;
        Tue, 10 Jun 2025 05:33:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:15 +0200
Subject: [PATCH 05/12] gpio: mpfs: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-5-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1809;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LJhyLcUOS+h5b7rEBajAPZSVOUjvkwn05DngH8alAwc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYPZEloPYVfxzVAviTn9YklxaSXEOfJeOwsL
 R7IvzJurSaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDwAKCRARpy6gFHHX
 csXgD/9eTtN8ZefGVcyBA5Sqi0yLe+7DSboB4eiFeuPn1Qp2CZK7sZczomtfCljg4IDGEXmyp67
 tQyoMRkwYZ+BniUdTs89iZTV15o7YlLkxkkfWLJb6s6ida4C2LK7ci6BOTlpZPvg/+ruCWG+q0c
 vgaodzo4cHgZ0x/5gtXR3LNkiFX8xUCuoBDakmGGtUdc7V1vpDNR87G5AYtMAKfv5YAHZLmVtgX
 FYUczRur90WLzpocuHTLl17SXcAiDO7pNKlDy6wtdx0YDcivwE+jgNSSZqWBgjZEtLD5UoN6UiQ
 dAV6nc3d6i+AH8WVEBfuQpq6wAVz2xL5YwR1PZ2O33tpPXIZnii4pKhpY8wfB1i78dvSvztHDMo
 w7WWsv5B3IR6QDHHV97atmPnmKDED8QMXf6/Upb0uRLixEDhx2Cx/n4/kbXbkHtNsPJm2x4C1KN
 3kWUQef3cQ2FywZtTnDGj9PSnyXozlf0erTFQVv0V+J8psfu5icbuey2A+twL9kkFUnNeZmBSXo
 DYVkosbRnq5IKLzdn+KgvkJrevZDRL6FNqyQS60w3Bytlf7mpPTDAzjet68U8nXsETXBvyRHgyQ
 CEfZhGnIObe+eUzf2Np6b96R7syeqYaTChuKpOhp72wOm4IkIkTlzyEKfwnTHXs7gOkxrFiDMT4
 dp+YIWOY5u+7n3A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mpfs.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 561a961c97a69f64c21d31c0d924f930c985f131..3415cb7ebb0f1dbe291bfa41b02ae41c18488ff6 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -99,16 +99,19 @@ static int mpfs_gpio_get(struct gpio_chip *gc, unsigned int gpio_index)
 		return regmap_test_bits(mpfs_gpio->regs, mpfs_gpio->offsets->inp, BIT(gpio_index));
 }
 
-static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index, int value)
+static int mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index, int value)
 {
 	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int ret;
 
 	mpfs_gpio_get(gc, gpio_index);
 
-	regmap_update_bits(mpfs_gpio->regs, mpfs_gpio->offsets->outp, BIT(gpio_index),
-			   value << gpio_index);
+	ret = regmap_update_bits(mpfs_gpio->regs, mpfs_gpio->offsets->outp,
+				 BIT(gpio_index), value << gpio_index);
 
 	mpfs_gpio_get(gc, gpio_index);
+
+	return ret;
 }
 
 static int mpfs_gpio_probe(struct platform_device *pdev)
@@ -147,7 +150,7 @@ static int mpfs_gpio_probe(struct platform_device *pdev)
 	mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
 	mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
 	mpfs_gpio->gc.get = mpfs_gpio_get;
-	mpfs_gpio->gc.set = mpfs_gpio_set;
+	mpfs_gpio->gc.set_rv = mpfs_gpio_set;
 	mpfs_gpio->gc.base = -1;
 	mpfs_gpio->gc.ngpio = ngpios;
 	mpfs_gpio->gc.label = dev_name(dev);

-- 
2.48.1


