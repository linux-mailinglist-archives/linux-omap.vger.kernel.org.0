Return-Path: <linux-omap+bounces-416-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E101B83E859
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jan 2024 01:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FD881F2241D
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jan 2024 00:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F2F1DA4A;
	Sat, 27 Jan 2024 00:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q+MHfxAc"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5E61CD34
	for <linux-omap@vger.kernel.org>; Sat, 27 Jan 2024 00:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706314821; cv=none; b=C/bL2lapchZpoDaJsAa2D3oZvo5SHk8VmyN3gJdlPw1LmCU6XDqcObR/n77RukNxVtWaFsGWWOnjIbrNnM2MlX0BxPIbnmGw6KC/e/p1cvAiJrO7pymvdZfHZIsY1n5+WwQxfJ9QpgMX6BonCyaFIfp0zl+DQMmqBT6XklIPIBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706314821; c=relaxed/simple;
	bh=9/wwLT18BUDyTWXggkK9BCgrhK2swAAIK+73Bo29JTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CzbMMlADNMJ5XzJ+x6fEjWoUkFrv4Y/huWGdVEtoWgTH7VOivsXfmdxx0bSMqXKYWF8HxcQxulDyvp7NGh6ydQLlll0CdWLn0y9UMN5GdEb7qHTQsEua5kSh4rWNcaI8iNaBrQfKlFhLzZnlbJvZ4zRJsIildSWm4SGP6d3b/xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q+MHfxAc; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50f11e3ba3aso1651240e87.1
        for <linux-omap@vger.kernel.org>; Fri, 26 Jan 2024 16:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706314817; x=1706919617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRirpuRqStGDqBkFHe65SrxV5jM0SILjOXPwd5g5zmY=;
        b=Q+MHfxAc0cLNJjfF1fRsYczigZHMUGfK5rrDcLpEBNaQNq9LHwP4eqBLVBtLyWXYeZ
         Lki7Ti9AtPtJbYsmRzLong1EwC6UMh6YYQJFj//SjGyrrWQ+NzOGmB2HNvOHOJ9m6Kmu
         R4fTgm9rkEfqAY1EPbD1lE10KIKA2F0u5OWEGb60vaKBnPWMjbgLI/+iAGI8GFnMT3yx
         DGZt7GNT4rybMjokIamuN4GWU6+F4Q5FsyMvgQlU0/18A0WkrT/bqMhrHgivopkfO6iB
         /+9MGdBG+VSH5bN+Af3SCcrxpy0nXw7IA4A/LYz4Uk6/6dvH0sjaWPRrB2IStf9RzsTi
         U8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706314817; x=1706919617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRirpuRqStGDqBkFHe65SrxV5jM0SILjOXPwd5g5zmY=;
        b=G9kSx5PMIloFIZKXcvN8bY8pL5UkX0/9unpsK21QB50yhaRmze6VaNx46I0MvCYk3e
         wkX+XTXvYsHvYtSwUAjsG/dnnJuwCB48zG0ZqqXrhVpjUYbkDa5whkJFbopnfoGoJto3
         TAE8PgQhsM+ULjrZF0VfZ+Wp/3JuIbtASWx/hF2zdmit0E0QoPfRlnfnoT4eWZHPpU/E
         vvcRqsaKALcNQis6zY7XLL+Ii0n2QDFSg+F+q2Y6y3yL8pDv4/T9yYpKkGWPiywHyak7
         /FI1+E8Q5wC9IVY3OsfC7vuZRvLU03G/a6+Pr4A4EACl8WrAlZYI9POQvZkTq0tqvNj6
         Q3oA==
X-Gm-Message-State: AOJu0Yw+2tREIyEQOO1XbzTC7nBD4lTZ2slpRkkqX2of6ZGL2nMFSA6l
	TT7gZpzer78c3VEcY+5BdwEAwCNGkoFoF4Kol9R6tG1Af6yAY82/1/UC741ZiMs=
X-Google-Smtp-Source: AGHT+IEieB9VwK0RUyhp0+dIhGeLrFmYpVXkTt01iumobPvcTXn/Pm6yTciatsKZBbXQy4sYm4+lRg==
X-Received: by 2002:ac2:4911:0:b0:510:b1b:5db3 with SMTP id n17-20020ac24911000000b005100b1b5db3mr739998lfi.67.1706314817623;
        Fri, 26 Jan 2024 16:20:17 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x25-20020a19f619000000b0050e7f5cffa6sm325226lfe.273.2024.01.26.16.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 16:20:17 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 27 Jan 2024 01:19:52 +0100
Subject: [PATCH v2 5/9] mmc: mvsdio: Use sg_miter for PIO
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240127-mmc-proper-kmap-v2-5-d8e732aa97d1@linaro.org>
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

