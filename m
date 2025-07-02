Return-Path: <linux-omap+bounces-4026-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BB8AF0F97
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jul 2025 11:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34B584A187C
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jul 2025 09:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547BE25291F;
	Wed,  2 Jul 2025 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zpy9n9FH"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21DF24DD09
	for <linux-omap@vger.kernel.org>; Wed,  2 Jul 2025 09:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447661; cv=none; b=M/ptBdcJJQOHZ/iSfvkslOXnUNTilGxkMbRBYZo6/kkKmhJY99JOpCKPI5K5mOoWsaXooOuTSu+yJRO86Rq3o45ql7zW/fybpbBPIm1yNjWfZfgHG8LqzjRkZMUPxRNtdrPFsVl7uRvwccB1HmYoR6IPU1aCfzhfyOYwZv1pYMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447661; c=relaxed/simple;
	bh=0CCgAR7foY2vxCqdRkiozRErh1uOjEAG7LJkHNRhIK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F90gvkoaNY1ffvE8FBhx7LPCz4roLCVEKK1GPZuhn2JZEXZQXklObnXFBYnpTrl5ytZ9JctcOImNnZzIo28VOyf63yCXnnRy7T6PDnUzTzOQt5HIwVy7xqbjoPpi0M6JJ5ZsjrAqatOCAFUfHCZj5xBrKq1wJJLnckeUb6ygxp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Zpy9n9FH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so43504215e9.1
        for <linux-omap@vger.kernel.org>; Wed, 02 Jul 2025 02:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447658; x=1752052458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xguh4M4nOAOg3jvcV1f4QrvwNJW5HUqyDFT0g+MG0Rc=;
        b=Zpy9n9FHCTbxvUDtGhLgUoroOkOY9vViqmfde4vR42x8rZUzjCSR6WQ8woZBF8NAyw
         /Zn/IafBpHzyQmeNqqT7claoiUJasqL99prbDABtjLFvWxfl24/UKiC1Tj14lH5hlnTP
         sZyiyLoVe7jg50FssUOkkgPMRXVko11rtM8AqjqTJOhZ6i8RLHBD/JrF/v6Ba2Pftuwn
         HhimK2kQ0Kf0xyyAcqn+bRZ2s2+0VCcut5bHzQA2Ip0K7uAx0zH0Zmfbjgb88mYW2X9r
         aUKuILVP5eZ30prNL/p+eNjsae3dORMBHBAOSoKVgKt3vMgY4QPEaUJjR7SF0M9TQ6hB
         c8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447658; x=1752052458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xguh4M4nOAOg3jvcV1f4QrvwNJW5HUqyDFT0g+MG0Rc=;
        b=JGIPG6fQNeMOH9pzz/Q8V/ik+zeFxdxm8P4Nb4jnv7loU8ePzrg31bXvYR8a7nzvjj
         qA4zOQBXDj61xvTHCzaWOVtGrZEYZuJy7CZJDW4Dv1EEUfGY8BF0oaiYWdHzmFwrWa3M
         d/6YgHT/fPu2cr9Jq9qIRBDUcb5C90oqny4SbJN7DInSU/I4jSkp4C9l/XWqKdqyzwaB
         x/vCIbk9XI/k+zoYmGCVcb5Dqizzp17RX+R5gktfNhNac3c5Ngqx6bbxFBLhBV9kCS+Q
         JWExJREaviGoj9VXEF/YDOva0faYmooRkzf1Xwk6BXOhADfI6gepMSuR86TEdWBTvEij
         vvMA==
X-Forwarded-Encrypted: i=1; AJvYcCW/pmbDCKhT0VHKfwNaDZMBBiBHJnfgaw0hlD6tQaAdGJLuXQop2V83Nua+yy9qNhoyhZUqkPKQhU4d@vger.kernel.org
X-Gm-Message-State: AOJu0YxggtK3J86ZM5aeC0YFH7/HfeHQZ/Ic/X8sHb2X87PlaR83Qnfu
	4IEpmDLPzG8Y2+fmOoTmLdb6UW1sosSBJRFiEHxWY42idG4B4DYK41J97ziVhgorH40=
X-Gm-Gg: ASbGncvzbeAjqn5O7XGknnVXlPZGJDwfiC5pasx1Ow4xkLGVtY0uLJjgUT9R/2fNHRe
	zQwYDs+L+CDVh+nO9XBo7oFYpcSQbHTWsgVmYR53Z1MEBSsxkf+oxmKHD2+CmHU0quBZHBjglTg
	pfjIYfCedWbqbaHrdcLYYmLK89ezkwFiuwfBAE0mvZn1wCIKDSuUTZp6usIu5hZj3q+XdOeJjlp
	fztotbliVO3ScL+AiHrGbAo4xsHeHipo+RvLLhovZXg+PmrN5B+Kj6g/PvB62W7xsaCYm5QX0T6
	2TYF5HpEa5TFw5pMjayHrUm76BLrJddqiZ4eLD6vRQPjts6iCtFe9w==
