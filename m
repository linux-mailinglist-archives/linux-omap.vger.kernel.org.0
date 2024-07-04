Return-Path: <linux-omap+bounces-1715-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C79B927C07
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFF4B1C21D48
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8812143860;
	Thu,  4 Jul 2024 17:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNeGCXEd"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF33142E6F;
	Thu,  4 Jul 2024 17:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113832; cv=none; b=M/b57gGjAs0NhO4WgwpVe2GHsl/TJwYnE//FeojrvNOQAr2BWb4QBfSyfbKQTeq9R9l8FkSlGVt1huHVgaR4lZ1qmWvkYmqW93hLqiowTxvbfRIeTDLo7pbxpU/mjtiJ/Zz51C9Y21ZdoS2epbPZHHhY58mACO3EoYuOayGQG7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113832; c=relaxed/simple;
	bh=AXOMZmt6S46YFRJErbndyKFAmqG6fzXUVqcz4xuQ2tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvU4FGZJaVq9s6LmaCg/NxF68ZlxctsQm5DRs4zyX3ZtqhDV3sXNM0gZbpTvRv0ueP5FVV6ufHTkJfLYX31vxrBIkZFkFZDOiPje3ZrIAfR9KCoa3ZlzQ1Nnl2/WafYlZSIfZFqV/m9A2WYxdZvitV6+i5oMbof5rdqRoG3shSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNeGCXEd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4264a3847b6so5738745e9.0;
        Thu, 04 Jul 2024 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113829; x=1720718629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+0aliNulAXRyPEDMGDv2VjbbbF1WfBGFJqmsV4Qtr4=;
        b=dNeGCXEd7tIZ/TZmATsn42tmmujIEP3mJE6248szNn09yYBnKJ3DnAPwrikNGOOM1G
         /9ZIi5+udC/aDjjRADirWfZLsz0gBsYbeQojI/rPUFr2v4AQb3bfQGJrDDi7QgPBaxlm
         szAhZ/vEwvM8NNXm9iZlv/XmhH9Hh34WWxaX4Et3996RMhkKMbrLixPdwAU9IrEq6HG/
         0nevDAFny04xM4e+8kqlVlaPLhgdUrDv+8kXm/QaJmgRV/xOBL/LvWa7+8HwoHp+YaiJ
         WjqZQBPAW2T5+GQNNr0612EJBZmJG0158D471+TtoKfjioWE+b7PbhO3dDBwcr3FAdI8
         amrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113829; x=1720718629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+0aliNulAXRyPEDMGDv2VjbbbF1WfBGFJqmsV4Qtr4=;
        b=r6g87LLljIQD3+mR2J42KC4gI+f02NY+JxkFdY/goZMmm6G4RNZOihMv63PY5lI1NY
         UNysdjzRpTNZVGu9QsWQGxRxxnMowiqdtr7O5+MtwPQsZs4CpuTs81sxqJevDiBKxzYE
         0FNIaWlEutdjlvmvIN2qbYOZFA7fW0x8FOcWawdkpu/+4cKuPanWXNiMFhSn8lDjkbiw
         veIxWi6WZiWaMajjzETzpwHWL5p9i8+ooaDGQG3MG9hD9pa7188p5uJZeUbxUT9Nsfgd
         Xnym7qDfcGUxZMzHZKsklcS71tqhd6+cXPnN/07WiTXFTXlIuINYblzUOYHsIoLmgxiP
         wGjA==
X-Forwarded-Encrypted: i=1; AJvYcCVqOZArWw6KXcNC3gA33stCvcr2D6o8l5u0IEDf+DGbO/Q1lMXz36kN3YOjnNUKn0g5edojPRhhlLlCKrPO9yaCEzd68IRhXm7d4FQJfF0qYwviycSTdfiUpJH+CBJBNz7fL7dMTQiFn6jG6cDT
X-Gm-Message-State: AOJu0Yw7P/cozImjr64+xOMwyqgWGDdq+JLtW1Qwzj9nDDvFTR48D2MW
	utQIt9+TVlflJ069zGeB7MjkUnKn8vODrA9MIXNeJV7g0kQxqvrZ
X-Google-Smtp-Source: AGHT+IHa5BhDJFDyix5K8itu25mKAO+o92oPFVJcdlEdxK93UcrY5Y0/jYOh6tEheFkFp1NCVoGFeQ==
X-Received: by 2002:a05:600c:3b90:b0:425:65c5:79b4 with SMTP id 5b1f17b1804b1-4264a3f55f6mr15114615e9.26.1720113829362;
        Thu, 04 Jul 2024 10:23:49 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:49 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:23 +0200
Subject: [PATCH v2 13/24] mfd: rohm-bd71828: Constify read-only regmap
 structs
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-13-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=1911;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=AXOMZmt6S46YFRJErbndyKFAmqG6fzXUVqcz4xuQ2tk=;
 b=9iQxauCLJOP9HSJdseQBuXEwq1S2sUsM1z0w1yiASOG1r4aVhc5QMRCE9e57/9RYv+JRp62dU
 PllateXXr/GAw0YAxL7TAAYxKv6tuWlR+aixvjyRaqvaeSingyY4siH
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The regmap_irq and regmap_irq_chip structs are not modified and can be
declared as const to move their data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/rohm-bd71828.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index 5b4290f116fc..39f7514aa3d8 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -316,7 +316,7 @@ static const struct regmap_irq bd71815_irqs[] = {
 	REGMAP_IRQ_REG(BD71815_INT_RTC2, 11, BD71815_INT_RTC2_MASK),
 };
 
-static struct regmap_irq bd71828_irqs[] = {
+static const struct regmap_irq bd71828_irqs[] = {
 	REGMAP_IRQ_REG(BD71828_INT_BUCK1_OCP, 0, BD71828_INT_BUCK1_OCP_MASK),
 	REGMAP_IRQ_REG(BD71828_INT_BUCK2_OCP, 0, BD71828_INT_BUCK2_OCP_MASK),
 	REGMAP_IRQ_REG(BD71828_INT_BUCK3_OCP, 0, BD71828_INT_BUCK3_OCP_MASK),
@@ -407,7 +407,7 @@ static struct regmap_irq bd71828_irqs[] = {
 	REGMAP_IRQ_REG(BD71828_INT_RTC2, 11, BD71828_INT_RTC2_MASK),
 };
 
-static struct regmap_irq_chip bd71828_irq_chip = {
+static const struct regmap_irq_chip bd71828_irq_chip = {
 	.name = "bd71828_irq",
 	.main_status = BD71828_REG_INT_MAIN,
 	.irqs = &bd71828_irqs[0],
@@ -423,7 +423,7 @@ static struct regmap_irq_chip bd71828_irq_chip = {
 	.irq_reg_stride = 1,
 };
 
-static struct regmap_irq_chip bd71815_irq_chip = {
+static const struct regmap_irq_chip bd71815_irq_chip = {
 	.name = "bd71815_irq",
 	.main_status = BD71815_REG_INT_STAT,
 	.irqs = &bd71815_irqs[0],
@@ -491,7 +491,7 @@ static int bd71828_i2c_probe(struct i2c_client *i2c)
 	int ret;
 	struct regmap *regmap;
 	const struct regmap_config *regmap_config;
-	struct regmap_irq_chip *irqchip;
+	const struct regmap_irq_chip *irqchip;
 	unsigned int chip_type;
 	struct mfd_cell *mfd;
 	int cells;

-- 
2.40.1


