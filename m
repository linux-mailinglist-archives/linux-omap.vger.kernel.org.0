Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43B1450021
	for <lists+linux-omap@lfdr.de>; Mon, 15 Nov 2021 09:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233752AbhKOIpc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Nov 2021 03:45:32 -0500
Received: from muru.com ([72.249.23.125]:56456 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236413AbhKOIp1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 15 Nov 2021 03:45:27 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8FBEE826C;
        Mon, 15 Nov 2021 08:43:07 +0000 (UTC)
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
Subject: [PATCH 7/7] serial: 8250_port: Remove calls to runtime PM
Date:   Mon, 15 Nov 2021 10:42:03 +0200
Message-Id: <20211115084203.56478-8-tony@atomide.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115084203.56478-1-tony@atomide.com>
References: <20211115084203.56478-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Since we now have runtime PM calls in serial_core.c the individual
drivers do not need them anymore for the struct uart_ops related
functions.

Remove runtime PM calls in 8250 driver. This still leaves the flag for
UART_CAP_RPM for serial8250_rpm_get_tx(), serial8250_rpm_put_tx() and
serial8250_wakeup() to manage the reference count for serial TX.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
[tony@atomide.com: updated to remove the exported functions too]
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serial/8250/8250.h      |  3 -
 drivers/tty/serial/8250/8250_port.c | 98 ++++++++---------------------
 2 files changed, 27 insertions(+), 74 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -152,9 +152,6 @@ static inline bool serial8250_clear_THRI(struct uart_8250_port *up)
 
 struct uart_8250_port *serial8250_get_port(int line);
 
-void serial8250_rpm_get(struct uart_8250_port *p);
-void serial8250_rpm_put(struct uart_8250_port *p);
-
 void serial8250_rpm_get_tx(struct uart_8250_port *p);
 void serial8250_rpm_put_tx(struct uart_8250_port *p);
 
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -573,23 +573,6 @@ void serial8250_clear_and_reinit_fifos(struct uart_8250_port *p)
 }
 EXPORT_SYMBOL_GPL(serial8250_clear_and_reinit_fifos);
 
-void serial8250_rpm_get(struct uart_8250_port *p)
-{
-	if (!(p->capabilities & UART_CAP_RPM))
-		return;
-	pm_runtime_get_sync(p->port.dev);
-}
-EXPORT_SYMBOL_GPL(serial8250_rpm_get);
-
-void serial8250_rpm_put(struct uart_8250_port *p)
-{
-	if (!(p->capabilities & UART_CAP_RPM))
-		return;
-	pm_runtime_mark_last_busy(p->port.dev);
-	pm_runtime_put_autosuspend(p->port.dev);
-}
-EXPORT_SYMBOL_GPL(serial8250_rpm_put);
-
 /**
  *	serial8250_em485_init() - put uart_8250_port into rs485 emulating
  *	@p:	uart_8250_port port instance
@@ -724,7 +707,14 @@ void serial8250_rpm_get_tx(struct uart_8250_port *p)
 	rpm_active = xchg(&p->rpm_tx_active, 1);
 	if (rpm_active)
 		return;
-	pm_runtime_get(p->port.dev);
+
+	/*
+	 * Device has to be powered on at this point. Here we just increase
+	 * reference count to prevent autosuspend until the TX FIFO becomes
+	 * empty. Paired with serial8250_rpm_put_tx(). See also a comment
+	 * in serial8250_tx_chars().
+	 */
+	pm_runtime_get_noresume(p->port.dev);
 }
 EXPORT_SYMBOL_GPL(serial8250_rpm_get_tx);
 
@@ -752,8 +742,6 @@ static void serial8250_set_sleep(struct uart_8250_port *p, int sleep)
 {
 	unsigned char lcr = 0, efr = 0;
 
-	serial8250_rpm_get(p);
-
 	if (p->capabilities & UART_CAP_SLEEP) {
 		if (p->capabilities & UART_CAP_EFR) {
 			lcr = serial_in(p, UART_LCR);
@@ -769,8 +757,6 @@ static void serial8250_set_sleep(struct uart_8250_port *p, int sleep)
 			serial_out(p, UART_LCR, lcr);
 		}
 	}
-
-	serial8250_rpm_put(p);
 }
 
 #ifdef CONFIG_SERIAL_8250_RSA
