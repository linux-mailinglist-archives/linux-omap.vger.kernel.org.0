Return-Path: <linux-omap+bounces-3997-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4712CAEF750
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jul 2025 13:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5AAC189845C
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jul 2025 11:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C861274672;
	Tue,  1 Jul 2025 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JK+hsgvm"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51178274642
	for <linux-omap@vger.kernel.org>; Tue,  1 Jul 2025 11:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370591; cv=none; b=caceKuRm+4R9qu0ojllF6LgVoOHiBXEdk39lce+hp/a6Km0OojmFXhgXEfM6pBf4XeGovTgtAYC6g+2Dh0wiQ+m8ZLoth+0oIiLh3py8dySFW2eCuyXNkh/Foax3unEvgtmns2nZyu/m7qD1iuR9M27roxGSDYGfybLKYR9vqDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370591; c=relaxed/simple;
	bh=hcIDtxH5Hejd56JnbLxX/DThNyqYz5aQPdB6DwPdGeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sz/Qkmh51uYDx/zK3n8mhwq0ESbbM8hvbSSt4zFGFNhIEqCLd5sqOqRc+VfvVHZcwmTEh+p5Hzwm6sNQqE9gz7shJnOO883mumhZIAP3BBZrD0nlDuN2i0CNFd/7b2OJ6wERopPwfOVZ4uRKIV7ad+sLsIRhlhn4CoWPMeKjbrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JK+hsgvm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453066fad06so37576695e9.2
        for <linux-omap@vger.kernel.org>; Tue, 01 Jul 2025 04:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751370587; x=1751975387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQhO5CK7xr+BRbw716ywq43T0E2MyjcZyeM9R805cuU=;
        b=JK+hsgvmHGPGMzaGjpURaXHNNqtTVDUXRfyPTC/sAz/RPqkv4MMaTJGkqTCrq9Y4Rr
         ofKY3EKFXjEyDOnExy3nmM6RwoPZr6z0C2DcThcZhCIBucSaSqx0j8/SyurHwNrPcOBk
         WGLC5CUInJpwL816VDOpXUwoIjpBIuRvmWnlxq0tB4VPhk4VJP5kNoMUUL9x1YecV31t
         j/bWQzzzBjGjkQnA8EaFYY0YBwzTT9TAvjoSg53HzhUPPGaFz+bgmR/HwoPWGP+h9xUz
         0bCv/FmI3Gqvxawgb99YQ1BLkh7JsUCU6tw1+pk+E4hn0JOYxEdtAnfP2UugjN4lGjb1
         IiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370587; x=1751975387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQhO5CK7xr+BRbw716ywq43T0E2MyjcZyeM9R805cuU=;
        b=lgR5djiFPzWhZoacqi8pvvVZCS4oSuY90Gos/kWCAI42sOS3lW1rc5Q9TFnZefG1IB
         Szaz0FV8JHI0amKtg9U0U59rSOA4LVO1Xl/GrAYjjscGTSBZr0b/iqcevUbvuZRcmmoD
         yq1Dc6B+Av4OxakFW0jxb6kgc6aYsORbLZT3p+AbYel4Ngbu5qv59xhQWaOuIrlAgnqV
         1KUg6EAj2LTsK5EBsnso4LavsiaPWOl6ynmGW4q6aY29dWWrRDL0K0X/GzMCRfu7EgaO
         ixb9CBDaShVyJBAmz/L5zS386vBiYPvzsEWelLj4Pd9UoFGz8T2c0D0k9VYRl2rQjjqD
         DCyA==
X-Forwarded-Encrypted: i=1; AJvYcCXEk6wAXKDb9uaU7AFxBny0B24+36SunrmrTcPMJC/ZeZHeQLssRthQ3menk1lWxQSnA9I+2uRQylkt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7CEVHFU06qexDzgKsmrGbsegJJwwbm4cDy0ErmrDnsyIICBwL
	WmD1LOuFIGlm/ZDqnGcwfFwbt0EO+KYgX9ODuU+xro8lTzU7mCYQapZ2BgJZS8d+FvLUUwCvh9i
	YfoAC5ls=
