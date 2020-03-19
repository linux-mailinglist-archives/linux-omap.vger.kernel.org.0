Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE0818B1F2
	for <lists+linux-omap@lfdr.de>; Thu, 19 Mar 2020 12:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgCSLD0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Mar 2020 07:03:26 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:47472 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbgCSLDZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Mar 2020 07:03:25 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JB3LXg003256;
        Thu, 19 Mar 2020 06:03:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584615801;
        bh=SXgdJstQj1jyi3scyBiJmZMrMb2AZm0RiU0veOvrszY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=FYCnM1QyYaoUkwhfny9FtpnK0ZCD1wLo+S/DC7VaRymHz2mYzdIecd8XETYqz6/Ik
         MfuQuDomhhb0UsgF8IrL0c3pmr4csoXTp9hLJtIwYXx6MTEnl81w2JDWTVOYPEJlIL
         kLxYKPFwCy//NNDB4yTqHKoBQHnOlsYcFghlbxIc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JB3L1T011038
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 06:03:21 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 06:03:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 06:03:21 -0500
Received: from a0132425.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JB3C7o119908;
        Thu, 19 Mar 2020 06:03:19 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
CC:     Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-serial@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/6] serial: 8250: 8250_omap: Move locking out from __dma_rx_do_complete()
Date:   Thu, 19 Mar 2020 16:33:41 +0530
Message-ID: <20200319110344.21348-4-vigneshr@ti.com>
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

From: Peter Ujfalusi <peter.ujfalusi@ti.com>

Caller functions of __dma_rx_do_complete() already hold rx_dma_lock.
Therefore move locking out of the function to avoid need to release and
reacquire lock.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/tty/serial/8250/8250_omap.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index be2b7d374e60..aef0535b62a4 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -736,22 +736,19 @@ static void omap_8250_unthrottle(struct uart_port *port)
 #ifdef CONFIG_SERIAL_8250_DMA
 static int omap_8250_rx_dma(struct uart_8250_port *p);
 
+/* Must be called while priv->rx_dma_lock is held */
 static void __dma_rx_do_complete(struct uart_8250_port *p)
 {
-	struct omap8250_priv	*priv = p->port.private_data;
 	struct uart_8250_dma    *dma = p->dma;
 	struct tty_port         *tty_port = &p->port.state->port;
 	struct dma_chan		*rxchan = dma->rxchan;
 	dma_cookie_t		cookie;
 	struct dma_tx_state     state;
 	int                     count;
-	unsigned long		flags;
 	int			ret;
 
-	spin_lock_irqsave(&priv->rx_dma_lock, flags);
-
 	if (!dma->rx_running)
-		goto unlock;
+		goto out;
 
 	cookie = dma->rx_cookie;
 	dma->rx_running = 0;
@@ -777,13 +774,12 @@ static void __dma_rx_do_complete(struct uart_8250_port *p)
 		}
 	}
 	if (!count)
-		goto unlock;
+		goto out;
 	ret = tty_insert_flip_string(tty_port, dma->rx_buf, count);
 
 	p->port.icount.rx += ret;
 	p->port.icount.buf_overrun += count - ret;
-unlock:
-	spin_unlock_irqrestore(&priv->rx_dma_lock, flags);
+out:
 
 	tty_flip_buffer_push(tty_port);
 }
@@ -836,9 +832,8 @@ static void omap_8250_rx_dma_flush(struct uart_8250_port *p)
 		if (WARN_ON_ONCE(ret))
 			priv->rx_dma_broken = true;
 	}
-	spin_unlock_irqrestore(&priv->rx_dma_lock, flags);
-
 	__dma_rx_do_complete(p);
+	spin_unlock_irqrestore(&priv->rx_dma_lock, flags);
 }
 
 static int omap_8250_rx_dma(struct uart_8250_port *p)
-- 
2.25.2

