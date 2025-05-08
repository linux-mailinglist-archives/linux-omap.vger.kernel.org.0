Return-Path: <linux-omap+bounces-3680-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2125DAAFFB8
	for <lists+linux-omap@lfdr.de>; Thu,  8 May 2025 17:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A4CB4A45B2
	for <lists+linux-omap@lfdr.de>; Thu,  8 May 2025 15:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F81279916;
	Thu,  8 May 2025 15:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6/U1TVf"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABD62CCC0;
	Thu,  8 May 2025 15:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746719852; cv=none; b=gZwaIvnF9mM6yqnBT+GuSckMbyabpzlcJYHyDPk1rcseHODvEYLHTOYiaadnIZT97FPANdsV3XhwDZcfPgu3iDd73mlSwY8zj4oMDrUHGyr8IkercrEhI4iB8820luSI0eaJyXjZ0d7GfWBopWO/DwSuCC40h/Zu29T9t8vDpeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746719852; c=relaxed/simple;
	bh=+Ffm6s3wi6yqUpfLRXrGBMyqeQgdnVpjhjHH/4soLF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AuEv9TvBJAbeMz4x54yR0nLrNJ9AKsHZbvB3um2TX5Ru8lHJR2n/nQLb3JaUM68YOuH0nj081p691+gcKnz17Ys8h9uKXYPnYP7aaBC2aPPo1uGJIG7RgfpW24QG9X0jH904b3OH/VwAnRze3/sOM0FzmGvpf1+t9KLfGOq9J/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6/U1TVf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37836C4CEE7;
	Thu,  8 May 2025 15:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746719852;
	bh=+Ffm6s3wi6yqUpfLRXrGBMyqeQgdnVpjhjHH/4soLF0=;
	h=From:Date:Subject:To:Cc:From;
	b=C6/U1TVfy40SGQ0GsQJsvMc4w4N5aqHB4NfePWRBd9NLE7SCQFg1vTwnPRsWzwMK2
	 BlGTquLxF4jSrgb4s8FL8+sxq1xa2UJTTMAhuZ3B+RPekxp/JGht8cmQf83YaDUjQw
	 hFFB/WKgXMiQ2BdehpVXueFZt2Opqi2htZFY35ezm7nflcLxvNBxyZj3mWeTyh6Hbq
	 wx07eFdcyaHRqiP7IRfSJHuitQ+B78OIvy2+6IMK4Jq7X4Fe/KYlkJ5NnSjLyvaqtW
	 DpxugqYo+pzPk6psmXam5Kq+1t66hjn5ZYinBsSnwr56ZvpoOtcDoofX2KET+oH/5z
	 YgSMq455fVXtQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 08 May 2025 16:57:24 +0100
Subject: [PATCH] mfd: Remove node variables that are unused with
 CONFIG_OF=n
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-mfd-fix-unused-node-variables-v1-1-df84d80cca55@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGPUHGgC/x3MQQrCMBBG4auUWTuQhlbEq4iLmPmnDmgqGVoKp
 Xc3dPnB4+3kqAane7dTxWpuc2noLx3ldyoT2KSZYohjGMONvyqstvFSFodwmQW8pmrp9YFzPyg
 GjVnlmqk9fhUtPv+P53H8AVFLAWFvAAAA
X-Change-ID: 20250508-mfd-fix-unused-node-variables-14fe4f2cfd6c
To: Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4327; i=nathan@kernel.org;
 h=from:subject:message-id; bh=+Ffm6s3wi6yqUpfLRXrGBMyqeQgdnVpjhjHH/4soLF0=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBkyVzK9r9x/3LtwZU7UtKerNHb4b1/xJOX0dHEefeamC
 xOCHUpDO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBELLwY/vDffc4Tf3DR/Ce7
 ZU/w9ZslNmteiWf9++eRan/967c2eucZGW7sFT4eyXO7mb2J70DwMyeL/Wttf/wKF+r2ZTgUEZ2
 /jQ8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

A recent cleanup introduced a few instances of -Wunused-variable in
configurations without CONFIG_OF because of_fwnode_handle() does not
reference its argument in that case:

  drivers/mfd/twl4030-irq.c: In function 'twl4030_init_irq':
  drivers/mfd/twl4030-irq.c:679:46: warning: unused variable 'node' [-Wunused-variable]
    679 |         struct                  device_node *node = dev->of_node;
        |                                              ^~~~
  drivers/mfd/max8925-core.c: In function 'max8925_irq_init':
  drivers/mfd/max8925-core.c:659:29: warning: unused variable 'node' [-Wunused-variable]
    659 |         struct device_node *node = chip->dev->of_node;
        |                             ^~~~
  drivers/mfd/88pm860x-core.c: In function 'device_irq_init':
  drivers/mfd/88pm860x-core.c:576:29: warning: unused variable 'node' [-Wunused-variable]
    576 |         struct device_node *node = i2c->dev.of_node;
        |                             ^~~~

