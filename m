Return-Path: <linux-omap+bounces-1574-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4720C911464
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jun 2024 23:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF2011F261C2
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jun 2024 21:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32659139580;
	Thu, 20 Jun 2024 21:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ter4azBc"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47556824B3;
	Thu, 20 Jun 2024 21:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718918582; cv=none; b=D43L5jTSpT1Dkwq2v7hmf6PA2y29JmxGsU5USpQkFXaFVBn6LGfeRQa802XozZqiOuE1RNoacjnmbHURAuV/qNwt9RreIJsZroOU34OvY4sOF4STVfsZyfAOpZGjNzCFYiLJkdRUvKbyA5oFh8x/FXRFPsLPzn6XY+M7TbXlhAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718918582; c=relaxed/simple;
	bh=W3zJRVHu5IEnuNfSbP5xtAFgvUA5i7Y8mIhEvQpuVEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dS5BJawNp2h8bdAp7D5lpuLQrt9VGdqMSV2IywiKkYlfclPqLxzYQxa1SdaU//V1Cy0SGjn0EpLjNvytggG9n8QQ/bvBQY0Jxu4IXfIOAwUcNwv4NKlBInlKxSaEUQvjCELWzCtJW9vU5qlxOj7guR15CAfwX+0br8NH37KeP2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ter4azBc; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6f1c4800easo148907866b.3;
        Thu, 20 Jun 2024 14:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718918579; x=1719523379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvJiXFffmlTDfRSrFVguX7jVktah6y3nmFwZHVMfroI=;
        b=Ter4azBc3dBOsrog6R44Xw104CBIgnwjv421eAGwezktnq4A6WHIuyusOnoMyX1D/a
         LS+3CDtP8qfmLmEFATRfrhSkwSFsx2TPo4olZleuXd8Ag6uvNFLRajP4ZIlJk+PoGn4S
         g6oYgX1Xn4ajYouZzdBmNycYGQXFr+DAhV0KrAAQjoaTg6xYCIxzscG+fc9k7ljbMLFV
         GFPP0eRHGD6wKY6x71nHhly6dn+R4xO36CGJzqLQE0EE3BQvOH9WFRZ8A+cP8oCpPg8h
         9VLhy8V6DXuLXqLLNI7IscTnk8z9h6Q91gXethi2T4SNnsG5qM6euDj6sxEUE4WQti/e
         xu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718918579; x=1719523379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvJiXFffmlTDfRSrFVguX7jVktah6y3nmFwZHVMfroI=;
        b=WxE5JNdg0QNazuLmKkB3RxnZ55myFFUH9B+xYj6x5zuJu5N0qwb+fmboHu3idhOwdM
         9rJkTVNaLiHOJM1sp9usytyXq7lOux2R6sx/wg0Rvm8XPlrtX+pWdft2sXO+II4YJOBt
         elkYh9nqbdp5pm5f8pPfm/t22GxeYJbcCSBbKaQDQ5Gks5f95Y2MDjshqqrJwfyXYK9p
         Dzoi7z8q+MYZ28g86NhIQPV94lHNSkwgSZeEuq42/2eu3UQ1wn7ZnEKi2dfaNfeN501S
         0LbESjaFjaaYHmEZi9Xm2ujnspNMEcwNV+19Hb3ZRia0ie+UD5NzdNjj5j5A6oZqo3z+
         7rAg==
X-Forwarded-Encrypted: i=1; AJvYcCWc5ktDibyxHOfSOO38fbawz0H/z1GZ8pvwZLamkXqUKYRY2o7Ov82JvQBktWyTo4q5Y0Y4GSQwndwzAjpgnjlyjrSHhK4IxZ9cnpgsL1opVmO4+bYvQCFivSzfeKONoyu7rG1fXFT0kaFctuNA
X-Gm-Message-State: AOJu0YzT/Uic62yrrAyW1qxgnHV2qyVzTJP5xpt2xGme7fLwo87x+OI2
	y0Xnb1T7aBKfkpjnxDE7s1LxHJFLPgYvDtKk89IAy3nKMUqzVUopYgBH7UFX
X-Google-Smtp-Source: AGHT+IF3rCfMdHT1ePR2H6IMpVrEBm/ZW9hmVius8u0Q2iSl2WnYiakc8n94b267vNSUUckHNW3glA==
X-Received: by 2002:a17:907:c003:b0:a6f:b320:f455 with SMTP id a640c23a62f3a-a6fb320f483mr400964066b.32.1718918578717;
        Thu, 20 Jun 2024 14:22:58 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560d82sm10922666b.172.2024.06.20.14.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:22:58 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 20 Jun 2024 23:22:34 +0200
Subject: [PATCH 2/2] mfd: omap-usb-tll: use struct_size to allocate tll
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-omap-usb-tll-counted_by-v1-2-77797834bb9a@gmail.com>
References: <20240620-omap-usb-tll-counted_by-v1-0-77797834bb9a@gmail.com>
In-Reply-To: <20240620-omap-usb-tll-counted_by-v1-0-77797834bb9a@gmail.com>
To: Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718918573; l=1774;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=W3zJRVHu5IEnuNfSbP5xtAFgvUA5i7Y8mIhEvQpuVEQ=;
 b=/3IIqNmJEJL76pd+rsFBNB8jBYg347ZcVZxlYSGQKzVT2BnMqAEEA0zfQ8c5jQTxoh/3HMXZm
 EgVO5Ac5w0fD66ZZMPnIqVLm/lpLzYm8VVSXVmiCOOQxbtk3F5y22OT
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the struct_size macro to calculate the size of the tll, which
includes a trailing flexible array.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

---
The memory allocation used to be carried out in two steps:

tll = devm_kzalloc(dev, sizeof(struct usbtll_omap), GFP_KERNEL);
tll->ch_clk = devm_kzalloc(dev, sizeof(struct clk *) * tll->nch,
                           GFP_KERNEL);

Until commit 16c2004d9e4d ("mfd: omap-usb-tll: Allocate driver data at once")
turned that into the current allocation:

tll = devm_kzalloc(dev, sizeof(*tll) + sizeof(tll->ch_clk[nch]),
                   GFP_KERNEL);

That has surprised me at first glance because I would have expected
sizeof(tll->ch_clk[nch]) to return the size of a single pointer, not
being equivalent to 'sizeof(struct clk *) * nch'.

I might be missing/misunderstanding something here because the commit
is not new, and the error should be noticeable. Moreover, I don't have
real hardware to test it. Hence why I didn't mark this patch as a fix.

I would be pleased to get feedback about this (why it is right as it is,
or if that is actually a bug).
---
 drivers/mfd/omap-usb-tll.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
index a091e5b0f21d..5f25ac514ff2 100644
--- a/drivers/mfd/omap-usb-tll.c
+++ b/drivers/mfd/omap-usb-tll.c
@@ -230,8 +230,7 @@ static int usbtll_omap_probe(struct platform_device *pdev)
 		break;
 	}
 
-	tll = devm_kzalloc(dev, sizeof(*tll) + sizeof(tll->ch_clk[nch]),
-			   GFP_KERNEL);
+	tll = devm_kzalloc(dev, struct_size(tll, ch_clk, nch), GFP_KERNEL);
 	if (!tll) {
 		pm_runtime_put_sync(dev);
 		pm_runtime_disable(dev);

-- 
2.40.1


