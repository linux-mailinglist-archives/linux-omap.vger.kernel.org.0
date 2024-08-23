Return-Path: <linux-omap+bounces-1979-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0239795CA46
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 12:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 277661C2099E
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 10:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB594188926;
	Fri, 23 Aug 2024 10:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HN8Um5lz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C23D14B084
	for <linux-omap@vger.kernel.org>; Fri, 23 Aug 2024 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724408177; cv=none; b=CH2aQQeJvUAdoXIHhDWj+M2+u52LOGhwSUeVTQFWPXxPQxUJMZWkPDoOdT1rVvgSi9Pv8mlfiJxqNOQKzDgYFwoSl2JPNXLp7oRBTTLOsvEnb+e9cMTRxBYpODqYT2+EXyHsnxr2vcmqA9sYhnq+p+YyBgSj8M7oHCEL46s3fxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724408177; c=relaxed/simple;
	bh=ZwCto+Ttph4EufVXEro/gEKUqJQirV37As8vR+9RWpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hwWOqlhyLr8M/n6ByxYehRGgQP5YEIg2HepxCz+CBE2lMMs6g01FMI5G1RAHUVf4eyXVxfrGViN0ycASPa2LY+Il4jeGn8oJ9WXRHRw1fILqpQjdpmwfdLMOX4tPI4WHNEOBnhTo5x2luWCxaePEFHA1HQCkHoABfS+1/TXGKJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HN8Um5lz; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5bef259a71fso249681a12.1
        for <linux-omap@vger.kernel.org>; Fri, 23 Aug 2024 03:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724408174; x=1725012974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7t3y5+/zYw1uRCizz7bvbUmiS1vcdmMCZnETRzZwr0=;
        b=HN8Um5lz5NFy/2ogaturIBc7T5AP2lo0uJxdQLThIY6dRpwdws6GINXvcPFYaSBjNV
         BksXRaR2pT92cN29J2ihDsW8crQIFnByk3Q9WBG4izAqA+2Cqbn2BSNecT/Cx9UTy659
         1j+zefbd08fuqDGZe7n9jyvknl4WoWvfJ+Vux8dZ4IZe3uRAIQiMrNicneCD0M9wPRBV
         E/g8Fw8ytkUqIyccEcDCXNBYBr0+kp6rsEboX0NWccmJmhMpFNOyK0bt/Cpj1+laID3D
         h6Agmk/W7DD1UJuU6NiFUf2+0iyFPTXiVrSzJqyTq/6ZfirjLvmRT9bwWIVxBfSBtA33
         vRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724408174; x=1725012974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7t3y5+/zYw1uRCizz7bvbUmiS1vcdmMCZnETRzZwr0=;
        b=OxeXl4Dg2LN4W9PVhXnESx08S9Xtx0bYdadzwGQPRJPsHiNJt49B/RQv0KsLEV5eF9
         6InNlF+v5XoSN5fwzpAGI1092htuO4/2adYPlFmCZLGvTAQY9D9FLAcJ6TQy7TesSvjn
         aecDNhYX0faq/HpXkBhVmkdEbQ9aUNJQ2r2orFGIkDPZYqStasJibEl0ylQ4bNn5sWMa
         GzJGDE9gdtMwpr9mjpnmJeq6e9RVjm1JK4z2m7fF2WCbWvaXIALP5TI5d24VIag2vjAQ
         c23dHYAxP7xVBvqrulBHUUNJgOSR49LVxyF/jw4TC/BFkCIuPPBGRFvkdECjfwBEY5IW
         J21A==
X-Forwarded-Encrypted: i=1; AJvYcCUJnMURFGtnmU5UZAGbnCSposVMSvgLDFDf9zDkhm29hqF8GWN1nFldjdHTXKxBVDXv88nZxBSWrHKz@vger.kernel.org
X-Gm-Message-State: AOJu0YyzemGMKnq+gfurylTL/TCQsXPsW+gGAyrc0Iuxh3YAaAElq9CF
	FiSFrrpQgSReIgp25qqSGVX0jwXBktqKsZoFOuAGVFSHPwB0qDugful6WEx3KmE=
X-Google-Smtp-Source: AGHT+IFfy+OGNSeG7SJwkUpL7Mu8EF/PyhzdcUVTDpOXbF/eS35DAJqbkG6gabVNuzT1c5TAzBjNFg==
X-Received: by 2002:a17:907:7f2a:b0:a83:a86a:549a with SMTP id a640c23a62f3a-a86a5185ae4mr70199966b.1.1724408173829;
        Fri, 23 Aug 2024 03:16:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2a1df5sm237912166b.68.2024.08.23.03.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:16:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 12:16:00 +0200
