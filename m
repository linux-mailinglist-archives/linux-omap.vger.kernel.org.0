Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B39484131AA
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 12:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhIUKfg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 06:35:36 -0400
Received: from muru.com ([72.249.23.125]:35542 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232000AbhIUKfa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 06:35:30 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 118A38127;
        Tue, 21 Sep 2021 10:34:27 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] serial: 8250: Implement prep_tx for power management
Date:   Tue, 21 Sep 2021 13:33:44 +0300
Message-Id: <20210921103346.64824-5-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921103346.64824-1-tony@atomide.com>
References: <20210921103346.64824-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We can use the prep_tx() call to wake up an idle serial port. This allows
ust to remove the depedency to pm_runtime_irq_safe() for 8250_omap driver
in the following patches.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serial/8250/8250_port.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -1650,6 +1650,29 @@ static enum hrtimer_restart serial8250_em485_handle_start_tx(struct hrtimer *t)
 	return HRTIMER_NORESTART;
 }
 
+static int serial8250_prep_tx(struct uart_port *port)
+{
+	struct uart_8250_port *up = up_to_u8250p(port);
+	struct device *dev = up->port.dev;
+	int err;
+
+	if (!(up->capabilities & UART_CAP_RPM))
+		return 0;
+
+	if (!pm_runtime_suspended(dev)) {
+		pm_runtime_mark_last_busy(dev);
+		return 0;
+	}
+
+	err = pm_request_resume(dev);
+	if (err < 0) {
+		dev_warn(dev, "prep_tx wakeup failed: %d\n", err);
+		return err;
+	}
+
+	return -EINPROGRESS;
+}
+
 static void serial8250_start_tx(struct uart_port *port)
 {
 	struct uart_8250_port *up = up_to_u8250p(port);
@@ -3227,6 +3250,7 @@ static const struct uart_ops serial8250_pops = {
 	.set_mctrl	= serial8250_set_mctrl,
 	.get_mctrl	= serial8250_get_mctrl,
 	.stop_tx	= serial8250_stop_tx,
+	.prep_tx	= serial8250_prep_tx,
 	.start_tx	= serial8250_start_tx,
 	.throttle	= serial8250_throttle,
 	.unthrottle	= serial8250_unthrottle,
-- 
2.33.0
