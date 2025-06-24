Return-Path: <linux-omap+bounces-3956-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05280AE660A
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 15:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09B193A78B0
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 13:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E9D22D9ED;
	Tue, 24 Jun 2025 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RK79lqMZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357D829994E
	for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 13:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771166; cv=none; b=lDXKOtrW7f9E2nhywHT5L7TdAiKZg4bue0w0Lzh29FChaXVkZlvSBELJlUj5RqPwUbP9e5jZqBo6fzMFuILoe9s/yRYA86G5DZ7Ohv30aMiNjAFMA/x8K1YdgVd6zjIE0scRZZC+28lVpuEsa3cAesAniO403amHlX19bQzTcIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771166; c=relaxed/simple;
	bh=3DcdRVGEsb+ACq/FtQo5TjN05SRc5Vjjh0GYhgt/kns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JKG0bAF2vwwIs7lmiyOqmZEYEkqmho8JiDf884TM0d66y0PFnaIoKWNJS7H1S47sJ1/JBTAOHU/YmnaHKM4pcKFQVAwJ9De2UrQk5WtHlPmFnsRPuBr65KrIhhXbaWjeQGpRM2/Mqq3q3CFhfXMIddQL0RFV0BNIC4F/2CJvMTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RK79lqMZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450cf214200so47985325e9.1
        for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 06:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771163; x=1751375963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tg0mRooHGRn5NykMyH/KV9HEFTTYvVA7Ojb23IHtmak=;
        b=RK79lqMZ7RudwR1jHlCxgOjsQ5gzgPUhX6EFtQsbG5a+DNeX9Brb6onbTzvnBL5n38
         DMhr1iFfkCMn34VG5DOFe41YVmx6LTjryGlwGeFvezCkyy/jnD/j+pG0W92VSap8OFI2
         EIFSKJduQgzxTe5B8U7aPJlZN9XANXC/U0FFOoNDZFeNdFvRGwGETXMrplH7kH4ZBsKI
         jhXu+2Pf+xkroX/8mdZrt4lnoT/k+ER4cjlTo/06hVMhF2fDlD7vlxnbCFAjCiSYkY7o
         QjALxcNAkJzcL6ofZJgjtUJiBVd76UXLWm4VKdRA5TADjwvP59+O6jKPR8aMSWXlqi0V
         besg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771163; x=1751375963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tg0mRooHGRn5NykMyH/KV9HEFTTYvVA7Ojb23IHtmak=;
        b=hSctCnecX/fGIxD842Xk+Ke7PLWz7bXC43ZKLN+KTnfnA9aDBXUhHoBmcjr5vqEIzL
         3ro6/pjGpc5PBaOmXhtGTwTvWk3W24dOGVzt4h8jm/6WdWeD9VyRR9ylDRMFwxyRPdPm
         +mF5pe9qaqkK80M0yP1o/LJZUuRxE5evVwpc4pvqOR+TnlhXalbh4PmkZp4I2UqSiVEx
         9Ub4d0LEGGFyhPJNfQpwnmszN3TpFJc4W4lKSFPC32h2UDtQ9oVpfTc3xh2zaFq1Q6ZC
         Jow3rGb9MoWX9lhJbU5fJ+iaM/a8r899lpWjAK1bhD5hdweJQTDft7hptzwO4z5Ixb+6
         4pag==
X-Forwarded-Encrypted: i=1; AJvYcCW8MmAcfzr4EMbTKaGpO4VQtnrjNwd8Ml1uYy9U8IYZN3cs/oPRHp0XcV4eDF/D6pcdha6JdRSZ+9Yw@vger.kernel.org
X-Gm-Message-State: AOJu0YzqDSurXL/Vq1hCAqwXVQg5yiJjOn/t3VJRH10tpcDJd8cvYlNH
	elB+7mzcVItzCf6VD7pHHsHYftzV4l763+Q7JjYSVMq/IgIjDofnuvu0DTE53nEHoao=
X-Gm-Gg: ASbGnct24/xJfUplM2gEuLfgrKc2Mgj/19RlUBzHf2lx1IObX3OmUPtq/OtuNYI6zuO
	8R90N/nMDudxJSsbbG48sZS8ikf8QawH1IT+SHiPHDlTcMOA2j8Iz1EYOfIw86Dq/t9qgpEzX5z
	wlWWyVZYhOAO9yEjUJlzoz6fSMs/v21OiTBtRMaq/e4ANDZRWPduBAZbyeCvI8Jkgog3BrvcnB1
	jO9EI5RgOOLGnbMYGoqAq7knTd/dHtvrqP0JG4Fgee4TLuKxzxOAfH14x22NkSoVYOwwd2zTPUw
	y/OJdyMWlKvCWkWfOFbi3DvWKYmMjJ6C/lUAMPuZXcKW4hrQTJx8WZ8=
X-Google-Smtp-Source: AGHT+IFqVsUMNkskN7j0iU8FIkymNyWUVdq66py+zAf7HndvvTiiHB1vrcYgqEVFpM7yRp7iDODuOA==
X-Received: by 2002:a05:6000:41c5:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3a6d12c4483mr13480483f8f.7.1750771163464;
        Tue, 24 Jun 2025 06:19:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:19:12 +0200
Subject: [PATCH RFT 1/6] gpio: mmio: drop the big-endian platform device
 variant
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-pdata-v1-1-a58c72eb556a@linaro.org>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=738;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=z3/zra3kN9nXZTz56dedVkj+298LVjWZ5HQnjkpNGc0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXXVTocp2LRJnqJmPhyZdXYqUYB9W1Pi4/38
 +4ka8H0AFeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql1wAKCRARpy6gFHHX
 cpcbEACbyOXoPzeB9I06bs0F+81Fkjgw+J37W2LT86j5na56S1eXe78vgeUNxpRU1vCPdAPW9BT
 DcEs6ZeYowO9isB+rIP52gU9KIjpkZMce+6zcXuco/dLq/Z8nkcELA6ME2iqRAQaSpXCUg8K1Wu
 3DlGq8jLj1OKsMJm5P9YCfmrSKpfKeFfU0cmjjaJWaQBkuJA1lGDcmWxXI5Kt7Rk5awRVCkOIjR
 TE5aK2FjtBwxWzedg6h6Dv9aPLQkuOTAnS+F9hCwXxJwyK8O5G0PEiXm0TQuXNtntFBJtcNp2b1
 JUJNTO7pl7QJDvUZEfakkWGXM/SMdPBtWLm1LUMssPxlYSTNOJcoM4OKkEa8cyPFMPNhFEh08W/
 yoQUHKJAlg50Z86zhePj0yw8bnWHksDY4EYxW7ZWpkS8spjGmA1Fa/hEThi1kEhAdrEK3uP1adA
 jSZOy79jX/rLGhwtIh74KGqeAk7OdaUVqiGnyRDZGsUzwavHtuu5VCnzJJS2tckOMIM0el6TFwT
 or/WaFvU9MZ8udeIcduADx1B1w5v/bhz0pYU9sQjJgnffWWWVFK7gIGeBJTBLyfbPKJf64SQQhy
 8KrILygqD0RYRRH9oRjFhdFUWP2nZvMfid/q28RjPJkOuEDBQjag/WQhOh9x6XaR3dMaoNkonb5
 yRV1tuWz6xJ3kBg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are no more users of the "basic-mmio-gpio-be" platform device ID
in the kernel. We can safely drop it.

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


