Return-Path: <linux-omap+bounces-3812-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD057AD3684
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 14:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CA09189A3BF
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 12:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A60F29345A;
	Tue, 10 Jun 2025 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="X9POp9IX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E525D2980B3
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 12:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558816; cv=none; b=PhznUm+osEgygKHqFUZc1D8IEhJwIHnc3F5kPlfK7pA1cd9Ctv4GSkKRg1FcQbnaPlBVHvYASXGvKYwaGoDgmD8i9LQrwjmjmmY6obsGJjaOqnfNmYbSjoXNEidjE7e6gQDB0/cME4uP3KXCIuZQf8zwaCuuHLz2oqiUjQQGXj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558816; c=relaxed/simple;
	bh=Lm78y8CFPM8ZaJ+Z4IY455wU/Cs/n37OItmLKqf9FjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A1X1xBmj/EucgZJ2jTDPLbRLOpldoSxUEWukFQrmUKB/oKFc8WazIBnd3gwSfqXvZzpcnyR0YMA0hQawbj1ajUR3ZWIWn+dHKk9FAM96GOGXZMiZnuEJwry0OQ7bGnZ7wbXg2Q+KaANq+9nDEVcaChtQnh4Y/XXqLR1Lep3aCSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=X9POp9IX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4f71831abso5075313f8f.3
        for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558811; x=1750163611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nL73BX48X8AKgopehjQyiYACuD4u/nSLpuXvgAof4w8=;
        b=X9POp9IX/rRhrd1W3QcH3B24uJLBLs4kbUIQ8Euskt4i0QPyIE2rngdaT5bqLW3ufh
         klaRpCEP3l4Ma8L66qEoiUrjOvDSi/uOt0ysPB7ZXmUOhhGDcpIVyKxTaHnJK8GD0uoQ
         e+1JdAEC/+mW4kJ+AGxgCFtfDz5ujNWkZtnd+2B6o94R1uESABM22FV7AR3VdLFHHAxH
         Z2tNJRmf1ZEn96yeXSZ/MuasSA88XINdedbAyFkziTLZRSH+kBp5uMZnxT+HnfPum2Ln
         /C5RRdLGRzDS38Y4vOE3Kkbne60+N1wlA8T4y8mk9qLc9++NIJ93Wk1f+JK6XaQonI07
         PV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558811; x=1750163611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nL73BX48X8AKgopehjQyiYACuD4u/nSLpuXvgAof4w8=;
        b=vDrEagmzmWYuM6p2YUx/BTzWi5AuVLNI9c1mTyRFQQZ9YgDSQqN3/VsEh8M2WEW7kO
         vwITNlglnnmX77VdJxATQTq2/K/M0LQZKCiKW9kq93UpfyHMDC3uUJRjSdAKODobByvF
         faMHWxFc8RjweF2ig6A3jZ9xNFbmeKfjIaYONK4H+P/xF83kQfVqtgt+jt+gAPLMln0b
         L6nv/AmahJyi9skBCmJUXy7IfE0F2hVyE3C1LJpVnvTF/UQBWWjpy5er/LduGbi/2WMe
         ZOZ9ktGhmIPVxtBFL8Ar7LwRad8tkdZoXmAtnr/Ci4awJQZIGsedqJ9ztttG7TeJOJsR
         O5Og==
X-Forwarded-Encrypted: i=1; AJvYcCWr/0dCXkKR2L6oviWRR7TpyeS5V5h7QOjH6is9rEpXi1hmGD+sBN7h0vIZ25kbSh/U5wAhVuI93FGj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7YWmKb/Vg1927woJT47m1IOnCVh8KC4yAuKZNDhyWv8Q76XPM
	v8LcPjb4x+nUM8A1Mbr75QGPMFL4IzH1eLFUMKpZpMeJ3LWApp9LawPttnncLyTXUvs=
