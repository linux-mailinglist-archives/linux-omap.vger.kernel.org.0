Return-Path: <linux-omap+bounces-3816-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B06AD368C
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 14:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57F837ABB5D
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 12:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96E4298CDE;
	Tue, 10 Jun 2025 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="js9xeNw6"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B202C2989A1
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 12:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558819; cv=none; b=d+V3l6Zv1TwRx4QaAl9tXDOmASXOzehnlJ07e+hQalquYuwQhNGPymWvKzZrQ79mDBld3lwCP1JIE9+1YVkfSVQQeZJo6ncKxehDabc0Sv3haWL+zuW+3z/we+YuLk0+eTn1/vpwoY48gp2C11piA25rBaYxBjdMn095kin8I+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558819; c=relaxed/simple;
	bh=4QCGnoq1bJCjjIi9V2/83E22w1djp2GNx3m7VM1JT4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gmTFk3w0ToTA1EdkcDwk+U8v++qlkAh3VZLsTS4zOB2GvT6z7ixPK0GRfbVu9/OdzLG97T7+6FCmdGLgXjpnekEPB2Kjm8RBZ2JKv3QUounofDt0bEqCLGqUwiJ6mAp+vK3+ahz5bJ5c9SUc5xkioq7hzq4yvcYPSZGV0UnhGhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=js9xeNw6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so42020645e9.1
        for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 05:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558816; x=1750163616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8UnWEBUMwJQl9FRSZdvSbH7HNUPtGYFMHksq5VfCCE=;
        b=js9xeNw6AtNzjm/DI4DYkU/s34MWcIrjX6MjFW0iM3YMdx5sUa4ZKV7AsORG693Ua0
         wvj/iRhlsx0ke2nPiI5KVHW0nSYT5y54TEYzCxhkk1m1DjM5boHC7/3NTdoidhsnLWL6
         yfkrx0VyWANYQMwLrhD060ZZxtX3sc9lxLAM5Ktk5b+/6ae07o07cinxypjyKWU2uu8d
         2dAlC7jE2i+H7u/qFlYpoNO+tObQs0ehtqOFQypDv2JOy+jMMB4MhYMLoCzgsiU9HJ18
         kSp5nhOaZIdKqr4+TV+JYIIqZffDmmWdAHleoDbpi17SwQuQ6Mf57xEKA05RFWWq3dm1
         zxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558816; x=1750163616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8UnWEBUMwJQl9FRSZdvSbH7HNUPtGYFMHksq5VfCCE=;
        b=nC5qkaJiwuwKgt51dOxhaWIwEsV1urIXw/1WwmEB1QZ0GbhlS9EoTsYBBWrRDFbso8
         gKQgHBjFmujoguKsY40zBddUsdWZ083gupvh+GsuobdrgMpENjud9Iw3Y8niMX41Gfqx
         cYysmrj7dNE988x7tG6Et2wYGgDp82Drm0xoUSLg9KQZqA3JDEMmlvifgNuyRnKqoYui
         VDKn/N98EjZL0140NVWGFQG5qxTpatXs2XX0ssG9hl9smv7uDz4G5/3diXFPXzydCau3
         vU3sE6E1AI+ktr1ZJKZqT49gYHT/cr09LJuOBR5BGUMBi3530e4k1Mw/vjwqu6eVyUMe
         rhNA==
X-Forwarded-Encrypted: i=1; AJvYcCV2Uu6Fs4iu4Se/6Tuor3OrDcDC5BtvSSUvWHhszNaFO88MjxvbqEAU6nY6dAhYpeqqojyTvm1sGY9S@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0supM1dTF1fepPN/NwS0LrFcBtDKLNkEyzoQ4BWRtYdhJA62s
	iY0Tm5LFdAFb2SkMpmy3pB2HDC5Bqa5S6WAi6q0Bq8uM5Z2T0MIYPLtKlqeUxBRk8eA=
X-Gm-Gg: ASbGncuSSUH0kVKwnxkZDp/vVLzSHl1NqDBDA+U5QmAFk2BseYrYY33J0HsgpmiwjOP
	k2BAIwgmxDlxuPj1ni9AgcDNyuU4TBhrnMMjdqhywEfiO30pjQUixbeCONAZsPh9iABMj6AwH7H
	3oRgKq/MpABT0fLcOwJyxcn1TIk1tFrIJEuAkEbDw9ZAlP647i3lY3kCQ1PFXNAZoI5zxolm3GO
	GtLurKItuuABWgLHfUyBZjGydZAvS+yeSW1cEdD6YdVw/cxDY3DZSspaIH8LclcxfNDfwK++qhd
	2cp6Iz7WsXdlN89+0q/Kji8Cf7D2BR9JFRJ9A/tFhzUP7oz3UxGdBg==
