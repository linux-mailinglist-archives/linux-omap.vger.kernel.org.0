Return-Path: <linux-omap+bounces-3806-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E4AAD3660
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 14:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 082BF177749
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 12:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25BC2957B2;
	Tue, 10 Jun 2025 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hjsZElK6"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729522951CA
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 12:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558809; cv=none; b=rSDP3NiVbr87FU/l06V4ntGNAQMXp7yBbMylVqogwrVRCXqTYFHsH+XCDeh4DGVEmeVhXwDQhUMINzHlUj0G4dnbTk3VlCwJSNd7sI8jvPfezpHrNw8FBGRIb8k0C9Ubg0GidI7gNQqtWl1j5kvz5yIAg722FyO4vRGjmqVCj9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558809; c=relaxed/simple;
	bh=JPSbp5yJtajANs5Kx0BJVfQNVJZOTJjm7ySQemaTVgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ahxg3lphCWt7epsSMUhSwpGN3M3Eef/x1k/qTc3+QEC/PDlKud4DbLMYApwZVjwHLDIwIyjCRJCkPRHhu0FqAU2dRJkhKTt3zy3EdrtTz+8qgFeL4XQy1A0zPaHFRFo4XHBXCpV+KdPrMC2uFTUNl0LT6ZtTO+tUF8RLm1YRfVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hjsZElK6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4530921461aso20492345e9.0
        for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 05:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558805; x=1750163605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaZhNfmNZvFczCK3uYFfm4lqI7dzagVSWDi4ZRPJnwI=;
        b=hjsZElK6LiepTawFD3/tkgssRztwV6biBmiDYWztzsJxY3QtEdycyVuvYScds5v+TE
         i4//7hRSH6pu1o7P7hj6NgQS2grPVYpLfbIuj17xzKmkM9fAjl3chDGv10etYfrNz+IK
         /g4qgMwL6b1DIgfbSrqR34vYL+Fmwd9xjfQaS38cIDQSlcmixZe/EyBeygGe3J+LcL9f
         l+/djRuGSIQ1n4ekO2/Eyaj7Yblx7nhUIwsPsfovmR8dyN9I0eUlndIo31ZKPqrBg3hT
         SmPB48cY9i5JCsjg9cNjmpcsneSkNBcGZqNjkWAX4N2yVO6xwFWQrY/zkdlBJdnePJEW
         k2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558805; x=1750163605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KaZhNfmNZvFczCK3uYFfm4lqI7dzagVSWDi4ZRPJnwI=;
        b=BlrAMLrDGD7zLOMtYtAB5HdK0n+xWG15fES/CQzPgLkwyR7q6f6o1m/mgVoQZX5BSz
         xE7+eZKxrULHti4HvNSIzom2nW7CzjLmkoA5XNgD6neGMbpV+5/3RHCQj4473++z+pCw
         BFi7AvFeXD3tQ/MBzTsO5iwMdGElGcULZ0z4RjSW7toWPu790hNt0K0norU6sncvIkXJ
         0R3aChRUiDCi3ZM+9XZhxWY7IPF2zP5s8GfMsyYt6fUQxKICY9169CdyKHGHjwkmDixH
         k+oClaCl9Z70IRaTe9/CDszvnqto8+vP3vy+7hER8w7DsIAud/7vqCkLgzlMbswwi8Ur
         yvwg==
X-Forwarded-Encrypted: i=1; AJvYcCX6/7NObJB2oe32oHDB34AmGRchZfICQO5p5w+h7jPsyuuEIR5JB5/KRtgzbJrveqwcKjvt9req44Nb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw//5XJ2KNmh4gCfItLYRlPiCqllzXIYJNetHd+LvrQI2DzfnsE
	oVKvpGnNReTDx7BvwGdKtgtm1JtKBSVTfknPxbxlpthUQlfqMurLTXQvyyFHUrIDXQ8=
X-Gm-Gg: ASbGncviXeC5kjY9Tl8AwiT2XZ95cOZvonRke6w4Q3hRikkb12ZD3VGWE/hFBBaUf3X
	qq4xVIJ5rXynX0cltHa5REOwaSjzBRvq+hvmSAHShs8QXIkagBP7f7jlk3fnBcm4W+0KdOkZZbD
	rmfYahTP2k0UMOPvL0Lg0x24vacYkmHTvS6HUa+95xZA4J/rvCCbmMxM2A/eIw4zv2hNBAWAiZQ
	M57he//aeeRJ1+KoBpK/FOKI/Ge+RVpO4ixKeeWhXgq7UZbXyGXU145nkq2ba/ruueJW5LHXAd+
	QgQNukyp0Op45IlNMOO1MJk3VV2e1XcLkP6oB2wDqLZCUOyCg0TNkA==
