Return-Path: <linux-omap+bounces-3671-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 043D0AADFF4
	for <lists+linux-omap@lfdr.de>; Wed,  7 May 2025 14:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77D494C5A3A
	for <lists+linux-omap@lfdr.de>; Wed,  7 May 2025 12:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A65C283122;
	Wed,  7 May 2025 12:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v78yZPJJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D15E2820DA
	for <linux-omap@vger.kernel.org>; Wed,  7 May 2025 12:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622755; cv=none; b=mZJuupB6BCPKRT6vxcQ8w7qeiAJHdi4f633GQAXT0/Yg1eoy9arA3nAw8RoYXamlBquPBhv/R2eSEeaK89QphLA6lBj2hdyRZCWG6UxWRFERNpSvRpMjth1Jrey+VhUdIwmewbsfnNmKJ91/TUIyHytia4duZaS+DVwA0b8I2Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622755; c=relaxed/simple;
	bh=lRJd4xYfa+yPRmT0PBxC1GylBGh4XflCfKIDWQV83XA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RcggXDH+nEF11BCTQ+INEL1MVw1UZFeDF1IEfc6BD5buPxQJSa0TvPqivL7nvfFEQlOB3VigfTZrnQkD2W8897oUSCLCHa/DfMFfqW/1kEN/kn9sh/eAGwOYOP9L3W0Cn7UBJRFsXCvk/ur+ecGKPtb+nJiRvjBF6njHWDoR+Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v78yZPJJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso32244905e9.3
        for <linux-omap@vger.kernel.org>; Wed, 07 May 2025 05:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746622751; x=1747227551; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1eEJtuq7GrzY5dXwcDM0d1snCcH02FgAiWny3L5OrE=;
        b=v78yZPJJHdKUYE3yGUWE+QulBGFUF0KDpZyXgJUR1TORcd2xLeWvHP5eZPInbR+Pc/
         43fcJ9bx+xJF4j1xVk4Tp7zPpWvKkZQDXwNaFbtbz8xhR0IXoA0uHRJO2vzYtZIgwQ49
         t2CfgG/XqE8fpMnKmcV81jOYRnFloB8CjTGxnDo8EGJVCiaey0pOjqMGBSDaHT+u/RMM
         b4Qh8QMKof8IOoSCkfPfRHbDMlXSHj+Ey+mmGdQvjMeFrhCgHCtC+My2qLpnEmv/1ab3
         dM6DnenSakFd9JKjmbAVnzErrGAgzeE7fmaqN6QXCsZHIw+QW65KFhPGEYsSptn8BCRy
         Rv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622751; x=1747227551;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1eEJtuq7GrzY5dXwcDM0d1snCcH02FgAiWny3L5OrE=;
        b=PrleM3fTDwMgqd6g7glinAGfXST88jC17l7uF8TOeveMNfl14lZfAxOhRH9e11kwDB
         08Dxo6Bn0oxZZONIZ60bwMXNLfVOWnhx9wXzmgw9VyTu5QCG1REOwx3Ah1WcI3fjuNMp
         9vbf/+M/OuME5LLTuAGCdOqM0gJZ4KsIUxAskDCsngu1EljTq6398lBtJ/R2FTx6Jipm
         gTeUwtFdHY5pARU9w2Q8LG5bab90X2eLkQ4IQQzezQkizmQxRQf4Bp5CgrEEDWq3Refa
         tzcKfQFwJatnENukxkPDj6KW5yAcVuM4dsWlZUBTVRgMIHvKnP8SyWhQRaJ+UW7NPVKD
         8Tkg==
X-Forwarded-Encrypted: i=1; AJvYcCX2OxTv6zstrsqB8um0gZHxl/gzdkEXovb3r6ta/3r34xyHW6XIV2hTMhQUKiAJS0HUlLA+tGuXNrjI@vger.kernel.org
X-Gm-Message-State: AOJu0YyX2NAyTakie1bdHtqfXOhXlahv6iY8MicVvzp6gvnkCI77Upzs
	GCZJOzr8IL34uRkyFvURo0b2n6UMOKiWQam0N5Th90CGVOZrN7dxJBe70MEXpVw=
X-Gm-Gg: ASbGncvnWkEc6tOcvt0JrYpAp2ru+ruZNQYyTAGStfW+Re/JNjxr1TaAjD5eAU8kTqc
	rwO58QELJyzFTktYRZVDgQRy7Y6A6tRgazP7ArMkV3AnnklWqBNmRgldBZ+0tu9rjzhXOdZVSpv
	G/k2I4c6r3tv6W7RC/fvAI6PacBlrDL5k4e9U3HSkoNyrkKPtcF/+cyQHlUY9PnADh8GCUhTQd3
	VDp1ZSESFSW62t9TkJw/oWZebTTaRAs2JPqt4/bOpVgZZOhqnUwHb6ey9ZNqrV6OPMQLW4z05BL
	Ln9Q2p87GYCoX57iiFRJfgjhIitliS2rA3yHu1xP6TCE2A==
X-Google-Smtp-Source: AGHT+IEML0lGruoGaC6m/maRixPfuTBc5q9w19VGichKR29Lwl10pmR3mhwH0QBjCnQho587rdGN3g==
X-Received: by 2002:a05:600c:4e16:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-441d44bb815mr27845495e9.2.1746622751582;
        Wed, 07 May 2025 05:59:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0af111559sm4920141f8f.47.2025.05.07.05.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:59:11 -0700 (PDT)
Date: Wed, 7 May 2025 15:59:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] regulator: tps65219: Fix erorr codes in probe()
Message-ID: <aBtZHEkgYGK33fWk@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a copy and paste error and we accidentally use "PTR_ERR(rdev)"
instead of "error".  The "rdev" pointer is valid at this point so the
existing code returns a positive value instead of instead of a negative
error code.

Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Regulator IRQs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/regulator/tps65219-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/tps65219-regulator.c b/drivers/regulator/tps65219-regulator.c
index b16b300d7f45..f5cd8e33e518 100644
--- a/drivers/regulator/tps65219-regulator.c
+++ b/drivers/regulator/tps65219-regulator.c
@@ -454,7 +454,7 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 						  irq_type->irq_name,
 						  &irq_data[i]);
 		if (error)
-			return dev_err_probe(tps->dev, PTR_ERR(rdev),
+			return dev_err_probe(tps->dev, error,
 					     "Failed to request %s IRQ %d: %d\n",
 					     irq_type->irq_name, irq, error);
 	}
@@ -477,7 +477,7 @@ static int tps65219_regulator_probe(struct platform_device *pdev)
 						  irq_type->irq_name,
 						  &irq_data[i]);
 		if (error)
-			return dev_err_probe(tps->dev, PTR_ERR(rdev),
+			return dev_err_probe(tps->dev, error,
 					     "Failed to request %s IRQ %d: %d\n",
 					     irq_type->irq_name, irq, error);
 	}
-- 
2.47.2


