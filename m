Return-Path: <linux-omap+bounces-1726-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60159927C2C
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92ECA1C21D0C
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891C2146A7D;
	Thu,  4 Jul 2024 17:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhqP26br"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD96A1465B3;
	Thu,  4 Jul 2024 17:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113853; cv=none; b=K0aeFIdH4okS7s6vuDPCRoZcHI8Tn1KN5YdwlHkLKPRPlkyyeqJ3j7nyJMZ0QNacFObxkQYuCYHR/8NiDplUHfR8QkG3mkWBB3P21kYsSJY4RlKhbLHNOutF2OuDqmFLsF/1+uvhVpP0m9aIlOyrSWql7EJe18Va8pGucxunVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113853; c=relaxed/simple;
	bh=bSrh6dRMhrjSnNp2eZHSzRWT+oe0XS3yo9fzlNPFI3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AodKa5yB28crxewM9hCrLaTvKUTnDrGQz5MIxFp9MNoWHpLCrSXaf6hIHwgHgsuldIXuNFdH4zahl8V3e7Apfq6yK9gWexa/jAjXwFBHdsQQwKjFAwugi65SYtAmgL6VFS7LHH1L0nYZJh2gECKjkafOg/khIa5HXfuOM0+gWLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhqP26br; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ee7885aa5fso9062611fa.1;
        Thu, 04 Jul 2024 10:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113850; x=1720718650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cY6xfOZvlcet+ySjb9JWf/+SsmV4UTmCb1l/EHDXfC8=;
        b=BhqP26brsmr8A6NhQ0l5flhVvJHbg7EfE/q6HB/kpEw/DvY6xxYvv50zkSbc5cwFFy
         JNS51kJH+F5uCqyhJXJK+d9DdCCwmhchscTKOuDiD8k0UyzhgDBB7U7Jfy/1krfKcdBS
         NrX1cKKTwKXPEkrK7ENNBvSuzIL7dKQhyRq9HcrQbHmd4gEcneif/0CY2Gm2ExBZ9O2k
         4qLlrQJ11k7RLbc5vjdLRTJuYWhDHKFuYBNmw9BxqFsLT89Yyfa9IKmFOhRdTlTqcEc4
         vnPI5Aki6kxhKNIzDkALgX8ECFMuVQTc6XaR3jMF+08qlXjz/mqi/cLr6/AkGp3XmlYE
         g1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113850; x=1720718650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cY6xfOZvlcet+ySjb9JWf/+SsmV4UTmCb1l/EHDXfC8=;
        b=l+Z4DWX1gPhSEo0oG3XIiMJ4cBvYGhcNYg55T2t53SB1fvxHj4vIdqADCHC/587etq
         hISQZNB8XUQriZTZhjQYqLJxzcW9UthHkzFfagPGaNODt3oULvjTjVEf2jjx5BP/mIgQ
         W0/vpM3z5ejJLhzNUls3Kngy889SoFNTOIhhC7w8sL3ONMossJlDOnOGx5FSqzbhKI5T
         RvDKBGVsVN8Ycjp43VtS52GmvxzIgo9tOJdTtOfFmV9mt1PjoHp8QOokfRobkZBG0d42
         iWEKznQBoFR1i8lsvHNWU00s0x+VQVa2m4J2FedBCPLOIVv3A/tAesHatrQ0nr1WQrOn
         AUwg==
X-Forwarded-Encrypted: i=1; AJvYcCW/5imTQ43J9D5n34/tExo+r7/ezfVEmIAHqa7eDzBy2UGlCSDAqj/PASqb17CMArE+ecEfwszDuiCn+rgn8/SNsMPz9m7NMJ6jTxT8F6GOkX5bd/vvqjoLq4w8PhuCxAUBaGjTzV8AYotYQ3aM
X-Gm-Message-State: AOJu0YzJgMzoupTwAZkCzXaHhFOgaJ3LrMxiKZqefda8cilRthjJNjkU
	TuaQW4luYwOxpAK9LuM1EWq5WHue/VqaN8YUdwVWj9iOet4cUdNj
X-Google-Smtp-Source: AGHT+IGtnAvbW4no2BJkVizF7QyWI4V6mUEbSxAj8vrlcD/ecnkkHDmGxX/0R/e7YeC7WvAUoP8myQ==
X-Received: by 2002:a2e:8889:0:b0:2ec:3d2e:2408 with SMTP id 38308e7fff4ca-2ee8ee00250mr15810741fa.33.1720113848939;
        Thu, 04 Jul 2024 10:24:08 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:24:08 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:34 +0200
Subject: [PATCH v2 24/24] mfd: sprd-sc27xx-spi: Constify struct regmap_bus
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-24-0c8785b1331d@gmail.com>
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=780;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=bSrh6dRMhrjSnNp2eZHSzRWT+oe0XS3yo9fzlNPFI3o=;
 b=DezkfXYqRxh+l8xH0kAqtfFdbmPbZ6IPk/AWxl17e20cmNX8etXGB8bY4Kz0Nd43R0lo58BHn
 Zy45XHOUm9nArbuXRULBjg/edSFn9HKpD5rSni6VE2XuT+YjdZnsqq2
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`sprd_pmic_regmap` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/sprd-sc27xx-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
index 81e517cdfb27..7186e2108108 100644
--- a/drivers/mfd/sprd-sc27xx-spi.c
+++ b/drivers/mfd/sprd-sc27xx-spi.c
@@ -135,7 +135,7 @@ static int sprd_pmic_spi_read(void *context,
 	return 0;
 }
 
-static struct regmap_bus sprd_pmic_regmap = {
+static const struct regmap_bus sprd_pmic_regmap = {
 	.write = sprd_pmic_spi_write,
 	.read = sprd_pmic_spi_read,
 	.reg_format_endian_default = REGMAP_ENDIAN_NATIVE,

-- 
2.40.1


