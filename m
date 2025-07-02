Return-Path: <linux-omap+bounces-4025-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C07AF0F88
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jul 2025 11:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F96F4A5B12
	for <lists+linux-omap@lfdr.de>; Wed,  2 Jul 2025 09:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0434424BD00;
	Wed,  2 Jul 2025 09:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vy/dlG9x"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776E92494F8
	for <linux-omap@vger.kernel.org>; Wed,  2 Jul 2025 09:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447660; cv=none; b=EKELTr/zdduv+T0bFx/QkZcmBCUeFkJeQxzo2ePB5ydf/2lgNfQCVLYoo9adkj13rrnjHuZpqLXPIeqA7o8LUDSTDKdH6peIPEQX7FV4eKPt3l3CzBeIxiMaQbkYn7uODho/njEG7BvPXHqsCgm6sIKFLgZCGXLqj2hA92j5xss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447660; c=relaxed/simple;
	bh=PnY3cDY0PN7ZXV/E8YltXHdHfPXrlFGAY0vU2G2n/fI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMC1iNs/5d1X8z8AGBJY3KYt+s80v8P4oVCuufnTKiJnAXU6xt3IEUIHuE8k/++DF4pWwFroB3PvQstCNKEz07+CiBAhA2gMNLZDzOhgGTBfyUocB+koMQjD7u6MEwxztgP/WU322N6ty+sQza8C2nvh0C6Wouy+YjYwB9+gDzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vy/dlG9x; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45377776935so49075635e9.3
        for <linux-omap@vger.kernel.org>; Wed, 02 Jul 2025 02:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447656; x=1752052456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUEUklA3BurrfmixuDf8vbdIh4R5xkMKm43bDMdhoHw=;
        b=vy/dlG9xf0c8B46mY4RGKzdRBQTm9deO6X/lUi10TZP+GMqX55GURFv6H0QfGvTsMs
         tUJFMKAJnsP+kh3PyZeYgXHtSLJJr5b7RYL8nds8In7Ax6APJW/KkG5/VPmywdqfc5PW
         kmqi2pzx+3dFXlu5mZcIOHBD0v+bYQlXAPFA+FVu04f8n7kz+Rc1uwjkrWqc4SBjuN5S
         N3H/2gTmEr9naXhm8R4gosAAZXLtN2adq3keIaqFx/ZOoDu2VsxHxHAEoV4Yq9XJ1Iia
         y02PEYkAEB1EJykSyo/hnQDR4V2YImNR6yV95lwNhBapFhINlvMEuakf2Lfkl90LgFIT
         Sn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447656; x=1752052456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUEUklA3BurrfmixuDf8vbdIh4R5xkMKm43bDMdhoHw=;
        b=QY/RqFKrs7JOvK5Fv51YHRbFOZkQKhr3FDi+shLeBSJhffE6v04DWjmfn6Rbz4h472
         tDOurtGwUxczP9U/8tUjB458JEH2J56P2xMBkQFdIr14BEbob8LZ1YzhieTQRykcaCN8
         KxEgdZd4zm1V8K5IPZ9fAmJD/eQiTs+KaGJrcvwgN8kSpyBi9P0SMPLqr2jVHgUKe3zi
         cPubZXHFy/9y3dqCYXtQzB23JHRr+tif1FUqRuCb294MY2BTE54IZt2BhJCw1LN7zmin
         o05SK3VnzWWsFBr7zHcUqV6z1rnnnjfpiPfwf+weDRpmaxB765j/57Ebs8dOg6cbd+wQ
         TxtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0o6wOgJRP8ktRmtB729if1mlEsB62ggwhoyYhMv9emmNAvs3EPJjR7mL1ySX44kU4lmsJmcsgATZk@vger.kernel.org
X-Gm-Message-State: AOJu0YzvyKPGGdNrcxyrErpKQHOOphaZGjG0Yz7jCQPbSzxMlucX6qRB
	wDYhc6/IcDYFE8KDTjJcCn0zMS33noc4fvzDgqMuNhuQ5zVEprrKuQWnIsqNTUYt36k=
X-Gm-Gg: ASbGncv9ZNqKSh06aY88kbD8NkuKU+et0IkbbH7Gu+QBkwJJ8pGSipwQs8AJWdEqR3E
	2jX3+1Wlm4KGO2Nd4K4OcTIUbNiqGCsWz85MnOpMC6FwEkw6I7gcxirp6f+12gPFhKMpWCCwB1+
	OFxMcsZfe86D+GbFcT0m+/ORH+XmA8puytCuAn4GQ/CifprktfGgIpyCZNeMY6hxZotyIwH3Cul
	oZ13DukSUqDFM+qwyVU6NBXBvQah9/9c7uzuUzhaMpXOa0BZRgt2xVXJX6QPWo/4lpbAtl71yup
	RD6DiAoTaCdMwKgRPcrQq6MJJgkKG0vcaBN0AUQEjsAhez1DR598q1qtAeUPfew0
