Return-Path: <linux-omap+bounces-1710-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2AE927BF7
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1C7AB221C8
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1103F9CC;
	Thu,  4 Jul 2024 17:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htSSDqG4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C588F13B295;
	Thu,  4 Jul 2024 17:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113824; cv=none; b=HvP90cTipj6PjAIqYfzMNng4NlnZY7LrY1m6acSTiEevXcU1uKRfblDJZhDaeppng2LU4ZKBjxVaUaiK847DblXYuNT4j0U+/ptlRTCu9uc80BH+NbD4YgPvVdCmZl4qon/9jeDPebCxh0/+C0Qw2pvpkOKPP/gTmeXQR6COh0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113824; c=relaxed/simple;
	bh=1QPZacUuOeaij0so0MenKs4sY5xXKtXayfwYDVrHiWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n4jqwu0RAiFU2qL+1GM4T3pOn+SheT13Cw+bLHrZlt1e6Qib9XR3ioAgTc67y5ZCR9KiuOt+gu7FrgN821X+dZjQlNnAdL9pReASgm1nqkV9G1qQgKtlUTq5dFVlOUQmYnPVyQjaGxybrhCrVfUa3kgUo9RJruM3LjNAuowY7DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htSSDqG4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-424ad991c1cso7357315e9.1;
        Thu, 04 Jul 2024 10:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113821; x=1720718621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZH0N2IdligxpGGw784EbC3Sbw2mtJNXF8+12BAAhog=;
        b=htSSDqG4bka0EV1KikBO7uRLPKB8cKvpqAG9kwlZy3gJXhYZWjip1vHRmyeaIIXVFE
         jt+5sxio9QbaXNb5J0sdF0v4GCbec8JremeEx6DVaMiOvWb8kS02UXN3/OYeWzjRZAgG
         iySme9Bbso35QkjZ6mxXsFm1eElTMACRUVbCVNXSl7XpmHbcUETzBZYoL9i9m9kQC+0C
         Ix6jdEwFFgNMf8r+m/c9eSaxMqT/GfkPl6JjqgM93luKH3o+pQMPueKU0gV7NYSKFhhZ
         6nuHqdoC1YN6KFnbu5QocTvvNSrJTyUAlnLy+Eg0UMC2JkR9NTG+qiIB9ENJFtqbe3Q8
         kDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113821; x=1720718621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZH0N2IdligxpGGw784EbC3Sbw2mtJNXF8+12BAAhog=;
        b=sunNEHSNnrnTRToijpq8n2TzEGCspB0kBy0XhoOmOwWJHbmYxJmJulz+NOpV+cmj7K
         eSyGyCOC+AY7GjQLSyrq9v3qRf/PU/A05oaMpg7IFw3gOubI4r20O4NCsYcgrJt/DIS6
         jxHYMqe3jBAS5Pbv7S5q10CEsEmsY1YKEAvVhULXkz2EybN/u1KstyFA75BYfKe1zNxv
         /1SfmXcmkT3/xOAMklOQbkVOmeuGgs65yoy23OEKUGsxMJW0RRUq4w6V7prSU7AM2/Y0
         gHtMCSTfLX2Q8iirDQ1yrzR+7bTuX67YWLr7hpJ7eV5TGdgiScp4qhcBqIj2RD4bjUEo
         L1vA==
X-Forwarded-Encrypted: i=1; AJvYcCVfRCPMQI5JjXmmkU00kjaYteswcR6j9wDQx8Cj48ijhPcD/ON44BbXjQ7aEPrOTqEhKcXfYgr+U3vBczL2V7mha6V+kUpCB7jk6bQV4MrLQQNcUSDHpKf9ZPWyycvnY/3tfU+9h4mdZGc3NgPR
X-Gm-Message-State: AOJu0Yyaccc1CDeemhKzUepCovmg9SwsyHoFJB8Ia86hfRW3+6bhU9hJ
	9x9M43InP9BIHr07VL46BHKtbdqVf6YneBPHVa3re8rCYCu4dQGl
