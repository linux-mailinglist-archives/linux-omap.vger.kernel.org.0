Return-Path: <linux-omap+bounces-3539-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3A2A7D5EB
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 09:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECD553BFF04
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 07:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5157B22CBD3;
	Mon,  7 Apr 2025 07:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KCJZJVK2"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3224D22B8BF
	for <linux-omap@vger.kernel.org>; Mon,  7 Apr 2025 07:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010486; cv=none; b=pEkpKYFthXTNkc7E6X9zwehWAepjubvJOust6hyN6mpVJXykaLNUeHoanHCm4tzlMPet3cbCaetHs+8d6ji0IhvOXqZ3LQnMwrPdYzrMNbIiabVlFALxg4yV4Mh/WlzKXD+M9KF8yC3xI5zctmHt2a28fVxUOY1pDMW+n5vKT0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010486; c=relaxed/simple;
	bh=NYalEJMMKkwM5Ww4yh68/Dbtgd+QTQUq4aOgUJNHaQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PTEbFP4HHQi00WML2aMgWVZ2SaZY6YRx8WVfpbA2eVpz8gEFqE3OA2Q25llqpb5JMkocciRZ21y/mfZJA8K7GFMgVnv/NqmH7lxymf7P1tMNdJtcyeIz1I2Dh0ZlrmrJgXfsYHrX3h+0OWisJO7ZveFqi8ZCKvJRQhhxFRbxgjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KCJZJVK2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso4493332f8f.0
        for <linux-omap@vger.kernel.org>; Mon, 07 Apr 2025 00:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010483; x=1744615283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqYc0+h72+XOfzEYrjjYbBXS836lkHNvrPwnLM/zXmc=;
        b=KCJZJVK2/JA5wuwxf7A4bgN46RO/tJVg0A+Uaz7ym1swbuqoQ4pL+lJZnv+I00YWlV
         o3q6PY7iYklWmuys6qNRFXXuakEOit0y0WrFdjwbr8bd7Db9jqpeVZ2YYpvin8cPwTYZ
         a7uAFbJnu4sQrLwNQrGrm4HFiMTsyEVw4xGnrILEHinLeGH1cH+izchjK2mGGmZaEd1F
         vngJ3+x4U1L3kY/WHUrR/exNOcmTzFQSozKw7L20w6WAqQJW4qPDW2/RwREJjFewQyjw
         GpklP8fj8EGliZ5ELj0E7hBLsCnIi1fDbLh41ab+sT0liMiOP0wRIeEQZJe7DrYWCi/J
         cbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010483; x=1744615283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqYc0+h72+XOfzEYrjjYbBXS836lkHNvrPwnLM/zXmc=;
        b=rhtjjiY3h9DkHsbXA4mloC0WgMkYCfePGWlUHxBRv2onu+z0aeGp84SC65iSFXID9f
         Su37RrJiRrl27ZrAVkaEx3F3ZYUgkINq6hoLPWiSh6pu/0E8aKo4BQzRGf0JRA4bko/A
         ow8wpV0EUzs6Dosh15HVumXLrJId/uJONFpTRE2cO/UlaXNLvWd9MFPtdXSIBkQSdM/S
         sqy5Azo+bvQM0Ucvpox2Uf49t5rm9T3iD+aLY7qTgzRN/iCKYN1xO/eRr/ebYTHetPOM
         spyi2Lpn3fQApvvJGVdaclw2o22B7kQAsYkbEPt6Out8AXwCTgz3ZlFgu2OllEa3cLJf
         qWtg==
X-Gm-Message-State: AOJu0YzZvAsB+zsKr4i2tDF3n2mQd8id6D3TM9GjIv8FHxnOP8IAJN5G
	/CY8QYw+7zCCOV1TFHxx0Beq7v6Ys6lyDez2PBAxPtqwDK+W1YHdk9+ZEfU2yO4=
