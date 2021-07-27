Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C505E3D7342
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 12:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236036AbhG0Kby (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 06:31:54 -0400
Received: from muru.com ([72.249.23.125]:55864 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231745AbhG0Kbx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 06:31:53 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 451BD80F0;
        Tue, 27 Jul 2021 10:32:10 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Dario Binacchi <dariobin@libero.it>
Subject: [PATCH 1/2] serial: omap: Disable PM runtime autoidle to remove pm_runtime_irq_safe()
Date:   Tue, 27 Jul 2021 13:31:48 +0300
Message-Id: <20210727103149.51175-1-tony@atomide.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We want to remove the use of pm_runtime_irq_safe() from serial drivers
to allow making PM runtime handling generic. Let's simplify things by
disabling PM runtime autoidle for omap-serial as this driver has been
deprecated for years because of the 8250_omap driver.

There are still some omap-serial users that seem to hang on to it for
some unknown rs485 reasons it seems. But presumably those folks do not
need PM runtime autoidle with omap-serial, and hopefully can just move
to using 8250_omap driver instead.

For 8250_omap driver, we will eventually move to use generic serial
layer PM based on patches done by Andy Shevchenko to remove
pm_runtime_irq_safe() usage.

Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dario Binacchi <dariobin@libero.it>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serial/omap-serial.c | 75 +-------------------------------
 1 file changed, 2 insertions(+), 73 deletions(-)

diff --git a/drivers/tty/serial/omap-serial.c b/drivers/tty/serial/omap-serial.c
--- a/drivers/tty/serial/omap-serial.c
+++ b/drivers/tty/serial/omap-serial.c
@@ -276,11 +276,8 @@ static void serial_omap_enable_ms(struct uart_port *port)
 
 	dev_dbg(up->port.dev, "serial_omap_enable_ms+%d\n", up->port.line);
 
-	pm_runtime_get_sync(up->dev);
 	up->ier |= UART_IER_MSI;
 	serial_out(up, UART_IER, up->ier);
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
 }
 
 static void serial_omap_stop_tx(struct uart_port *port)
@@ -288,8 +285,6 @@ static void serial_omap_stop_tx(struct uart_port *port)
 	struct uart_omap_port *up = to_uart_omap_port(port);
 	int res;
 
-	pm_runtime_get_sync(up->dev);
-
 	/* Handle RS-485 */
 	if (port->rs485.flags & SER_RS485_ENABLED) {
 		if (up->scr & OMAP_UART_SCR_TX_EMPTY) {
@@ -330,21 +325,15 @@ static void serial_omap_stop_tx(struct uart_port *port)
 		up->ier &= ~UART_IER_THRI;
 		serial_out(up, UART_IER, up->ier);
 	}
-
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
 }
 
 static void serial_omap_stop_rx(struct uart_port *port)
 {
 	struct uart_omap_port *up = to_uart_omap_port(port);
 
-	pm_runtime_get_sync(up->dev);
 	up->ier &= ~(UART_IER_RLSI | UART_IER_RDI);
 	up->port.read_status_mask &= ~UART_LSR_DR;
 	serial_out(up, UART_IER, up->ier);
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
 }
 
 static void transmit_chars(struct uart_omap_port *up, unsigned int lsr)
@@ -399,8 +388,6 @@ static void serial_omap_start_tx(struct uart_port *port)
 	struct uart_omap_port *up = to_uart_omap_port(port);
 	int res;
 
-	pm_runtime_get_sync(up->dev);
-
 	/* Handle RS-485 */
 	if (port->rs485.flags & SER_RS485_ENABLED) {
 		/* Fire THR interrupts when FIFO is below trigger level */
@@ -421,8 +408,6 @@ static void serial_omap_start_tx(struct uart_port *port)
 		up->rs485_tx_filter_count = 0;
 
 	serial_omap_enable_ier_thri(up);
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
 }
 
 static void serial_omap_throttle(struct uart_port *port)
@@ -430,13 +415,10 @@ static void serial_omap_throttle(struct uart_port *port)
 	struct uart_omap_port *up = to_uart_omap_port(port);
 	unsigned long flags;
 
-	pm_runtime_get_sync(up->dev);
 	spin_lock_irqsave(&up->port.lock, flags);
 	up->ier &= ~(UART_IER_RLSI | UART_IER_RDI);
 	serial_out(up, UART_IER, up->ier);
 	spin_unlock_irqrestore(&up->port.lock, flags);
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
 }
 
 static void serial_omap_unthrottle(struct uart_port *port)
@@ -444,13 +426,10 @@ static void serial_omap_unthrottle(struct uart_port *port)
 	struct uart_omap_port *up = to_uart_omap_port(port);
 	unsigned long flags;
 
