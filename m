Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A670D45001E
	for <lists+linux-omap@lfdr.de>; Mon, 15 Nov 2021 09:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbhKOIp0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Nov 2021 03:45:26 -0500
Received: from muru.com ([72.249.23.125]:56390 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235183AbhKOIpQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 15 Nov 2021 03:45:16 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 82B118139;
        Mon, 15 Nov 2021 08:42:56 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 2/7] serial: core: Add wakeup() and start_pending_tx() for asynchronous wake
Date:   Mon, 15 Nov 2021 10:41:58 +0200
Message-Id: <20211115084203.56478-3-tony@atomide.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115084203.56478-1-tony@atomide.com>
References: <20211115084203.56478-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If the serial driver implements PM runtime with autosuspend, the port may
be powered down on TX. To wake up the port, let's add new wakeup() call
for serial drivers to implement as needed. We can call wakeup() from
__uart_start() before attempting to write to the serial port registers.

Let's keep track of the serial port with a new runtime_suspended flag
that the device driver runtime PM suspend and resume can manage with
port->lock held. This is because only the device driver knows what the
device runtime PM state as in Documentation/power/runtime_pm.rst
under "9. Autosuspend, or automatically-delayed suspend" for locking.

To allow the serial port drivers to send out pending tx on runtime PM
resume, let's add start_pending_tx() as suggested by Johan Hovold
<johan@kernel.org>.

Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 Documentation/driver-api/serial/driver.rst |  9 ++++
 drivers/tty/serial/serial_core.c           | 49 +++++++++++++++++++++-
 include/linux/serial_core.h                |  3 ++
 3 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/serial/driver.rst b/Documentation/driver-api/serial/driver.rst
--- a/Documentation/driver-api/serial/driver.rst
+++ b/Documentation/driver-api/serial/driver.rst
@@ -234,6 +234,15 @@ hardware.
 
 	Interrupts: caller dependent.
 
+  wakeup(port)
+	Wake up port if it has been runtime PM suspended.
+
+	Locking: port->lock taken.
+
+	Interrupts: locally disabled.
+
+	This call must not sleep
+
   flush_buffer(port)
 	Flush any write buffers, reset any DMA state and stop any
 	ongoing DMA transfers.
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -107,12 +107,35 @@ static int serial_pm_resume_and_get(struct device *dev)
 	return pm_runtime_resume_and_get(dev);
 }
 
+/* Only increments the runtime PM usage count */
+static void serial_pm_get_noresume(struct device *dev)
+{
+	pm_runtime_get_noresume(dev);
+}
+
 static void serial_pm_autosuspend(struct device *dev)
 {
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 }
 
+/*
+ * This routine can be used before register access to wake up a serial
+ * port that has been runtime PM suspended by the serial port driver.
+ * Note that the runtime_suspended flag is managed by the serial port
+ * device driver runtime PM.
+ */
+static int __uart_port_wakeup(struct uart_port *port)
+{
+	if (!port->runtime_suspended)
+		return 0;
+
+	if (port->ops->wakeup)
+		return port->ops->wakeup(port);
+
+	return 0;
+}
+
 /*
  * This routine is used by the interrupt handler to schedule processing in
  * the software interrupt portion of the driver.
@@ -145,8 +168,15 @@ static void __uart_start(struct tty_struct *tty)
 	struct uart_state *state = tty->driver_data;
 	struct uart_port *port = state->uart_port;
 
-	if (port && !uart_tx_stopped(port))
-		port->ops->start_tx(port);
+	if (!port || uart_tx_stopped(port))
+		return;
+
+	if (__uart_port_wakeup(port) < 0)
+		return;
+
+	serial_pm_get_noresume(port->dev);
+	port->ops->start_tx(port);
+	serial_pm_autosuspend(port->dev);
 }
 
 static void uart_start(struct tty_struct *tty)
@@ -160,6 +190,21 @@ static void uart_start(struct tty_struct *tty)
 	uart_port_unlock(port, flags);
 }
 
+/*
+ * This routine can be called from the serial driver runtime PM resume function
+ * to transmit buffered data if the serial port was not active on uart_write().
+ */
+void uart_start_pending_tx(struct uart_port *port)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->lock, flags);
+	if (!uart_tx_stopped(port) && uart_circ_chars_pending(&port->state->xmit))
+		port->ops->start_tx(port);
+	spin_unlock_irqrestore(&port->lock, flags);
+}
+EXPORT_SYMBOL(uart_start_pending_tx);
+
 static void
 uart_update_mctrl(struct uart_port *port, unsigned int set, unsigned int clear)
 {
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -40,6 +40,7 @@ struct uart_ops {
 	void		(*set_mctrl)(struct uart_port *, unsigned int mctrl);
 	unsigned int	(*get_mctrl)(struct uart_port *);
 	void		(*stop_tx)(struct uart_port *);
+	int		(*wakeup)(struct uart_port *);
 	void		(*start_tx)(struct uart_port *);
 	void		(*throttle)(struct uart_port *);
 	void		(*unthrottle)(struct uart_port *);
@@ -250,6 +251,7 @@ struct uart_port {
 	unsigned char		suspended;
 	unsigned char		console_reinit;
 	const char		*name;			/* port name */
+	unsigned int		runtime_suspended:1;	/* port runtime state set by port driver */
 	struct attribute_group	*attr_group;		/* port specific attributes */
 	const struct attribute_group **tty_groups;	/* all attributes (serial core use only) */
 	struct serial_rs485     rs485;
@@ -414,6 +416,7 @@ bool uart_match_port(const struct uart_port *port1,
 /*
  * Power Management
  */
+void uart_start_pending_tx(struct uart_port *port);
 int uart_suspend_port(struct uart_driver *reg, struct uart_port *port);
 int uart_resume_port(struct uart_driver *reg, struct uart_port *port);
 
-- 
2.33.1
