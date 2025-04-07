Return-Path: <linux-omap+bounces-3540-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 418D2A7D5F7
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 09:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27B06420268
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 07:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68FF122CBFD;
	Mon,  7 Apr 2025 07:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="l5XYa4Ye"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E54022B8D1
	for <linux-omap@vger.kernel.org>; Mon,  7 Apr 2025 07:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010488; cv=none; b=UWEasN3kyiz7OmfFNnkkqFpOM29BoL/9pxVl4FcnJ1lm2BPiSKKPUVxnMr4k0W3DctdEWsUlhRqab4YXBwqsU/pQonnp9T3Rh1MvRFadvroMDAgW4daca6yvM2jIWBCQXX91urmpiUbF+H02n3kGxggPtLynVNeqQMF4y0zoQ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010488; c=relaxed/simple;
	bh=a+X2xbpBMey7kHH4SZHjVwfqMfk31JwTN71fTF53W5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lp3V9xzBln8f+TJThgNR0pZQgVnjJqiU6Xs1L0qymnY2W0/aqd6J9i0nVSZ2v8qT0YV73o/ZqCUzfzpdTcm9HIw6DujwnfYRSx2tZ4DaxzMBJ/bp8HUvUQeGpGu6S2n5J1Q8S2W85AP4Nt9C1NlJZDAWJmlY2a8qUOHpFcr7kPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=l5XYa4Ye; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso36741805e9.1
        for <linux-omap@vger.kernel.org>; Mon, 07 Apr 2025 00:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010484; x=1744615284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtgBZ7eU2RyQ7K9QClD4KK4V7G50PAjgBWwYE6tDnr4=;
        b=l5XYa4Ye9XNYijVUo/jis9T3jp2c660XZ+HkwMH+gg+yjSEN2fYvRyHWvvVg4iKEnQ
         sOQdCb0r7PxyO3wKGHTHM0bU4yRIO4mv3UqmF+NBaR9eDcaiFxY1Do1LjYCRs+V3eA2u
         L3sFuXVNCL8aLBHt1w+AFGtqegMF8X7SKOEzn7B8Ir0KeypRYiDMyjWEvPLWOXucX9Jb
         kRYV9oUBmiT4OUXZO8BfmzLL86q5MaHk6Mx5ncqduzN2d9vuefDEiWZrcEMysiuxd/vF
         F9MKrYjQhi29wgRkqfOrq/rU0/Dp2AqHPhqYE7SLP2tE4JBILfKbKwXLNZ5OvR2VNvDU
         1PrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010484; x=1744615284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtgBZ7eU2RyQ7K9QClD4KK4V7G50PAjgBWwYE6tDnr4=;
        b=XT3CczKxibH0lIrA1EGZuR+UoxYc2pK+1P1Kqh7vtHq8wa7qFe8ZmobmI2uKe755dO
         n7jgHOZskOsAaAUzOuMYyV7NK5g/MWF/ooiPadaqM0Cemydm/nsvWDwU7z1T0dbg6v+c
         fJhfyZLngPY/u4W3k3XMnEbEkQxKp+WgZM3Q6pyDim9pnPeLofB5ydnWqx89XAdXJD58
         Ksiw9iIAUc3O4xK67fU5E7/eWTf1PtyOOqlW9X1QkHbtuLip5eILGo8IZ13uJZzN6qsH
         jX0mWjgXKYlOSDLxXiXIb2IB2r+WXwBxQwa4iMIR9CaDxJLLoK9ifHGxCTlFr05ZxRpn
         Px/Q==
X-Gm-Message-State: AOJu0Yz8qX/QQuZOWZvvOw4/rJ6fAroWcY33WPPJFyfX+3sHFsmBGaep
	kjZtIqIfEOdNcAla+6k6gYsxFV26TPsFKWQemKtoT19DB3AiOVjx9FppP9o51Rk=
X-Gm-Gg: ASbGncsnoen4ooT6vuoX+QA3fb7/Ry+BEMnfmdNWMl2VVcGgIWEfEScKRgQTnKFRasK
	9iMO9677nK5aeQ+6FNoDQZhOWvdh0K6J7j1y5KYy/XxsdqoCLApyLjULgNJDOpXEdhTuD1Btrnn
	bWstRQm3XFwqwpc7r982elzdFol0dkrVqWdmpBZxhyjOzYvccLlOfEaQuDxgIzcWyDyyEuMDm6c
	61W8nkf8BMgE4rbN1lQjOYbTOxq7z322e1st3qI682znXtcLKjmncU754y5OWrwRgyKU1KDxDNq
	ERecr2XXItewzW5SGnwRpa/RvG4Bq2B78boX/g==
