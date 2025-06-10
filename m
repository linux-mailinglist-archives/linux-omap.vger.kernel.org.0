Return-Path: <linux-omap+bounces-3811-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDDBAD3679
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 14:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B1C27AA441
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 12:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6291C298248;
	Tue, 10 Jun 2025 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ETQA6UWi"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F182296166
	for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 12:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558813; cv=none; b=QmhfnSGgaSmThpVi27dzwKr0qfoRekJrj/A3bJW3J5IW9ZpaavgFdnF1ldmiHBHg/+jkPiPrMe5Mimi35e9PTwSqdizm28XPcq2CcOeFCA5Y9MC8inNtnbv931qxXmt3J6JJnIfaD3zT/trB+7alETP7SCU80R4zJvDSjgp1JP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558813; c=relaxed/simple;
	bh=0Q/v23KkvgGRE/jqhFxsdYJoykX4nfP6MLHY3t3sq1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rZ6KoqpCT4WQYJPNtF+w5lBBsFHvZNfyImepZ9SmrSMVRj+i7EfMBQ4Tq+UFRdPUHIr+dQneXgtRh2d0Lo4gIAkfn3eFjUVl+IDFzhTKKj7RkoZDVwjNETGwiygRf7h0qbbFwdJUPvNXgyFYmgMtFrh8AhR/pWSyJZBEfxC/ynM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ETQA6UWi; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so2122442f8f.3
        for <linux-omap@vger.kernel.org>; Tue, 10 Jun 2025 05:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558810; x=1750163610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxLzYZOTSdUIwG/dDdz19oBo7jupe4wC7PnSCC6qO4k=;
        b=ETQA6UWiKQEXG9Z+/FiRbYonJbwJ6P39Qm1fk+FCdfyRFmmIzNMLdSLFDRpVWEL2uM
         exQgN8W2UnqdUgBaN4Cuhou16qdcMuXfPuN1widJxYbeIHgSaYglMo9sHPW5FgazhUbv
         Gl7hJevfTuzpMjPVWuli8/zxmsNYQ1opGSG2W9SrtyGmUyVP/fWkQr1tA7MpVLHqA2TA
         BJhYGipMKvl0DZebSIV2GH/7S0ea0+pZFPFyrU+cIid/CxV8fEjd4Fd+sI/Zqu1YkRAd
         ygAFPvYmTdhZlLOMpvXKz9nmZmT+L2bSNVr87UBwlz5K38N17VZVGvAbXdrKyr85c8cm
         jkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558810; x=1750163610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxLzYZOTSdUIwG/dDdz19oBo7jupe4wC7PnSCC6qO4k=;
        b=qXqar40zKE2iqvACH5+AmTLJ4I1hHNIHcCzi2l67EbpM13umhT/iBjeOvy3a/qNBYx
         zGleA1c1eHLBVSejr7INvkFZ+vpnww2mar9h32VTWllxx76ECzG9J8zSaSApxJx8g1ro
         nrjUctqyTREvseaV591ZKiyGw6Gy4Jp5p/fEamYwMMP8bPmEs3dMHgEdZaEFrZvtOOwW
         Z3bTeBX6vWJUQmsFzM1stdzVDOF8MQzR6k3lsACSB9ZBClt5M4jyur+jZdpqw4AJJAr9
         +yCTLQAUi8DBxuhtyl2rlYh2Owi5WHqswBLcY7CYtwKKB4nrGd3b61aYRT0q3Ob+z3+S
         gkTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdWI1EzPDkoCbgw/PRyIpwMI0Qv7ErxvFPKXeTNkFLtim1hen4h48a+LprXdxWGTHSxzgkUIM4t2z6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7rWj0tL9d13+Zjm3Gp6iiqzBRUdt3AvrIHJ7xBucFRjsdUUVO
	xXPS5wA+vBkomEyc84/R0o+7PgGvMkpT9CrXMimGXJxuAx/AcDWFLqB7K33TeeRIYiM=
