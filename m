Return-Path: <linux-omap+bounces-1721-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71137927C18
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A22D91C208A5
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47638144D35;
	Thu,  4 Jul 2024 17:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhuzVkDh"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F256E482EF;
	Thu,  4 Jul 2024 17:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113842; cv=none; b=uZ8rQHyw+57b1OECl6HmJi0bzMg4LeDedxmfgLo/V5bnT2hNIBYMGhKzwSFH3nuPhC9Wv1RVW1JfjRKY7kA9DdJm0v4cMHN3guzl12w9GSAkK6ltfZyqdVriHbQDEWeOf62iPe9tAdXzHUmAm0mPht5FZvvWc4iRJmXD0Kj5PwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113842; c=relaxed/simple;
	bh=l+Er6evvde/rWSFaUokuQlFg/GXNk47TTlB13TZUEts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NwHSeJE4PPUiRc+m6ufyKDshnAF7YFOHuQsA2ez+ZvFLyafynYOKp9hTg0+yiMCgX911QTcL2C6yVAM/lLDKfKrB4jGB6rl6fj8ZZnOnvlVs+bpjK1Fpi/kRrpdLIbSo4lsSfcMy/58onJTC9waAkHzos8cd+Ky0U0CEaSc9ojY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhuzVkDh; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ee794ec046so9410991fa.2;
        Thu, 04 Jul 2024 10:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113838; x=1720718638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFEzSQ1m8GOHWdp6McPosgOTS/y1yxZo30lauWYmu3Y=;
        b=VhuzVkDhMOoqwRUjlnqcZ2LNyJyVwi9Vx6BYl/QLBDZHpQF5fraDmJ60r9L/7nJfGJ
         pwwT4jC5IhCX+c4N1Rv+MQzclKZIzad5W0GYOPJEX72bXRFV4SeUL7HXm3w0m8NPEdcP
         xFfNMbzbRdLE8bkLjL6vlvg3clkT4hq70PLY4gCIxUIgnCoOvDNOVJNBoV6AoRI0d/ex
         mq0eW/AXJ07zYz2NpnE52NmEZ7yQIp5lVYPEfAss3s/giNluKvAMdtGNlXka9+hc287a
         tO/p8uZaCQmPupU2puSDWLl8Uu3e8n9EHOEpjrnzSJUeCDGsuIovhQVH15AJZxQRYwS5
         7/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113838; x=1720718638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFEzSQ1m8GOHWdp6McPosgOTS/y1yxZo30lauWYmu3Y=;
        b=dFqCnnRW66ybI8EFpwz3KJPczCFoAhoP2wTAO1OYuRD+otlZdII/4gyXIvp0BTG7yK
         1XtX6jWbn1zlWP4sTtnzfUwtTP62TTb9498VnDy3AjN7Y9cG0gEibqdA7hQCRlpJsuQo
         4bhs3hOUz4OJKI5cH7o5cvH99I2pNl+UP40vb8JT93H6XNo8YsDRtsPqpVgxBmhj16S9
         UUePm9aE3en2Y/neDG9qvBz/bPNTv+8kAqNrStaZjl34gaHgrl7AZNXAVXvezZoSUcwI
         rnoRi+m16eARV0+hPsQcCQOOF5doCKbFRt8+uWY3lxF4ji5fbzLBy+Os+TjgFDJdJjeh
         TPow==
X-Forwarded-Encrypted: i=1; AJvYcCWzGsMnd0F31m/ToY/yqGQmBD0OF6YmaSCYSHlFlSG3xRB1WcBzL9iQWodmma2YtLDA6zhYqyiUNtwlc08UZmwTNMaCreoWdSmA1Ved8mFw3Hz1cZy/jtDrucoXrWcKVH+uIKPpjEopsO58nF1b
X-Gm-Message-State: AOJu0YyALKcUKnX8ArW945T6svtoOZCkLFNm0JHuvvmuFN1sGmW7NIfe
	CFpc04w8CUkPBnhEfMlalY8bI608LH/nd8tqsslm3DF/Zze8FmAu
X-Google-Smtp-Source: AGHT+IEi4A1FtaFdz12zIHvNWSEctZX7fNHrhjR6JqhPRCZIKCsxlbu+g4wGlHJlz0dlfvXy+GNHbw==
X-Received: by 2002:a2e:2285:0:b0:2ec:3fb8:6a91 with SMTP id 38308e7fff4ca-2ee8ed8bd6dmr15779241fa.19.1720113838114;
        Thu, 04 Jul 2024 10:23:58 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:57 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:28 +0200
Subject: [PATCH v2 18/24] mfd: tps65219: Constify read-only regmap structs
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-18-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=1399;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=l+Er6evvde/rWSFaUokuQlFg/GXNk47TTlB13TZUEts=;
 b=IB/UfVZPpJfxWBNjRq1HOL9KSAcIs7j71u1a0Eg+t5siatf02eWNOBO2ZelZtfySyA7nHVm0n
 xHWqVW50PWxARF6sB/K+ga4ov49Gw3AWaMJTC6Rq++jWZ2G7kfS0zez
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`tps65219_irqs` and `tps65219_irq_chip` are not modified and can
be declared as const to move their data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/tps65219.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
index 0e0c42e4fdfc..57ff5cb294a6 100644
--- a/drivers/mfd/tps65219.c
+++ b/drivers/mfd/tps65219.c
@@ -159,7 +159,7 @@ static struct regmap_irq_sub_irq_map tps65219_sub_irq_offsets[] = {
 #define TPS65219_REGMAP_IRQ_REG(int_name, register_position) \
 	REGMAP_IRQ_REG(int_name, register_position, int_name##_MASK)
 
-static struct regmap_irq tps65219_irqs[] = {
+static const struct regmap_irq tps65219_irqs[] = {
 	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_LDO3_SCG, TPS65219_REG_INT_LDO_3_4_POS),
 	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_LDO3_OC, TPS65219_REG_INT_LDO_3_4_POS),
 	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_LDO3_UV, TPS65219_REG_INT_LDO_3_4_POS),
@@ -211,7 +211,7 @@ static struct regmap_irq tps65219_irqs[] = {
 	TPS65219_REGMAP_IRQ_REG(TPS65219_INT_PB_RISING_EDGE_DETECT, TPS65219_REG_INT_PB_POS),
 };
 
-static struct regmap_irq_chip tps65219_irq_chip = {
+static const struct regmap_irq_chip tps65219_irq_chip = {
 	.name = "tps65219_irq",
 	.main_status = TPS65219_REG_INT_SOURCE,
 	.num_main_regs = 1,

-- 
2.40.1


