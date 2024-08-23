Return-Path: <linux-omap+bounces-1980-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAA995CA48
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 12:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4C851F26C2D
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 10:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7550418859D;
	Fri, 23 Aug 2024 10:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rrFLilM6"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C45618890D
	for <linux-omap@vger.kernel.org>; Fri, 23 Aug 2024 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724408179; cv=none; b=vBon2j8LOVBZwd9eJm5zXf+vH4gT4VYh3wdBXZYGNIhZ/4HRqu/EXua+61ADaapoMDGvS1ao+DJbtZuFDFLEW7H5IZfaFn8b6bHegR95ZTDQCVX0hJww1TYPK63K10OrtV4xpcrv8NrC13WdmaIvOajDdA3TikGC/N2bE3wmEVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724408179; c=relaxed/simple;
	bh=Hq4cb2PCysHDymYKqh8l8D8U4p6NzM2SO2TX8TxhsYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BoLHUHzxgBlZGGjW5WKXGIZHQAq1/6V93sZZutYgbu/Udaqxdvwp+JpnmIxnYpvAQf5QfIA8pLG5uSUDrbClxWN9fwchBiEoPWKGIX2l7lADvHV0+81qIJtn1AiQPfVlYwWLVdR7DURrB9TN3xMdu+2BmeKqqyzkRXmR9s+r95Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rrFLilM6; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a86939e9d7cso13569366b.2
        for <linux-omap@vger.kernel.org>; Fri, 23 Aug 2024 03:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724408175; x=1725012975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ocnpO172IW4JkslgO+O3WIS3ymQVVnJA1Ye00Cp2Ow=;
        b=rrFLilM6dhovfNOSkW4k3uJp4luyF4hZ96Sgn9ZMHsL+Mj9PrOCwLUjEDnj1Gr2bzu
         olZ2mOkZlWlZXAguzBMemaVkpZPscuTVr5onT7Jamfl+1MVxrPv58QCD3Zc66pUwNby8
         FzK47kG6+Qhs0M2SaGGQhQQkx2I1zaTKWRxeuXnfOVLPVWgCvd9kv4xr48ZX9L7srJNK
         Ty3LuQ2/Hd4g01iGKfpXLoxwq39lFm8LspFYj0trQBU9u8eDZdesut3Aj72lanQpdftG
         HrCFeC8JX9iDFouFQ1vwEEGFAep/pIyFm0wYpqdsarFFbga+cc4p7AZFf+vd6Jghmfq0
         OmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724408175; x=1725012975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ocnpO172IW4JkslgO+O3WIS3ymQVVnJA1Ye00Cp2Ow=;
        b=pBhHCRyKF9mwIXPu66HUQ/ns1YclcdEHb6Tj+0j7xtlCgyJV/9GPd9KSFuaWeUQRaR
         NIIgbCvPyfxDtGTnwyvgJloacbd7fkmZt1k8syjAfY949KFjo8BcS45J3oJQHOTFCLL6
         nE46jwQn6ljy5TJ5yF5dZq5Ae7+tyzXDwUrQsuwYEvFjXNgUeeH2SeKSzfdgZkWjZLcU
         oCTXWw/SxSwGymg3oAT7JJuNwodm+cJcqer2WFovJQDfmXcvm6cg/utFJtpHl25InmnM
         1BwHsUK8ZOFYGR+diFG4V6/PaIXUEgzsJX4PqSmI/LfVFj8Ksz4irAR3vrr4QmPJrvXk
         48NA==
X-Forwarded-Encrypted: i=1; AJvYcCUcd6BZTy3Kp+RRxXo1bda9fxcjfr+6c4OjLz6AGrmG+fhPOF5QzpXeOvRKxLuMntEzJ03DEVNmI5RM@vger.kernel.org
X-Gm-Message-State: AOJu0YxSDtIBuL6D8BGdLpw6Zul3KyuHBv0igPfy9Evy8v9d+hxZBBF1
	u8Bh2zucvqmArrHW76SmW/ojiSCUyqbE88BRRL1it6P3rKnVF88ix6+jjReH/10=
