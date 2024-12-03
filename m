Return-Path: <linux-omap+bounces-2764-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3717A9E27D1
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 17:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06C6B167BB4
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 16:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBA31F9437;
	Tue,  3 Dec 2024 16:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dG8ZLu4m"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D2D1F8AD4
	for <linux-omap@vger.kernel.org>; Tue,  3 Dec 2024 16:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733244112; cv=none; b=AGDZ9VypZqJRvIkE0FdqLtXU4DFk0ND7/gWT4xOT98oNx8ndoWslDV6bKpiVTXDcmPRvnyiqK++GLkITda52h/vvaB4a2wIk2QK4dXmIJ3taE0ZHpG/jQGXUbZ1bSQNkEEvsKfgZ4jEo7TlsoF3doDdX65e6wrgEMj7XBy3AIj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733244112; c=relaxed/simple;
	bh=79lvtbvvn5WeBGU2jOePEenHhsByMveWov7DNrhlJkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLEyg75a3uwu1wbpAQma0hUGEP4utq489MqOWESXV7MxPA63hJjh2dO0QAi0iyx/2RgMvmSR3+XwqZzRyYouyfuvK0Bk+viOGlwNLQBI2OAv89/awSyGUTg6jG+qJzXGF69jD15SjZYy2vSAXAXQn/NTiNehFegDNMvWHjuXtwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dG8ZLu4m; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ffb0bbe9c8so67086841fa.0
        for <linux-omap@vger.kernel.org>; Tue, 03 Dec 2024 08:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733244109; x=1733848909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E78siUumg37DyNEcnTfFgRjM1O430FWuRK5MEMvIBtg=;
        b=dG8ZLu4mlAbl7q7lRFVpfPhuaUNxxUL6RZmeXxS36WjwAQkU0T2S8C5rxQX8uuV3eU
         U4IlCSIVtrSZkmK+eurG1t7Yfmt0AqQGfgOQIygNpfgue0K9LUkVWEbNHSrmgaHMdEpi
         6TXT9KZqhTJpeW9OIxRI28Bu1uFMkpG+3c+Y8QWVioIDmnYryMqFiuAbBHdzu8eJOG5E
         Pq3GueN/iS0GC5slvsgxlHJI+Pzz2Qgkl0vkCHZMPZa76PbjBrNoRxkaf+zm62I81izO
         mrJ1dsBk69P7wQitQyuJ/A/iuX62oP6nSS3nBKGqbtABMaFBXtHsc08HXF6D+L3I9swu
         zSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733244109; x=1733848909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E78siUumg37DyNEcnTfFgRjM1O430FWuRK5MEMvIBtg=;
        b=tX21n5zAa1MelU7eOHvvErMJ1tudun2aCQbdh/Mf+OsmdC9EiJBbN0HlXoz4LLD7Vk
         4F73Wy20s0pRQqCAxuocfykfNgE15o7xbxBl/eZjMEVyAzy46TidHpQfrWhYPs3d0Uts
         UexMZcKPK3fEdjqCeLVppiGDjWLi8tCSer1WBwlRQjEByZw21PRGl7aVPItDUdj66Yrn
         N/GWqc6ks6ZN/i+5HriacEEmgf7He1jZy5NgA0x7HRETJcyJAIEskaZvraHOcVwPISWV
         Ra3qOxfmk0Hazy4NEWPq1SbunbGtHrBePT1nbeTq0vkya9nb+PWZZUE8ojwc/9NM70HN
         5K9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZsd4lCpGiNKe0NlNr906mdfVDzrR7MJiWEvpvKLGoNnDUlJ1epmKSe+reIQV5/BwR5FycoOZIGnkj@vger.kernel.org
X-Gm-Message-State: AOJu0YwcSBwbWRBxC0R3tA3IFdOkUYmFIFARDTsVm0wI1lRPDewRmoXD
	SFif8BehPggi6CTShlTBUKhDQ9bS5GXkz2JF8ginZmyowR8d9n8Hvm+uSzVBOZ4=
X-Gm-Gg: ASbGncs7Hc1v04wwhuT8s2ho3knW6/St/2EoyBu92L92nSNa3PdG0UCMMHVIznuadl3
	iOo/MYC1GBcf80w9KemPrt1qN3QS/C8ror2s9v+lbV4owRWtkCE5ZkSbRRwxkBrnBFWQJ4ShAzY
	B2A9XU57LrWHV+tSTnoPpn+jXIQbInIcSB4jpLJ8jn7wsqfBayS9P2Rawqw2dK4Aa6kAHA978M2
	61hExmwcu919Om5DJ70A6XMk3XB15SLolhKYFYScUKD1U+NOrhpdtBN1H1qbfOoWmE9xqFgTzos
	ghBt3HEfrTZy9A==
X-Google-Smtp-Source: AGHT+IFx8bRQqNDnslqD1KoTl7xzEuIl2AL3peCZQQRxuOaindczpYRpHJlgrK/K9HMSqBDkd6UiiQ==
X-Received: by 2002:a2e:8e95:0:b0:300:1558:7db5 with SMTP id 38308e7fff4ca-30015587ffemr4110501fa.27.1733244109275;
        Tue, 03 Dec 2024 08:41:49 -0800 (PST)
Received: from brgl-uxlite.home (217.97.33.231.ipv4.supernova.orange.pl. [217.97.33.231])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3000b262f32sm2482161fa.4.2024.12.03.08.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 08:41:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] gpio: omap: save two lines by using devm_clk_get_prepared()
Date: Tue,  3 Dec 2024 17:41:43 +0100
Message-ID: <20241203164143.29852-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203164143.29852-1-brgl@bgdev.pl>
References: <20241203164143.29852-1-brgl@bgdev.pl>
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


