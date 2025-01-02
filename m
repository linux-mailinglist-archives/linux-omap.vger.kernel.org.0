Return-Path: <linux-omap+bounces-2941-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB409FFDEF
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 19:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0B037A1C07
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 18:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664E01B21A0;
	Thu,  2 Jan 2025 18:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="jBwa1CUb"
X-Original-To: linux-omap@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D9818FC89;
	Thu,  2 Jan 2025 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842012; cv=pass; b=VY1Naq+S8iN3hnbvqKA8Qegxq8NeuCUx0v/LBTOvUjSJRTHw+u6XyA/KQ/xUKfezDYa1ZEWQKEN7l0YquKmN/cUkS2YoF3iMxRWqTnFfK0EHVG1LoR1PhcQAXT8713qVw9CJH2v3sSE8V2j8iLI4rHCVr9b8lBWOv06EtWzGuLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842012; c=relaxed/simple;
	bh=0amcruyUhZ0TCaR74TWA+Nd564QsXdKTPAGngUKkOWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNye9WGJBA91OYEQxkk5eHkYzjnIvBSI4xEvS++tYxKu6SDHc/Y1S4EnPwyU7rp7f0Ba/C0HWM5CKDZKgpajLsoSI2YzZj+fmRhEuFWSHzDpQOMpZAmIjZjYql+/YJ7zyRwFUYrt9SWaOpZQVgw0if6u5eXYmYkd7HCB9/4aAeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=jBwa1CUb; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.. (85-76-116-195-nat.elisa-mobile.fi [85.76.116.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4YPFNy6VDLz10Fp;
	Thu,  2 Jan 2025 20:20:02 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1735842003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5b3HVJ5u5IW7DiTMu6Bpl+/MZHk5pBEG4La1Q1ydqiQ=;
	b=jBwa1CUbXj2omTZzDdJGrQU0e84PxIR8Ai2hbuyPEbc4+Yv0OzrPVYQOspdNhu/cWPhoap
	YgcERbR3yL1SYcTWThWtU5PvXjhNhky7VFDlZTIrq/TSImxXAvVk1Z4QfCXnW0amvWe3sY
	F1Nj213nE276qGhKSUCjDxH4DISeOB4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1735842003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5b3HVJ5u5IW7DiTMu6Bpl+/MZHk5pBEG4La1Q1ydqiQ=;
	b=nNbCwonIsDbvJlz1mXCO8qqtXk2FnNvadla4qLxRjWUqiPYG3Wdf8p740kHdZvNO/jrDL8
	Onn+PtMtOCHqAU8wmhZjIBbNmp3YQ40dYf5uuIiuueDmUoPIES8fgY2XSMVo/ud6lBjYPD
	ikSYSkPyOLfjU6azydLVB7E+INYtVNg=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1735842003; a=rsa-sha256; cv=none;
	b=Q2dzVOi+EJvY0R+RYSk7SUg1y3Vdej5bzVN91jR2vKphuvBI6gYd4SZ58bSH0KZF69XE5D
	ftMvLxRPfk5NpQZbuuU0es5S1wWbzZujJerQKYDmEvvTZWZlRsgMANEc+0BTTVpO+JlsmW
	70rtKGx/HwhjkhTGlFMLzx6/5BmFPho=
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH 2/3] Input: ads7846 - fix up the pendown GPIO setup on Nokia 770
Date: Thu,  2 Jan 2025 20:19:52 +0200
Message-ID: <20250102181953.1020878-3-aaro.koskinen@iki.fi>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102181953.1020878-1-aaro.koskinen@iki.fi>
References: <20250102181953.1020878-1-aaro.koskinen@iki.fi>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO is set up as an IRQ, so request it as non-exclusive. Otherwise the
probe fails on Nokia 770 with:

    ads7846 spi2.0: failed to request pendown GPIO
    ads7846: probe of spi2.0 failed with error -16

Also the polarity is wrong. Fix it.

Fixes: 767d83361aaa ("Input: ads7846 - Convert to use software nodes")
Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 arch/arm/mach-omap1/board-nokia770.c | 2 +-
 drivers/input/touchscreen/ads7846.c  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index 3312ef93355d..9153b1a81577 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -287,7 +287,7 @@ static struct gpiod_lookup_table nokia770_irq_gpio_table = {
 	.table = {
 		/* GPIO used by SPI device 1 */
 		GPIO_LOOKUP("gpio-0-15", 15, "ads7846_irq",
-			    GPIO_ACTIVE_HIGH),
+			    GPIO_ACTIVE_LOW),
 		/* GPIO used for retu IRQ */
 		GPIO_LOOKUP("gpio-48-63", 15, "retu_irq",
 			    GPIO_ACTIVE_HIGH),
diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 066dc04003fa..54280ecca0a7 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -1021,7 +1021,8 @@ static int ads7846_setup_pendown(struct spi_device *spi,
 	if (pdata->get_pendown_state) {
 		ts->get_pendown_state = pdata->get_pendown_state;
 	} else {
-		ts->gpio_pendown = gpiod_get(&spi->dev, "pendown", GPIOD_IN);
+		ts->gpio_pendown = gpiod_get(&spi->dev, "pendown", GPIOD_IN |
+					     GPIOD_FLAGS_BIT_NONEXCLUSIVE);
 		if (IS_ERR(ts->gpio_pendown)) {
 			dev_err(&spi->dev, "failed to request pendown GPIO\n");
 			return PTR_ERR(ts->gpio_pendown);
-- 
2.39.2