X-Google-Smtp-Source: AGHT+IGhkuSvyXebvL/B71M5+A63nJsMJdmc8ImauUTYMsBp/MtDZmt5w/H9Ro753NCVBIDUlhKVLQ==
X-Received: by 2002:a17:907:7d91:b0:a86:7179:849e with SMTP id a640c23a62f3a-a86a4eb104dmr69259766b.0.1724408175415;
        Fri, 23 Aug 2024 03:16:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2a1df5sm237912166b.68.2024.08.23.03.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:16:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 12:16:01 +0200
Subject: [PATCH 6/7] memory: pl353-smc: simplify with dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-b4-cleanup-h-guard-v1-6-01668915bd55@linaro.org>
References: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
In-Reply-To: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
To: Santosh Shilimkar <ssantosh@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Hq4cb2PCysHDymYKqh8l8D8U4p6NzM2SO2TX8TxhsYs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyGFiWcy8eseMGER1brKDO7pSSLOJFVrVR1xx9
 NnAdZE/YlSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZshhYgAKCRDBN2bmhouD
 1wMAD/sGNlt5XqYNkHukE/5wRvv6uvT6Yob8h69eYgWUlllNP8Rr2rkissabZKtE5pxvqSJcDFK
 Jhs71OE9WYilg1k3JcV+fw5eayzmMK5WhS3bqL6hALGB1E9I2VPvxSulJQltKJSfhwNj8IdHX0n
 n1tUx4nz2wmT1Rq0j4kuS2AxiaytBfsSND1OAnGGnVEX4gwswxexllh+G0OWdwq/jKCTlNoj3HN
 eYmJSwq6cKnHRPQcdsffDw+6XvlCoJQLbBIS68phq+fxjUc8rgohmKMw8pjuXTFjzA5ayy0lR0W
 Y64DtnGHAYFHIXiaVFyUkFe6WzY4o1BXNuBRFUeIhSnLFXBVHYj0iqiIG48d8mQ9Cdvc9hVTio6
 IBLXlzdodYtquWpmD4QI6pW9MSU+s4snGTIBcyfMg+uyPCSzYDW+yvyaLu3MpqJG0dvWRp2JcBY
 Qnli8Q4PhCMnSjf00zbqFc9Ej2S6plMQEjjrRpZmaP3WLPZ9pEXumSUkYZxS6SHICj13GffWMLc
 mO+SpPGLNf96jDf5UYkExVGrv2sBd7QvvXjpVZn/zxLjomdS1wiKJwtzSw2PmyBBW020JPeUHFG
 SjjV/B6zCmS6doppXqv4r0QI/zCChezl9j+0c4rOUnptlaCdoQf+J7qh0lE/R4oAMZzzjIzp52N
 pLa9e925jT+tHyg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use dev_err_probe() to avoid dmesg flood on actual defer.  This makes
the code also simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/pl353-smc.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/pl353-smc.c b/drivers/memory/pl353-smc.c
index 56e51737c81f..c75b99e49970 100644
--- a/drivers/memory/pl353-smc.c
+++ b/drivers/memory/pl353-smc.c
@@ -82,16 +82,14 @@ static int pl353_smc_probe(struct amba_device *adev, const struct amba_id *id)
 		return -ENOMEM;
 
 	pl353_smc->aclk = devm_clk_get(&adev->dev, "apb_pclk");
-	if (IS_ERR(pl353_smc->aclk)) {
-		dev_err(&adev->dev, "aclk clock not found.\n");
-		return PTR_ERR(pl353_smc->aclk);
-	}
+	if (IS_ERR(pl353_smc->aclk))
+		return dev_err_probe(&adev->dev, PTR_ERR(pl353_smc->aclk),
+				     "aclk clock not found.\n");
 
 	pl353_smc->memclk = devm_clk_get(&adev->dev, "memclk");
-	if (IS_ERR(pl353_smc->memclk)) {
-		dev_err(&adev->dev, "memclk clock not found.\n");
-		return PTR_ERR(pl353_smc->memclk);
-	}
+	if (IS_ERR(pl353_smc->memclk))
+		return dev_err_probe(&adev->dev, PTR_ERR(pl353_smc->memclk),
+				     "memclk clock not found.\n");
 
 	err = clk_prepare_enable(pl353_smc->aclk);
 	if (err) {

-- 
2.43.0


