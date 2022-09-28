Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71B3C5ED656
	for <lists+linux-omap@lfdr.de>; Wed, 28 Sep 2022 09:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbiI1Hhx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Sep 2022 03:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233697AbiI1HhV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Sep 2022 03:37:21 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C701C106F74;
        Wed, 28 Sep 2022 00:36:22 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 52DDC826D;
        Wed, 28 Sep 2022 07:21:58 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Romain Naour <romain.naour@smile.fr>
Subject: [RFC PATCH 5/5] serial: 8250: omap: Fix life cycle issues for interrupt handlers
Date:   Wed, 28 Sep 2022 10:29:34 +0300
Message-Id: <20220928072934.48359-6-tony@atomide.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928072934.48359-1-tony@atomide.com>
References: <20220928072934.48359-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We have the struct uart_8250_port instance recycled on device rebind while
the struct omap8250_priv instance is not. For the console uart,
__tty_hangup() does not call tty->ops->hangup() as cons_filp stays open,
and uart shutdown won't get called. This means we have a stale
priv->wakeirq handler around after unbind, and port->irq is not freed on
unbind.

There's no need to claim the interrupts on startup. We can fix this and
simplify the driver a bit by claiming the interrupts in probe, and clearing
them on remove. For the device interrupt, we can use devm_request_irq().

To do this, we change omap8250_irq() to use struct omap8250_priv data
directly so we don't have to wait for the assigned port from
serial8250_register_8250_port().

We must also drop IRQF_SHARED to set IRQ_NOAUTOEN to avoid spurious
interrupts until the port has been registered. There's no need for
IRQF_SHARED for 8250_omap, the serial port interrupt lines are dedicated
lines.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serial/8250/8250_omap.c | 44 ++++++++++++++---------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -625,9 +625,9 @@ static int omap_8250_dma_handle_irq(struct uart_port *port);
 
 static irqreturn_t omap8250_irq(int irq, void *dev_id)
 {
-	struct uart_port *port = dev_id;
-	struct omap8250_priv *priv = port->private_data;
-	struct uart_8250_port *up = up_to_u8250p(port);
+	struct omap8250_priv *priv = dev_id;
+	struct uart_8250_port *up = serial8250_get_port(priv->line);
+	struct uart_port *port = &up->port;
 	unsigned int iir, lsr;
 	int ret;
 
@@ -683,12 +683,6 @@ static int omap_8250_startup(struct uart_port *port)
 	struct omap8250_priv *priv = port->private_data;
 	int ret;
 
-	if (priv->wakeirq) {
-		ret = dev_pm_set_dedicated_wake_irq(port->dev, priv->wakeirq);
-		if (ret)
-			return ret;
-	}
-
 	pm_runtime_get_sync(port->dev);
 
 	up->mcr = 0;
@@ -712,11 +706,6 @@ static int omap_8250_startup(struct uart_port *port)
 		}
 	}
 
-	ret = request_irq(port->irq, omap8250_irq, IRQF_SHARED,
-			  dev_name(port->dev), port);
-	if (ret < 0)
-		goto err;
-
 	up->ier = UART_IER_RLSI | UART_IER_RDI;
 	serial_out(up, UART_IER, up->ier);
 
@@ -736,11 +725,6 @@ static int omap_8250_startup(struct uart_port *port)
 	pm_runtime_mark_last_busy(port->dev);
 	pm_runtime_put_autosuspend(port->dev);
 	return 0;
-err:
-	pm_runtime_mark_last_busy(port->dev);
-	pm_runtime_put_autosuspend(port->dev);
-	dev_pm_clear_wake_irq(port->dev);
-	return ret;
 }
 
 static void omap_8250_shutdown(struct uart_port *port)
@@ -773,8 +757,6 @@ static void omap_8250_shutdown(struct uart_port *port)
 
 	pm_runtime_mark_last_busy(port->dev);
 	pm_runtime_put_autosuspend(port->dev);
-	free_irq(port->irq, port);
-	dev_pm_clear_wake_irq(port->dev);
 }
 
 static void omap_8250_throttle(struct uart_port *port)
@@ -1387,8 +1369,6 @@ static int omap8250_probe(struct platform_device *pdev)
 				 &up.overrun_backoff_time_ms) != 0)
 		up.overrun_backoff_time_ms = 0;
 
-	priv->wakeirq = irq_of_parse_and_map(np, 1);
-
 	pdata = of_device_get_match_data(&pdev->dev);
 	if (pdata)
 		priv->habit |= pdata->habit;
@@ -1466,16 +1446,33 @@ static int omap8250_probe(struct platform_device *pdev)
 		}
 	}
 #endif
+
+	irq_set_status_flags(irq, IRQ_NOAUTOEN);
+	ret = devm_request_irq(&pdev->dev, irq, omap8250_irq, 0,
+			       dev_name(&pdev->dev), priv);
+	if (ret < 0)
+		return ret;
+
+	priv->wakeirq = irq_of_parse_and_map(np, 1);
+	if (priv->wakeirq) {
+		ret = dev_pm_set_dedicated_wake_irq(&pdev->dev, priv->wakeirq);
+		if (ret)
+			return ret;
+	}
+
 	ret = serial8250_register_8250_port(&up);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "unable to register 8250 port\n");
 		goto err;
 	}
 	priv->line = ret;
+	platform_set_drvdata(pdev, priv);
+	enable_irq(irq);
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 	return 0;
 err:
+	dev_pm_clear_wake_irq(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
@@ -1493,6 +1490,7 @@ static int omap8250_remove(struct platform_device *pdev)
 
 	serial8250_unregister_port(priv->line);
 	priv->line = -ENODEV;
+	dev_pm_clear_wake_irq(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
 	flush_work(&priv->qos_work);
-- 
2.37.3
