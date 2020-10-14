Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817DD28E312
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 17:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389079AbgJNPTa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 11:19:30 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:59078 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731769AbgJNPS4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 11:18:56 -0400
Message-Id: <20201014145727.716783745@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602688734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=YRLnsMWTgA0N3yLLMuOXyM/kVIqNO9yGhhpRz+ZaXvA=;
        b=BCtp/tx5doemAWLb5iC9OVRcHbnuogVy3f/vuYPOvSqNaW/X5Q8jB1qg3FoN3uM5E/58RA
        pqYA2gsxGvZW6sR+fr6C3qrU+H5mBKaU22Y5pbblwsaGmffC4xM5wbk49Zi8ZAkiW7t6w2
        6pRMG8ROMjqjwy/hpuETtaL7VqBUJxqH+FREbAJJKb2Wp70oyk8wPRUMTVCJEd1Z1whbAa
        U/3Tihha60iCGN5PzVqcPm7slLAIpL7XTA0a4HSdnEuvw/IXNuMBux1s8T0reAwCF8MqeB
        //wT470mBRbV8K7KQVLlyvuhRNOImrVoKifY4ZgzkxPZ8J8LFQopvOlUHwf3Dg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602688734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=YRLnsMWTgA0N3yLLMuOXyM/kVIqNO9yGhhpRz+ZaXvA=;
        b=t45kh1y2+bS05Q50y7DHkmJckkmOipCBS4TBTszpC5/b/9hcirTSa2fPOgTNVkasM+lTSr
        5fXbkEG1bcSBXOAA==
Date:   Wed, 14 Oct 2020 16:52:21 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: [patch 06/12] usb: host: isp1362: Replace in_interrupt() usage
References: <20201014145215.518912759@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

isp1362_show_regs() is a debugging-only function, with no call sites. It
prints the cached value of the HCuPINTENB register if in_interupt() is
true, otherwise it reads the actual register content.

The usage of in_interrupt() in drivers is phased out and Linus clearly
requested that code which changes behaviour depending on context should
either be separated or the context be conveyed in an argument passed by the
caller, which usually knows the context.

Make the conditional based on a function argument.

Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org

---
 drivers/usb/host/isp1362.h |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/drivers/usb/host/isp1362.h
+++ b/drivers/usb/host/isp1362.h
@@ -793,7 +793,8 @@ static void isp1362_write_fifo(struct is
 			ISP1362_REG_NO(ISP1362_REG_##r), isp1362_read_reg16(d, r));	\
 }
 
-static void __attribute__((__unused__)) isp1362_show_regs(struct isp1362_hcd *isp1362_hcd)
+static void __attribute__((__unused__))
+isp1362_show_regs(struct isp1362_hcd *isp1362_hc, bool cached_inten)
 {
 	isp1362_show_reg(isp1362_hcd, HCREVISION);
 	isp1362_show_reg(isp1362_hcd, HCCONTROL);
@@ -815,7 +816,7 @@ static void __attribute__((__unused__))
 	isp1362_show_reg(isp1362_hcd, HCXFERCTR);
 	isp1362_show_reg(isp1362_hcd, HCuPINT);
 
-	if (in_interrupt())
+	if (cached_inten)
 		DBG(0, "%-12s[%02x]:     %04x\n", "HCuPINTENB",
 			 ISP1362_REG_NO(ISP1362_REG_HCuPINTENB), isp1362_hcd->irqenb);
 	else

