Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E88D29255E
	for <lists+linux-omap@lfdr.de>; Mon, 19 Oct 2020 12:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729340AbgJSKSU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Oct 2020 06:18:20 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:58742 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729182AbgJSKSL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Oct 2020 06:18:11 -0400
Message-Id: <20201019101110.240285929@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603102689;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=WngfxKCbiTKE9erlSaLbB4MmoQbLDSkUgvyXSrV+/VI=;
        b=Ay5afY3nWqWdPkkzJsp41vh5O+dD2nd/0fG7RPbP5DUH92jHLqP6Kx+3E+AHYac364F9Mo
        A2bpcoj3jwogNqL3dtlf2Szc3PgPAu6ewzrYCOYGLMss1il8aDMVLdwRhDvVduzPmijOUx
        bYyr58hIlLaMiCjqfoG7PA5U4avgF10+lL9DkkA4pBxuqxXEV++cJrBhuREFpO56yA46XI
        qaOv8WbByE5HGmV28mYtJpVk4afPWMXE2eXAgiOo7srHiNb4bX+BPVXnlTTKFTEJUEynxY
        NEMYP+tMNTl6fRPX9Y3Stq50xgCoi3m8zzsXrAgZ8gDIX2ivJINECVsfzcWlQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603102689;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=WngfxKCbiTKE9erlSaLbB4MmoQbLDSkUgvyXSrV+/VI=;
        b=Bwy/LQ9S8g8N8l1iMRJCmuGn0XWiNGgBFATYWG6atDTGprcVSeTwnDFRmVJvB4kb9scCZ5
        j72sHwPUxaQxxvAw==
Date:   Mon, 19 Oct 2020 12:06:35 +0200
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
Subject: [patch V2 06/13] usb: host: isp1362: Replace in_interrupt() usage
References: <20201019100629.419020859@linutronix.de>
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
V2: Fix silly typo
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
+isp1362_show_regs(struct isp1362_hcd *isp1362_hcd, bool cached_inten)
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

