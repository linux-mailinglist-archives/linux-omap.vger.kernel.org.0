Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BCE28E324
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 17:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389175AbgJNPUH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 11:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731801AbgJNPS7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 11:18:59 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0671DC061755;
        Wed, 14 Oct 2020 08:18:59 -0700 (PDT)
Message-Id: <20201014145727.957664398@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602688736;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=vwW4ioJK9iO/olIrRXTRGmM3ltJD08Kl75Jr29q8k1c=;
        b=frIAhV5zZRLyu3T3WeNS+86gEvbubYIX3DCA1EMG9dc6PZQ8/zJZ6mXGPll+enKHUU8nkq
        xcVDhKkvocjjmIOY1XBkDAo9RNne1g5EFZ81THNW8Q9ZhN30lr+kirb5Xdw51lNOMnVt3f
        xF91fW7Cm/IuiAm6AimnCv4pScxH9VZi6ZQM0l91yf9wIMvUICluUVu9V5Ie/fDKdG2Zic
        DbLjL0JNo4n86hIgO4YMri7GJpHpz/CopeqMTUsbVX9TySkCbLGm/Hx9em4XAr4Zpry0/J
        VKP7DyaiQucQhNxbQeISGqQkm8CCmG1H7sZqc1rHL9dMcQukLLo7T2jkHUCr4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602688736;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=vwW4ioJK9iO/olIrRXTRGmM3ltJD08Kl75Jr29q8k1c=;
        b=HKHZebV/VaTYhcE31MdsfD21ZcCC48DoK29bd201boCh/A3nNi6rLQZDAA4ytY36wApFt1
        zQhnU3J+aNK8qODw==
Date:   Wed, 14 Oct 2020 16:52:23 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: [patch 08/12] usb: hosts: Remove in_interrupt() from comments
References: <20201014145215.518912759@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Ahmed S. Darwish <a.darwish@linutronix.de>

The usage of in_interrupt() in drivers is phased out for various reasons.

Various comments use !in_interrupt() to describe calling context for probe()
and remove() functions. That's wrong because the calling context has to be
preemptible task context, which is not what !in_interrupt() describes.

Cleanup the comments. While at it add the missing kernel doc argument
descriptors and make usb_hcd_msp_remove() static.

Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org

---
 drivers/usb/host/ehci-fsl.c     |    9 ++++-----
 drivers/usb/host/ehci-pmcmsp.c  |   15 +++++++++------
 drivers/usb/host/ohci-at91.c    |   11 ++++++++---
 drivers/usb/host/ohci-omap.c    |    7 ++++---
 drivers/usb/host/ohci-pxa27x.c  |   11 ++++++-----
 drivers/usb/host/ohci-s3c2410.c |   12 ++++++------
 6 files changed, 37 insertions(+), 28 deletions(-)

