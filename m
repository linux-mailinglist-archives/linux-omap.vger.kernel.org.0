Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E3229256D
	for <lists+linux-omap@lfdr.de>; Mon, 19 Oct 2020 12:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729218AbgJSKSV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Oct 2020 06:18:21 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:58876 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729285AbgJSKST (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Oct 2020 06:18:19 -0400
Message-Id: <20201019101110.944939915@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603102697;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=CglHTuol1LH6Rq9Arw6I3q0kZXSSc/D44FpLqZfI5WA=;
        b=4lpNzGZte+JbLXJ83VGLllmO8p7ZgJPUbn2pEj3AWBlV6Kr6kMkordF9yNYiD+J0YfMNXF
        WrlseHROLQU+l/lbqigi2qTk9VAJ5y929pArYCx8cDTQAbouSa8PoPonAE8JjMfp1PBvEa
        chWrp8n1QbIhLVdUVFfL5aSRuMaJZJS8TTFH9PSpLmIHnfKarImStpf087juZuVGvW9vpy
        d8B+uITbEjquNSdDef0bc5zON2rSBuX0oqlrKnMDzU69dISQhvYlJeHwTtqk2u140cDa/H
        3fgsgfkIGUmNcjOiSHyfjChDmTDZqoKfiozdWtZ8cgBRXPi6/SvEdu54WiqWbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603102697;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=CglHTuol1LH6Rq9Arw6I3q0kZXSSc/D44FpLqZfI5WA=;
        b=L1BAx4OybAp6bDVli4bT4V41G4OGiBnmrb1bmCjWXg2vrs6Qc4FM9XNkkoVzYxoojOoBkj
        1uEPNEpJBDmssyCw==
Date:   Mon, 19 Oct 2020 12:06:42 +0200
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
Subject: [patch V2 13/13] usb: atm: Replace in_interrupt() usage in comment
References: <20201019100629.419020859@linutronix.de>
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

