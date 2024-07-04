Return-Path: <linux-omap+bounces-1720-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4496927C17
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A5461F238EA
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185EF144D25;
	Thu,  4 Jul 2024 17:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCYyEp/g"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D01F144D0C;
	Thu,  4 Jul 2024 17:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113842; cv=none; b=GmAcpbaMS4gjIGnof2Y/8QicOGBiPbcGi+57RrCP07rjmeWnZIp+Ip4E2nLtbYGS6mToMmBEJ0oLAXKHbL9HRflc76aFd3MwhR+f5c+/p/aMSQ3GRWxsIxZ0UK0NrnbOHLZkuMovpzEYryjC4rVO1Akbd4c3LK4pNTYB3O19ZbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113842; c=relaxed/simple;
	bh=1DZ6ZNTYVH+qxDLzyvoRZYeRzU6/uB98HyF0NhspnHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d3xMT8DyBJrHnVftpheZ+yj5uFuNBV2uafHsDk3hlBnLQIOZYxfFtMRs4t15sF7jfYUEzFKOFdgns4sFpMuMXjbRZbmdGjE1/fB2ovAacMSdl5T+ce1FFGccMv/ZtBP14oM4u/wKBfaL4P90u0zbph0lHOHmXvBugcykFKuQZsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCYyEp/g; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-424adaa6ceeso5231395e9.1;
        Thu, 04 Jul 2024 10:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113840; x=1720718640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qd0Z+TzoGuFE1UpjnOMV6kYTwv4UPS1xus6pH0CzaYg=;
        b=hCYyEp/g/Z+HkR84dVwTq84uAhR8lTnLvF+Uf21kOstLXpAk5Rg469meIyjlha5NqW
         dlBN3PzJQCdD5JYcVoc53f8J4ygYWHFB4/5PEqINkxaCXdKg8jU3zwtIHhEBp6/gCmk6
         3AHxm3aaAFfQBpJfHzNQATIK3WDnrKzckCbILaEg4YeNOMAm61nwH/GNUmKlSER8vOaj
         oTYJ2Arxk3tryPIdxROw2beV9Yirx1a8OuDYITwYD1e8wMyaiilxCsPADK8HNMYuWe2U
         r7SkiJo792gDAONmxftn8ENUbYyIxFr8Cnpf31MpzVV9x296AFN6e7KDx7kBfPI4Aztr
         ypkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113840; x=1720718640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qd0Z+TzoGuFE1UpjnOMV6kYTwv4UPS1xus6pH0CzaYg=;
        b=ASVEh+Ys2TmccTnBCF6lgUJZZjuxreWYATlR0ZABVMBtHpY+UpzeymXOPF7eY2+VJJ
         i73m8awQZUZKzrmepxR4vmuHEqhHW74ExNk76ySZjuuJ+dn1klq+O+tbkzumsqO0Anfm
         A9bJzF/9mcxzTC4X4lvLRSG0fElLiPZ6lehcV/PJ56ILb/3gEnnXK9WDIA5Y8GGm/+I5
         M8+fqxF7X1xJcdVg2Anbev02I72NozgoMoRu5dx9TDAEErL01/rkJJ4rBqvvu8Vuc/9l
         K4Oz9lFVwKHbi/Xs7NfRhNqhMhk9AgxgiSffCMR5sNJd/JQ2JckbdrZuOX50bADbqj1v
         P8vw==
X-Forwarded-Encrypted: i=1; AJvYcCUVRkU8Btz4Q30ChIHhIKGFjU7LOXD6DH+QYAsdG8qPiPnj890z+y5G5flZM1s9thmv1lgBzfnOPkT6+5na6j0lzfxNyPCtHB+APaj8NBqPo5QrPz2Uh0bxE3gtjrQY78RbQgPVifO4BKhWl2FT
X-Gm-Message-State: AOJu0YxG+70kP3J377LR5c0uhaDbdREx9Ys6UWAwmGnBRIyGjGmD7YQa
	BQQgrmdeT+3hvQS365ghyxB3rx2XpER5939HkG8LPE/fTz6H37cK
X-Google-Smtp-Source: AGHT+IGYWITQkdRhz4qv8j9cI3alOIpaga9mU5l0rkDSHKoFzkIRNkCv3e6d3tLaPXkedXobbHSgCg==
X-Received: by 2002:a7b:cc90:0:b0:425:6510:d8ec with SMTP id 5b1f17b1804b1-4264a3dc1f4mr17296225e9.23.1720113839773;
        Thu, 04 Jul 2024 10:23:59 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:59 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:29 +0200
Subject: [PATCH v2 19/24] mfd: tps65910: Constify struct regmap_irq_chip
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-19-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=1513;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=1DZ6ZNTYVH+qxDLzyvoRZYeRzU6/uB98HyF0NhspnHM=;
 b=dPK+o8VSAHe74YFtYLhnBDMc4W755tD/h2MKv55jyOcgXfOx3RXMh2qTQTj258fzb6Genb0cq
 ujDkD/Nm7osDku+mrsg06AsIyvM2N44JYz8j9yIOK+zo4qzqPunMjZP
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`tps65910_irq_chip` and `tps65911_irq_chip` are not modified and can be
declared as const to move their data to a read-only section.

The pointer used to reference those structs has also been converted to
const.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/tps65910.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 8fb0384d5a8e..6a7b7a697fb7 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -197,7 +197,7 @@ static const struct regmap_irq tps65910_irqs[] = {
 	},
 };
 
-static struct regmap_irq_chip tps65911_irq_chip = {
+static const struct regmap_irq_chip tps65911_irq_chip = {
 	.name = "tps65910",
 	.irqs = tps65911_irqs,
 	.num_irqs = ARRAY_SIZE(tps65911_irqs),
@@ -208,7 +208,7 @@ static struct regmap_irq_chip tps65911_irq_chip = {
 	.ack_base = TPS65910_INT_STS,
 };
 
-static struct regmap_irq_chip tps65910_irq_chip = {
+static const struct regmap_irq_chip tps65910_irq_chip = {
 	.name = "tps65910",
 	.irqs = tps65910_irqs,
 	.num_irqs = ARRAY_SIZE(tps65910_irqs),
@@ -223,7 +223,7 @@ static int tps65910_irq_init(struct tps65910 *tps65910, int irq,
 		    struct tps65910_platform_data *pdata)
 {
 	int ret;
-	static struct regmap_irq_chip *tps6591x_irqs_chip;
+	static const struct regmap_irq_chip *tps6591x_irqs_chip;
 
 	if (!irq) {
 		dev_warn(tps65910->dev, "No interrupt support, no core IRQ\n");

-- 
2.40.1