X-Google-Smtp-Source: AGHT+IEFfF6NsFb+iD2Dwb5PIsfcjTtavnPo1FW572AhfERUhpnGldlTQTty75Rd5V3CGThwZu431g==
X-Received: by 2002:a05:600c:4449:b0:43c:fe9f:ab90 with SMTP id 5b1f17b1804b1-43ecfa18d6amr74518805e9.28.1744010484347;
        Mon, 07 Apr 2025 00:21:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bbd9csm119983655e9.20.2025.04.07.00.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:21:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:21:20 +0200
Subject: [PATCH 2/2] memory: omap-gpmc: remove GPIO set() and
 direction_output() callbacks
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-memory-v1-2-5ab0282a9da7@linaro.org>
References: <20250407-gpiochip-set-rv-memory-v1-0-5ab0282a9da7@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-memory-v1-0-5ab0282a9da7@linaro.org>
To: Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=jArihSAhBxkP93ay/ZjcYrFJIACv3IqWH8LZYxUU1yI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83zxZ31S8gqjE6RumdrktJc88LidiJj2N2ODy
 PHjicRRsMaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N88QAKCRARpy6gFHHX
 ctBlEACgHv2EfbXGd6EpZZRTqnj38TMqOfFUzwWMCCrTlcfcRnT54k3uqFNxJhTNeordcuXHUxP
 H3t5PtMye9H/3zNS/z1vF6QxBbk0iX93iIoapVmHYGr8q/1vf5uguVbh+rbmGngIfp4zGLO6bqJ
 MjvrcDkZ2uVd7pS+gVGe7nN2Nby0yZVBcMw6fcYLcHUmmt+hMHzvdYPeX/WEqlJYh8Qg1FIk/jA
 eAdjOZoMy8p8ccg4W+fN1KkJskmsr+WvvDujB1ElpsPDKZe8a6GpNKKHqjYIuECh6WPpTU/2gUy
 5ohToPPkGrrjRdG1QYNlVMGoYzSOhCPolc5jdjIfvTXw/RVpM1sXqRodWv30w0b7tKNkSNzCZW+
 YQ+LzxNQ+FMRUeEXE7MiPiyUF5837ryugHAvKuucndYp7iLBhgO0RTypz0x74/vvZwhuCdBR0iU
 mFiyIcY4jqZMFF8asaURPotDzhHOugldYONXW10Vt9DDzLG6jRdRQd/XMT1F3E9YrztTkgb4SvA
 wh4lX2tS4jhk9o4gKjZSDvuA2aylctO3chJKWQA7IpUpRYhfLqgkgm8lsvGfPsU48VgQ+QU+f7X
 arm0viz+ZZTgdsILX9vUwDpG5FPdSBcMkEkNoEC8L0FOXrg42PZAurLO9Hy6+wdtzb2DKFRI9g7
 pC3+JklCL61b41g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver implements an input-only GPIO controller. There's no need to
implement the set() and direction_output() callbacks in this case, the
GPIO core will handle it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/memory/omap-gpmc.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index d4fe4c5a57e7..a61e71c31f20 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2385,17 +2385,6 @@ static int gpmc_gpio_direction_input(struct gpio_chip *chip,
 	return 0;	/* we're input only */
 }
 
-static int gpmc_gpio_direction_output(struct gpio_chip *chip,
-				      unsigned int offset, int value)
-{
-	return -EINVAL;	/* we're input only */
-}
-
-static void gpmc_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			  int value)
-{
-}
-
 static int gpmc_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	u32 reg;
@@ -2417,8 +2406,6 @@ static int gpmc_gpio_init(struct gpmc_device *gpmc)
 	gpmc->gpio_chip.ngpio = gpmc_nr_waitpins;
 	gpmc->gpio_chip.get_direction = gpmc_gpio_get_direction;
 	gpmc->gpio_chip.direction_input = gpmc_gpio_direction_input;
-	gpmc->gpio_chip.direction_output = gpmc_gpio_direction_output;
-	gpmc->gpio_chip.set = gpmc_gpio_set;
 	gpmc->gpio_chip.get = gpmc_gpio_get;
 	gpmc->gpio_chip.base = -1;
 

-- 
2.45.2


