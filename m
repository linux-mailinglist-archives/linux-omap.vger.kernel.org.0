Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9B928E326
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 17:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389194AbgJNPUI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 11:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731806AbgJNPS7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 11:18:59 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B5BC0613D2;
        Wed, 14 Oct 2020 08:18:59 -0700 (PDT)
Message-Id: <20201014145728.085077146@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602688737;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=QjhDGznDGGQ2d/1GfncBm9+kw9614xiY5DXcI3ixa0U=;
        b=QeBgNwTXRRs1Joh/ZbrHaE+7Qz4cjfB7I+PmVlSrREL2mQWcOQRdX3atxCE6TCY5Yz7wGm
        KOuRDHWYO7EI23SeOqDdzlSoCCdo2AWypSqCZG2fDMQtRNdzbK/f4GKsDW0PdK0UmsTD6L
        CWm/oLcd6mKznSXFzuszO991XnerRWhgepPtp4ocZxT6OIz2f5lkcUgdkEvbKEiPQI6i8R
        HXt8yUD88F5cVnfwF5fuQc01Akdf+b8YvFS4r0VAfc0RI74aonfc2eNLowI99XNAUJ7TEK
        Vp8fAhGbpnetb+MiVRTX7VhOJNen4IzGUYPBbefwf+OE1wwfY3JV0Ok+qBrZAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602688737;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=QjhDGznDGGQ2d/1GfncBm9+kw9614xiY5DXcI3ixa0U=;
        b=UEHrFFxhvspH/juGyDPhlmb1qh/gt9fCGr8NgBw6+aKuq1yTpkgrPO+kTFBZddydQTq7uG
        qTpKhZOziSapuODg==
Date:   Wed, 14 Oct 2020 16:52:24 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-omap@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Duncan Sands <duncan.sands@free.fr>
Subject: [patch 09/12] usb: gadget: pxa27x_udc: Replace in_interrupt() usage
 in comments
References: <20201014145215.518912759@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Ahmed S. Darwish <a.darwish@linutronix.de>

The usage of in_interrupt() in drivers is phased out for various reasons.

Documenting calling contexts of functions with 'in_interrupt()' or
'!in_interrupt()' is imprecise: For a function which might sleep the
condition is preemptible task context, which is not what '!in_interrupt()'
describes.

Replace the context docummentation with plain text and make them match
reality.

Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-usb@vger.kernel.org

---
 drivers/usb/gadget/udc/pxa27x_udc.c |   19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -304,7 +304,7 @@ static struct pxa_ep *find_pxa_ep(struct
  * update_pxa_ep_matches - update pxa_ep cached values in all udc_usb_ep
  * @udc: pxa udc
  *
- * Context: in_interrupt()
+ * Context: interrupt handler
  *
  * Updates all pxa_ep fields in udc_usb_ep structures, if this field was
  * previously set up (and is not NULL). The update is necessary is a
@@ -859,7 +859,7 @@ static int write_packet(struct pxa_ep *e
  * @ep: pxa physical endpoint
  * @req: usb request
  *
- * Context: callable when in_interrupt()
+ * Context: interrupt handler
  *
  * Unload as many packets as possible from the fifo we use for usb OUT
  * transfers and put them into the request. Caller should have made sure
@@ -997,7 +997,7 @@ static int read_ep0_fifo(struct pxa_ep *
  * @ep: control endpoint
  * @req: request
  *
- * Context: callable when in_interrupt()
+ * Context: interrupt handler
  *
  * Sends a request (or a part of the request) to the control endpoint (ep0 in).
  * If the request doesn't fit, the remaining part will be sent from irq.
@@ -1036,8 +1036,8 @@ static int write_ep0_fifo(struct pxa_ep
  * @_req: usb request
  * @gfp_flags: flags
  *
- * Context: normally called when !in_interrupt, but callable when in_interrupt()
- * in the special case of ep0 setup :
+ * Context: thread context or from the interrupt handler in the
+ * special case of ep0 setup :
  *   (irq->handle_ep0_ctrl_req->gadget_setup->pxa_ep_queue)
  *
  * Returns 0 if succedeed, error otherwise
@@ -1512,7 +1512,8 @@ static int should_disable_udc(struct pxa
  * pxa_udc_pullup - Offer manual D+ pullup control
  * @_gadget: usb gadget using the control
  * @is_active: 0 if disconnect, else connect D+ pullup resistor
- * Context: !in_interrupt()
+ *
+ * Context: task context, might sleep
  *
  * Returns 0 if OK, -EOPNOTSUPP if udc driver doesn't handle D+ pullup
  */
@@ -1560,7 +1561,7 @@ static int pxa_udc_vbus_session(struct u
  * @_gadget: usb gadget
  * @mA: current drawn
  *
- * Context: !in_interrupt()
+ * Context: task context, might sleep
  *
  * Called after a configuration was chosen by a USB host, to inform how much
  * current can be drawn by the device from VBus line.
@@ -1886,7 +1887,7 @@ static void handle_ep0_ctrl_req(struct p
  * @fifo_irq: 1 if triggered by fifo service type irq
  * @opc_irq: 1 if triggered by output packet complete type irq
  *
- * Context : when in_interrupt() or with ep->lock held
+ * Context : interrupt handler
  *
  * Tries to transfer all pending request data into the endpoint and/or
  * transfer all pending data in the endpoint into usb requests.
@@ -2011,7 +2012,7 @@ static void handle_ep0(struct pxa_udc *u
  * Tries to transfer all pending request data into the endpoint and/or
  * transfer all pending data in the endpoint into usb requests.
  *
- * Is always called when in_interrupt() and with ep->lock released.
+ * Is always called from the interrupt handler. ep->lock must not be held.
  */
 static void handle_ep(struct pxa_ep *ep)
 {

