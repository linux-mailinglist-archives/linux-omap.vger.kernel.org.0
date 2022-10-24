Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08D56609AA0
	for <lists+linux-omap@lfdr.de>; Mon, 24 Oct 2022 08:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbiJXGgc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Oct 2022 02:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbiJXGgW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Oct 2022 02:36:22 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EF858183AB;
        Sun, 23 Oct 2022 23:36:17 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id EDFEC822A;
        Mon, 24 Oct 2022 06:27:01 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Romain Naour <romain.naour@smile.fr>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH] serial: 8250: omap: Fix missing PM runtime calls for omap8250_set_mctrl()
Date:   Mon, 24 Oct 2022 09:36:13 +0300
Message-Id: <20221024063613.25943-1-tony@atomide.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There are cases where omap8250_set_mctrl() may get called after the
UART has already autoidled causing an asynchronous external abort.

This can happen on ttyport_open():

mem_serial_in from omap8250_set_mctrl+0x38/0xa0
omap8250_set_mctrl from uart_update_mctrl+0x4c/0x58
uart_update_mctrl from uart_dtr_rts+0x60/0xa8
uart_dtr_rts from tty_port_block_til_ready+0xd0/0x2a8
tty_port_block_til_ready from uart_open+0x14/0x1c
uart_open from ttyport_open+0x64/0x148

And on ttyport_close():

omap8250_set_mctrl from uart_update_mctrl+0x3c/0x48
uart_update_mctrl from uart_dtr_rts+0x54/0x9c
uart_dtr_rts from tty_port_shutdown+0x78/0x9c
tty_port_shutdown from tty_port_close+0x3c/0x74
tty_port_close from ttyport_close+0x40/0x58

It can also happen on disassociate_ctty() calling uart_shutdown()
that ends up calling omap8250_set_mctrl().

Let's fix the issue by adding missing PM runtime calls to
omap8250_set_mctrl(). To do this, we need to add __omap8250_set_mctrl()
that can be called from both omap8250_set_mctrl(), and from runtime PM
resume path when restoring the registers.

Fixes: 61929cf0169d ("tty: serial: Add 8250-core based omap driver")
Depends-on: dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
Reported-by: Merlijn Wajer <merlijn@wizzup.org>
Reported-by: Romain Naour <romain.naour@smile.fr>
Reported-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Tested-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serial/8250/8250_omap.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -157,7 +157,11 @@ static u32 uart_read(struct uart_8250_port *up, u32 reg)
 	return readl(up->port.membase + (reg << up->port.regshift));
 }
 
-static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
+/*
+ * Called on runtime PM resume path from omap8250_restore_regs(), and
+ * omap8250_set_mctrl().
+ */
+static void __omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
 {
 	struct uart_8250_port *up = up_to_u8250p(port);
 	struct omap8250_priv *priv = up->port.private_data;
@@ -181,6 +185,20 @@ static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
 	}
 }
 
+static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
+{
+	int err;
+
+	err = pm_runtime_resume_and_get(port->dev);
+	if (err)
+		return;
+
+	__omap8250_set_mctrl(port, mctrl);
+
+	pm_runtime_mark_last_busy(port->dev);
+	pm_runtime_put_autosuspend(port->dev);
+}
+
 /*
  * Work Around for Errata i202 (2430, 3430, 3630, 4430 and 4460)
  * The access to uart register after MDR1 Access
@@ -341,7 +359,7 @@ static void omap8250_restore_regs(struct uart_8250_port *up)
 
 	omap8250_update_mdr1(up, priv);
 
-	up->port.ops->set_mctrl(&up->port, up->port.mctrl);
+	__omap8250_set_mctrl(&up->port, up->port.mctrl);
 
 	if (up->port.rs485.flags & SER_RS485_ENABLED)
 		serial8250_em485_stop_tx(up);
-- 
2.37.3
