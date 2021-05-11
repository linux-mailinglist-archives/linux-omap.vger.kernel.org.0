Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89E937AA83
	for <lists+linux-omap@lfdr.de>; Tue, 11 May 2021 17:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbhEKPVP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 May 2021 11:21:15 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:60942 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbhEKPVP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 May 2021 11:21:15 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14BFK1ID104690;
        Tue, 11 May 2021 10:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1620746401;
        bh=Rz6bXU6XS7j+KrR9SbLWdgtPtvzU7RGsksFsLi91ok0=;
        h=From:To:CC:Subject:Date;
        b=aGhMb5FWFWTaB+lqKOUzIpi70y0df5odSGMm3gxUmY3H2wuyqV/q4tL7aK+EqChA7
         5M+moxI73OJKm6pSoEHhZITbIZb71BloZfdcqOlCOb9r2oPNLzrmQKNvH2c+PWX+JA
         EXP4z8UQQ1YpF9LzMdyk6dhoe39inqprq4uTr1HE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14BFK1uJ062601
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 11 May 2021 10:20:01 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 11
 May 2021 10:20:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 11 May 2021 10:20:01 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14BFJwuG121251;
        Tue, 11 May 2021 10:19:59 -0500
From:   Vignesh Raghavendra <vigneshr@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
CC:     Vignesh Raghavendra <vigneshr@ti.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        <linux-serial@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] serial: 8250: 8250_omap: Fix possible interrupt storm
Date:   Tue, 11 May 2021 20:49:55 +0530
Message-ID: <20210511151955.28071-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

It is possible that RX TIMEOUT is signalled after RX FIFO has been
drained, in which case a dummy read of RX FIFO is required to clear RX
TIMEOUT condition. Otherwise, RX TIMEOUT condition is not cleared
leading to an interrupt storm

Cc: stable@vger.kernel.org
Reported-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/tty/serial/8250/8250_omap.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 8ac11eaeca51..c71bd766fa56 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -104,6 +104,9 @@
 #define UART_OMAP_EFR2			0x23
 #define UART_OMAP_EFR2_TIMEOUT_BEHAVE	BIT(6)
 
+/* RX FIFO occupancy indicator */
+#define UART_OMAP_RX_LVL		0x64
+
 struct omap8250_priv {
 	int line;
 	u8 habit;
@@ -625,6 +628,15 @@ static irqreturn_t omap8250_irq(int irq, void *dev_id)
 	serial8250_rpm_get(up);
 	iir = serial_port_in(port, UART_IIR);
 	ret = serial8250_handle_irq(port, iir);
+	/*
+	 * It is possible that RX TIMEOUT is signalled after FIFO
+	 * has been drained, in which case a dummy read of RX FIFO is
+	 * required to clear RX TIMEOUT condition.
+	 */
+	if ((iir & UART_IIR_RX_TIMEOUT) == UART_IIR_RX_TIMEOUT) {
+		if (serial_port_in(port, UART_OMAP_RX_LVL) == 0)
+			serial_port_in(port, UART_RX);
+	}
 	serial8250_rpm_put(up);
 
 	return IRQ_RETVAL(ret);
-- 
2.31.1

