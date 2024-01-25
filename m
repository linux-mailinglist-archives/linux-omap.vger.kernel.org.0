Return-Path: <linux-omap+bounces-369-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD13983C4DC
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jan 2024 15:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFEEF1C221FC
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jan 2024 14:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2096EB49;
	Thu, 25 Jan 2024 14:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XleSXefY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDB36E2D1
	for <linux-omap@vger.kernel.org>; Thu, 25 Jan 2024 14:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706193433; cv=none; b=sP8bKxYZ/JY94BdPUuYZ045nlMPF69o6Z8qTmXeEhdYPaqA4Ady0OMlTTho8zIh3Fq8/sNNQf8rJdyBlhhYu9TrF+7PfPXyAZc0pbDvIoXmbY68EAyk9zzMs39HffJxuKsq5U8hluwIj8shlDgp/BtElEg5prBnA/KSuNHv5IrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706193433; c=relaxed/simple;
	bh=G4/hgPajp0i7ZbgcSS3IunhzrTBYec3u+HmofLpC6eA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QV1FV91mgdp4Y05XV3Si2BsQoD6518HtQxwIHMRYUUm13bxPMz0kGRvWaP1DYEIr3GQeYecQJcrl5uwPYSWOYQe6cCb9k/1y0al15B0tMNbsh9ztXko8F/ncXRJGRbXYNgv8+MlUFUDsMDDn6nA5jAeeXDzgqK7jevdSegtsxE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XleSXefY; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cf35e5c2ddso7427841fa.2
        for <linux-omap@vger.kernel.org>; Thu, 25 Jan 2024 06:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706193430; x=1706798230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f43KvRvUGeX/b0EUJRmkX0ZbThJsQoZyHADR9QN2mtQ=;
        b=XleSXefYnmRAn8b/0DPQu2sYAPmtMxWbaxtOg/scqryF/TV5gVCDeATbuiS+T7YfnL
         t1CYP5aXcROtx5v5Os2kkAy588Q8YO63STjZiZMr3JEUNBvc+3hJ3Llpj6OC1j5qcX7q
         fkcSCaTFOPUFePF6Z6RFbq2F34P7akWaYIczphNoLPU98A+SHz5mzy66KoqRYB1mE5D0
         PxjOJbHvk8w+8ZkDdwveET0tQCU6nmVDwLBvxtDYHyC5ZCuWCUjdYFKUc19xOVJtSEBM
         ugnI7BeVz/7pkiUgrEL1MD9AyPtij9iYsvYQR6HjluJ5DMmyggcRlkQk50PZFkwvIH+s
         6pJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706193430; x=1706798230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f43KvRvUGeX/b0EUJRmkX0ZbThJsQoZyHADR9QN2mtQ=;
        b=lFUcExvW5eBvaxfqpmoVgSWbinQlk5YWuIlprmiCv3TTLBffJHajDAkGgwWunUfvxL
         PJ3m7rB/yUoO+CL3tOdKoU1HuifgHL3DoChHHEeWHFXKyf5fZMH1xvk1kgDty+e06jan
         8eJ+Lba0YA1DNH71ptwpG6Li7N+e+8aqp6199DWYpawA9Kk388/muGgMcPO7Ak3jTVzy
         u6wTOcGVlbMSN8/HKfI0IZWL3WsqPuvIyZYwTDxwpPKcYxBfzquLLk+iHR4xafS/e9zq
         uBZZjBMNlPX+0Erl7Ik/yPPwM9hjdtRDvUNE0AhC+AbI4UCQWBvuXOIrvQaOcc2m+8T3
         6PTQ==
X-Gm-Message-State: AOJu0YxJWGmRVEYvYrao3YJv8ZwY9+N49OF4kZsP0LkZR6P4kjKyUUYl
	pGu/+jkFmzd7sp50IL6h18KJFi3eaXCllYbtB/rIqI8y5g8v+nudYI5cjtnVxM4=
X-Google-Smtp-Source: AGHT+IHlljf93ZvwCDfA3yWKFoRN5Nc0r9yERDrrItXR8g5zHO9eHlJ2iaQUkWwkQKVa4fEPwIhv+A==
X-Received: by 2002:a2e:9997:0:b0:2cf:3ee1:3ec8 with SMTP id w23-20020a2e9997000000b002cf3ee13ec8mr352461lji.97.1706193430084;
        Thu, 25 Jan 2024 06:37:10 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id y24-20020a2e3218000000b002ce098d3f0asm292644ljy.115.2024.01.25.06.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:37:09 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 Jan 2024 15:37:07 +0100
Subject: [PATCH 3/7] mmc: mvsdio: Map the virtual page for PIO
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240125-mmc-proper-kmap-v1-3-ba953c1ac3f9@linaro.org>
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
 drivers/mmc/host/mvsdio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mvsdio.c b/drivers/mmc/host/mvsdio.c
index ca01b7d204ba..a004a523bd2a 100644
--- a/drivers/mmc/host/mvsdio.c
+++ b/drivers/mmc/host/mvsdio.c
@@ -115,7 +115,7 @@ static int mvsd_setup_data(struct mvsd_host *host, struct mmc_data *data)
 		 * boundary.
 		 */
 		host->pio_size = data->blocks * data->blksz;
-		host->pio_ptr = sg_virt(data->sg);
+		host->pio_ptr = kmap_local_page(sg_page(data->sg));
 		if (!nodma)
 			dev_dbg(host->dev, "fallback to PIO for data at 0x%p size %d\n",
 				host->pio_ptr, host->pio_size);
@@ -289,6 +289,7 @@ static u32 mvsd_finish_data(struct mvsd_host *host, struct mmc_data *data,
 	void __iomem *iobase = host->base;
 
 	if (host->pio_ptr) {
+		kunmap_local(host->pio_ptr);
 		host->pio_ptr = NULL;
 		host->pio_size = 0;
 	} else {

-- 
2.34.1


