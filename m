Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF6D18B1FD
	for <lists+linux-omap@lfdr.de>; Thu, 19 Mar 2020 12:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgCSLDf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Mar 2020 07:03:35 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35816 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbgCSLDb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Mar 2020 07:03:31 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JB3SWw044022;
        Thu, 19 Mar 2020 06:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584615808;
        bh=OhvPqrZCDn/tWWimQYzupmO/H8msUAcDg/bECoKftHs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hi1Gwrcu6wz6gB+7GjZvgQbyhgyAh7O3LnWJmfyJ2p4zYiBsEXVPGDn8Mvb5yVMrP
         Z93tHP9T76mtgEVIwSvdFqSvg4+jBRGdHSJ+8zexAYyVTbBv3sbA5zfz+cZYySb7+c
         UfpNVGKti8xLw9ds3/bZCqIyazWvE42BVWt7888g=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JB3SDZ011118
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 06:03:28 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 06:03:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 06:03:27 -0500
Received: from a0132425.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JB3C7r119908;
        Thu, 19 Mar 2020 06:03:26 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
CC:     Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-serial@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 6/6] serial: 8250: 8250_omap: Add DMA support for UARTs on K3 SoCs
Date:   Thu, 19 Mar 2020 16:33:44 +0530
Message-ID: <20200319110344.21348-7-vigneshr@ti.com>
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

UART on K3 SoCs has configurable RX timeout behavior (controlled via
EFR2) and better DMA integration. This allows to transfer as larger
amount data per DMA transfer compared to older SoCs.  Add support for
the same.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/tty/serial/8250/8250_omap.c | 98 +++++++++++++++++++++++++----
 1 file changed, 86 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 92508aaa961c..2b63db08d87e 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -40,6 +40,7 @@
  * The same errata is applicable to AM335x and DRA7x processors too.
  */
 #define UART_ERRATA_CLOCK_DISABLE	(1 << 3)
+#define	UART_HAS_EFR2			BIT(4)
 
 #define OMAP_UART_FCR_RX_TRIG		6
 #define OMAP_UART_FCR_TX_TRIG		4
@@ -93,6 +94,10 @@
 #define OMAP_UART_REV_52 0x0502
 #define OMAP_UART_REV_63 0x0603
 
+/* Enhanced features register 2 */
+#define UART_OMAP_EFR2			0x23
+#define UART_OMAP_EFR2_TIMEOUT_BEHAVE	BIT(6)
+
 struct omap8250_priv {
 	int line;
 	u8 habit;
@@ -664,7 +669,7 @@ static int omap_8250_startup(struct uart_port *port)
 		priv->wer |= OMAP_UART_TX_WAKEUP_EN;
 	serial_out(up, UART_OMAP_WER, priv->wer);
 
-	if (up->dma)
+	if (up->dma && !(priv->habit & UART_HAS_EFR2))
 		up->dma->rx_dma(up);
 
 	pm_runtime_mark_last_busy(port->dev);
@@ -689,6 +694,8 @@ static void omap_8250_shutdown(struct uart_port *port)
 	pm_runtime_get_sync(port->dev);
 
 	serial_out(up, UART_OMAP_WER, 0);
+	if (priv->habit & UART_HAS_EFR2)
+		serial_out(up, UART_OMAP_EFR2, 0x0);
 
 	up->ier = 0;
 	serial_out(up, UART_IER, 0);
@@ -818,8 +825,12 @@ static void __dma_rx_complete(void *param)
 		return;
 	}
 	__dma_rx_do_complete(p);
-	if (!priv->throttled)
-		omap_8250_rx_dma(p);
+	if (!priv->throttled) {
+		p->ier |= UART_IER_RLSI | UART_IER_RDI;
+		serial_out(p, UART_IER, p->ier);
+		if (!(priv->habit & UART_HAS_EFR2))
+			omap_8250_rx_dma(p);
+	}
 
 	spin_unlock_irqrestore(&p->port.lock, flags);
 }
@@ -862,8 +873,20 @@ static int omap_8250_rx_dma(struct uart_8250_port *p)
 
 	spin_lock_irqsave(&priv->rx_dma_lock, flags);
 
-	if (dma->rx_running)
+	if (dma->rx_running) {
+		enum dma_status state;
+
+		state = dmaengine_tx_status(dma->rxchan, dma->rx_cookie, NULL);
+		if (state == DMA_COMPLETE) {
+			/*
+			 * Disable RX interrupts to allow RX DMA completion
+			 * callback to run.
+			 */
+			p->ier &= ~(UART_IER_RLSI | UART_IER_RDI);
+			serial_out(p, UART_IER, p->ier);
+		}
 		goto out;
+	}
 
 	desc = dmaengine_prep_slave_single(dma->rxchan, dma->rx_addr,
 					   dma->rx_size, DMA_DEV_TO_MEM,
@@ -1034,6 +1057,46 @@ static bool handle_rx_dma(struct uart_8250_port *up, unsigned int iir)
 	return omap_8250_rx_dma(up);
 }
 
