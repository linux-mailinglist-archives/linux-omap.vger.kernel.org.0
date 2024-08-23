Return-Path: <linux-omap+bounces-1978-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A149195CA43
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 12:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5722B1F26C1F
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 10:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F591885AB;
	Fri, 23 Aug 2024 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lmvqonSO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF211188584
	for <linux-omap@vger.kernel.org>; Fri, 23 Aug 2024 10:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724408175; cv=none; b=LcPnRWLwWdr4CAwmo1mFeRssLSk+ynpTDlD80zrBathiZuU2oU6wcvC5IrsoELCeiEmNz288BsSvKbvdADmmRF9jcb0TJM7mJ1YwLoVBAYjavLrueIxg52mTWPi0TLHVnklYSozprGQbfyt0kB/4t2bSLgQqMVHNGjS1kU2R+VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724408175; c=relaxed/simple;
	bh=IlZEpsC5zLoI1hcyp/Rq4r/SZxK68xgrN7mWoEs36F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c0WVITrtlHolxM/ELTwKOm784vMVmmqjD+MPBLnJrQHXo2mRnVytNWUuFVeEuGZJxCpSkOIzUca/31msqDWB9KtT2LUq4FxYV0Llnz7QHDhdD7fAKdaF5HBZE7CrwDW+9zsTq7zAIY9mP4PfgQbVTdHdOx/MKrBx22xLelDj9eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lmvqonSO; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a868b4d67c6so12240666b.1
        for <linux-omap@vger.kernel.org>; Fri, 23 Aug 2024 03:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724408172; x=1725012972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7t5hccTkDQZVo5vU52s+pXfo+StB90U/RzqpPMyIi8=;
        b=lmvqonSOzJiLZ0xeswHBSr4v8vSVhBf+5IfrvBkew0ziCFeewkR6An/6rR8pAnLQPu
         4pBtwgUCFQOa8Y4gryQHj1qjfTG4UcMhRV+F5LQ9oCaMECYudOuzcLlNV/G/LbhKPDX8
         d8pXyjZEsIAwWcLvtcTJ65Yt/mNsi/oAyicWuk5BYrd1mp52IyxKgc4wsA3MzSf8VvHt
         uqejoBtmxijuF6EmcGkFQMNr2t5of1PPrYTZ2fA4MSDFMsW+ef4zPI/JeU+bmkgPQiAL
         QaJldRzm/qPpk02Fa7+BaGDX1Mfb79rlz2hHU+mPIYYqClsyN6kCF1X0+7eRWj5bIXNp
         81tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724408172; x=1725012972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7t5hccTkDQZVo5vU52s+pXfo+StB90U/RzqpPMyIi8=;
        b=tr0S65ZJqFi3CbWwCn7ts/kAMT0K4Bo9LNBJXQ652ZoOgD9+IP18BFxHEc7WN1pIb9
         N4MpN3kPw1sjdVtddwxuP0fJTgE3gKydEwjcjfV/P97DaOLclD++oMI9QSbUMm8nEpin
         Lk6E1XPmzxcgkT1tfvyob+kHmjHUNEe/Gqb5nC7nSAzHwBz6oJ7gVy5yvJIKz4hNHtYS
         DWI47q0xL/DAS8s+1yWSZ2C0yDL1VUSkajfBPEAwWOuw5R2HAoAU/7MCEZptPCX3qnMx
         EZU4/ezp6vCHfykKW4x0y0RkccobcgdNrESmYHDTXi4fY/6uZTLdFadibh0zgXykvcYz
         /K6w==
X-Forwarded-Encrypted: i=1; AJvYcCU2j02MrAxykHKMD00tlvKrdQlZg7YHv3ba2Y1H0LZolAP55WUUydTPf3LOThrUt5AZfqQD+75bAXIp@vger.kernel.org
X-Gm-Message-State: AOJu0YywARHlWfg2g6HUtmjvKcLccFqwFwCVcOMwflU48vhMxzLXF1XF
	KSKlAwJ0+G7LP1TKzHNtkHfSxy1uIeCeXaPNDwcizzF8yItSdYg1sko6nDw4oYE=
