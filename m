Return-Path: <linux-omap+bounces-417-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C446B83E85E
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jan 2024 01:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B19728D514
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jan 2024 00:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472F5257B;
	Sat, 27 Jan 2024 00:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pN9WT0GY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC4C1D69F
	for <linux-omap@vger.kernel.org>; Sat, 27 Jan 2024 00:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706314822; cv=none; b=YXQu3upz9YZ4eKP/SWIax8iBHIXk1j/I5PbOMWjoaPicBfieUf9KViqZJD5HGtZLSn6xdLcLl3TdwFmYUAofynTn2tJ2JmuwjF/g2GUQ7NBkkjPyCK/+kDSra57mRBOhHhPHZzb7Blz1hOTJ2frSAu15qPaFqVkvUoNeDHaSdEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706314822; c=relaxed/simple;
	bh=HYmGgaLgWEX6oEn5bgILT9HdCgPRXmSHSVRfD6iUtog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4gbEHKTjKqPUBsH9kWl+XxIXd+ogM9j84jj/+nC/vpmV+ipSa+SOVH0O0UiyxOrx6F6/s8n9OP30mfItWm+kwVWwOs0EoIN1FkgzbGp5rU5Lk5S6TUhc7C8tbZQVkI+bh6/+z5YJeWQmUWxh60Y7o744balAeLf3n8so70tu9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pN9WT0GY; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50ea9daac4cso965147e87.3
        for <linux-omap@vger.kernel.org>; Fri, 26 Jan 2024 16:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706314818; x=1706919618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXmkhj6L70OQxNCX7S7WA9V64VMJ9cP8ih0oj9vAqT4=;
        b=pN9WT0GYU2aFARDqTA8f1jSGEHuuxnY1cye9moMOqpsqVUoIFW4eLFLkb3ISKDFjkf
         yaKNdbO/HMpagsC/USLrIYGcZNwB6qmHI0h4axQw98kfKdk2vPVsqKYn8X3af3HQ8hrR
         nzrrYh1r4Edzybn3T3ftJsTBgfL2px6fxo1kCOeH8KMAvOJeIAglyo84DhvZin5pCVZC
         WvAPrdUxiLP8WEq1OZGEfqBpFarn3tDh6I5Ejqlk6/7q33FlJ9c05gdiXgAESFhKgYcN
         DU5KxIGuwPI16wHnWm7nKvz0rmkzCOgqsPmpbdb49AVdktiNmHJ4Uuy1ZVNDviNXHq03
         6JFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706314818; x=1706919618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXmkhj6L70OQxNCX7S7WA9V64VMJ9cP8ih0oj9vAqT4=;
        b=XEejmXRbh7EPiUwq22GSzd53Yc/oFJuDh7p5VZH7SX8mYByhEX8U21G31b2NiZSKmm
         wuNgEalxrp/sQxj1/Or/0Cd7uAbjO2sz0tzItOYqz4WfS07Xm7KsjmIrFxhWeZr360ar
         KfhnIozYE8dn5xYedQmcuRWFwzF31p8j4DgCX6L/dorKZdkQLRwyj82p4OERFJdrPLRM
         X1cC9EsQ6rbqnVGcALJWxdnnsOukbmlFme5l/K6rKDeF2JMQT7oy9dlS23oIvAPq4hKt
         lPq5hWjRuIULMQI78eyiOlaGekoYX+cmtroOVUlxD8ZlColEpef8szvq5tdyoiv4p13T
         Fpsg==
X-Gm-Message-State: AOJu0Ywp+BEmJkho0faIh4fZAarbI9+VMut5Rx35cNAZEVpWnDMmZpdu
	+xRilMgm3Y+CgFem3t7RE3tCOrkkR2IOg1HdXTdDFiolx/LY06bstWpOF+Zq6cQ=
X-Google-Smtp-Source: AGHT+IFLVN7BK0qbc3Zc65OltD6GZpGHMU9ydl9RCyNJ4EpmANWYgk2ANjlW0TtzuDB0dHkxtZ0FOw==
X-Received: by 2002:a05:6512:3046:b0:510:67d:22c7 with SMTP id b6-20020a056512304600b00510067d22c7mr351403lfb.69.1706314818624;
        Fri, 26 Jan 2024 16:20:18 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x25-20020a19f619000000b0050e7f5cffa6sm325226lfe.273.2024.01.26.16.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 16:20:18 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 27 Jan 2024 01:19:53 +0100
