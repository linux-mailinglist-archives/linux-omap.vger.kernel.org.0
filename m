Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA30292557
	for <lists+linux-omap@lfdr.de>; Mon, 19 Oct 2020 12:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729186AbgJSKSK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Oct 2020 06:18:10 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:58756 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729074AbgJSKSJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Oct 2020 06:18:09 -0400
Message-Id: <20201019101110.019266389@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603102686;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=MXv/cC90NGLd0gAyhvd77yXM/kdP4dV075keyekfnPQ=;
        b=iwIXTF3enn1fKti5Wyc96yx4QPfU+KLydyWLL0v9XCmX93au8n+PY7KafwO6IdMWfyujqV
        uODhQfVFgnk8XBnleRHsnd93BKSgI1gKCozA4aXlXg8L+KUVbI9K1ugQ7bE7J5vtFv+kSC
        uhkRoqqLG+BL/mfNGhNdQsiqYPGaF+qubBeaXj5TEZX96E7p5w18kzSbxLDWkNEKfHxk79
        RlDbTflSduUm49CPm+yZnOaAY0Ne5qKTL18u2daxeMIA+rX1k/wm1kt1WWDuUNZxO5G/j/
        OSvklQqcZ0OP4b9om2XFCeqkBPn8IAAe25qYyINN0Mpm0xrQh4Me68mqQogqMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603102686;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=MXv/cC90NGLd0gAyhvd77yXM/kdP4dV075keyekfnPQ=;
        b=2C+WiHFJBXgPiWdy7C84FEdn66zJ0B0CnSRlJ3KIL25PgSmN+pU25mZ09jWn1ED1ug6tnA
        GQ4nIpFut1OqP1BQ==
Date:   Mon, 19 Oct 2020 12:06:33 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-omap@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: [patch V2 04/13] USB: serial: digi_acceleport: Remove in_interrupt() usage
References: <20201019100629.419020859@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Ahmed S. Darwish <a.darwish@linutronix.de>

The usage of in_interrupt() in drivers is phased out and Linus clearly
requested that code which changes behaviour depending on context should
either be separated or the context be conveyed in an argument passed by the
caller, which usually knows the context.

The debug printk() in digi_write() prints in_interrupt() as context
information. TTY writes happen always in preemptible task context and
console writes can happen from almost any context, so in_interrupt() is not
really helpful.

Aside of that issuing a printk() from a console->write() callback is not a
really brilliant idea for obvious reasons.

Remove the in_interrupt() printout and make the printk() depend on tty.

Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org

---
 drivers/usb/serial/digi_acceleport.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -911,9 +911,10 @@ static int digi_write(struct tty_struct
 	unsigned char *data = port->write_urb->transfer_buffer;
 	unsigned long flags = 0;
 
-	dev_dbg(&port->dev,
-		"digi_write: TOP: port=%d, count=%d, in_interrupt=%ld\n",
-		priv->dp_port_num, count, in_interrupt());
+	if (tty) {
+		dev_dbg(&port->dev, "digi_write: TOP: port=%d, count=%d\n",
+			priv->dp_port_num, count);
+	}
 
 	/* copy user data (which can sleep) before getting spin lock */
 	count = min(count, port->bulk_out_size-2);

