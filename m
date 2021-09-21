Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13A664131A4
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 12:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbhIUKf2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 06:35:28 -0400
Received: from muru.com ([72.249.23.125]:35532 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231927AbhIUKf2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 06:35:28 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0B4F380A8;
        Tue, 21 Sep 2021 10:34:25 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] serial: core: Add new prep_tx for power management
Date:   Tue, 21 Sep 2021 13:33:43 +0300
Message-Id: <20210921103346.64824-4-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921103346.64824-1-tony@atomide.com>
References: <20210921103346.64824-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If the serial driver implements PM runtime with autosuspend, the port may
be powered off for TX. To wake up the port, let's add new prep_tx() call
for serial drivers to implement as needed. We call it from serial
write_room() and write() functions. If the serial port is not enabled,
we just return 0.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 Documentation/driver-api/serial/driver.rst |  9 +++++++++
 drivers/tty/serial/serial_core.c           | 23 ++++++++++++++++++++++
 include/linux/serial_core.h                |  1 +
 3 files changed, 33 insertions(+)

diff --git a/Documentation/driver-api/serial/driver.rst b/Documentation/driver-api/serial/driver.rst
--- a/Documentation/driver-api/serial/driver.rst
+++ b/Documentation/driver-api/serial/driver.rst
@@ -136,6 +136,15 @@ hardware.
 
 	This call must not sleep
 
+  prep_tx(port)
+	Prepare port for transmitting characters.
+
+	Locking: port->lock taken.
+
+	Interrupts: locally disabled.
+
+	This call must not sleep
+
   start_tx(port)
 	Start transmitting characters.
 
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -118,6 +118,17 @@ static void uart_stop(struct tty_struct *tty)
 	uart_port_unlock(port, flags);
 }
 
+static int __uart_prep_tx(struct tty_struct *tty)
+{
+	struct uart_state *state = tty->driver_data;
+	struct uart_port *port = state->uart_port;
+
+	if (port && !uart_tx_stopped(port) && port->ops->prep_tx)
+		return port->ops->prep_tx(port);
+
+	return 0;
+}
+
 static void __uart_start(struct tty_struct *tty)
 {
 	struct uart_state *state = tty->driver_data;
@@ -574,6 +585,12 @@ static int uart_write(struct tty_struct *tty,
 		return 0;
 	}
 
+	ret = __uart_prep_tx(tty);
+	if (ret < 0) {
+		uart_port_unlock(port, flags);
+		return 0;
+	}
+
 	while (port) {
 		c = CIRC_SPACE_TO_END(circ->head, circ->tail, UART_XMIT_SIZE);
 		if (count < c)
@@ -600,6 +617,12 @@ static unsigned int uart_write_room(struct tty_struct *tty)
 	unsigned int ret;
 
 	port = uart_port_lock(state, flags);
+	ret = __uart_prep_tx(tty);
+	if (ret < 0) {
+		uart_port_unlock(port, flags);
+		return 0;
+	}
+
 	ret = uart_circ_chars_free(&state->xmit);
 	uart_port_unlock(port, flags);
 	return ret;
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -40,6 +40,7 @@ struct uart_ops {
 	void		(*set_mctrl)(struct uart_port *, unsigned int mctrl);
 	unsigned int	(*get_mctrl)(struct uart_port *);
 	void		(*stop_tx)(struct uart_port *);
+	int		(*prep_tx)(struct uart_port *);
 	void		(*start_tx)(struct uart_port *);
 	void		(*throttle)(struct uart_port *);
 	void		(*unthrottle)(struct uart_port *);
-- 
2.33.0
