Return-Path: <linux-omap+bounces-1719-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3016927C13
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57D641F22434
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2ADB1448FB;
	Thu,  4 Jul 2024 17:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ssh+Ft80"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA94144316;
	Thu,  4 Jul 2024 17:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113840; cv=none; b=vEYYhteMeSMx8dlZfM9RWz3ZgWjD8pydbH4EkzPR2ZEMyTXyVxL3bx3ihBGo865pGJgcRglExAlFvv8l0lUcYOT67plaU39Wy2o3xEgEL+CjGXLVD6i2+j74h8khpTHsCA89ONX4oc40a2DobtFUNFbM3u4RPExhZwo4ZzRNCm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113840; c=relaxed/simple;
	bh=/w2Mfm3b//ArFJq79ZTzz7Oj9gnwB0vEiff6gNtMX10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OWZIdq7c+8BnQssmPoaISZb0W1Pt8RRa9PuhJidvr/Yn8+a2DTWl8T3hD36LUbsNUx3dy2vW5HLmHoFn4lw8/vzAOmuGDlq9wYXFulTqhdWz6DdoUlZL+ji+7C3Jg2h7hE1aD7vQtCfVq+TEfcXkJ6LXhgLHWzMgGVBezRyJl7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ssh+Ft80; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-424ad991cbbso6131265e9.0;
        Thu, 04 Jul 2024 10:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113836; x=1720718636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXvtbk3eJTlknQfO1g6XBXuGBlY9arYdCdhrUDB15Qk=;
        b=Ssh+Ft80xdP8asmNrJHQyNPyNyz0VsABH6kQB/Fz6o65s6Ku0VUwlYnn5UlRllKhgz
         ioEGafc5Zc5i3XY+7mDG1+9ReT8d092bCQ9zkYXukeAQuoJV+ngaPDD+K23PKdiScg9m
         Zt82FEI6qODGv4zLlZKVKerpERFW0WYJVqspJpZaVyvoOuuBcSEx88FDfpjcmQn69CD3
         bYEbyOBjhNNMksADLIETWENYLS3efQLvh6shkcLReCha6cvIDTnCLVMMZcSvTuLZcxx/
         J3EJFnIMWaTPs6veahV+61A+VrBqd1T6EgArEnixd2r6zaW+b9B/1Y0i1A/1gDZMeLWN
         V6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113836; x=1720718636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXvtbk3eJTlknQfO1g6XBXuGBlY9arYdCdhrUDB15Qk=;
        b=LQzDme47lVVPaaNQfWBBSGYxFXu/wFCWG0LVF6OYUVi4qxgQfexWk8hB9rOTphEClJ
         Zf7hPAc5HQULzg6xMmb9pFdC0XgGJN4zNRkIIfMUUaG95rQxpS9M+rMCGI/37JdU+jK8
         myj0rlKNQ6pdjblsbijR81W5HCK5v1nlDk2HLceH92bua7IIIKRYarIVhE/cXPitZ+7I
         ppsiEuqsZssKWb1knJmv1YIQQzDEnABdOZhotl1g2lttxgk/AHEVXEAGy+Cz9lg8FeWs
         74OmCnz34wS0mjUrbaFfJNJSnPa5SUbYcl0Wu80Q7drXuPA9UoOzoY6JVf5Qh/xWLneE
         Tzig==
X-Forwarded-Encrypted: i=1; AJvYcCW/RcoLFcZwyHFvsW1bf/KRIKZovRQeX3G0qVxjt4yoMQDaBk91vq1rsf41dZrXCRINkXohUnc0NLUMI6uD0P806q5Aq9Dbjb323fvvsUCNosi0slMUeb4YRkWYW0mrpghKfFuujrCi33olmIZ3
X-Gm-Message-State: AOJu0Yy9SOi3ZOasrrWeDVgqHofElYwYQCV05KZUBMdkFDJQDZiLIZCI
	zJe2Wx0Q7D4RSYTWe6c04AcCzc9Einv0JoY20bVy6BpB0C53ipol
X-Google-Smtp-Source: AGHT+IEHdGR7aWDPHC48GX7xnpPP9zkZvU5WdgSCgIsyuE6VBDayBGzZuU+F5S67Yb5hOGQ04hSJvQ==
X-Received: by 2002:a05:600c:4487:b0:425:6a12:bbe6 with SMTP id 5b1f17b1804b1-4264a36e4c2mr18864815e9.0.1720113836422;
        Thu, 04 Jul 2024 10:23:56 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:56 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:27 +0200
Subject: [PATCH v2 17/24] mfd: tps65218: Constify struct regmap_irq_chip
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-17-0c8785b1331d@gmail.com>
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
 bh=/w2Mfm3b//ArFJq79ZTzz7Oj9gnwB0vEiff6gNtMX10=;
 b=OsGThnGbxB6eleQCVQo1EzO1iCBucxxKtKb0NyDYLCLfqfoWtpAvo5rwf5kwibFxTvZ76KrNS
 K6Bi2mbmKBuCws/nTLk7C5CrVqeEQofHOH/f1CcDiRMCWNEk5r5wRjb
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`tps65218_irq_chip` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/tps65218.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65218.c b/drivers/mfd/tps65218.c
index 427a2b97f117..4f3e632f726f 100644
--- a/drivers/mfd/tps65218.c
+++ b/drivers/mfd/tps65218.c
@@ -186,7 +186,7 @@ static const struct regmap_irq tps65218_irqs[] = {
 	},
 };
 
-static struct regmap_irq_chip tps65218_irq_chip = {
+static const struct regmap_irq_chip tps65218_irq_chip = {
 	.name = "tps65218",
 	.irqs = tps65218_irqs,
 	.num_irqs = ARRAY_SIZE(tps65218_irqs),

-- 
2.40.1


