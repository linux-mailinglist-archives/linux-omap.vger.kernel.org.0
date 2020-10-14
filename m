Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB9428E303
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 17:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731772AbgJNPSy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 11:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731756AbgJNPSx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 11:18:53 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA7FC061755;
        Wed, 14 Oct 2020 08:18:53 -0700 (PDT)
Message-Id: <20201014145727.480325406@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602688731;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=MXv/cC90NGLd0gAyhvd77yXM/kdP4dV075keyekfnPQ=;
        b=gF49ZkiqVA6Zkos7qV1tE5MFxGK11ffDoTX8KLBy8SNOMaDDNL7x1wO6IHJ/BNtFHcv5hT
        0/nZJjx4SO39GW/Av+RNKSxFj0Z+OyQZCvENPKlDVZ6SuvPvYkZXPUsMOwJnK2/gfqJpij
        qLCP2LF8pxRywYu2LrvQq2m8s2yZLCSuHR3/Ip1GNhoHFXiye3d0YNaxy7lizSusQjT2uq
        6LiyrKiKsnaid2NtGbCoqc6Vhi+BWqhCq0Eme5taaIjVekbxV4iilOadB0ENaIDyyWvQgq
        CKhL3GyL7KfZox86+OS14WawQaTkrspL7RbAG9T58uwOffIM0eJiZm6eV/xT9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602688731;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=MXv/cC90NGLd0gAyhvd77yXM/kdP4dV075keyekfnPQ=;
        b=fNqQVvXmjajIS9K+Wb89Ddzsv1Zt+aXUZdLwSLQWFT29BfJ4Y16PSZJISiz9hVbWbvSoSo
        v2uFFdzbh4ZpC7Bw==
Date:   Wed, 14 Oct 2020 16:52:19 +0200
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
Subject: [patch 04/12] USB: serial: digi_acceleport: Remove in_interrupt() usage
References: <20201014145215.518912759@linutronix.de>
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

