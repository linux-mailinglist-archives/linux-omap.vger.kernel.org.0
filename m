Return-Path: <linux-omap+bounces-371-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB0283C4E1
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jan 2024 15:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0A9C28DB7D
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jan 2024 14:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B006E2C0;
	Thu, 25 Jan 2024 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SmtdUXOm"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDC16E2C1
	for <linux-omap@vger.kernel.org>; Thu, 25 Jan 2024 14:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706193435; cv=none; b=nvGtCB8BLgBRthQliXUZSJ1iG3IU2oe4LYspnK7pynagTkg1W7/SvWgEcajEKXVXpjLBzmVmDtZLku7V0FN05J3COTPyZHcqpqspvuenxUhAp1qTOXSl7sXRanf6YUkKx7rc9wIaswbiqkegM5HDCOQqEtp0f4Rh1SIcDQJx/lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706193435; c=relaxed/simple;
	bh=pUZtYFBBlHN8KyLIIWT/pGwPDvdvelKcOTK2YttzmRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U/B5BhD/PYAMK8sR7QKcXcOYjFfCCL0FLC3aJo0DPOPFZG0KSl4cypPxjaHocM52UqHhvwrmTHiJASPCwvIA76yAMxjaNuPth6c4y291jJpeKU5RZR0z5e0GywPT60dZwphp9UZEnDn5L8TFHSLh8FfPW8BRoREY/MuvjIRubwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SmtdUXOm; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cdf69bb732so74438731fa.3
        for <linux-omap@vger.kernel.org>; Thu, 25 Jan 2024 06:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706193431; x=1706798231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyHJ1LdSzxdGYRgoY28wDm0mOxVwJzTlbadUPi2PKz8=;
        b=SmtdUXOmEMILtfyQWHXeo94UuVONO5iCga5GN6evKF55vH7Gk2oiKL5rQTLUBOsLyq
         J6+ZqsgHFyNkjuuulOdL3/klcEbijmPKlZZ5aWVsvfsk8/AP+8NSiWA4YyxJbeLU+lbz
         Q7wwCDaMsSdFoSEvICkpMup3LaSikNvsP7tgWWVdQU5L+LfSRWPoxkBPhOZ37T7aoUsE
         5QuEhiKN9wN4iZAKsKLPtbiboxNl7O/c9SWFW6Vx/g6ZjaUBBEWgnrL1K5bU967WxTgs
         j8IZlCwhSHLYiajAFe13VeQZgncoIw1WnTcCyObEGgqIHI6W075sEqlidvPEb46uM+VA
         JrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706193431; x=1706798231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zyHJ1LdSzxdGYRgoY28wDm0mOxVwJzTlbadUPi2PKz8=;
        b=MvxyZdKtOwnh0qDxFTkdUGqrwcY19L5tqsa6Od75BI6oA6Xe6a61bhZf52XBCUmgVv
         SvTft5MV+cku5aX98pSYTSv0R3M3SSqGq5HNSUk0yBThStmQ6gmOsvd6mSqQKH+Svf9w
         53wIMh+aKLU0agg9SXN7z/EGKl0g0eIA+74CLSrrofI5h4Jm/eNFgovjiNj52p6lavUm
         A7+nUlKE/xIRypXQ+DEIAAfQNM29uIpLWtX2oPCCiPUxf8XQwMms2Z4ols5WEUzf9mId
         YuvkhF3ihojeaUpwJXjHmW4Wiv4RpoQQG9mz1e9bFqn9r1/I7J/VJlyVZsvonq5sUnsg
         bnZQ==
X-Gm-Message-State: AOJu0YwV2cF+T2occWmSIuoSzV+Umm5CQ9MTYnZeDg3CqI48CDrFa7j5
	tHuMRuRLPmfb0iVojew99pJox1AKsu0JztDq55JUkgTy07lqj55b18Y/ftEq0c0=
