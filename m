Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D96B1EC231
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jun 2020 20:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbgFBSzV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 Jun 2020 14:55:21 -0400
Received: from muru.com ([72.249.23.125]:56784 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgFBSzU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 2 Jun 2020 14:55:20 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5EB0680C5;
        Tue,  2 Jun 2020 18:56:09 +0000 (UTC)
Date:   Tue, 2 Jun 2020 11:55:15 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH] serial: 8250_port: Fix imprecise external abort for
 mctrl if inactive
Message-ID: <20200602185515.GF37466@atomide.com>
References: <20200602001813.30459-1-tony@atomide.com>
 <20200602080811.GI19480@localhost>
 <CAHp75Vfi5nDgwT10J_EKYn90vGuiL1hyfre+t_w_OFREFY-Tqg@mail.gmail.com>
 <20200602133659.GD37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602133659.GD37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200602 13:38]:
> * Andy Shevchenko <andy.shevchenko@gmail.com> [200602 08:33]:
> Now that we can detach and reattach the kernel serial console,
> there should not be any need for pm_runtime_irq_safe() anymore :)

Below is a hastily tested RFC patch to remove pm_runtime_irq_safe()
for 8250_omap.c that seems to work for idle use case :)

> And the UART wake-up from deeper idle states can only happen with
> help of external hardware like GPIO controller or pinctrl controller.

It does not yet include the check for configured wakeirq though.
And omap-serial.c needs a similar patch or maybe we can attempt
to just drop it this time as 8250_omap.c should be used nowadays.
Or just drop PM from omap-serial.c if it can't be dropped.

Andy, is the change below the only remaining blocker now for
your serial PM runtime changes?

Regards,

Tony

8< -------------------------------
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -123,6 +123,7 @@ struct omap8250_priv {
 	spinlock_t rx_dma_lock;
 	bool rx_dma_broken;
 	bool throttled;
+	unsigned int active:1;
 };
 
 struct omap8250_dma_params {
@@ -598,9 +599,13 @@ static irqreturn_t omap8250_irq(int irq, void *dev_id)
 {
 	struct uart_port *port = dev_id;
 	struct uart_8250_port *up = up_to_u8250p(port);
+	struct omap8250_priv *priv = up->port.private_data;
 	unsigned int iir;
 	int ret;
 
+	if (!priv->active)
+		return IRQ_NONE;
+
 #ifdef CONFIG_SERIAL_8250_DMA
 	if (up->dma) {
 		ret = omap_8250_dma_handle_irq(port);
@@ -608,10 +613,10 @@ static irqreturn_t omap8250_irq(int irq, void *dev_id)
 	}
 #endif
 
-	serial8250_rpm_get(up);
 	iir = serial_port_in(port, UART_IIR);
 	ret = serial8250_handle_irq(port, iir);
-	serial8250_rpm_put(up);
+
+	pm_runtime_mark_last_busy(port->dev);
 
 	return IRQ_RETVAL(ret);
 }
@@ -1110,13 +1115,9 @@ static int omap_8250_dma_handle_irq(struct uart_port *port)
 	unsigned long flags;
 	u8 iir;
 
-	serial8250_rpm_get(up);
-
 	iir = serial_port_in(port, UART_IIR);
-	if (iir & UART_IIR_NO_INT) {
-		serial8250_rpm_put(up);
+	if (iir & UART_IIR_NO_INT)
 		return IRQ_HANDLED;
-	}
 
 	spin_lock_irqsave(&port->lock, flags);
 
@@ -1144,7 +1145,7 @@ static int omap_8250_dma_handle_irq(struct uart_port *port)
 	}
 
 	uart_unlock_and_check_sysrq(port, flags);
-	serial8250_rpm_put(up);
+
 	return 1;
 }
 
@@ -1329,11 +1330,10 @@ static int omap8250_probe(struct platform_device *pdev)
 	if (!of_get_available_child_count(pdev->dev.of_node))
 		pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
 
-	pm_runtime_irq_safe(&pdev->dev);
-
 	pm_runtime_get_sync(&pdev->dev);
 
 	omap_serial_fill_features_erratas(&up, priv);
+	priv->active = pm_runtime_enabled(&pdev->dev);
 	up.port.handle_irq = omap8250_no_handle_irq;
 	priv->rx_trigger = RX_TRIGGER;
 	priv->tx_trigger = TX_TRIGGER;
@@ -1517,6 +1517,8 @@ static int omap8250_runtime_suspend(struct device *dev)
 	if (!priv)
 		return 0;
 
+	priv->active = 0;
+
 	up = serial8250_get_port(priv->line);
 	/*
 	 * When using 'no_console_suspend', the console UART must not be
@@ -1575,6 +1577,8 @@ static int omap8250_runtime_resume(struct device *dev)
 
 	pinctrl_pm_select_default_state(dev);
 
+	priv->active = 1;
+
 	return 0;
 }
 #endif
-- 
2.26.2
