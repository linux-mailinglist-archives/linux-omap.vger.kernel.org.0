Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A8845001F
	for <lists+linux-omap@lfdr.de>; Mon, 15 Nov 2021 09:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbhKOIpa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Nov 2021 03:45:30 -0500
Received: from muru.com ([72.249.23.125]:56406 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235130AbhKOIpS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 15 Nov 2021 03:45:18 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D6236813A;
        Mon, 15 Nov 2021 08:42:58 +0000 (UTC)
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
Subject: [PATCH 3/7] serial: 8250_port: properly handle runtime PM in IRQ
Date:   Mon, 15 Nov 2021 10:41:59 +0200
Message-Id: <20211115084203.56478-4-tony@atomide.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115084203.56478-1-tony@atomide.com>
References: <20211115084203.56478-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

We can't and basically don't need to call runtime PM in IRQ handler. If
IRQ is ours, device must be powered on. Otherwise check if the device is
powered off and return immediately.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
[tony@atomide.com: use port->runtime_suspended]
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serial/8250/8250_port.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -1939,17 +1939,19 @@ EXPORT_SYMBOL_GPL(serial8250_handle_irq);
 
 static int serial8250_default_handle_irq(struct uart_port *port)
 {
-	struct uart_8250_port *up = up_to_u8250p(port);
 	unsigned int iir;
-	int ret;
 
-	serial8250_rpm_get(up);
+	/*
+	 * The IRQ might be shared with other peripherals so we must first
+	 * check that are we RPM suspended or not. If we are we assume that
+	 * the IRQ was not for us (we shouldn't be RPM suspended when the
+	 * interrupt is enabled).
+	 */
+	if (port->runtime_suspended)
+		return 0;
 
 	iir = serial_port_in(port, UART_IIR);
-	ret = serial8250_handle_irq(port, iir);
-
-	serial8250_rpm_put(up);
-	return ret;
+	return serial8250_handle_irq(port, iir);
 }
 
 /*
-- 
2.33.1
