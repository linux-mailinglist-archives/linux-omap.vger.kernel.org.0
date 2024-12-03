Return-Path: <linux-omap+bounces-2765-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 972389E2BFA
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 20:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74FBCB474EC
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 16:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1737F1F943D;
	Tue,  3 Dec 2024 16:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="p2/hedTi"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB771E3DD8
	for <linux-omap@vger.kernel.org>; Tue,  3 Dec 2024 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733244112; cv=none; b=lcQ+XBLRDewtlvTCakqGprpxE6hsTFCbO+DlFZMV5pOoN1bLb7LjcyJHrGppsAxJ8a9gKuStoKy5hOOQH1BKlJlXyJBmIkeVscGgTrM9TIvZ+H74dKHkLV6FBgN/aohIfxPhhG7DJdPYS7JOU+LuYgDf3hechSjhcrNQnrOcSog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733244112; c=relaxed/simple;
	bh=mi8ZKLBkRBFPTJhG12a+AsfcEAOw95iD8h4NMdD5Mqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qzi+NICphaGdk/aTbNOPNIhuUCXpFPkX7eQURMH6K/sWrFVGj3L4m7bBAkHBFNyRG8Qslirj8JWa1gp50cbFQbTou1aiaHHyuZbEYr45oAjQrp9JffWTgPbzxnKnpPRKLUJWi7NyN1oKSVDeLIpaRKGkdHtXmtiVgszppci9Utc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=p2/hedTi; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffc80318c9so60388051fa.2
        for <linux-omap@vger.kernel.org>; Tue, 03 Dec 2024 08:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733244108; x=1733848908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=79YYTw4OLJH/nU0R7kGinztAGDupZuTEGxaRjZIufcY=;
        b=p2/hedTi8rDsVJJskes+AiopOS0/VYtQ/i/AOwxPp15OZ4tHLSCotBBY6j5K+PMxxa
         BPumUU1Ah+VfNIajsgwoUKR70qnLgkgbhMyNsiF3qgYB6JXCxzF4lFnDQ7M+5A7U2whI
         nWmBhlcYqkXAw4XRmhGoRloFENx+LsdPapjHoyfzcGSe7xXgDUaUW048vCd4OCeFEWm9
         WF08kkx/A8bDGsLjzXvLosM02sLLiA/wLYBP1/Xk5xmJUijt1ewfW9Shw3lSOsZXKzBJ
         7Dt5TWbJhMQASkWzY3RV/bFgLNefN8LZdmfjoDJ5qu17GD4Oi6J6Cxe6Il0O7IjQFZsJ
         9/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733244108; x=1733848908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79YYTw4OLJH/nU0R7kGinztAGDupZuTEGxaRjZIufcY=;
        b=BmHmtQuKu7u0/rQ5KBgQp3kgxqhZOIwreC6TLkUaL4NDx1+AGxVNDBQdi6j29B0SFg
         Y2KgVjCnwXKe+87Usb4VZefVufpVgUnmfWle4zMA3SbqDbP/8Xhud3EInTHL8RqJkxtJ
         CldsjdAfLjFKUgmyvcaPaQDMpdZTcxb5K7MBFx7OALJCaqMVOqLlusbnCV24f+zfVZu4
         n6Sa7KueqV74OXvRGEZv1P6o4xVAX8+1UOedxwtqvLS2tizMheyq6LSTa9l5Cp/gb76S
         kc+XEGl76XIDNqGmaS8blf010gjsuoUL8dHsDg2h5VNU/2VkJbVL4Pt9ddNXuY4nl9QE
         C+ew==
X-Forwarded-Encrypted: i=1; AJvYcCVwlp/mbMeERsjymGSTrtK7EotnVBV6doeMIgFAoQrbcmDNdcZumyP2KONu5pvWHZMx61sFzIba1eKu@vger.kernel.org
X-Gm-Message-State: AOJu0YxZyiGepq138JYrEOjlF8p0DjjTxwii/HLEfryYIbvivi2pVpNB
	vHdmZ6IBz+jd1paiH+6E6uV+8AmS9wRY0hdslrNYyIh6qNs3spDGKfRbnL8RKNg=
X-Gm-Gg: ASbGncsR5w0Lo3PQ6Ej7rJGm3eeRszvi9ktJ6hOCC8aoxVOfZK+BCmdi+d+vz9EVlO/
	tWkQigMDqNEfv78kJ3eH/7l3AmoiWGBlCZFsGh6gsTtWUQn3nhPN9n9Zhraqx27SPys6qRQtG1V
	2sJZQ9FKyPFkdgFdD/ECWzCVbT4eRL4LKWXukhl3xAIKv/ZGyjSEACtMJnOXB9+hPKnnhMrSkMi
	5en2Fz/pETttYk4OmLlruzhVOvrJLXsE2S4XV5/KM6CGHHWA/DhqJFb0kKbUB1L04AtAhnLouop
	oVxxsNe6V4iy0Q==
X-Google-Smtp-Source: AGHT+IESQkBNm3NGGmpXD3R9iAv+O3VG3UIwtvPMrzNoDzrMyo0u4WNNVUXmqMJ3+hGaEOr2LUgDGw==
X-Received: by 2002:a05:651c:2210:b0:2fa:cdd1:4f16 with SMTP id 38308e7fff4ca-30009be4929mr19048471fa.14.1733244108166;
        Tue, 03 Dec 2024 08:41:48 -0800 (PST)
Received: from brgl-uxlite.home (217.97.33.231.ipv4.supernova.orange.pl. [217.97.33.231])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3000b262f32sm2482161fa.4.2024.12.03.08.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 08:41:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] gpio: omap: allow building the module with COMPILE_TEST=y
Date: Tue,  3 Dec 2024 17:41:42 +0100
Message-ID: <20241203164143.29852-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For better build coverage, allow building the gpio-omap driver with
COMPILE_TEST Kconfig option enabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 56fee58e281e7..fb923ccd79028 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -530,7 +530,7 @@ config GPIO_OCTEON
 config GPIO_OMAP
 	tristate "TI OMAP GPIO support" if ARCH_OMAP2PLUS || COMPILE_TEST
 	default y if ARCH_OMAP
-	depends on ARM
+	depends on ARM || COMPILE_TEST
 	select GENERIC_IRQ_CHIP
 	select GPIOLIB_IRQCHIP
 	help
-- 
2.45.2