-	pm_runtime_get_sync(up->dev);
 	spin_lock_irqsave(&up->port.lock, flags);
 	up->ier |= UART_IER_RLSI | UART_IER_RDI;
 	serial_out(up, UART_IER, up->ier);
 	spin_unlock_irqrestore(&up->port.lock, flags);
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
 }
 
 static unsigned int check_modem_status(struct uart_omap_port *up)
@@ -576,7 +555,6 @@ static irqreturn_t serial_omap_irq(int irq, void *dev_id)
 	int max_count = 256;
 
 	spin_lock(&up->port.lock);
-	pm_runtime_get_sync(up->dev);
 
 	do {
 		iir = serial_in(up, UART_IIR);
@@ -616,8 +594,6 @@ static irqreturn_t serial_omap_irq(int irq, void *dev_id)
 
 	tty_flip_buffer_push(&up->port.state->port);
 
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
 	up->port_activity = jiffies;
 
 	return ret;
@@ -629,13 +605,11 @@ static unsigned int serial_omap_tx_empty(struct uart_port *port)
 	unsigned long flags;
 	unsigned int ret = 0;
 
-	pm_runtime_get_sync(up->dev);
 	dev_dbg(up->port.dev, "serial_omap_tx_empty+%d\n", up->port.line);
 	spin_lock_irqsave(&up->port.lock, flags);
 	ret = serial_in(up, UART_LSR) & UART_LSR_TEMT ? TIOCSER_TEMT : 0;
 	spin_unlock_irqrestore(&up->port.lock, flags);
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
+
 	return ret;
 }
 
@@ -645,10 +619,7 @@ static unsigned int serial_omap_get_mctrl(struct uart_port *port)
 	unsigned int status;
 	unsigned int ret = 0;
 
-	pm_runtime_get_sync(up->dev);
 	status = check_modem_status(up);
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
 
 	dev_dbg(up->port.dev, "serial_omap_get_mctrl+%d\n", up->port.line);
 
@@ -680,7 +651,6 @@ static void serial_omap_set_mctrl(struct uart_port *port, unsigned int mctrl)
 	if (mctrl & TIOCM_LOOP)
 		mcr |= UART_MCR_LOOP;
 
-	pm_runtime_get_sync(up->dev);
 	old_mcr = serial_in(up, UART_MCR);
 	old_mcr &= ~(UART_MCR_LOOP | UART_MCR_OUT2 | UART_MCR_OUT1 |
 		     UART_MCR_DTR | UART_MCR_RTS);
@@ -696,9 +666,6 @@ static void serial_omap_set_mctrl(struct uart_port *port, unsigned int mctrl)
 		up->efr &= ~UART_EFR_RTS;
 	serial_out(up, UART_EFR, up->efr);
 	serial_out(up, UART_LCR, lcr);
-
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
 }
 
 static void serial_omap_break_ctl(struct uart_port *port, int break_state)
@@ -707,7 +674,6 @@ static void serial_omap_break_ctl(struct uart_port *port, int break_state)
 	unsigned long flags;
 
 	dev_dbg(up->port.dev, "serial_omap_break_ctl+%d\n", up->port.line);
-	pm_runtime_get_sync(up->dev);
 	spin_lock_irqsave(&up->port.lock, flags);
 	if (break_state == -1)
 		up->lcr |= UART_LCR_SBC;
@@ -715,8 +681,6 @@ static void serial_omap_break_ctl(struct uart_port *port, int break_state)
 		up->lcr &= ~UART_LCR_SBC;
 	serial_out(up, UART_LCR, up->lcr);
 	spin_unlock_irqrestore(&up->port.lock, flags);
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
 }
 
 static int serial_omap_startup(struct uart_port *port)
@@ -788,8 +752,6 @@ static int serial_omap_startup(struct uart_port *port)
 
 	serial_out(up, UART_OMAP_WER, up->wer);
 
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
 	up->port_activity = jiffies;
 	return 0;
 }
@@ -801,7 +763,6 @@ static void serial_omap_shutdown(struct uart_port *port)
 
 	dev_dbg(up->port.dev, "serial_omap_shutdown+%d\n", up->port.line);
 
-	pm_runtime_get_sync(up->dev);
 	/*
 	 * Disable interrupts from this port
 	 */
@@ -825,8 +786,7 @@ static void serial_omap_shutdown(struct uart_port *port)
 	if (serial_in(up, UART_LSR) & UART_LSR_DR)
 		(void) serial_in(up, UART_RX);
 
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
+	pm_runtime_put_sync(up->dev);
 	free_irq(up->port.irq, up);
 	dev_pm_clear_wake_irq(up->dev);
 }
