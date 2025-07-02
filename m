Return-Path: <linux-omap+bounces-4031-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F7CAF0FAD
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jul 2025 11:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49AD03BA85D
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jul 2025 09:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270CD253B52;
	Wed,  2 Jul 2025 09:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Mipy57cn"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C363254869
	for <linux-omap@vger.kernel.org>; Wed,  2 Jul 2025 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447667; cv=none; b=fJ4W7QUBxpa0sqLgUNFIkQFPGW7IETnS9E7KltCSCF907mJ9Gv+WMv2jxh0MsxC9GZ5DFiC3Sptq2XYN9E9mYN9J2CAznQ4hTErJ9xYeeTa9qkPyPvGLaxjRQsJaVPMNg94LEBUPaJ6+L2iycr6uVmyMkx4qMEtWm+QR4KLUugU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447667; c=relaxed/simple;
	bh=zlthjUjwq5kDtYtL7penfgsSNjjQNd/Dl8SDMbL+tqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfP3/TQ2WHiMi50OYYrCarkmA1W3affloNLChiF0h5R8VJeT9ysSAhOo0rC+Y8olWQdwbOJDCK8eRTeQSoWdHV+9ozd//R1yAcW3SgPLT+86gRwZeB8i3Wnv5g2di4SPySbkw6QUDgu9EbcjeD676eijsHDEYao/Kpd6/+p2OuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Mipy57cn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so39215645e9.2
        for <linux-omap@vger.kernel.org>; Wed, 02 Jul 2025 02:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447663; x=1752052463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Beea6MWuIodOhS1JOBYs442Wl5O3mTLhF3pIS//cII=;
        b=Mipy57cn3th6VN35g6wz02LZB1zF3TR29UuUH2Td2KHaz7XBrN8AbHoPJKuhhUd3Zt
         E2O9yRgmamB5Z3cyylWX4AJziHhKtgswsdcO+Kmrg2E1hVOVuoOWu13Yueyt1q9S1Ocx
         +RNWypmCNewePLP0Z6jWBd/VoWeWLXoVwHxqomiP4CRrG7yQ8SUCBIfhj7tkbLRT+BWC
         6iylPpXsg+xVI1zxf+9vyV5tvrwwo+EIEihzejcprfhd+YoMY6ryjk1vtu+uwfv7SSBK
         KKYB8Drrb5JwYrj4BNJ+OrHCeDlIAlV7FHkkqjwzqPhsKlHK83ajyRsRMnrPrsPuicgH
         gq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447663; x=1752052463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Beea6MWuIodOhS1JOBYs442Wl5O3mTLhF3pIS//cII=;
        b=WhzhSxQJh+HcyHJOA7nvloA173qTRkCEBk1CCVfFh0nZ4ouVwGngmT0RIQ8lN7A/iX
         omDR80A2jMddF+HfMJgNdy69dtVeNn2qZKbrqylJjIJl1WCf1FrmHvax62ZX8lkB2wyg
         TmPh8OVhN5mvZ/4GXzGCJHr/suq6oADthPRQWdHprt7Fvvcs2lDhUCh3cUHqf27pSkIE
         EhdG7PppEmVLNbyfvUGO3mM9YsKZ3UUT6jjrihkzagY5hagOJwqQAKjk6SlWO93vOOto
         mLiNiOOv+MMEZXokC+MyW8JngfNvCrf6KN21pEpsb43S1Wi1XgMKOwbs4LXDR2EQ/HzW
         VVnA==
X-Forwarded-Encrypted: i=1; AJvYcCWEm5kcCK+sWK2TGxPeTN5bGqxC/nTFfXM0cs6LKqDsuAbO3brPvhjcfB/BS8Dr4xzr0MuitckSf2Hl@vger.kernel.org
X-Gm-Message-State: AOJu0YwoLH1ERzyg+xMY8SusILUo34OGXe6lcHuFq4lmW0t0/cZAwF9h
	Y+T4IVONt/LlEbK5i29bjoObGBzQuDF1jcp3baQXysS8xGHd5iE01Nzlp4lnHJoRXk0=
X-Gm-Gg: ASbGncvv9Kn2olO0N2FhxaNxCP2zmGvwQem/FV9yg4kpVlFHMzYDdPORtjP9JwSISuA
	2HMIVeDgr4VZyo3huuT3Up7KipcGPBKfowYDSkXuepbTXiEJMjs/+18snGfl8moBSwz48IyLQwj
	5M4vfZ1ASkEejuuOWnpr2K5S9N5/Ww1HREjfvh1wIgweiY7CNlzEsNHdNuBA8BXPiddVIf2V5zo
	67V6dwM2kTLC9dlQfhF3jxEbR+ZCCBo3ZZIiSYrTEhGDiUEsh3APmAzMSk2GGytj1taddUJAabX
	1r699P5N98i0xZ/gDnqcCVAOe1cX+j+MMlXW1GWJGhKZcOHUDvzs3brK1guD3yfY
