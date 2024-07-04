Return-Path: <linux-omap+bounces-1718-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCCF927C10
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 356521F22A82
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A6C1442EA;
	Thu,  4 Jul 2024 17:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3MHY/hT"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D7B1442E8;
	Thu,  4 Jul 2024 17:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113838; cv=none; b=l/GXqljMaNUKDZNej1+y9EOfBACncZK3+q/vJwX1JmHiRtPBLSgpgc2ouK5HaVy1fNPPiriVd8M6/kxZl/iEY6qm3tl4fmKywMTn4YOQXHM3sYR49FqCbmWmzzhW/fGpJrxqtn9RXnAm7+ZnhZX0KlsTvqRY0dXl/brRPVautsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113838; c=relaxed/simple;
	bh=1m/pxOteRlGgMNCyaHexY3JgCLjPsEUnIURObz8tXYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvGL36WAHh0wi22KY/76vvhocJqKFgekIL2Lq2OU7QQtfuKbhZIjB/EnGKLZzb3FcrRX8Jr0/wFZiWhwDwKEthXO/Lt/WUQohxg7ynFkg/1KB+QSXUUis1aRVkTfzUd7XM/s1CtCQ6HPfef+hO/vxt6rCJk0+63EUqHr/pYdnC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3MHY/hT; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ee90f56e02so5202021fa.2;
        Thu, 04 Jul 2024 10:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113835; x=1720718635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgu8mPTxD6LTopVNnBQAINmTzhDmwR9bV7xd7+3+F9Y=;
        b=b3MHY/hTMviAVwhynIsQvjv1nIA8uQtp7FgL5gt0fQyAnmmQkM9Qx5PKo756C2ikcY
         H7exGCfOHY618m6quUDqVR4EodTBBQyrzAI/s4eP6j2r7p37Bd/rQSJv5lRr8gFkI0Ui
         TRrMDgSg2a874/yuXyKjqtYbebe8Rd/lPlxJJbYFJHIpfj9dJFDz2K7oEDD8dyYECuA/
         rYTVJD6AeI9SqYVgWZGUIAKoC4CWm4Xum+6FlQdMsFlW4tAdDYB2SFtfZkJt4cmWY6c3
         iEi8eXzReQbwsSfpjKLJZsrIIWoXjXalYR0mlXk9GgyumJlcVPklqjAiyWaxfbatHdY4
         5pBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113835; x=1720718635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgu8mPTxD6LTopVNnBQAINmTzhDmwR9bV7xd7+3+F9Y=;
        b=P1wdr2CVPz452i9ApP1lQOfqoQSn1yrddDc5Mnn7NGOcBXmNsGThJI29h73Qc+gOdq
         4oh+18Zp4vQ5QF2DBnthNoDf6VYPLl5teXBMK3Tk8inbVxEUew7rRdlDlHxcCD7FpeeB
         aP66XmTDrkMFeHufZmr/rxckxk8ML0PEE79n08EwHjH+R9CI16fRqPixhppnh0LzRsCt
         UvqEA2CgA/DIPnRidJdhSP3XiMlwBZ+Eh1M7EQgov7MI+RXsx9vKLnyfgQmsDDPc3SuJ
         029MGi6K4+b39w7seyC8/HORQEhJMaLCW5B10T9P1YqSmwmQT3+nELcgghw4nfvjIRw2
         x6fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMDG2pCW/VT6n0RwAC3Z1GWutCPzeBjJ9sJlQ6Cj1msT85RIhupIzZZJQmEigbOZoeuFuTCJaHUHw+OZsN14WgAnFdAWNcCNw325MrR2Y5vWeswTXFy8i2XcSehlHeJM8TFT+gM4rojgzitdbU
X-Gm-Message-State: AOJu0YxKakwuJX6tRLkAiqYEqT4mBiRzTwyiMb5ELznFSI/mTJrE5bRn
	GXLSA6iv9cvpTHr20GwiG45Evat6zIrcUous353ihy8EikLq1ka7
X-Google-Smtp-Source: AGHT+IGTTDUX5xEcXehpK5p7DL1hZ7A+1Za2oYq7PQX8dR6i9vB1itup3bf4lD+UiyWYmRXXB4CwXQ==
X-Received: by 2002:a2e:8455:0:b0:2ec:1cf1:b74c with SMTP id 38308e7fff4ca-2ee8edffccdmr15048801fa.32.1720113834597;
        Thu, 04 Jul 2024 10:23:54 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:54 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:26 +0200
Subject: [PATCH v2 16/24] mfd: tps65090: Constify struct regmap_irq_chip
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-16-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=731;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=1m/pxOteRlGgMNCyaHexY3JgCLjPsEUnIURObz8tXYU=;
 b=6ZjF4CCDond7ROCsSHValBcFRwhWsXcos339NS2RkS8I9EiCixqiHyaPBI0Ln/RAHlHfcBeG5
 v+XNd5JP/0oD7MeDVFDT4TV8qnHm97Yw1kKEqLrkTbM/ycLko33gOVq
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`tps65090_irq_chip` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/tps65090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index b82cd484ac85..24f42175a9b4 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -120,7 +120,7 @@ static const struct regmap_irq tps65090_irqs[] = {
 	},
 };
 
-static struct regmap_irq_chip tps65090_irq_chip = {
+static const struct regmap_irq_chip tps65090_irq_chip = {
 	.name = "tps65090",
 	.irqs = tps65090_irqs,
 	.num_irqs = ARRAY_SIZE(tps65090_irqs),

-- 
2.40.1