Subject: [PATCH 5/7] memory: pl172: simplify with devm_clk_get_enabled()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-b4-cleanup-h-guard-v1-5-01668915bd55@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1959;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ZwCto+Ttph4EufVXEro/gEKUqJQirV37As8vR+9RWpU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyGFiSXY1vA0zswAcRg937hXMqwpJ4t2399ap6
 Zc17P/RQWiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZshhYgAKCRDBN2bmhouD
 17p1EACCnXOOL7qiPpF1BVtDZJyarNwyghSByLJr+OShMsFmzfL5fqK3GScCm0Bj5tf5tFbpbQ5
 4DJJ1trhs+rjYKho1Euf2qMyByMQviKQz7374W4xt5N/ovZJ+Fg9sOhE1mO+En6Hvna0dmajS/c
 oiu4h3guIuqxSo6dpFkaHPOhgpZbEb3Dtfd3iAx9PuxXu4mijxyh/YGo0Y2A1YKcvyE6DUOvk9M
 jJa54LPKp7VRceGAFUBCGQj1cm9CQrQaMW4nO+kb99NfInXzV14s3UOvQwucjesIiDJUpSVMkO/
 Psn2QKZBU9tWM8MLWMm8C9u293iSX+xawdxcNKFbI/OQjBpq8H+DfVviF8tK5MYL3SPgYyEMEE9
 86s2CghofhJi17lfZOairekgkW5n0bAEY3Zmg3EjZhaNeev73dDZVaWuKZfEwuH3BFppKfdjuOu
 nETH6p8zg3F/8eCvi1KLZNVcb3dhzw2AfFmlbhmkpKAFE5nwO8opG2o8k7gjNAgxUq/HDW9wbb7
 h2aPwn5RP7JFlkphz5esizu/oNSCTe7oK41p5khXYS9v1azXwXO+DgGQYYsIBuGn2gnjAWvsos9
 x4EDWmHau7gceYlm6H87WjiER4YPR9KTS+u84BmTDWnYnRgCnMR9dJcbzYSt/BY9Oj3Z26zNX6a
 IbxrCHk2x5zf8AQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use devm_clk_get_enabled() to drop clock prepare/unprepare parts and
make code simpler.  Change to dev_err_probe() in handling clk_get_rate()
error to make it even simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/pl172.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/memory/pl172.c b/drivers/memory/pl172.c
index 390012401f64..db5fbee34077 100644
--- a/drivers/memory/pl172.c
+++ b/drivers/memory/pl172.c
@@ -216,28 +216,20 @@ static int pl172_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!pl172)
 		return -ENOMEM;
 
-	pl172->clk = devm_clk_get(dev, "mpmcclk");
+	pl172->clk = devm_clk_get_enabled(dev, "mpmcclk");
 	if (IS_ERR(pl172->clk))
 		return dev_err_probe(dev, PTR_ERR(pl172->clk),
 				     "no mpmcclk provided clock\n");
 
-	ret = clk_prepare_enable(pl172->clk);
-	if (ret) {
-		dev_err(dev, "unable to mpmcclk enable clock\n");
-		return ret;
-	}
-
 	pl172->rate = clk_get_rate(pl172->clk) / MSEC_PER_SEC;
-	if (!pl172->rate) {
-		dev_err(dev, "unable to get mpmcclk clock rate\n");
-		ret = -EINVAL;
-		goto err_clk_enable;
-	}
+	if (!pl172->rate)
+		return dev_err_probe(dev, -EINVAL,
+				     "unable to get mpmcclk clock rate\n");
 
 	ret = amba_request_regions(adev, NULL);
 	if (ret) {
 		dev_err(dev, "unable to request AMBA regions\n");
-		goto err_clk_enable;
+		return ret;
 	}
 
 	pl172->base = devm_ioremap(dev, adev->res.start,
@@ -267,16 +259,11 @@ static int pl172_probe(struct amba_device *adev, const struct amba_id *id)
 
 err_no_ioremap:
 	amba_release_regions(adev);
-err_clk_enable:
-	clk_disable_unprepare(pl172->clk);
 	return ret;
 }
 
 static void pl172_remove(struct amba_device *adev)
 {
-	struct pl172_data *pl172 = amba_get_drvdata(adev);
-
-	clk_disable_unprepare(pl172->clk);
 	amba_release_regions(adev);
 }
 

-- 
2.43.0


