Return-Path: <linux-omap+bounces-4027-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 984E4AF0F9D
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jul 2025 11:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2B9C3A21D1
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jul 2025 09:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AE7253949;
	Wed,  2 Jul 2025 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="h6aruusI"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDA324EF7F
	for <linux-omap@vger.kernel.org>; Wed,  2 Jul 2025 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447663; cv=none; b=Wo6pn+j73TyyPTJ3YL3mAoHZ9OSqIEXPKM/8XycNI133ESUstARf2PIz+paxg0+spgxIZ6YAnsEw05bnHRxv4sn89rS5ykxVumXorTSTUhPNn9rCHx0AEQqpT6BOn2Bszx+crrqyppWYr8UgH8DKEru+Tehqz6GOMhS/SvrNmYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447663; c=relaxed/simple;
	bh=AtKzvSC4sftTRbKyzIfOqOrpUeYmC33cBATLXCZyJ/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GWa0TNZYf17ceiTfcxEIDjv5ZMV3COCO9fITwFKyiP2y55e9J/K+X2IgNwlEWsWjZiJsOuob8bBjvIZyHZnEpQv0QhRrIwh5VqBvZ81hZJBCLH69tclDk2EDq/dIaoVe6NWvXdIqSmwJ7WjtiySkgaiVTM/urcSxKiwqz1Mu09A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=h6aruusI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d54214adso46656595e9.3
        for <linux-omap@vger.kernel.org>; Wed, 02 Jul 2025 02:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447659; x=1752052459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/k64Aq9LqhL9zar14GfYtjAuA/biACIXxn9m/XHbCg=;
        b=h6aruusIcXAEBkfoCROxs1lGHDOl5G0aCmSGJyCOjLnBYL98ksrutvRMe9F4YFqP0A
         QmuTv2KegzSCZQiZH/3vAATm1UyHRtu53kmQ/43PLxNFqKpe8M5FXd5lAHvKJdhkczhv
         +ZYdxgnkQUeLZdsAe5DzBBZler6vECU/Uo/VCYuFaB2wAVuJi0FvxN9jjYlU/uloXKdb
         FchsYxVTeqbsATi+gIwPjxlj0KSc9wS9g4PnWVXigozZOfags8LlEd1GTadytzR7Vqdr
         2b6FbsWL+NSMXpbwRbGq0Cjubxpz/GmhrCtsYKVWvfMl9o13PYhFR8kfPU7W3HHgv1l/
         wWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447659; x=1752052459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/k64Aq9LqhL9zar14GfYtjAuA/biACIXxn9m/XHbCg=;
        b=nGcj1aq4CAYjl5EJBaykUZtLupxEjWRS+ZF6wUvaXpTzVNSaOIPxNr7XJpqsprQxbJ
         ATI6/4cPBirnpwp1NDerVnW5WWdQYeTAShb79IAdx7vPUBapdFnqb2pGMdbxq8qW1YPX
         yMI8S51QUmjHxGEZW5KyEitUtsK3l5BQnmj6UVRZ0Zj703MxI+jsHjqTjFNzNY8nxs8t
         YP5d6KinTyx+jby8K4WR84GdK3qb8GuhXiak/68B+T2HbXrwIBNH2maGOnul4u8IFUM+
         z+pvLzuJPymkrkKsOK35k+XiiZv31bAjjkzX3oyPBiNrvd2AdOGvws8u8PQW5OGsKafm
         vGxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHcsGmqPu3aD/1R4yTJkKlRcUSfFXnG41XT9YGNlLnoTyLssAUGkG7EBTf+0zi2F0uJutUmKJRtbMP@vger.kernel.org
X-Gm-Message-State: AOJu0YxM1H38IWWbdPDR65k1FJyw3BB9kFNVwBlCoeIuY40HebRsst6N
	gVPevqM2afSCRKK78rvbAPRIaxeMzdn0oWWC9NCWGkLbYLoJjwvrlhUfO4f145PIYI4=
X-Gm-Gg: ASbGncsQaOtkVOa+orN9VOiRP8vLKnTv9cNzmLYTGj1BbYVRmtRuo0glRjSst+o4o0V
	JYoQpEL+vecs/CfMA6H5/1YMwcQQRUYTvsb84vaEpIMKwfguYQ8gFakSrM1PQDJ+16CS8Q4kJFW
	2MG+LDKIeqQj+5GYsIcvXYxfIQRMAkQvpF0pyO/e+X3sXC+YinD42yiZMuwqpQ2SdKoFacrl2s6
	CpCqiZ5anY0VY+YSumaL9T3cyUg3wEy4LPvK94WdMlmDERUs6MlK7BuPowPvAoXPQEmzJa9kSzN
	t5bMYVtW8r0bb5M3mamyCmoL8/q3hg1+bOTGfkpdsCcENKwG7PbaHA==