X-Google-Smtp-Source: AGHT+IHTSI3aM2zQ1ucQGM3nDAOwtarY+pS3lvCIulkk0w22xSsj+UmP+PVinA2YlEUeVq0N/7O5tA==
X-Received: by 2002:a05:600c:3b8a:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-454a5629244mr10682265e9.6.1751447663551;
        Wed, 02 Jul 2025 02:14:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:14:12 +0200
Subject: [PATCH 11/12] gpio: tps65219: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-11-0d23be74f71d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gYzTAjrXOQcnBCzz+IiEk8V1vOdl46MTbVqVbgJp18U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhhTuCcy7zCVK3wPoNbLGYDt0ecT1kLOGmcN
 u7KeYMohcKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4YQAKCRARpy6gFHHX
 clLoD/0Xn7UR+cgNXXw0DEy11wr+cjIV4QvBlKWr1mURUb9ZAnGz7AH7YNRG5aJW99xkGYV0e18
 7MW+z4G+Wjba/F6DKUZIrk3QhhwW7y0AJnGDYUwC8aHp5EZBj6CX5A/wook7GQupf2+YJJ2dBJF
 2DvGno6M+oZfzLKFrQ+09VK6Cs5/PiwHG0jySML2lFIYRT0ExfP6jf09+FWg4AKulFqguRyW1kP
 782K7gT/+cwDNXGBJWEQgBJWfpWKQUy87cHKvlC4k57wpOt19gN500HXRYjYiiNdB/XowgB+X5e
 Kuw74eECcF7Zrfo5PZzi27VXaVdAlYhyaNG5u/PGFsW42LtMacB7W41wYtOPin78Y3eAhxVRYxl
 4zs/UL72Q1elQ0ElcNmR4JYgAhdbP3kkhjVkDDvYWH2zb+jNfQzeG0ulswaEndqgQKvrdMrJcDF
 raj9Ov3Y8llR46WQ78n8axYE4DjpV4CCdwLc4Z9or6C2rrGSeDzI3UBQ3u93AtO8ZU+pGqHhiwu
 DKhE3LN/7T9gYiQZ8T0VVAVSkGMGza+fjgCi7bA1/Bw+wWBRFkuqlItq1oOwznMXxDvXsPiEFkW
 RCoN+bF5guwedbJoBMdsLYbyqmooDmCTlyCsEolI0x4P0s3CpHtxT80Pv3WtOZl+3q1KKURzuIc
 GNurOoVmGWtn3vw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tps65219.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
index 526640c39a11faf7837847d7eccf0aa33d482ffb..630cb41e77a4ef212305e710e988999c98cfbe66 100644
--- a/drivers/gpio/gpio-tps65219.c
+++ b/drivers/gpio/gpio-tps65219.c
@@ -65,10 +65,9 @@ static int tps65219_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return ret;
 }
 
-static void tps65219_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int tps65219_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct tps65219_gpio *gpio = gpiochip_get_data(gc);
-	struct device *dev = gpio->tps->dev;
 	int v, mask, bit;
 
 	bit = (offset == TPS65219_GPIO0_IDX) ? TPS65219_GPIO0_OFFSET : offset - 1;
@@ -76,8 +75,8 @@ static void tps65219_gpio_set(struct gpio_chip *gc, unsigned int offset, int val
 	mask = BIT(bit);
 	v = value ? mask : 0;
 
-	if (regmap_update_bits(gpio->tps->regmap, TPS65219_REG_GENERAL_CONFIG, mask, v))
-		dev_err(dev, "GPIO%d, set to value %d failed.\n", offset, value);
+	return regmap_update_bits(gpio->tps->regmap,
+				  TPS65219_REG_GENERAL_CONFIG, mask, v);
 }
 
 static int tps65219_gpio_change_direction(struct gpio_chip *gc, unsigned int offset,
@@ -147,7 +146,7 @@ static const struct gpio_chip tps65219_template_chip = {
 	.direction_input	= tps65219_gpio_direction_input,
 	.direction_output	= tps65219_gpio_direction_output,
 	.get			= tps65219_gpio_get,
-	.set			= tps65219_gpio_set,
+	.set_rv			= tps65219_gpio_set,
 	.base			= -1,
 	.ngpio			= 3,
 	.can_sleep		= true,

-- 
2.48.1


