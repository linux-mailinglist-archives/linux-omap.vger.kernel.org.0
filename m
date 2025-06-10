Return-Path: <linux-omap+bounces-3813-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF2AD3682
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 14:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A285D1782E2
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 12:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11AB298988;
	Tue, 10 Jun 2025 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xmAZ5KL0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F7A298245
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558816; cv=none; b=LldQHiDmKzoZWlN0tjiOuQ+va4BDm3jf7aS3b2fSEe/DwcPX7J1qu1zSIVIyhUDePhK5hDf/huWnxdhvDlt2eH7xDSkCGT8C+9pzqcOvEwLzO4M1kl6DxSDsgWxmDwAU1y0VRutwqsDMJzZMn6iU2TBnt4PQt0AIJsUYxwCV9mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558816; c=relaxed/simple;
	bh=PZhBn1xIuX3piPV0sigQffEqzYcuLXEK3ObYbTHxcOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HrdvSrqqlv0ThIB8DpAw0PCNAskGmG3OKHhInKL3VmH1t+Ji6WHOobSxZXgoR/M3xxufZpI3zeomepa7qbt+5hZqiY4aTFhrela31umZmSNLK2bRXTSeNVBg3YeDkICHsUUSlfQVWbyJrSsQOp/oioEp7oR+uduXdUnT+CNTpAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xmAZ5KL0; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a375e72473so2741991f8f.0
        for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 05:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558812; x=1750163612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aASIZHuidOjhLiw96O1OXVywQzoanXq7WKY8AyplZE=;
        b=xmAZ5KL0sslxXJJ7bHglKZMrqn/XEBUs0pcj7LzLr1nupVAmuNY593Ft2qVM//fM4z
         7DK/lMwi4ezdm9qdMQWIyYwf0vDQ2cTe3lLCwfvmbkJaOhX8ZWyD8Rzgf/x+tJ/RbfwB
         uYJMwl94xwCScQv8EU/lMkHAmTD5nLcLiyyjX/hcqHYu+PRLakCiThCTb3ZanLWQ/zRl
         C+N+DbFKY7jJ23YDMpX4gqHzYYeGWqdHvzSj1hNCJne8EyJOejNbV4m+NBHJTfAZ53qj
         LA4zdVEotChLol+fnQ5SFH9a55rUpyVD63KJeqi9Cw7BKWlbV/UKwUpEIhhBwd8BIxbF
         LfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558812; x=1750163612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4aASIZHuidOjhLiw96O1OXVywQzoanXq7WKY8AyplZE=;
        b=HTvr79g7tuh/pZFera4WQh3swuM75tQNgH5JJgS82jD2NRNVSzbVeXbLQWJekhxEjb
         Z7a1siSDJXbrHOV3IBzxeqbOZZfLy0ZCrNRxMisSzQ38f8xyRNZQNtO8nVFdjIFpzGaS
         b5e0FhCZH++FcQDdqtQNqDmyU+A3MDfkQ775wra1UkkJGakbkOFn1d88IFleGR+oKUYw
         pMiSdWFoNpTP5JOwFRA/DqSuXwDsX1cG/jXBlwTxeUxlwvfZYrZcPPybJLhJ6Xj86K9G
         S+gGdLbvGXmPq4vEmLavcfbaMB7EjEwd9XBMbs4utAB3jhwBxNlOJFnI952I5nQyoKC6
         FexQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD8unG8a1CS0mk2EoIpMFIU6/m0Cdwht0D9WeSyxziJCmBATaoIMHvmpJRD/a9Rdf33Adm6o27E9Yn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpqrj5aeBbBq3ECA/zcmSAueAdigUMvPJCOeKno+cJG5JDj67/
	Ibl9+r3rH3acMtcwoS/5XkqSpHrSirae1r/RYG6GkLvN7F/dRk5mZtnXt5Y2NaaL3HY=
