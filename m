Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B66B45001C
	for <lists+linux-omap@lfdr.de>; Mon, 15 Nov 2021 09:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234749AbhKOIpP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Nov 2021 03:45:15 -0500
Received: from muru.com ([72.249.23.125]:56378 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230145AbhKOIpN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 15 Nov 2021 03:45:13 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0958F8111;
        Mon, 15 Nov 2021 08:42:53 +0000 (UTC)
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
Subject: [PATCH 1/7] serial: core: Add support of runtime PM
Date:   Mon, 15 Nov 2021 10:41:57 +0200
Message-Id: <20211115084203.56478-2-tony@atomide.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115084203.56478-1-tony@atomide.com>
References: <20211115084203.56478-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

8250 driver has wrong implementation of runtime power management, i.e.
it uses an irq_safe flag. The irq_safe flag takes a permanent usage count
on the parent device preventing the parent from idling. This patch
prepares for making runtime power management generic by adding runtime PM
calls to serial core once for all UART drivers.

As we have serial drivers that do not enable runtime PM, and drivers that
enable runtime PM, we add new functions for serial_pm_resume_and_get() and
serial_pm_autosuspend() functions to handle errors and allow the use also
for cases when runtime PM is not enabled. The other option considered was
to not check for runtime PM enable errors. But some CPUs can hang when the
clocks are not enabled for the device, so ignoring the errors is not a good
option. Eventually with the serial port drivers updated, we should be able
to just switch to using the standard runtime PM calls with no need for the
wrapper functions.

Note that this patch only adds runtime PM calls to the functions where we
can call them for synchronous wake-up without the need for irq_safe flag.
Additionally we also need asynchronous wake-up support for __uart_start(),
that is added in a separate patch.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Co-developed-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serial/serial_core.c | 150 ++++++++++++++++++++++++++++---
 1 file changed, 140 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -16,6 +16,7 @@
 #include <linux/console.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
 #include <linux/device.h>
@@ -91,6 +92,27 @@ static inline struct uart_port *uart_port_check(struct uart_state *state)
 	return state->uart_port;
 }
 
+/*
+ * Enables runtime PM suspended serial port. If runtime PM is not
+ * enabled by the serial port driver, only increments the runtime PM
+ * usage count. May sleep.
+ */
+static int serial_pm_resume_and_get(struct device *dev)
+{
+	if (!pm_runtime_enabled(dev)) {
+		pm_runtime_get_noresume(dev);
+		return 0;
+	}
+
+	return pm_runtime_resume_and_get(dev);
+}
+
+static void serial_pm_autosuspend(struct device *dev)
+{
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+}
+
 /*
  * This routine is used by the interrupt handler to schedule processing in
  * the software interrupt portion of the driver.
@@ -143,13 +165,18 @@ uart_update_mctrl(struct uart_port *port, unsigned int set, unsigned int clear)
 {
 	unsigned long flags;
 	unsigned int old;
+	int err;
 
+	err = serial_pm_resume_and_get(port->dev);
+	if (err < 0)
+		return;
 	spin_lock_irqsave(&port->lock, flags);
 	old = port->mctrl;
 	port->mctrl = (old & ~clear) | set;
 	if (old != port->mctrl)
 		port->ops->set_mctrl(port, port->mctrl);
 	spin_unlock_irqrestore(&port->lock, flags);
+	serial_pm_autosuspend(port->dev);
 }
 
 #define uart_set_mctrl(port, set)	uart_update_mctrl(port, set, 0)
@@ -218,7 +245,12 @@ static int uart_port_startup(struct tty_struct *tty, struct uart_state *state,
 		free_page(page);
 	}
 
+	retval = serial_pm_resume_and_get(uport->dev);
+	if (retval < 0)
+		goto out;
 	retval = uport->ops->startup(uport);
+	serial_pm_autosuspend(uport->dev);
+
 	if (retval == 0) {
 		if (uart_console(uport) && uport->cons->cflag) {
 			tty->termios.c_cflag = uport->cons->cflag;
@@ -244,7 +276,7 @@ static int uart_port_startup(struct tty_struct *tty, struct uart_state *state,
 	 */
 	if (retval && capable(CAP_SYS_ADMIN))
 		return 1;
-
+out:
 	return retval;
 }
 
