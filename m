Return-Path: <linux-omap+bounces-4001-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB1BAEF766
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jul 2025 13:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1D14189DC97
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jul 2025 11:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CC0274FC8;
	Tue,  1 Jul 2025 11:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZcXxagRq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBA3274B4E
	for <linux-omap@vger.kernel.org>; Tue,  1 Jul 2025 11:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370597; cv=none; b=GwVASHFpn1HnGHqMdPcq/2lvNCe+A1rD7UfdLHHIHCFg4qwqFAkaiqa41z046qj2tusXJXdYXnKRnC7Uv8CfUb0BiTDQ+heXwNSofO0LyAbgmUt5QpDhh/FV8CbfWqFZkC11gDgeybBUYVVE9LjsBuoNgDF3rr19oB6HNk1LoKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370597; c=relaxed/simple;
	bh=alxabAift/c7LQirbWabFH/BEgz3gW7F6hGSpjDv4XU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mE3k2rNpLR4TLQ6zBAgBxGkur48vzLqGI+Wjh3gzAk5hqCoTU2kJY+pRq5NNvjnvvN1cqhSQq/xZrg+EjUj3Z8eYQXn5rNNSjaNefDqGbfLScm58A9pZsUJCI13qZRrauhDAERuiZW3LVFkyeAhQCAtIgp/hi33DGmFttzVwJZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZcXxagRq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so3628005f8f.0
        for <linux-omap@vger.kernel.org>; Tue, 01 Jul 2025 04:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751370592; x=1751975392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5JfVfRdI8YGSmLupnI2yntxXLXiEBq3CMfmRLHEFpg=;
        b=ZcXxagRq3HyUCyNHv3jx8ty+uFcrCT+wXTM7QL4Yhlv2enqCrD6ZGRuxoHfGq+Uc0S
         IambCCWkLA48LwEsfwX8i5nGeCh92jgyjsVJ1tNl5/oKnn7oYx/fsEYvi+kiSUT6FfHD
         /n4543TMaT5t0gczIJD4KUUvxd0dTY4vVuzGmjWMAt0Q7ZbPU15C2GaDVHY4COY3/2Ng
         6zz6l5FyzNMP24LLL5hCaKjr0nmPAEXUhzDLOScNUOpBKQ/mfh3Fry40UqshRpb1U5jS
         btrzWkGgM4+8MxfIs9hbrA1OhaXubvy0ZY1ORAqzBR7V+4gsVZ2AuxC0ZBur0E9oPT7p
         voUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370592; x=1751975392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5JfVfRdI8YGSmLupnI2yntxXLXiEBq3CMfmRLHEFpg=;
        b=LvPkcOpWmOhcYRApoaDpnGedDu5Iv39l7isaQk+FBnlnTCpFRqmRTFC5/pEUdYsfSa
         I1qgGnou22YUm76V7U1O1kG3Ux/l+5lXsmmHFHGGmiZYP5sMfr/0WxCxzBDR60W0M2uO
         P7wLt/8BdceKdEnx7DSCm0Qw7r0Q0c5jDhOmCfJvG+e94lHKf37q58FJn+y6ffVA0ZPo
         Gy75COm1xgApMHQ5B9j+Sc4av63DJ/8aWbXOaHoLZ0pzp4boOODzo6WuAejdqxtdvCB3
         lJ74+eni1Z7VvKB92MS8uGKc7sggL7un4FTPAIRV/WIIyCTzASOI5z0yd5qBa0qj/Eck
         Jquw==
X-Forwarded-Encrypted: i=1; AJvYcCVdozGof9FqZqiTMuOv9MMD4jTPvTY54+QiJVgcgiq5fGmlP0vANATmnjzN/e2gyZcz90wbM6QGL2vA@vger.kernel.org
X-Gm-Message-State: AOJu0YxRYrCykIJXIo0pmRt4897TRNVii0/AzwpjqQgzgaqM52zyrQyQ
	Jb7CeItT5fahq7Ar48muBSCw8JB+XCD2y//dT/fa/u1XoEa1nx9m2pOOHw/e4GH9JMukVUuCO76
	ZYZA81Eo=
X-Gm-Gg: ASbGncvY+o6jRMJHzEFe0cdXhCawXNS1y6T+oTynnD8Rr9zxgPnEYAAO6FPXY6TzXJb
	Bzdzl6DWvMqOeppwWBzblNb08TtZ+BN97YwxSRyviuQSuepzkBAmQqA7uLenUHMJ+80RqrwygHn
	9ynLD3t6jOXfPM82oGoQQJo9chMOJP6zTbwMptu8NQ902ecIBFk84qRyrYPKKivFZMjwdRckn/U
	kg0eKJ4d3uiPTHFCBaTLL/UYE+uvqheOjxLLACnAOQM/0sEXYc8U4LPDbvBGY2K27ytJJlRUXyU
	1xl2hNVBNgYlTIzjuVExGphYHtGYhAZoXrRqsvix4bSHqOrHIxYUxw==
