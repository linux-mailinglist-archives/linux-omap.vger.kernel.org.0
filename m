Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 699CC28E30C
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 17:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389010AbgJNPTa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 11:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731820AbgJNPTD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 11:19:03 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCBCC0613D4;
        Wed, 14 Oct 2020 08:19:02 -0700 (PDT)
Message-Id: <20201014145728.409787526@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602688741;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=CglHTuol1LH6Rq9Arw6I3q0kZXSSc/D44FpLqZfI5WA=;
        b=bjMveFM/F/C/lk/mECJJ0S00n9OD6hXu0Q1tMIe9PE3A/VtjlB6lQCcGyccj6VzHIn38Vm
        6RT8dOoVyShjVszTAyh2ApxHpx3pnF25R9YQTszfKSgS2s8t3FbLOYkcW9TdzdBGhTtDk2
        2wmP6yFbDqtOXr9sATWU64YuWCj8DdG6VLprgt1Yz+o41DqsWqyq1/XLl/qQqGQN+Xq5FI
        Nzl7QXRrvL/JODW0hdxCwFXOonaAP3jdjQACCtUGgzsVMwMZWSonr+7bK5d7fNPqO4D0MU
        2Q9ekR+oeL27Nu6Caaq26FFfIdyNi0wqGL/s1fRMkDmYMQeeKrB7VONJqQM/zw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602688741;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=CglHTuol1LH6Rq9Arw6I3q0kZXSSc/D44FpLqZfI5WA=;
        b=63oGqbLWxH0YKZmR1hR2khr5gJeYtd48W6BFdMaOQnxOOCDSW6iqewPaR90jPDCvghaqaX
        zPEqCpaIroWOWQDg==
Date:   Wed, 14 Oct 2020 16:52:27 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Duncan Sands <duncan.sands@free.fr>,
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
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: [patch 12/12] usb: atm: Replace in_interrupt() usage in comment
References: <20201014145215.518912759@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

in_interrupt() is a pretty vague context description as it means: hard
interrupt, soft interrupt or bottom half disabled regions.

Replace the vague comment with a proper reasoning why spin_lock_irqsave()
needs to be used.

Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Duncan Sands <duncan.sands@free.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org

---
 drivers/usb/atm/usbatm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/usb/atm/usbatm.c
+++ b/drivers/usb/atm/usbatm.c
@@ -249,7 +249,7 @@ static void usbatm_complete(struct urb *
 	/* vdbg("%s: urb 0x%p, status %d, actual_length %d",
 	     __func__, urb, status, urb->actual_length); */
 
-	/* usually in_interrupt(), but not always */
+	/* Can be invoked from task context, protect against interrupts */
 	spin_lock_irqsave(&channel->lock, flags);
 
 	/* must add to the back when receiving; doesn't matter when sending */

