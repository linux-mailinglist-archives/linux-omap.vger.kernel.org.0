Return-Path: <linux-omap+bounces-1981-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7E795CA4A
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 12:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D0AE1F26C1F
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 10:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE03188A0F;
	Fri, 23 Aug 2024 10:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UC5Fswln"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72757187842
	for <linux-omap@vger.kernel.org>; Fri, 23 Aug 2024 10:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724408180; cv=none; b=Ch0KGQSceoaZ29Qs6AOWz48gXc2pMcqkGzud4fRRsS5lZC1gRAek57ZxYpjLNrjRqqPO03j3L6wwXpxmG0WGnn7clrdlHNm1LEgqHRnLncCvM5n1cif1Y9h3wpdY1aJZP6Wx1KvELRhtVgtIVytQPfoOExsPe8lzpDNaB+bHAR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724408180; c=relaxed/simple;
	bh=GtxnoHO8CDfRvCPOOhVqBA6bOVSvOhWRpFVjrz6fU/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YQMmG5112lKGcB8Wfr542Ewj+2HNbk/ZgrpcHTJkTtu9KSE6/LyeGl7/liyiE7raH/ujRj0oikYspphYW13fISTtHZEj/MimsIao/pmmT80SNPIlbqV/IIBM4soAqzD6fHhLuWuwyvVpdSsxa6Dqq2wJVWu6dgtE4yXfRUZIiGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UC5Fswln; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42802ddfaa6so1741225e9.1
        for <linux-omap@vger.kernel.org>; Fri, 23 Aug 2024 03:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724408177; x=1725012977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//v24CLcxs0qSfzK2bPZZmIP6fFeIOA2pMo9LKSVIsg=;
        b=UC5FswlnE89o3m7ZofvkXKe9LAaDcTfLPNaj/iw8lsp+xXGvFiDKaZ8s3ZR6+tbUbt
         r+nHxa9MuDVbZ15dlG0wbmfO7JJUeUMjiBBgRe4lMhKiYwrTUzWom9SP/kYflGNluUxe
         ezf12UWTkgsqQvEpYT+OrVSp1RarPbqVOZOuf3D+YXY5f3EBg6J5cShiy9E5LCPX7Cpw
         bBE44rO8MSfVFnfwxx0ogT33bX8ywKDDfr+3kH7zhT+8H5WVDceq6UGY0aNVgd+95HpD
         FhjAOSHOH6frBr0iX9abqAdbnRgXh5SabNi4oiRCuHn2xDV+rFLodRbGknVc3Dr1Qwjh
         EMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724408177; x=1725012977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//v24CLcxs0qSfzK2bPZZmIP6fFeIOA2pMo9LKSVIsg=;
        b=Ni3z90Zx84CmM/GmiuHEat5Z1BAV9+og94N1cy74MrsSKwe2kAhfxT/KmzLH7mVxuB
         rcQQAWixPwk/9nDea/zrU5v6rG2mWfHVSLxumL0wb+RYNKlwDsacdTeTaWJWi6hqIFUf
         KwHfyhhwY+9eaH4usddAQStWzsgcBypjKV6BVeEpDVYwaotJkKrUoxm5THkV9d7pDK3y
         KjKUfSz/SNnwLc5Z2AkhuvnOsddqlXll8/EzDsqPP9ZmsyBe70uihTaQcvKg63oj6ngi
         TTbFBjw3VH2ZyZniKqKaVj+g/g0Q3Red+H1KCtFdQUtTkQUnZTkTfnMbGHUXBzBA/LbZ
         AlGA==
X-Forwarded-Encrypted: i=1; AJvYcCWq+po2pAO04QfnihsDRTV88p4uxOoZGjfUp0+jYjzrQsN6PmE90gWFblYTXLmOX0IHB6FFyCY6Y2/o@vger.kernel.org
X-Gm-Message-State: AOJu0YxBl/E08k+nO3D4DHsKuamYyWWzEUvEd3phkXV0jz7xWohHEJ43
	zCrHIH7XewgUj46odv2YQIu6kwGXLIL7mZtfjCzT/VE01YdbJIkP5qCxVUB9IJE=
X-Google-Smtp-Source: AGHT+IEC6RfNPvhzvFChx+wCtL+7NMrFiz5Gjl+zdt8NnzFVqnC/TNmP4WTfKFQxtLPYaUDtOz4fJA==
X-Received: by 2002:a5d:6daf:0:b0:362:4aac:8697 with SMTP id ffacd0b85a97d-373117c3298mr702517f8f.0.1724408176834;
        Fri, 23 Aug 2024 03:16:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2a1df5sm237912166b.68.2024.08.23.03.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:16:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 12:16:02 +0200