@@ -481,6 +513,7 @@ static void uart_change_speed(struct tty_struct *tty, struct uart_state *state,
 	struct uart_port *uport = uart_port_check(state);
 	struct ktermios *termios;
 	int hw_stopped;
+	int err;
 
 	/*
 	 * If we have no tty, termios, or the port does not exist,
@@ -490,6 +523,11 @@ static void uart_change_speed(struct tty_struct *tty, struct uart_state *state,
 		return;
 
 	termios = &tty->termios;
+
+	err = serial_pm_resume_and_get(uport->dev);
+	if (err < 0)
+		return;
+
 	uport->ops->set_termios(uport, termios, old_termios);
 
 	/*
@@ -518,6 +556,7 @@ static void uart_change_speed(struct tty_struct *tty, struct uart_state *state,
 			__uart_start(tty);
 	}
 	spin_unlock_irq(&uport->lock);
+	serial_pm_autosuspend(uport->dev);
 }
 
 static int uart_put_char(struct tty_struct *tty, unsigned char c)
@@ -1015,7 +1054,14 @@ static int uart_get_lsr_info(struct tty_struct *tty,
 	struct uart_port *uport = uart_port_check(state);
 	unsigned int result;
 
+	result = serial_pm_resume_and_get(uport->dev);
+	if (result < 0) {
+		result = TIOCSER_TEMT;
+		goto out;
+	}
+
 	result = uport->ops->tx_empty(uport);
+	serial_pm_autosuspend(uport->dev);
 
 	/*
 	 * If we're about to load something into the transmit
@@ -1027,7 +1073,7 @@ static int uart_get_lsr_info(struct tty_struct *tty,
 	    ((uart_circ_chars_pending(&state->xmit) > 0) &&
 	     !uart_tx_stopped(uport)))
 		result &= ~TIOCSER_TEMT;
-
+out:
 	return put_user(result, value);
 }
 
@@ -1045,9 +1091,14 @@ static int uart_tiocmget(struct tty_struct *tty)
 
 	if (!tty_io_error(tty)) {
 		result = uport->mctrl;
+
+		result = serial_pm_resume_and_get(uport->dev);
+		if (result < 0)
+			goto out;
 		spin_lock_irq(&uport->lock);
 		result |= uport->ops->get_mctrl(uport);
 		spin_unlock_irq(&uport->lock);
+		serial_pm_autosuspend(uport->dev);
 	}
 out:
 	mutex_unlock(&port->mutex);
@@ -1088,8 +1139,12 @@ static int uart_break_ctl(struct tty_struct *tty, int break_state)
 	if (!uport)
 		goto out;
 
+	ret = serial_pm_resume_and_get(uport->dev);
+	if (ret < 0)
+		goto out;
 	if (uport->type != PORT_UNKNOWN && uport->ops->break_ctl)
 		uport->ops->break_ctl(uport, break_state);
+	serial_pm_autosuspend(uport->dev);
 	ret = 0;
 out:
 	mutex_unlock(&port->mutex);
@@ -1138,7 +1193,11 @@ static int uart_do_autoconfig(struct tty_struct *tty, struct uart_state *state)
 		 * This will claim the ports resources if
 		 * a port is found.
 		 */
+		ret = serial_pm_resume_and_get(uport->dev);
+		if (ret < 0)
+			goto out;
 		uport->ops->config_port(uport, flags);
+		serial_pm_autosuspend(uport->dev);
 
 		ret = uart_startup(tty, state, 1);
 		if (ret == 0)
@@ -1443,14 +1502,21 @@ static void uart_set_ldisc(struct tty_struct *tty)
 	struct uart_state *state = tty->driver_data;
 	struct uart_port *uport;
 	struct tty_port *port = &state->port;
+	int err;
 
 	if (!tty_port_initialized(port))
 		return;
 
 	mutex_lock(&state->port.mutex);
 	uport = uart_port_check(state);
-	if (uport && uport->ops->set_ldisc)
+	if (uport && uport->ops->set_ldisc) {
+		err = serial_pm_resume_and_get(uport->dev);
+		if (err < 0)
+			goto out;
 		uport->ops->set_ldisc(uport, &tty->termios);
+		serial_pm_autosuspend(uport->dev);
+	}
+out:
 	mutex_unlock(&state->port.mutex);
 }
 