X-Google-Smtp-Source: AGHT+IF3yQMlh0CO5QqkB989AOdLnKhbtuXBds/WRv6FgUi0LgiNCmdiY8uDqmLHTmv20hYB6TXs1w==
X-Received: by 2002:a05:600c:1d04:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-454a5629234mr9687425e9.6.1751447655450;
        Wed, 02 Jul 2025 02:14:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:14:05 +0200
Subject: [PATCH 04/12] gpio: thunderx: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-4-0d23be74f71d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2578;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=G0fFtgDkg5d/ZDEdFwzcLRDF+AwziOGhhqiJcYzEKbY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhg2rri/An++ouHF7TQgAz2SF90haXoniwux
 ALfVfrEVYaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4YAAKCRARpy6gFHHX
 crIGEAC0qKug87b46x+VLSigXbJbceWR3kG43qHFO0d16GdoIqcjtz8VjbidjhFaHaqCeMdW3Pe
 EKYDrLn4aqfAry1xsN+Scj/GZzNejdpeRoj6/NPzvDW4MCvMy4cQ/NFbzvjjWcPitQKHm7EROzf
 bhorte02dyQJ5J1/jet2QiJm7Wuo0Znx0qARXegBGnbxHbsFqbWfSXIxHLCIlosP62HjW/1KLIl
 ee1WLkDN/y+xM8s13bXXDkFqDSkvknLUHZH2ALj87/DRKJlnKeIFdphgdsnjqntm44QWhJCfrdf
 +yKPdA5su/Npk8zEe6G7zl2p7j/omH2QNBOUM8+C0+H/fpr9LrqwKL+lG72cEazWvUoNrD4cDU/
 tH0cAKmfyaZI6ZgWJypTVByI+nWlK96gB0rnj7uufHfFmveMpwoWuQ68/s6T/2EeoxxERdxacDy
 GSSy/trn/HRpBshIiNhyLfWoKQVFjGRzUA76G7KynuCdgUAadN/PJ7ygz9RkBlXtm2JR09jAmEE
 Ptdm7h4j7C8BJhsIwrv46BBJH+rEpK+vjcvIII79jc5+xWK4Wmez7nMfFSvN7dIvgiDoQ7feHjr
 tryHQWIg4JfRjiZdm9q5K7hWdzSYdmjtaNThSb+Y+1Eds3UoXVsRRGUFlBh0C9so9KBOGjuQYsE
 El9TKafigFHQ2fA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-thunderx.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index 5b851e904c11f5381cd4890828ecd956b78e2f00..eb6a1f0279c09a832ac71d76de8f696d9c28dd17 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -116,8 +116,8 @@ static int thunderx_gpio_dir_in(struct gpio_chip *chip, unsigned int line)
 	return 0;
 }
 
-static void thunderx_gpio_set(struct gpio_chip *chip, unsigned int line,
-			      int value)
+static int thunderx_gpio_set(struct gpio_chip *chip, unsigned int line,
+			     int value)
 {
 	struct thunderx_gpio *txgpio = gpiochip_get_data(chip);
 	int bank = line / 64;
@@ -127,6 +127,8 @@ static void thunderx_gpio_set(struct gpio_chip *chip, unsigned int line,
 		(bank * GPIO_2ND_BANK) + (value ? GPIO_TX_SET : GPIO_TX_CLR);
 
 	writeq(BIT_ULL(bank_bit), reg);
+
+	return 0;
 }
 
 static int thunderx_gpio_dir_out(struct gpio_chip *chip, unsigned int line,
@@ -269,9 +271,9 @@ static int thunderx_gpio_get(struct gpio_chip *chip, unsigned int line)
 		return masked_bits != 0;
 }
 
-static void thunderx_gpio_set_multiple(struct gpio_chip *chip,
-				       unsigned long *mask,
-				       unsigned long *bits)
+static int thunderx_gpio_set_multiple(struct gpio_chip *chip,
+				      unsigned long *mask,
+				      unsigned long *bits)
 {
 	int bank;
 	u64 set_bits, clear_bits;
@@ -283,6 +285,8 @@ static void thunderx_gpio_set_multiple(struct gpio_chip *chip,
 		writeq(set_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GPIO_TX_SET);
 		writeq(clear_bits, txgpio->register_base + (bank * GPIO_2ND_BANK) + GPIO_TX_CLR);
 	}
+
+	return 0;
 }
 
 static void thunderx_gpio_irq_ack(struct irq_data *d)
@@ -529,8 +533,8 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 	chip->direction_input = thunderx_gpio_dir_in;
 	chip->get = thunderx_gpio_get;
 	chip->direction_output = thunderx_gpio_dir_out;
-	chip->set = thunderx_gpio_set;
-	chip->set_multiple = thunderx_gpio_set_multiple;
+	chip->set_rv = thunderx_gpio_set;
+	chip->set_multiple_rv = thunderx_gpio_set_multiple;
 	chip->set_config = thunderx_gpio_set_config;
 	girq = &chip->irq;
 	gpio_irq_chip_set_chip(girq, &thunderx_gpio_irq_chip);

-- 
2.48.1


