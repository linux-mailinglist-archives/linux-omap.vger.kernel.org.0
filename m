Return-Path: <linux-omap+bounces-3743-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CCDAC719B
	for <lists+linux-omap@lfdr.de>; Wed, 28 May 2025 21:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF9211C01D05
	for <lists+linux-omap@lfdr.de>; Wed, 28 May 2025 19:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E9B220F38;
	Wed, 28 May 2025 19:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tI8y4QfZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D094F21FF41
	for <linux-omap@vger.kernel.org>; Wed, 28 May 2025 19:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461463; cv=none; b=dpg8XdbPRgbr9aOLiu4QRe2TnoHsI8DCF6l6taSWBfDxb1WUqg9fGQ/Xv2C/YHe/8fiOTpjJcxDRAvGpOkGiRfFszidhuQuz/+rKrUHBQV7QYnYNdXnvZgKFefVacF62vnJs5jwFxuGQUD4Iei8yk4MkmxDehIKN9kxIz/RLhOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461463; c=relaxed/simple;
	bh=yC4KHqUdMBe7woj+QjRPOzZVPjDv4hG1MYsFQGX6i7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X9KHQZFXHP5ZKhQccSvXMTF6XRpo7cRaS5SEe3wcgUdfDmF5K+TcYZrA7PkgQ+a0I7xkapJKG0axev/FSJKkB1Ea7YxCdUIJSNXJunQT6G6I6I8UzJcbW7Gu3aqXGMVHf74vgZ6qxzV1aaKAkzVUZqGQ+9018FZlBQas9tv9q8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tI8y4QfZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4e62619afso25133f8f.1
        for <linux-omap@vger.kernel.org>; Wed, 28 May 2025 12:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748461460; x=1749066260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7BbIwvkOqMe2XjAOSq/t2dzQvZrYhANMJuUHYM+UmQU=;
        b=tI8y4QfZH5Vo8taPpABEOg3J19WSjWSsHUMmCyBZB6A1NBmDG0ut7brKnEANZSRhTM
         N10A7LpGHkXjlo/rP2zQ+IoL+rH8xgG/mY3TiEyElHtL5ByQTGHriAByuBzHbyokBl9T
         nX+OdmnkDCyT/sVmGyf9y+eiE/0D+9ZV8DgpBdVaHsTPDpDQvsXZXGkRx7P9Y39k3uVI
         jP82lh9bVxrY5Ur6nFnEx4Oc9CJPSsc5GFl3ZVi3jHCMvIgTnYtPaDeMcls0ssbCP6Q1
         zqoWOkgHgtsGtFMvBLBABZlfwCpfHk/c1hvvSPmCqlM8UXuK2QK6LZ82r+DHnSO5NCBp
         8X+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461460; x=1749066260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7BbIwvkOqMe2XjAOSq/t2dzQvZrYhANMJuUHYM+UmQU=;
        b=uqGKZ0HO6UWkWndR3q3x9zdw/uIU9YccHnmcteGY8/2s/sFrAz61d3YFy83hO70cs5
         uB5DxUyorytPxZdW32ZVIaYbIMxVgmLD+zrWwbl5mWK69GgAOoZoyrcExnLXgtFbV50T
         VAFEN0Zo9D/o7Rf//UuVKUdtYdEGLTkhzbVrwnhHkrUhdVgVpXzZENNRxAYfbRdqRrsP
         IBM1It3tg95llmmJ/O0gE603gNVknvZUwgV2lKQuIFHxwqrZ7MGYpSfj21P09hOSPjjQ
         dTQ7Y3zSWkNsd3kNfFLLRzKPbvjc9PknlqWOPRlOr3hoMtnaPQuTdT3A2WXY430unHoT
         zo2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzFKiONpTgZ1EoTtRIdoWoaiJvL5+lcllkEnMvoQ6EXy15+knN3Q/djuzcJafFcaC1iC1yrfu6a0KI@vger.kernel.org
X-Gm-Message-State: AOJu0YyWHR0ws396c4iBGJpWZ4AzMrrTaLiKuhost6g6ygloqbb4CTFE
	QHuwBSmqSarXxWgSXeIO/EvSNJnfEf/JhHl9t6EObCakbfjyD/Yrq4+52Y5ZFsmsMG0=
X-Gm-Gg: ASbGncstq1IumVsbv9gP952PYAD2s7gzDDu5pYlRIL+9MJhCnKUpQPl9lCJrdV0xlw1
	8fJW3Iqam2Dyq3gZDccM1j3MCTumC88jrh64lHjo7ZlY1Qkgei25fgRn0NyB11N0utKBsscN+Nh
	RyRC7u4ZydWBgXnh34xvG6K7gqNNtrzpztDGtL2ZPedaNp0vUBW7DxryzHg6ukvCcg1vOPBqLka
	fS0yeUke2i/OXPYjNpcqwQPRCGe2dL0MC6JrrJ4qwOxYaOBXhAXbBjZeBWBiQmap/HpfToq7Ftc
	FrKe+rsHfe1GQ+kPC67jKKtY3R8oLOc7maWNKlGP06dzI8d/DwMqk7CJ001zRw==
X-Google-Smtp-Source: AGHT+IFT2j1LhVVZ7+ic2IRAXwmIkl8GYWLIuAi2NSFZzzml1GNKxQj/yqHVtyoR+IuomRnTSsLtVQ==
X-Received: by 2002:a05:6000:1a8f:b0:3a3:7ba5:a225 with SMTP id ffacd0b85a97d-3a4e85d3136mr1236426f8f.0.1748461460095;
        Wed, 28 May 2025 12:44:20 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eac8f128sm2342354f8f.60.2025.05.28.12.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:44:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Lee Jones <lee@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] mfd: Constify reg_sequence and regmap_irq
