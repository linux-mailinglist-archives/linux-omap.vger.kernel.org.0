Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46C3971780
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2019 13:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732093AbfGWLyI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Jul 2019 07:54:08 -0400
Received: from muru.com ([72.249.23.125]:55696 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728765AbfGWLyI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Jul 2019 07:54:08 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2C1F0808C;
        Tue, 23 Jul 2019 11:54:32 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Peter Hurley <peter@hurleysoftware.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh R <vigneshr@ti.com>, linux-serial@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH] serial: 8250_omap: Fix idling for unloaded serdev drivers
Date:   Tue, 23 Jul 2019 04:54:00 -0700
Message-Id: <20190723115400.46432-1-tony@atomide.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

For many years omap variants have been setting the runtime PM
autosuspend delay to -1 to prevent unsafe policy with lossy first
character on wake-up. The user must specifically enable the timeout
for UARTs if desired.

We must not enable the workaround for serdev devices though. It leads
into UARTs not idling if no serdev devices are loaded and there is no
sysfs entry to configure the UART in that case. And this means that
my PM may not work unless the serdev modules are loaded.

We can detect a serdev device being configured based on a dts child
node, and we can simply skip the workround in that case. And the
serdev driver can idle the port during runtime when suitable if an
out-of-band wake-up GPIO line exists for example.

Let's also add some comments to the workaround while at it.

Cc: Johan Hovold <johan@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/tty/serial/8250/8250_omap.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1234,7 +1234,16 @@ static int omap8250_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, true);
 	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
+
+	/*
+	 * Disable runtime PM until autosuspend delay unless specifically
+	 * enabled by the user via sysfs. This is the historic way to
+	 * prevent an unsafe default policy with lossy characters on wake-up.
+	 * For serdev devices this is not needed, the policy can be managed by
+	 * the serdev driver.
+	 */
+	if (!of_get_available_child_count(pdev->dev.of_node))
+		pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
 
 	pm_runtime_irq_safe(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-- 
2.21.0