X-Google-Smtp-Source: AGHT+IEXvngW9mjQtt3YSAmlmwkbD2tvrxwjMjiWhrjK76Kp8IWo7gPPAbTysgens+18N1YeNadKqg==
X-Received: by 2002:a05:600c:a103:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-454a3b2cc68mr17009165e9.0.1751447657988;
        Wed, 02 Jul 2025 02:14:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:14:07 +0200
Subject: [PATCH 06/12] gpio: tpic2810: remove unneeded callbacks
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-6-0d23be74f71d@linaro.org>
References: <20250702-gpiochip-set-rv-gpio-round3-v1-0-0d23be74f71d@linaro.org>
In-Reply-To: <20250702-gpiochip-set-rv-gpio-round3-v1-0-0d23be74f71d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Robert Richter <rric@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=yyp/YnlXDWgxwlppC69ZfL2rHq28Ii46y9ZnAqGL1yA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhg7FInADuBbdiXQdvt/4LhjRMKfYO/arKSK
 aofS/o0JvOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4YAAKCRARpy6gFHHX
 cpiVD/9wvqtQ+aGJD4IyDh5H1/QsJoiPCZcYJleGc1e0SCIECesq5ijEDRnHNrv16NwnLyd5wIX
 Of9/lebFxeSrMGodNrIs0mwNYu3jHcdbR+onVKwjAN4w6ouQ3LT9y86EiUpqZ+PNhd99UIBqhZw
 RexExp4FYJLnDlnxS3VsFMFaBlw+w1bGje1cmF+gO0jpCHd0mfvMONNvAEAmgy0JrB9W9ZTEQ+M
 UDuUAinUEiaAmccpkIEuR4kdV/Jcpvvy8Szc1r6TQUpmNmo2a6dl5Rhwvo/QRfnzqPmzqth/hyw
 ct+shspnI+iZhM2b9/A5moAyV+MdWnCSmyXPwK3Nt8zqVDmccRT8y8hCN6mXA3ZHuq/GQlpPb1C
 XB30iN1l64I8tyKy1r6D/gtrqEr9T7m/ALI5tCIW1MVYq13ziF0jjBxzj7v7S2tcXWhtV/1tbLF
 mIyzwu/LiHkDMM6i5lrrlD1GAgM2Xd7i89CA8Ar2CN7Azxu11hhUonqe8rS2MB8uz0XHtXHGcyM
 /lVMu+sHzrl3hfclphuYg7CzVSI2Y5FYE0neoiHuapgcwGLAjGnlOf5EikBq8C1oRnnhTXV9pbw
 MRVwqgwKX/Mv39ndl9IoMShNv7yx5qBojqXvXU5LwJjZyzfpBC5mIm+EJ5S4h4Qe3TobEEZhPeL
 GpkEGD0unnOAAsg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO core can handle output-only chips that don't implement the get()
and direction_input() callbacks. There's no need to provide dummy
implementation of the latter in the driver so drop it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tpic2810.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpio/gpio-tpic2810.c b/drivers/gpio/gpio-tpic2810.c
index effb7b8ff81fd51664b7f51a124aaafbf3504feb..e99725bd3d63d47ed6dbb800aacac14b1ee96b9c 100644
--- a/drivers/gpio/gpio-tpic2810.c
+++ b/drivers/gpio/gpio-tpic2810.c
@@ -34,13 +34,6 @@ static int tpic2810_get_direction(struct gpio_chip *chip,
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static int tpic2810_direction_input(struct gpio_chip *chip,
-				    unsigned offset)
-{
-	/* This device is output only */
-	return -EINVAL;
-}
-
 static int tpic2810_direction_output(struct gpio_chip *chip,
 				     unsigned offset, int value)
 {
@@ -83,7 +76,6 @@ static const struct gpio_chip template_chip = {
 	.label			= "tpic2810",
 	.owner			= THIS_MODULE,
 	.get_direction		= tpic2810_get_direction,
-	.direction_input	= tpic2810_direction_input,
 	.direction_output	= tpic2810_direction_output,
 	.set			= tpic2810_set,
 	.set_multiple		= tpic2810_set_multiple,

-- 
2.48.1