X-Gm-Gg: ASbGncs02eBt7uinbfIfhGM0M+WYtk94T3juG3n5okhMLMpP/g0lNWTOc1UVIM3xOoZ
	Im0CT34tZ2kKbv3jO4JW/CZiAgCVqIfV/31UU0ykOK/UFQoLJIInsYRIEk+png3ygvplXQRXoKy
	cIVPQz3KibxPp7ivUyy/s67fk3S9nf3LcJ+i01VtqjGEnYcphBfCRkv6pTcFtWeBAdG21112qWD
	HYPvbY2bA7jYd8YsK4C16JY8Pq06L5P/h9G9sOLJh1jgcEjAUfRAFz5oE3iWsXXnVONVt04O3Dc
	pESCzk7ESv6JgaxlImXH9OVb0I38Ej4UmfwCGw==
X-Google-Smtp-Source: AGHT+IEylLp0D01gBNPQYuFsaV4Jo8rU+Y22RzbkmwIC8AAPBDzAqbMk4wdqcSVUg+5yIspCNTHcKw==
X-Received: by 2002:a05:6000:1447:b0:39c:30c9:815 with SMTP id ffacd0b85a97d-39d6fc49b7bmr4954083f8f.21.1744010483553;
        Mon, 07 Apr 2025 00:21:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bbd9csm119983655e9.20.2025.04.07.00.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:21:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:21:19 +0200
Subject: [PATCH 1/2] memory: omap-gpmc: use the dedicated define for GPIO
 direction
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-memory-v1-1-5ab0282a9da7@linaro.org>
References: <20250407-gpiochip-set-rv-memory-v1-0-5ab0282a9da7@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-memory-v1-0-5ab0282a9da7@linaro.org>
To: Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=W3DX/G7SfvWTY6yhl3JHraQx6MB7aIVZCQYoNdF4OR8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83zxJSSL5ijCrjtatIGOOA7cJetXi6ApKG6BS
 DnLE57D+cCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N88QAKCRARpy6gFHHX
 cmxyD/9vrVD45lvCtqQR34ByKLHJguNZHFOLXIsO/zXYrKeQptI54MwWfVo0VZbGTB+Cz8hn8CQ
 E+Sq2eaJbEk/2wKaoYlgYaQ733hwqdJVS0N3nFZ5wnYIOF0UFflwczQbn2mGZPIitpRA5zbD/ZA
 IdgBaK4+B15XnDyHzQNPRHhnnfE07WhC1sf2jAvTVDaAatpas0Qp2rDjtC6ND30+te3izE9vIyE
 IHyuw6JAWCBNQOlhQi8J46NuTc/wQrVQySG/SyOcNhaJifApA5ktHTceJo4QQqhWVdnKPEVgsSm
 7XAdvEzI9pykGIviK2Fmeiom112dSNFTc4lQdrBlEXiixe9IoB+oDHcfMkRjiiKYEIj9FFSSmco
 iGu7mQk6LiHwjxctfUdVJvV17lMxS5YP5r0xRT/aDNwCPvvqhBSg6uQC4CiMqmMWUXYbvZhpShW
 NHr8/oz0VVd6T3agK8Jvsp/dvejkqG/cEJ2WvNCGnQJ0Am+EQ9sZ5zcUe0FBO7fItwgZMBDx090
 57aX8JezFk0Fh18o9T5u/Kecs0O3ek+M61z0/LzScugP3nU9+xlBtwbZXZQcJ32IYRlZ8L0JlBE
 q8STH8oyRsAGXZjwdDioGPqBsRotEXT//qs+D0zqSYFXOySpKWF/ciM+usfQECZsEk1YseebFKy
 7Hy644u1zExqB4A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have a constant defined for this purpose in the gpio/driver.h header
so use it instead of a magic value.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/memory/omap-gpmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 53f1888cc84f..d4fe4c5a57e7 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -2376,7 +2376,7 @@ static void gpmc_probe_dt_children(struct platform_device *pdev)
 
 static int gpmc_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
-	return 1;	/* we're input only */
+	return GPIO_LINE_DIRECTION_IN; /* we're input only */
 }
 
 static int gpmc_gpio_direction_input(struct gpio_chip *chip,

-- 
2.45.2


