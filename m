Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5A342EFAD
	for <lists+linux-omap@lfdr.de>; Fri, 15 Oct 2021 13:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238456AbhJOL2q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Oct 2021 07:28:46 -0400
Received: from muru.com ([72.249.23.125]:44950 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238508AbhJOL2l (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Oct 2021 07:28:41 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id DD9AE81D1;
        Fri, 15 Oct 2021 11:27:05 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] serial: core: Add wakeup() and start_pending_tx() for power management
Date:   Fri, 15 Oct 2021 14:26:23 +0300
Message-Id: <20211015112626.35359-2-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015112626.35359-1-tony@atomide.com>
References: <20211015112626.35359-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If the serial driver implements PM runtime with autosuspend, the port may
be powered down on TX. To wake up the port, let's add new wakeup() call
for serial drivers to implement as needed. We can call wakeup() from
__uart_start() and flow control related functions before attempting to
write to the serial port registers.

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
 Documentation/driver-api/serial/driver.rst |  9 +++
 drivers/tty/serial/serial_core.c           | 68 +++++++++++++++++++++-
 include/linux/serial_core.h                |  3 +
 3 files changed, 78 insertions(+), 2 deletions(-)

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
@@ -91,6 +91,35 @@ static inline struct uart_port *uart_port_check(struct uart_state *state)
 	return state->uart_port;
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
+static int uart_port_wakeup(struct uart_port *port)
+{
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&port->lock, flags);
+	ret = __uart_port_wakeup(port);
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	return ret;
+}
+
 /*
  * This routine is used by the interrupt handler to schedule processing in
  * the software interrupt portion of the driver.
@@ -123,8 +152,13 @@ static void __uart_start(struct tty_struct *tty)
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
+	port->ops->start_tx(port);
 }
 
 static void uart_start(struct tty_struct *tty)
@@ -138,6 +172,21 @@ static void uart_start(struct tty_struct *tty)
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
@@ -1067,6 +1116,11 @@ uart_tiocmset(struct tty_struct *tty, unsigned int set, unsigned int clear)
 	if (!uport)
 		goto out;
 
+	if (uart_port_wakeup(uport) < 0) {
+		ret = -EAGAIN;
+		goto out;
+	}
+
 	if (!tty_io_error(tty)) {
 		uart_update_mctrl(uport, set, clear);
 		ret = 0;
@@ -1402,6 +1456,11 @@ uart_ioctl(struct tty_struct *tty, unsigned int cmd, unsigned long arg)
 		goto out_up;
 	}
 
+	if (uart_port_wakeup(uport) < 0) {
+		ret = -EAGAIN;
+		goto out_up;
+	}
+
 	/*
 	 * All these rely on hardware being present and need to be
 	 * protected against the tty being hung up.
@@ -1724,7 +1783,12 @@ static void uart_dtr_rts(struct tty_port *port, int raise)
 	uport = uart_port_ref(state);
 	if (!uport)
 		return;
+
+	if (uart_port_wakeup(uport) < 0)
+		goto out;
+
 	uart_port_dtr_rts(uport, raise);
+out:
 	uart_port_deref(uport);
 }
 
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
2.33.0
