Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B81529257C
	for <lists+linux-omap@lfdr.de>; Mon, 19 Oct 2020 12:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgJSKS7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Oct 2020 06:18:59 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:58926 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729074AbgJSKSR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Oct 2020 06:18:17 -0400
Message-Id: <20201019101110.744172050@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603102695;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=eU49tVESfPvybwx3L3Wh92XZvOJJ4zNGI0TkIeEUK1M=;
        b=JKowC+xz19F02CLEO24JMjrb4u0kEcj+L8t99YbWx+w5UvTUx/WsjiX23lHjEfawj8L1Ai
        MebzdHR9mnykV00sB05zLHuFW9/4veKDWkEkx9kzZPaz81vDGOIp1dnbjmBKpzlDo41RK0
        rQdw6sMqR+l6kv313t8o5e9e2W0tlqh29gMfTPAV5RD0WA3MqD1E52hA7tRObbfCZaZpE8
        2ZgdvQBM34e+Fvm3kh6wMfPTvxKazGLl/OF84W+pbbvB5RGCNTfqUorwbmPTrODOLv6ovg
        U6DgzsG6ChAVATvkmPznkzqWwgVurjR4EtKfILDpR9kGCbSd4sv/8wgcljhzSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603102695;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=eU49tVESfPvybwx3L3Wh92XZvOJJ4zNGI0TkIeEUK1M=;
        b=u21yGgK+RD0O07+cg6Izujgy+wcxtgbrdd1zA0ikisQUXWnsPqdAxfppXCH+m5pMKOnvD+
        vbuZ3HsJP3oH0yCA==
Date:   Mon, 19 Oct 2020 12:06:40 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-omap@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Duncan Sands <duncan.sands@free.fr>
Subject: [patch V2 11/13] usb: gadget: udc: Remove in_interrupt()/in_irq()
 from comments
References: <20201019100629.419020859@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Ahmed S. Darwish <a.darwish@linutronix.de>

The usage of in_irq()/in_interrupt() in drivers is phased out for various
reasons.

The context description for usb_gadget_giveback_request() is misleading as
in_interupt() means: hard interrupt or soft interrupt or bottom half
disabled regions. But it's also invoked from task context when endpoints
are torn down. Remove it as it's more confusing than helpful.

Replace also the in_irq() comment with plain text.

Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org

---
 drivers/usb/gadget/udc/core.c      |    2 --
 drivers/usb/gadget/udc/dummy_hcd.c |    6 ++++--
 2 files changed, 4 insertions(+), 4 deletions(-)

--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -894,8 +894,6 @@ EXPORT_SYMBOL_GPL(usb_gadget_unmap_reque
  * @ep: the endpoint to be used with with the request
  * @req: the request being given back
  *
- * Context: in_interrupt()
- *
  * This is called by device controller drivers in order to return the
  * completed request back to the gadget layer.
  */
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1754,8 +1754,10 @@ static int handle_control_request(struct
 	return ret_val;
 }
 
-/* drive both sides of the transfers; looks like irq handlers to
- * both drivers except the callbacks aren't in_irq().
+/*
+ * Drive both sides of the transfers; looks like irq handlers to both
+ * drivers except that the callbacks are invoked from soft interrupt
+ * context.
  */
 static void dummy_timer(struct timer_list *t)
 {

