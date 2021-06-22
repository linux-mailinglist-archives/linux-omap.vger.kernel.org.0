Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4113B07FC
	for <lists+linux-omap@lfdr.de>; Tue, 22 Jun 2021 16:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbhFVO77 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Jun 2021 10:59:59 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:34164 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbhFVO77 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Jun 2021 10:59:59 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15MEvYkH122897;
        Tue, 22 Jun 2021 09:57:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1624373854;
        bh=3RpZBa2MozVuA4vNzmdoop9q6l8luMuPvhHJNcpIVOY=;
        h=From:To:CC:Subject:Date;
        b=M2niN1GF2zQIWTBZxXyjNUUb6ARGuV0yritwGhbX9sr+JuDBUYQiUOdmr5DGjFkIC
         HAmn+Ew/3yG630nZZrl6/W8qgQDQ3TInLeshjpYt8iDK238y5YXXI7azKeevVT7Efs
         NL1pn9KjXu7wW+bOMMRf/n88uBBnkHLKFRM4i3f8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15MEvYDH022236
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Jun 2021 09:57:34 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 22
 Jun 2021 09:57:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 22 Jun 2021 09:57:34 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15MEvVAd036396;
        Tue, 22 Jun 2021 09:57:31 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
CC:     Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        <linux-serial@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH v2] serial: 8250: 8250_omap: Fix possible interrupt storm on K3 SoCs
Date:   Tue, 22 Jun 2021 20:27:04 +0530
Message-ID: <20210622145704.11168-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On K3 family of SoCs (which includes AM654 SoC), it is observed that RX
TIMEOUT is signalled after RX FIFO has been drained, in which case a
dummy read of RX FIFO is required to clear RX TIMEOUT condition.
Otherwise, this would lead to an interrupt storm.

Fix this by introducing UART_RX_TIMEOUT_QUIRK flag and doing a dummy
read in IRQ handler when RX TIMEOUT is reported with no data in RX FIFO.

Fixes: be70874498f3 ("serial: 8250_omap: Add support for AM654 UART controller")
Reported-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
v2:
Restrict workaround to K3 family of devices only (ti,am654-uart) where
issue was reported.

v1: https://lore.kernel.org/r/20210511151955.28071-1-vigneshr@ti.com

 drivers/tty/serial/8250/8250_omap.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index c06631ced414..79418d4beb48 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -43,6 +43,7 @@
 #define UART_ERRATA_CLOCK_DISABLE	(1 << 3)
 #define	UART_HAS_EFR2			BIT(4)
 #define UART_HAS_RHR_IT_DIS		BIT(5)
+#define UART_RX_TIMEOUT_QUIRK		BIT(6)
 
 #define OMAP_UART_FCR_RX_TRIG		6
 #define OMAP_UART_FCR_TX_TRIG		4
@@ -104,6 +105,9 @@
 #define UART_OMAP_EFR2			0x23
 #define UART_OMAP_EFR2_TIMEOUT_BEHAVE	BIT(6)
 
+/* RX FIFO occupancy indicator */
+#define UART_OMAP_RX_LVL		0x64
+
 struct omap8250_priv {
 	int line;
 	u8 habit;
@@ -611,6 +615,7 @@ static int omap_8250_dma_handle_irq(struct uart_port *port);
 static irqreturn_t omap8250_irq(int irq, void *dev_id)
 {
 	struct uart_port *port = dev_id;
+	struct omap8250_priv *priv = port->private_data;
 	struct uart_8250_port *up = up_to_u8250p(port);
 	unsigned int iir;
 	int ret;
@@ -625,6 +630,18 @@ static irqreturn_t omap8250_irq(int irq, void *dev_id)
 	serial8250_rpm_get(up);
 	iir = serial_port_in(port, UART_IIR);
 	ret = serial8250_handle_irq(port, iir);
+
+	/*
+	 * On K3 SoCs, it is observed that RX TIMEOUT is signalled after
+	 * FIFO has been drained, in which case a dummy read of RX FIFO
+	 * is required to clear RX TIMEOUT condition.
+	 */
+	if (priv->habit & UART_RX_TIMEOUT_QUIRK &&
+	    (iir & UART_IIR_RX_TIMEOUT) == UART_IIR_RX_TIMEOUT &&
+	    serial_port_in(port, UART_OMAP_RX_LVL) == 0) {
+		serial_port_in(port, UART_RX);
+	}
+
 	serial8250_rpm_put(up);
 
 	return IRQ_RETVAL(ret);
@@ -1218,7 +1235,8 @@ static struct omap8250_dma_params am33xx_dma = {
 
 static struct omap8250_platdata am654_platdata = {
 	.dma_params	= &am654_dma,
-	.habit		= UART_HAS_EFR2 | UART_HAS_RHR_IT_DIS,
+	.habit		= UART_HAS_EFR2 | UART_HAS_RHR_IT_DIS |
+			  UART_RX_TIMEOUT_QUIRK,
 };
 
 static struct omap8250_platdata am33xx_platdata = {
-- 
2.32.0

