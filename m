Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26ABC18B1F6
	for <lists+linux-omap@lfdr.de>; Thu, 19 Mar 2020 12:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbgCSLDb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Mar 2020 07:03:31 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:55660 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbgCSLD3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Mar 2020 07:03:29 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02JB3QI0032653;
        Thu, 19 Mar 2020 06:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584615806;
        bh=bKJkju/NsG2s52w8qCFCWHyX4xUE7IcnVIc4MfdyTSo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Tsx/MyeABMyVBYoq1LUXdkdg/CJiAM2A2SCHU1bhlE0EnBZJO/FXuyjxXcktYe55P
         oY3jIcHn4b6jwGoFiMMqO/vU5PWz1LG4cAlxjUFP8hS3NQz0rF8+Rbl9JxXjs/zs1I
         XWTv4zMC4Z6HzkyAA/7EVCzqzhHcpI34QQ+svRS4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JB3Q2o038919;
        Thu, 19 Mar 2020 06:03:26 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 19
 Mar 2020 06:03:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 19 Mar 2020 06:03:25 -0500
Received: from a0132425.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02JB3C7q119908;
        Thu, 19 Mar 2020 06:03:24 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
CC:     Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-serial@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/6] serial: 8250: 8250_omap: Work around errata causing spurious IRQs with DMA
Date:   Thu, 19 Mar 2020 16:33:43 +0530
Message-ID: <20200319110344.21348-6-vigneshr@ti.com>
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

As per Advisory 27 of AM437x Silicon errata document, Spurious UART
interrupts may occur when DMA mode (FCR.DMA_MODE) is enabled. The
Interrupt Controller flags that a UART interrupt has occurred; however,
the associated IT_PENDING bit remains set to 1, indicating that no
interrupt is pending. Acknowledge the spurious interrupts for every
occurrence as workaround.

Errata is applicable to all TI SoCs with this IP.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/tty/serial/8250/8250_omap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 207759dfbff2..92508aaa961c 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1051,7 +1051,7 @@ static int omap_8250_dma_handle_irq(struct uart_port *port)
 	iir = serial_port_in(port, UART_IIR);
 	if (iir & UART_IIR_NO_INT) {
 		serial8250_rpm_put(up);
-		return 0;
+		return IRQ_HANDLED;
 	}
 
 	spin_lock_irqsave(&port->lock, flags);
-- 
2.25.2

