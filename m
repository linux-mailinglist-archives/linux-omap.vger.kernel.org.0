Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B744A28E2FF
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 17:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388854AbgJNPTF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 11:19:05 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:59116 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731760AbgJNPSz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 11:18:55 -0400
Message-Id: <20201014145727.607191004@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602688732;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=Pe8CFmf0/CnRVhPeaGPKSnnUTmz8AJUU7taQJPbdbP8=;
        b=B6rdNxczcOWWrcVbmjviVpJXMXqZ84hT2H0rQpIRoceWWrTcdA9FTUOaS7Fgw2L8fOdBdy
        HbzzKYWq9V9msbsFIlokMHqCeUwUqtRMpTRWHwAcLqZZXvSqIgbUkJXvocA/0LR+CjU/B6
        IRLn5B25hI6G7a81TURqxOWEIykDwHsXr0VEmlT//sz5ZprWnWexzaGB6ko6NdL96oRFVQ
        +oExsQl/zMOtFkuZm2sj/8zelpvpkI/FS84sVW0h9kPI1zbDpua5qg7kw53q+PoEM8qAVk
        QDWwnsdTTlNv0RMzHiN3Qp5v0N41mRmSf5MdVz/xFd9xU2BGBPWsfDn0Ax2+rA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602688732;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=Pe8CFmf0/CnRVhPeaGPKSnnUTmz8AJUU7taQJPbdbP8=;
        b=3nHhxyYvsMB0O08Xcs0F+wU3UaP3H2JXQDPF1e8+qyTK47yO7ho0Y1DtTJSapPBVeQTtaW
        +ujbHldthT8mgxDQ==
Date:   Wed, 14 Oct 2020 16:52:20 +0200
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
Subject: [patch 05/12] usb: xhci: Remove in_interrupt() checks
References: <20201014145215.518912759@linutronix.de>
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

