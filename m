Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDD3818B1FC
	for <lists+linux-omap@lfdr.de>; Thu, 19 Mar 2020 12:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbgCSLD2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Mar 2020 07:03:28 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:60042 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbgCSLD1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Mar 2020 07:03:27 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JB3ObO005877;
        Thu, 19 Mar 2020 06:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584615804;
        bh=b4HQbSAKIxavIvTrWCGy0Wh5vqEJ+E6PgLO21+zd2KY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=cueUFCyo5rVy2dzDodsqIZ8qarRGJ0UaweV4IzDhMVqqO0Dqp6HCx0D/5SHOpbGKt
         BM3suUSarCkccSllVrKzjQzGOt+cxecWzHObuof76SjnPMSg0xgT7l54hNlGTw0oDG
         OPv53zk9GTwBkqwIATiUPc7OwYwyXOtk4sqeMlQU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02JB3Naq011068
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 19 Mar 2020 06:03:23 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 06:03:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 06:03:23 -0500
Received: from a0132425.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JB3C7p119908;
        Thu, 19 Mar 2020 06:03:21 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
CC:     Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-serial@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/6] serial: 8250: 8250_omap: Extend driver data to pass FIFO trigger info
Date:   Thu, 19 Mar 2020 16:33:42 +0530
Message-ID: <20200319110344.21348-5-vigneshr@ti.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200319110344.21348-1-vigneshr@ti.com>
References: <20200319110344.21348-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Although same 8250 compliant UART IP is reused across different SoC,
their integration wrt DMA varies greatly across SoCs. Therefore,
different SoC may need to use different FIFO trigger level for DMA
event and DMA configuration parameters. Provide a way to pass this
information via driver data. This is required to support UART DMA on
AM654/J721e SoCs.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/tty/serial/8250/8250_omap.c | 82 +++++++++++++++++++++--------
 1 file changed, 61 insertions(+), 21 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index aef0535b62a4..207759dfbff2 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -105,6 +105,8 @@ struct omap8250_priv {
 	u8 delayed_restore;
 	u16 quot;
 
+	u8 tx_trigger;
+	u8 rx_trigger;
 	bool is_suspending;
 	int wakeirq;
 	int wakeups_enabled;
@@ -118,6 +120,17 @@ struct omap8250_priv {
 	bool throttled;
 };
 
+struct omap8250_dma_params {
+	u32 rx_size;
+	u8 rx_trigger;
+	u8 tx_trigger;
+};
+
+struct omap8250_platdata {
+	struct omap8250_dma_params *dma_params;
+	u8 habit;
+};
+
 #ifdef CONFIG_SERIAL_8250_DMA
 static void omap_8250_rx_dma_flush(struct uart_8250_port *p);
 #else
@@ -295,8 +308,8 @@ static void omap8250_restore_regs(struct uart_8250_port *up)
 	serial_out(up, UART_TI752_TCR, OMAP_UART_TCR_RESTORE(16) |
 			OMAP_UART_TCR_HALT(52));
 	serial_out(up, UART_TI752_TLR,
-		   TRIGGER_TLR_MASK(TX_TRIGGER) << UART_TI752_TLR_TX |
-		   TRIGGER_TLR_MASK(RX_TRIGGER) << UART_TI752_TLR_RX);
+		   TRIGGER_TLR_MASK(priv->tx_trigger) << UART_TI752_TLR_TX |
+		   TRIGGER_TLR_MASK(priv->rx_trigger) << UART_TI752_TLR_RX);
 
 	serial_out(up, UART_LCR, 0);
 
@@ -435,8 +448,8 @@ static void omap_8250_set_termios(struct uart_port *port,
 	 * This is because threshold and trigger values are the same.
 	 */
 	up->fcr = UART_FCR_ENABLE_FIFO;
-	up->fcr |= TRIGGER_FCR_MASK(TX_TRIGGER) << OMAP_UART_FCR_TX_TRIG;
-	up->fcr |= TRIGGER_FCR_MASK(RX_TRIGGER) << OMAP_UART_FCR_RX_TRIG;
+	up->fcr |= TRIGGER_FCR_MASK(priv->tx_trigger) << OMAP_UART_FCR_TX_TRIG;
+	up->fcr |= TRIGGER_FCR_MASK(priv->rx_trigger) << OMAP_UART_FCR_RX_TRIG;
 
 	priv->scr = OMAP_UART_SCR_RX_TRIG_GRANU1_MASK | OMAP_UART_SCR_TX_EMPTY |
 		OMAP_UART_SCR_TX_TRIG_GRANU1_MASK;
@@ -1092,18 +1105,30 @@ static int omap8250_no_handle_irq(struct uart_port *port)
 	return 0;
 }
 