X-Google-Smtp-Source: AGHT+IFrJ8hL28N/GPgAO89+Cnk9L5mTBanlXR+Nwy7guR2IiE861T+3zzVsxJRpdO2fpqS6NSVwhg==
X-Received: by 2002:a2e:9890:0:b0:2cf:34b4:63e2 with SMTP id b16-20020a2e9890000000b002cf34b463e2mr370061ljj.204.1706193431049;
        Thu, 25 Jan 2024 06:37:11 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id y24-20020a2e3218000000b002ce098d3f0asm292644ljy.115.2024.01.25.06.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:37:10 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 Jan 2024 15:37:08 +0100
Subject: [PATCH 4/7] mmc: mxcmmc: Map the virtual page for PIO
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240125-mmc-proper-kmap-v1-4-ba953c1ac3f9@linaro.org>
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
 drivers/mmc/host/mxcmmc.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
index 5b3ab0e20505..04c0e4ea02ff 100644
--- a/drivers/mmc/host/mxcmmc.c
+++ b/drivers/mmc/host/mxcmmc.c
@@ -267,10 +267,14 @@ static inline void buffer_swap32(u32 *buf, int len)
 static void mxcmci_swap_buffers(struct mmc_data *data)
 {
 	struct scatterlist *sg;
+	u32 *buf;
 	int i;
 
-	for_each_sg(data->sg, sg, data->sg_len, i)
-		buffer_swap32(sg_virt(sg), sg->length);
+	for_each_sg(data->sg, sg, data->sg_len, i) {
+		buf = kmap_local_page(sg_page(sg));
+		buffer_swap32(buf, sg->length);
+		kunmap_local(buf);
+	}
 }
 #else
 static inline void mxcmci_swap_buffers(struct mmc_data *data) {}
@@ -526,10 +530,9 @@ static int mxcmci_poll_status(struct mxcmci_host *host, u32 mask)
 	} while (1);
 }
 
-static int mxcmci_pull(struct mxcmci_host *host, void *_buf, int bytes)
+static int mxcmci_pull(struct mxcmci_host *host, u32 *buf, int bytes)
 {
 	unsigned int stat;
-	u32 *buf = _buf;
 
 	while (bytes > 3) {
 		stat = mxcmci_poll_status(host,
@@ -555,10 +558,9 @@ static int mxcmci_pull(struct mxcmci_host *host, void *_buf, int bytes)
 	return 0;
 }
 
-static int mxcmci_push(struct mxcmci_host *host, void *_buf, int bytes)
+static int mxcmci_push(struct mxcmci_host *host, u32 *buf, int bytes)
 {
 	unsigned int stat;
-	u32 *buf = _buf;
 
 	while (bytes > 3) {
 		stat = mxcmci_poll_status(host, STATUS_BUF_WRITE_RDY);
@@ -588,20 +590,25 @@ static int mxcmci_transfer_data(struct mxcmci_host *host)
 	struct mmc_data *data = host->req->data;
 	struct scatterlist *sg;
 	int stat, i;
+	u32 *buf;
 
 	host->data = data;
 	host->datasize = 0;
 
 	if (data->flags & MMC_DATA_READ) {
 		for_each_sg(data->sg, sg, data->sg_len, i) {
-			stat = mxcmci_pull(host, sg_virt(sg), sg->length);
+			buf = kmap_local_page(sg_page(sg));
+			stat = mxcmci_pull(host, buf, sg->length);
+			kunmap_local(buf);
 			if (stat)
 				return stat;
 			host->datasize += sg->length;
 		}
 	} else {
 		for_each_sg(data->sg, sg, data->sg_len, i) {
-			stat = mxcmci_push(host, sg_virt(sg), sg->length);
+			buf = kmap_local_page(sg_page(sg));
+			stat = mxcmci_push(host, buf, sg->length);
+			kunmap_local(buf);
 			if (stat)
 				return stat;
 			host->datasize += sg->length;

-- 
2.34.1


