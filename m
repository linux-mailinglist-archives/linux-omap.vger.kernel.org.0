Return-Path: <linux-omap+bounces-1706-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF00927BEB
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF738B21C2B
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F9073445;
	Thu,  4 Jul 2024 17:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDh8j8fB"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C5B50A63;
	Thu,  4 Jul 2024 17:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113816; cv=none; b=IYr6B5A5eN/butbZ6zdHJ029fF4+KrFDraceKgfrfPGOyLVfSSg7qN+mbgAeQExPEDfTLOxK7PpqfYFvoD6U1x/wWC/OGXFf/e0jVXvSqeYvZk0qHVHeXWBbVKIBXOId3J86I3dmqPddLHAHAowv7gDimLMPzy5k5LF61Q7NeZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113816; c=relaxed/simple;
	bh=enRHrVnnv2v5OSTzZ1elKgS5KbJVuE9GP9SdZn7OqTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CxHcJlgn3fn8ukEwqmF3ePS8el9+rs+iU2iqYvCS5ZEREqnUV270co5PWIFHZaEOANJnpPQGQ/tzfMSucL4evDokSrDpKTGAmVql70luj+kMSgB345ICAZl5nJHHMIv6bAXc5XjxMpZLZxZZTo6+NJtM8H51fCp8iKCVibFZ7Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDh8j8fB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42561c16ffeso6041975e9.3;
        Thu, 04 Jul 2024 10:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113814; x=1720718614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOF3cIT6fgv4yx2bUJ2liLgQLjKC8cJY9QXkjtPW8ps=;
        b=UDh8j8fBYIsrBLymWfa7ho8e6IU2m4wr37XsyKvIwLCQWZI1ADCb1ExVZ0pFCMt77+
         dCk82hwvKQf+FAbpHl5cdMtuvdc856/pIbkkM7bJ4qmj+p1FUUQkHyrGXo/TC5OCTaVj
         KNofqqHbOhcpdrJPQh1omYhEfC2dvO27U/cJiFg0jzd85pwwfx+4hIlo4eF5ydtum6HZ
         qGes18XhmvhywoY7DSAN9fDuztx30p7KCoTEAHjuJW44+gGojnmErv3Qf4OcOvnYz/0h
         AvEB3iDFRaVJlra9ywQIe9BVvuGd52zZiK7gyiJPrOa3k/Obf9zum9rqS1gCy7lLZCcv
         tdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113814; x=1720718614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOF3cIT6fgv4yx2bUJ2liLgQLjKC8cJY9QXkjtPW8ps=;
        b=ZMFhemk4Jj7BVo8K6N6BdLrnUihUypn6eCURaqGwkUCat22kN75rT+lS8fo8vibqgJ
         YOH3yQ3wh8HARLuI1jwLk9lufGiCqmdbFafk6yobIoKrkAESlYRc8t2kCKFS4ca1+sOW
         pU3gmf2qU28UIMLw0uUqzayi5rv10wckdmvjQXy5YFkOhYGpCIxjvOSLj4pfHHvWQWIp
         OhxZ7IPrnaDkDkzouIPQqWAdV6y9v2BhY/zBFngy6TMyUIpYPTXafvzbMkKwYmC/TcJN
         pQNK8krtr5WI8vIsXNnN4r8EpPuj54Qx4zOLZU1NhqOHRy1A/KTswfSItPEIq1kOTYCL
         9VIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsOoYXse5qoKwGFvVoALAab8ETOv//slFWnPWUyUw0B0/GIEti//7DJ7xLp3pNfy3v/+ZCTH/pq21Im7mmmb7dIbm4Bdmy274nrNcu/GKzFqRPlnClUtCx1eCRNlG9wnNwfCc3rPLxCdTK2XEI
X-Gm-Message-State: AOJu0Yx+1xNcZ27AdB3VS9BwRcgi3AfX7jA0OOEM86XRcWBJNuDpUqPw
	nzp6+ZEurWLjfORerir3D+DQ5e60ADo2c/PqkpE+bqIN9ueUPSjh
X-Google-Smtp-Source: AGHT+IEzmw9A3yXumyKWrsaNIzb4agNGIY00q8pnHYSGhbLatIjosLNG1uUTfjJdA7RFzFVtK3VgoQ==
X-Received: by 2002:a05:600c:15cb:b0:424:76db:3583 with SMTP id 5b1f17b1804b1-4264a443effmr17152435e9.30.1720113813556;
        Thu, 04 Jul 2024 10:23:33 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:33 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:14 +0200
Subject: [PATCH v2 04/24] mfd: wcd934x: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-4-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=720;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=enRHrVnnv2v5OSTzZ1elKgS5KbJVuE9GP9SdZn7OqTU=;
 b=XIuP2+gdHvMBFVSbsXzw9ZBaF5PZZ0AWBvuCSWS4O7NfRXJH8MPcNIFnqzOfbfwY7WQzekGMm
 g0dgwbrDJImBvXSMHFQ7UyuIKLxA+ojrdsWiEfNRUJnmSk+DCbit6Bp
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`wcd934x_regmap_config` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/wcd934x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
index 7b9873b72c37..fcd182d51981 100644
--- a/drivers/mfd/wcd934x.c
+++ b/drivers/mfd/wcd934x.c
@@ -109,7 +109,7 @@ static const struct regmap_range_cfg wcd934x_ranges[] = {
 	},
 };
 
-static struct regmap_config wcd934x_regmap_config = {
+static const struct regmap_config wcd934x_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 8,
 	.cache_type = REGCACHE_MAPLE,

-- 
2.40.1


