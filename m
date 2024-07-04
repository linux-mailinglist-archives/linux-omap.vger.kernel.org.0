Return-Path: <linux-omap+bounces-1714-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B83927C04
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF69C1C2168D
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5018A142E8F;
	Thu,  4 Jul 2024 17:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNaQtLXt"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F1F13E8A5;
	Thu,  4 Jul 2024 17:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113831; cv=none; b=GV+rS8YHOLavtDyjPmkJ0WsGQEktqxyJ+AG2+8BnBFwlbRAPiCqtdC+w6gVq7BPTZBfHT8JHKNJLewwkx2Oioe1FwGz14nkS53HD+pjnLrfAbHa2VjaYPukaHBm0ISnMuPtRhrOI5rEHpJXaB1GnJSCg8SdRkgrXgumwpQxTdl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113831; c=relaxed/simple;
	bh=6atl/DrZQUwmw6JNwTSf7L3f3VWfEvhmC/OA+w6bvAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZ0T9bnkCAKSUyOH+k7h+puf0cseNfH2PYoyzSZDNvZOuxcsyGuZHoWDRe9Cg1QAaYvh6JlYbpH/KAXfaKTrIqlZvpDTTjLETjkUGDjQ/IjLy92D6Y3+PwyklCxEQ4Cn09UX2O1G9B5QTdohGXPlplwEm1eM1BQ5B1KsKRsiIKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNaQtLXt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4257a390a4eso5798115e9.0;
        Thu, 04 Jul 2024 10:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113828; x=1720718628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7zE6lHigua1P8ymODDtiJ+ZtxaVQFbo+ktZc42qUis=;
        b=CNaQtLXtLuiB83r8FNN45OScT4UVX2hn57VtDjLRUBb/4IGBPkGZ3nIwXiJ8NqkBX1
         7sRLxaLaZwiU7NDLvEJLH6t3FDDBi5myl2b+p2INof4qllnjvpQ5Obr79YJmk6Jf4Jpi
         JjucBUzawwxAc+scTgfUMrwCuNHSV4UGKMD2QAOumhn8/xObNcgoJsHiXlfVbfaurNtR
         BSnvBxaawyWvTazmTWyQhIpPiyW6teeuLbmswlyKICt/sjQRRotagvSdy63OxNA/LeuY
         5MwJExLVFxn5a2XAbz/zlML9cZIviBiqZI0JAq9IVItZ8IfojWv4k1i+4DfDYrwAuQWZ
         bOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113828; x=1720718628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7zE6lHigua1P8ymODDtiJ+ZtxaVQFbo+ktZc42qUis=;
        b=MYewIvq0p1cqfZJmoq1rWe2VgquOQUodiuQypuw+RaLdzBRpFNTc8UQG1OSXq6UTKH
         vyRMgfAvRC7gFe/CKSHNO1l21X5ChMj6lTGirQa3micI++XFrRIWy7u4kT2+mMpup4ts
         v6KGLKKE63tXLl6cqOAOU8CJ/hNXvL1lCVmO2I6eGLDxwzW4JBKQQOTcI7pUW98HdGg6
         WF6tzOXYgwbXkuv+YxKVktuOMPg+/UK74ejtppV4MLdaG2r6hbhUpwDfI1yLm6C2gPu2
         HeGdPGBomERxKolVYIoK8QLzvMBPHu0EywkHs9eJY76+MDys/RG+rqSkVp8kjIQL2Ejd
         482Q==
X-Forwarded-Encrypted: i=1; AJvYcCUngxAn0c19cyVEMP7cAifE9yx7jZ8bDD6iSHM6MrBx4FgSim14RUws1Onysql+HIRp2VOp/2ESqI02O23kBl62XQSzo+o5iPrOzirEphjg39TCosO+njYYsEcd6x6TkMxATdG2Q9xNjM4bAh37
X-Gm-Message-State: AOJu0YzNPvRmvZLM50Vjz3YgkDStRqFcXfgV1f0wRsVOLOkgwbgPvNmz
	VEpAKXdFUmTH8tCHZI68ZEVFbZ7H8NzJEyK9PNYmJzntpDBmdMrm
X-Google-Smtp-Source: AGHT+IEV2TScoV5U0gk+JCSE/6TuIOT7gDP7434MPboQsznm8o/auvcGlGGFMv7zURZ24WPzEpCGAg==
X-Received: by 2002:a05:600c:4f11:b0:424:ac13:ee3c with SMTP id 5b1f17b1804b1-4264a3e162emr16522515e9.21.1720113827768;
        Thu, 04 Jul 2024 10:23:47 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:47 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:22 +0200
Subject: [PATCH v2 12/24] mfd: rk8xx-core: Constify struct regmap_irq_chip
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-12-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=1375;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=6atl/DrZQUwmw6JNwTSf7L3f3VWfEvhmC/OA+w6bvAo=;
 b=VDrhdvOEM4a21M5C9PzDGgMYkfiGHRI9khEoolwkWfTbvEmLzU/atnVqu8qT3Hl2LPrJolCco
 DXFklpE9F8dDWYAFZeupXDJc4TJwL3xQ3mFoCfE5s7U6sfosUQiBSR0
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The regmap_irq_chip structs are not modified and can be declared as
const to move their data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/rk8xx-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 5eda3c0dbbdf..39ab114ea669 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -531,7 +531,7 @@ static const struct regmap_irq rk817_irqs[RK817_IRQ_END] = {
 	REGMAP_IRQ_REG_LINE(23, 8)
 };
 
-static struct regmap_irq_chip rk805_irq_chip = {
+static const struct regmap_irq_chip rk805_irq_chip = {
 	.name = "rk805",
 	.irqs = rk805_irqs,
 	.num_irqs = ARRAY_SIZE(rk805_irqs),
@@ -542,7 +542,7 @@ static struct regmap_irq_chip rk805_irq_chip = {
 	.init_ack_masked = true,
 };
 
-static struct regmap_irq_chip rk806_irq_chip = {
+static const struct regmap_irq_chip rk806_irq_chip = {
 	.name = "rk806",
 	.irqs = rk806_irqs,
 	.num_irqs = ARRAY_SIZE(rk806_irqs),
@@ -578,7 +578,7 @@ static const struct regmap_irq_chip rk816_irq_chip = {
 	.init_ack_masked = true,
 };
 
-static struct regmap_irq_chip rk817_irq_chip = {
+static const struct regmap_irq_chip rk817_irq_chip = {
 	.name = "rk817",
 	.irqs = rk817_irqs,
 	.num_irqs = ARRAY_SIZE(rk817_irqs),

-- 
2.40.1


