Return-Path: <linux-omap+bounces-372-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 502F383C4E4
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jan 2024 15:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4B2CB239C5
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jan 2024 14:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C515D6EB5D;
	Thu, 25 Jan 2024 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AzuRf5mY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04616EB44
	for <linux-omap@vger.kernel.org>; Thu, 25 Jan 2024 14:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706193435; cv=none; b=eGcQNNHDEhC0H8XME1/CowhlG+KvrXXmMd4G7b1sClREu8AtTZ2YItdxObpaNyKTCkcHmo+4NN2M2WPPJ59hjN8lkGey0wmUnBO7MSVOK67Jk1jl5jblvFfRVQc7LZV8s9QN5FRPllF7N1q28/onhLDcR2+0dAfJHv35QDcdHnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706193435; c=relaxed/simple;
	bh=0MaLjPvVAK/Cs5uLyHsHrUqQa22L5UcKTRzT/Bd+/TE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nkIwB6DGC1/Kdd53L5LBu3IJLlHgnHkn96Tp2sGv+zZxNx55kDAWpRLQ16vdhLqJjN1RbRANX9vT91eGndfGxL8jPPoe03l0Wktwv6L69ZXz2W1IL/aBz6CouspYc+VUx+6Ze71a5ZRRRB+pl1WddK/Belbui6XHsCeDms4Cgd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AzuRf5mY; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cf33b909e8so7533731fa.0
        for <linux-omap@vger.kernel.org>; Thu, 25 Jan 2024 06:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706193432; x=1706798232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMZtopgbN/6mQ0cUEkngEk6XwZC8BFLt+hjmWJEWvjI=;
        b=AzuRf5mYFkYYq1KgoxCGLREJC+z+q5yoKObRTy4qqG1+Ilb6SPtsJmIdCXAVW2tACu
         J+sHv9yPU8mIQW6MVx7BBlzIrFIYiwHTlhyHUjQ6dprMdk3Mvdo+neSOZz/Wndztfj4v
         fuSddKt7uXW6mqgrRGisDV5M97tqIqky7xkFVl+KMCauTrMKNholsqX106C8hAvWw6Xw
         tgknanGLdGIa94Lj3Hsnd7jWZPER3Zx3NV7gTXxTwm4ag2Zjn+8Htow9O9/K3D2+LDuD
         bT6Mclt+v/l+ky3sPPKuvT7OYJxp//CacJ7sUfxOB0TojgDB61U9li7Beb/fVQ8GtV0G
         gYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706193432; x=1706798232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMZtopgbN/6mQ0cUEkngEk6XwZC8BFLt+hjmWJEWvjI=;
        b=YKD+ZVzDQdIHz0vEH/PUBIso2rbqKPwAGP2PoMInp9zVEhDdc7TMnUckYrlHW2R3Xr
         GZhibxcetObbu5HXsQ50lO4ZWmLWdfoqIArrVnYvJkfm7Rf748P0cdrJl8qZo8HyLsh9
         sFJDhjzijwHkwjk3OqpRZhbJcJPc1NTumDMrI4yqHFPDGTPZE0BuhX5mwvBNTznJUAba
         DzDo3lJF4qDcGOzcaZ2zhYiZIcLW8wU7RaHUpWSC4ze5CNy0fOqtAus9Q/LAVtGNdRw5
         pgg95E2S/FCBaK5edHEZHkruAx/2DwADmKFrFrf+O82wJd9Tm+IZGSWE84DBSb3xPMoU
         MEYQ==
X-Gm-Message-State: AOJu0Yx+QPI8JDrzJq39VWvBhx2oLOJJCEE8EsRB6COgGuHvU6U4cq1a
	b85HCaCxHbopRwkD6R/prIbHkUJhjhzcai9qlmVmXaRl00MRerpEwtt+Fsk3EQk=
X-Google-Smtp-Source: AGHT+IG8fvrFL4nSLXe+ci61toej0QyVWsGZLLzDkrvRpvcBhGeNxbHJDgzn0gMd+tOrjICpC3tOsw==
X-Received: by 2002:a2e:bcc7:0:b0:2cc:78b7:1ef0 with SMTP id z7-20020a2ebcc7000000b002cc78b71ef0mr979999ljp.4.1706193431959;
        Thu, 25 Jan 2024 06:37:11 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id y24-20020a2e3218000000b002ce098d3f0asm292644ljy.115.2024.01.25.06.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:37:11 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 Jan 2024 15:37:09 +0100
Subject: [PATCH 5/7] mmc: omap: Map the virtual page for PIO
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240125-mmc-proper-kmap-v1-5-ba953c1ac3f9@linaro.org>
References: <20240125-mmc-proper-kmap-v1-0-ba953c1ac3f9@linaro.org>
In-Reply-To: <20240125-mmc-proper-kmap-v1-0-ba953c1ac3f9@linaro.org>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, 
 Ming Lei <ming.lei@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Pitre <nico@fluxnic.net>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Angelo Dureghello <angelo.dureghello@timesys.com>
Cc: linux-mmc@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-omap@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

Use kmap_local_page() instead of sg_virt() to obtain a page
from the scatterlist: sg_virt() will not perform bounce
buffering if the page happens to be located in high memory,
which the driver may or may not be using.

Suggested-by: Christoph Hellwig <hch@lst.de>
Link: https://lore.kernel.org/linux-mmc/20240122073423.GA25859@lst.de/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/omap.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index 9fb8995b43a1..3e36480b22ad 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -659,7 +659,7 @@ mmc_omap_sg_to_buf(struct mmc_omap_host *host)
 
 	sg = host->data->sg + host->sg_idx;
 	host->buffer_bytes_left = sg->length;
-	host->buffer = sg_virt(sg);
+	host->buffer = kmap_local_page(sg_page(sg));
 	if (host->buffer_bytes_left > host->total_bytes_left)
 		host->buffer_bytes_left = host->total_bytes_left;
 }
@@ -691,6 +691,11 @@ mmc_omap_xfer_data(struct mmc_omap_host *host, int write)
 	nwords = DIV_ROUND_UP(n, 2);
 
 	host->buffer_bytes_left -= n;
+	if (host->buffer_bytes_left == 0) {
+		kunmap_local(host->buffer);
+		host->buffer = NULL;
+	}
+
 	host->total_bytes_left -= n;
 	host->data->bytes_xfered += n;
 

-- 
2.34.1


