Return-Path: <linux-omap+bounces-3961-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CD1AE663D
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 15:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1B2C17EDF6
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 13:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081292D2389;
	Tue, 24 Jun 2025 13:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Q2kcqtiR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7828229B206
	for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771175; cv=none; b=pf54BG8AXf+NLT9q7cuuPHN4S2iyAvfTCRHYl1ncgsYU6NI8GnxLIya2UxTcjn00cPghW0/HN6/yDXTPuHw3+US0JaI7sR/2Ic6WbBiyhmhaHSSzx9ZYx4SfEsatHnXoBH8GVTWaifxOrKHcY9T1Bx5WKoBDmdmpL54gk5E5WT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771175; c=relaxed/simple;
	bh=42CM0Y9wbPob7M9n1TchKbAWBw3fz3skePpGaPIjouI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMKXljADO+3HxwRWNZkKB8SrEjsml0YqBoWg5uJZsfON9XnF2M997YgOGLVCjlLDIMLlabdgh11vU2OgAmRsyfY8gTrNTI0XBEWrl++v3msxvVRWAyJatfr+yfOYLxy45icYyUbJGPp77TTqZ/bHlux3EXU8EP0V+wTWNi/IR0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Q2kcqtiR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso1644115e9.0
        for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 06:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771171; x=1751375971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2B/kiSHHHZJxgJh/qvuyiyzLHnz4/qgrmBlSv19H08=;
        b=Q2kcqtiRgx94eX2fm8UtBXVyHHzFpTm1uGLlfYZ1q/P/iFTszbdXHbTc5NZfOqbscY
         00ekfCRJN+DMLy0AE+DUY2JJIcf6rWKs06d+1XwammUzxkfcWPogGTUpwq/d5PHAdpiA
         ukEMcqRf7jbsuBI+t8y2Y32MZS6ZAEm5XyGVsH0QRA3VdDaDEX2bn06MPGdn7AaRYM0O
         7TR6VU10MJKyBiOki1ICzM30QZQTQObPBBcR03lI9Z9vf/AYGD1hYoo9BU6SD6GSdDsP
         3DG96/5Wy2z1Q8YQ3Qt86e5cqmBZsxNm9th+Dyf8eoqOJLxWcc+IltY0H/je3a61ycOi
         cajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771171; x=1751375971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2B/kiSHHHZJxgJh/qvuyiyzLHnz4/qgrmBlSv19H08=;
        b=Haw2lb4hnNIvOxZrM5ImSp/YuGkzUUYQBLw7jJM116yIWsPva+MbUibKvtXjzLpdad
         EjnoRKDwEcDzZ00Wk8H4nVXNozwG+SWpXVPBmqNU5WsTuseWZLcFXyWxr5kPwoaSN+nI
         +0IZV4q/uRfIC6tnbjjKVVP3ZyA42mSugQ0A3pFwYcEJbt7ga86HolN0ELLDaQq0yGEY
         yBg5gZbZQGvD5giGgcKt1f4No85gKR9PbXqI+KJTRL1mCzqvQJ8VMl7NTCrfyq4yzrN1
         FKM8NukLTEPJKDZGg6Q+pfb2W3w1b0LJe8RDAgcmMHwApD1tbfxWFZZsOqBUWe5MUe0o
         sATw==
X-Forwarded-Encrypted: i=1; AJvYcCVixQKn2yjqfbggfwrZ0rCTBKzQPUMuUKGPI82lH+pv1L7JaHmhpYAsASDQgDK5Fryjkeg23uzKkl/r@vger.kernel.org
X-Gm-Message-State: AOJu0YzevTjG8Zj5LAoYSV6romWv3Uuf6PHCja6ePWZgq5HAb3Pi7iwJ
	pMZHujEC6xo0rnRXt41k8hEFL9yC3EtEh3a/i4OqbrXVCVRZ0j55uvKCzJ+shJysDPY=
X-Gm-Gg: ASbGnctq+TsoBaSeU2/ANz/aGnOwp03/NIcKyd6UqU8LYAng+T6fX+AYff5guySwfLw
	pl3qBiX+d5I0sjsUg85b2eOEUq1qoh9AbOfYL328dXE1DhKLl9J4qzDACMdtdj1/zejnh1S98rY
	oZCSxIUVrW2ycqJhHYb0dyMYt0ZHSLN57I8ECMA+lHucMj/mbgmj1YJi/4QVCARQ8lVCWB28XMo
	ooBNxwU4LN3Xzqa64gg4h82IpSfciRGg/2lha78jpqnD5j2b3i2kSVpJIBQlBmHE4Jm6bwH8qLI
	GxOd2TXoZcoHuIVmu7HjqHxVzY1Js27IkM7yYYu9Z+pYLiGaoAJEd3OyNSavxgo5zQ==
X-Google-Smtp-Source: AGHT+IEonwGwTEN0PQTTY5zvr8GZMj5f2L5JRFileQvI4Ft8kxR7RvhZm0EGSz4y5sH3Ydfuq5cdmg==
X-Received: by 2002:a5d:5f53:0:b0:3a6:eb59:f37f with SMTP id ffacd0b85a97d-3a6eb59f3d2mr816690f8f.12.1750771170749;
        Tue, 24 Jun 2025 06:19:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:19:17 +0200
