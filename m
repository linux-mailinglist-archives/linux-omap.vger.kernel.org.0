Return-Path: <linux-omap+bounces-418-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ECC83E85F
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jan 2024 01:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FC5D1C217C7
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jan 2024 00:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD442CA9;
	Sat, 27 Jan 2024 00:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r5Pi+8xs"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB2D1DA34
	for <linux-omap@vger.kernel.org>; Sat, 27 Jan 2024 00:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706314823; cv=none; b=bCiYk1JhKNP6Hy4DYEeFY7HuStZW2Hj/DWK/4Us+LPJwv03bt33KKDxs4ENlKplJsvLcF/Ys5hapPBIu+G3e89zQ78iSr7XgrOU5MkK4KAypi9rtAjiO7J0axVNPhpqLev7TNroVL+Ojm/QC4es3SyMYdk6tfOb1hPL4vCX2tJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706314823; c=relaxed/simple;
	bh=c+9yx9s+5x1GQ5Cg5aBMoAPtZLahUWjRY70l/Q75qhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g8dArW43XoGtuT6sI2gwnNGKZkfS5wZ6UU0ewsYYww+FI+hMhBPN9GUTSBTQIOdymx7RDg1V7SDvDCpdMp93mmoR6dfmGbS6j/XPIN0s3O/qoIo5TQo+cbgQmOn/EJMon25g7xviaYKwzKg2ZwKmHfMpmOUcFgaPhrRU6AcPFy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r5Pi+8xs; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-510133ed214so1588436e87.1
        for <linux-omap@vger.kernel.org>; Fri, 26 Jan 2024 16:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706314819; x=1706919619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwHnRqoneohFsF+zXq7jGhhclsZMo81FOvC/Q025Hhg=;
        b=r5Pi+8xs6BHEq56HV9GpKbVuCOT9jTBkRtlkNyHtt4d8cfV+1C54N1VuripL3AOKMo
         2X5JJaiHdWJvRuMXHbxlE4+pwcaS98vlzmtfTjBaYD4fpeEZqI9kqnLKqO+Wx2cD0fcz
         TvSdVbvccgPLgyNjLHCVz7CzulYC1Mqu9mqgdNnpVpiKlIkb5SvQePJAuufBrEjMvbMP
         BWcdEzxj9oeEDev7DX/5Y7Dg3/Bd+VApYDLXCwmcyZqTKb5Ko+gfewRDCuAH8Kc1xfQy
         OKOKHuleqTknQAraSXtEzjhFpaHEqqQRxccaXOw8TGmNpk7f64BN1pZ4UAqf6CvQbHXS
         lZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706314819; x=1706919619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwHnRqoneohFsF+zXq7jGhhclsZMo81FOvC/Q025Hhg=;
        b=l/1CSqzQnwUwf4FOnKF2iEOSQnesdOaXreXyUI9W+83MPLsEdO/VXbROUVaAXU7cbF
         MQbJW2IQzH49XSmQ4u61LSc4CPVneDDefMC7mxQmqolqQtuznGJk93JVeeNxwJOYr249
         Vs86LWIX3B/1XACedaoQKQEwRGoDaivnpq7qWnPN2cLnMmYIxwakjOrqXs7kU3jnklBV
         cAEyG/1SWYAcU3z3dNa5La064+Rp4TS1PqSs3+PU+u9bW9o0xxK0YDE9IwZme67jUBwd
         duztDkBKXcSWuOiy4x4vSWN/iowXlf69gYR96sVBrFUzwZgP1kLo4tiRstMttM+HemBD
         eS0Q==
X-Gm-Message-State: AOJu0YyshP0x53tTjpFjaJbksCjFrhfrhveuI8jZPnpY/0PFAugPERTP
	Luaj8OdFovvFWCU1bfKIENEhzr9LRxJsBW1ZpJrpbmVV4FCpHTUVHfF1rTbQZWA=
X-Google-Smtp-Source: AGHT+IEdPhZaIgW5YEjxOMV90bFpo9Gsr/GbkwQFTPsWSZMJuPq5Re+iu8QRAdA6o8YVrSRAHloNwQ==
X-Received: by 2002:a19:6448:0:b0:510:c62:bcd4 with SMTP id b8-20020a196448000000b005100c62bcd4mr307969lfj.55.1706314819522;
        Fri, 26 Jan 2024 16:20:19 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x25-20020a19f619000000b0050e7f5cffa6sm325226lfe.273.2024.01.26.16.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 16:20:19 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 27 Jan 2024 01:19:54 +0100
Subject: [PATCH v2 7/9] mmc: omap: Use sg_miter for PIO
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240127-mmc-proper-kmap-v2-7-d8e732aa97d1@linaro.org>
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

Use the scatterlist memory iterator instead of just
dereferencing virtual memory using sg_virt().
This make highmem references work properly.

