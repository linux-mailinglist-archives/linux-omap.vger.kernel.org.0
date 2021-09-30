Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5DAD41D34E
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 08:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348249AbhI3GbD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Sep 2021 02:31:03 -0400
Received: from muru.com ([72.249.23.125]:38866 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348258AbhI3GbC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Sep 2021 02:31:02 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A164F817C;
        Thu, 30 Sep 2021 06:29:47 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] serial: 8250: Implement wakeup for TX and use it for 8250_omap
Date:   Thu, 30 Sep 2021 09:29:04 +0300
Message-Id: <20210930062906.58937-3-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930062906.58937-1-tony@atomide.com>
References: <20210930062906.58937-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can use the wakeup() and uart_start_pending_tx() calls to wake up an
idle serial port and send out the pending TX buffer on runtime PM resume.
This allows us to remove the depedency to pm_runtime_irq_safe() for
8250_omap driver in the following patches.

We manage the port runtime_suspended flag in the serial port driver as
only the driver knows when the hardware is runtime PM suspended. Note that
The current flag for rpm_tx_active cannot be used as it is TX specific
for 8250_port.

We already have serial8250_start_tx() call serial8250_rpm_get_tx(), and
serial8250_stop_tx() call serial8250_rpm_put_tx() to take care of the
runtime PM usage count for TX. To have the serial port driver call
uart_start_pending_tx() on runtime resume, we must now use just
pm_runtime_get() for serial8250_start_tx() instead of the sync version.

With these changes we must now also flip 8250_omap driver over to call
uart_start_pending_tx(). That's currently the only user of UART_CAP_RPM.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serial/8250/8250_omap.c | 12 ++++++++++
 drivers/tty/serial/8250/8250_port.c | 35 ++++++++++++++++++++++++++++-
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1593,12 +1593,15 @@ static int omap8250_runtime_suspend(struct device *dev)
 {
 	struct omap8250_priv *priv = dev_get_drvdata(dev);
 	struct uart_8250_port *up;
+	struct uart_port *port;
 
 	/* In case runtime-pm tries this before we are setup */
 	if (!priv)
 		return 0;
 
 	up = serial8250_get_port(priv->line);
+	port = &up->port;
+
 	/*
 	 * When using 'no_console_suspend', the console UART must not be
 	 * suspended. Since driver suspend is managed by runtime suspend,
@@ -1610,6 +1613,8 @@ static int omap8250_runtime_suspend(struct device *dev)
 			return -EBUSY;
 	}
 
+	atomic_set(&port->runtime_suspended, 1);
+
 	if (priv->habit & UART_ERRATA_CLOCK_DISABLE) {
 		int ret;
 
@@ -1636,12 +1641,14 @@ static int omap8250_runtime_resume(struct device *dev)
 {
 	struct omap8250_priv *priv = dev_get_drvdata(dev);
 	struct uart_8250_port *up;
+	struct uart_port *port;
 
 	/* In case runtime-pm tries this before we are setup */
 	if (!priv)
 		return 0;
 
 	up = serial8250_get_port(priv->line);
+	port = &up->port;
 
 	if (omap8250_lost_context(up))
 		omap8250_restore_regs(up);
@@ -1651,6 +1658,11 @@ static int omap8250_runtime_resume(struct device *dev)
 
 	priv->latency = priv->calc_latency;
 	schedule_work(&priv->qos_work);
+
+	atomic_set(&port->runtime_suspended, 0);
+
+	uart_start_pending_tx(port);
+
 	return 0;
 }
 #endif
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -724,7 +724,7 @@ void serial8250_rpm_get_tx(struct uart_8250_port *p)
 	rpm_active = xchg(&p->rpm_tx_active, 1);
 	if (rpm_active)
 		return;
-	pm_runtime_get_sync(p->port.dev);
+	pm_runtime_get(p->port.dev);
 }
 EXPORT_SYMBOL_GPL(serial8250_rpm_get_tx);
 
@@ -2507,6 +2507,38 @@ static void serial8250_shutdown(struct uart_port *port)
 		serial8250_do_shutdown(port);
 }
 
+/*
+ * Wakes up the serial port if it has been runtime PM suspended.
+ *
+ * Note that we rely on the serial8250_rpm functions to manage the
+ * runtime PM usage count. We also currently depend on the runtime
+ * PM autosuspend timeout to keep the port awake until start_tx().
+ * Eventually we should just use runtime PM functions and not rely
+ * on the autosuspend timeout.
+ */
+static int serial8250_wakeup(struct uart_port *port)
+{
+	struct uart_8250_port *up = up_to_u8250p(port);
+	struct device *dev = up->port.dev;
+	int err;
+
+	if (!(up->capabilities & UART_CAP_RPM))
+		return 0;
+
+	if (!atomic_read(&port->runtime_suspended)) {
+		pm_runtime_mark_last_busy(dev);
+		return 0;
+	}
+
+	err = pm_request_resume(dev);
+	if (err < 0) {
+		dev_warn(dev, "wakeup failed: %d\n", err);
+		return err;
+	}
+
+	return -EINPROGRESS;
+}
+
 /* Nuvoton NPCM UARTs have a custom divisor calculation */
 static unsigned int npcm_get_divisor(struct uart_8250_port *up,
 		unsigned int baud)
@@ -3235,6 +3267,7 @@ static const struct uart_ops serial8250_pops = {
 	.break_ctl	= serial8250_break_ctl,
 	.startup	= serial8250_startup,
 	.shutdown	= serial8250_shutdown,
+	.wakeup		= serial8250_wakeup,
 	.set_termios	= serial8250_set_termios,
 	.set_ldisc	= serial8250_set_ldisc,
 	.pm		= serial8250_pm,
-- 
2.33.0
