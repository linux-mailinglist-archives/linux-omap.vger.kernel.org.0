Return-Path: <linux-omap+bounces-374-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE9483C4E9
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jan 2024 15:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 404851C22494
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jan 2024 14:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606F16EB65;
	Thu, 25 Jan 2024 14:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SGD+fkCN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ABC6E2DA
	for <linux-omap@vger.kernel.org>; Thu, 25 Jan 2024 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706193437; cv=none; b=RJdm6Jdw0xry2EjUhJINGK7+6Utqp4PXegCSHTtg1zIyvS+sBd90jeQl4i+UyiZ3+44aBWf6cGM0cocq3isDlozGbcBhLIaMHGhBW8kbbGw6QFDsQMbdkQoOjY9OjNnAji699J9oG5IMMJU1YgS28JTB3kmdt62fh+EeRiyV35s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706193437; c=relaxed/simple;
	bh=dUmbPvU0C8VRoo9iWbxEG6uM01EkIK75bcOiAdjB25w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nwBo+FlAOEab3aa/nY+gUb+mii2o+J4qOlQdBl+9jd0haQ4P3F9R1C3BRKrpx8lMNsz95rNiq7T+qCts+5RhPMzuYNA4kbGxLNOem2CHRJ+BNC3zXInM6/Fe8+JVcNnN37z1ds5/snmULvf0lbl+EwBSHHgKz222LK+YEDX5Ew4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SGD+fkCN; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cf0390eddbso51958411fa.3
        for <linux-omap@vger.kernel.org>; Thu, 25 Jan 2024 06:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706193433; x=1706798233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0p/ZF4Qoyc/L5BPHTulDTqASzKK4BbFP5+9sQzchQas=;
        b=SGD+fkCNkm4T6il7tamKcdiyYox6b0VQ97GEy+Vea2PwX2YV8H+2S5MD92XUqO4FTS
         L0YVT59MZ8Tcl5jvSthxmT5ZAQg9ZPB2WalQxkUMxUspNNh7vPnj4ZTEmnjthCNPQEba
         iZNWa8rP7G66oEcejUqJk5TKV6hRQgdnZGwTFC+SvNrPZENEHKCNzuTA7cUqJCiVUNBM
         TOc+OWM1A8E/RsLwQivMRZPgNks3xylmsnrfL+9l5SgImVm3p0lMGG705MZHPg0dSMuF
         o+qAMw/ax098kNIJpRsWaLITgOPx8LU5n7vmuVkQ0+gPUZJvLyQ8Lo00/XY/CbV9YIf3
         7uKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706193433; x=1706798233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0p/ZF4Qoyc/L5BPHTulDTqASzKK4BbFP5+9sQzchQas=;
        b=d4DsNYVHKwIzpzfRzKoVjx1nSBZyFRai5giIBrdf0Y1KG4vIjELsYqrXeGVFOsFZX6
         2SkGr4eBbKUieTKbMYBpO2GxI1f7B0XxJE9qVubM8kIj/OTwc2Ey7EUz8Cs025WYVkAn
         1e8bZu3UQ3oL92U8dACUiDElO1lO2yscDzttmoueknbWhowNE0AlutolJPfXY/ZAXpzo
         HzubcHgf5yzry3ExkssdRZLonvaBg2kOoSfz2SD4lwnKJTDK1DF0/iGbGSZGbjl2vmXL
         ErZVr5irU1kmTsSPJGFv4OcdAAvdYGX+MTpeDntpJHmiawa5TINFqQxK9hCIxvWJLwFU
         QNBQ==
X-Gm-Message-State: AOJu0YybqKB67/97Dvk5ucTWpUMhS1Y+zNKp5hVjBcFjoFO8KXrUc3Mq
	r07jdYkfEqAkl01Ld9Wo5fv3YGIxVsFGMbMQHPf8t9486RGaoCZTf87CBa3G3YA=
X-Google-Smtp-Source: AGHT+IE2j/hx+TjW/VFSr9+UBY3Hbz0FN2hxOgkz7PQpgoay1lOTJOQqMnIpUCN7BuM5xSBcSZQTKg==
X-Received: by 2002:a2e:995a:0:b0:2cf:1c41:39bb with SMTP id r26-20020a2e995a000000b002cf1c4139bbmr731800ljj.69.1706193433640;
        Thu, 25 Jan 2024 06:37:13 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id y24-20020a2e3218000000b002ce098d3f0asm292644ljy.115.2024.01.25.06.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:37:13 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 Jan 2024 15:37:11 +0100
Subject: [PATCH 7/7] mmc: sh_mmcif: Map the virtual page for PIO
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240125-mmc-proper-kmap-v1-7-ba953c1ac3f9@linaro.org>
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

This code is a bit asynchronous due to being called
repeatedly from an interrupt handler, so it would be great
if someone can test this.

Suggested-by: Christoph Hellwig <hch@lst.de>
Link: https://lore.kernel.org/linux-mmc/20240122073423.GA25859@lst.de/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/sh_mmcif.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
index 077d711e964e..f9f56d653ff4 100644
--- a/drivers/mmc/host/sh_mmcif.c
+++ b/drivers/mmc/host/sh_mmcif.c
@@ -611,13 +611,27 @@ static bool sh_mmcif_next_block(struct sh_mmcif_host *host, u32 *p)
 
 	if (host->sg_blkidx == data->sg->length) {
 		host->sg_blkidx = 0;
+		/* Unmap previous sg and map the next one */
+		if (host->pio_ptr) {
+			kunmap_local(host->pio_ptr);
+			host->pio_ptr = NULL;
+		}
 		if (++host->sg_idx < data->sg_len)
-			host->pio_ptr = sg_virt(++data->sg);
+			host->pio_ptr = kmap_local_page(sg_page(++data->sg));
 	} else {
 		host->pio_ptr = p;
 	}
 
-	return host->sg_idx != data->sg_len;
+	/*
+	 * We return true of there are more blocks, and false if there is no
+	 * next block.
+	 */
+	if (host->sg_idx != data->sg_len)
+		return true;
+	/* Unmap the last buffer if any */
+	if (host->pio_ptr)
+		kunmap_local(host->pio_ptr);
+	return false;
 }
 
 static void sh_mmcif_single_read(struct sh_mmcif_host *host,
@@ -669,7 +683,7 @@ static void sh_mmcif_multi_read(struct sh_mmcif_host *host,
 	host->wait_for = MMCIF_WAIT_FOR_MREAD;
 	host->sg_idx = 0;
 	host->sg_blkidx = 0;
-	host->pio_ptr = sg_virt(data->sg);
+	host->pio_ptr = kmap_local_page(sg_page(data->sg));
 
 	sh_mmcif_bitset(host, MMCIF_CE_INT_MASK, MASK_MBUFREN);
 }
@@ -749,7 +763,7 @@ static void sh_mmcif_multi_write(struct sh_mmcif_host *host,
 	host->wait_for = MMCIF_WAIT_FOR_MWRITE;
 	host->sg_idx = 0;
 	host->sg_blkidx = 0;
-	host->pio_ptr = sg_virt(data->sg);
+	host->pio_ptr = kmap_local_page(sg_page(data->sg));
 
 	sh_mmcif_bitset(host, MMCIF_CE_INT_MASK, MASK_MBUFWEN);
 }

-- 
2.34.1


