Return-Path: <linux-omap+bounces-1717-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE33F927C0D
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0D021C20B8C
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4479D142E6F;
	Thu,  4 Jul 2024 17:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASZMxVgp"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6626146447;
	Thu,  4 Jul 2024 17:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113835; cv=none; b=Ech3JiwTB8tONmvxEbqD0dbMUi4EzY2IAKqaFlqWcYmW/IX85yTW+3suxKh13Y67hWd0CSXoG+cMasuOr1deU3fJibU7UPttb2cUbpOrLbkGD53b/J9Gu3hNHoBomxR2WSYHjGOdg2sUgaPHDzsve7u47JcbmikxZDcBRiSeLng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113835; c=relaxed/simple;
	bh=LwSmNpQz2F+cwYbYyqp+ffrrtmaCiTXzgTUcnJr7s7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bq0aGgFGUTwar6js1yHkfTQ6Y6plBL0mh5TPSCN1xeoEutO6vpqKIiJ5eHyGE6vlO62EwC1KmjMee9iUuxHCNEtQC4yGWJP0nLsvyJP4f9Hmy39+w0Gup7SleqjR6cjlhlYJJz59TMXxl3+ZDTE752QEulldrojDDNzzDwuD4b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASZMxVgp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so5670505e9.1;
        Thu, 04 Jul 2024 10:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113833; x=1720718633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wr02nhq0ruDtDnhEwyMKYxGviJTN4mPbs3lAEzqdbjQ=;
        b=ASZMxVgpzs32SavbYEaTLBz+JDRNzh91jPql1KPsMQD4CHjKk9tiz9+mKEFagum2Pb
         3H/QO09W0yGatSN+wMU0/Kgfn+o5EPgcbAlamSchhTMb5PNG0EPzY4Law8Denvlu27Wd
         rQnBoSCTVE1xY9uvXZFzXgLR/7OWloAxsm6PcsmBRBIXne7tWDBLQ5S/MXxczmUWzJJB
         Lv3gyKlO+HcZTezZg53g9iruDxY2bF8jdiaNBbgJSXIOOBvewjirI2bUntNRRQU9yfMA
         umuw6sndj+TCc8WiLis/YLoYGkTAvEW8ONZXR9ot6+Fd8roN4pNkaSgRk25VkMGz5RJ4
         g5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113833; x=1720718633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wr02nhq0ruDtDnhEwyMKYxGviJTN4mPbs3lAEzqdbjQ=;
        b=FQ+TEyEjAJjfZvTnNT+W3rqGEWdVPi4bmOnXput7dqbggh2zc14o9dXSn3WFsDVB0p
         UlMU09p+sEed74x2gbqB7YYXpNU26wVyV2wdv8Hg6Fi5p1c5YXdOA3JAzSVybbwol3HA
         xMcKlfFvEgw+0ss9BjZQt6RQfFqrikR84tCuUezeEjDflkHvPW7lxZHS8c/l9g3+hYgb
         /IGVuwf4sOkouSrb4FE7/PUDfIyuABiguScinqA6RmLxhwI3nz6VYJyCRW0aavRvwXXX
         WojqadpZ6XPHgL5n0iU/prHkQ4VKCDbkNQo346EPrSyzIolslbjVzIplPyDKQFf/C6ub
         6Iig==
X-Forwarded-Encrypted: i=1; AJvYcCXcLGjEIweZzeK6ab/47g6uvvyc6IFR0mbqLqppCDw64GaLt7rePEmoIWCybCS4Mpg+hJYY7TTIvhe8jN5EQXXPtcbRDSadGMPhuVh4q5ZGcOI8ZexgRsHCYM1+mwGMRs/tQjET47XAp38OhR5r
X-Gm-Message-State: AOJu0YwVbvLTzcoGmW0L3WIjZjAUHNZEYnFNe5tvqRNOKDamtsLBT0XE
	WRyoPeaDrc9awO7AYEXjyn7fG7DkQWqIKy8u4/D87iZfdVXFl0Uq
X-Google-Smtp-Source: AGHT+IFaOHK66rTgpsI1mVY32hRGS0C436uv1mOtnFsmLU7vwSfmFKSY7u4YyT4jP3ZsAP4H3kcIsw==
X-Received: by 2002:a05:600c:54e6:b0:424:ac5a:fc38 with SMTP id 5b1f17b1804b1-4264b161646mr22944445e9.13.1720113832924;
        Thu, 04 Jul 2024 10:23:52 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:52 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:25 +0200
Subject: [PATCH v2 15/24] mfd: tps65086: Constify struct regmap_irq_chip
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-15-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=789;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=LwSmNpQz2F+cwYbYyqp+ffrrtmaCiTXzgTUcnJr7s7Y=;
 b=Ga7N1b/SpgEIyEu0aZQV3PU+tllasHbqTeEu2H48IX0j1TQxkzLPgurg30X0upgDQ5eR08P5N
 ndiG9G14SvzCP0egigQTIaPWc+bbDfiV5mbUyq8hTRPcjthD8A/R82J
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`tps65086_irq_chip` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/tps65086.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65086.c b/drivers/mfd/tps65086.c
index 5ef0a7e0d61d..54832e9321b9 100644
--- a/drivers/mfd/tps65086.c
+++ b/drivers/mfd/tps65086.c
@@ -45,7 +45,7 @@ static const struct regmap_irq tps65086_irqs[] = {
 	REGMAP_IRQ_REG(TPS65086_IRQ_FAULT, 0, TPS65086_IRQ_FAULT_MASK),
 };
 
-static struct regmap_irq_chip tps65086_irq_chip = {
+static const struct regmap_irq_chip tps65086_irq_chip = {
 	.name = "tps65086",
 	.status_base = TPS65086_IRQ,
 	.mask_base = TPS65086_IRQ_MASK,

-- 
2.40.1


