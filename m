Return-Path: <linux-omap+bounces-1708-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8D7927BF1
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26F6D28944C
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9076C12EBEA;
	Thu,  4 Jul 2024 17:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJk+EVr0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF82770F8;
	Thu,  4 Jul 2024 17:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113820; cv=none; b=WCY70dYtSzByEixHRhCvFRFz+8rbM9WQTRIXM5HEptzSdoUbNErclz0OlJjbOtdrIMU1DzeTvweITNHK+YGKkiNT8tzq+rQnImaVilj6op7GSsbf4o90+hciYLiim0G1/UePYTbpxmEPMvnStoIi2wH9T1sxVWHG4mNedNq35dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113820; c=relaxed/simple;
	bh=pfp5RcagdNcIGe1QQNjVuwzMf32RmDK/Hd4QnG6Cv0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y7lzsoJSnRLj9Fw6iWpkk8xd2tjRAhbzps8QLUG4VanEFutHJiy8u4rduvSHf8kGmhzC/1YVXhCvjrgPGf3wF/gDTqBIKcNmOHCqBNW0MI1OCiRXp0mrg+0qMWtxaQ4R5yVKmFZw6BTYnOderFFa87xI29MPW82waVho7gZ3hb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJk+EVr0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4256eec963eso5635935e9.1;
        Thu, 04 Jul 2024 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113817; x=1720718617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UV1ltKTKaW4yZCRIt1PBVlpTJKfjEFuyvDZdCLF6YdU=;
        b=EJk+EVr0RBl0EdgZamEaqFHQPxSMQCcX+awqi1Q82zb+IJ4KtOZv3L/BcPDmBgzUEb
         pMAZz070TceL4T19IdgJbkiVQWRBLm3MGp/Ap1S9llEDrZ5CsBjLTY2K7H64w5zj8+RJ
         y6WhXZmGfpDiHhKWEz9wxi//3XcG3LetW/vqebCFspIsorU/l2XFJ6F2o6MAUrg4jr4O
         yhkh8VFD4XLfjNqBpeSq6DJDObGEfiSh7So1jLEnhLa4Ahw1/ihy6EzY4uOHjS9XmTK5
         TPXo2SbB+p9WdPNYZfbGBN/eHbu6LjErVTd/JdEjIvJOSEFHf8cV2aBQQ7/RIrpEO1eO
         azLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113817; x=1720718617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UV1ltKTKaW4yZCRIt1PBVlpTJKfjEFuyvDZdCLF6YdU=;
        b=BCARXK6bkvY4hJb3PY7up+2ypWII8Jklk4Y6M33k5IcY5sB/Ja7q4JS8BmKSyORvxN
         1gjp9f9t83npVMu6jLAeM6ZQmkCQ2YLnLYJXSvKTmAvC3Ch+aTevO7o5ojkjb+jSmm6a
         UyXfVCq4GqJw80duFMPjX/Bg71efGGwFwjTufPdfehgNcOWdHRgIBYGDo6DVOj27iDNS
         koBoLWNFnVPIcnsiOFCsMZdKmx4rrBX8aSp8UEr86Aaij9e5Q8nRNByOUx5SBAvxVAsJ
         Ac8OZeR8Wv02jHXEFTp0zmoqKp3eQ0swc0dyRcJCNTHxkdx50gV9a7ay1VeU6CUvOP4j
         bRHw==
X-Forwarded-Encrypted: i=1; AJvYcCWQDeIzuk6Sqk9C3BBm7LmSM+pN+v7cwMNMgdTTFBZ4WUREDl1cr/R/NSeMIRffVCBnykMkn/UCrWP/pEIWc5vkhHE8O/rHc+NQ2IyagTW8GydmI+GmIGIaUr0BTYvYROvsI66SpkKPUYbtfSsf
X-Gm-Message-State: AOJu0YwOOsT8r+4CbXGGCwe7yu5cRp5IFJ42fLPuInAQn9GwV3SO00I3
	7VZUTMkA4h5Qyw71lk2L7jXUrnhqR/RzoAdPcxMnFMaS8x/0Txq7
X-Google-Smtp-Source: AGHT+IFayGbOWU2NuV+LVeotJFd37Zf8oQyJqVq2J1/NgNQICLpdvZCrbJvr8r1EBe2/OU/bDuu7Ww==
X-Received: by 2002:a7b:cd05:0:b0:425:7c29:7480 with SMTP id 5b1f17b1804b1-4264a48cb74mr19709845e9.38.1720113817105;
        Thu, 04 Jul 2024 10:23:37 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:36 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:16 +0200
Subject: [PATCH v2 06/24] mfd: rohm-bd9576: Constify read-only regmap
 structs
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-6-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=1538;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=pfp5RcagdNcIGe1QQNjVuwzMf32RmDK/Hd4QnG6Cv0M=;
 b=7Fa3AFgLDuDESYIOxUfDUDhsjrx89iv7ob0w7RkVM53841DbBwwV/uqHvUqzzinL++/HsfgdT
 gBovMDhBC40Cjpvl23ffJlzByWK0PUy0vzsA7WqG0uxz1GWcaPQA81G
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`bd957x_regmap`, `bd9576_irqs` and `bd9576_irq_chip` are not modified
and can be declared as const to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/rohm-bd9576.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
index 3a9f61961721..17323ae39803 100644
--- a/drivers/mfd/rohm-bd9576.c
+++ b/drivers/mfd/rohm-bd9576.c
@@ -57,7 +57,7 @@ static const struct regmap_access_table volatile_regs = {
 	.n_yes_ranges = ARRAY_SIZE(volatile_ranges),
 };
 
-static struct regmap_config bd957x_regmap = {
+static const struct regmap_config bd957x_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.volatile_table = &volatile_regs,
@@ -65,7 +65,7 @@ static struct regmap_config bd957x_regmap = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
-static struct regmap_irq bd9576_irqs[] = {
+static const struct regmap_irq bd9576_irqs[] = {
 	REGMAP_IRQ_REG(BD9576_INT_THERM, 0, BD957X_MASK_INT_MAIN_THERM),
 	REGMAP_IRQ_REG(BD9576_INT_OVP, 0, BD957X_MASK_INT_MAIN_OVP),
 	REGMAP_IRQ_REG(BD9576_INT_SCP, 0, BD957X_MASK_INT_MAIN_SCP),
@@ -76,7 +76,7 @@ static struct regmap_irq bd9576_irqs[] = {
 	REGMAP_IRQ_REG(BD9576_INT_SYS, 0, BD957X_MASK_INT_MAIN_SYS),
 };
 
-static struct regmap_irq_chip bd9576_irq_chip = {
+static const struct regmap_irq_chip bd9576_irq_chip = {
 	.name = "bd9576_irq",
 	.irqs = &bd9576_irqs[0],
 	.num_irqs = ARRAY_SIZE(bd9576_irqs),

-- 
2.40.1