@@ -1432,13 +1418,9 @@ static void serial8250_stop_rx(struct uart_port *port)
 {
 	struct uart_8250_port *up = up_to_u8250p(port);
 
-	serial8250_rpm_get(up);
-
 	up->ier &= ~(UART_IER_RLSI | UART_IER_RDI);
 	up->port.read_status_mask &= ~UART_LSR_DR;
 	serial_port_out(port, UART_IER, up->ier);
-
-	serial8250_rpm_put(up);
 }
 
 /**
@@ -1477,8 +1459,11 @@ static enum hrtimer_restart serial8250_em485_handle_stop_tx(struct hrtimer *t)
 			stop_tx_timer);
 	struct uart_8250_port *p = em485->port;
 	unsigned long flags;
+	int err;
 
-	serial8250_rpm_get(p);
+	err = pm_runtime_resume_and_get(p->port.dev);
+	if (err < 0)
+		goto out_rpm_err;
 	spin_lock_irqsave(&p->port.lock, flags);
 	if (em485->active_timer == &em485->stop_tx_timer) {
 		p->rs485_stop_tx(p);
@@ -1486,8 +1471,9 @@ static enum hrtimer_restart serial8250_em485_handle_stop_tx(struct hrtimer *t)
 		em485->tx_stopped = true;
 	}
 	spin_unlock_irqrestore(&p->port.lock, flags);
-	serial8250_rpm_put(p);
-
+	pm_runtime_mark_last_busy(p->port.dev);
+	pm_runtime_put_autosuspend(p->port.dev);
+out_rpm_err:
 	return HRTIMER_NORESTART;
 }
 
@@ -1545,7 +1531,6 @@ static void serial8250_stop_tx(struct uart_port *port)
 {
 	struct uart_8250_port *up = up_to_u8250p(port);
 
-	serial8250_rpm_get(up);
 	__stop_tx(up);
 
 	/*
@@ -1555,7 +1540,6 @@ static void serial8250_stop_tx(struct uart_port *port)
 		up->acr |= UART_ACR_TXDIS;
 		serial_icr_write(up, UART_ACR, up->acr);
 	}
-	serial8250_rpm_put(up);
 }
 
 static inline void __start_tx(struct uart_port *port)
@@ -1703,9 +1687,7 @@ static void serial8250_enable_ms(struct uart_port *port)
 
 	up->ier |= UART_IER_MSI;
 
-	serial8250_rpm_get(up);
 	serial_port_out(port, UART_IER, up->ier);
-	serial8250_rpm_put(up);
 }
 
 void serial8250_read_char(struct uart_8250_port *up, unsigned char lsr)
@@ -1984,15 +1966,11 @@ static unsigned int serial8250_tx_empty(struct uart_port *port)
 	unsigned long flags;
 	unsigned int lsr;
 
-	serial8250_rpm_get(up);
-
 	spin_lock_irqsave(&port->lock, flags);
 	lsr = serial_port_in(port, UART_LSR);
 	up->lsr_saved_flags |= lsr & LSR_SAVE_FLAGS;
 	spin_unlock_irqrestore(&port->lock, flags);
 
-	serial8250_rpm_put(up);
-
 	return (lsr & BOTH_EMPTY) == BOTH_EMPTY ? TIOCSER_TEMT : 0;
 }
 
@@ -2002,9 +1980,7 @@ unsigned int serial8250_do_get_mctrl(struct uart_port *port)
 	unsigned int status;
 	unsigned int val;
 
-	serial8250_rpm_get(up);
 	status = serial8250_modem_status(up);
-	serial8250_rpm_put(up);
 
 	val = serial8250_MSR_to_TIOCM(status);
 	if (up->gpios)
@@ -2054,7 +2030,6 @@ static void serial8250_break_ctl(struct uart_port *port, int break_state)
 	struct uart_8250_port *up = up_to_u8250p(port);
 	unsigned long flags;
 
-	serial8250_rpm_get(up);
 	spin_lock_irqsave(&port->lock, flags);
 	if (break_state == -1)
 		up->lcr |= UART_LCR_SBC;
@@ -2062,7 +2037,6 @@ static void serial8250_break_ctl(struct uart_port *port, int break_state)
 		up->lcr &= ~UART_LCR_SBC;
 	serial_port_out(port, UART_LCR, up->lcr);
 	spin_unlock_irqrestore(&port->lock, flags);
-	serial8250_rpm_put(up);
 }
 
 /*
@@ -2107,33 +2081,21 @@ static void wait_for_xmitr(struct uart_8250_port *up, int bits)
 
 static int serial8250_get_poll_char(struct uart_port *port)
 {
-	struct uart_8250_port *up = up_to_u8250p(port);
 	unsigned char lsr;
-	int status;
-
-	serial8250_rpm_get(up);
 
 	lsr = serial_port_in(port, UART_LSR);
+	if (!(lsr & UART_LSR_DR))
+		return NO_POLL_CHAR;
 
-	if (!(lsr & UART_LSR_DR)) {
-		status = NO_POLL_CHAR;
-		goto out;
-	}
-
-	status = serial_port_in(port, UART_RX);
-out:
-	serial8250_rpm_put(up);
-	return status;
+	return serial_port_in(port, UART_RX);
 }
 
-
 static void serial8250_put_poll_char(struct uart_port *port,
 			 unsigned char c)
 {
 	unsigned int ier;
 	struct uart_8250_port *up = up_to_u8250p(port);
 
-	serial8250_rpm_get(up);
 	/*
 	 *	First save the IER then disable the interrupts
 	 */
