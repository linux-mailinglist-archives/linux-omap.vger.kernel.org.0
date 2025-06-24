Return-Path: <linux-omap+bounces-3959-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B95AE6610
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 15:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 787053A8681
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 13:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C782C3770;
	Tue, 24 Jun 2025 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Q+MZ0kBL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0172C15B3
	for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771172; cv=none; b=iqlsnvRPbMUwFaGutDIjbSboH/KyZ7Na/T1BlSs0ViTbmAioveEU9qfacQojYt42MMLknVtSwa/0fuPOypXMklKGp6sslj3oXR9bZQGxMrBQbCyudrMwWGSVWUH0yM5rf08BTkXVf3G55Isc3QtIEKUSofm2aKIAk2VVcHBVZiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771172; c=relaxed/simple;
	bh=xcORaGp9hp93QNoUi06xKHxtsVsUcT6kMZo7X4w0D+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cv4hZPcw27tUo1U5bc2TG5NDPmv+dHraVZ55FvR3wgrgZLB7MssGd/rlQisSITYRAQHA7XCN/gEWQBcnTE6uU1p2OfiFttWy+VYCT3OS3Na/mjc8vBbPHfrY7iSXR8H3Mhr3LHIcUBZyZKR5L8EqHYfjue+epb7BXzJ1q5m0hNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Q+MZ0kBL; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a510432236so3936030f8f.0
        for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771168; x=1751375968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfA10XdOACRY/IrBcDZpDZb3kuGH97Dyb6S2+RQRG3Y=;
        b=Q+MZ0kBLc42vVDyBsIp4gD2hi0YvzK91yFBM4rLHNa4NPZpTo7xZvLVvS5sjq6XvcE
         KaxnKhaVzApbhBEOJ1qLT2Ps7SFgbPkAG76QcX2hsHdOad5KANp8HsZklKqxVl4xwHsu
         FhDHSOqfwUwQZNfD9G7ulK11cFxI2FfgMcNos5vzpOTbhVyw6MjomlRyPV3zkiL9P5Vn
         htq71puGm1JESEaPnuOZ9I2Ja8j7xQu3mv0tQAShFnxZuOHiWIOQlEvXEFD2rExEBCvR
         ry9ilBEP1OQ0OGur7/SqY9CmuQOWb6CbFb9Y+ueM2lxQwIxjLKWGUz28y7bZ+kEp9Y4G
         xhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771168; x=1751375968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfA10XdOACRY/IrBcDZpDZb3kuGH97Dyb6S2+RQRG3Y=;
        b=jbDr89luptVCOY2jFLjhC/ooSNQnoaHA67vS2oMLF79Tw5e0PGLgpPXi6g3ewsqwVQ
         n1ReAMaTt9v2JYyPC0B6e1rvx1Qs6UViQcnaF0+L2xUOYeFMQduuWGWX4+CzKVTfRJ2/
         GHYzvZR47d+o/tBxZ78TN4ZqDjDLn3pwMu+vYo4cvoyJhFWicY8uzQ+FA+KSHOd/kqMy
         kJBFUKtQU3YHkooQR5bCxxzI8U45K4+vY8+zQmOoxSupLPZtuu7Apk6gCNxlSwx0pjPv
         xuAQaI9x4hnf654fyzoFDqXZUqMkqv3tFDB8Sf4KIWP2E5MckZUjuF1Xkw1gbNJE4s8t
         JQYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcmZglFu9VtHd87IomSof07oDJGuqW0h85x2qtT0GuA8yEKICyL0/ehlBuyMZvJUrl6FnHp7j2h4Sh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0BCroPckCp25nIaJp8+9901RGas0pG4O/vLWavlXXsZNiw7dF
	EkS/GAo2TVGDPGR0034JNGAnwaRmmPTK/cIIrznSC98eHkXJXzW2w3MP0RABBoO2pQs=
X-Gm-Gg: ASbGncvXFy4o92vsxM828Y15r1iRDqAwe3IkUa0xnmzU+M3M44+eWWAXmrx5l26ZCuQ
	HzHq05H1JnaMx3pJ3Mg3Je/tYBU6RWfw44m5utibCTO22lQuMS0VkkGcdAxdAcO3MgSLPQ6lmmq
	KoTWaQcKnjCRvTUebNS8JW0Drps8X4nFeHYI3HXiVEev5pnovIwrfqrVrRmpFqbVtDCC1kwhKU+
	HT2WzsaCoGqFp7b212RBCg8UPTd8scvvK4hvGDheK8Jz/2K8zeP7pkeMN8Bj/bVl13KD4bfGCvJ
	CKkn5n1visD/X5uIy2Xj9Em4Rsivv3gGJi30JLl4hFqKzcacLvjvVDveXTj83h6jiQ==
X-Google-Smtp-Source: AGHT+IFTifOhva4BdmUJzGwpovbRm2O4f8NWPXbDRvmJfySUXOoY/Vcz/no16JAPAVghSOGd/Bdvdw==
X-Received: by 2002:a05:6000:402a:b0:3a4:e740:cd72 with SMTP id ffacd0b85a97d-3a6d12e33b5mr14504534f8f.13.1750771167466;
        Tue, 24 Jun 2025 06:19:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:19:15 +0200
