Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B181C28E314
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 17:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731756AbgJNPTv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 11:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731815AbgJNPTA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 11:19:00 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1A6C0613D3;
        Wed, 14 Oct 2020 08:19:00 -0700 (PDT)
Message-Id: <20201014145728.208701440@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602688738;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=qs5N10ZLTGbjgyqw4BmEWE+XbOxUwK6mZBaXBjRANBo=;
        b=UMYLaZSOy0GpTwQeHlY9AipRzXKOvrZZGM3yKp63B8UTfOYn2rYdMbfoXjBB4mXq0Ro39S
        1vH35yUsVxfuFUGccdmhMdaXNyRgEYvecU7U+suliQvFPAs0hvf3rQSHBY89hERxb0VHsI
        qLXOLI6t6YymlrMnRAp743PQ+HLacfEONNcyBw2ip1dGxjWtxK1Cc4yjBr2sY57WVNNPZM
        phjr4vSEf1VDEVamzb54vNTPPR7F0gIXWmiOesaCtd7baeowmuXLhsFzm9djdjEDwPcUmx
        gdLWFORMwtGnUTKl3SYq0kwfHzRrjfGUFnZdQp3bzmb5w/2qK73MRqk4We9d3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602688738;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=qs5N10ZLTGbjgyqw4BmEWE+XbOxUwK6mZBaXBjRANBo=;
        b=EIg7PRzWKN6KgYm+QKT/5U+W602LPE6QV0rpvm503A0MvjtEEQaLo3mbotMG0QCa8XlUQI
        +hARBem0/GFOKrCg==
Date:   Wed, 14 Oct 2020 16:52:25 +0200
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
Subject: [patch 10/12] usb: gadget: udc: Remove in_interrupt()/in_irq() from comments
References: <20201014145215.518912759@linutronix.de>
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
 drivers/usb/gadget/udc/dummy_hcd.c |    5 +++--
 2 files changed, 3 insertions(+), 4 deletions(-)

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
@@ -1754,8 +1754,9 @@ static int handle_control_request(struct
 	return ret_val;
 }
 
-/* drive both sides of the transfers; looks like irq handlers to
- * both drivers except the callbacks aren't in_irq().
+/* drive both sides of the transfers; looks like irq handlers to both
+ * drivers except that the callbacks are invoked from soft interrupt
+ * context.
  */
 static void dummy_timer(struct timer_list *t)
 {

