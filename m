Return-Path: <linux-omap+bounces-3804-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 962BBAD365D
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 14:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4140B1894E27
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 12:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF962951CD;
	Tue, 10 Jun 2025 12:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DdAuaY49"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE0C2951AC
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558806; cv=none; b=G8h1Ayqrmt5C4K9UYSSmMIoM/4eCXU7WXoiMPNQQkTbAQeovU6ZqMz3ljqmllJ/Q047hE8wtm6Vld6Tp3ETCahEGfMMknb52gfIE72W2EIpW4tmu4N+fReqa6EICvkrtjudp38quTvYMp9J+wNe9jyZokHZuCS5paOYmZlhtHJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558806; c=relaxed/simple;
	bh=fWmHYF76bW96bFem7JRqwAgfxRBoy5ySHaPTeItooXg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o6bsLYQ/5LzvmHYlILVpiguhtVoiKJI20lRWijPGx4U0yTFy1x/JZsWuD84YYzSD/N692uz7F/yLrTz/VVH/7CW9yFkn7bRAm156yAMQae0v1qhchiOfUtOY3P1YetK877UkAB0cIi9MG9RrIF35j9nxPRmSlgDQNPjljyMMXnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DdAuaY49; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso34045345e9.1
        for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 05:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558802; x=1750163602; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhzmZkaOysW/GCSYD6XdHL+fOaPlZnqEL0PQsaxb3p8=;
        b=DdAuaY49PgQ5JpsdlfU1TEzS8QOgwfoP4zczOlY3qFz/PMQhq2sTNxB5NzsSvJFzGj
         M+juv/CxN/L0Ki5oyhfqu5ArL0uQ5/zP//XnT/Gqab239pGdyrZtucTQ4bYGkwhKWgZe
         iE8suL1tyZIUReNQ20rlAM3oPdbv8rTY7LC0l3py/EB2OR8sVculv48RN6OJDYQxpJPJ
         aqREJmcXzS44yOo6AASwVcugiERpnbeF8Z0tezSJtI8pccO2+am1qMJ+nLxL2IXTOF2p
         qs2SKLER2LKCrSRya6BU9kEIgzOS8owVMojmd0FmO0zrTQZKyJ/PJ5d7sgJMbPcsxnNB
         VcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558802; x=1750163602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhzmZkaOysW/GCSYD6XdHL+fOaPlZnqEL0PQsaxb3p8=;
        b=AnhN2q6LayCsUSp+tftZeHnrIeJ3Y1Gt0Qf2xB8WGePe0hrTwfPSbHUtIE7LpNVLTv
         qF6pG+B2kXD6e44QYAf2ly6Bh3Taa4ylPZhHMcNWPJzXA64V6Z57XcYbSoWx16K44wcG
         ioh7zav6Ikjpmw1BkNuDjaKyaD/H72LHJ73NU6CzAzetPNo6cDECtg0lVcz9nR1rPsoA
         brZ+VI2iJgbjXtt93TXd98qAWanOXpMWuZbBXNJMVqIv3zfI2Ie22a+P43IinFVP2gur
         j9sj2ja3Hrb/Ekc/idkJqSHQeDoghbO6yR8owcJO5RPndgNWQGZSDb4NLHbe9e7TFoQi
         S7Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWyuOhuQ6NYigBEUxCMxspNKqZXb84xmvD4Jc7iqmJXMt/iEHrNbWK9Bhq7/KAuZ+BnCx74swQKg0oR@vger.kernel.org
X-Gm-Message-State: AOJu0YzMoBZd7B01eqIQ14ovys5JNhvabsssPlPX5D+BXZLF+L+UaIIh
	fcckh0oLyDM/FUSwY/0VAuCpdKGKiJigxe84wv0U5EWKaZyJeqXUmdi202PDZs8kOv8=
X-Gm-Gg: ASbGncsin9c0X/SEgXFJc/TmrEYR+neYR4ETfF36Us2CgVaJl+MzpuuCU0w5B9SoIVh
	umnv8WHmTsA2ovQiUGLlRcdz59qJ8/BZt4zjHCDtQn4ceBQvcIzjuxdHKu4KCm1H41PZU7fNCoc
	zn+vH8e+ELDDBCEcdA9iPdkrKI3ANzGN6iccab6wd0o25jQZii3VybPUDg6OTj7opQXa85aewoq
	cSJGqWmhevZl06am8AtnkhK/ZsUWc+O4lemAC3S1FBf3NI/m9pCHFJ/KzPWnqtAaq7aD3Ez/0WG
	gzcpHwp6wWe0CgFOfa2uIBL91R4hXRIBmgcteCBA7gdwaiHqTW3jqA==
