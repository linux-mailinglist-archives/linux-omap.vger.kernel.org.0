Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0826018B1F8
	for <lists+linux-omap@lfdr.de>; Thu, 19 Mar 2020 12:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbgCSLDX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Mar 2020 07:03:23 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:55642 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbgCSLDW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Mar 2020 07:03:22 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JB3JV1032623;
        Thu, 19 Mar 2020 06:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584615799;
        bh=bu+SCC/BtqsFCUmKmgujKACPiZotg1WKTdX8hIYotE4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=rRtByxx+QO7VyxOYwgU0XJOiHsv1fyx6bUQzR+LRCLvQzRI2gnSKJXSI050c03TGo
         Y0uS9M+BmKgs/cq9PysekvMnzwkTRVbHnGbTpBP1MheRqdLatLjFd/knkUnmkCiGm9
         ZU5I9n1IL/PInYvhR99ozLG0bmzntF7HALGd5imQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JB3JQf057847
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 06:03:19 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 06:03:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 06:03:19 -0500
Received: from a0132425.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JB3C7n119908;
        Thu, 19 Mar 2020 06:03:17 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
CC:     Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-serial@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/6] serial: 8250: 8250_omap: Account for data in flight during DMA teardown
Date:   Thu, 19 Mar 2020 16:33:40 +0530
Message-ID: <20200319110344.21348-3-vigneshr@ti.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200319110344.21348-1-vigneshr@ti.com>
References: <20200319110344.21348-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Take into account data stuck in DMA internal buffers before pushing data
to higher layer. dma_tx_state has "in_flight_bytes" member that provides
this information.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/tty/serial/8250/8250_omap.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 65b6d165df67..be2b7d374e60 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -741,6 +741,8 @@ static void __dma_rx_do_complete(struct uart_8250_port *p)
 	struct omap8250_priv	*priv = p->port.private_data;
 	struct uart_8250_dma    *dma = p->dma;
 	struct tty_port         *tty_port = &p->port.state->port;
+	struct dma_chan		*rxchan = dma->rxchan;
+	dma_cookie_t		cookie;
 	struct dma_tx_state     state;
 	int                     count;
 	unsigned long		flags;
@@ -751,12 +753,29 @@ static void __dma_rx_do_complete(struct uart_8250_port *p)
 	if (!dma->rx_running)
 		goto unlock;
 
+	cookie = dma->rx_cookie;
 	dma->rx_running = 0;
-	dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
+	dmaengine_tx_status(rxchan, cookie, &state);
 
-	count = dma->rx_size - state.residue;
-	if (count < dma->rx_size)
-		dmaengine_terminate_async(dma->rxchan);
+	count = dma->rx_size - state.residue + state.in_flight_bytes;
+	if (count < dma->rx_size) {
+		dmaengine_terminate_async(rxchan);
+
+		/*
+		 * Poll for teardown to complete which guarantees in
+		 * flight data is drained.
+		 */
+		if (state.in_flight_bytes) {
+			int poll_count = 25;
+
+			while (dmaengine_tx_status(rxchan, cookie, NULL) &&
+			       poll_count--)
+				cpu_relax();
+
+			if (!poll_count)
+				dev_err(p->port.dev, "teardown incomplete\n");
+		}
+	}
 	if (!count)
 		goto unlock;
 	ret = tty_insert_flip_string(tty_port, dma->rx_buf, count);
-- 
2.25.2