@@ -2155,7 +2117,6 @@ static void serial8250_put_poll_char(struct uart_port *port,
 	 */
 	wait_for_xmitr(up, BOTH_EMPTY);
 	serial_port_out(port, UART_IER, ier);
-	serial8250_rpm_put(up);
 }
 
 #endif /* CONFIG_CONSOLE_POLL */
@@ -2178,7 +2139,6 @@ int serial8250_do_startup(struct uart_port *port)
 	if (port->iotype != up->cur_iotype)
 		set_io_from_upio(port);
 
-	serial8250_rpm_get(up);
 	if (port->type == PORT_16C950) {
 		/* Wake up and initialize UART */
 		up->acr = 0;
@@ -2244,8 +2204,7 @@ int serial8250_do_startup(struct uart_port *port)
 	if (!(port->flags & UPF_BUGGY_UART) &&
 	    (serial_port_in(port, UART_LSR) == 0xff)) {
 		dev_info_ratelimited(port->dev, "LSR safety check engaged!\n");
-		retval = -ENODEV;
-		goto out;
+		return -ENODEV;
 	}
 
 	/*
@@ -2333,7 +2292,7 @@ int serial8250_do_startup(struct uart_port *port)
 
 	retval = up->ops->setup_irq(up);
 	if (retval)
-		goto out;
+		return retval;
 
 	/*
 	 * Now, initialize the UART
@@ -2432,10 +2391,7 @@ int serial8250_do_startup(struct uart_port *port)
 		outb_p(0x80, icp);
 		inb_p(icp);
 	}
-	retval = 0;
-out:
-	serial8250_rpm_put(up);
-	return retval;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(serial8250_do_startup);
 
@@ -2451,7 +2407,6 @@ void serial8250_do_shutdown(struct uart_port *port)
 	struct uart_8250_port *up = up_to_u8250p(port);
 	unsigned long flags;
 
-	serial8250_rpm_get(up);
 	/*
 	 * Disable interrupts from this port
 	 */
@@ -2495,7 +2450,6 @@ void serial8250_do_shutdown(struct uart_port *port)
 	 * the IRQ chain.
 	 */
 	serial_port_in(port, UART_RX);
-	serial8250_rpm_put(up);
 
 	up->ops->release_irq(up);
 }
@@ -2737,6 +2691,7 @@ void serial8250_update_uartclk(struct uart_port *port, unsigned int uartclk)
 	unsigned int baud, quot, frac = 0;
 	struct ktermios *termios;
 	unsigned long flags;
+	int err;
 
 	mutex_lock(&port->state->port.mutex);
 
@@ -2753,7 +2708,9 @@ void serial8250_update_uartclk(struct uart_port *port, unsigned int uartclk)
 	baud = serial8250_get_baud_rate(port, termios, NULL);
 	quot = serial8250_get_divisor(port, baud, &frac);
 
-	serial8250_rpm_get(up);
+	err = pm_runtime_resume_and_get(port->dev);
+	if (err < 0)
+		goto out_lock;
 	spin_lock_irqsave(&port->lock, flags);
 
 	uart_update_timeout(port, termios->c_cflag, baud);
@@ -2762,7 +2719,8 @@ void serial8250_update_uartclk(struct uart_port *port, unsigned int uartclk)
 	serial_port_out(port, UART_LCR, up->lcr);
 
 	spin_unlock_irqrestore(&port->lock, flags);
-	serial8250_rpm_put(up);
+	pm_runtime_mark_last_busy(port->dev);
+	pm_runtime_put_autosuspend(port->dev);
 
 out_lock:
 	mutex_unlock(&port->state->port.mutex);
@@ -2793,7 +2751,6 @@ serial8250_do_set_termios(struct uart_port *port, struct ktermios *termios,
 	 * Ok, we're now changing the port state.  Do it with
 	 * interrupts disabled.
 	 */
-	serial8250_rpm_get(up);
 	spin_lock_irqsave(&port->lock, flags);
 
 	up->lcr = cval;					/* Save computed LCR */
@@ -2899,7 +2856,6 @@ serial8250_do_set_termios(struct uart_port *port, struct ktermios *termios,
 	}
 	serial8250_set_mctrl(port, port->mctrl);
 	spin_unlock_irqrestore(&port->lock, flags);
-	serial8250_rpm_put(up);
 
 	/* Don't rewrite B0 */
 	if (tty_termios_baud_rate(termios))
-- 
2.33.1
