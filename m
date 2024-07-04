Return-Path: <linux-omap+bounces-1712-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE754927BFE
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78CCE1F22489
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF2513D250;
	Thu,  4 Jul 2024 17:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hix27D/f"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F183813C9A1;
	Thu,  4 Jul 2024 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113827; cv=none; b=ZA4lWK/p/ShGNFyYcaf9Up2N1dhUd/1xRNuTGUTyiFh+Myv5ulBzbUIRHxdo9axHjRgiutXZO1xlbWiWYxz0gWSoIBXwgy49wqrGHDTs9BswVCzJMgSOibjrv+JE12fshcC5uqGTQuHTnTp+os0CfqkNOM2neNnwre/wdUSnZDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113827; c=relaxed/simple;
	bh=iaBF13NOr1XPkiRrsRFdEpI6lgqiWVNSRbGWT5OqpFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TCzhAeCRdFaRXNb7FETt7lP4XdMqudbOOUnCh10k3QQsWMaJbvOcVhc6DFS8I2ewjPB7to24BojqRtJD/IHh+lvqJoRl/aQgSx/EhCjmzfgr2AZNZeRrQySqcYJaLR7jnvNTbRceBJETfmoemcnpwh0ReotjH5AwksvJbb//IPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hix27D/f; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42565cdf99cso7315995e9.3;
        Thu, 04 Jul 2024 10:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113824; x=1720718624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpaImdJvWvSJvjBxL7f9lYNmbsKrZex9zQVuWAEj5kU=;
        b=hix27D/fhVartibCI4B++e7nm14rOsIGRjZ1FmkWNLUFReVmKGk0g2YG35LnPKDGTy
         jBBDRzrC12jZ+InXcbAidKGVwfqblVd4VxDOvxy4k0So0agVq0gUzR9nrZS4hs6TNF0w
         tsc+wSMizuSK+3E9Z3CfWrGy2wuTfI3uHpc5aohdIffVrpUgiKqLAek2Jf4rKorU6jNA
         ins+lWGqDdIm9iyFslQLtYdRslMje+vtAVflfBAv/pN9pOeuUVxRHKsv25FvT0Q1z7VJ
         mEV2f3Abzbd0uZUm8KcHaXiuUrT6jsbhuV+5UIiv4EBy5iAmHF0YML1EAKbzs4De+IIf
         W4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113824; x=1720718624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpaImdJvWvSJvjBxL7f9lYNmbsKrZex9zQVuWAEj5kU=;
        b=BCsIi2NKSMeKpsmfFY5UfmUE95sM+Mq1QhOw6MY0fLuZOHrIm+V2i2MbyusPsVEN3I
         v96xTlOSidsbhssb+FPFLLin+r74gRNitmV7qGWWsvGa7561v7Y6sOXNOoznkevbM0+j
         ynVDOsn3ulIPVXG8L7zqbbD341JW7hl+HxkIWfqOhoE3rMgmsPTxZna79DpfctI1g4D4
         6WAvb36M4UGhzCEtrpTUOMbXyS6w4TKzlz5QCOfkQolDTmxhMEFiIvgxmoqTs9G9f3YM
         inClI5CpvpSJJlb8HtUGDl6KIQRy9zRc/KKQKPW9/HnH36JObZTMpX/nYVFKzS2vXmyi
         oLaA==
X-Forwarded-Encrypted: i=1; AJvYcCVK9U01mcj2LsTOFFbKTHCeNMzZzauWipVLhrEK3v7cYth7yOH4mN5/tyffVN+vJN69fZzc/v/T7FPo0rnPQyup+sdHXepJ2gIxfCSfAhp1Wjo337rcuO1GcMe0xmQs7qJL3oMwJvKD6i1U7o7f
X-Gm-Message-State: AOJu0Yx3OJRYFTBTMm1fvta+77DAkqrrSqs7OiZkIIqIUewdk2WuTCv7
	jvz50JziCnF4JIqStlvWaj/aqJMDCXCv33uRkZRpFim+32uVhbz45MsQA0w8
X-Google-Smtp-Source: AGHT+IFn70SGfz/PbRUH9kwgyz1pEDMFMqDPHavxrHHe4NlUGcp5CAuaBhl0qng6xKy8CAZYdYP57w==
X-Received: by 2002:a05:600c:4b98:b0:425:672a:769a with SMTP id 5b1f17b1804b1-4264a3f2fb3mr23812065e9.31.1720113824428;
        Thu, 04 Jul 2024 10:23:44 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:44 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:20 +0200
