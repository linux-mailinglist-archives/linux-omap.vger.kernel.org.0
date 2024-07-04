Return-Path: <linux-omap+bounces-1724-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9853F927C22
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CCC91F225E1
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22C8145B24;
	Thu,  4 Jul 2024 17:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PeNieckp"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0916145A18;
	Thu,  4 Jul 2024 17:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113848; cv=none; b=ML9imffWm6RbBerVDOsMwBaYwMKhnFFthl5Arjyhq0kKSlMzHATnsGbsEtboXNOtvviFA1TNgnGuj0y0dvOrscxXs/GVHwnarysTQVOB2u04i+peSQKjr0RxaGJ7nP1LWYWXJNsUk2WCNgYybWXSGaxeFUpWgokhUPyTnb64dYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113848; c=relaxed/simple;
	bh=EFjeAuFQ+yjeW5Mj8fAqH28Zfk3DwPtm3fhoKInicuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lWqFsuU9g+N62V75lvkkXuP7s4AdjOR6K9tMVPKNn5O+vElB9cMT7DbVUt3mbypFqvjLLaMHsi3PrY0XtfjSqz+G9uHylBx0pN0UjZK+4nKk4ijZQRo2wx8wYGLu3gJf10jNMGM0+CVM9JdiJhTFVRci8mFRSlxJsXmcrwzDuv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PeNieckp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-424ad289949so5719665e9.2;
        Thu, 04 Jul 2024 10:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113845; x=1720718645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSmkXwdNDx8gxRBcSFEMTKWfVzkTr4PxXtZV2NUkJPo=;
        b=PeNieckp/oXyi8qz00A/fv6Xn3MXhcEcPNOJcwPJ8XnnkY57sBvbyAL3YVnvZVigv8
         IqZzpdXkwnLm9s9f5pj66CJFqN7LE458AOaVXxTA7vJ+oVkaY2xzb5vFQ+0Tw3hs+aAw
         UkxZ5GIcI+x8HhT0X95KL81gWEzXdoVzlQ/+6ZlUDRV34vXyJcWuqHCTlH3AJ2tevCNA
         CGOpribBHlwJGgYDFZWRlHyE2hHHdD8EeZ4F0FPiN0sQXysWTEa3RBHbxrw5Nb9HYoIm
         Vfob7Hd/tYTXiGr1rygH6wIbxgpxSKPXVsp/wi90QfEsGlHX0gyNdVjLiclLRpgb6FFc
         HCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113845; x=1720718645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSmkXwdNDx8gxRBcSFEMTKWfVzkTr4PxXtZV2NUkJPo=;
        b=j+06Jv8ErHSMtShvrA3DpKaJYnL5rq89ruvUqlM54kBlrhU5JFK5IrzvBRHfECkYEJ
         YlouHhrdMkTmYFHzpLgYu7f1nuEokaF0q0455m876Z2c/qYOn05QK49j/HxNTVShzz6Y
         zcEipZt+CSSB5wzuKy0kV1qdUi99e/I8uMsXgwWuEQJdLfXc29Tf5RcILXu/2g2TALHm
         IxcJzHkUypjwK6ZwbljYMYlTKXz5mhyXGJGwtyk0J6c16yaK0quTCRbxxupkvSMoPB8C
         vjvWC71ChRCU2YcXUYLHVCEoA/qnza30qeUnMY6l7qzwz7fn+k4PXCjYvcygBmOE8vfC
         aAuA==
X-Forwarded-Encrypted: i=1; AJvYcCX4+VL8jLkPBVcP9q8Qk6TfBDpzb0zeaZjRLUd0EcMd4uq7KcMN0bC5lTSwwwoPgqTJA8/fCyG5ymyjwiQLlO+IWqqjIpL3T2r171XCh+xMls9Ci3oSg0ahkfNrMBjLpNrKFi/7Nm5A7WVduJ3r
X-Gm-Message-State: AOJu0Yx3aG1JAl7YHXGOQooW1S2ho5v8gM/cxxPIW3rP5X8kuTcHYM/+
	X2gr+lrbif/qXM8lEVBM2hhqrU7sPbLfGkIvDWaK4wqD75PJ1jwK
X-Google-Smtp-Source: AGHT+IFxi0ZapjHCUnWyNL5kvf9WrHCIIvC3731ltStZfnS1OdULl4EU3AnXLZGmvjFniCwRREl/eQ==
X-Received: by 2002:a05:600c:230d:b0:425:6424:357a with SMTP id 5b1f17b1804b1-4264a45f760mr14744965e9.35.1720113845281;
        Thu, 04 Jul 2024 10:24:05 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:24:04 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:32 +0200
Subject: [PATCH v2 22/24] mfd: gateworks-gsc: Constify struct regmap_bus
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-22-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=739;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=EFjeAuFQ+yjeW5Mj8fAqH28Zfk3DwPtm3fhoKInicuk=;
 b=KRVR1dMucgQ62PGtutNIDVIfVON9pSMU21YATQa6veFwYOOGrU4wZI9vUYUbP9DTsH5+o4UkS
 TXwaYJ6ga8MDJDIBznuScntzxKT1mngJxqyLIchPUhjkVFNNkvLTP4x
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`gsc_regmap_bus` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/gateworks-gsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/gateworks-gsc.c b/drivers/mfd/gateworks-gsc.c
index b02bfdc871e9..6ca867b8f5f1 100644
--- a/drivers/mfd/gateworks-gsc.c
+++ b/drivers/mfd/gateworks-gsc.c
@@ -160,7 +160,7 @@ static const struct of_device_id gsc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, gsc_of_match);
 
-static struct regmap_bus gsc_regmap_bus = {
+static const struct regmap_bus gsc_regmap_bus = {
 	.reg_read = gsc_read,
 	.reg_write = gsc_write,
 };

-- 
2.40.1


