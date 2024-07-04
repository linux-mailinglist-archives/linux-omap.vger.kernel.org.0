Return-Path: <linux-omap+bounces-1707-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE3C927BEE
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B0B8286FA2
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC22E12E1C1;
	Thu,  4 Jul 2024 17:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFwQMUKw"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8E34E1CA;
	Thu,  4 Jul 2024 17:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113818; cv=none; b=kUPrTWrmFYUPd3kDFgxQJag5TE4XVRbfQSYqJzh6Cl2OUnYc6Qai8clcWJl9Kj792aHbrBzToshTpCKiOWFiTVevUj1deIeCdPR2mwT1dLN9uTrs0G6J8yr1HwtOKNUfZ5z7HO9DFmbpa56vQI5wEm8XsOWax75VJlaJBRi0mmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113818; c=relaxed/simple;
	bh=A8h6qBLOlBAO4Nf5Z1u5nWAte8uqhP5kHvTzaAaJZ+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AAjF9BhZAokWlj1jw3ecQvjLFiAD2TztgZqtUC2qSc484D75PGrmTpSIl/CBL3lz5LBLTK4b6yNU7NQolwwvM8yMjbpxQcEYdHxMo74YXXkh0NmGdFFskWRg1+1RzyM0cFO5+2dnmDpZHrRYujfB/UbEcUsM7RABl4eywZ39j2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFwQMUKw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-425680b1d3aso5676905e9.2;
        Thu, 04 Jul 2024 10:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113815; x=1720718615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DvuUcSFwNO6KhZ/DbrjWlR0SnoFpdvXYRD32tmG/+Y=;
        b=cFwQMUKwnsLFBFAiLa84CHpYywuWSeRUMJwUWKej5evRCmPK4+Hq2ZQKVWbL5CQEZg
         JeeTfEqz4XDxWmcrI5AW1BeRGLi83ZaRT7aUxtZ3hi8x4UZGTtEZ4u0q+RYbhmCO7dBN
         rhETptTIKK6pM+04yvRSk7HfPO6ddI1Ntp4zbzbsiS+pdly8YaOSzpiSIFKhoeeTjnmo
         mYDKYollne7pteqELzAKLLlwq44ZQamL7Z7uz81F/o+f10xN02cG8Y8nrhBZBtKXHYuF
         r6siOvKCXOswiz8d/RPE/fMHi0tCD9rGkFI3pqyp4n0s2m3s2eA3LFlguWuMPVWNoFfa
         myLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113815; x=1720718615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DvuUcSFwNO6KhZ/DbrjWlR0SnoFpdvXYRD32tmG/+Y=;
        b=fBM5AS0iJA1gnL+bt7VN0/DqdC8LFCbSmQszVzxjO0OXXozsSnJJvQm50NKDcJhE7Y
         lEHa6dTCNForvMkre5xJvevBsGpyBb4/dK3EamAmwD8Uy1BXzTRCHOH4vZcVRUejZIqX
         16YErptJAv6yiUc/Lzuo2MLEoLzaxgCjPTGyLaC7fxchKdkhiXwC+8ONOwL1qS4zGRXH
         FiOZC88AY0HPrciYBPM1LYP4WxSHom/y8308kjG4nhVaPUa0PdeUgFgr/ny0Xl1z2WVF
         v5jwLpcXbgP/6QbsA+BH5gRGDcDL5GuVV9kDUDkRv5qCvwNBNACDkMdp9PBz87MyzPaO
         UlFw==
X-Forwarded-Encrypted: i=1; AJvYcCUtBrRHNMY+kZz9E72J4Smj4VquSSrKFtT51sqZyoT8Y9Ajt2SSERLkIq7hwNBTim8sNsZwB3kfiPXnlwOFVYg1PYdRJvRd0p09w5I7TkLngdRHW21ssvJpie7L8letiDMCHZ8OX8WWsFfwZrjd
X-Gm-Message-State: AOJu0YyAz0fRanjI+rXglDMCww8WWEPDrsoKIxM+f/01lCKpMlx6ruFB
	jPDNkx0sfk3SAOc+qn2IDOgPWPmqthpS8U/aFDrNK1w1lXyCT6xK
X-Google-Smtp-Source: AGHT+IEc8Rc1QEIwVEXfc7Rpogc9rQkSUkCFNEJZBG+Iw/peGXh8S4XAZEgN4bTVwF0KQdZg/ByJHA==
X-Received: by 2002:a05:600c:3b8c:b0:425:d61c:77b1 with SMTP id 5b1f17b1804b1-4264a469699mr16561885e9.35.1720113815196;
        Thu, 04 Jul 2024 10:23:35 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:34 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:15 +0200
Subject: [PATCH v2 05/24] mfd: tps6105x: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-5-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=722;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=A8h6qBLOlBAO4Nf5Z1u5nWAte8uqhP5kHvTzaAaJZ+g=;
 b=ZiS7T6T4IQrp0Q5cFzDm9V7HK3fd//OdoA4bcGAGfdiPsK9NjQwbEsdd/FBGaaLb32Comgql0
 LQcTPmwFMOLA4zRWYd/7xWC357cvLXcrja6ylouWSP+uIMonhxpIKWF
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`tps6105x_regmap_config` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/tps6105x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps6105x.c b/drivers/mfd/tps6105x.c
index 0da1cecb5af6..e2f6858d101e 100644
--- a/drivers/mfd/tps6105x.c
+++ b/drivers/mfd/tps6105x.c
@@ -23,7 +23,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps6105x.h>
 
-static struct regmap_config tps6105x_regmap_config = {
+static const struct regmap_config tps6105x_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = TPS6105X_REG_3,

-- 
2.40.1