Subject: [PATCH v2 10/24] mfd: intel_soc_pmic_bxtwc: Constify struct
 regmap_irq_chip
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-10-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=2909;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=iaBF13NOr1XPkiRrsRFdEpI6lgqiWVNSRbGWT5OqpFk=;
 b=evJMf6OIRqyV5kGTNmMo9WHWYOfq2aTbuW+ej5rXKo6Qc84a4dZXpK4NYNxGCz1WuhNEbB4fV
 gxG99rFE7KKAcJ8S/aDLRbzGUme5K8p4FroKeVs+Dfm160Xl0RFIMEI
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The regmap_irq_chip structs are not modified and can be declared as
const to move their data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/intel_soc_pmic_bxtwc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/intel_soc_pmic_bxtwc.c b/drivers/mfd/intel_soc_pmic_bxtwc.c
index ba32cacfc499..c07a01c85a46 100644
--- a/drivers/mfd/intel_soc_pmic_bxtwc.c
+++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
@@ -138,7 +138,7 @@ static const struct regmap_irq bxtwc_regmap_irqs_crit[] = {
 	REGMAP_IRQ_REG(BXTWC_CRIT_IRQ, 0, GENMASK(1, 0)),
 };
 
-static struct regmap_irq_chip bxtwc_regmap_irq_chip = {
+static const struct regmap_irq_chip bxtwc_regmap_irq_chip = {
 	.name = "bxtwc_irq_chip",
 	.status_base = BXTWC_IRQLVL1,
 	.mask_base = BXTWC_MIRQLVL1,
@@ -147,7 +147,7 @@ static struct regmap_irq_chip bxtwc_regmap_irq_chip = {
 	.num_regs = 1,
 };
 
-static struct regmap_irq_chip bxtwc_regmap_irq_chip_pwrbtn = {
+static const struct regmap_irq_chip bxtwc_regmap_irq_chip_pwrbtn = {
 	.name = "bxtwc_irq_chip_pwrbtn",
 	.status_base = BXTWC_PWRBTNIRQ,
 	.mask_base = BXTWC_MPWRBTNIRQ,
@@ -156,7 +156,7 @@ static struct regmap_irq_chip bxtwc_regmap_irq_chip_pwrbtn = {
 	.num_regs = 1,
 };
 
-static struct regmap_irq_chip bxtwc_regmap_irq_chip_tmu = {
+static const struct regmap_irq_chip bxtwc_regmap_irq_chip_tmu = {
 	.name = "bxtwc_irq_chip_tmu",
 	.status_base = BXTWC_TMUIRQ,
 	.mask_base = BXTWC_MTMUIRQ,
@@ -165,7 +165,7 @@ static struct regmap_irq_chip bxtwc_regmap_irq_chip_tmu = {
 	.num_regs = 1,
 };
 
-static struct regmap_irq_chip bxtwc_regmap_irq_chip_bcu = {
+static const struct regmap_irq_chip bxtwc_regmap_irq_chip_bcu = {
 	.name = "bxtwc_irq_chip_bcu",
 	.status_base = BXTWC_BCUIRQ,
 	.mask_base = BXTWC_MBCUIRQ,
@@ -174,7 +174,7 @@ static struct regmap_irq_chip bxtwc_regmap_irq_chip_bcu = {
 	.num_regs = 1,
 };
 
-static struct regmap_irq_chip bxtwc_regmap_irq_chip_adc = {
+static const struct regmap_irq_chip bxtwc_regmap_irq_chip_adc = {
 	.name = "bxtwc_irq_chip_adc",
 	.status_base = BXTWC_ADCIRQ,
 	.mask_base = BXTWC_MADCIRQ,
@@ -183,7 +183,7 @@ static struct regmap_irq_chip bxtwc_regmap_irq_chip_adc = {
 	.num_regs = 1,
 };
 
-static struct regmap_irq_chip bxtwc_regmap_irq_chip_chgr = {
+static const struct regmap_irq_chip bxtwc_regmap_irq_chip_chgr = {
 	.name = "bxtwc_irq_chip_chgr",
 	.status_base = BXTWC_CHGR0IRQ,
 	.mask_base = BXTWC_MCHGR0IRQ,
@@ -192,7 +192,7 @@ static struct regmap_irq_chip bxtwc_regmap_irq_chip_chgr = {
 	.num_regs = 2,
 };
 
-static struct regmap_irq_chip bxtwc_regmap_irq_chip_crit = {
+static const struct regmap_irq_chip bxtwc_regmap_irq_chip_crit = {
 	.name = "bxtwc_irq_chip_crit",
 	.status_base = BXTWC_CRITIRQ,
 	.mask_base = BXTWC_MCRITIRQ,

-- 
2.40.1