-static const u8 omap4_habit = UART_ERRATA_CLOCK_DISABLE;
-static const u8 am3352_habit = OMAP_DMA_TX_KICK | UART_ERRATA_CLOCK_DISABLE;
-static const u8 dra742_habit = UART_ERRATA_CLOCK_DISABLE;
+static struct omap8250_dma_params am33xx_dma = {
+	.rx_size = RX_TRIGGER,
+	.rx_trigger = RX_TRIGGER,
+	.tx_trigger = TX_TRIGGER,
+};
+
+static struct omap8250_platdata am33xx_platdata = {
+	.dma_params	= &am33xx_dma,
+	.habit		= OMAP_DMA_TX_KICK | UART_ERRATA_CLOCK_DISABLE,
+};
+
+static struct omap8250_platdata omap4_platdata = {
+	.dma_params	= &am33xx_dma,
+	.habit		= UART_ERRATA_CLOCK_DISABLE,
+};
 
 static const struct of_device_id omap8250_dt_ids[] = {
 	{ .compatible = "ti,am654-uart" },
 	{ .compatible = "ti,omap2-uart" },
 	{ .compatible = "ti,omap3-uart" },
-	{ .compatible = "ti,omap4-uart", .data = &omap4_habit, },
-	{ .compatible = "ti,am3352-uart", .data = &am3352_habit, },
-	{ .compatible = "ti,am4372-uart", .data = &am3352_habit, },
-	{ .compatible = "ti,dra742-uart", .data = &dra742_habit, },
+	{ .compatible = "ti,omap4-uart", .data = &omap4_platdata, },
+	{ .compatible = "ti,am3352-uart", .data = &am33xx_platdata, },
+	{ .compatible = "ti,am4372-uart", .data = &am33xx_platdata, },
+	{ .compatible = "ti,dra742-uart", .data = &omap4_platdata, },
 	{},
 };
 MODULE_DEVICE_TABLE(of, omap8250_dt_ids);
@@ -1114,10 +1139,10 @@ static int omap8250_probe(struct platform_device *pdev)
 	struct resource *irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	struct device_node *np = pdev->dev.of_node;
 	struct omap8250_priv *priv;
+	const struct omap8250_platdata *pdata;
 	struct uart_8250_port up;
 	int ret;
 	void __iomem *membase;
-	const struct of_device_id *id;
 
 	if (!regs || !irq) {
 		dev_err(&pdev->dev, "missing registers or irq\n");
@@ -1198,9 +1223,9 @@ static int omap8250_probe(struct platform_device *pdev)
 
 	priv->wakeirq = irq_of_parse_and_map(np, 1);
 
-	id = of_match_device(of_match_ptr(omap8250_dt_ids), &pdev->dev);
-	if (id && id->data)
-		priv->habit |= *(u8 *)id->data;
+	pdata = of_device_get_match_data(&pdev->dev);
+	if (pdata)
+		priv->habit |= pdata->habit;
 
 	if (!up.port.uartclk) {
 		up.port.uartclk = DEFAULT_CLK_SPEED;
@@ -1236,6 +1261,8 @@ static int omap8250_probe(struct platform_device *pdev)
 
 	omap_serial_fill_features_erratas(&up, priv);
 	up.port.handle_irq = omap8250_no_handle_irq;
+	priv->rx_trigger = RX_TRIGGER;
+	priv->tx_trigger = TX_TRIGGER;
 #ifdef CONFIG_SERIAL_8250_DMA
 	/*
 	 * Oh DMA support. If there are no DMA properties in the DT then
@@ -1247,13 +1274,26 @@ static int omap8250_probe(struct platform_device *pdev)
 	 */
 	ret = of_property_count_strings(np, "dma-names");
 	if (ret == 2) {
+		struct omap8250_dma_params *dma_params = NULL;
+
 		up.dma = &priv->omap8250_dma;
-		priv->omap8250_dma.fn = the_no_dma_filter_fn;
-		priv->omap8250_dma.tx_dma = omap_8250_tx_dma;
-		priv->omap8250_dma.rx_dma = omap_8250_rx_dma;
-		priv->omap8250_dma.rx_size = RX_TRIGGER;
-		priv->omap8250_dma.rxconf.src_maxburst = RX_TRIGGER;
-		priv->omap8250_dma.txconf.dst_maxburst = TX_TRIGGER;
+		up.dma->fn = the_no_dma_filter_fn;
+		up.dma->tx_dma = omap_8250_tx_dma;
+		up.dma->rx_dma = omap_8250_rx_dma;
+		if (pdata)
+			dma_params = pdata->dma_params;
+
+		if (dma_params) {
+			up.dma->rx_size = dma_params->rx_size;
+			up.dma->rxconf.src_maxburst = dma_params->rx_trigger;
+			up.dma->txconf.dst_maxburst = dma_params->tx_trigger;
+			priv->rx_trigger = dma_params->rx_trigger;
+			priv->tx_trigger = dma_params->tx_trigger;
+		} else {
+			up.dma->rx_size = RX_TRIGGER;
+			up.dma->rxconf.src_maxburst = RX_TRIGGER;
+			up.dma->txconf.dst_maxburst = TX_TRIGGER;
+		}
 	}
 #endif
 	ret = serial8250_register_8250_port(&up);
-- 
2.25.2