Date: Wed, 28 May 2025 21:44:17 +0200
Message-ID: <20250528194416.567127-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3240; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=yC4KHqUdMBe7woj+QjRPOzZVPjDv4hG1MYsFQGX6i7U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2eQ1RTUYokQK89V/x3fc5Nk2JoS5grKWaWB2
 oB8JTnzBA2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdnkAAKCRDBN2bmhouD
 1wG5D/4weq8tgGziRWH7bFRVssTROgc6AUGNg/YqHqxQCuR2Q7pd0zoybCGc9Nj1AVqRvu9+8UW
 bx7IiRuFfrxIwQ3MabTH2db9QQpbu13J9ynWJNEq59iQY1Ac2UTrEqAdX/irNKLKLHfhANmELzB
 ND9kcjjBz/OJASL7Gh5mskTRaCcHhZtC6929o/KBUdNG2cOvtUO2L9jvondUYdKxO29yF3+2sSK
 v9oFN6NDSLfe0262zcGPhgCsGWg4AqrDhIWjL7QxW77AURX1a3LtHI6qPXXHu1oXPs+Lh+BAdT7
 aG++kHdqJlh0mnn2HUBW4n2ERmPc9ZBTZ5vJKDM783sfv1OAm4imVsCPBLrWFL1+jJZaA4AxNWy
 PNYDkcu8miPwB1HoSBNT+6d/rr/QrTFf1M3TuGPy2m0fxeXGr6Fc+8Su9PfzP7IE778VRY6vXMh
 z9fKGkSQMcB+aMZeOsUyg0FXQwo1H4FNW3gKMC94A6tOdSkHiFBeaOLjyUJRpRxAqRu2T1mM2/6
 u6Paikv0vWQ3FHiAGTM14tq58rhWrS9BSTwTbvhsGOGpP6ybPfqvaSMYxIgHR5nT+a++2e0EQKc
 Jl5L83snCqU1Yeo06DuXRI+0G/aSqCWjQ9fKOWPG4dGVOTFOTbqI7jGzzi/Upvl+/EqC4GeE0cU ibB3Kh87rvU4PcA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Static 'struct reg_sequence' array, 'struct regmap_irq_sub_irq_map' and
'struct regmap_irq_chip ' are not modified so can be changed to const
for more safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/cs40l50-core.c | 2 +-
 drivers/mfd/rohm-bd71828.c | 2 +-
 drivers/mfd/tps65219.c     | 4 ++--
 drivers/mfd/twl6040.c      | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/cs40l50-core.c b/drivers/mfd/cs40l50-core.c
index 4859a33777a0..c91bccda0858 100644
--- a/drivers/mfd/cs40l50-core.c
+++ b/drivers/mfd/cs40l50-core.c
@@ -52,7 +52,7 @@ static const struct regmap_irq cs40l50_reg_irqs[] = {
 		       CS40L50_GLOBAL_ERROR_MASK),
 };
 
-static struct regmap_irq_chip cs40l50_irq_chip = {
+static const struct regmap_irq_chip cs40l50_irq_chip = {
 	.name =		"cs40l50",
 	.status_base =	CS40L50_IRQ1_INT_1,
 	.mask_base =	CS40L50_IRQ1_MASK_1,
diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index 738d8b3b9ffe..47e574a57077 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -223,7 +223,7 @@ static unsigned int bit5_offsets[] = {3};		/* VSYS IRQ */
 static unsigned int bit6_offsets[] = {1, 2};		/* DCIN IRQ */
 static unsigned int bit7_offsets[] = {0};		/* BUCK IRQ */
 
-static struct regmap_irq_sub_irq_map bd718xx_sub_irq_offsets[] = {
+static const struct regmap_irq_sub_irq_map bd718xx_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit0_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit1_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit2_offsets),
diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index fd390600fbf0..30bdd37413fd 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -238,7 +238,7 @@ static unsigned int tps65214_bit4_offsets[] = { TPS65214_REG_INT_BUCK_3_POS };
 static unsigned int tps65214_bit5_offsets[] = { TPS65214_REG_INT_LDO_1_2_POS };
 static unsigned int tps65214_bit7_offsets[] = { TPS65214_REG_INT_PB_POS };
 
-static struct regmap_irq_sub_irq_map tps65219_sub_irq_offsets[] = {
+static const struct regmap_irq_sub_irq_map tps65219_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit0_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit1_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit2_offsets),
@@ -249,7 +249,7 @@ static struct regmap_irq_sub_irq_map tps65219_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit7_offsets),
 };
 
-static struct regmap_irq_sub_irq_map tps65215_sub_irq_offsets[] = {
+static const struct regmap_irq_sub_irq_map tps65215_sub_irq_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit0_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit1_offsets),
 	REGMAP_IRQ_MAIN_REG_OFFSET(bit2_offsets),
diff --git a/drivers/mfd/twl6040.c b/drivers/mfd/twl6040.c
index 218d6195fad2..562a0f939f6e 100644
--- a/drivers/mfd/twl6040.c
+++ b/drivers/mfd/twl6040.c
@@ -69,7 +69,7 @@ static const struct reg_default twl6040_defaults[] = {
 	{ 0x2E, 0x00 }, /* REG_STATUS	(ro) */
 };
 
-static struct reg_sequence twl6040_patch[] = {
+static const struct reg_sequence twl6040_patch[] = {
 	/*
 	 * Select I2C bus access to dual access registers
 	 * Interrupt register is cleared on read
-- 
2.45.2


