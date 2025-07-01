Return-Path: <linux-omap+bounces-4002-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 161F1AEF76D
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jul 2025 13:55:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B7401C02EB8
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jul 2025 11:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C8727A133;
	Tue,  1 Jul 2025 11:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LUUzwLri"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF03274FF0
	for <linux-omap@vger.kernel.org>; Tue,  1 Jul 2025 11:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370598; cv=none; b=BqCLlOHe0a1hg3tycD4bWgzOiUQlQTPvYRjtKssGR6AbvdV6G+eu6fQo1wKcd/brTYohxCkaKLpffLNGc9Mb4ldXBnKOh1QeTvehX5A76iYk3WHdLotjOoA/B2rLZS3nNnWoqLi/RdQ89M4wo7zJxSPxjwlO14dFkJ8vMTqEzzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370598; c=relaxed/simple;
	bh=LSvGz4bhsBG69h9nh8mrPUSnRQpI+1agKF+cI4q1FRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XAzf4eja76S8ZyZYT3/p0udT6DQGrpSQj/UxQVuLdum2sRL8w6dYWmjg684Yz9NF1B6BJpp1pOl8WnY5OpCTXZavFTlWa/1qpou14g755P819eKl93VLGDEd/6HfRzDEcmDLCekx2QnTTwhHalt5DqD5wgbuJLHdidcGOtz2+bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LUUzwLri; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so38882915e9.1
        for <linux-omap@vger.kernel.org>; Tue, 01 Jul 2025 04:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751370594; x=1751975394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K18eD4fwuNNbiShs9650A8odEfXbIRgpXnl+v+odKRg=;
        b=LUUzwLrizjpBQ2GsTqAW42xxbB4KjAlgoGXvluhDZCAwi1omvXCegti3Rh/oy+khVz
         9/Qj9dd0tXwLy0M1+qIUbPbJ/LY4OsM8TwtlwJdJ7zNTtQRZ/isKqLx10dR/HK4gBmUY
         1ARzmZIqtcEsYvLJRZt/wj4GiC+hO4bvWHM/6JmmYSBDJOucSYaQqrMhjNx2DrxBJNB/
         d6Q8244Od45ml4Ikpa6BXTTzN54Oz3i86Cvb2tDOIx5OuhwYH75m4iDZ1/6pP7AGzJk4
         kHb02TjG/cAYB/w1/6npEp+TpDm6Qk1dLyokOlW24vXzTdhsj8gltIHxyAEM2PfOqeqg
         lNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370594; x=1751975394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K18eD4fwuNNbiShs9650A8odEfXbIRgpXnl+v+odKRg=;
        b=hqASAkV4yeBoDmNriBTA69S4KnhWXenznf7ffY9+0x8zKkJpwVxG81JNrJfK/2rfvM
         BgW8Z863eeLnFrPuo41BVryKvsUNh36xTfI01Unq3zGrayd64QgOkhR9aD3avQnEonOk
         WCRhWmQRXS8/AIz9Q+SUlwGabHwy/N0WXjTnYJvJRYKKR2QXKFjZuIRgX6Oe/uWBSCYw
         4idplG5Z6ppsAB7r9y06PYTdZDJeXtvL+6c1KyfE2Nvz4PAE+a2Jvp0nvOQHFT4qCWF4
         hYaM15L9J5w+RRLX1e/ovtLPBsYtG8zLyqiWGPtQoIT+scxIRVgm8p0W6jweQpQWtb3H
         PpkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtjrsko74JylSaJ4/QL2Usx666OeqSUSV5YQu7GjCmdxRSAi5gyI9vVD+Zv3KDay4aSgJ1O2MRooND@vger.kernel.org
X-Gm-Message-State: AOJu0YyjVQfiwjyZnKeYwOYBM3XGjNfyHz9iUU3UurLc28amvHaB8ers
	ypqMMs8aOSKz6mBCbdFbEmc1+try34vlBpD9rMqHJu+HaxmiA+FmqqEbjnB6LAWRXIXahEP57Pb
	K8MycTCE=
