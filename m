Return-Path: <linux-omap+bounces-4024-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F69BAF0F87
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jul 2025 11:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 370DB17147E
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jul 2025 09:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795A224E019;
	Wed,  2 Jul 2025 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wRgALTSk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647BB24BCE8
	for <linux-omap@vger.kernel.org>; Wed,  2 Jul 2025 09:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447659; cv=none; b=JREC4ZJHBhvcpc72oYGcxIh70g6M+kQ4ndzqD+Pt/0c3sVWAU9eHJTpFNeV4PMdXMtNtnGn6fYbzfIpPPQiqfNvJUalishdY9Xw1Jkii6UYa5mRrRwPf4vHbxnnc405qGxrIg8m76e7CDwROX+gwGiwv2+udUiWPVfUuVaSh8J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447659; c=relaxed/simple;
	bh=B1ndyCLlQ4ODPRpMSNjb1k1WG8/IUdEqzvCtKASm/ms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NT6EqVnzVjoukchr2Xxp9yN98eM21ltdQ4L3dMb3xpTHFp5besW9CMKRgpwFwnCaJnMIje5dC8Q6N2voa6/w26S3OZFbDZWwlXCyAWcR7o8svNbqfj3bak3ei5fpRa72w7X7X1otdw2LZegIH6YBiUPn46thBISICFis7xdPniM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wRgALTSk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so3856549f8f.3
        for <linux-omap@vger.kernel.org>; Wed, 02 Jul 2025 02:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447657; x=1752052457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgVeELJ5kbUgF10HS6VshSVIN6iNDw21kmNN6tTpH10=;
        b=wRgALTSkjr7fg1e2rFvccfBLF+acrH83zg+2y/HbrmeQ/POeZZmCphS7aAxVDMpPBm
         ljjc+oHyIOPBSGy15mPTEyQEsOxFUR7gHEqAlIL00gugz/Z5m/Kmd/IcFjcRofpd/DMv
         OOJ7yGJWXxNezIBYM7eAaTi81t7pV/P97ekGM/dOV26AobYXk2FVjREIylAGn1DwllXm
         aKg9EjoRIZ8HZzYjP8XtPXqbTHuE9XCCgo+aesun8JgFyqt7ZZR8DBmZ85OzXqz/JsWv
         dePj+om4Gq/DtU+mT8PqD8qs3QUGd56NRunv9u6slcPU2gZLb8sOOwOYEnpRv/J6Uc5w
         WlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447657; x=1752052457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgVeELJ5kbUgF10HS6VshSVIN6iNDw21kmNN6tTpH10=;
        b=Izd1SoR0Wg6J3M3ULK1fyyHQ7FAy/DH3ubu6x8srynkBT3xfy2N+vkIfUrJTK7a1i4
         NdM/fZGD+zRn4cARHlvA9LxsIhonXmt5nrjFRBpJ6/z8ENekmeNXEJhsMIuF9YdCOHaQ
         hWAhx78WsiUdaSf5ejlBqC9Dj+JZx2XrFffYKwJqOGYE8jELXlt7X5pUPFN0tw3ajHxh
         UBelDy4brBop6L/0v0MsigpqoW4rSWvqLJ5J3seKJENTLx+R5aZISMlLN+0QeRwCPh5c
         PPCWOrrZAAx7dAxDS4PGW8S7N39n+3kCwYyw7lF4qrK+2sxI73YWrGKvhek+cdVloiqU
         /0SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvx/U7sU8U3Y8bzZAFax8oqnN6ZcW+WynDlx25hfUe83MuUhHoj5dlKWNwtrj477ABIqsBTAjTbW+G@vger.kernel.org
X-Gm-Message-State: AOJu0YxDYQ591XgVzHb5aL0K9yjvfZApX3KVKOgDQlduBkMBqnEf/8Ni
	lcnV7eVzskEugTBfT+55qEe5D+RSiRdd1IGlxcU0vmLuY+49ErMzhSKzR2Vuk3kMBuo=
