Return-Path: <linux-omap+bounces-419-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 808DB83E862
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jan 2024 01:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D75B28D883
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jan 2024 00:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAE94698;
	Sat, 27 Jan 2024 00:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M4fXkVNu"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC35A31
	for <linux-omap@vger.kernel.org>; Sat, 27 Jan 2024 00:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706314824; cv=none; b=I3g5JtTxhipcr75JKv+MX4V0SVEfz2aVihTCg1O8jFlrtxftSEFmPO47fgRsiPcMFyaqvY4KCEO8JHXWuN0HyPv6chZMt8BYa9jYa5a3km6HlfUjWVh/lhGKJrD6apZjH4QUsb0aIFSOAKrcxdtBPfrx2D2WjK0yC0cfGpabhIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706314824; c=relaxed/simple;
	bh=11tgqTYTTcAC/xg5mxKcSDPSUwbnuZsCql+ezd70tYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K1eh2ytIWY+kMPFAHuCc+vkWaQK7zl/y4mUEEVwcIH5am5WQtVH+JK07CpeqEKCmnG36dH6UQsItK6wI5dTsTjh7hCwvySWc7l/mP6fjoBfxKVvLm1ZlqnjHEWEyVf2OrR1HMdHPxEIADm2aKKw015vSx2yy7GpE/+Nkm9sB6Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M4fXkVNu; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5100cb64e7dso1401537e87.0
        for <linux-omap@vger.kernel.org>; Fri, 26 Jan 2024 16:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706314820; x=1706919620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OF+atUpH2jGXdb8/KiqqDPha8EDyadeWwvv8sbSBzHk=;
        b=M4fXkVNuCAPPcn7ZXSnRL8SP3zLpOJUqHIoVJrAlQHMP/rMy56qtbN3Fv6Tql1/8EB
         0mlcxFm9YsXFRA3+Axi1L/hqrUjVA/DzmaNIdFAcsMj5rYdVFGsSdHHugnLGl6IP+Sb5
         BBFdcxXGrmamiWLVTt453/IrL3XDDzfFa4rl+ONwLG/1Md6KYe2HEtiK86GlfXQrKAjk
         ErDQ1Ox8BUgCYAvCJ4QGwlrg8Lgcy+oOMs/3W2robN5rZhtdV6e9DiTRbdwpUh+VTt60
         WDWq9cJGsPBrvZkxrzsrAMwgwn54tb1O2zJdNBUxji30qdVNKH/U0VLyhpUAT2rzJSKD
         UIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706314820; x=1706919620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OF+atUpH2jGXdb8/KiqqDPha8EDyadeWwvv8sbSBzHk=;
        b=ePKk4glCccALpbMxuC6Ibv7WLWbV52iq8+zjdpeHOy9+8EXTn2AlIbO+kKewTyegno
         5e+4Sqxzfs/cmXYwa2YpBMBW8/Uow38FZex51WPNhtwT94T4SaKC9mOvIDd9iwiGv87k
         E7WKNNmRqfUhE5+qQQOXQjerEoO13wvpCYZd2Zgs89tihHjZTes59quEon9Zeeh9fK6f
         ibQbqjoY5pbED1U4iIxQ/+UhRfCMuq4nYwm5SWXPbaJmOkIP3L8oa8JezCxnhteLz7cz
         g0+lokGji8VkQXFJgQHm+F3GK1QbQOAywcnAwLxpIWOhrMy8aULYHc9eNSXY814p9TFL
         UnUQ==
X-Gm-Message-State: AOJu0YzDFxdDkVd/Eu/OvE/Dht2mnL1CLLPyyOKzW28GUmdXEgK4Fs0F
	hlia0uaXOvvrwABxM9STLMHU3p9ch9MwhwQtok/xM/j++pLlQw38exPdwekTrVk=
X-Google-Smtp-Source: AGHT+IGu2Zjg0R7ovqlG5rze1HiowsVGljfHEkvyIteXZVo1ZS9Bo68Lc0U++8crpiCyQbpFoddHYg==
X-Received: by 2002:a05:6512:2204:b0:510:27f2:2621 with SMTP id h4-20020a056512220400b0051027f22621mr224564lfu.23.1706314820506;
        Fri, 26 Jan 2024 16:20:20 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x25-20020a19f619000000b0050e7f5cffa6sm325226lfe.273.2024.01.26.16.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 16:20:20 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 27 Jan 2024 01:19:55 +0100
Subject: [PATCH v2 8/9] mmc: sdhci-esdhc-mcf: Use sg_miter for swapping
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240127-mmc-proper-kmap-v2-8-d8e732aa97d1@linaro.org>
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

Use sg_miter iterator instead of sg_virt() and custom code
to loop over the scatterlist. The memory iterator will do
bounce buffering if the page happens to be located in high memory,
which the driver may or may not be using.

Suggested-by: Christoph Hellwig <hch@lst.de>
Link: https://lore.kernel.org/linux-mmc/20240122073423.GA25859@lst.de/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/sdhci-esdhc-mcf.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-mcf.c b/drivers/mmc/host/sdhci-esdhc-mcf.c
index a07f8333cd6b..1909a11fd065 100644
--- a/drivers/mmc/host/sdhci-esdhc-mcf.c
+++ b/drivers/mmc/host/sdhci-esdhc-mcf.c
@@ -299,9 +299,8 @@ static void esdhc_mcf_pltfm_set_bus_width(struct sdhci_host *host, int width)
 static void esdhc_mcf_request_done(struct sdhci_host *host,
 				   struct mmc_request *mrq)
 {
-	struct scatterlist *sg;
+	struct sg_mapping_iter sgm;
 	u32 *buffer;
-	int i;
 
 	if (!mrq->data || !mrq->data->bytes_xfered)
 		goto exit_done;
@@ -313,10 +312,13 @@ static void esdhc_mcf_request_done(struct sdhci_host *host,
 	 * On mcf5441x there is no hw sdma option/flag to select the dma
 	 * transfer endiannes. A swap after the transfer is needed.
 	 */
-	for_each_sg(mrq->data->sg, sg, mrq->data->sg_len, i) {
-		buffer = (u32 *)sg_virt(sg);
-		esdhc_mcf_buffer_swap32(buffer, sg->length);
+	sg_miter_start(&sgm, mrq->data->sg, mrq->data->sg_len,
+		       SG_MITER_TO_SG | SG_MITER_FROM_SG);
+	while (sg_miter_next(&sgm)) {
+		buffer = sgm.addr;
+		esdhc_mcf_buffer_swap32(buffer, sgm.length);
 	}
+	sg_miter_stop(&sgm);
 
 exit_done:
 	mmc_request_done(host->mmc, mrq);

-- 
2.34.1