X-Gm-Gg: ASbGncuChOJu2YuaC4BVEzIMB6d8wm1zZGBbYLJRS4+Cu06d0mqyqAix+lsYaygk4Pc
	DR5ipBrFysn+FT3eSqZIRpXCa4m1IizAqa3e/tCWsfosQPiV0xkDl8HPShuc4ECGXHSa/NjHGqL
	gVeV1ZpjrLaPWv3tab8VKXhOzvafsjejeCUy/Hku2JepvGUg7iy59ACBTXeyg+kFgOcIH90v2IB
	mLk0+UdQBnBqH1YRPcZZVuI013abkpUIc/A1iH62A6hRd+MR54kvOkynSR41IiRotD2cy7XQMKO
	s4F29cXfO8rvlmYP6tKDbL3eiFnLTZnjoe5E3t7mf0hcJ5hQgue/cA==
X-Google-Smtp-Source: AGHT+IEbu/ISHzm391WeAgpZgQpxCQMU7l5sRhpe0Dp2uNZQ9BZI4WIWzmuf7o2/3fpe+9gfV/kFtg==
X-Received: by 2002:a05:6000:40de:b0:3a5:26eb:b4af with SMTP id ffacd0b85a97d-3a53189b56fmr12109336f8f.18.1749558812389;
        Tue, 10 Jun 2025 05:33:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:19 +0200
Subject: [PATCH 09/12] gpio: npcm-sgpio: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-9-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=i/xwhpR2l/6SdoE5H3/TW1iFI1pUsif0v71k7JJeqSc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYQx97BIIpnbWW8Jl0scOnlXA7m5aZIgz1E2
 ednyGv/bMaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmEAAKCRARpy6gFHHX
 cq0GEACXL/OUOB5vGKp6qF7twwq2LopBjxJ+a5zMR6wQvdYfBG9QBDMmaPSjuf2kmkUtUbYu7HA
 Z1FBKLRGSyx1X3/aaozewD1qjyFA6BkSTZNtKnHHfFciGdkPfYwzAX9dewnRrjYmGX2RAk9ab4e
 VC9jF4zGQI+ngGuFjOCR9B0GScsixBBssQZWPx/+mzwukpk5PSJhpPvOSlfJzvaG3S7/9LenY3i
 pIK9rDUEeMNityyi7CSMetFo905zRiQvyOHu42Wn4GMCKaJgXg/wVA2eFw3JOFTg1S9deQKieKa
 LE2ed9MQ9rCTGm11TRojU7n44J9uERZp2a3XOuVBWzzyL7woBfFsFkzlB4IGf0whMN72a8zT18k
 wvRyZKhQPTk9EDwIQrqjDA+BhifztuHVUog4jPZq4XzFYBhGmE3SjABwmAdeoJxLCO/vbmNhLPk
 843qnKqNHnzQaryTQggkzqEB+E7vcapL8cNvyCLhIP3Tu7PPt0ucxtKA/gTsjLQ5BCoy7qvv6md
 4ZAH+iSl/g/8OCXIpZ8susfIxxvVBcI+FtWCvNWRFB3GwFz/GVm0eZC4SYWn+8kzCc2tvzN7mHq
 f4OvLY1WFa2WQtksGlajI7JxVWIJlosIN7MPl/2Fh1XVD9Zl+evDL2mc6wIWcMGBUyCJql3EvIK
 KZdOoABhp/23yRA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-npcm-sgpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sgpio.c
index 26057061454348d383129267e8bb0b8c506ea5c1..b3953d1ae8af45f4bce9b799434547cd8770d9df 100644
--- a/drivers/gpio/gpio-npcm-sgpio.c
+++ b/drivers/gpio/gpio-npcm-sgpio.c
@@ -226,7 +226,7 @@ static int npcm_sgpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static void npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
+static int npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
 	const struct  npcm_sgpio_bank *bank = offset_to_bank(offset);
@@ -242,6 +242,8 @@ static void npcm_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 		reg &= ~BIT(GPIO_BIT(offset));
 
 	iowrite8(reg, addr);
+
+	return 0;
 }
 
 static int npcm_sgpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -546,7 +548,7 @@ static int npcm_sgpio_probe(struct platform_device *pdev)
 	gpio->chip.direction_output = npcm_sgpio_dir_out;
 	gpio->chip.get_direction = npcm_sgpio_get_direction;
 	gpio->chip.get = npcm_sgpio_get;
-	gpio->chip.set = npcm_sgpio_set;
+	gpio->chip.set_rv = npcm_sgpio_set;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
 

-- 
2.48.1


