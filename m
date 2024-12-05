Return-Path: <linux-omap+bounces-2776-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF839E54F9
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 13:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED5D82863B8
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 12:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFECC21773C;
	Thu,  5 Dec 2024 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="r+XJP+7Q"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B370021773E
	for <linux-omap@vger.kernel.org>; Thu,  5 Dec 2024 12:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733400383; cv=none; b=CYsSszmIvm26Y+2L2Uw2fKBi+RHabT2RpbMaQUiStJ30W+XSYYkaAKqQ7sLROdRv26gHOcme27sSrKTsC8qHVcJA/2Dkmri7l4XPiEIG0hQzLSvmKxhxd4sKFRJL6VcoD5w5ess30Ru7e+VSsndmzEWsna1w0w3j1UI61gqjOwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733400383; c=relaxed/simple;
	bh=Bn5nh3l4ebh5/olUofQ4qdBb2ptYnUXgTMoMswxG7Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rw39j5JMPPyEijgzQcISaa4Ty6fb2p0zzutV53+W9tbT+OokgXwlisWkLLXVsx4ZbIVccKWdfXNtsiwUOxabVcQN0wFdK+u7EMje35vowILlXhvjZEx528SA7Vk9bxSPG8K8VW6YtRCAWz2iW9M+BWQ0NRR2kh8dicicm3zGvN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=r+XJP+7Q; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385eed29d17so725377f8f.0
        for <linux-omap@vger.kernel.org>; Thu, 05 Dec 2024 04:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733400380; x=1734005180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUEfRaEMpC37FH4e73tDnuIDcsomn+OI0n1MlB9szUo=;
        b=r+XJP+7QXzi2npInt0NWAwuYM2oUIaBnB6FjrkJYZvmRk31ygCtrV7k/BeeJUO4EfC
         rXixwztz7T7Y8nFZvY6d+RlzvAVtw/B8TIfyIk5KbkfHFf5uBdzr7zr+F88N8XiauQwJ
         RQioPk5T7pptwxQTQBn2blsxdiutb1oyffqqNgGhFwhpYmmdnwAllBZyMf9kt1U9OsS3
         DS1E/oNP9WAdmDwwlgIeLi0m5PCpz4enbYlQpkepTWIbF36ApTD04Y100NbvqbzeRRpp
         LZcREr+70eRGJie6ToPLPM2VpbqnyetpuFThN7Vt6Cfmoax4qKr3hnQ5blcXR5s98kGk
         7Vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733400380; x=1734005180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUEfRaEMpC37FH4e73tDnuIDcsomn+OI0n1MlB9szUo=;
        b=FYscXc++AhRUWnScFfp5cuEr/wGpMcVWWadrNiewLhKnQ8hOty5Zwz+VKPW6NmTktZ
         okqNHet6OWNUexb8f0hAQdt95oSFy/SGuRC8xoxAsKGcC/WxzcCuKjaVMy007Bhyq+Hk
         t1PNTggkyBtJHWPEy7bJtM4Je+shJ7jsSFsewzvYjqMUR9T45TbUTEg0CU6vuflaMFej
         UwbM4mS0o4cGrzjyE7KKOQtcEL/YsyDEedr1AJrqUbMqtoM/ODzwSk+fFZ7r736CqYlL
         sJe6Pwea0qt8V00nYWEWUSdAmn5FVfdDhHnsr4L49Xpa1dr58sJZrMKxARVFNV8B79+T
         WOYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaXPoBgQkJolhhPw59ZVGV3TtB8jZ45GjE68I7QhoU7vGCxH5tr+yTX9RZAn6kxz8pqphQe3euJcT6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/WrqKliIBr9axkloCL9DPiQW/86fFDamuADsMm9bDHKksSTGL
	jMJeKjm9E1f87m5l5LNL5MBQWP+qoPnQWD1LZLub0aMXuNhtyqir2ZI9/s1tP14=
X-Gm-Gg: ASbGncuPMnV9qHZJiYGoWJwIMJiB1QPTncG0TfjVymDvb4Ccd/fjE3FpWQboaWcivC7
	QRkWf0FeYiGCmizMrhnR0WwgAAghymLfvCRMLYxL9FzBotaojD/EN3PY7Thehk+M+qbzQFbZcGD
	MNPgmnAuPl09Md8wvCXfRksdtMdl83L4xH7NjvxRPSxpE2I0SSZlbqa2VGFvykY4AbjEFfbovn9
	fUXQ27ruF/f2K4xIR0x580WN3A1mEcZsL3hX7Y5Pu7M1lME
X-Google-Smtp-Source: AGHT+IF+ZQJT8y1BDmiiQQKVW9pOPfo74S02/fDg2OSwbblovWA/gnmYx8QoRpzq3stAqcTA8YOZ3A==
X-Received: by 2002:a5d:5f45:0:b0:385:fa26:f0d8 with SMTP id ffacd0b85a97d-385fd3f20b9mr7586700f8f.8.1733400379667;
        Thu, 05 Dec 2024 04:06:19 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:c2c8:33f:e860])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da113508sm21934095e9.35.2024.12.05.04.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 04:06:19 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andrew Davis <afd@ti.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v2 2/2] gpio: omap: save two lines by using devm_clk_get_prepared()
Date: Thu,  5 Dec 2024 13:06:10 +0100
Message-ID: <20241205120610.40644-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205120610.40644-1-brgl@bgdev.pl>
References: <20241205120610.40644-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We can drop the else branch if we get the clock already prepared using
the relevant helper.

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-omap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 54c4bfdccf568..57d299d5d0b16 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1449,13 +1449,11 @@ static int omap_gpio_probe(struct platform_device *pdev)
 	}
 
 	if (bank->dbck_flag) {
-		bank->dbck = devm_clk_get(dev, "dbclk");
+		bank->dbck = devm_clk_get_prepared(dev, "dbclk");
 		if (IS_ERR(bank->dbck)) {
 			dev_err(dev,
 				"Could not get gpio dbck. Disable debounce\n");
 			bank->dbck_flag = false;
-		} else {
-			clk_prepare(bank->dbck);
 		}
 	}
 
-- 
2.45.2


