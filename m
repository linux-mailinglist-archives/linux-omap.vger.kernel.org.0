Return-Path: <linux-omap+bounces-4023-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6A0AF0F85
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jul 2025 11:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 248E37B4966
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jul 2025 09:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CB024DCED;
	Wed,  2 Jul 2025 09:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KKDCfopX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E1C245008
	for <linux-omap@vger.kernel.org>; Wed,  2 Jul 2025 09:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447659; cv=none; b=aj787Pd8Vw9H2SUvuLHm8V2lsSFe3Leskoqsbk/AaeRaIooTRJbXpEVFwXcRj38wGx+4A3hwoyCBwuNsSAmoaWwqm7MNWYp4Wh6JeFGIwpNUVc3aOsfm+Nb7Q0CDnya6xcF8Qw1D+h48ZkQxq3Qp/4fWwIPJweoPMHIVbHKHEto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447659; c=relaxed/simple;
	bh=+nVfuvhqkPVOVmugfFAWLkW4UOX/+j89Gr6pFORnwZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sBm1SM571865r/MlCpC4H2PPs019Bw2Gu3QAmSliGsqaZ4d/lIy3sPT4Hw195HRGifl2r8NlJvOaNWZvI/k6TQsP9tmNPVrk5zC6lW9BNz50r8RwcJRWRUz+AaILnm+tcHwrmi7bo9Z5zGfnyqZugnrN8duJ5udh2QkYWar1mWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KKDCfopX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so4853506f8f.1
        for <linux-omap@vger.kernel.org>; Wed, 02 Jul 2025 02:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447654; x=1752052454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9px667tsfsWvUcAYLU3o61szQ9B4CZ4odfTl2msW8zY=;
        b=KKDCfopXZPHGH8oT0E61+DZR1+mgHhNbUsthAdhfpq+5QlntbOF1rTh4RwTLhMeKKl
         TwxnM3npbJJFxChHHQXZZu+U3qzYVsTjkVrACmtoWCVJwZFeCWLAih1nYFaZRh/J1B0R
         OvdpsjQ5eAhDLe2/pCvzaaovQC4vamBrGywzglgnKCDd7tDpAPr7s6yMS/ABn9jAV2kM
         J/9JU2NknuHtRKOtfDJpSQtb4DY44xXjeRoYCJ9CXacUzYGwwbl6JpFxOLaOSeabBb7O
         /yPSXb0S+HLQdeSGfFJh8hcUkxxVbvToyEugze08T6Fy4d51qZIyq7BLSpS/93vBWhMY
         gXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447654; x=1752052454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9px667tsfsWvUcAYLU3o61szQ9B4CZ4odfTl2msW8zY=;
        b=hBUx+kHnzkhfktKCk6ev5P9V5o+DO8WOK+OMtWmBVD5tT4ACfVYRIuo9m/4GpuIYZc
         4zKqfhoUaHJ5u7cUXUayhaCci7bWui3g2RFTbV2UOUaebB1mFVSNhrt/AKXb/YJLZBb+
         hTGsr1kS3O+Ol//xfNBJrDrcnYa8eOw8wZcE0gL8JrUYsQlwDKKYwIZ5dD8+jDacig1s
         XOHyXGtYjOXCu0brVa6BiIwixuY1/2ESDe2ywvdhdVKK+QqE9T1t/UxJMxmW7wCzmIwV
         AriGCE3iMWr+Guxug1WC4iUWy+Rt1cTQYUk8EAXdsQsjNTv4i7k5MCav/xgzKNKnhhEY
         /iOA==
X-Forwarded-Encrypted: i=1; AJvYcCV2u48Ow6J1bVboO6wc6eVI9rQU5zxbg4HVfkqfNLSRWSzsVh9iT09j+d1RDSJRIqxuBuBczmIbGU48@vger.kernel.org
X-Gm-Message-State: AOJu0YzbmoLCkxFHJod4nAR0Oab2aU5pfg0ueFy//9EBOA7koS3l5Odf
	lfBYAei+bZWM4YEBtuL+QBVt7qFF1pXnZuOpMdxD6L/8nPQrGTduUsopNr+zqLce8iU=