--- a/drivers/usb/host/ehci-fsl.c
+++ b/drivers/usb/host/ehci-fsl.c
@@ -39,10 +39,10 @@ static struct hc_driver __read_mostly fs
 /*
  * fsl_ehci_drv_probe - initialize FSL-based HCDs
  * @pdev: USB Host Controller being probed
- * Context: !in_interrupt()
  *
- * Allocates basic resources for this USB host controller.
+ * Context: task context, might sleep
  *
+ * Allocates basic resources for this USB host controller.
  */
 static int fsl_ehci_drv_probe(struct platform_device *pdev)
 {
@@ -684,12 +684,11 @@ static const struct ehci_driver_override
 /**
  * fsl_ehci_drv_remove - shutdown processing for FSL-based HCDs
  * @pdev: USB Host Controller being removed
- * Context: !in_interrupt()
  *
- * Reverses the effect of usb_hcd_fsl_probe().
+ * Context: task context, might sleep
  *
+ * Reverses the effect of usb_hcd_fsl_probe().
  */
-
 static int fsl_ehci_drv_remove(struct platform_device *pdev)
 {
 	struct fsl_usb2_platform_data *pdata = dev_get_platdata(&pdev->dev);
--- a/drivers/usb/host/ehci-pmcmsp.c
+++ b/drivers/usb/host/ehci-pmcmsp.c
@@ -147,12 +147,14 @@ static int usb_hcd_msp_map_regs(struct m
 
 /**
  * usb_hcd_msp_probe - initialize PMC MSP-based HCDs
- * Context: !in_interrupt()
+ * @driver:	Pointer to hc driver instance
+ * @dev:	USB controller to probe
+ *
+ * Context: task context, might sleep
  *
  * Allocates basic resources for this USB host controller, and
  * then invokes the start() method for the HCD associated with it
  * through the hotplug entry's driver_data.
- *
  */
 int usb_hcd_msp_probe(const struct hc_driver *driver,
 			  struct platform_device *dev)
@@ -223,8 +225,9 @@ int usb_hcd_msp_probe(const struct hc_dr
 
 /**
  * usb_hcd_msp_remove - shutdown processing for PMC MSP-based HCDs
- * @dev: USB Host Controller being removed
- * Context: !in_interrupt()
+ * @hcd: USB Host Controller being removed
+ *
+ * Context: task context, might sleep
  *
  * Reverses the effect of usb_hcd_msp_probe(), first invoking
  * the HCD's stop() method.  It is always called from a thread
@@ -233,7 +236,7 @@ int usb_hcd_msp_probe(const struct hc_dr
  * may be called without controller electrically present
  * may be called with controller, bus, and devices active
  */
-void usb_hcd_msp_remove(struct usb_hcd *hcd, struct platform_device *dev)
+static void usb_hcd_msp_remove(struct usb_hcd *hcd)
 {
 	usb_remove_hcd(hcd);
 	iounmap(hcd->regs);
@@ -306,7 +309,7 @@ static int ehci_hcd_msp_drv_remove(struc
 {
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 
-	usb_hcd_msp_remove(hcd, pdev);
+	usb_hcd_msp_remove(hcd);
 
 	/* free TWI GPIO USB_HOST_DEV pin */
 	gpio_free(MSP_PIN_USB0_HOST_DEV);
--- a/drivers/usb/host/ohci-at91.c
+++ b/drivers/usb/host/ohci-at91.c
@@ -155,7 +155,10 @@ static struct regmap *at91_dt_syscon_sfr
 
 /*
  * usb_hcd_at91_probe - initialize AT91-based HCDs
- * Context: !in_interrupt()
+ * @driver:	Pointer to hc driver instance
+ * @pdev:	USB controller to probe
+ *
+ * Context: task context, might sleep
  *
  * Allocates basic resources for this USB host controller, and
  * then invokes the start() method for the HCD associated with it
@@ -246,12 +249,14 @@ static int usb_hcd_at91_probe(const stru
 
 /*
  * usb_hcd_at91_remove - shutdown processing for AT91-based HCDs
- * Context: !in_interrupt()
+ * @hcd:	USB controller to remove
+ * @pdev:	Platform device required for cleanup
+ *
+ * Context: task context, might sleep
  *
  * Reverses the effect of usb_hcd_at91_probe(), first invoking
  * the HCD's stop() method.  It is always called from a thread
  * context, "rmmod" or something similar.
- *
  */
 static void usb_hcd_at91_remove(struct usb_hcd *hcd,
 				struct platform_device *pdev)
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -285,7 +285,9 @@ static int ohci_omap_reset(struct usb_hc
 
 /**
  * ohci_hcd_omap_probe - initialize OMAP-based HCDs
- * Context: !in_interrupt()
+ * @pdev:	USB controller to probe
+ *
+ * Context: task context, might sleep
  *
  * Allocates basic resources for this USB host controller, and
  * then invokes the start() method for the HCD associated with it
@@ -399,8 +401,7 @@ static int ohci_hcd_omap_probe(struct pl
 
 /**
  * ohci_hcd_omap_remove - shutdown processing for OMAP-based HCDs
- * @dev: USB Host Controller being removed
- * Context: !in_interrupt()
+ * @pdev: USB Host Controller being removed
  *
  * Reverses the effect of ohci_hcd_omap_probe(), first invoking
  * the HCD's stop() method.  It is always called from a thread
--- a/drivers/usb/host/ohci-pxa27x.c
+++ b/drivers/usb/host/ohci-pxa27x.c
@@ -410,12 +410,13 @@ static int ohci_pxa_of_init(struct platf
 
 /**
  * ohci_hcd_pxa27x_probe - initialize pxa27x-based HCDs
- * Context: !in_interrupt()
+ * @pdev:	USB Host controller to probe
+ *
+ * Context: task context, might sleep
  *
  * Allocates basic resources for this USB host controller, and
  * then invokes the start() method for the HCD associated with it
  * through the hotplug entry's driver_data.
- *
  */
 static int ohci_hcd_pxa27x_probe(struct platform_device *pdev)
 {
@@ -509,13 +510,13 @@ static int ohci_hcd_pxa27x_probe(struct
 
 /**
  * ohci_hcd_pxa27x_remove - shutdown processing for pxa27x-based HCDs
- * @dev: USB Host Controller being removed
- * Context: !in_interrupt()
+ * @pdev: USB Host Controller being removed
+ *
+ * Context: task context, might sleep
  *
  * Reverses the effect of ohci_hcd_pxa27x_probe(), first invoking
  * the HCD's stop() method.  It is always called from a thread
  * context, normally "rmmod", "apmd", or something similar.
- *
  */
 static int ohci_hcd_pxa27x_remove(struct platform_device *pdev)
 {
--- a/drivers/usb/host/ohci-s3c2410.c
+++ b/drivers/usb/host/ohci-s3c2410.c
@@ -324,14 +324,13 @@ static void s3c2410_hcd_oc(struct s3c241
 /*
  * ohci_hcd_s3c2410_remove - shutdown processing for HCD
  * @dev: USB Host Controller being removed
- * Context: !in_interrupt()
+ *
+ * Context: task context, might sleep
  *
  * Reverses the effect of ohci_hcd_3c2410_probe(), first invoking
  * the HCD's stop() method.  It is always called from a thread
  * context, normally "rmmod", "apmd", or something similar.
- *
-*/
-
+ */
 static int
 ohci_hcd_s3c2410_remove(struct platform_device *dev)
 {
@@ -345,12 +344,13 @@ ohci_hcd_s3c2410_remove(struct platform_
 
 /*
  * ohci_hcd_s3c2410_probe - initialize S3C2410-based HCDs
- * Context: !in_interrupt()
+ * @dev: USB Host Controller to be probed
+ *
+ * Context: task context, might sleep
  *
  * Allocates basic resources for this USB host controller, and
  * then invokes the start() method for the HCD associated with it
  * through the hotplug entry's driver_data.
- *
  */
 static int ohci_hcd_s3c2410_probe(struct platform_device *dev)
 {

