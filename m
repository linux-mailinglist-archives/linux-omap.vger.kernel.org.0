Return-Path: <linux-omap+bounces-3807-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C68EAD366D
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 14:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44CE21899744
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 12:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC19D295DA6;
	Tue, 10 Jun 2025 12:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="y0XpqieW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59450295502
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 12:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558810; cv=none; b=cd8tiW4Qph2udbZs0NuF0KU+QZtDFbLJAIs30pGsvDc2C9vahwYHSrb7nzN2/6qI9F94LGgJuych2wMdW3Oi15qiprCsoubfzvTVr7cmY9Q0VUN4DKgojz4cefLezru96t8c1XWXqInaowBJMa89GdkCA85GpQUQZrmA0iL7DNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558810; c=relaxed/simple;
	bh=6BpgFh0LqV1277QiqqV3R/j3rXXsCtZx4vsfZiGtS2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PTOaYYho8rdcXdvDomqkSGXKrH8kJUsQkvZ1zLGcCmEOo4UIYoF1XO+9FBE6TQoHGquMyXMHJeyNV/6n6NpoWISYTxPTV2xUDW497WmlBDyhoOTVtONA37XHk2JtPdu2BJRi1DCU8Nfq4jaodA6okA9wUoWUGZBSBZC6vURr/QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=y0XpqieW; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a510432236so4224331f8f.0
        for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 05:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558806; x=1750163606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKbs3ygxvSdMhEMPUeqpo77fDElOIDrrqF0rfeM3cmM=;
        b=y0XpqieWv2yl49aNAzbnAc6MNZ86KTpkeE/vD9s5uGFOBDxdH6xxfds6AEyI1PRcaA
         YQpnZa0EYYCrlEuD674mdBz9zmZxQcNOl5U2got+wS3xw892V3636kPZm6QL7c0HH20f
         TY2P1GAIZ/FKsw5keGqvLgqc8+S8Pdekewv6QeMorHj7yvgx9oVzzr6/a/0Cjj4F3t1q
         l0E7zTf2G/s454mkfM2tuJ6hvNXULUZaR3gemnWer/is/8cOwQCUwP3plnpIRy9mr/ok
         st19dHzmJRGUQCBrpjKHrYdd1MNjvKlkwojaXr0doIOo2bXegidBAnxttRF2orOX2qdc
         ftEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558806; x=1750163606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKbs3ygxvSdMhEMPUeqpo77fDElOIDrrqF0rfeM3cmM=;
        b=hTdbTSBxJDDVieGUDjB+KezzrR5cPhnn8ZUz+ExZOc/QlQvklNKJAgC8SqfVpQZ5DT
         hY8iCkiyGglvyxmOkXkb0slWbshglVOrvNPyG8vJ9oizaLAfIFjMU1yYmERwZYIY5QDD
         BgwfoX7Fk9QfRR3PapetDLNfnTZJEz+K1sO6nUX5xVxas5SjUNfhXd6ReqaYzHKnRBsY
         K2fIDLvRJGOnxIf76+zhZAFjX0J/mz3+WmesYZhrtvd/EGRiW5HUrXLS7v0XwMm2ZczN
         8RPdILfnkW4YCo5GPzxywj/JsSCh2ucisQPJITnJYunTnf+DjVy15MHK43Ekkdr6zaj2
         eiOA==
X-Forwarded-Encrypted: i=1; AJvYcCUvl8M96kszbrRw/XqiMb0oYOJOdloHqrzanCS6oQBWPsmLlPHAWC0oiI42hkc1YJI5bb5Zy/JCG1ZX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7l+eKr5Y4qXmEa23W7ILFjnJXLUYxy4Rb/m0nKsT10ASjOntl
	zpi3P0ErVyoudvUfNOfwqO20BRnfA49EkweMYZmc/c92zBPjRRO3dpakn2HYLh/gUxU=
X-Gm-Gg: ASbGncv0JQ7uTORPhhNsYzuewH8i/aj83D0F5vqaEI6xhkO9r7pJR2X5iJzFK01vrBU
	DIkp3ckDIydfyzLJ5rN2vxoKS9XDqcQq2MTfxwW/3tKWSAEo4u+PkvDeUyi1756bU/kYZnsmXiD
	SHF+UjSgMOsEKrUDxYFKDQX44PUNB75PHDLP6K+5b9Z60xWizj7XBmzPnPxvrFqX9mhoTP5p5ew
	YaTivHbl/GcOH+Qhpk2VNFqQjvy3PnSaBfVYTt8CtxqV3GmsRwKp/+Ev1vOYjEjYol+GQGX5cOV
	C5kFufY8M5LDmOc6gaNrxNYnqDk9/yj+AzOg/Ymq0aRmpxFBPcZt6w==
