Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3BB93D735D
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 12:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236365AbhG0Kfm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 06:35:42 -0400
Received: from muru.com ([72.249.23.125]:55904 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236104AbhG0Kfm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 06:35:42 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 127B98106;
        Tue, 27 Jul 2021 10:35:57 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 2/2] serial: 8250_omap: Handle optional overrun-throttle-ms property
Date:   Tue, 27 Jul 2021 13:35:33 +0300
Message-Id: <20210727103533.51547-2-tony@atomide.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727103533.51547-1-tony@atomide.com>
References: <20210727103533.51547-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Handle optional overrun-throttle-ms property as done for 8250_fsl in commit
6d7f677a2afa ("serial: 8250: Rate limit serial port rx interrupts during
input overruns"). This can be used to rate limit the UART interrupts on
noisy lines that end up producing messages like the following:

ttyS ttyS2: 4 input overrun(s)

At least on droid4, the multiplexed USB and UART port is left to UART mode
by the bootloader for a debug console, and if a USB charger is connected
on boot, we get noise on the UART until the PMIC related drivers for PHY
and charger are loaded.

With this patch and overrun-throttle-ms = <500> we avoid the extra rx
interrupts.

Cc: Carl Philipp Klemm <philipp@uvos.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serial/8250/8250_omap.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -617,7 +617,7 @@ static irqreturn_t omap8250_irq(int irq, void *dev_id)
 	struct uart_port *port = dev_id;
 	struct omap8250_priv *priv = port->private_data;
 	struct uart_8250_port *up = up_to_u8250p(port);
-	unsigned int iir;
+	unsigned int iir, lsr;
 	int ret;
 
 #ifdef CONFIG_SERIAL_8250_DMA
@@ -628,6 +628,7 @@ static irqreturn_t omap8250_irq(int irq, void *dev_id)
 #endif
 
 	serial8250_rpm_get(up);
+	lsr = serial_port_in(port, UART_LSR);
 	iir = serial_port_in(port, UART_IIR);
 	ret = serial8250_handle_irq(port, iir);
 
@@ -642,6 +643,24 @@ static irqreturn_t omap8250_irq(int irq, void *dev_id)
 		serial_port_in(port, UART_RX);
 	}
 
+	/* Stop processing interrupts on input overrun */
+	if ((lsr & UART_LSR_OE) && up->overrun_backoff_time_ms > 0) {
+		unsigned long delay;
+
+		up->ier = port->serial_in(port, UART_IER);
+		if (up->ier & (UART_IER_RLSI | UART_IER_RDI)) {
+			port->ops->stop_rx(port);
+		} else {
+			/* Keep restarting the timer until
+			 * the input overrun subsides.
+			 */
+			cancel_delayed_work(&up->overrun_backoff);
+		}
+
+		delay = msecs_to_jiffies(up->overrun_backoff_time_ms);
+		schedule_delayed_work(&up->overrun_backoff, delay);
+	}
+
 	serial8250_rpm_put(up);
 
 	return IRQ_RETVAL(ret);
@@ -1353,6 +1372,10 @@ static int omap8250_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (of_property_read_u32(np, "overrun-throttle-ms",
+				 &up.overrun_backoff_time_ms) != 0)
+		up.overrun_backoff_time_ms = 0;
+
 	priv->wakeirq = irq_of_parse_and_map(np, 1);
 
 	pdata = of_device_get_match_data(&pdev->dev);
-- 
2.32.0