Subject: [PATCH v2 6/9] mmc: mxcmmc: Use sg_miter for PIO
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240127-mmc-proper-kmap-v2-6-d8e732aa97d1@linaro.org>
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

Since this driver is using a worker, no atomic trickery
is needed.

Suggested-by: Christoph Hellwig <hch@lst.de>
Link: https://lore.kernel.org/linux-mmc/20240122073423.GA25859@lst.de/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/mxcmmc.c | 53 +++++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
index 5b3ab0e20505..1edf65291354 100644
--- a/drivers/mmc/host/mxcmmc.c
+++ b/drivers/mmc/host/mxcmmc.c
@@ -266,11 +266,18 @@ static inline void buffer_swap32(u32 *buf, int len)
 
 static void mxcmci_swap_buffers(struct mmc_data *data)
 {
-	struct scatterlist *sg;
-	int i;
+	struct sg_mapping_iter sgm;
+	u32 *buf;
+
+	sg_miter_start(&sgm, data->sg, data->sg_len,
+		       SG_MITER_TO_SG | SG_MITER_FROM_SG);
+
+	while (sg_miter_next(&sgm)) {
+		buf = sgm.addr;
+		buffer_swap32(buf, sgm.length);
+	}
 
-	for_each_sg(data->sg, sg, data->sg_len, i)
-		buffer_swap32(sg_virt(sg), sg->length);
+	sg_miter_stop(&sgm);
 }
 #else
 static inline void mxcmci_swap_buffers(struct mmc_data *data) {}
@@ -526,10 +533,9 @@ static int mxcmci_poll_status(struct mxcmci_host *host, u32 mask)
 	} while (1);
 }
 
-static int mxcmci_pull(struct mxcmci_host *host, void *_buf, int bytes)
+static int mxcmci_pull(struct mxcmci_host *host, u32 *buf, int bytes)
 {
 	unsigned int stat;
-	u32 *buf = _buf;
 
 	while (bytes > 3) {
 		stat = mxcmci_poll_status(host,
@@ -555,10 +561,9 @@ static int mxcmci_pull(struct mxcmci_host *host, void *_buf, int bytes)
 	return 0;
 }
 
-static int mxcmci_push(struct mxcmci_host *host, void *_buf, int bytes)
+static int mxcmci_push(struct mxcmci_host *host, u32 *buf, int bytes)
 {
 	unsigned int stat;
-	u32 *buf = _buf;
 
 	while (bytes > 3) {
 		stat = mxcmci_poll_status(host, STATUS_BUF_WRITE_RDY);
@@ -586,31 +591,39 @@ static int mxcmci_push(struct mxcmci_host *host, void *_buf, int bytes)
 static int mxcmci_transfer_data(struct mxcmci_host *host)
 {
 	struct mmc_data *data = host->req->data;
-	struct scatterlist *sg;
-	int stat, i;
+	struct sg_mapping_iter sgm;
+	int stat;
+	u32 *buf;
 
 	host->data = data;
 	host->datasize = 0;
+	sg_miter_start(&sgm, data->sg, data->sg_len,
+		       (data->flags & MMC_DATA_READ) ? SG_MITER_TO_SG : SG_MITER_FROM_SG);
 
 	if (data->flags & MMC_DATA_READ) {
-		for_each_sg(data->sg, sg, data->sg_len, i) {
-			stat = mxcmci_pull(host, sg_virt(sg), sg->length);
+		while (sg_miter_next(&sgm)) {
+			buf = sgm.addr;
+			stat = mxcmci_pull(host, buf, sgm.length);
 			if (stat)
-				return stat;
-			host->datasize += sg->length;
+				goto transfer_error;
+			host->datasize += sgm.length;
 		}
 	} else {
-		for_each_sg(data->sg, sg, data->sg_len, i) {
-			stat = mxcmci_push(host, sg_virt(sg), sg->length);
+		while (sg_miter_next(&sgm)) {
+			buf = sgm.addr;
+			stat = mxcmci_push(host, buf, sgm.length);
 			if (stat)
-				return stat;
-			host->datasize += sg->length;
+				goto transfer_error;
+			host->datasize += sgm.length;
 		}
 		stat = mxcmci_poll_status(host, STATUS_WRITE_OP_DONE);
 		if (stat)
-			return stat;
+			goto transfer_error;
 	}
-	return 0;
+
+transfer_error:
+	sg_miter_stop(&sgm);
+	return stat;
 }
 
 static void mxcmci_datawork(struct work_struct *work)

-- 
2.34.1


