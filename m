Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5358B42EFAF
	for <lists+linux-omap@lfdr.de>; Fri, 15 Oct 2021 13:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238512AbhJOL2s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Oct 2021 07:28:48 -0400
Received: from muru.com ([72.249.23.125]:44978 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233242AbhJOL2p (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Oct 2021 07:28:45 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D98CB8203;
        Fri, 15 Oct 2021 11:27:09 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] serial: 8250_omap: Require a valid wakeirq for deeper idle states
Date:   Fri, 15 Oct 2021 14:26:25 +0300
Message-Id: <20211015112626.35359-4-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015112626.35359-1-tony@atomide.com>
References: <20211015112626.35359-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

For deeper idle states the 8250 device gets powered off. The wakeup is
handled with a separate wakeirq controller monitoring the RX pin.

Let's check for a valid wakeirq before enabling deeper idle states.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serial/8250/8250_omap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -133,6 +133,7 @@ struct omap8250_priv {
 	spinlock_t rx_dma_lock;
 	bool rx_dma_broken;
 	bool throttled;
+	unsigned int allow_rpm:1;
 };
 
 struct omap8250_dma_params {
@@ -676,6 +677,7 @@ static int omap_8250_startup(struct uart_port *port)
 		ret = dev_pm_set_dedicated_wake_irq(port->dev, priv->wakeirq);
 		if (ret)
 			return ret;
+		priv->allow_rpm = 1;
 	}
 
 	pm_runtime_get_sync(port->dev);
@@ -722,6 +724,10 @@ static int omap_8250_startup(struct uart_port *port)
 	if (up->dma && !(priv->habit & UART_HAS_EFR2))
 		up->dma->rx_dma(up);
 
+	/* Block runtime PM if no wakeirq, paired with shutdown */
+	if (!priv->allow_rpm)
+		pm_runtime_get(port->dev);
+
 	pm_runtime_mark_last_busy(port->dev);
 	pm_runtime_put_autosuspend(port->dev);
 	return 0;
@@ -760,6 +766,10 @@ static void omap_8250_shutdown(struct uart_port *port)
 		serial_out(up, UART_LCR, up->lcr & ~UART_LCR_SBC);
 	serial_out(up, UART_FCR, UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT);
 
+	/* Clear possible PM runtime block to pair with startup */
+	if (!priv->allow_rpm)
+		pm_runtime_put(port->dev);
+
 	pm_runtime_mark_last_busy(port->dev);
 	pm_runtime_put_autosuspend(port->dev);
 	free_irq(port->irq, port);
-- 
2.33.0