X-Google-Smtp-Source: AGHT+IEEPdCtls1SI4YxsmNkvWfOddHwKn/CGfoP5bHMuByd0o0c/RD/VcKeInDYlHuMXK02lWPmhw==
X-Received: by 2002:a05:6000:4287:b0:3a5:67d5:a400 with SMTP id ffacd0b85a97d-3b1ff9f58fdmr1425851f8f.33.1751447659026;
        Wed, 02 Jul 2025 02:14:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:14:08 +0200
Subject: [PATCH 07/12] gpio: tpic2810: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-7-0d23be74f71d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2377;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AiessNDFOwkTh1mOuj71zNRifUb9saWF8hZ/eMG7BxI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhgHiCNmf3we7lOXA8cPKAG2r0SDRRU4u2JU
 x3FcUdMS4+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4YAAKCRARpy6gFHHX
 ct3AD/9n45TuB9NIqrD3u14PoA0hct8Lxv5LYKBFtuWowdiZQ0EJHmizsCk3cFG7yduhQjEog3s
 E2l7Bbqyzc4RxvdSY7VaexJiKVwryML0GZWQm+JbRVHSTKlRozSC9bhYzDIGAUZ+tU1MiG1UX5h
 B3JrBwBFvGL1TkJl6/swUiUMbBzYweKKcyEJ456qssiEnAt6S4mDFYSZeuMNxOT+/rxBH9Top9G
 z6ZpyxmGvwFqEVSUGCM1ATy4qKE+5uiG6v2fggg7QsPGx3lxIrp6MKEpNOrxhk1UzVkn94pDNhV
 S2u/KjFz9Ci2rtxKYRWkjBZsEb116l3sARaoxuSfkL44GkP2r11uHhEKVuIHkyvEhe9xPVcqrKH
 B/ozP1REs3LUxaOArlEd4zrrGoQWCxIHTzyST4Csn64bH2poF0xxAfx4aB7g3jTUQwL7O5KjOU7
 s66zgRodBPkr5TXq5sUMg1uZjCbAkBkf3XINiwOlywiksxKPCLVFlrP2lVWzw7W3yvB9ePvjOk4
 1SEpRPW1bWWN6sl2shvjQz6LHGT8XWgK3YljmlQQjWlcTTQhI3UlCjYLhnHMrgMiVJxVNsXrLRh
 qRhTJ7C1v7LsgK8VqWFN8j79sgrHy1yThf8yz6xZLkmTDBrxtBPc8bJaAiEUpaIg2qPdoyIuMAH
 m0WilpLg/IRRrRw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tpic2810.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-tpic2810.c b/drivers/gpio/gpio-tpic2810.c
index e99725bd3d63d47ed6dbb800aacac14b1ee96b9c..d5b8568ab0613be56965448277704336fd520090 100644
--- a/drivers/gpio/gpio-tpic2810.c
+++ b/drivers/gpio/gpio-tpic2810.c
@@ -25,7 +25,7 @@ struct tpic2810 {
 	struct mutex lock;
 };
 
-static void tpic2810_set(struct gpio_chip *chip, unsigned offset, int value);
+static int tpic2810_set(struct gpio_chip *chip, unsigned int offset, int value);
 
 static int tpic2810_get_direction(struct gpio_chip *chip,
 				  unsigned offset)
@@ -38,8 +38,7 @@ static int tpic2810_direction_output(struct gpio_chip *chip,
 				     unsigned offset, int value)
 {
 	/* This device always output */
-	tpic2810_set(chip, offset, value);
-	return 0;
+	return tpic2810_set(chip, offset, value);
 }
 
 static void tpic2810_set_mask_bits(struct gpio_chip *chip, u8 mask, u8 bits)
@@ -61,15 +60,19 @@ static void tpic2810_set_mask_bits(struct gpio_chip *chip, u8 mask, u8 bits)
 	mutex_unlock(&gpio->lock);
 }
 
-static void tpic2810_set(struct gpio_chip *chip, unsigned offset, int value)
+static int tpic2810_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	tpic2810_set_mask_bits(chip, BIT(offset), value ? BIT(offset) : 0);
+
+	return 0;
 }
 
-static void tpic2810_set_multiple(struct gpio_chip *chip, unsigned long *mask,
-				  unsigned long *bits)
+static int tpic2810_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				 unsigned long *bits)
 {
 	tpic2810_set_mask_bits(chip, *mask, *bits);
+
+	return 0;
 }
 
 static const struct gpio_chip template_chip = {
@@ -77,8 +80,8 @@ static const struct gpio_chip template_chip = {
 	.owner			= THIS_MODULE,
 	.get_direction		= tpic2810_get_direction,
 	.direction_output	= tpic2810_direction_output,
-	.set			= tpic2810_set,
-	.set_multiple		= tpic2810_set_multiple,
+	.set_rv			= tpic2810_set,
+	.set_multiple_rv	= tpic2810_set_multiple,
 	.base			= -1,
 	.ngpio			= 8,
 	.can_sleep		= true,

-- 
2.48.1


