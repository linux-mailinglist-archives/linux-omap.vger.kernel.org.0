Return-Path: <linux-omap+bounces-1716-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 543D0927C0A
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F14A81F222AD
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC5C143C46;
	Thu,  4 Jul 2024 17:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTOujzFr"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB46A143862;
	Thu,  4 Jul 2024 17:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113834; cv=none; b=o59pte1qVVSVm1qoapWWSE/SQ7JaXH0+B/f3KVkxJ+NrnuOnoNB/Zh28xK+6B2yyGK8l0EfFRYBVUZYyi1to4+H0d7UjElFk+PJPU0TAd34Y5rAG9DLWu68xIQtJiBTo7M5frtvU+QJuH6fT5qy39WqV1si9OUZ85eMiZaPzAS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113834; c=relaxed/simple;
	bh=OsP9B5yntvy5o00C9iqf+d4I7ESMIoxwrR+dXi849M8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BRr7I5Swn+ACZNmYvMT7mY0z4XV1JIIQfW24NM3He3XXk2Ni9Ky88Svbzd2NF66gOVjtL3S0WtOjV6uuzuslLdQ41rA8BUOKBBw6RyTc/Rqlws6RBdZpx/6h4auQrn01uTukZPctmbXOP/YPqJEC6Uo4aAtRia6gnmIvzwlqaf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTOujzFr; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ed5ac077f5so12325481fa.1;
        Thu, 04 Jul 2024 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113831; x=1720718631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDX99PHFeeA7rra4ax1diB6wMDKVJk8jhzB3Yt4YbLA=;
        b=nTOujzFrSezqoXgrtbs0MCl2SiIhJg2DrmE7rrajQY5gRMByfEV/SkKqZKaDiUyY/0
         h1gzoO0VTGhQmy62KurqfJKQfDbfBcNwAEGqm6m/KBZ8wy6M+bUw49G+DDz2qj62bxcm
         Nx6Wbw7Y4CCVNbqWvx6+hBz8YyQn/eKgfycundF8PN57WBL4XAINwlVVyu2NfcBU2gRa
         WwoR6j/lZt5fVNql1Cyl2zQDU1y893m6GAbPoN2psAqyOFT8FLv+CtO1RRwc6g/fTIgL
         Nwk86ZPIxXPuofOlOhyEj2hmwEG/HuzX1WcASDr5GnkDqdGwpD4FQE/sOGMTaHDOgoMt
         wULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113831; x=1720718631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDX99PHFeeA7rra4ax1diB6wMDKVJk8jhzB3Yt4YbLA=;
        b=S4rx7grHpZm4jdrYOcVOveEmG/zQ5usNcXz0s5/FiCgccEhbNMzh74qv8tBUaB2jcL
         rNTgXbUvtucxe1LaP6WsOJZrkXVsDiud05u/hl2CiTi8lLr0uUXx2KIqorLAABWCIn7K
         IMBL/nqlhYby1v22JBMm7CPsd97aK1ntNNNzLbYUDOB6ovYl38cHZ4RQKDqRQuidgQzo
         9RKnh9hxqk3fhjmUetpwatKqEscm8siWej/YsX+p8CfMi/w8hpFh207IeVNgsUbHi5ep
         nBOwKsJUg4dV+DnPIxGANya/UV2JgRdlAXixc0p5B2Wnkvo6cXp16QX6xn3BAECA21wp
         QwUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxBTrFmJvIPeKrToPT7FYxGIAGw2x62dmjYI4taCqyOEu7UyzjpDuvXwtwDvOzU1Uv09rZrz8UOd/weiiAxNvOKOH8vVUFOCH2NgyVADLdU7InXfwBV16d8NexI6G+VzlfDLP1p3Dc38xmhZH8
X-Gm-Message-State: AOJu0Yzg3S6hzqxIlfuomHqugF0muzAhYmZK/6dmtmQSI5IiYkQlyGlh
	WvnXbvEX8hFn+5aBLcObBYpS+POkdk6G4Cc9ENZMClF6bBGDkwTd
X-Google-Smtp-Source: AGHT+IGDGHdH17TOfyl0AHtan3E3NGyjY4qK7qOF10+VJxCWKYz0/N0xnRTryy8auCQrIvDBTXtfNg==
X-Received: by 2002:a2e:8197:0:b0:2ee:8d07:3d51 with SMTP id 38308e7fff4ca-2ee8ee14ebemr13988791fa.49.1720113831148;
        Thu, 04 Jul 2024 10:23:51 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:50 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:24 +0200
Subject: [PATCH v2 14/24] mfd: rohm-bd718x7: Constify struct
 regmap_irq_chip
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-14-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=811;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=OsP9B5yntvy5o00C9iqf+d4I7ESMIoxwrR+dXi849M8=;
 b=mLqu5gnq17+Gs9kyUk2dMV6SUWx1s74/GSw3goKe52OxLCSMhnjCXIIQ5PFkb5Bd7wTcal4Qx
 gh79QNEK8H4DCYsaff4hWqDMWmvsuEIF6+riEhYKIsTEe+50wcbPUVj
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`bd718xx_irq_chip` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/rohm-bd718x7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
index 7755a4c073bf..25e494a93d48 100644
--- a/drivers/mfd/rohm-bd718x7.c
+++ b/drivers/mfd/rohm-bd718x7.c
@@ -60,7 +60,7 @@ static const struct regmap_irq bd718xx_irqs[] = {
 	REGMAP_IRQ_REG(BD718XX_INT_STBY_REQ, 0, BD718XX_INT_STBY_REQ_MASK),
 };
 
-static struct regmap_irq_chip bd718xx_irq_chip = {
+static const struct regmap_irq_chip bd718xx_irq_chip = {
 	.name = "bd718xx-irq",
 	.irqs = bd718xx_irqs,
 	.num_irqs = ARRAY_SIZE(bd718xx_irqs),

-- 
2.40.1