X-Gm-Gg: ASbGncuT3xyZCmfT6pRtO4kvQ6NX4O4u7xbVMFpMHHdVank3T/mxghBW9PdL/DPa26Q
	vKg+ILkogg6jmgajYsav6g7ukqdBtjzOfi0u/kqmQGcosa1f9AKj+8ormqtkONTyzOJfWnfTkOh
	KXaWIIm4ARycfqyOJ9tHvciT8CXp8YkyRjc7Ndnlk/oxeEorCaadfhs9iYY5rpVKz2c7vd6LKQK
	1aj6D3hMTWSLSXvdnDzQThZ+dKFuulJs9DGVeeZdSE3Lk+IXH2MH7SIzwCHZZNkBegsYVyg73Ru
	KfKGL4H59ajqRXhykz0V1R/k+WP6X7LCFVHmssrjpZwBZzB+rnwZ1w==
X-Google-Smtp-Source: AGHT+IF5Sg0B8tl+fCojf4YIFaidiXIPVi9KuYAYLaIRKEo99mAjGGdG9ilSXjaOXUtGQt6ATnpQAg==
X-Received: by 2002:a05:600c:c4ac:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-4538ee85615mr149734825e9.22.1751370586972;
        Tue, 01 Jul 2025 04:49:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm193988925e9.5.2025.07.01.04.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:49:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 01 Jul 2025 13:49:35 +0200
Subject: [PATCH RFT v2 1/6] gpio: mmio: drop the big-endian platform device
 variant
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-gpio-mmio-pdata-v2-1-ebf34d273497@linaro.org>
References: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
In-Reply-To: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=793;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EQNCHQeiRFrJidx0AqHxdmYPY25oaY45CVK9LNBnNoo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY8tW4Xfv3MA0u8w4cDlEXM5V9JxRuYxPfOjsy
 yLM5bXKzu+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGPLVgAKCRARpy6gFHHX
 ctvmEAC99TfqwF/82KeqILREi97Bf5pbCXyaAEUEuay+H27Gu852eYClS5j5nY4cOxII3JXlMiR
 5osHJY4CqYj+4f4xJ4/xeWVlxtqzVO4F3mNIwOA2zE/z/dhWhmlX5MIxUuxXdU6yY2ueLhlIDLq
 R3EDniSnD82XNsSesTrDmou7rOJgvn2AMCozSZPybgMvlc9fO1ZJ+9RNSKo8YN0sgru2Qk3qJCY
 QhE6Jlkr1z20e6yB4KwKoUwAq/ACWytH9o147f7iHZBurMkuXT6C44n1EEUJycUYEO6AxfYB9vz
 R+ed6SNGGOQpPw1vECX04T7HjxlwsVmWGrRHkM6kf+Z+llfzbnNhT3fSEErJjxNuzjRF4dfbFGT
 zpBQ3K2ijN8t44h93x4LYnxZpL7Mccj2HzYJUzfF76bVweV7Dziy3vTBTBdJ1ja60Ih0IeEDtQw
 E0//k175j2e4FnlrWemRr6HOcypAyh/mlldxn1YxS1D1xgDtVNRhCU0/zeLq86SlHJ05Xqt8+8/
 Jed2xmlucx1cpfua2QMuI9iYpNaib5jWx64F1QSZLeksCrl4V1mZ+Fsf7ENy8qR0l3ly0TAZeGH
 EfCcHNhMYBKD2h6aWd01IUbqRn0dCE+AbOrB9A63Kro32BDbhCLZGMXu/yJf6qmksS43kv7eGaR
 /2rqW24aN5W8lWA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are no more users of the "basic-mmio-gpio-be" platform device ID
in the kernel. We can safely drop it.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 08466e123818e958755fe6e7baf5a4e8b8d863c1..ffe6b6f6cc9b1e9341e1c42cf8fee917e0147bf3 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -831,9 +831,6 @@ static const struct platform_device_id bgpio_id_table[] = {
 	{
 		.name		= "basic-mmio-gpio",
 		.driver_data	= 0,
-	}, {
-		.name		= "basic-mmio-gpio-be",
-		.driver_data	= BGPIOF_BIG_ENDIAN,
 	},
 	{ }
 };

-- 
2.48.1


