Return-Path: <linux-omap+bounces-1703-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83515927BE2
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3835A284AF6
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7220446A1;
	Thu,  4 Jul 2024 17:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6P+Jc4x"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37CE32C85;
	Thu,  4 Jul 2024 17:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113812; cv=none; b=PLdLGDEJZwTOwnrhWoeypirP5ESCArgswh0KT5+QJbsgH1OICCwweONGj8GVFyJJX/aegMXzbH5WswZhZWMSd6k47sScY47lgtgqYSJMqLelwfFKm7ZvNjxrQFxc0AbmWHXsGG7pbKWJQkn7cEAkx7sGEwqI12RdZf38N3kNH/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113812; c=relaxed/simple;
	bh=1FFSzWZVDSBD2A+D27kWrIyvC4pn+kvq0HYdU/k3PyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t3tixpEhTdjhC7z0vooVLEpp7kgIVQkT28d8VtFztpl1AZQ82Qx+m43G8A3KA+HET8guGzWLd/SoM7FXehyslLdTSgOPJPqws79B0DYGL+EchklmKCuAdvo4arRXOkjfXjnjkoQrLcOGFA45lgnTR9HCbX672w5Ux6gzPeKv6Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6P+Jc4x; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4256aee6d4fso5192495e9.3;
        Thu, 04 Jul 2024 10:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113808; x=1720718608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/FvmgWoqRW+fG/g6TS9f9J9g4zOorBTS1e8w27Zmhc=;
        b=W6P+Jc4xG2dJEUxMHVhfEskwx4/pRt80xfv0BRnR5WXH2zvmgzvp5gCKCA/vyi2N0o
         +dkAzrMP/Neh5LFnpkzrsqZQ2N6eudM/3GnvZDiZJgnU21WM1wFsL8M4bhzMHVmpQkcj
         MJODYfQRCTrW8GCoeJMcN84bOjL9qKhSQgMa3fVSvYJb8tGtDs+27NThde1Nkxunsysr
         VT8hlgG8R3ImTko1rHylJN3HPAqEuQaCXQiX0jCChcywolT807mnfnUn69Cemn5MwMsm
         L3EixBf6ZJfrLC17gHQ4rmti/K7dwXB1/mEh8Af4z9oObUIABWFXmTKfJ8O9Y8kG7xQt
         nCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113808; x=1720718608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/FvmgWoqRW+fG/g6TS9f9J9g4zOorBTS1e8w27Zmhc=;
        b=EIU4eONGBEKgeWzYMrm+6N7ui3zs4m4/jjT5gpvt/xs1R3rd3OnesT50D+YHILLQDC
         /DA0V2MXbQykotnNYv1lzmfvHo2BR1/h5Xey+n9oywg4gAwgkvFrQPnPhDFhEn6z0prK
         e4kKEuTCKm1fGPgRePifTWTR3o2FYJ1WBWBqZtAZ+k3jD6wg05KdRo+qqiHrqa6x08Bv
         bP59ioo0qsm6MwEaeQmfoMzLGOfX7xgfbhIRc9TTbGJrvhTJwSYi53W3Jy9TDS5NND9n
         3F9GE0YYAmWaW7TW0XWT5JGskyhU1Bf8oKN3U09AzwYttJDYqVwCPJn9G8rbKApAl9BN
         4bJA==
X-Forwarded-Encrypted: i=1; AJvYcCWNntcNLTTTEjxyNu7fz4PkOJEI3m5qQFSlTzYNSjEx/bTPKkaCAJBWZ1MdHSI2D4qT7lm6O7AkxqdurUZiOaq3KlFNnog/YzCsX8slzw+ei4r6A+e9OCdgM+7hON4Q0iG5SItTOhg1aavkNO1G
X-Gm-Message-State: AOJu0YwI9aq9s4fnmVKzqOMRHuUMEHB5sU371qi/rde4ixkh6ewVmj64
	bDgiqZEcf0ftla726/cdR76pgomMHhdR8486FQlFppuxg0PM/prZ
X-Google-Smtp-Source: AGHT+IGkuS7h4KLnK+AZjYqP9kYe4MKb98PWAAeZkMdpo/UBy/dWlRc+ua+cpRXuqFWbFBjt3F1A1A==
X-Received: by 2002:a05:600c:1649:b0:425:8d90:4ade with SMTP id 5b1f17b1804b1-4264a3dbd3emr16710395e9.22.1720113807982;
        Thu, 04 Jul 2024 10:23:27 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:27 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:11 +0200
Subject: [PATCH v2 01/24] mfd: da9062-core: Constify read-only regmap
 structs
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-1-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=2168;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=1FFSzWZVDSBD2A+D27kWrIyvC4pn+kvq0HYdU/k3PyI=;
 b=5rNOZMDQYllm8BI7xY2p55OAn8pxJw8n/xKGFCzdcLCf6J79Nxe1j0fpwJNj0a0Q3xhKHR6vv
 OMGrake9gahAbU0hMHYfukQGRoiNKk8U71xJAuZoJ2hia+czDry55YJ
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`da9061_regmap_{config,irq,irq_chip}` and `da9062_{config,irq,irq_chip}`
are not modified and can be declared as const to move their data to a
read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/da9062-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index dbbc4779170a..637c5f47a4b0 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -25,7 +25,7 @@
 #define	DA9062_IRQ_LOW	0
 #define	DA9062_IRQ_HIGH	1
 
-static struct regmap_irq da9061_irqs[] = {
+static const struct regmap_irq da9061_irqs[] = {
 	/* EVENT A */
 	[DA9061_IRQ_ONKEY] = {
 		.reg_offset = DA9062_REG_EVENT_A_OFFSET,
@@ -79,7 +79,7 @@ static struct regmap_irq da9061_irqs[] = {
 	},
 };
 
-static struct regmap_irq_chip da9061_irq_chip = {
+static const struct regmap_irq_chip da9061_irq_chip = {
 	.name = "da9061-irq",
 	.irqs = da9061_irqs,
 	.num_irqs = DA9061_NUM_IRQ,
@@ -89,7 +89,7 @@ static struct regmap_irq_chip da9061_irq_chip = {
 	.ack_base = DA9062AA_EVENT_A,
 };
 
-static struct regmap_irq da9062_irqs[] = {
+static const struct regmap_irq da9062_irqs[] = {
 	/* EVENT A */
 	[DA9062_IRQ_ONKEY] = {
 		.reg_offset = DA9062_REG_EVENT_A_OFFSET,
@@ -151,7 +151,7 @@ static struct regmap_irq da9062_irqs[] = {
 	},
 };
 
-static struct regmap_irq_chip da9062_irq_chip = {
+static const struct regmap_irq_chip da9062_irq_chip = {
 	.name = "da9062-irq",
 	.irqs = da9062_irqs,
 	.num_irqs = DA9062_NUM_IRQ,
@@ -470,7 +470,7 @@ static const struct regmap_range_cfg da9061_range_cfg[] = {
 	}
 };
 
-static struct regmap_config da9061_regmap_config = {
+static const struct regmap_config da9061_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.ranges = da9061_range_cfg,
@@ -576,7 +576,7 @@ static const struct regmap_range_cfg da9062_range_cfg[] = {
 	}
 };
 
-static struct regmap_config da9062_regmap_config = {
+static const struct regmap_config da9062_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.ranges = da9062_range_cfg,

-- 
2.40.1