X-Google-Smtp-Source: AGHT+IFBzvAMW8OcUT3OzLMR56Uz0A7DDsGCczyaZLiFWhXpYZeAX5dF84CgrX1TS2+Bnz9657x6Hg==
X-Received: by 2002:adf:ea09:0:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3af100ae561mr2412822f8f.17.1751370592384;
        Tue, 01 Jul 2025 04:49:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm193988925e9.5.2025.07.01.04.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:49:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Jul 2025 13:49:39 +0200
Subject: [PATCH RFT v2 5/6] ARM: s3c: crag6410: use generic device
 properties for gpio-mmio
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-gpio-mmio-pdata-v2-5-ebf34d273497@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2505;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Csz4Ip4F3hS2hKgICREYbcOQHfEZUMwUqPJfONVy8Bs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY8tXJojV9gB1TOh7n6XBghRiq0iDiiZ/ZcyDE
 +zhzMX8YQ+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGPLVwAKCRARpy6gFHHX
 chEzEACFiqLeHegljvLOJZKOgMI/7feOpGsAaU6leda/8EMbLme22btPegktzBE2Tx+25dc1NMk
 1S4hZOElYE9kmJ3RtG8k73hIx4aGXWx9V5tc5qPjH1fETRwMw6q0NTbX+htTvKTweNccQTGpXt2
 Ck807f72IdwQgp1VpDlA3AHWyFxKZgUufNlt5tUK+5NATO37+QWfJXgiAZzEBJsQMUKCHkngKmh
 2kHyGTR++BAIvQS1N7pao8D21fUf94+jN1GIQe3WE+IkV3peFf5mNFm79RMojKtROHYVqQcUufB
 AEzv2/23aUJJFSx6gMI6x/VQ3/ijH+fdbjeoNvFPS9X8UtcSbxtRRcoCj1tKZHAltD7xTdW/tMX
 dGz+rgzkuO2dgx3Z8sJ5LGcCybYk7+DJ6Zq4wxcDDhUFr9h9ldwzEyhKt63/KERqZonhAC0Wnx7
 yqG/LxvgTcoyedbspNOhAqsMMZ/C0JdFMfogDtwThcQJXSYUvHEak7ftsRbb1iNp+dpXjLjS9E+
 +nuZOf4k137Vk5CAStaGKp5Owxe9AL6D8eHIZo31ou5woBlI1BPSx8x7WiOYDtYnnxEVYy98DFw
 OF70h4BCXWWlZO7X+eMBJc40Q5KhRl4Mf7p6UzLAT5y/4EmcR/WIw7ss5+6NTtIuPJ0vK0ybpJr
 pp4oITttl0uyP0w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The GPIO device in crag6410 is registered with struct bgpio_pdata passed
as platform_data to the gpio-mmio driver. We want to remove the
bgpio_pdata from the kernel and the gpio-mmio driver is now also able to
get the relevant values from the software node. Set up device properties
and switch to using platform_device_info to register the device as
platform_add_devices() doesn't allow us to pass device properties to the
driver model.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/mach-s3c/mach-crag6410.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index e5df2cb51ab27896d9dd80571f421e959db1fd1e..028169c7debf325ab6f51475d3595b92b1307189 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -252,14 +252,17 @@ static struct resource crag6410_mmgpio_resource[] = {
 	[0] = DEFINE_RES_MEM_NAMED(S3C64XX_PA_XM0CSN4, 1, "dat"),
 };
 
-static struct platform_device crag6410_mmgpio = {
+static const struct property_entry crag6410_mmgpio_props[] = {
+	PROPERTY_ENTRY_U32("gpio-mmio,base", MMGPIO_GPIO_BASE),
+	{ }
+};
+
+static struct platform_device_info crag6410_mmgpio_devinfo = {
 	.name		= "basic-mmio-gpio",
 	.id		= -1,
-	.resource	= crag6410_mmgpio_resource,
-	.num_resources	= ARRAY_SIZE(crag6410_mmgpio_resource),
-	.dev.platform_data = &(struct bgpio_pdata) {
-		.base	= MMGPIO_GPIO_BASE,
-	},
+	.res		= crag6410_mmgpio_resource,
+	.num_res	= ARRAY_SIZE(crag6410_mmgpio_resource),
+	.properties	= crag6410_mmgpio_props,
 };
 
 static struct platform_device speyside_device = {
@@ -373,7 +376,6 @@ static struct platform_device *crag6410_devices[] __initdata = {
 	&crag6410_gpio_keydev,
 	&crag6410_dm9k_device,
 	&s3c64xx_device_spi0,
-	&crag6410_mmgpio,
 	&crag6410_lcd_powerdev,
 	&crag6410_backlight_device,
 	&speyside_device,
@@ -871,6 +873,7 @@ static void __init crag6410_machine_init(void)
 
 	pwm_add_table(crag6410_pwm_lookup, ARRAY_SIZE(crag6410_pwm_lookup));
 	platform_add_devices(crag6410_devices, ARRAY_SIZE(crag6410_devices));
+	platform_device_register_full(&crag6410_mmgpio_devinfo);
 
 	gpio_led_register_device(-1, &gpio_leds_pdata);
 

-- 
2.48.1