X-Google-Smtp-Source: AGHT+IFlkL5s7rmHHgYZMRB1BLvikyDv99I8y83akU4jvf5DqV38Aa2gkHT1IB1hClppKtMqNTmTRA==
X-Received: by 2002:a17:907:2d07:b0:a7a:ab8a:38b with SMTP id a640c23a62f3a-a86a54b66aemr78280566b.7.1724408172034;
        Fri, 23 Aug 2024 03:16:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2a1df5sm237912166b.68.2024.08.23.03.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:16:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 12:15:59 +0200
Subject: [PATCH 4/7] memory: pl172: simplify with dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-b4-cleanup-h-guard-v1-4-01668915bd55@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=898;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IlZEpsC5zLoI1hcyp/Rq4r/SZxK68xgrN7mWoEs36F4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyGFh/t4Skn3nDrz6/5TT4P0rYPwiS3a/epBSf
 tzcKzaA2ZGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZshhYQAKCRDBN2bmhouD
 1+xjD/4ruvUAwsgXVGQc0suOEQkGhBJDCb2yPwHptmIN2/Cz6v83MTq62MWytE7rdN2phWy9O3f
 56yiu1nANYWS2NWDWO0kosm/uUjEqkMGqtyWK/pnQejkUhHMa4rQ/myL9xx+HZW2K3Bh2SBDgZ4
 6ZLwIlHfAB+fzB0X83HHUe2/aotZPqNrnysD9mIh1EM+nHlTPLNoJoNKc/uo29G6m8kTrPLKxb3
 4ToplKvocyNwTPLYUwT02C0KUtbB4+d67+xx4nnPm2ubzPHbPKnZnS+jbuwKER2b9fIS8ZbeUoj
 WX+UYhccc7ySZNT482TECCo2+TluRj3/4f5ICmM5nxGQURDdJzq1x9lD198O2PaLdE/FiARsnAr
 wNC7qaAzZAhAoVmnNPRgCwEjVKu5yIgB5OzGNR7vlx9DNUoF/IlGWo5jMIGFFj3yUaxhIogBX0J
 A3nJPQTAKEtc+2u15w3TROpLzcw3tVqexUTmSFeR91i0uFz0P2KJUpNFRWWBAkCp3AxGjbK/zXd
 4FmSICD+VMNMNlwqhQzeBvd03X74EDItoXYvmul61L5I7l0xuE+toFTcEqCRosdTG3A252FL2h2
 ZY84cfqj/xdyvUssSD/4su/wROzfVx5QHgVWPUclmNz+/5zVaNC0wF3+DUE0HOQsmv0NQf0lX5/
 7CE8apeWgpQcD2Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use dev_err_probe() to avoid dmesg flood on actual defer.  This makes
the code also simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/pl172.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/pl172.c b/drivers/memory/pl172.c
index 9eb8cc7de494..390012401f64 100644
--- a/drivers/memory/pl172.c
+++ b/drivers/memory/pl172.c
@@ -217,10 +217,9 @@ static int pl172_probe(struct amba_device *adev, const struct amba_id *id)
 		return -ENOMEM;
 
 	pl172->clk = devm_clk_get(dev, "mpmcclk");
-	if (IS_ERR(pl172->clk)) {
-		dev_err(dev, "no mpmcclk provided clock\n");
-		return PTR_ERR(pl172->clk);
-	}
+	if (IS_ERR(pl172->clk))
+		return dev_err_probe(dev, PTR_ERR(pl172->clk),
+				     "no mpmcclk provided clock\n");
 
 	ret = clk_prepare_enable(pl172->clk);
 	if (ret) {

-- 
2.43.0


