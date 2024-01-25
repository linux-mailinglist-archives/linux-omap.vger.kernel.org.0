Return-Path: <linux-omap+bounces-370-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F73283C4DD
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jan 2024 15:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4C4F1F23A05
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jan 2024 14:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F6D6E2B9;
	Thu, 25 Jan 2024 14:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iF/8jP/0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101766E2B6
	for <linux-omap@vger.kernel.org>; Thu, 25 Jan 2024 14:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706193433; cv=none; b=QKs7K9TT7ExxclNwnTpQvs+iVju2v1BjU82jMQp7y3krZlLkHbOy93BZZ8v4hI4hpxPndkk0mz/wyJcwB5GArRmcI9ZJbz5Jp2WPA4m/2q5yfdlZRnCDwsB3oBzW/7VLtzDQz/Kmdeer1ns7zPbEwO9najidszWol0CNoxyzH0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706193433; c=relaxed/simple;
	bh=Kek+Scrv6+UCfq5BBGg2zaWiIeeEWdDOIWCeg8Mvbsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NMWaTvR7UuMB08ld6m+8NqgB/dtuzH76EpeuPz4yoGtX7PVc0Aq5MKIDBxXLMmBM7NIzNsUzyCI9btxUKGb8aSfRNiKR0Su83gB2mlIkWPrMnlLmRzjl3pLP884OLd4Ljiu6mR8iS+hPdSeGiTiXg5fODOiad4MVdOD5YGJ0NCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iF/8jP/0; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cf2adac1ccso20287121fa.3
        for <linux-omap@vger.kernel.org>; Thu, 25 Jan 2024 06:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706193427; x=1706798227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+N5XQAayZgM276rPgCazC+JMbS0uzbwzoNPf1gEMYQA=;
        b=iF/8jP/0rwEyRVzZBs9YGEMsuacgS8TzhhIJHX2J0dgjhGY9TyHXJ0+SdEX1xOIb8v
         0VVA/Z8jWRjuoffRbDgEuSlwsLsZwykHqONywOkKTvLt7I+dulQeYVUIaxLWXSnR1z5Y
         9wlDghknzk7H3+GHbAdL7JN4PmC434stLfGNQIn/fiI0bL9Y09aRf6co4zFop1MFxOZW
         h0vHZlbikEnNnkfErUUBiQI8UtBvLlqDmI4svhNy6FsEVOJ872vdIPoGLnHb++5L8Xth
         Fjjom6k7LmWaIfNlGwrP0M9Rn4GxHWtafReLczGYNT6Y4tCEmK73KLhZHOL8nGkGGryz
         ahRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706193427; x=1706798227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+N5XQAayZgM276rPgCazC+JMbS0uzbwzoNPf1gEMYQA=;
        b=X7xpflI8R9f/i+6ED574GdDnavhkbZAvm08EPgEH8vwhL7+ASOVUTCishMylHbWU7Z
         3GFBsp+nYCkwbRO1SYNIn1v175dboBVFL3lq/XR+aARhK7dUudtjFcTJGnO37jnuynTe
         Cpz3t5IHrHUyGdJvUNqjypqu+akXAqFmvJZGoN+gwD0++61ggDEGCU3v4PaYBcjMaORp
         b4BLNoxmqDz9FzGJnQhOZhBJE/A/pocC3ndHbNQ7NQWkgT79fDPZP0uo+1qxDC560q64
         NyAKSwETdN7MSq/zamcgh4WaxX/x5WMEnNJ/OA8qV5SAMOAGjGpBpOqtHyt9yNJWiSE7
         paYw==
X-Gm-Message-State: AOJu0Yw6gwLKql4Rju+U9ei0i0YRQ03OinYwO+USDAv/W6DC0M/Hw3PZ
	w3gGnHM8PfkcWlaua0e7vdatjvCdGAQy6C+M5/KrzkEZqTREARsfqLjsyNDTaVY=
X-Google-Smtp-Source: AGHT+IGs3o7wZDD6VJzuezIX0ktPG7wilQ0jcQWaR8BKd3udA01+8LyjxKr+DUfe0ol8eZ7VY2/FuA==
X-Received: by 2002:a05:651c:506:b0:2cf:2a82:7871 with SMTP id o6-20020a05651c050600b002cf2a827871mr715556ljp.26.1706193427689;
        Thu, 25 Jan 2024 06:37:07 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id y24-20020a2e3218000000b002ce098d3f0asm292644ljy.115.2024.01.25.06.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:37:06 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 Jan 2024 15:37:05 +0100
Subject: [PATCH 1/7] mmc: davinci_mmc: Map the virtual page for PIO
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240125-mmc-proper-kmap-v1-1-ba953c1ac3f9@linaro.org>
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
 drivers/mmc/host/davinci_mmc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
index ee3b1a4e0848..4e9f96b1caf3 100644
--- a/drivers/mmc/host/davinci_mmc.c
+++ b/drivers/mmc/host/davinci_mmc.c
@@ -216,7 +216,7 @@ static irqreturn_t mmc_davinci_irq(int irq, void *dev_id);
 static void mmc_davinci_sg_to_buf(struct mmc_davinci_host *host)
 {
 	host->buffer_bytes_left = sg_dma_len(host->sg);
-	host->buffer = sg_virt(host->sg);
+	host->buffer = kmap_local_page(sg_page(host->sg));
 	if (host->buffer_bytes_left > host->bytes_left)
 		host->buffer_bytes_left = host->bytes_left;
 }
@@ -261,7 +261,13 @@ static void davinci_fifo_data_trans(struct mmc_davinci_host *host,
 			p = p + (n & 3);
 		}
 	}
-	host->buffer = p;
+
+	if (host->buffer_bytes_left == 0) {
+		kunmap_local(host->buffer);
+		host->buffer = NULL;
+	} else {
+		host->buffer = p;
+	}
 }
 
 static void mmc_davinci_start_command(struct mmc_davinci_host *host,

-- 
2.34.1