Suggested-by: Christoph Hellwig <hch@lst.de>
Link: https://lore.kernel.org/linux-mmc/20240122073423.GA25859@lst.de/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/omap.c | 53 ++++++++++++++++++++++---------------------------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index 9fb8995b43a1..088f8ed4fdc4 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -148,10 +148,8 @@ struct mmc_omap_host {
 	struct work_struct      send_stop_work;
 	struct mmc_data		*stop_data;
 
+	struct sg_mapping_iter	sg_miter;
 	unsigned int		sg_len;
-	int			sg_idx;
-	u16 *			buffer;
-	u32			buffer_bytes_left;
 	u32			total_bytes_left;
 
 	unsigned		features;
@@ -456,6 +454,8 @@ mmc_omap_xfer_done(struct mmc_omap_host *host, struct mmc_data *data)
 {
 	if (host->dma_in_use)
 		mmc_omap_release_dma(host, data, data->error);
+	else
+		sg_miter_stop(&host->sg_miter);
 
 	host->data = NULL;
 	host->sg_len = 0;
@@ -651,19 +651,6 @@ mmc_omap_cmd_timer(struct timer_list *t)
 	spin_unlock_irqrestore(&host->slot_lock, flags);
 }
 
-/* PIO only */
-static void
-mmc_omap_sg_to_buf(struct mmc_omap_host *host)
-{
-	struct scatterlist *sg;
-
-	sg = host->data->sg + host->sg_idx;
-	host->buffer_bytes_left = sg->length;
-	host->buffer = sg_virt(sg);
-	if (host->buffer_bytes_left > host->total_bytes_left)
-		host->buffer_bytes_left = host->total_bytes_left;
-}
-
 static void
 mmc_omap_clk_timer(struct timer_list *t)
 {
@@ -676,33 +663,37 @@ mmc_omap_clk_timer(struct timer_list *t)
 static void
 mmc_omap_xfer_data(struct mmc_omap_host *host, int write)
 {
+	struct sg_mapping_iter *sgm = &host->sg_miter;
 	int n, nwords;
+	u16 *buffer;
 
-	if (host->buffer_bytes_left == 0) {
-		host->sg_idx++;
-		BUG_ON(host->sg_idx == host->sg_len);
-		mmc_omap_sg_to_buf(host);
+	if (!sg_miter_next(sgm)) {
+		/* This should not happen */
+		dev_err(mmc_dev(host->mmc), "ran out of scatterlist prematurely\n");
+		return;
 	}
+	buffer = sgm->addr;
+
 	n = 64;
-	if (n > host->buffer_bytes_left)
-		n = host->buffer_bytes_left;
+	if (n > sgm->length)
+		n = sgm->length;
+	if (n > host->total_bytes_left)
+		n = host->total_bytes_left;
 
 	/* Round up to handle odd number of bytes to transfer */
 	nwords = DIV_ROUND_UP(n, 2);
 
-	host->buffer_bytes_left -= n;
+	sgm->consumed = n;
 	host->total_bytes_left -= n;
 	host->data->bytes_xfered += n;
 
 	if (write) {
 		__raw_writesw(host->virt_base + OMAP_MMC_REG(host, DATA),
-			      host->buffer, nwords);
+			      buffer, nwords);
 	} else {
 		__raw_readsw(host->virt_base + OMAP_MMC_REG(host, DATA),
-			     host->buffer, nwords);
+			     buffer, nwords);
 	}
-
-	host->buffer += nwords;
 }
 
 #ifdef CONFIG_MMC_DEBUG
@@ -956,6 +947,7 @@ static inline void set_data_timeout(struct mmc_omap_host *host, struct mmc_reque
 static void
 mmc_omap_prepare_data(struct mmc_omap_host *host, struct mmc_request *req)
 {
+	unsigned int miter_flags = SG_MITER_ATOMIC; /* Used from IRQ */
 	struct mmc_data *data = req->data;
 	int i, use_dma = 1, block_size;
 	struct scatterlist *sg;
@@ -990,7 +982,6 @@ mmc_omap_prepare_data(struct mmc_omap_host *host, struct mmc_request *req)
 		}
 	}
 
-	host->sg_idx = 0;
 	if (use_dma) {
 		enum dma_data_direction dma_data_dir;
 		struct dma_async_tx_descriptor *tx;
@@ -1071,7 +1062,11 @@ mmc_omap_prepare_data(struct mmc_omap_host *host, struct mmc_request *req)
 	OMAP_MMC_WRITE(host, BUF, 0x1f1f);
 	host->total_bytes_left = data->blocks * block_size;
 	host->sg_len = sg_len;
-	mmc_omap_sg_to_buf(host);
+	if (data->flags & MMC_DATA_READ)
+		miter_flags |= SG_MITER_TO_SG;
+	else
+		miter_flags |= SG_MITER_FROM_SG;
+	sg_miter_start(&host->sg_miter, data->sg, data->sg_len, miter_flags);
 	host->dma_in_use = 0;
 }
 

-- 
2.34.1