Subject: [PATCH RFT 6/6] gpio: mmio: remove struct bgpio_pdata
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-pdata-v1-6-a58c72eb556a@linaro.org>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3644;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=H3M3IpDQpY9NSlvQzNFcRcqnugqGexh8ZnJKDM0pSQk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXYsMqxCAK8bVz8LUzIFa3A10IhSZWnxZZsN
 y8r7RVwjcSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql2AAKCRARpy6gFHHX
 ck/vEACtGvpcJ1rDqsgHSQ1GwautrZv4YEuXxKtBnuKN+NKbKghxnTNRHCCpyNXnCtxEbtiq7y8
 OjE8GYR13yIXh+1q7W+hK73xOKZZYp7OKgszPx6sc1XZVxQVUFaZZK9l1IKT36uV6GMdzHkBYTR
 VLXV1B8i3FYqgT9VVJiXlPCTeYkyRt3bOhslU2Wgf/i82p19bvW99oZ4odEgC+BAXpMEMOmb1bi
 s5gUjdNfaISr8OhvHIWmDOSjqnwnwMcBVPl6VnI8/Zy1bFo7DjaU0rTYcGDQMwoJ8jn1PRPbkKA
 J5vsXCQOkCe7CkMs7A0u1AQgbX4gQtST2Nun3Zndjk/OX1P4k+m6YU65hzs6kC2BI/ApH1pmCct
 tLlsIUDjPM8WAgsc1U4Y6WYVmSJf7SIVAy1uFDwLeKn3C1TzF93zb1HhF9fSeZNGNydcCtyh3ZO
 siD6Gb8u4cOa6kAtcEekj9BY2HBt7dl9Z1pIfRWL+6IbZX3PKftx6KkQKEFm3Br4FnQMSY8Vnti
 /yhgqO320uLRS6bIOZH70S91IcTigcwHdVkj8ndRazqgDc6pDaQ1xsUAE7CAk3hjnF4RoXaU3hs
 1vkdBp6qaOnwhfLDadsq11vMZoW8jZDv6A35M6PSY1zuGWL2uHZdVsOOc4AtnOGEblLXaWZDaar
 J16/cpP8OIkWQHw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With no more users, we can now remove struct bgpio_pdata. Move the
relevant bits from bgpio_parse_fw() into bgpio_pdev_probe() while
maintaining the logical ordering (get flags before calling
bgpio_init()).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c    | 65 +++++++++++----------------------------------
 include/linux/gpio/driver.h |  6 -----
 2 files changed, 15 insertions(+), 56 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 8108aa8e6b86ae3d0b520a0f22a09689ab1d9bc5..cf4d3f968af52bb750038d32f78d1c39498d3f06 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -734,39 +734,6 @@ static const struct of_device_id bgpio_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, bgpio_of_match);
 
-static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *flags)
-{
-	struct bgpio_pdata *pdata;
-	const char *label;
-	unsigned int base;
-	int ret;
-
-	if (!dev_fwnode(dev))
-		return NULL;
-
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return ERR_PTR(-ENOMEM);
-
-	pdata->base = -1;
-
-	if (device_is_big_endian(dev))
-		*flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
-
-	if (device_property_read_bool(dev, "no-output"))
-		*flags |= BGPIOF_NO_OUTPUT;
-
-	ret = device_property_read_string(dev, "label", &label);
-	if (!ret)
-		pdata->label = label;
-
-	ret = device_property_read_u32(dev, "gpio-mmio,base", &base);
-	if (!ret && base <= INT_MAX)
-		pdata->base = base;
-
-	return pdata;
-}
-
 static int bgpio_pdev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -778,18 +745,10 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	void __iomem *dirin;
 	unsigned long sz;
 	unsigned long flags = 0;
+	unsigned int base;
 	int err;
 	struct gpio_chip *gc;
-	struct bgpio_pdata *pdata;
-
-	pdata = bgpio_parse_fw(dev, &flags);
-	if (IS_ERR(pdata))
-		return PTR_ERR(pdata);
-
-	if (!pdata) {
-		pdata = dev_get_platdata(dev);
-		flags = pdev->id_entry->driver_data;
-	}
+	const char *label;
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
 	if (!r)
@@ -821,17 +780,23 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
 	if (!gc)
 		return -ENOMEM;
 
+	if (device_is_big_endian(dev))
+		flags |= BGPIOF_BIG_ENDIAN_BYTE_ORDER;
+
+	if (device_property_read_bool(dev, "no-output"))
+		flags |= BGPIOF_NO_OUTPUT;
+
 	err = bgpio_init(gc, dev, sz, dat, set, clr, dirout, dirin, flags);
 	if (err)
 		return err;
 
-	if (pdata) {
-		if (pdata->label)
-			gc->label = pdata->label;
-		gc->base = pdata->base;
-		if (pdata->ngpio > 0)
-			gc->ngpio = pdata->ngpio;
-	}
+	err = device_property_read_string(dev, "label", &label);
+	if (!err)
+		gc->label = label;
+
+	err = device_property_read_u32(dev, "gpio-mmio,base", &base);
+	if (!err && base <= INT_MAX)
+		gc->base = base;
 
 	platform_set_drvdata(pdev, gc);
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 97cc75623261917e9b3624e1e636d2432c0db205..4b984e8f8fcdbba5c008fc67ff0557bda11df40b 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -718,12 +718,6 @@ const unsigned long *gpiochip_query_valid_mask(const struct gpio_chip *gc);
 /* get driver data */
 void *gpiochip_get_data(struct gpio_chip *gc);
 
-struct bgpio_pdata {
-	const char *label;
-	int base;
-	int ngpio;
-};
-
 #ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
 
 int gpiochip_populate_parent_fwspec_twocell(struct gpio_chip *gc,

-- 
2.48.1