X-Google-Smtp-Source: AGHT+IG10zG//yZ1b7GgucOGjVy/SV3P0HD9SPfMOme6APoyX0obpAM9Jiyhiw0LZzEqu8UJWmYDxg==
X-Received: by 2002:a05:6000:220d:b0:3a4:ef70:e0e1 with SMTP id ffacd0b85a97d-3a531ce74b9mr14483221f8f.55.1749558805718;
        Tue, 10 Jun 2025 05:33:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:13 +0200
Subject: [PATCH 03/12] gpio: moxtet: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-3-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2337;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cJsz4ZGd9pC00Thnt+wIQZLp3beAzLcJOBBw0b6Px/s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYO3xnpUc/3u6ssQztvReVrCU8Qq6iiPbgtP
 Z3BmL+TVB2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDgAKCRARpy6gFHHX
 cgezEADSssm46y31itfRn2QsV4tDRq/1Gvqk5nge7CWtX/usrhs/bK6sOyunBzV2g22yTs/iS3R
 /jcDfbiyCX0hofwExZyBaO6DbsNNGjbsHC8Y9E/WgfQoP808ECbR5jwqWJrOxoDZVIyJNzc6hK5
 olsmhMMw3rIUyfj9aKq5yv4XPuDmSk4ej/ZU1QrqEW0HqEcusEtYAVPi8b/f20VqWqhPsmxv/M+
 ybJk5xp+Q7PkxVKqrK8HwGRzVWlK7cAJUdGO3sRoN+BRPxG3x7XlfUMQHTdddkZGn4OfJf3Nihp
 x9FXOs4fh7m2+AbBNMRNtpLvNa3OuwWuqb8yx1m1ccM7OMpKokqDQiVap9+6bI9y8/CCg5MXOaF
 zf9VR/ogGqpBWtbCiRcOMHo+tMymgF2DsMNHobIwyukBOTY/dg9mok5PIBarL7DrEjmYtSuSMmi
 cR8DEjx8jynKaZuxFTxBQ3ta0s2sUk/h8dmx4KcaVMFAJLzGhm1E0sWKtS/Nos6JjmmjP0KMR1y
 Bbej6eKROTskkW5Fg2F4qL6qf5JfU5C+hpwYN3OEnSgAf54LKIBW0uTweVwGYju5nUEh4Tf8Yiz
 et0rvViK6DvnwoqFOtj5/Fg8i2xE3EpT6OYe9eBqxrkMe/ynuQyCXUbnFLXn45a8ZsWshT4g4FP
 1RApJSs+DO1jHdA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-moxtet.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-moxtet.c b/drivers/gpio/gpio-moxtet.c
index 61f9efd6c64fb4babef5551fb2541659bf5a542b..27dd9c3e7b7717d43cad3d4c6de019c9401d05c7 100644
--- a/drivers/gpio/gpio-moxtet.c
+++ b/drivers/gpio/gpio-moxtet.c
@@ -52,15 +52,15 @@ static int moxtet_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
 	return !!(ret & BIT(offset));
 }
 
-static void moxtet_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
-				  int val)
+static int moxtet_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
+				 int val)
 {
 	struct moxtet_gpio_chip *chip = gpiochip_get_data(gc);
 	int state;
 
 	state = moxtet_device_written(chip->dev);
 	if (state < 0)
-		return;
+		return state;
 
 	offset -= MOXTET_GPIO_INPUTS;
 
@@ -69,7 +69,7 @@ static void moxtet_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
 	else
 		state &= ~BIT(offset);
 
-	moxtet_device_write(chip->dev, state);
+	return moxtet_device_write(chip->dev, state);
 }
 
 static int moxtet_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
@@ -104,13 +104,11 @@ static int moxtet_gpio_direction_output(struct gpio_chip *gc,
 	struct moxtet_gpio_chip *chip = gpiochip_get_data(gc);
 
 	if (chip->desc->out_mask & BIT(offset))
-		moxtet_gpio_set_value(gc, offset, val);
+		return moxtet_gpio_set_value(gc, offset, val);
 	else if (chip->desc->in_mask & BIT(offset))
 		return -ENOTSUPP;
-	else
-		return -EINVAL;
 
-	return 0;
+	return -EINVAL;
 }
 
 static int moxtet_gpio_probe(struct device *dev)
@@ -142,7 +140,7 @@ static int moxtet_gpio_probe(struct device *dev)
 	chip->gpio_chip.direction_input = moxtet_gpio_direction_input;
 	chip->gpio_chip.direction_output = moxtet_gpio_direction_output;
 	chip->gpio_chip.get = moxtet_gpio_get_value;
-	chip->gpio_chip.set = moxtet_gpio_set_value;
+	chip->gpio_chip.set_rv = moxtet_gpio_set_value;
 	chip->gpio_chip.base = -1;
 
 	chip->gpio_chip.ngpio = MOXTET_GPIO_NGPIOS;

-- 
2.48.1