Subject: [PATCH 7/7] memory: pl353-smc: simplify with
 devm_clk_get_enabled()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-b4-cleanup-h-guard-v1-7-01668915bd55@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2747;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GtxnoHO8CDfRvCPOOhVqBA6bOVSvOhWRpFVjrz6fU/I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyGFjgn/NfXowD8Y2kzEYUQzr0VM8d7MwS+Jki
 D+A6EsuqsWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZshhYwAKCRDBN2bmhouD
 153DD/9dC6+1LakyDECRNCZMvG3KWYdsCy+n8ZppZCS0zMMtN4jEXj9i2yumR/zBd9WdLuvHhOq
 /cm9avULIqRDGb0k854F3mtC8f1KuhUDM7Ma8n7lLRza+ASd1KvMu2vTKSoO/d1elYTCUf36dPQ
 xWAAbzDlBwaWIaesn1fgIgOtrMKc7gbsUV6VpruCUo5WQBqdrHoPh0UN4xn+5RW6kZHUjKLUkPI
 2I2CGb5WVBq0PbE16Orjfv0X2uzpKwvQ13SluKHRnB0uIAJTZu+CgLvqn32uGmWiOJeDn/sPCNs
 XlNjNwkBJyMSMA7iik1Gwlo0qGCJRdRMQRkPGsXwv181roFFG6TV6RQjwGg2qESiqCdEKOCSsKw
 XpCtXuPCLLh62bG2+8KHJsrZOWXHv6E8CT2Tr1+Cq7DRXv/jOme9d0x0WwMmPoWnDhy57zxWj7P
 mSwwXQFSp+w+bR6v1R45CGzSLT+tYIZgkuEiUNUWPCd0hCug5lFdwR9FL9FRvzF9aoGtDKtrIsW
 i+hmvWYH9Z4fsIYKWp9CGlcDVV1ai4g/c9Li1UM8KnW7PyWCwoSbDEUVQPxadKXSSYWOJfwKTkF
 ukW/jFfNt3bdu6bJWXMXObgMuGb7nHsCbpRI2pDlRwzDQ4KP48wbJF2jYw+irTjCvRTfCsmGKMp
 ApJ+aySaq1AUYKA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use devm_clk_get_enabled() to drop clock prepare/unprepare parts and
make code simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/pl353-smc.c | 36 +++---------------------------------
 1 file changed, 3 insertions(+), 33 deletions(-)

diff --git a/drivers/memory/pl353-smc.c b/drivers/memory/pl353-smc.c
index c75b99e49970..994c7a792e34 100644
--- a/drivers/memory/pl353-smc.c
+++ b/drivers/memory/pl353-smc.c
@@ -75,34 +75,21 @@ static int pl353_smc_probe(struct amba_device *adev, const struct amba_id *id)
 	const struct of_device_id *match = NULL;
 	struct pl353_smc_data *pl353_smc;
 	struct device_node *child;
-	int err;
 
 	pl353_smc = devm_kzalloc(&adev->dev, sizeof(*pl353_smc), GFP_KERNEL);
 	if (!pl353_smc)
 		return -ENOMEM;
 
-	pl353_smc->aclk = devm_clk_get(&adev->dev, "apb_pclk");
+	pl353_smc->aclk = devm_clk_get_enabled(&adev->dev, "apb_pclk");
 	if (IS_ERR(pl353_smc->aclk))
 		return dev_err_probe(&adev->dev, PTR_ERR(pl353_smc->aclk),
 				     "aclk clock not found.\n");
 
-	pl353_smc->memclk = devm_clk_get(&adev->dev, "memclk");
+	pl353_smc->memclk = devm_clk_get_enabled(&adev->dev, "memclk");
 	if (IS_ERR(pl353_smc->memclk))
 		return dev_err_probe(&adev->dev, PTR_ERR(pl353_smc->memclk),
 				     "memclk clock not found.\n");
 
-	err = clk_prepare_enable(pl353_smc->aclk);
-	if (err) {
-		dev_err(&adev->dev, "Unable to enable AXI clock.\n");
-		return err;
-	}
-
-	err = clk_prepare_enable(pl353_smc->memclk);
-	if (err) {
-		dev_err(&adev->dev, "Unable to enable memory clock.\n");
-		goto disable_axi_clk;
-	}
-
 	amba_set_drvdata(adev, pl353_smc);
 
 	/* Find compatible children. Only a single child is supported */
@@ -115,30 +102,14 @@ static int pl353_smc_probe(struct amba_device *adev, const struct amba_id *id)
 		break;
 	}
 	if (!match) {
-		err = -ENODEV;
 		dev_err(&adev->dev, "no matching children\n");
-		goto disable_mem_clk;
+		return -ENODEV;
 	}
 
 	of_platform_device_create(child, NULL, &adev->dev);
 	of_node_put(child);
 
 	return 0;
-
-disable_mem_clk:
-	clk_disable_unprepare(pl353_smc->memclk);
-disable_axi_clk:
-	clk_disable_unprepare(pl353_smc->aclk);
-
-	return err;
-}
-
-static void pl353_smc_remove(struct amba_device *adev)
-{
-	struct pl353_smc_data *pl353_smc = amba_get_drvdata(adev);
-
-	clk_disable_unprepare(pl353_smc->memclk);
-	clk_disable_unprepare(pl353_smc->aclk);
 }
 
 static const struct amba_id pl353_ids[] = {
@@ -157,7 +128,6 @@ static struct amba_driver pl353_smc_driver = {
 	},
 	.id_table = pl353_ids,
 	.probe = pl353_smc_probe,
-	.remove = pl353_smc_remove,
 };
 
 module_amba_driver(pl353_smc_driver);

-- 
2.43.0


