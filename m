Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6107E1EB2A5
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jun 2020 02:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgFBASX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 1 Jun 2020 20:18:23 -0400
Received: from muru.com ([72.249.23.125]:56648 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725841AbgFBASW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 1 Jun 2020 20:18:22 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 29A9F804F;
        Tue,  2 Jun 2020 00:19:12 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Peter Hurley <peter@hurleysoftware.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] serial: 8250_port: Fix imprecise external abort for mctrl if inactive
Date:   Mon,  1 Jun 2020 17:18:13 -0700
Message-Id: <20200602001813.30459-1-tony@atomide.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can get an imprecise external abort on uart_shutdown() at
serial8250_do_set_mctrl() if the UART is autoidled.

We don't want to add PM runtime calls to serial8250_do_set_mctrl()
beyond checking the usage count as it gets called from interrupts
disabled and spinlock held from uart_update_mctrl().

We can just bail out early from serial8250_do_set_mctrl() if the UART
is inactive. We have uart_shutdown() call uart_port_dtr_rts() with
value of 0 just to disable DTR and RTS.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serial/8250/8250_port.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2001,11 +2001,20 @@ static unsigned int serial8250_get_mctrl(struct uart_port *port)
 	return serial8250_do_get_mctrl(port);
 }
 
+/*
+ * Called from uart_update_mctrl() with spinlock held, so we don't want
+ * add PM runtime calls here beyond checking the usage count. If the
+ * UART is not active, we can just bail out early.
+ */
 void serial8250_do_set_mctrl(struct uart_port *port, unsigned int mctrl)
 {
 	struct uart_8250_port *up = up_to_u8250p(port);
 	unsigned char mcr;
 
+	if (up->capabilities & UART_CAP_RPM &&
+	    !pm_runtime_get_if_in_use(up->port.dev))
+		return;
+
 	if (port->rs485.flags & SER_RS485_ENABLED) {
 		if (serial8250_in_MCR(up) & UART_MCR_RTS)
 			mctrl |= TIOCM_RTS;
@@ -2018,6 +2027,9 @@ void serial8250_do_set_mctrl(struct uart_port *port, unsigned int mctrl)
 	mcr = (mcr & up->mcr_mask) | up->mcr_force | up->mcr;
 
 	serial8250_out_MCR(up, mcr);
+
+	if (up->capabilities & UART_CAP_RPM)
+		pm_runtime_put(up->port.dev);
 }
 EXPORT_SYMBOL_GPL(serial8250_do_set_mctrl);
 
-- 
2.26.2