@@ -1542,6 +1608,7 @@ static void uart_tty_port_shutdown(struct tty_port *port)
 {
 	struct uart_state *state = container_of(port, struct uart_state, port);
 	struct uart_port *uport = uart_port_check(state);
+	int err;
 
 	/*
 	 * At this point, we stop accepting input.  To do this, we
@@ -1550,9 +1617,13 @@ static void uart_tty_port_shutdown(struct tty_port *port)
 	if (WARN(!uport, "detached port still initialized!\n"))
 		return;
 
+	err = serial_pm_resume_and_get(uport->dev);
+	if (err < 0)
+		return;
 	spin_lock_irq(&uport->lock);
 	uport->ops->stop_rx(uport);
 	spin_unlock_irq(&uport->lock);
+	serial_pm_autosuspend(uport->dev);
 
 	uart_port_shutdown(port);
 
@@ -1668,6 +1739,7 @@ static void uart_port_shutdown(struct tty_port *port)
 {
 	struct uart_state *state = container_of(port, struct uart_state, port);
 	struct uart_port *uport = uart_port_check(state);
+	int err;
 
 	/*
 	 * clear delta_msr_wait queue to avoid mem leaks: we may free
@@ -1681,8 +1753,13 @@ static void uart_port_shutdown(struct tty_port *port)
 	/*
 	 * Free the IRQ and disable the port.
 	 */
-	if (uport)
+	if (uport) {
+		err = serial_pm_resume_and_get(uport->dev);
+		if (err < 0)
+			return;
 		uport->ops->shutdown(uport);
+		serial_pm_autosuspend(uport->dev);
+	}
 
 	/*
 	 * Ensure that the IRQ handler isn't running on another CPU.
@@ -1803,7 +1880,7 @@ static void uart_line_info(struct seq_file *m, struct uart_driver *drv, int i)
 	struct uart_port *uport;
 	char stat_buf[32];
 	unsigned int status;
-	int mmio;
+	int mmio, err;
 
 	mutex_lock(&port->mutex);
 	uport = uart_port_check(state);
@@ -1824,12 +1901,16 @@ static void uart_line_info(struct seq_file *m, struct uart_driver *drv, int i)
 	}
 
 	if (capable(CAP_SYS_ADMIN)) {
+		err = serial_pm_resume_and_get(uport->dev);
+		if (err < 0)
+			goto out;
 		pm_state = state->pm_state;
 		if (pm_state != UART_PM_STATE_ON)
 			uart_change_pm(state, UART_PM_STATE_ON);
 		spin_lock_irq(&uport->lock);
 		status = uport->ops->get_mctrl(uport);
 		spin_unlock_irq(&uport->lock);
+		serial_pm_autosuspend(uport->dev);
 		if (pm_state != UART_PM_STATE_ON)
 			uart_change_pm(state, pm_state);
 
@@ -2050,6 +2131,7 @@ uart_set_options(struct uart_port *port, struct console *co,
 {
 	struct ktermios termios;
 	static struct ktermios dummy;
+	int ret;
 
 	/*
 	 * Ensure that the serial-console lock is initialised early.
@@ -2089,7 +2171,17 @@ uart_set_options(struct uart_port *port, struct console *co,
 	 */
 	port->mctrl |= TIOCM_DTR;
 
-	port->ops->set_termios(port, &termios, &dummy);
+	/* At early stage device is not created yet, we can't do PM */
+	if (port->dev) {
+		ret = serial_pm_resume_and_get(port->dev);
+		if (ret < 0)
+			return ret;
+		port->ops->set_termios(port, &termios, &dummy);
+		serial_pm_autosuspend(port->dev);
+	} else {
+		port->ops->set_termios(port, &termios, &dummy);
+	}
+
 	/*
 	 * Allow the setting of the UART parameters with a NULL console
 	 * too:
@@ -2143,6 +2235,7 @@ int uart_suspend_port(struct uart_driver *drv, struct uart_port *uport)
 	struct tty_port *port = &state->port;
 	struct device *tty_dev;
 	struct uart_match match = {uport, drv};
+	int err;
 
 	mutex_lock(&port->mutex);
 
@@ -2168,11 +2261,15 @@ int uart_suspend_port(struct uart_driver *drv, struct uart_port *uport)
 		tty_port_set_suspended(port, 1);
 		tty_port_set_initialized(port, 0);
 
+		err = serial_pm_resume_and_get(uport->dev);
+		if (err < 0)
+			goto unlock;
 		spin_lock_irq(&uport->lock);
 		ops->stop_tx(uport);
 		ops->set_mctrl(uport, 0);
 		ops->stop_rx(uport);
 		spin_unlock_irq(&uport->lock);
+		serial_pm_autosuspend(uport->dev);
 
 		/*
 		 * Wait for the transmitter to empty.
@@ -2183,7 +2280,11 @@ int uart_suspend_port(struct uart_driver *drv, struct uart_port *uport)
 			dev_err(uport->dev, "%s: Unable to drain transmitter\n",
 				uport->name);
 
+		err = serial_pm_resume_and_get(uport->dev);
+		if (err < 0)
+			goto unlock;
 		ops->shutdown(uport);
+		serial_pm_autosuspend(uport->dev);
 	}
 
 	/*
@@ -2206,6 +2307,7 @@ int uart_resume_port(struct uart_driver *drv, struct uart_port *uport)
 	struct device *tty_dev;
 	struct uart_match match = {uport, drv};
 	struct ktermios termios;
+	int ret;
 
 	mutex_lock(&port->mutex);
 
@@ -2236,33 +2338,50 @@ int uart_resume_port(struct uart_driver *drv, struct uart_port *uport)
 		if (port->tty && termios.c_cflag == 0)
 			termios = port->tty->termios;
 
+		ret = serial_pm_resume_and_get(uport->dev);
+		if (ret < 0)
+			goto unlock;
 		if (console_suspend_enabled)
 			uart_change_pm(state, UART_PM_STATE_ON);
 		uport->ops->set_termios(uport, &termios, NULL);
+		serial_pm_autosuspend(uport->dev);
+
 		if (console_suspend_enabled)
 			console_start(uport->cons);
 	}
 
 	if (tty_port_suspended(port)) {
 		const struct uart_ops *ops = uport->ops;
-		int ret;
 
+		ret = serial_pm_resume_and_get(uport->dev);
+		if (ret < 0)
+			goto unlock;
 		uart_change_pm(state, UART_PM_STATE_ON);
 		spin_lock_irq(&uport->lock);
 		ops->set_mctrl(uport, 0);
 		spin_unlock_irq(&uport->lock);
+		serial_pm_autosuspend(uport->dev);
+
 		if (console_suspend_enabled || !uart_console(uport)) {
 			/* Protected by port mutex for now */
 			struct tty_struct *tty = port->tty;
 
+			ret = serial_pm_resume_and_get(uport->dev);
+			if (ret < 0)
+				goto unlock;
 			ret = ops->startup(uport);
+			serial_pm_autosuspend(uport->dev);
 			if (ret == 0) {
 				if (tty)
 					uart_change_speed(tty, state, NULL);
+				ret = serial_pm_resume_and_get(uport->dev);
+				if (ret < 0)
+					goto unlock;
 				spin_lock_irq(&uport->lock);
 				ops->set_mctrl(uport, uport->mctrl);
 				ops->start_tx(uport);
 				spin_unlock_irq(&uport->lock);
+				serial_pm_autosuspend(uport->dev);
 				tty_port_set_initialized(port, 1);
 			} else {
 				/*
@@ -2276,10 +2395,10 @@ int uart_resume_port(struct uart_driver *drv, struct uart_port *uport)
 
 		tty_port_set_suspended(port, 0);
 	}
-
+unlock:
 	mutex_unlock(&port->mutex);
 
-	return 0;
+	return ret;
 }
 
 static inline void
@@ -2329,6 +2448,7 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 		    struct uart_port *port)
 {
 	unsigned int flags;
+	int err;
 
 	/*
 	 * If there isn't a port here, don't do anything further.
@@ -2356,6 +2476,10 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 
 		uart_report_port(drv, port);
 
+		err = serial_pm_resume_and_get(port->dev);
+		if (err < 0)
+			return;
+
 		/* Power up port for set_mctrl() */
 		uart_change_pm(state, UART_PM_STATE_ON);
 
@@ -2367,6 +2491,7 @@ uart_configure_port(struct uart_driver *drv, struct uart_state *state,
 		spin_lock_irqsave(&port->lock, flags);
 		port->ops->set_mctrl(port, port->mctrl & TIOCM_DTR);
 		spin_unlock_irqrestore(&port->lock, flags);
+		serial_pm_autosuspend(port->dev);
 
 		/*
 		 * If this driver supports console, and it hasn't been
@@ -3084,11 +3209,16 @@ EXPORT_SYMBOL_GPL(uart_handle_dcd_change);
  */
 void uart_handle_cts_change(struct uart_port *uport, unsigned int status)
 {
+	int err;
+
 	lockdep_assert_held_once(&uport->lock);
 
 	uport->icount.cts++;
 
 	if (uart_softcts_mode(uport)) {
+		err = serial_pm_resume_and_get(uport->dev);
+		if (err < 0)
+			return;
 		if (uport->hw_stopped) {
 			if (status) {
 				uport->hw_stopped = 0;
@@ -3101,7 +3231,7 @@ void uart_handle_cts_change(struct uart_port *uport, unsigned int status)
 				uport->ops->stop_tx(uport);
 			}
 		}
-
+		serial_pm_autosuspend(uport->dev);
 	}
 }
 EXPORT_SYMBOL_GPL(uart_handle_cts_change);
-- 
2.33.1
