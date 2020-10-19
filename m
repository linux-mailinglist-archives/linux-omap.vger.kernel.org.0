Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F87B292591
	for <lists+linux-omap@lfdr.de>; Mon, 19 Oct 2020 12:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729652AbgJSKT0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Oct 2020 06:19:26 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:58718 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727617AbgJSKSH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Oct 2020 06:18:07 -0400
Message-Id: <20201019101109.753597069@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603102684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=j+vN9MgqREoIPGzBU7B1IaC3gna3kE7EN539Nh0ClUU=;
        b=1y/pZhJxP37rV0rJYULPo5TQOwi6HefvUHI6uFl3VyOzD/l9uItuaHM5eXK388fs3OFUXW
        hSALKKpI69M2O4c+bSYlejPpYC6pICFSdC9DdfpTR/WtEqHVmyWlGZ+GOOBhf/+1M2nn29
        K9Ga9SNsF0iu3YuoJ8ieIZOcFDNbs7crX5QWXNnnL8OkI9EqFafV4MUDr09pVBNkgyaTYq
        lMqXxV5G1EGaMcFJEjIZDV+CwcdjhGM+KvQa1oyHADBQYrm2SkHPH1DvvUHpNr+AqEDlbz
        kkjpapE1LHCy0rvx+yyCA+R3G4M6QCC3WbG4xLKPNBSZX+OXtuvTiN7HxJfL8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603102684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=j+vN9MgqREoIPGzBU7B1IaC3gna3kE7EN539Nh0ClUU=;
        b=EpF5wNFfU2q3Hnqoz5MF6cC6OkRPZavOxiE1H65l6nfC8pvMxSVoO1CNGgrw1X764TZuoK
        DwpXwGIMneJN/sAQ==
Date:   Mon, 19 Oct 2020 12:06:31 +0200
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
Subject: [patch V2 02/13] USB: serial: keyspan_pda: Replace in_interrupt() usage
References: <20201019100629.419020859@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

keyspan_pda_write() uses in_interrupt() to check whether it is safe to
invoke functions which might sleep.

The usage of in_interrupt() in drivers is phased out and Linus clearly
requested that code which changes behaviour depending on context should
either be seperated or the context be conveyed in an argument passed by the
caller, which usually knows the context.

Aside of that it does not cover all contexts which cannot sleep,
e.g. preempt disabled regions which cannot be reliably detected on all
kernel configurations.

With the current printk() implementation console->write() can be invoked
from almost any context. The upcoming rework of the console core will
provide thread context for console drivers which require to sleep.

For now, restrict the room query which can sleep to tty writes which happen
from preemptible task context.

The usability for dmesg output is limited anyway because it's almost
guaranteed to drop the 'LF' which is submitted after the dmesg line because
the device supports only one transfer on flight. Same for any printk()
which is coming in before the previous transfer has been done.

This new restriction does not make it worse than before, but it makes the
condition correct under all circumstances.

Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org

---
 drivers/usb/serial/keyspan_pda.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

--- a/drivers/usb/serial/keyspan_pda.c
+++ b/drivers/usb/serial/keyspan_pda.c
@@ -477,10 +477,12 @@ static int keyspan_pda_write(struct tty_
 
 	count = (count > port->bulk_out_size) ? port->bulk_out_size : count;
 
-	/* Check if we might overrun the Tx buffer.   If so, ask the
-	   device how much room it really has.  This is done only on
-	   scheduler time, since usb_control_msg() sleeps. */
-	if (count > priv->tx_room && !in_interrupt()) {
+	/*
+	 * Check if we might overrun the Tx buffer. If so, ask the device
+	 * how much room it really has. This can only be invoked for tty
+	 * usage because the console write can't sleep.
+	 */
+	if (count > priv->tx_room && tty) {
 		u8 *room;
 
 		room = kmalloc(1, GFP_KERNEL);