This driver also has a bug in the PIO sglist handling that
is fixed as part of the patch: it does not travers the
list of scatterbuffers: it will just process the first
item in the list. This is fixed by augmenting the logic
such that we do not process more than one sgitem
per IRQ instead of counting down potentially the whole
length of the request.

We can suspect that the PIO path is quite untested.

Suggested-by: Christoph Hellwig <hch@lst.de>
Link: https://lore.kernel.org/linux-mmc/20240122073423.GA25859@lst.de/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/host/mvsdio.c | 71 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 53 insertions(+), 18 deletions(-)

diff --git a/drivers/mmc/host/mvsdio.c b/drivers/mmc/host/mvsdio.c
index ca01b7d204ba..af7f21888e27 100644
--- a/drivers/mmc/host/mvsdio.c
+++ b/drivers/mmc/host/mvsdio.c
@@ -38,8 +38,9 @@ struct mvsd_host {
 	unsigned int xfer_mode;
 	unsigned int intr_en;
 	unsigned int ctrl;
+	bool use_pio;
+	struct sg_mapping_iter sg_miter;
 	unsigned int pio_size;
-	void *pio_ptr;
 	unsigned int sg_frags;
 	unsigned int ns_per_clk;
 	unsigned int clock;
@@ -114,11 +115,18 @@ static int mvsd_setup_data(struct mvsd_host *host, struct mmc_data *data)
 		 * data when the buffer is not aligned on a 64 byte
 		 * boundary.
 		 */
+		unsigned int miter_flags = SG_MITER_ATOMIC; /* Used from IRQ */
+
+		if (data->flags & MMC_DATA_READ)
+			miter_flags |= SG_MITER_TO_SG;
+		else
+			miter_flags |= SG_MITER_FROM_SG;
+
 		host->pio_size = data->blocks * data->blksz;
-		host->pio_ptr = sg_virt(data->sg);
+		sg_miter_start(&host->sg_miter, data->sg, data->sg_len, miter_flags);
 		if (!nodma)
-			dev_dbg(host->dev, "fallback to PIO for data at 0x%p size %d\n",
-				host->pio_ptr, host->pio_size);
+			dev_dbg(host->dev, "fallback to PIO for data\n");
+		host->use_pio = true;
 		return 1;
 	} else {
 		dma_addr_t phys_addr;
@@ -129,6 +137,7 @@ static int mvsd_setup_data(struct mvsd_host *host, struct mmc_data *data)
 		phys_addr = sg_dma_address(data->sg);
 		mvsd_write(MVSD_SYS_ADDR_LOW, (u32)phys_addr & 0xffff);
 		mvsd_write(MVSD_SYS_ADDR_HI,  (u32)phys_addr >> 16);
+		host->use_pio = false;
 		return 0;
 	}
 }