Use the value of these variables as the argument to of_fwnode_handle()
directly, clearing up the warnings.

Fixes: e3d44f11da04 ("mfd: Switch to irq_domain_create_*()")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/mfd/88pm860x-core.c | 5 ++---
 drivers/mfd/max8925-core.c  | 5 ++---
 drivers/mfd/twl4030-irq.c   | 5 ++---
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index 488e346047c1..25300b53a8ef 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -573,7 +573,6 @@ static int device_irq_init(struct pm860x_chip *chip,
 	unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
 	int data, mask, ret = -EINVAL;
 	int nr_irqs, irq_base = -1;
-	struct device_node *node = i2c->dev.of_node;
 
 	mask = PM8607_B0_MISC1_INV_INT | PM8607_B0_MISC1_INT_CLEAR
 		| PM8607_B0_MISC1_INT_MASK;
@@ -624,8 +623,8 @@ static int device_irq_init(struct pm860x_chip *chip,
 		ret = -EBUSY;
 		goto out;
 	}
-	irq_domain_create_legacy(of_fwnode_handle(node), nr_irqs, chip->irq_base, 0,
-				 &pm860x_irq_domain_ops, chip);
+	irq_domain_create_legacy(of_fwnode_handle(i2c->dev.of_node), nr_irqs,
+				 chip->irq_base, 0, &pm860x_irq_domain_ops, chip);
 	chip->core_irq = i2c->irq;
 	if (!chip->core_irq)
 		goto out;
diff --git a/drivers/mfd/max8925-core.c b/drivers/mfd/max8925-core.c
index 78b16c67a5fc..91388477ad2b 100644
--- a/drivers/mfd/max8925-core.c
+++ b/drivers/mfd/max8925-core.c
@@ -656,7 +656,6 @@ static int max8925_irq_init(struct max8925_chip *chip, int irq,
 {
 	unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
 	int ret;
-	struct device_node *node = chip->dev->of_node;
 
 	/* clear all interrupts */
 	max8925_reg_read(chip->i2c, MAX8925_CHG_IRQ1);
@@ -682,8 +681,8 @@ static int max8925_irq_init(struct max8925_chip *chip, int irq,
 		return -EBUSY;
 	}
 
-	irq_domain_create_legacy(of_fwnode_handle(node), MAX8925_NR_IRQS, chip->irq_base, 0,
-				 &max8925_irq_domain_ops, chip);
+	irq_domain_create_legacy(of_fwnode_handle(chip->dev->of_node), MAX8925_NR_IRQS,
+				 chip->irq_base, 0, &max8925_irq_domain_ops, chip);
 
 	/* request irq handler for pmic main irq*/
 	chip->core_irq = irq;
diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
index 232c2bfe8c18..c7191d2992a1 100644
--- a/drivers/mfd/twl4030-irq.c
+++ b/drivers/mfd/twl4030-irq.c
@@ -676,7 +676,6 @@ int twl4030_init_irq(struct device *dev, int irq_num)
 	static struct irq_chip	twl4030_irq_chip;
 	int			status, i;
 	int			irq_base, irq_end, nr_irqs;
-	struct			device_node *node = dev->of_node;
 
 	/*
 	 * TWL core and pwr interrupts must be contiguous because
@@ -691,8 +690,8 @@ int twl4030_init_irq(struct device *dev, int irq_num)
 		return irq_base;
 	}
 
-	irq_domain_create_legacy(of_fwnode_handle(node), nr_irqs, irq_base, 0,
-				 &irq_domain_simple_ops, NULL);
+	irq_domain_create_legacy(of_fwnode_handle(dev->of_node), nr_irqs,
+				 irq_base, 0, &irq_domain_simple_ops, NULL);
 
 	irq_end = irq_base + TWL4030_CORE_NR_IRQS;
 

---
base-commit: c63e393a16c9c4cf8c9b70fedf9f27b442874ef2
change-id: 20250508-mfd-fix-unused-node-variables-14fe4f2cfd6c

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