X-Gm-Gg: ASbGncuIm2tX/n4ARwTa04rDnR//rD2nD5tra2AbOk4YnUGMW05m3mBNO4c3zVzYLFv
	nQSxtfrAuWRNNYwp5PWcQTS2kQ6K1oIpg/QUAgcKtFdIzzabM3rZbSOt6109/bMsr6PSxxud2iQ
	p+GBOmR1CkPC85asVh72oVcq1r3iCwtEGgAZs04HK5GlH/JLcMSuxCBjf0RnuNwTOGF9rLfYUoC
	ILDURZs+e/TYR9vnXYMrF71yrVhKCDHYXfWyKJCtUGzt9v9NmryCrcwqbJj5YUKiuiKIGTiPV6k
	ks9e34/wlSnPPCDRq6zEgWQwJXkRlITsockFcUKW14G+LXjM+Z0LLA==
X-Google-Smtp-Source: AGHT+IF1V2h4z8e2b+q/5QYbiJ/3eFoAFYUWiFfRtaEit+V7F7YE8tn3jrKaiEhuVsy1QNVoKx5zRw==
X-Received: by 2002:a05:600c:a11c:b0:450:c9e3:91fe with SMTP id 5b1f17b1804b1-4541b6db66dmr14175005e9.0.1751370593607;
        Tue, 01 Jul 2025 04:49:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm193988925e9.5.2025.07.01.04.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:49:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Jul 2025 13:49:40 +0200
Subject: [PATCH RFT v2 6/6] gpio: mmio: remove struct bgpio_pdata
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-gpio-mmio-pdata-v2-6-ebf34d273497@linaro.org>
References: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
In-Reply-To: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3955;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=WO0jeIzGeDRWwlltYN6KLDzN1nDqq0wG0YjMIyZ69bE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY8tYQedunR7lNaIA7I2BJg5XNf3SaooHlaS6n
 viTggRWov2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGPLWAAKCRARpy6gFHHX
 cl8zD/9sO5Jq5Wzq/bFjPjz0TkCxAfA5RvMtEcX04+91lEim8zAy2tLuujFKQ1EZ/j+kEzp/ga8
 CLi60fQsJF9gk8a9ecsDKXJrdDGTTemE0ws2iSqALUPjbzY4By3p7V2k0SOO83KHs0ctsOoD+9N
 j/yo2H5t5ysxHnYdeigLWyqXvu1K99c4tqkDsLtqK5lCwnh6E24Du9S0/AvwBUdG7C4cyqvQvty
 yrpq7ffBrIkIOQLuaygE/7AsMojI+8/2L/W/Kx8h/9rooyCSTLOloACnjKYQRehYvJ4CiIbit6H
 OWQWN8RKj4eWlATCcwyl93QshTZQvWA+YWiMnN8qcIcmPEaT+24/tsrUArlctzTBON0qdg97Jqg
 8OJ3bhql9HaNoy29uJ58PsUuzo3+x6sOObqKhld8IvZ62gVzsZlV1CHja4VodJFPHAo1Olz4dJI
 kXEIuPj1pr0ybdNuFDKc2x7IjrwIIO/FQmlWDSFSApeeQaT/8BCnOXU4Pt6RV3FkYiBrGKWl65/
 v+k/Hh67+XZqW85RmvNdrYOp1MhRcMxhG8casJMj7bEiqbPOGhhzqyGlr0CmKFeIwbTBgS3u1lI
 S23NYaez7ty+9cARY3vV9jFOmbzvIBOvMqwwetL+ELUsC4uieXEgDQbHX1rDAIlSFzqmBJR90ZA
 IVgRnicRfV5w2IA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With no more users, we can now remove struct bgpio_pdata. Move the
relevant bits from bgpio_parse_fw() into bgpio_pdev_probe() while
maintaining the logical ordering (get flags before calling
bgpio_init()).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c    | 73 ++++++++++++---------------------------------
 include/linux/gpio/driver.h |  6 ----
 2 files changed, 19 insertions(+), 60 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index f66137caa245b14e6e8dbd043243224bc47c9609..cf878c2ea6bf1bb6dfbd1040d64787687335132a 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -734,43 +734,6 @@ static const struct of_device_id bgpio_of_match[] = {
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
-	/*
-	 * This property *must not* be used in device-tree sources, it's only
-	 * meant to be passed to the driver from board files and MFD core.
-	 */
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
@@ -782,18 +745,10 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
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
@@ -825,17 +780,27 @@ static int bgpio_pdev_probe(struct platform_device *pdev)
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
+	/*
+	 * This property *must not* be used in device-tree sources, it's only
+	 * meant to be passed to the driver from board files and MFD core.
+	 */
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


