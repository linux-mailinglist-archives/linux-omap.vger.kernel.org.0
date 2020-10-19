Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F458292583
	for <lists+linux-omap@lfdr.de>; Mon, 19 Oct 2020 12:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgJSKTG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Oct 2020 06:19:06 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:58718 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729147AbgJSKSK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Oct 2020 06:18:10 -0400
Message-Id: <20201019101110.148631116@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603102688;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=Pe8CFmf0/CnRVhPeaGPKSnnUTmz8AJUU7taQJPbdbP8=;
        b=Er+PWHFh2XhU2mRAPNNosWvUF3EK+wzX+2LAJgVyV0ju89RHA84spDu+zn4M3crzNSUFEU
        NKSH3TS7s03F9XbXnoYUD/jzDdTB2RZaLV8d9AehueGw6+Z+xaP6gDSn2Dm9jVSH92erSQ
        Um2zLnLMv0mN1w1rVYxoaQgst7iuKIsnfvaFiw5RNpYee14xKDwzVnro/0jviGYKBrN1+a
        CJzMt9mpfmLpOb87dsgdAZdcGzyxa7dgC/4erhH81shqCKhFF0R/FLqLZYvFxNsHW+oCm0
        550nGFrM83486LxByGE5+rIpmVA2E6jCZ9IOHFbTmVY0glelxuzDtjHleI3CoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603102688;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=Pe8CFmf0/CnRVhPeaGPKSnnUTmz8AJUU7taQJPbdbP8=;
        b=FJr22QDOzYwi+B9T9ZCc7LH0Grzvr7ZKTdDRMuC3HFO/93A24i5o/PmAPDhV1HSrHurI0s
        lMM4DJ8Q9Df5n6CQ==
Date:   Mon, 19 Oct 2020 12:06:34 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Johan Hovold <johan@kernel.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-omap@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: [patch V2 05/13] usb: xhci: Remove in_interrupt() checks
References: <20201019100629.419020859@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Ahmed S. Darwish <a.darwish@linutronix.de>

The usage of in_interrupt() in drivers is phased out for various reasons.

xhci_set_hc_event_deq() has an !in_interrupt() check which is pointless
because the function is only invoked from xhci_mem_init() which is clearly
task context as it does GFP_KERNEL allocations. Remove it.

xhci_urb_enqueue() prints a debug message if an URB is submitted after the
underlying hardware was suspended. But that warning is only issued when
in_interrupt() is true, which makes no sense. Simply return -ESHUTDOWN and
be done with it.

Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
---
 drivers/usb/host/xhci-mem.c |    2 +-
 drivers/usb/host/xhci.c     |    6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2110,7 +2110,7 @@ static void xhci_set_hc_event_deq(struct
 
 	deq = xhci_trb_virt_to_dma(xhci->event_ring->deq_seg,
 			xhci->event_ring->dequeue);
-	if (deq == 0 && !in_interrupt())
+	if (!deq)
 		xhci_warn(xhci, "WARN something wrong with SW event ring "
 				"dequeue ptr.\n");
 	/* Update HC event ring dequeue pointer */
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1473,11 +1473,9 @@ static int xhci_urb_enqueue(struct usb_h
 	ep_index = xhci_get_endpoint_index(&urb->ep->desc);
 	ep_state = &xhci->devs[slot_id]->eps[ep_index].ep_state;
 
-	if (!HCD_HW_ACCESSIBLE(hcd)) {
-		if (!in_interrupt())
-			xhci_dbg(xhci, "urb submitted during PCI suspend\n");
+	if (!HCD_HW_ACCESSIBLE(hcd))
 		return -ESHUTDOWN;
-	}
+
 	if (xhci->devs[slot_id]->flags & VDEV_PORT_ERROR) {
 		xhci_dbg(xhci, "Can't queue urb, port error, link inactive\n");
 		return -ENODEV;