X-Google-Smtp-Source: AGHT+IHVDvV5ZlABTxLnxGN+P/Oktapr3Dfo/w3DqKV5F+2RPZu1eXQFA/3w8stNEW7xOKHq54yiFg==
X-Received: by 2002:a05:600c:1c0a:b0:425:88cb:1741 with SMTP id 5b1f17b1804b1-4264a41601bmr21035435e9.36.1720113820982;
        Thu, 04 Jul 2024 10:23:40 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:40 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:18 +0200
Subject: [PATCH v2 08/24] mfd: 88pm80x: Constify read-only regmap structs
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-8-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=2233;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=1QPZacUuOeaij0so0MenKs4sY5xXKtXayfwYDVrHiWI=;
 b=7MzL1NssvI7gS5f5E0UMDoYA0lY9TxFldWlNp/BKaAes/ovgxyjcP6ITmOMmnZZoP6kcROg9w
 SXtwvZwXdcvAoBbxd4UY/nYYZ9shNBxeL0Q03q+Re1QIghRS9qh1ith
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`pm800_irq`, `pm805_irq` and `pm805_irq_chip` are not modified and can
be declared as const to move their data to a read-only section.

In order to keep the const modifier for the regmap_irq_chip structures,
the pointer used to reference them must be converted to const as well.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/88pm800.c       | 2 +-
 drivers/mfd/88pm805.c       | 4 ++--
 include/linux/mfd/88pm80x.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
index 384ecf5301d2..e9941da58b18 100644
--- a/drivers/mfd/88pm800.c
+++ b/drivers/mfd/88pm800.c
@@ -391,7 +391,7 @@ static void device_irq_exit_800(struct pm80x_chip *chip)
 	regmap_del_irq_chip(chip->irq, chip->irq_data);
 }
 
-static struct regmap_irq_chip pm800_irq_chip = {
+static const struct regmap_irq_chip pm800_irq_chip = {
 	.name = "88pm800",
 	.irqs = pm800_irqs,
 	.num_irqs = ARRAY_SIZE(pm800_irqs),
diff --git a/drivers/mfd/88pm805.c b/drivers/mfd/88pm805.c
index 205f0762a928..f5d6663172ee 100644
--- a/drivers/mfd/88pm805.c
+++ b/drivers/mfd/88pm805.c
@@ -73,7 +73,7 @@ static const struct mfd_cell codec_devs[] = {
 	 },
 };
 
-static struct regmap_irq pm805_irqs[] = {
+static const struct regmap_irq pm805_irqs[] = {
 	/* INT0 */
 	[PM805_IRQ_LDO_OFF] = {
 		.mask = PM805_INT1_HP1_SHRT,
@@ -163,7 +163,7 @@ static void device_irq_exit_805(struct pm80x_chip *chip)
 	regmap_del_irq_chip(chip->irq, chip->irq_data);
 }
 
-static struct regmap_irq_chip pm805_irq_chip = {
+static const struct regmap_irq_chip pm805_irq_chip = {
 	.name = "88pm805",
 	.irqs = pm805_irqs,
 	.num_irqs = ARRAY_SIZE(pm805_irqs),
diff --git a/include/linux/mfd/88pm80x.h b/include/linux/mfd/88pm80x.h
index def5df6e74bf..551ef1c367d6 100644
--- a/include/linux/mfd/88pm80x.h
+++ b/include/linux/mfd/88pm80x.h
@@ -294,7 +294,7 @@ struct pm80x_chip {
 	struct i2c_client *client;
 	struct i2c_client *companion;
 	struct regmap *regmap;
-	struct regmap_irq_chip *regmap_irq_chip;
+	const struct regmap_irq_chip *regmap_irq_chip;
 	struct regmap_irq_chip_data *irq_data;
 	int type;
 	int irq;

-- 
2.40.1