X-Gm-Gg: ASbGncsWyKEdAeX1eEY6HhsjqFkP0SidlSr8NAm9m4C8rr+KVd3gpWByJXI9egnAGBk
	cSIoMBceOFwaAd96sEIntLwyO99JRjRAlNnFc2LEvFV1M7ym6cjaS82ffyDMekZIjfXa5Btsa+o
	deVFRhH6Rl9gS4ogk5N6K6/MBG6tdf3VuwOdx09P7GmrYgqjdleeq85YtAqpuxKucdUxPQ6sigx
	A9XEVg0ug2bjVJOqkACaZIp1PKm8Vc3o8R/yPtgV9vENWqjIdxw7nupJpz5uka5x06izfbnlCVj
	fLX26RwSQHIYkoCeqNu350O/oEJ4tKbZSbF2d230b0i2CpjaGmoiaA==
X-Google-Smtp-Source: AGHT+IEiNibcNMiVsbQHF+47L41QAAVONmrgvcTQ9HOwW+eRgKNTCeQ/gU2brhJ6L5+0fDStZI1sQg==
X-Received: by 2002:a05:6000:240e:b0:3a5:1c3c:8d8d with SMTP id ffacd0b85a97d-3a531cb237emr14618808f8f.55.1749558811315;
        Tue, 10 Jun 2025 05:33:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:18 +0200
Subject: [PATCH 08/12] gpio: nomadik: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8SMFcEMP/yadOAddKphU2LRj+bMl3thvtyJ4brm1q7k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYPNZX7SmF68qJHpheQB5Bvy2U+bFuaYHRkk
 DPVGcTa+SWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDwAKCRARpy6gFHHX
 coOIEACRhw6kCcmI6Qk5Uj1hqmX0byLLYekHcBjVu6C0ctu5rgUkddKMjGT6YzbWLvwnGp/o+az
 B7cu6TULK+CGHrcSoGO/JBAtpG0vLkNjQIDPjUr0j75ifLhmeuE0jvgszHFIFyVSHSOdthyj9w2
 rsEmzCLFLsSXCDgBh2oFj2EhfJhxZI8rkjn3ox02VOjRjDrtAt/aEljk/mSrvKj4Tq9biIjCIgo
 o53nCEEkmYf6kgeNtBRKqfNg0ddAaneqdwzZ7Sh25b72vVSBWwaBVZ6d6S/RsrYndL3woYZ87Xm
 /dePA8YZOs3Ectoylv+V7MZcEGuIZro5nVhzeMBOYZiBUXedMjRsm87FW9+ltwQUiAeZfQz+6zI
 nNOeWzApu4vwd0hMs9rtxT3GRXGaQKpXx+mGZBn1Yq80KptRmM/VUbh9rfGHjmet99x9gtRchCh
 2ACbns1aWtM+B5mgT7GFsDeG46pOv50D5+6uuGsTdssLU10ve6GAQpD6S3ks30fY9kQY8/FsvE2
 RKDd5G0DJ4BmukghAk+CEvLjouL/qWS+JDyjagXehsDB16fWjwSmxOKHF+TmaOC2M1uS9qiz5wS
 /6f3WIunj+fATUaxSl5bQdqcPthCVIh7B8BN296a5zC1QRO20KkJF/m6PNIGSKzstuOJNOLhYE0
 d6QPrHLcpkEmVsw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-nomadik.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index fa19a44943fd7ae167079b34a48f669a38ec4ae7..296d13845b3009a52068ecacd8d2d6a25eede9d6 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -347,8 +347,8 @@ static int nmk_gpio_get_input(struct gpio_chip *chip, unsigned int offset)
 	return value;
 }
 
-static void nmk_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
-				int val)
+static int nmk_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
+			       int val)
 {
 	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
 
@@ -357,6 +357,8 @@ static void nmk_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
 	__nmk_gpio_set_output(nmk_chip, offset, val);
 
 	clk_disable(nmk_chip->clk);
+
+	return 0;
 }
 
 static int nmk_gpio_make_output(struct gpio_chip *chip, unsigned int offset,
@@ -672,7 +674,7 @@ static int nmk_gpio_probe(struct platform_device *pdev)
 	chip->direction_input = nmk_gpio_make_input;
 	chip->get = nmk_gpio_get_input;
 	chip->direction_output = nmk_gpio_make_output;
-	chip->set = nmk_gpio_set_output;
+	chip->set_rv = nmk_gpio_set_output;
 	chip->dbg_show = nmk_gpio_dbg_show;
 	chip->can_sleep = false;
 	chip->owner = THIS_MODULE;

-- 
2.48.1