X-Google-Smtp-Source: AGHT+IFlnKIx2sPK6MrXH51mtosjIEJBmZxPRvw+nyl9XpBpBAq4wOuT9n5DEtW3OFTtEqksbAo5Kw==
X-Received: by 2002:a05:600c:1909:b0:450:d019:263 with SMTP id 5b1f17b1804b1-45201437502mr155154265e9.18.1749558802123;
        Tue, 10 Jun 2025 05:33:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: convert another round of GPIO drivers to using
 new line value setters
Date: Tue, 10 Jun 2025 14:33:10 +0200
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAYmSGgC/x3MQQqAIBBA0avErBvQAYm6SrSQnHQ2KhoShHdPW
 r7F/y9ULsIVtumFwk2qpDig5wnOYKNnFDcMpMgoQwv6LOkMkrHyjaX9RqMWbclZp2mFkebClzz
 /dj96/wDxMn9UZgAAAA==
X-Change-ID: 20250527-gpiochip-set-rv-gpio-5071a2dad129
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fWmHYF76bW96bFem7JRqwAgfxRBoy5ySHaPTeItooXg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYLDKKT/3+Muqt6vpoLhH2yAyeaiX8AvzjKc
 lz6bLAcJ8CJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmCwAKCRARpy6gFHHX
 clG5EADX3eLse0M6879cp/rXFPzvNb0m0LUCg25b/7UyMAlntaEe6vfqpVdDnOymoShonFCkXzv
 UAW5igUaY4Qv+2V2lp3v0/nKaaYeJrOCDfUqrVQOxgrjQbfGFE5/gVuucblr0r0CSv06TL7XYn3
 95jvOjxXJS1R46cvDsFOvc8iY/Ysk5EE2kaHqYX1Zez3Fxe0j+P+AhjsjUgxExgTaYkgj9X9zLp
 Iu+nAJxFgnOojFHrmzm9mK4lntAhEgFQO/F1JWyaM3iBwo9mt6sM1y9VSJTI7BPRFEKas0gge/c
 +WO+kKXAYEQ6wmlUILezREVVJGDIx+bRxn5AIWBFuOd/Z3PfayT5w1/Y9xACMAhzLxl9yx5XesP
 nrKUhNloMEin8f0em+DkP0y8cvuSlidQRetWsqPNH0toyKsndjNNLfj2la3e3jr7a+jT80cJPNI
 1Avz+GrNf2pfgD4bWKTCV/os10gXRX886aWYB597vDmJtcg02a1ir2uHO7jVDLBeCnTA70tWjZI
 N5X9rUNrlBfLU0A2y3Fuu4E2H5BoAFR97vPSCLg63FIrfsm7vPc6BLdNICULsKJ1K+aw/vp9fWi
 KLUZjmJAwGPKjiCr8Wsw4Awh8QL0olPep0PXVM0IxA58xDrvoZkvlp/2/NT0SUetVd8mNoJ6G8j
 rmFYfB/NS4+mWZg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: mmio: use new GPIO line value setter callbacks
      gpio: mm-lantiq: use new GPIO line value setter callbacks
      gpio: moxtet: use new GPIO line value setter callbacks
      gpio: mpc5200: use new GPIO line value setter callbacks
      gpio: mpfs: use new GPIO line value setter callbacks
      gpio: mpsse: use new GPIO line value setter callbacks
      gpio: msc313: use new GPIO line value setter callbacks
      gpio: nomadik: use new GPIO line value setter callbacks
      gpio: npcm-sgpio: use new GPIO line value setter callbacks
      gpio: octeon: use new GPIO line value setter callbacks
      gpio: omap: use new GPIO line value setter callbacks
      gpio: palmas: use new GPIO line value setter callbacks

 drivers/gpio/gpio-mm-lantiq.c  | 12 +++++-----
 drivers/gpio/gpio-mmio.c       | 53 ++++++++++++++++++++++++++----------------
 drivers/gpio/gpio-moxtet.c     | 16 ++++++-------
 drivers/gpio/gpio-mpc5200.c    | 12 ++++++----
 drivers/gpio/gpio-mpfs.c       | 11 +++++----
 drivers/gpio/gpio-mpsse.c      | 22 ++++++++----------
 drivers/gpio/gpio-msc313.c     |  6 +++--
 drivers/gpio/gpio-nomadik.c    |  8 ++++---
 drivers/gpio/gpio-npcm-sgpio.c |  6 +++--
 drivers/gpio/gpio-octeon.c     |  7 ++++--
 drivers/gpio/gpio-omap.c       | 14 +++++++----
 drivers/gpio/gpio-palmas.c     | 15 ++++++------
 12 files changed, 105 insertions(+), 77 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-gpiochip-set-rv-gpio-5071a2dad129

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