X-Google-Smtp-Source: AGHT+IFSBusLtZEhcB35bdsLhsIDJKEdI0B2x6nuBuQEbHF1Ukz5MK6AfplwzfpXypgWmTNJf64szw==
X-Received: by 2002:a05:6000:2283:b0:3a4:ef2c:2e03 with SMTP id ffacd0b85a97d-3a5318a90cbmr15138062f8f.33.1749558804571;
        Tue, 10 Jun 2025 05:33:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:12 +0200
Subject: [PATCH 02/12] gpio: mm-lantiq: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=h//lpMqxpm+YSvksV4b6ru3A6OjJcjH0LPneHhPANFI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYOyVxQ6f3OBK/aG05w0mHNnvJLnDT+orDrz
 CyfWJIjJ4KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDgAKCRARpy6gFHHX
 ciHSEACbAaLEpy3rIEg/INTnqZRSZcKjIFtdWlKQuLFDeybOyeiSxsXh2wVCKE9HyLBM4Pe4aOe
 VeJn1Gr92epXjzFOgr9ljMI5XuvfDKiUaJ+rYkq7/Zs0doHxU2JdVUOZ56W/ksVaQRwyC8wCRBr
 1Wli4N7JwPdD4t/y88MkdyHuplV05Azu8GK/HebhanaJmAdKsKGHxR/A4RYuWfrffEarVVAQ688
 yj7fctEZEtajQVjw+qCP5GBjsONGyfRiTciEzFZk2Eo6IIQCZEYQq3wc8Gd6b/7f7x1mHHGRecY
 DySlDOvl/blSxGU/19Rk59Ji7N0jIHlFGoRdOlEfDYsyxYcQ1YGhBm/EWbwy7C7TVwwmYmhRHjQ
 6U0crUDECD+RHZf8ESHp1fzD0gQD6M87Z2n5Qqj/iXDfT7F3+/E0NCfX2MGjJEoG9D+gFkzNSqN
 ovpcvq/yrRt4BiP+N/+81NwzARAgmNtA4arZxeyh5i4OqTMZtaMMgDsKwlZxHweLeCJzeHU2c01
 Gd0uc8Rd+iWf1vbf/mnnIHTHyTaSYWwYmVxa/FJSj98NsXYkeE2f9VoTVKzBj/b4ltLuEiTBWHq
 cm2Kz0AGsiu4qJ7PmhkesDqXdEvXX8g0I9jum1a/5pvlAwYSlfyl1w9eyBKPjCur8y1vx+5atSV
 t1BHqk4gNTPA4rA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mm-lantiq.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index 14ae257834381186faba94446ea326cb3be99ca2..897a1e004681c085217bcf295bd971f3424011b1 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -55,9 +55,9 @@ static void ltq_mm_apply(struct ltq_mm *chip)
  * @gpio:   GPIO signal number.
  * @val:    Value to be written to specified signal.
  *
- * Set the shadow value and call ltq_mm_apply.
+ * Set the shadow value and call ltq_mm_apply. Always returns 0.
  */
-static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
+static int ltq_mm_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct ltq_mm *chip = gpiochip_get_data(gc);
 
@@ -66,6 +66,8 @@ static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
 	else
 		chip->shadow &= ~(1 << offset);
 	ltq_mm_apply(chip);
+
+	return 0;
 }
 
 /**
@@ -78,9 +80,7 @@ static void ltq_mm_set(struct gpio_chip *gc, unsigned offset, int value)
  */
 static int ltq_mm_dir_out(struct gpio_chip *gc, unsigned offset, int value)
 {
-	ltq_mm_set(gc, offset, value);
-
-	return 0;
+	return ltq_mm_set(gc, offset, value);
 }
 
 /**
@@ -111,7 +111,7 @@ static int ltq_mm_probe(struct platform_device *pdev)
 
 	chip->mmchip.gc.ngpio = 16;
 	chip->mmchip.gc.direction_output = ltq_mm_dir_out;
-	chip->mmchip.gc.set = ltq_mm_set;
+	chip->mmchip.gc.set_rv = ltq_mm_set;
 	chip->mmchip.save_regs = ltq_mm_save_regs;
 
 	/* store the shadow value if one was passed by the devicetree */

-- 
2.48.1