X-Google-Smtp-Source: AGHT+IGEb945pctd/19j/70DlEklbdpCSjS0SXNKlhgiB1IZnKkMVBIGu/KwhCfcg7w0J6nsDegN4g==
X-Received: by 2002:a05:600c:354a:b0:453:aca:4d08 with SMTP id 5b1f17b1804b1-4531ceb5f3bmr32427015e9.1.1749558815837;
        Tue, 10 Jun 2025 05:33:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:22 +0200
Subject: [PATCH 12/12] gpio: palmas: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-12-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2364;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EJnUqbYdFsX+B+uS77CC3tICbyCNOST1Ifh9i66zy3o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYQH0s51YOk3kPi1uWti8T4ohdUn/yx53NBp
 EPSYm2TbnuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmEAAKCRARpy6gFHHX
 cl6HEADDb/gC8UYIxfieGcIPlCLMVRxpN6B1QvZbRdjguBGn2V1R4KRaQVA4VHY6bdnfwHfmTEs
 PyBGCdOw5W7KfEBvAHi1BPRg3jZ3AhPL1MBtsbCUu3wkmJaME0MAZRi/9kTVnBd/90m4ady4fob
 ZiVpTNRYaxU5/agaxspedLUZ8yS4ru+4nvF6UhNZ6xCbzJJ098pcxmRPwL4nP3Kk1aFacQAXgoI
 RlFmAUUCPGcr+/1hQ44LYPBhD9CFSxqmk0/peAbcioUE+37xiupVSMPVtmphojgLgRG39WdsAW6
 wHLIbw8YDioA5qjexp3hLxB9k//QX08V8iDF9H4FALJgdECvDhjcNfqx8yoMW+M1koIJkBDfnZX
 ng84ih0EIA0Wh6fqeKTsbJ4JOE6/eR2EdcuY3FxX2k4O2JDELoEnc/UERh5Y4DHuNtG520m7uyt
 D2MG4nZJAZjiBZ4wZ1bDW0t09L+XCI8V/1vpwCxDVmhkEeUduyWT9w1zTgWQ7at0NdbYAgZ+nG/
 jmrJ7UptwMJ4P1yZmWdfEYXlSODp6TjS+tPzWIXQcLoS3eRRpTav7CIm+nr6xe3tNiOPBqNb1H1
 ZqpzpL7iVd8AuUaR4K75BWnU1tcbiTDFsuLnE8/CZ51sfmEAj0VyEK/pDJgoZj7ekTL7Yr/ve8p
 M8J1VvOFz+l99wA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-palmas.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index 28dba7048509a3ef9c7972c1be53ea30adddabb0..a076daee00658a9e423a0d78f14ad48d61956d7a 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -54,12 +54,11 @@ static int palmas_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return !!(val & BIT(offset));
 }
 
-static void palmas_gpio_set(struct gpio_chip *gc, unsigned offset,
-			int value)
+static int palmas_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			   int value)
 {
 	struct palmas_gpio *pg = gpiochip_get_data(gc);
 	struct palmas *palmas = pg->palmas;
-	int ret;
 	unsigned int reg;
 	int gpio16 = (offset/8);
 
@@ -71,9 +70,7 @@ static void palmas_gpio_set(struct gpio_chip *gc, unsigned offset,
 		reg = (value) ?
 			PALMAS_GPIO_SET_DATA_OUT : PALMAS_GPIO_CLEAR_DATA_OUT;
 
-	ret = palmas_write(palmas, PALMAS_GPIO_BASE, reg, BIT(offset));
-	if (ret < 0)
-		dev_err(gc->parent, "Reg 0x%02x write failed, %d\n", reg, ret);
+	return palmas_write(palmas, PALMAS_GPIO_BASE, reg, BIT(offset));
 }
 
 static int palmas_gpio_output(struct gpio_chip *gc, unsigned offset,
@@ -89,7 +86,9 @@ static int palmas_gpio_output(struct gpio_chip *gc, unsigned offset,
 	reg = (gpio16) ? PALMAS_GPIO_DATA_DIR2 : PALMAS_GPIO_DATA_DIR;
 
 	/* Set the initial value */
-	palmas_gpio_set(gc, offset, value);
+	ret = palmas_gpio_set(gc, offset, value);
+	if (ret)
+		return ret;
 
 	ret = palmas_update_bits(palmas, PALMAS_GPIO_BASE, reg,
 				BIT(offset), BIT(offset));
@@ -166,7 +165,7 @@ static int palmas_gpio_probe(struct platform_device *pdev)
 	palmas_gpio->gpio_chip.direction_input = palmas_gpio_input;
 	palmas_gpio->gpio_chip.direction_output = palmas_gpio_output;
 	palmas_gpio->gpio_chip.to_irq = palmas_gpio_to_irq;
-	palmas_gpio->gpio_chip.set	= palmas_gpio_set;
+	palmas_gpio->gpio_chip.set_rv	= palmas_gpio_set;
 	palmas_gpio->gpio_chip.get	= palmas_gpio_get;
 	palmas_gpio->gpio_chip.parent = &pdev->dev;
 

-- 
2.48.1


