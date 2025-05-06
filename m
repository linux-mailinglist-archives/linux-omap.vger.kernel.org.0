Return-Path: <linux-omap+bounces-3665-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7296AAC91B
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 17:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2F9A468DB3
	for <lists+linux-omap@lfdr.de>; Tue,  6 May 2025 15:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144DC2836AB;
	Tue,  6 May 2025 15:08:05 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4E427B4F8;
	Tue,  6 May 2025 15:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.2.72.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544084; cv=none; b=EmZ2PCaHTZ7/ip8oCIWsvro7CZaMRs66q9T/RA/I5TNKm3UtbB/m1aaXs33USmnRVNVd27c5mnkBTwvvcA2vshRmXHcDa0+5pFbR6hkPzSA2zslyz4ZglMut60tPQaTdH/MOhdhPixPgGC+rK8vba74SRkKjybP9o7vIoBceHEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544084; c=relaxed/simple;
	bh=V0Qnd7XGUYL4VJVx/NNGZxOFnfryDun38SvbJqd1K94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpiGaqOFBDs+ZeOWPUPhlBoXHDXb70UXCqorDjf2WbPjEOvh/HFJw+JTTSygQWUpBfq/LurdU+Bva/MalnNGLV3uKvkpp7acx2L7KYp2HkarodMV7b9TBf8ubHz37V6MfsvXLI9MDPgQPY/vG4utzak3zdTr2oLI6vZZT7/G+PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mansr.com; spf=pass smtp.mailfrom=mansr.com; arc=none smtp.client-ip=81.2.72.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mansr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mansr.com
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:1::3])
	by unicorn.mansr.com (Postfix) with ESMTPS id 6213715380;
	Tue, 06 May 2025 16:07:55 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id 4BAE821A3DA; Tue, 06 May 2025 16:07:55 +0100 (BST)
From: Mans Rullgard <mans@mansr.com>
To: jirislaby@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-omap@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] tty: serial: 8250_omap: fix tx with dma
Date: Tue,  6 May 2025 16:07:29 +0100
Message-ID: <20250506150748.3162-1-mans@mansr.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
introduced an error in the TX DMA handling for 8250_omap.

When the OMAP_DMA_TX_KICK flag is set, one byte is pulled from the
kfifo and emitted directly in order to start the DMA.  This is done
without updating DMA tx_size which leads to uart_xmit_advance() called
in the DMA complete callback advancing the kfifo by one too much.

In practice, transmitting N bytes has been seen to result in the last
N-1 bytes being sent repeatedly.

This change fixes the problem by moving all of the dma setup after
the OMAP_DMA_TX_KICK handling and using kfifo_len() instead of the
dma size for the 4-byte cutoff check. This slightly changes the
behaviour at buffer wraparound, but it still transmits the correct
bytes somehow. At the point kfifo_dma_out_prepare_mapped is called,
at least one byte is guaranteed to be in the fifo, so checking the
return value is not necessary.

Fixes: 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
Cc: stable@vger.kernel.org
Signed-off-by: Mans Rullgard <mans@mansr.com>
---
v2: split patch in two
---
 drivers/tty/serial/8250/8250_omap.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index f1aee915bc02..180466e09605 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1173,16 +1173,6 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
 		return 0;
 	}
 
-	sg_init_table(&sg, 1);
-	ret = kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
-					   UART_XMIT_SIZE, dma->tx_addr);
-	if (ret != 1) {
-		serial8250_clear_THRI(p);
-		return 0;
-	}
-
-	dma->tx_size = sg_dma_len(&sg);
-
 	if (priv->habit & OMAP_DMA_TX_KICK) {
 		unsigned char c;
 		u8 tx_lvl;
@@ -1207,7 +1197,7 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
 			ret = -EBUSY;
 			goto err;
 		}
-		if (dma->tx_size < 4) {
+		if (kfifo_len(&tport->xmit_fifo) < 4) {
 			ret = -EINVAL;
 			goto err;
 		}
@@ -1216,11 +1206,12 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
 			goto err;
 		}
 		skip_byte = c;
-		/* now we need to recompute due to kfifo_get */
-		kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
-				UART_XMIT_SIZE, dma->tx_addr);
 	}
 
+	sg_init_table(&sg, 1);
+	kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
+				     UART_XMIT_SIZE, dma->tx_addr);
+
 	desc = dmaengine_prep_slave_sg(dma->txchan, &sg, 1, DMA_MEM_TO_DEV,
 			DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!desc) {
@@ -1228,6 +1219,7 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
 		goto err;
 	}
 
+	dma->tx_size = sg_dma_len(&sg);
 	dma->tx_running = 1;
 
 	desc->callback = omap_8250_dma_tx_complete;
@@ -1248,8 +1240,10 @@ static int omap_8250_tx_dma(struct uart_8250_port *p)
 err:
 	dma->tx_err = 1;
 out_skip:
-	if (skip_byte >= 0)
+	if (skip_byte >= 0) {
 		serial_out(p, UART_TX, skip_byte);
+		p->port.icount.tx++;
+	}
 	return ret;
 }
 
-- 
2.49.0