@@ -896,7 +856,6 @@ serial_omap_set_termios(struct uart_port *port, struct ktermios *termios,
 	 * Ok, we're now changing the port state. Do it with
 	 * interrupts disabled.
 	 */
-	pm_runtime_get_sync(up->dev);
 	spin_lock_irqsave(&up->port.lock, flags);
 
 	/*
@@ -1096,8 +1055,6 @@ serial_omap_set_termios(struct uart_port *port, struct ktermios *termios,
 	serial_omap_set_mctrl(&up->port, up->port.mctrl);
 
 	spin_unlock_irqrestore(&up->port.lock, flags);
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
 	dev_dbg(up->port.dev, "serial_omap_set_termios+%d\n", up->port.line);
 }
 
@@ -1110,7 +1067,6 @@ serial_omap_pm(struct uart_port *port, unsigned int state,
 
 	dev_dbg(up->port.dev, "serial_omap_pm+%d\n", up->port.line);
 
-	pm_runtime_get_sync(up->dev);
 	serial_out(up, UART_LCR, UART_LCR_CONF_MODE_B);
 	efr = serial_in(up, UART_EFR);
 	serial_out(up, UART_EFR, efr | UART_EFR_ECB);
@@ -1120,9 +1076,6 @@ serial_omap_pm(struct uart_port *port, unsigned int state,
 	serial_out(up, UART_LCR, UART_LCR_CONF_MODE_B);
 	serial_out(up, UART_EFR, efr);
 	serial_out(up, UART_LCR, 0);
-
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
 }
 
 static void serial_omap_release_port(struct uart_port *port)
@@ -1202,11 +1155,8 @@ static void serial_omap_poll_put_char(struct uart_port *port, unsigned char ch)
 {
 	struct uart_omap_port *up = to_uart_omap_port(port);
 
-	pm_runtime_get_sync(up->dev);
 	wait_for_xmitr(up);
 	serial_out(up, UART_TX, ch);
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
 }
 
 static int serial_omap_poll_get_char(struct uart_port *port)
@@ -1214,7 +1164,6 @@ static int serial_omap_poll_get_char(struct uart_port *port)
 	struct uart_omap_port *up = to_uart_omap_port(port);
 	unsigned int status;
 
-	pm_runtime_get_sync(up->dev);
 	status = serial_in(up, UART_LSR);
 	if (!(status & UART_LSR_DR)) {
 		status = NO_POLL_CHAR;
@@ -1224,9 +1173,6 @@ static int serial_omap_poll_get_char(struct uart_port *port)
 	status = serial_in(up, UART_RX);
 
 out:
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
-
 	return status;
 }
 
@@ -1309,8 +1255,6 @@ serial_omap_console_write(struct console *co, const char *s,
 	unsigned int ier;
 	int locked = 1;
 
-	pm_runtime_get_sync(up->dev);
-
 	local_irq_save(flags);
 	if (up->port.sysrq)
 		locked = 0;
@@ -1343,8 +1287,6 @@ serial_omap_console_write(struct console *co, const char *s,
 	if (up->msr_saved_flags)
 		check_modem_status(up);
 
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
 	if (locked)
 		spin_unlock(&up->port.lock);
 	local_irq_restore(flags);
@@ -1403,8 +1345,6 @@ serial_omap_config_rs485(struct uart_port *port, struct serial_rs485 *rs485)
 	unsigned int mode;
 	int val;
 
-	pm_runtime_get_sync(up->dev);
-
 	/* Disable interrupts from this port */
 	mode = up->ier;
 	up->ier = 0;
@@ -1438,9 +1378,6 @@ serial_omap_config_rs485(struct uart_port *port, struct serial_rs485 *rs485)
 		serial_out(up, UART_OMAP_SCR, up->scr);
 	}
 
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
-
 	return 0;
 }
 
@@ -1737,11 +1674,7 @@ static int serial_omap_probe(struct platform_device *pdev)
 		omap_up_info->autosuspend_timeout = -1;
 
 	device_init_wakeup(up->dev, true);
-	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_set_autosuspend_delay(&pdev->dev,
-			omap_up_info->autosuspend_timeout);
 
-	pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	pm_runtime_get_sync(&pdev->dev);
@@ -1755,12 +1688,9 @@ static int serial_omap_probe(struct platform_device *pdev)
 	if (ret != 0)
 		goto err_add_port;
 
-	pm_runtime_mark_last_busy(up->dev);
-	pm_runtime_put_autosuspend(up->dev);
 	return 0;
 
 err_add_port:
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	cpu_latency_qos_remove_request(&up->pm_qos_request);
@@ -1778,7 +1708,6 @@ static int serial_omap_remove(struct platform_device *dev)
 
 	uart_remove_one_port(&serial_omap_reg, &up->port);
 
-	pm_runtime_dont_use_autosuspend(up->dev);
 	pm_runtime_put_sync(up->dev);
 	pm_runtime_disable(up->dev);
 	cpu_latency_qos_remove_request(&up->pm_qos_request);
-- 
2.32.0
