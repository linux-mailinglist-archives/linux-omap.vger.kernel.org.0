Return-Path: <linux-omap+bounces-3891-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A230BADC5EA
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jun 2025 11:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C53D2189383B
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jun 2025 09:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CED629293F;
	Tue, 17 Jun 2025 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rY4Za35o"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15300290D9E
	for <linux-omap@vger.kernel.org>; Tue, 17 Jun 2025 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151664; cv=none; b=hQ7HVkxrjxgLeAP7likGu28+UlNcLDbAX3o/pqKuE5J+07kkl1BtIKbx0ZRY2O014G7L9oRQJ6lCThfgJyPkTSwY2YTlnALN0jVHWmOof/HESmBDv/A0yLs3xDtewpXAYLfmghgJBkNuHf42d8eWiD4uFDf8wGmi/4gBaI+j2+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151664; c=relaxed/simple;
	bh=7WDJZGLza1OHlk0gQlkqb4Yxfh5XP2wKfRxEaeiBz1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l5JKppVPLXZzGmqHyVAJs/0livPSQ8ANSbImL3PTN/1GxCDJYHTTyFUUGaR6Jh7cMoxm8VQvYRySLdRKROH54J0W9nbPhdNxE0OnvGiA97wTu/ELKBZ7tFJYHAbLiKtmZZr8ny/tKCuvN0lfKO4T0DncCgdlnXpPjNvD5rK+I4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rY4Za35o; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45305c280a3so22164625e9.3
        for <linux-omap@vger.kernel.org>; Tue, 17 Jun 2025 02:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750151661; x=1750756461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2DwhOwUsMunVDJWED8rmtY3JjlBmcuuZx6kyq72hSI=;
        b=rY4Za35oGlalwwh9bWutx+y1NTSYmJJ9QIqXkH9DcLLAbVch0GVAQbDrp0oJe5uIfh
         6BHkiwIBA5kfSo/noJxNZXFydCVth5cmZ6d862I3aXaj6GIXzcv7exvTESSlMFP4Y5sz
         0iAG1SF8uWCnjmF/dHaW28g2jfE7oHiMbguusXZjvW2Fu9b9Zemc8VuIUa6iPdW8/zmz
         CxU1iGfdCORTeXgUK5Ck1+tNu8N39PxF3omYfPsYgWz4guLr6I/4WZlCeo13n6KZ2grB
         Kg3Q66IjblgUl4BrikeCb5qm3Byeo3YH/ckkO/rzL9XXW5Ut7yxLwpHmGwYIVAHeLvCt
         bj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151661; x=1750756461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2DwhOwUsMunVDJWED8rmtY3JjlBmcuuZx6kyq72hSI=;
        b=woRB4uuNhZeNYy1/Q6LCX8Ohp9LTPpMY0aCi8f0jAtBTf1uVSuENSohmrtPtPADl7d
         BMIrDl3gw16mmIePRCK5ue5ZTYkK8YtE06HC14Vjz91ot/5dShhuYlq1+Lrxl/ceVWqc
         Qztv5utTeXsno9+r9RXN8LJb5RCPQKUfk8TKw+drnMDx595Vm+OIxgCsb/erPEjMNc8q
         e3/9WL2LqefWtbiHvfrnkW/c9Tp7Fb7zfNzv6x9HixYQI0hXX2KnTInu5+zJnPUET0Jg
         8Vu2hJDi7kxQuOxoAYdkkKY6JQVS17/7MjMCe//Q9WC2KL+OuqmyFoPoq5tT9Kd3/rvT
         pf0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVt+/OxLbEPcA/ympWvoDaRIrYqq7aDkMxbmEzivnQ1hWK3LuGMkTKhgNQXKUtFIda2BrcfgItg3rm8@vger.kernel.org
X-Gm-Message-State: AOJu0YwlAhbvlgCWi07KT9fBVZTvaE9bss8bAvEYAZaCsrfveDNsavJQ
	kjGO1I28bLWAZ0Tz5kDxhe/jpZ0TMBpmlwC4QHCv6KEMmN0JCu3PAjlfi64xvN7WS0k=
X-Gm-Gg: ASbGncvHJfZBsxzRASPT+OXGhdYyuaiDYuylYlN8iExbujFiKCFPwfNkmBwgi70w4X5
	brVzUguJO8TspgEP23GXxjdTq8gjFfKPaFooEJ7cP8A2r4hJSfxmkBsG3DLIId5EVahhPZiMKgQ
	TKAct/ke6S+Ef8kTvCkR12mHWVXVqQbJNnSFmzZYhPpex0Pkgq2o4s2jRrGbKI8j4EKqRN9mJwm
	gEU1pwldrXe0Q9AckKRzfrcq7f1Dr3UruLJLQ10j0Rn0dKuz8zCJmNqjGALZlkShWpnW5TnnF0R
	EWFzkvGzPexxMTGNHgqljVg9Dg4IgOSYNtz7p4RyFnIVaPQTqIzFu8+ddSr6DkA=
X-Google-Smtp-Source: AGHT+IHJrUzq11FqzFpCalpA8oxq7QOoJUd6doTIPdsMKhwT2j2fIZKoD5gQsAT4CYJMYxX4N6Amdw==
X-Received: by 2002:a05:6000:230e:b0:3a4:e740:cd72 with SMTP id ffacd0b85a97d-3a572396df6mr10071598f8f.13.1750151661308;
        Tue, 17 Jun 2025 02:14:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a633ddsm13280685f8f.26.2025.06.17.02.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:14:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 00/12] gpio: convert another round of GPIO drivers to using new line value setters
Date: Tue, 17 Jun 2025 11:14:17 +0200
Message-ID: <175015165197.21779.16487408157196142174.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 10 Jun 2025 14:33:10 +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts another round of GPIO drivers.
> 
> 
> [...]

Applied, thanks!

[01/12] gpio: mmio: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/b908d35d0003cc75d4ebf7c24a61b07d34e7f5dc
[02/12] gpio: mm-lantiq: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/d27746181905c256eced857f4b2c051ac44b0b45
[03/12] gpio: moxtet: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/b454580cf11b45a9da22821543f1455a6a31c5ee
[04/12] gpio: mpc5200: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/80d42372d9d87626b55516779e935c012cecdae7
[05/12] gpio: mpfs: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/3aa3628f8168df9fe154b09b1710d3314b9fa4b7
[06/12] gpio: mpsse: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/e63d9fbe9f148b44f2fdc211941f2d4485022549
[07/12] gpio: msc313: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/88a775454a0fe923f3d34d8f30cd1d6b75be0859
[08/12] gpio: nomadik: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/aaec273c7b511a7826df09123a1fd6e4896c1bfd
[09/12] gpio: npcm-sgpio: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/0e1a8930c941e3a7bea25928b254ece8caa5135d
[10/12] gpio: octeon: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/f02614561493da22f24b0e2ec1c2ae0d5b41c68b
[11/12] gpio: omap: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/57065d62e672bce193f186c7b759f928b9a90ca0
[12/12] gpio: palmas: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/f3763403a6bbc3a18379fe4c415bda899a111d55

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

