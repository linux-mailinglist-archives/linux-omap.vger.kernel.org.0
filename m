Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3D045ED628
	for <lists+linux-omap@lfdr.de>; Wed, 28 Sep 2022 09:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233608AbiI1Hcw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Sep 2022 03:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233610AbiI1Hck (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Sep 2022 03:32:40 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F3182F276E;
        Wed, 28 Sep 2022 00:32:20 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 742C98231;
        Wed, 28 Sep 2022 07:21:54 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Romain Naour <romain.naour@smile.fr>
Subject: [RFC PATCH 4/5] serial: 8250: omap: Fix imprecise external abort for omap_8250_pm()
Date:   Wed, 28 Sep 2022 10:29:33 +0300
Message-Id: <20220928072934.48359-5-tony@atomide.com>
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

We must idle the uart only after serial8250_unregister_port(). Otherwise
unbinding the uart via sysfs while doing cat on the port produces an
imprecise external abort:

mem_serial_in from omap_8250_pm+0x44/0xf4
omap_8250_pm from uart_hangup+0xe0/0x194
uart_hangup from __tty_hangup.part.0+0x37c/0x3a8
__tty_hangup.part.0 from uart_remove_one_port+0x9c/0x22c
uart_remove_one_port from serial8250_unregister_port+0x60/0xe8
serial8250_unregister_port from omap8250_remove+0x6c/0xd0
omap8250_remove from platform_remove+0x28/0x54

Turns out the driver really needs to have runtime PM functional before
the driver probe calls serial8250_register_8250_port(), and after driver
remove calls serial8250_unregister_port().

On probe, we need to read registers before registering the port in
omap_serial_fill_features_erratas(). We do with custom uart_read()
already.

On remove, after serial8250_unregister_port(), we need to write to the
uart registers to idle the device. Let's add uart_write() for that.

Currently the uart register access depends on port->membase to be
initialized, which won't work after serial8250_unregister_port().
Let's use priv->membase, and use that for runtime PM related functions
to remove the need for port->membase.

We need to check for a valid port for the runtime PM related functions
for the optional wakeup configuration that is not needed for probe
or remove. And we now need to set the drvdata earlier so it's available
for the runtime PM functions.

Note that the checks for missing priv for both omap8250_runtime_suspend()
and omap8250_runtime_resume() are no longer needed and are removed.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serial/8250/8250_omap.c | 70 ++++++++++++++++-------------
 1 file changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -32,6 +32,7 @@
 #include "8250.h"
 
 #define DEFAULT_CLK_SPEED	48000000
+#define OMAP_UART_REGSHIFT	2
 
 #define UART_ERRATA_i202_MDR1_ACCESS	(1 << 0)
 #define OMAP_UART_WER_HAS_TX_WAKEUP	(1 << 1)
@@ -109,6 +110,7 @@
 #define UART_OMAP_RX_LVL		0x19
 
 struct omap8250_priv {
+	void __iomem *membase;
 	int line;
 	u8 habit;
 	u8 mdr1;
@@ -152,9 +154,14 @@ static void omap_8250_rx_dma_flush(struct uart_8250_port *p);
 static inline void omap_8250_rx_dma_flush(struct uart_8250_port *p) { }
 #endif
 
-static u32 uart_read(struct uart_8250_port *up, u32 reg)
+static u32 uart_read(struct omap8250_priv *priv, u32 reg)
 {
-	return readl(up->port.membase + (reg << up->port.regshift));
+	return readl(priv->membase + (reg << OMAP_UART_REGSHIFT));
+}
+
+static void uart_write(struct omap8250_priv *priv, u32 reg, u32 val)
+{
+	writel(val, priv->membase + (reg << OMAP_UART_REGSHIFT));
 }
 
 /*
@@ -550,7 +557,7 @@ static void omap_serial_fill_features_erratas(struct uart_8250_port *up,
 	u32 mvr, scheme;
 	u16 revision, major, minor;
 
-	mvr = uart_read(up, UART_OMAP_MVER);
+	mvr = uart_read(priv, UART_OMAP_MVER);
 
 	/* Check revision register scheme */
 	scheme = mvr >> OMAP_UART_MVR_SCHEME_SHIFT;
@@ -1331,7 +1338,7 @@ static int omap8250_probe(struct platform_device *pdev)
 		UPF_HARD_FLOW;
 	up.port.private_data = priv;
 
-	up.port.regshift = 2;
+	up.port.regshift = OMAP_UART_REGSHIFT;
 	up.port.fifosize = 64;
 	up.tx_loadsz = 64;
 	up.capabilities = UART_CAP_FIFO;
@@ -1393,6 +1400,8 @@ static int omap8250_probe(struct platform_device *pdev)
 			 DEFAULT_CLK_SPEED);
 	}
 
+	priv->membase = membase;
+	priv->line = -ENODEV;
 	priv->latency = PM_QOS_CPU_LATENCY_DEFAULT_VALUE;
 	priv->calc_latency = PM_QOS_CPU_LATENCY_DEFAULT_VALUE;
 	cpu_latency_qos_add_request(&priv->pm_qos_request, priv->latency);
@@ -1400,6 +1409,8 @@ static int omap8250_probe(struct platform_device *pdev)
 
 	spin_lock_init(&priv->rx_dma_lock);
 
+	platform_set_drvdata(pdev, priv);
+
 	device_init_wakeup(&pdev->dev, true);
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -1461,7 +1472,6 @@ static int omap8250_probe(struct platform_device *pdev)
 		goto err;
 	}
 	priv->line = ret;