@@ -288,8 +297,8 @@ static u32 mvsd_finish_data(struct mvsd_host *host, struct mmc_data *data,
 {
 	void __iomem *iobase = host->base;
 
-	if (host->pio_ptr) {
-		host->pio_ptr = NULL;
+	if (host->use_pio) {
+		sg_miter_stop(&host->sg_miter);
 		host->pio_size = 0;
 	} else {
 		dma_unmap_sg(mmc_dev(host->mmc), data->sg, host->sg_frags,
@@ -344,9 +353,12 @@ static u32 mvsd_finish_data(struct mvsd_host *host, struct mmc_data *data,
 static irqreturn_t mvsd_irq(int irq, void *dev)
 {
 	struct mvsd_host *host = dev;
+	struct sg_mapping_iter *sgm = &host->sg_miter;
 	void __iomem *iobase = host->base;
 	u32 intr_status, intr_done_mask;
 	int irq_handled = 0;
+	u16 *p;
+	int s;
 
 	intr_status = mvsd_read(MVSD_NOR_INTR_STATUS);
 	dev_dbg(host->dev, "intr 0x%04x intr_en 0x%04x hw_state 0x%04x\n",
@@ -370,15 +382,36 @@ static irqreturn_t mvsd_irq(int irq, void *dev)
 	spin_lock(&host->lock);
 
 	/* PIO handling, if needed. Messy business... */
-	if (host->pio_size &&
+	if (host->use_pio) {
+		/*
+		 * As we set sgm->consumed this always gives a valid buffer
+		 * position.
+		 */
+		if (!sg_miter_next(sgm)) {
+			/* This should not happen */
+			dev_err(host->dev, "ran out of scatter segments\n");
+			spin_unlock(&host->lock);
+			host->intr_en &=
+				~(MVSD_NOR_RX_READY | MVSD_NOR_RX_FIFO_8W |
+				  MVSD_NOR_TX_AVAIL | MVSD_NOR_TX_FIFO_8W);
+			mvsd_write(MVSD_NOR_INTR_EN, host->intr_en);
+			return IRQ_HANDLED;
+		}
+		p = sgm->addr;
+		s = sgm->length;
+		if (s > host->pio_size)
+			s = host->pio_size;
+	}
+
+	if (host->use_pio &&
 	    (intr_status & host->intr_en &
 	     (MVSD_NOR_RX_READY | MVSD_NOR_RX_FIFO_8W))) {
-		u16 *p = host->pio_ptr;
-		int s = host->pio_size;
+
 		while (s >= 32 && (intr_status & MVSD_NOR_RX_FIFO_8W)) {
 			readsw(iobase + MVSD_FIFO, p, 16);
 			p += 16;
 			s -= 32;
+			sgm->consumed += 32;
 			intr_status = mvsd_read(MVSD_NOR_INTR_STATUS);
 		}
 		/*
@@ -391,6 +424,7 @@ static irqreturn_t mvsd_irq(int irq, void *dev)
 				put_unaligned(mvsd_read(MVSD_FIFO), p++);
 				put_unaligned(mvsd_read(MVSD_FIFO), p++);
 				s -= 4;
+				sgm->consumed += 4;
 				intr_status = mvsd_read(MVSD_NOR_INTR_STATUS);
 			}
 			if (s && s < 4 && (intr_status & MVSD_NOR_RX_READY)) {
@@ -398,10 +432,13 @@ static irqreturn_t mvsd_irq(int irq, void *dev)
 				val[0] = mvsd_read(MVSD_FIFO);
 				val[1] = mvsd_read(MVSD_FIFO);
 				memcpy(p, ((void *)&val) + 4 - s, s);
+				sgm->consumed += s;
 				s = 0;
 				intr_status = mvsd_read(MVSD_NOR_INTR_STATUS);
 			}
-			if (s == 0) {
+			/* PIO transfer done */
+			host->pio_size -= sgm->consumed;
+			if (host->pio_size == 0) {
 				host->intr_en &=
 				     ~(MVSD_NOR_RX_READY | MVSD_NOR_RX_FIFO_8W);
 				mvsd_write(MVSD_NOR_INTR_EN, host->intr_en);
@@ -413,14 +450,10 @@ static irqreturn_t mvsd_irq(int irq, void *dev)
 		}
 		dev_dbg(host->dev, "pio %d intr 0x%04x hw_state 0x%04x\n",
 			s, intr_status, mvsd_read(MVSD_HW_STATE));
-		host->pio_ptr = p;
-		host->pio_size = s;
 		irq_handled = 1;
-	} else if (host->pio_size &&
+	} else if (host->use_pio &&
 		   (intr_status & host->intr_en &
 		    (MVSD_NOR_TX_AVAIL | MVSD_NOR_TX_FIFO_8W))) {
-		u16 *p = host->pio_ptr;
-		int s = host->pio_size;
 		/*
 		 * The TX_FIFO_8W bit is unreliable. When set, bursting
 		 * 16 halfwords all at once in the FIFO drops data. Actually
@@ -431,6 +464,7 @@ static irqreturn_t mvsd_irq(int irq, void *dev)
 			mvsd_write(MVSD_FIFO, get_unaligned(p++));
 			mvsd_write(MVSD_FIFO, get_unaligned(p++));
 			s -= 4;
+			sgm->consumed += 4;
 			intr_status = mvsd_read(MVSD_NOR_INTR_STATUS);
 		}
 		if (s < 4) {
@@ -439,10 +473,13 @@ static irqreturn_t mvsd_irq(int irq, void *dev)
 				memcpy(((void *)&val) + 4 - s, p, s);
 				mvsd_write(MVSD_FIFO, val[0]);
 				mvsd_write(MVSD_FIFO, val[1]);
+				sgm->consumed += s;
 				s = 0;
 				intr_status = mvsd_read(MVSD_NOR_INTR_STATUS);
 			}
-			if (s == 0) {
+			/* PIO transfer done */
+			host->pio_size -= sgm->consumed;
+			if (host->pio_size == 0) {
 				host->intr_en &=
 				     ~(MVSD_NOR_TX_AVAIL | MVSD_NOR_TX_FIFO_8W);
 				mvsd_write(MVSD_NOR_INTR_EN, host->intr_en);
@@ -450,8 +487,6 @@ static irqreturn_t mvsd_irq(int irq, void *dev)
 		}
 		dev_dbg(host->dev, "pio %d intr 0x%04x hw_state 0x%04x\n",
 			s, intr_status, mvsd_read(MVSD_HW_STATE));
-		host->pio_ptr = p;
-		host->pio_size = s;
 		irq_handled = 1;
 	}
 

-- 
2.34.1


