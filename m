Return-Path: <linux-omap+bounces-3664-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E74AAC91A
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 17:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16A773B25BD
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 15:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CA12836A4;
	Tue,  6 May 2025 15:08:05 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B55027E7EF;
	Tue,  6 May 2025 15:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.2.72.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544084; cv=none; b=R4GkHXx/nTdf/nC/MvIAnxlfzDOYcz/OITEMS4Ij3bguDlqs+dZhnqmKo3d5LyMlLbe+h2ohe00++IFzsH/3Eirz6ni+KzLLY6hCGkrlNRwUOrm/3g2cizfapKrXYm+BBOTKLk3GERltIzU689aHC7GwYRcYXdCxnUR77JgCoj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544084; c=relaxed/simple;
	bh=8Mb+KgFotnS7I29BCql5SzN9jGqgKM2jAzLK9YuVVzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D8jQqIUNZC/PgGUtWrJD4vCQkgIYMnOTbAvooRuMWYw7pVHeOLLl4tooKJqC6RDyLMnQThhuLkngQP/MsdQ6mHs8E5OZeTZMyRlHWWtctHZfDKAXjIJNf28sZkiDBrmMM8ambLUoy8TMZ5Co99FafXJukrU1r9ujiANXycfEGxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mansr.com; spf=pass smtp.mailfrom=mansr.com; arc=none smtp.client-ip=81.2.72.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mansr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mansr.com
Received: from raven.mansr.com (raven.mansr.com [81.2.72.235])
	by unicorn.mansr.com (Postfix) with ESMTPS id 8845215381;
	Tue, 06 May 2025 16:07:55 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id 4E0DC21A3E1; Tue, 06 May 2025 16:07:55 +0100 (BST)
From: Mans Rullgard <mans@mansr.com>
To: jirislaby@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH 2/2] tty: serial: 8250_omap: use two-entry sg list for tx dma
Date: Tue,  6 May 2025 16:07:30 +0100
Message-ID: <20250506150748.3162-2-mans@mansr.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506150748.3162-1-mans@mansr.com>
References: <20250506150748.3162-1-mans@mansr.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On buffer wraparound, two sg entries are needed to transfer the full
contents of the kfifo.

This is equivalent to the change made to the 8250_dma driver in commit
59449c9dbdaa ("tty: serial: 8250_dma: use sgl with 2 nents to take care
of buffer wrap").

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 drivers/tty/serial/8250/8250_omap.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 180466e09605..66ba43a20725 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1152,9 +1152,11 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
 	struct omap8250_priv		*priv = p->port.private_data;
 	struct tty_port			*tport = &p->port.state->port;
 	struct dma_async_tx_descriptor	*desc;
-	struct scatterlist sg;
+	struct scatterlist *sg;
+	struct scatterlist sgl[2];
 	int skip_byte = -1;
 	int ret;
+	int i;
 
 	if (dma->tx_running)
 		return 0;
@@ -1208,18 +1210,22 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
 		skip_byte = c;
 	}
 
-	sg_init_table(&sg, 1);
-	kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
-				     UART_XMIT_SIZE, dma->tx_addr);
+	sg_init_table(sgl, ARRAY_SIZE(sgl));
+	ret = kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, sgl, ARRAY_SIZE(sgl),
+					   UART_XMIT_SIZE, dma->tx_addr);
 
-	desc = dmaengine_prep_slave_sg(dma->txchan, &sg, 1, DMA_MEM_TO_DEV,
+	desc = dmaengine_prep_slave_sg(dma->txchan, sgl, ret, DMA_MEM_TO_DEV,
 			DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!desc) {
 		ret = -EBUSY;
 		goto err;
 	}
 
-	dma->tx_size = sg_dma_len(&sg);
+	dma->tx_size = 0;
+
+	for_each_sg(sgl, sg, ret, i)
+		dma->tx_size += sg_dma_len(sg);
+
 	dma->tx_running = 1;
 
 	desc->callback = omap_8250_dma_tx_complete;
-- 
2.49.0