X-Gm-Gg: ASbGncsXdxByEFzZ/jXA22ccPGphRwCi0U6jGHikzc0hnUbCZLCvRTTUXnBr8mSc7eY
	9B8wSrBZ5iz7mO5BN6CDx/M0jFZhisjBu50xHknoSeAjEo4j0GjlDC8/+HeTdNkcWXXKijMT/So
	6oHxhcAN/pzkllF+YD/qSTD4pCbgmY4Z79KsWThvwUWYEXv1tQ5QrFKJYUaEqKcZJO2fRgHvfwv
	JA5WRuYyZqSUTpTHiWP6+4eUeGNuaJw+vSZPsqKeOIoP5g1GM2DFLg7qHmoX/nMtbpPJzt1zCVi
	nO17jjt8F77HSZlLLEpDbCRsc4nQv31cNHhH9vINnLoq0BNwyaF9Acn72Qu93EnQ
X-Google-Smtp-Source: AGHT+IH1QC/cjAF6tAcY4UP7T/bOkdOaaWCl+W55z+nwhrvgmRvt0U0bCNjMBdcWT3uUlVMnIYmNSg==
X-Received: by 2002:a05:6000:1786:b0:3a5:1241:afde with SMTP id ffacd0b85a97d-3b1f698b0b6mr1658079f8f.9.1751447654412;
        Wed, 02 Jul 2025 02:14:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:14:04 +0200
Subject: [PATCH 03/12] gpio: tegra: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-3-0d23be74f71d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1547;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HP7Yi8c7fDJPX4fseLL/Dk6Apx29Ju0fVjgFf8RTbyo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhf8gmKFSaXX7IeqCZpSR62rItMoRyX3Ll52
 GaBrA8i2KeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4XwAKCRARpy6gFHHX
 cpipD/9ZCqiP/Ka35haybWi/fJQD7VgmwcJH6e8qA5gI0s6RYK6nB9Ug6hf3Qhm4Tgu4VnPmKTb
 GKAMNU03hZi8K5XloglBm0mvgD6A0KNpvFgvW/8vU4oXNcrjaXnuSaLPO3x0sTQAOHSWSyUeIXB
 YQyYHZLCJYEyrxd92RKqXeowUhQ7dV8x+ZdaSTnT8fexROi0K0NL7Mx6/1ECe5vKlzHMCeAcEcj
 +Husx1YJ/H3oz9DyUg8VDlSC/AKoJoL+u35VTgFWXUecIBiTKGJzSDVFshKf7+pGq3w/JpL+oxY
 IGmdZ7wkj4i1NhcFxg2+lL6rJ8SMdr6fsKMSsS3D68gihWiKZI3Pk0MWrZUlHlUYop6mA3DROGa
 4wiQfCpd8I9BkWbUx4WmRWneDBKf8Nmm/Iyi2WufNwY/wojH+gKqCwcuPP4tJp0v/YMrdeGN/j+
 8gWVbpOfAsrKUOmysuSU1mijLwUdBF1jXLk7uIzLNRA+L+SDoXfNdAbMlK+vxusSd51sKvMjBQ8
 ehM/EyjRiEv8T/C9K+euAqiRO/LzhVUftgXOgSZExEh0THuwLawJbMWe8E7ymA7ItudFcZkvUbS
 Vp6FXC3mUe4j63quBVYmrFEDeIRQKuofv5dZg09XMkhpnunTPqBqXIuqFrcDq1rHPHHeraf4/sc
 603ds1BGz2FtQiA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tegra.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 9ad286adf2632f300ee981185ea32d79ca012df5..126fd12550aa8e6bb812bb38a56d37c38114cd15 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -146,12 +146,14 @@ static void tegra_gpio_free(struct gpio_chip *chip, unsigned int offset)
 	tegra_gpio_disable(tgi, offset);
 }
 
-static void tegra_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			   int value)
+static int tegra_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
 
 	tegra_gpio_mask_write(tgi, GPIO_MSK_OUT(tgi, offset), offset, value);
+
+	return 0;
 }
 
 static int tegra_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -718,7 +720,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	tgi->gc.direction_input		= tegra_gpio_direction_input;
 	tgi->gc.get			= tegra_gpio_get;
 	tgi->gc.direction_output	= tegra_gpio_direction_output;
-	tgi->gc.set			= tegra_gpio_set;
+	tgi->gc.set_rv			= tegra_gpio_set;
 	tgi->gc.get_direction		= tegra_gpio_get_direction;
 	tgi->gc.base			= 0;
 	tgi->gc.ngpio			= tgi->bank_count * 32;

-- 
2.48.1


