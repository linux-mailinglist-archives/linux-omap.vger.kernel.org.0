Return-Path: <linux-omap+bounces-413-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F0583E850
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jan 2024 01:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CACDD1F2263D
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jan 2024 00:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EA433D5;
	Sat, 27 Jan 2024 00:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="emnVVWLe"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23C7258F
	for <linux-omap@vger.kernel.org>; Sat, 27 Jan 2024 00:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706314817; cv=none; b=Wf29dviGccB5mjINN1th17A9vzqEOmcwIEgBJYyamSp1a6i3TPGkZcOZ8EQxc9JgIeGpps5cmAkASuXLzxsVM7DQ0dbRNcQeRD+x8FLP3bHsHul7eE71Je8NqQXmOymFu5snDZUvE6F4iwd7yINjYI/Ldaex9IAoaVt5WWzHSg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706314817; c=relaxed/simple;
	bh=E9ziAqKRF7avg+9XAu41DqCMnZeKd+R+sbDJSS4jrKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CDqbl2o6ucbiftoOWjmbdLOS2/VxGpL2Ns6X+oQ5Tt3/Dk6nDqXHHX+OOXcw6WrHsAMQFjgVAN2IDTBZh8n0RmKi6/Wiq2+9Gca8RIK1J0PM0DfXtNCaFPYMw5/iMPA3ljMwCj2N45S0K7VasoQ4tg0kAySTbopAnQSlpHTQLRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=emnVVWLe; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50edf4f478eso1199047e87.3
        for <linux-omap@vger.kernel.org>; Fri, 26 Jan 2024 16:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706314814; x=1706919614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5SahCLN1505rQ5cLqj1DAZZAA4U+IFMjOwfguXW3/Y=;
        b=emnVVWLeg/3uw0D7kDOuch6/gCpWAf6ndV4K4LdzZ0euGS/eUBi3wm0zFBLkkWZhcs
         2s21lonvVDaMr2EZNprRN/VRd7ta7FYKfBkniU2TnjMpQKEXjoFTeh86V0Bk7Xq0Vv2y
         WVug8eifCUjXeVoZbOyREIVijrrWUe8iUC0x9vPvFjn8lyMQ1nnwFMJHkEaYSqt06kyR
         AW5VPt1C6h1PjU1M7+aAu4oYxHysvUB0DASsvX2Ue/aW2Qpp3WpI3jRJvzl/OQc/nH8L
         Y9tzy2YuqBL1EWbUs7vxVWX5PzYO1xlNzGykYl7KmI818V0ZKZcHunSjIL2wwfwzTA9f
         Zw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706314814; x=1706919614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5SahCLN1505rQ5cLqj1DAZZAA4U+IFMjOwfguXW3/Y=;
        b=oK2wKY2rqs9SVerGqls8+rjTVYhLITAUEmDginOVdIyVxKjdfF1c7C9H0uCSs56kmH
         Ba6800e+KR9WrbvffJo0TXJrN4KVgH+SNJZcoqcpAIx49VJyantgxbn8OboKUOgW5DUg
         czPMUYt7ADZDy1XXu4DDghUke7l81S8pXloB7UBCxvFWSlmrnbZhLfYN0j2eDlgKfUbG
         0938hSu1Vc6zsdjjmW1AB+I7H+foR7yeyTL1Pt2tgf9t/IFjy9BxL7CYsFoskiMBuxsK
         k0IP+SopwSc3nQpgBsnKFiVcZfxU5UQdy4fOWkxQBoKbn9CntLGy52ViC3I82gyZr7mK
         jrog==
X-Gm-Message-State: AOJu0YysllQJs7yhPoy973uBQDlDj6/VTYHqBipdTmhKSXa7y8ioN39m
	fmYkhQOX8/FbpMURsAAL3cxDYEGmmrl3vTq5yZtW+WNeff30cwK55N0ktZaG11bTYKlqwwP6QZd
	+
X-Google-Smtp-Source: AGHT+IFc5/iBp3Z+YfgOFibaw+mJcjoLiqn1ysw4Wwecz9Q0A3UtJBPMsKwdVvx3H7ibywtjZio/1w==
X-Received: by 2002:a05:6512:3b0e:b0:50e:b23c:e37 with SMTP id f14-20020a0565123b0e00b0050eb23c0e37mr373430lfv.48.1706314813988;
        Fri, 26 Jan 2024 16:20:13 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x25-20020a19f619000000b0050e7f5cffa6sm325226lfe.273.2024.01.26.16.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 16:20:12 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 27 Jan 2024 01:19:49 +0100
Subject: [PATCH v2 2/9] mmc: moxart-mmc: Factor out moxart_use_dma() helper
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240127-mmc-proper-kmap-v2-2-d8e732aa97d1@linaro.org>
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

The same code is in two places and we will add a third place.
Break this out into its own function.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/moxart-mmc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/moxart-mmc.c b/drivers/mmc/host/moxart-mmc.c
index 5cfdd3a86e54..d12d7d79b19c 100644
--- a/drivers/mmc/host/moxart-mmc.c
+++ b/drivers/mmc/host/moxart-mmc.c
@@ -254,6 +254,11 @@ static void moxart_dma_complete(void *param)
 	complete(&host->dma_complete);
 }
 
+static bool moxart_use_dma(struct moxart_host *host)
+{
+	return (host->data_len > host->fifo_width) && host->have_dma;
+}
+
 static void moxart_transfer_dma(struct mmc_data *data, struct moxart_host *host)
 {
 	u32 len, dir_slave;
@@ -375,7 +380,7 @@ static void moxart_prepare_data(struct moxart_host *host)
 	if (data->flags & MMC_DATA_WRITE)
 		datactrl |= DCR_DATA_WRITE;
 
-	if ((host->data_len > host->fifo_width) && host->have_dma)
+	if (moxart_use_dma(host))
 		datactrl |= DCR_DMA_EN;
 
 	writel(DCR_DATA_FIFO_RESET, host->base + REG_DATA_CONTROL);
@@ -407,7 +412,7 @@ static void moxart_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	moxart_send_command(host, host->mrq->cmd);
 
 	if (mrq->cmd->data) {
-		if ((host->data_len > host->fifo_width) && host->have_dma) {
+		if (moxart_use_dma(host)) {
 
 			writel(CARD_CHANGE, host->base + REG_INTERRUPT_MASK);
 

-- 
2.34.1