-	platform_set_drvdata(pdev, priv);
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 	return 0;
@@ -1481,11 +1491,12 @@ static int omap8250_remove(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	serial8250_unregister_port(priv->line);
+	priv->line = -ENODEV;
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
 	flush_work(&priv->qos_work);
 	pm_runtime_disable(&pdev->dev);
-	serial8250_unregister_port(priv->line);
 	cpu_latency_qos_remove_request(&priv->pm_qos_request);
 	device_init_wakeup(&pdev->dev, false);
 	return 0;
@@ -1561,7 +1572,6 @@ static int omap8250_lost_context(struct uart_8250_port *up)
 static int omap8250_soft_reset(struct device *dev)
 {
 	struct omap8250_priv *priv = dev_get_drvdata(dev);
-	struct uart_8250_port *up = serial8250_get_port(priv->line);
 	int timeout = 100;
 	int sysc;
 	int syss;
@@ -1575,20 +1585,20 @@ static int omap8250_soft_reset(struct device *dev)
 	 * needing omap8250_soft_reset() quirk. Do it in two writes as
 	 * recommended in the comment for omap8250_update_scr().
 	 */
-	serial_out(up, UART_OMAP_SCR, OMAP_UART_SCR_DMAMODE_1);
-	serial_out(up, UART_OMAP_SCR,
+	uart_write(priv, UART_OMAP_SCR, OMAP_UART_SCR_DMAMODE_1);
+	uart_write(priv, UART_OMAP_SCR,
 		   OMAP_UART_SCR_DMAMODE_1 | OMAP_UART_SCR_DMAMODE_CTL);
 
-	sysc = serial_in(up, UART_OMAP_SYSC);
+	sysc = uart_read(priv, UART_OMAP_SYSC);
 
 	/* softreset the UART */
 	sysc |= OMAP_UART_SYSC_SOFTRESET;
-	serial_out(up, UART_OMAP_SYSC, sysc);
+	uart_write(priv, UART_OMAP_SYSC, sysc);
 
 	/* By experiments, 1us enough for reset complete on AM335x */
 	do {
 		udelay(1);
-		syss = serial_in(up, UART_OMAP_SYSS);
+		syss = uart_read(priv, UART_OMAP_SYSS);
 	} while (--timeout && !(syss & OMAP_UART_SYSS_RESETDONE));
 
 	if (!timeout) {
@@ -1602,13 +1612,10 @@ static int omap8250_soft_reset(struct device *dev)
 static int omap8250_runtime_suspend(struct device *dev)
 {
 	struct omap8250_priv *priv = dev_get_drvdata(dev);
-	struct uart_8250_port *up;
-
-	/* In case runtime-pm tries this before we are setup */
-	if (!priv)
-		return 0;
+	struct uart_8250_port *up = NULL;
 
-	up = serial8250_get_port(priv->line);
+	if (priv->line >= 0)
+		up = serial8250_get_port(priv->line);
 	/*
 	 * When using 'no_console_suspend', the console UART must not be
 	 * suspended. Since driver suspend is managed by runtime suspend,
@@ -1616,7 +1623,7 @@ static int omap8250_runtime_suspend(struct device *dev)
 	 * active during suspend.
 	 */
 	if (priv->is_suspending && !console_suspend_enabled) {
-		if (uart_console(&up->port))
+		if (up && uart_console(&up->port))
 			return -EBUSY;
 	}
 
@@ -1627,13 +1634,15 @@ static int omap8250_runtime_suspend(struct device *dev)
 		if (ret)
 			return ret;
 
-		/* Restore to UART mode after reset (for wakeup) */
-		omap8250_update_mdr1(up, priv);
-		/* Restore wakeup enable register */
-		serial_out(up, UART_OMAP_WER, priv->wer);
+		if (up) {
+			/* Restore to UART mode after reset (for wakeup) */
+			omap8250_update_mdr1(up, priv);
+			/* Restore wakeup enable register */
+			serial_out(up, UART_OMAP_WER, priv->wer);
+		}
 	}
 
-	if (up->dma && up->dma->rxchan)
+	if (up && up->dma && up->dma->rxchan)
 		omap_8250_rx_dma_flush(up);
 
 	priv->latency = PM_QOS_CPU_LATENCY_DEFAULT_VALUE;
@@ -1645,18 +1654,15 @@ static int omap8250_runtime_suspend(struct device *dev)
 static int omap8250_runtime_resume(struct device *dev)
 {
 	struct omap8250_priv *priv = dev_get_drvdata(dev);
-	struct uart_8250_port *up;
-
-	/* In case runtime-pm tries this before we are setup */
-	if (!priv)
-		return 0;
+	struct uart_8250_port *up = NULL;
 
-	up = serial8250_get_port(priv->line);
+	if (priv->line >= 0)
+		up = serial8250_get_port(priv->line);
 
-	if (omap8250_lost_context(up))
+	if (up && omap8250_lost_context(up))
 		omap8250_restore_regs(up);
 
-	if (up->dma && up->dma->rxchan && !(priv->habit & UART_HAS_EFR2))
+	if (up && up->dma && up->dma->rxchan && !(priv->habit & UART_HAS_EFR2))
 		omap_8250_rx_dma(up);
 
 	priv->latency = priv->calc_latency;
-- 
2.37.3
