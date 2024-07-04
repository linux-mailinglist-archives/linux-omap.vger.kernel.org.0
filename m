Return-Path: <linux-omap+bounces-1711-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0250B927BFA
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AEBCB220AB
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D3B13C9C8;
	Thu,  4 Jul 2024 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlsmtZZW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C7B13C67F;
	Thu,  4 Jul 2024 17:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113826; cv=none; b=hxD+bZ42BlIr3kyggGTyANuZ613iZwnlD2RDOMbdc67Qb0RQEEfg7mkRys0SP7cCmuHL6kSGZsjVlgAOEV3WWG3QP5AAH+Dz5EvtwbrGxojvkayKcsWZy7VO8/8w9WhFlHdylFTEOwq7YAAtvAiicB+DRak1krWD4gFWWOtWg4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113826; c=relaxed/simple;
	bh=V1YaAN6Ae4SYUS+F2fqEOGoyBhvW6e5jyjeki/M8uo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lvo+q/RkvGDRbrFOcKWJ3hv4xINhNbso1u2pVlnYQQD1WFRMrfC1UnR2FGcK4J3g4L73XOxTyiML8PqH0fJ9PDpoi7QZW62DyRlbyF4gsvPYi50N2nVPcGLLojaMJGeanzIfMslbEXSWgvzA4m3ygtPGO04iwrpb1TFUMn9RDZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlsmtZZW; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52e98087e32so929255e87.2;
        Thu, 04 Jul 2024 10:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113823; x=1720718623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEcKMLoBT3vk4y3IWrtrUEpgZYcFGVwoc0kCUdiwlg8=;
        b=KlsmtZZWg44giXmno5P+CZAvWKp9HHcDdAoEOq056Dz2l9u/zBO5KbD5Sh1r3ip5zs
         aWu2lrBTLLDc+ECs8eVGffKYO/J/c8nBD/ctJJqvN7YEu3Xkeas7N+8gmIGI8zxqEKf+
         /5n/S6uD0yflOkaf8sxG6hw/qh8kq38cxzGE4ehYyGaKkTbpNnBnLzTHQAnWZDNwn0zO
         D88Fl4as2Nbix/HZjiw4VVCzPoVyM6drhxhFVaKe2+e44jnguS85xgcqZRhZM7OVx54Y
         vGlURrcftUMD2o2Sna7MIDKrUPu/sKR+pCvgTEbQnOhCeRhn6i/f5WH7F3rpg+owAIDk
         sV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113823; x=1720718623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEcKMLoBT3vk4y3IWrtrUEpgZYcFGVwoc0kCUdiwlg8=;
        b=r7QU/BBfiiiKtjsfEJQsbwHhPC7KXMEzA+9yG5EV5mq2++2LvepBq9fPu032TAvv1k
         hlIWgV6846recZ5T2mco3sMgiJPBfPoTjH+JeA9S9OtAPpjHdsPQc7T6Lk418FRs4Caf
         Fg6aPr8/WproYNAYnQscPxUEi6vjdLky6oY38s4pk1OoPdmfAU47uu8zhCm24IsPrxNU
         DifQkfm0ac2yR4//3d1zQoCronyjHYGBpy+8fL+e8MO3uN1MyymLkiNpJM2zihKYKUtH
         oQnGlWkbPtsmVpQljgxrtOrwCsRiv4vzC509nAQxpRJwQQ/9HqUW9Zeaji2ofoApY4nG
         C4oQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7A6/u0JVTOSvD8PLL42VQmrctZ7kpD8kkvXSAcoBf/YtCy7uUOkrk6vtF11G9b25zVgv/4t5QrItKmqcalU6nIV0L0AX7XpmSq5+p23GEypCyp0eNlydp+q3M4RVYgPa6Bu/Ybk7zYuShkL3Q
X-Gm-Message-State: AOJu0Yzza6soZon6MvNV8phiq0IH4AFSUDIo5nBpamc6ZLSZvPSrQk8Q
	Oqdz5s/xJUQMo/wGoa5eZfs9KpuMjsSgsQICT3B3HZqujhjdwtP6
X-Google-Smtp-Source: AGHT+IFNP59IFboyukf1rrfIMaw6kHzCXFpazPd2dB/0uvup5SShiaC7xDpvSqu5YY267U3gS0hiPw==
X-Received: by 2002:a19:ee12:0:b0:52e:9ebe:7318 with SMTP id 2adb3069b0e04-52ea06b7845mr1641184e87.43.1720113822765;
        Thu, 04 Jul 2024 10:23:42 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:42 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:19 +0200
Subject: [PATCH v2 09/24] mfd: bd9571mwv: Constify struct regmap_irq_chip
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-9-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=1160;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=V1YaAN6Ae4SYUS+F2fqEOGoyBhvW6e5jyjeki/M8uo0=;
 b=UeWR2+z6XmU+2iBQpnyuihdm9i6qK/rcCaw1b12r8oK8MhRMJIyAVI98/jj/H9/QhGmnanzDw
 YeBwmgZ+wdbA+6PBSsftXrA3de/3ic8/8AP/xLAgw1JjbbW7kkouDCs
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`bd9571mwv_irq_chip` and `bd9574mwf_irq_chip` are not modified and can
be declared as const to move their data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/bd9571mwv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
index e7c2ac74d998..db8c2963fb48 100644
--- a/drivers/mfd/bd9571mwv.c
+++ b/drivers/mfd/bd9571mwv.c
@@ -93,7 +93,7 @@ static const struct regmap_irq bd9571mwv_irqs[] = {
 		       BD9571MWV_INT_INTREQ_BKUP_TRG_INT),
 };
 
-static struct regmap_irq_chip bd9571mwv_irq_chip = {
+static const struct regmap_irq_chip bd9571mwv_irq_chip = {
 	.name		= "bd9571mwv",
 	.status_base	= BD9571MWV_INT_INTREQ,
 	.mask_base	= BD9571MWV_INT_INTMASK,
@@ -159,7 +159,7 @@ static const struct regmap_config bd9574mwf_regmap_config = {
 	.max_register	= 0xff,
 };
 
-static struct regmap_irq_chip bd9574mwf_irq_chip = {
+static const struct regmap_irq_chip bd9574mwf_irq_chip = {
 	.name		= "bd9574mwf",
 	.status_base	= BD9571MWV_INT_INTREQ,
 	.mask_base	= BD9571MWV_INT_INTMASK,

-- 
2.40.1