+static unsigned char omap_8250_handle_rx_dma(struct uart_8250_port *up,
+					     u8 iir, unsigned char status)
+{
+	if ((status & (UART_LSR_DR | UART_LSR_BI)) &&
+	    (iir & UART_IIR_RDI)) {
+		if (handle_rx_dma(up, iir)) {
+			status = serial8250_rx_chars(up, status);
+			omap_8250_rx_dma(up);
+		}
+	}
+
+	return status;
+}
+
+static void am654_8250_handle_rx_dma(struct uart_8250_port *up, u8 iir,
+				     unsigned char status)
+{
+	/*
+	 * Queue a new transfer if FIFO has data.
+	 */
+	if ((status & (UART_LSR_DR | UART_LSR_BI)) &&
+	    (up->ier & UART_IER_RDI)) {
+		omap_8250_rx_dma(up);
+		serial_out(up, UART_OMAP_EFR2, UART_OMAP_EFR2_TIMEOUT_BEHAVE);
+	} else if ((iir & 0x3f) == UART_IIR_RX_TIMEOUT) {
+		/*
+		 * Disable RX timeout, read IIR to clear
+		 * current timeout condition, clear EFR2 to
+		 * periodic timeouts, re-enable interrupts.
+		 */
+		up->ier &= ~(UART_IER_RLSI | UART_IER_RDI);
+		serial_out(up, UART_IER, up->ier);
+		omap_8250_rx_dma_flush(up);
+		serial_in(up, UART_IIR);
+		serial_out(up, UART_OMAP_EFR2, 0x0);
+		up->ier |= UART_IER_RLSI | UART_IER_RDI;
+		serial_out(up, UART_IER, up->ier);
+	}
+}
+
 /*
  * This is mostly serial8250_handle_irq(). We have a slightly different DMA
  * hoook for RX/TX and need different logic for them in the ISR. Therefore we
@@ -1042,6 +1105,7 @@ static bool handle_rx_dma(struct uart_8250_port *up, unsigned int iir)
 static int omap_8250_dma_handle_irq(struct uart_port *port)
 {
 	struct uart_8250_port *up = up_to_u8250p(port);
+	struct omap8250_priv *priv = up->port.private_data;
 	unsigned char status;
 	unsigned long flags;
 	u8 iir;
@@ -1058,12 +1122,11 @@ static int omap_8250_dma_handle_irq(struct uart_port *port)
 
 	status = serial_port_in(port, UART_LSR);
 
-	if (status & (UART_LSR_DR | UART_LSR_BI)) {
-		if (handle_rx_dma(up, iir)) {
-			status = serial8250_rx_chars(up, status);
-			omap_8250_rx_dma(up);
-		}
-	}
+	if (priv->habit & UART_HAS_EFR2)
+		am654_8250_handle_rx_dma(up, iir, status);
+	else
+		status = omap_8250_handle_rx_dma(up, iir, status);
+
 	serial8250_modem_status(up);
 	if (status & UART_LSR_THRE && up->dma->tx_err) {
 		if (uart_tx_stopped(&up->port) ||
@@ -1105,12 +1168,23 @@ static int omap8250_no_handle_irq(struct uart_port *port)
 	return 0;
 }
 
+static struct omap8250_dma_params am654_dma = {
+	.rx_size = SZ_2K,
+	.rx_trigger = 1,
+	.tx_trigger = TX_TRIGGER,
+};
+
 static struct omap8250_dma_params am33xx_dma = {
 	.rx_size = RX_TRIGGER,
 	.rx_trigger = RX_TRIGGER,
 	.tx_trigger = TX_TRIGGER,
 };
 
+static struct omap8250_platdata am654_platdata = {
+	.dma_params	= &am654_dma,
+	.habit		= UART_HAS_EFR2,
+};
+
 static struct omap8250_platdata am33xx_platdata = {
 	.dma_params	= &am33xx_dma,
 	.habit		= OMAP_DMA_TX_KICK | UART_ERRATA_CLOCK_DISABLE,
@@ -1122,7 +1196,7 @@ static struct omap8250_platdata omap4_platdata = {
 };
 
 static const struct of_device_id omap8250_dt_ids[] = {
-	{ .compatible = "ti,am654-uart" },
+	{ .compatible = "ti,am654-uart", .data = &am654_platdata, },
 	{ .compatible = "ti,omap2-uart" },
 	{ .compatible = "ti,omap3-uart" },
 	{ .compatible = "ti,omap4-uart", .data = &omap4_platdata, },
@@ -1491,7 +1565,7 @@ static int omap8250_runtime_resume(struct device *dev)
 	if (omap8250_lost_context(up))
 		omap8250_restore_regs(up);
 
-	if (up->dma && up->dma->rxchan)
+	if (up->dma && up->dma->rxchan && !(priv->habit & UART_HAS_EFR2))
 		omap_8250_rx_dma(up);
 
 	priv->latency = priv->calc_latency;
-- 
2.25.2

