Return-Path: <linux-omap+bounces-414-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F0683E853
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jan 2024 01:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 186AB1F221F4
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jan 2024 00:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A79D639;
	Sat, 27 Jan 2024 00:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ANQjOT8w"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1341E2F38
	for <linux-omap@vger.kernel.org>; Sat, 27 Jan 2024 00:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706314818; cv=none; b=uwIUe7f4uEk/vL39J40XKobP0CSHtjGhfMJ2tE/s1ReUnt13sU/+VD11rP8/Scq4eecV5E9tHeIXS4UQDBDlgKYMr6999HksgyeqMG5i0ZbSiN6E81qSrlT44gCU4C1b3JBHwWTC3BDpK9LqgJZf90rHlx+jNyBiMd8frvyqegM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706314818; c=relaxed/simple;
	bh=r6GJCJTqaQQRhKM/4b2T3qgoDHj0cK2/fTlyNuihGgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHJkP5sX64KnnUpYIzVp44o3tSls9aD/fyTIscLxwd9V708AC5IUqD/R9L7PezB2hJMtyd782oLNhMrEYVR7LlBQgstcplGV0f82HgtIWrhGwOZq1RKMr0mZI3QS6jGnPhb5U7y4SiEm+pOgMZuq1I5j0vxK1aC0mAI7hesAEH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ANQjOT8w; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50edf4f478eso1199058e87.3
        for <linux-omap@vger.kernel.org>; Fri, 26 Jan 2024 16:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706314815; x=1706919615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kus8wRLkItgWvRgBCeH/aGV0whUxwXs/muBiM1oKFIc=;
        b=ANQjOT8wKhKeFTolKIrWpzCLwM+5Mjn1CEMsc/IWfzZRn0pwGezxthrptX3MCyHL3c
         fhCrLjB+mJ7z5cZwU9e9/BCaskurrlAXyXg4qEYgxK6m03mpoo04q63+WKhH+I42tM4T
         J6GFISk+G4f/E26GlNVmgWZkmoXQwKTQ/9mGL/UGUWZmRTa4m/Ucm/HMWY7pNmd+pI6u
         ECsDjLbDqfWgJsA3HxNn04LuR9wyJJPDUcn48ko5ffIoDZjPBq4jEX7s4YdKnLTvjs7H
         dAMVpZcLGIPSfA8tnYMJTY5fxUD+Cr0lyBfrapsLyvlCcqDtAKhzoUlACzvDIO27ZZax
         ywGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706314815; x=1706919615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kus8wRLkItgWvRgBCeH/aGV0whUxwXs/muBiM1oKFIc=;
        b=aM9+0IoIG0pkpJH+RhWuWpCse7vwq/8ClIG51oYfjOOBvlXrrOylOdGR1XnxkkXvml
         qpFrEsOzE8ckZN3LGXrbXscaPJbx4t8VMPe/+8sRDF0PjDcTEkD9oHA9016r6NTT08Lg
         ZaRSmqMiJNkLvF+BNmzWPVNbzBVwZnJQqy+cRDUT+jHG0qyrV2uu35V8miaZ4buSGfNU
         X8tGyHNjClpu03cgvp/FCKXCrRZx913unOHhxYdCFt2YQubyZIji3T5Ki5Vv+2j2PSDl
         radaKeUhTxagltjh5lmECpxjNe29rZo0UDfD2XFUR7hoUtA0fzwIiF+GlL/4QphnMnD5
         J4Wg==
X-Gm-Message-State: AOJu0YxxlKYzZ3/g5TnE5ZOZyH+ca8LndDoUtHpJvkI7H2e0eacr/aF4
	1viqWuMYTjnYkhgTgF5LtzTkjy5svFWthZhVaIeDPiHlSIAXqsGIN02vktKQMn0=
X-Google-Smtp-Source: AGHT+IEpxRIR5WbtJSMP9B8XikMs/Wg95wGD4l3znJD007vGaYsPUxly5zh+a+tVyVBz+XzwNXGKnw==
X-Received: by 2002:ac2:5df5:0:b0:50e:5a25:efbf with SMTP id z21-20020ac25df5000000b0050e5a25efbfmr346844lfq.42.1706314814980;
        Fri, 26 Jan 2024 16:20:14 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x25-20020a19f619000000b0050e7f5cffa6sm325226lfe.273.2024.01.26.16.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 16:20:14 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 27 Jan 2024 01:19:50 +0100
Subject: [PATCH v2 3/9] mmc: moxart-mmc: Fix accounting in DMA transfer
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240127-mmc-proper-kmap-v2-3-d8e732aa97d1@linaro.org>
References: <20240127-mmc-proper-kmap-v2-0-d8e732aa97d1@linaro.org>
In-Reply-To: <20240127-mmc-proper-kmap-v2-0-d8e732aa97d1@linaro.org>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, 
 Ming Lei <ming.lei@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Pitre <nico@fluxnic.net>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Angelo Dureghello <angelo.dureghello@timesys.com>
Cc: linux-mmc@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-omap@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

The whole scatterlist chain is submitted to the DMA engine,
but the code is written to just account for the length of
the first sg entry.

When the DMA transfer is finished, all the data in the
request has been transferred, account for this instead.

This only works because the moxart_request() function isn't
checking that all data was transferred and will
unconditionally issue mmc_request_done() after returning
successfully from moxart_transfer_dma().

Keep the assignment of accounted bytes in .bytes_xfered
but move it after the completion where we know it has
actually happened.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/moxart-mmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/moxart-mmc.c b/drivers/mmc/host/moxart-mmc.c
index d12d7d79b19c..8ede4ce93271 100644
--- a/drivers/mmc/host/moxart-mmc.c
+++ b/drivers/mmc/host/moxart-mmc.c
@@ -296,11 +296,11 @@ static void moxart_transfer_dma(struct mmc_data *data, struct moxart_host *host)
 		dma_async_issue_pending(dma_chan);
 	}
 
-	data->bytes_xfered += host->data_remain;
-
 	wait_for_completion_interruptible_timeout(&host->dma_complete,
 						  host->timeout);
 
+	data->bytes_xfered = host->data_len;
+
 	dma_unmap_sg(dma_chan->device->dev,
 		     data->sg, data->sg_len,
 		     mmc_get_dma_dir(data));

-- 
2.34.1