X-Gm-Gg: ASbGncua/p3z7flhD9GQ55cHF3cc5VJsod+guBvuD55yKxwI49/Tc3tW5ClTjo227+R
	IFZfIk01uSR7MS55zP9FfPZbda/jrMrcK7fiMBhKojB3MRb4vAzJAv56sEpLziToN3WiUWT/JR0
	QdZlyK4Qat7/DcbPqT98+7iUGCTu7Mt6HfSUtiD9Xd01Q2M+A4Mox1ctSNu2jfp5a8oYAHzHWVc
	C9/TsOlT3m5iYP3ljVwOQ5NvHWaMPHtUGSIY3S9qtMMbp4J6rQG8H60h8QzPWgNaHs8+hFTuA6Z
	gSGK5VHdmZswmUkLEDJqqyX89gcLwWdc5hAraJSr9EZuctK4nyL0aw==
X-Google-Smtp-Source: AGHT+IGf24xBNhS/K1ZbKglpgFrm46LA9T2wVtmfcyS7odITVr/pCroc70/4xTfamtgoFjylllZKEA==
X-Received: by 2002:a05:6000:4205:b0:3a3:7987:945f with SMTP id ffacd0b85a97d-3a531ced4e1mr13192942f8f.57.1749558810273;
        Tue, 10 Jun 2025 05:33:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:17 +0200
Subject: [PATCH 07/12] gpio: msc313: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-7-3a9a3c1472ff@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZmOs9Rn2Ofc7KtPnQgf3fHbIJejOw5G9OgMOgcVcOTU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYPS6rMr9JHakl/jEzS6gu3nnJM5OwNcNdkw
 pcSFpc7hKKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDwAKCRARpy6gFHHX
 cvrUD/9GpMmudRkoErJ8Jc3wJWG5D7s/6ppxZ4bAKfLPHuIf3cullW2xXMdGEisXFnYba5VEHpt
 VlXc3SJRZDpOEvM0F3v/+jUIZiuOD6pvawQnW/qxtq/Ozv1UfpKrpuN1fRrh7pL2XMWCAwwRnUw
 aBDKVyyJlBxP2MtvGqRaa982whCS2SZd6kG22Dddodz3o3nAzrh2kTO1S+fWFysy1uyhRTTIlpQ
 cXCVQ1wQMGQQOX44beuLfNlLd9SEPnqHDgf0Lj3MudgUqT22IGiNR10kwDiB3wQ1raD/uYBJnzl
 8vxKAn3c0fCywJcvMFP6K8S2ZAHGytispiNwpf8Pa9l06WV5vZCyzZswFKsDYk8zO45sEPi2IYK
 skKkUVLEkgJycvjqe9Z0PM21t3y0NVWKx5KjMcH6+hefemyBEzaHcFyl5ARdxki12GE3lCixf8f
 RHBvPI0sed+6K74ffsqTELAk4EffI6LaNvWOSEG6F6OvP91+rEkaHy/kCIJFTo7DMnnu+SKtCLB
 ghIRIU0nZmltloZYikzkZfcgB8uYVjw5f42C9UGksap9z2d2juN4inFBf0R8psL7OAHQB7occ8w
 nuAi7PvG6Lmjmnv+Hq6TmLCI75PEi8A9HehvhBXXbFG1lUF0a3ELPJqeFHbc8O3ZLGrwJsZY5KR
 oWc3lgWCenglKuA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-msc313.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index 6db9e469e0dc254e791d497b89a4c6d329d0add4..992339a89d19840fc03ccf849972a83cb86415ae 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -486,7 +486,7 @@ struct msc313_gpio {
 	u8 *saved;
 };
 
-static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct msc313_gpio *gpio = gpiochip_get_data(chip);
 	u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
@@ -497,6 +497,8 @@ static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int val
 		gpioreg &= ~MSC313_GPIO_OUT;
 
 	writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
+
+	return 0;
 }
 
 static int msc313_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -656,7 +658,7 @@ static int msc313_gpio_probe(struct platform_device *pdev)
 	gpiochip->direction_input = msc313_gpio_direction_input;
 	gpiochip->direction_output = msc313_gpio_direction_output;
 	gpiochip->get = msc313_gpio_get;
-	gpiochip->set = msc313_gpio_set;
+	gpiochip->set_rv = msc313_gpio_set;
 	gpiochip->base = -1;
 	gpiochip->ngpio = gpio->gpio_data->num;
 	gpiochip->names = gpio->gpio_data->names;

-- 
2.48.1