X-Gm-Gg: ASbGnct47WU1Ue9fLHxTIQEwka2v5rdcuJ6sIk7lPpTDhB55XzLo2cQ3i4vIZ1yPDM3
	69w6UI+PCbSThG4UNge2CGsHyBYZRgLGunsR8LHK9wAodvgqzNMolVfwbrjpNibzt11uxFOKM9b
	Bs2v1Ur7xR6R3zD+IgOy3/MCt0o+0mlZ/RXBH5X4H3sIz1Tb7ARXwwhan1TCWgUZ1SdUqx43KLD
	8YSSDjZvwzGVfxf1v1jvWK/DvKn8kuWOfMSPPzuZfU7mWhFcY1Zb9235KM9Dc69nZEPXv1hfrUx
	jZVVKile/1LbOWkZntfOdWQWZ5fmBcx1Y6lqYuZnREGJyRcjl8Xpmg==
X-Google-Smtp-Source: AGHT+IHZW19OYyWsuJKRkKyJd4B15hzcvnXr7azzlTLLvYuao6zKW6NrUTf0WAA9IH/OMkzj0HZ9IA==
X-Received: by 2002:a05:6000:645:b0:3b1:3466:6734 with SMTP id ffacd0b85a97d-3b200c3cf30mr1339455f8f.44.1751447656753;
        Wed, 02 Jul 2025 02:14:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:14:06 +0200
Subject: [PATCH 05/12] gpio: timberdale: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-5-0d23be74f71d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SJAWbb0fuUiKjfO6048fqxHmqK6VaXLHP3IKnd4QdRQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhgr+kuNKvnHEXh4veawT2GvyWoNtkyJcLJY
 /sHOOMH5AKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4YAAKCRARpy6gFHHX
 coK7EACBDroouAgZcdK45re/MRBT6JnD4umGGm0FhYtbUI1CGtys92ajBjsb7KqyfYCPRzJLqJS
 flVDGJgZDJFhZMDOCsA2NDW6DUllXxWObAr4YXlZ6vvGhsmrXbKf54E1s0rDuocALdsB26oPCHG
 OcgSwkW9uvd5nlTVlMKkuMKg79C0RmGA5czawUZ+pPc52a1PEW9YP40Y+ACO8IUy6MEdXmgQ+el
 5mDRaALSvG2IPP8i836BT8WAGnYGZByJbAWOaoGoQncY5xq0TfiB658GN5TirNh90HeMWGsdzhj
 6Lg/MNHuSGe/NzICFF2asycCsOtgszboQ16BGW88MBiSRG00E2c6hpDLhFVvkC4Bo3ONN0yvlpn
 1rHARKMOvH4T3YRDUATnOhnx4XBqUTNLjpL5suBXeOo0Tm205pGCXezmldvaNm9y+KPF0qmXvas
 ZvIQsAK9k8qYGQ0ohPaR0I5P+hDKAtQBD76S9UBMvoNibBDLn+0tVT8tSfBqKRgG6S9ogho29Oe
 bOBeXnKd72RgsWsqwbzo77eXzQRvQ3izKOCSkvcYE00ofzzD2kgPnVR8FNGLI5N/NJBwGXmsWHc
 Pu/LrYTigoYANyx+3+oGKdpypceUPD2IWIs35Prw4v2/AKIHyQe3NC6FlLREf9obSDj65x7N6ed
 7DZrjAPsmPOCg/Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-timberdale.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index cb303a26f4d3cd77368b5bdac42aa42821b39345..fbb883089189095cdc0101d864ab90dd042c73a3 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -80,10 +80,9 @@ static int timbgpio_gpio_direction_output(struct gpio_chip *gpio,
 	return timbgpio_update_bit(gpio, nr, TGPIODIR, false);
 }
 
-static void timbgpio_gpio_set(struct gpio_chip *gpio,
-				unsigned nr, int val)
+static int timbgpio_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
-	timbgpio_update_bit(gpio, nr, TGPIOVAL, val != 0);
+	return timbgpio_update_bit(gpio, nr, TGPIOVAL, val != 0);
 }
 
 static int timbgpio_to_irq(struct gpio_chip *gpio, unsigned offset)
@@ -254,7 +253,7 @@ static int timbgpio_probe(struct platform_device *pdev)
 	gc->direction_input = timbgpio_gpio_direction_input;
 	gc->get = timbgpio_gpio_get;
 	gc->direction_output = timbgpio_gpio_direction_output;
-	gc->set = timbgpio_gpio_set;
+	gc->set_rv = timbgpio_gpio_set;
 	gc->to_irq = (irq >= 0 && tgpio->irq_base > 0) ? timbgpio_to_irq : NULL;
 	gc->dbg_show = NULL;
 	gc->base = pdata->gpio_base;

-- 
2.48.1