Subject: [PATCH RFT 4/6] ARM: omap1: ams-delta: use generic device
 properties for gpio-mmio
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-pdata-v1-4-a58c72eb556a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3651;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gFSys3VgqjoqW4I00DJkRfiOOgkVrIw7F6KFiFLO89k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXXnpvf/V8HRXBEddOjIKP61RqNuBN355+tm
 gJZnUsAYSeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql1wAKCRARpy6gFHHX
 cmTxEADJSTbkm9nmIjrvON/4aWNZaOQWGwmERXenxDHo6azSSVxY0Vqu/df0cBANsdlJ0bQZ5kg
 GMeopmjkGkyzNMRfxcSoA3M1nZjPMObxMVCEW844SdxsJUg3D++QxcXspEi0HFmFmtuxrQx7SSE
 A2tP6ZP9pgxcZ5RJPc3CYvsZU7zECWTUTMpETHKjaA5Zva1cQZWsSRSNyN4btQPr5nIeL4qrrGw
 KzDvBxP+WD9/HRFx1OV5siWn3MjpUoTP0u4dr5AkuPCBqbSGsUbD1V0EOF+QzQ+1EoAuMTR6s3b
 hqH+ZOkMCnIaktBI+Josa8iHbdfffA8IQ25A6gn0cnJ3NKNrUSNMjptPYtOmcXPmGpaUKh5XVH9
 wMVLWjOzoStmxen9NcmFIahGkb5PNvcyVp+YhFEyMbikAjeBi1fh2b5H0N5RvcKEftV8mn2Ipti
 MONCVWkuAn/2f/fWUIXwvoyNOV0cHpcSCMu4yARrvbIX6hrz5eiSxtaDmEnL+bxo4wfHfAXFXn0
 6GOu0tHw84dy8Ny3+dB7XIXPoySiaFB4BS3cZH8X7SJxefYejQYp5+hy0xB0+nm5TLlQ1DmLHMa
 udtgNZ28WrAsW19CMj3wZ7MsAVJCgoIoaSwspXrXH0DdEyvbhCD93Bu6qkcZX7kHJOrKlcQXtqK
 XFxQ11pBw2aA3ug==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The two latch GPIO devices in ams-delta are registered with struct
bgpio_pdata passed as platform_data to the gpio-mmio driver. We want to
remove the bgpio_pdata from the kernel and the gpio-mmio driver is now
also able to get the relevant values from the software node. Set up
device properties and switch to using platform_device_info to register
the devices as platform_add_devices() doesn't allow us to pass device
properties to the driver model.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/mach-omap1/board-ams-delta.c | 42 +++++++++++++++++------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 0daf6c5b5c1cbcfd5bd15203cad119d39aa95f19..16392720296cd224732450c85419c35bbab506f6 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -19,6 +19,7 @@
 #include <linux/mtd/nand-gpio.h>
 #include <linux/mtd/partitions.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
@@ -175,20 +176,18 @@ static struct resource latch1_resources[] = {
 
 #define LATCH1_LABEL	"latch1"
 
-static struct bgpio_pdata latch1_pdata = {
-	.label	= LATCH1_LABEL,
-	.base	= -1,
-	.ngpio	= LATCH1_NGPIO,
+static const struct property_entry latch1_gpio_props[] = {
+	PROPERTY_ENTRY_STRING("label", LATCH1_LABEL),
+	PROPERTY_ENTRY_U32("ngpios", LATCH1_NGPIO),
+	{ }
 };
 
-static struct platform_device latch1_gpio_device = {
+static const struct platform_device_info latch1_gpio_devinfo = {
 	.name		= "basic-mmio-gpio",
 	.id		= 0,
-	.resource	= latch1_resources,
-	.num_resources	= ARRAY_SIZE(latch1_resources),
-	.dev		= {
-		.platform_data	= &latch1_pdata,
-	},
+	.res		= latch1_resources,
+	.num_res	= ARRAY_SIZE(latch1_resources),
+	.properties	= latch1_gpio_props,
 };
 
 #define LATCH1_PIN_LED_CAMERA		0
@@ -213,20 +212,18 @@ static struct resource latch2_resources[] = {
 
 #define LATCH2_LABEL	"latch2"
 
-static struct bgpio_pdata latch2_pdata = {
-	.label	= LATCH2_LABEL,
-	.base	= -1,
-	.ngpio	= LATCH2_NGPIO,
+static const struct property_entry latch2_gpio_props[] = {
+	PROPERTY_ENTRY_STRING("label", LATCH2_LABEL),
+	PROPERTY_ENTRY_U32("ngpios", LATCH2_NGPIO),
+	{ }
 };
 
-static struct platform_device latch2_gpio_device = {
+static struct platform_device_info latch2_gpio_devinfo = {
 	.name		= "basic-mmio-gpio",
 	.id		= 1,
-	.resource	= latch2_resources,
-	.num_resources	= ARRAY_SIZE(latch2_resources),
-	.dev		= {
-		.platform_data	= &latch2_pdata,
-	},
+	.res		= latch2_resources,
+	.num_res	= ARRAY_SIZE(latch2_resources),
+	.properties	= latch2_gpio_props,
 };
 
 #define LATCH2_PIN_LCD_VBLEN		0
@@ -542,8 +539,6 @@ static struct gpiod_lookup_table keybrd_pwr_gpio_table = {
 };
 
 static struct platform_device *ams_delta_devices[] __initdata = {
-	&latch1_gpio_device,
-	&latch2_gpio_device,
 	&ams_delta_kp_device,
 	&ams_delta_audio_device,
 	&ams_delta_serio_device,
@@ -697,6 +692,9 @@ static void __init ams_delta_init(void)
 	omap1_usb_init(&ams_delta_usb_config);
 	platform_add_devices(ams_delta_devices, ARRAY_SIZE(ams_delta_devices));
 
+	platform_device_register_full(&latch1_gpio_devinfo);
+	platform_device_register_full(&latch2_gpio_devinfo);
+
 	/*
 	 * As soon as regulator consumers have been registered, assign their
 	 * dev_names to consumer supply entries of respective regulators.

-- 
2.48.1


