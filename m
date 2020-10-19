Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F388129257E
	for <lists+linux-omap@lfdr.de>; Mon, 19 Oct 2020 12:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbgJSKSQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Oct 2020 06:18:16 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:58876 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729218AbgJSKSP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Oct 2020 06:18:15 -0400
Message-Id: <20201019101110.530302737@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603102693;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=nWQ+SrVLGuCyqRY5y8h3ERmOFe6RATVvmET6IvFN3Gk=;
        b=rbjY26BxpHFf5pzKY+W8poVw7dZ2luD/gEIhZFETiCcscy2I5JgMVc1SJxswsS2Vc6ncDT
        BacorRP7QKkKVsyP90S71atCfoj98+ppfff1konuUtSK9Y+IJHJ+SMp2tuXfrosTNlgz84
        1c6TFj8Cu00la077WbK8RqAaweudQrh7S/DsRRPpcYx38lXmyjgWk7d+tZkjhUKpEL7Sdm
        ud+vGbc3kXXBnWxWtr1o/2QnFYt44e4osSsF/ydBO1wh1x1NMK1WgYPLr14F5jcRRIL8kU
        MznHHoiKyBEUSIziBvdVa+1hTF2hwu523STZiNWRWFWMOTF8XYnc77DhqreQHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603102693;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=nWQ+SrVLGuCyqRY5y8h3ERmOFe6RATVvmET6IvFN3Gk=;
        b=4vh7Lo9BkFB9fjwdOV4BwIUadEs9cadEn44DOG7XZjGP0v7KkIrxqJrqOpicdvBYbJct+V
        Ef9gTvWk6oETzYDA==
Date:   Mon, 19 Oct 2020 12:06:38 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
Subject: [patch V2 09/13] USB: host: ehci-pmcmsp: Cleanup usb_hcd_msp_remove()
References: <20201019100629.419020859@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

usb_hcd_msp_remove() has a pdev argument which isn't used and the function
is used only within this file.

Remove pdev and make usb_hcd_msp_remove() static.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: Split out from comments patch
---
 drivers/usb/host/ehci-pmcmsp.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/usb/host/ehci-pmcmsp.c
+++ b/drivers/usb/host/ehci-pmcmsp.c
@@ -236,7 +236,7 @@ int usb_hcd_msp_probe(const struct hc_dr
  * may be called without controller electrically present
  * may be called with controller, bus, and devices active
  */
-void usb_hcd_msp_remove(struct usb_hcd *hcd, struct platform_device *dev)
+static void usb_hcd_msp_remove(struct usb_hcd *hcd)
 {
 	usb_remove_hcd(hcd);
 	iounmap(hcd->regs);
@@ -309,7 +309,7 @@ static int ehci_hcd_msp_drv_remove(struc
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 
-	usb_hcd_msp_remove(hcd, pdev);
+	usb_hcd_msp_remove(hcd);
 
 	/* free TWI GPIO USB_HOST_DEV pin */
 	gpio_free(MSP_PIN_USB0_HOST_DEV);

