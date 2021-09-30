Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B65C41D355
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 08:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348343AbhI3GbI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Sep 2021 02:31:08 -0400
Received: from muru.com ([72.249.23.125]:38888 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348320AbhI3GbG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Sep 2021 02:31:06 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id B00D78150;
        Thu, 30 Sep 2021 06:29:51 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] serial: 8250_omap: Drop the use of pm_runtime_irq_safe()
Date:   Thu, 30 Sep 2021 09:29:06 +0300
Message-Id: <20210930062906.58937-5-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930062906.58937-1-tony@atomide.com>
References: <20210930062906.58937-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can finally drop the pm_runtime_irq_safe() usage for 8250_omap driver.

We already have the serial layer RX wake path fixed for power management.
We no longer allow deeper idle states unless the kernel console has been
detached, and we require that the RX wakeirq is configured.

For TX path, we now use the prep_tx() and uart_flush_tx() calls.

To drop pm_runtime_irq_safe(), we remove all PM runtime calls from the
interrupt context. If we ever see an interrupt for an idled port, we just
bail out. We now also need to restore the port context with interrupts
disabled to prevent interrupts from happening while restoring the port.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serial/8250/8250_omap.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -621,6 +621,9 @@ static irqreturn_t omap8250_irq(int irq, void *dev_id)
 	unsigned int iir, lsr;
 	int ret;
 
+	if (atomic_read(&port->runtime_suspended))
+		return IRQ_NONE;
+
 #ifdef CONFIG_SERIAL_8250_DMA
 	if (up->dma) {
 		ret = omap_8250_dma_handle_irq(port);
@@ -628,7 +631,6 @@ static irqreturn_t omap8250_irq(int irq, void *dev_id)
 	}
 #endif
 
-	serial8250_rpm_get(up);
 	lsr = serial_port_in(port, UART_LSR);
 	iir = serial_port_in(port, UART_IIR);
 	ret = serial8250_handle_irq(port, iir);
@@ -662,8 +664,6 @@ static irqreturn_t omap8250_irq(int irq, void *dev_id)
 		schedule_delayed_work(&up->overrun_backoff, delay);
 	}
 
-	serial8250_rpm_put(up);
-
 	return IRQ_RETVAL(ret);
 }
 
@@ -1191,13 +1191,9 @@ static int omap_8250_dma_handle_irq(struct uart_port *port)
 	unsigned char status;
 	u8 iir;
 
-	serial8250_rpm_get(up);
-
 	iir = serial_port_in(port, UART_IIR);
-	if (iir & UART_IIR_NO_INT) {
-		serial8250_rpm_put(up);
+	if (iir & UART_IIR_NO_INT)
 		return IRQ_HANDLED;
-	}
 
 	spin_lock(&port->lock);
 
@@ -1226,7 +1222,6 @@ static int omap_8250_dma_handle_irq(struct uart_port *port)
 
 	uart_unlock_and_check_sysrq(port);
 
-	serial8250_rpm_put(up);
 	return 1;
 }
 
@@ -1420,8 +1415,6 @@ static int omap8250_probe(struct platform_device *pdev)
 	if (!of_get_available_child_count(pdev->dev.of_node))
 		pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
 
-	pm_runtime_irq_safe(&pdev->dev);
-
 	pm_runtime_get_sync(&pdev->dev);
 
 	omap_serial_fill_features_erratas(&up, priv);
@@ -1652,6 +1645,7 @@ static int omap8250_runtime_resume(struct device *dev)
 	struct omap8250_priv *priv = dev_get_drvdata(dev);
 	struct uart_8250_port *up;
 	struct uart_port *port;
+	unsigned long flags;
 
 	/* In case runtime-pm tries this before we are setup */
 	if (!priv)
@@ -1660,6 +1654,8 @@ static int omap8250_runtime_resume(struct device *dev)
 	up = serial8250_get_port(priv->line);
 	port = &up->port;
 
+	/* Restore state with interrupts disabled */
+	spin_lock_irqsave(&port->lock, flags);
 	if (omap8250_lost_context(up))
 		omap8250_restore_regs(up);
 
@@ -1671,6 +1667,8 @@ static int omap8250_runtime_resume(struct device *dev)
 
 	atomic_set(&port->runtime_suspended, 0);
 
+	spin_unlock_irqrestore(&port->lock, flags);
+
 	uart_start_pending_tx(port);
 
 	return 0;
-- 
2.33.0
