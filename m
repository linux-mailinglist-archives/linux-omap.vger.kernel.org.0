Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEE6D28E313
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 17:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389136AbgJNPTu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 11:19:50 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:59264 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731817AbgJNPTD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 11:19:03 -0400
Message-Id: <20201014145728.318078828@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602688740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=kcowbMpvAqIB8vuk7SNsG8nZoygpkwt3f5P13wpvizw=;
        b=FFxvjYWLwbUk/1uOGnH5OG7OnXpCijl+ZCGdtKvu+0IdJt8m0ApURx9AbgxzW+0cxyf+h0
        HQ6L5fi/72G3obw8qmQnOPFuQbf9XxC9YmQXke4rOtd5DD4irfqy0n7i6y09WFw13/zOss
        Xca5UCggCD1Uj3LSn1oGWofAB43fbEtW6UEUbrViNSce8MGHMBtXaaEzHpA219iWYrdIbR
        QZrTnufEO+RIky0tUzTuV4+z3h+TMtf2flpZjxWDzr9rRF6+f73Buj86o0nZYT81eJyWgq
        SXmBnISOg3+UG4fDau5N5YDNz936u/UI0YBXuFtiw9XbSyLHMnP56Nv/yMFNcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602688740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=kcowbMpvAqIB8vuk7SNsG8nZoygpkwt3f5P13wpvizw=;
        b=Wnj1LJVPBcvB3/XtUI3Av3nod7hxMdjVYG0aPO72mqWvjayKntWqk4GomTBy1B28VIaQty
        GXZr9nFqIId2MyDQ==
Date:   Wed, 14 Oct 2020 16:52:26 +0200
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
Subject: [patch 11/12] usb: core: Replace in_interrupt() in comments
References: <20201014145215.518912759@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Ahmed S. Darwish <a.darwish@linutronix.de>

The usage of in_interrupt() in drivers is phased out for various reasons.

Various comments use !in_interrupt() to describe calling context for
functions which might sleep. That's wrong because the calling context has
to be preemptible task context, which is not what !in_interrupt()
describes.

Replace !in_interrupt() with more accurate plain text descriptions.

The comment for usb_hcd_poll_rh_status() is misleading as this function is
called from all kinds of contexts including preemptible task
context. Remove it as there is obviously no restriction.

Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org

---
 drivers/usb/core/buffer.c  |    6 ++++--
 drivers/usb/core/hcd-pci.c |    6 ++++--
 drivers/usb/core/hcd.c     |   21 +++++++++++----------
 drivers/usb/core/hub.c     |    3 ++-
 drivers/usb/core/message.c |   35 ++++++++++++++++++++++-------------
 drivers/usb/core/usb.c     |    4 ++--
 6 files changed, 45 insertions(+), 30 deletions(-)

--- a/drivers/usb/core/buffer.c
+++ b/drivers/usb/core/buffer.c
@@ -51,7 +51,8 @@ void __init usb_init_pool_max(void)
 /**
  * hcd_buffer_create - initialize buffer pools
  * @hcd: the bus whose buffer pools are to be initialized
- * Context: !in_interrupt()
+ *
+ * Context: task context, might sleep
  *
  * Call this as part of initializing a host controller that uses the dma
  * memory allocators.  It initializes some pools of dma-coherent memory that
@@ -88,7 +89,8 @@ int hcd_buffer_create(struct usb_hcd *hc
 /**
  * hcd_buffer_destroy - deallocate buffer pools
  * @hcd: the bus whose buffer pools are to be destroyed
- * Context: !in_interrupt()
+ *
+ * Context: task context, might sleep
  *
  * This frees the buffer pools created by hcd_buffer_create().
  */
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -160,7 +160,8 @@ static void ehci_wait_for_companions(str
  * @dev: USB Host Controller being probed
  * @id: pci hotplug id connecting controller to HCD framework
  * @driver: USB HC driver handle
- * Context: !in_interrupt()
+ *
+ * Context: task context, might sleep
  *
  * Allocates basic PCI resources for this USB host controller, and
  * then invokes the start() method for the HCD associated with it
@@ -304,7 +305,8 @@ EXPORT_SYMBOL_GPL(usb_hcd_pci_probe);
 /**
  * usb_hcd_pci_remove - shutdown processing for PCI-based HCDs
  * @dev: USB Host Controller being removed
- * Context: !in_interrupt()
+ *
+ * Context: task context, might sleep
  *
  * Reverses the effect of usb_hcd_pci_probe(), first invoking
  * the HCD's stop() method.  It is always called from a thread
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -746,9 +746,6 @@ static int rh_call_control (struct usb_h
  * Root Hub interrupt transfers are polled using a timer if the
  * driver requests it; otherwise the driver is responsible for
  * calling usb_hcd_poll_rh_status() when an event occurs.
- *
- * Completions are called in_interrupt(), but they may or may not
- * be in_irq().
  */
 void usb_hcd_poll_rh_status(struct usb_hcd *hcd)
 {
@@ -904,7 +901,8 @@ static void usb_bus_init (struct usb_bus
 /**
  * usb_register_bus - registers the USB host controller with the usb core
  * @bus: pointer to the bus to register
- * Context: !in_interrupt()
+ *
+ * Context: task context, might sleep.
  *
  * Assigns a bus number, and links the controller into usbcore data
  * structures so that it can be seen by scanning the bus list.
@@ -939,7 +937,8 @@ static int usb_register_bus(struct usb_b
 /**
  * usb_deregister_bus - deregisters the USB host controller
  * @bus: pointer to the bus to deregister
- * Context: !in_interrupt()
+ *
+ * Context: task context, might sleep.
  *
  * Recycles the bus number, and unlinks the controller from usbcore data
  * structures so that it won't be seen by scanning the bus list.
@@ -1691,7 +1690,6 @@ static void usb_giveback_urb_bh(unsigned
  * @hcd: host controller returning the URB
  * @urb: urb being returned to the USB device driver.
  * @status: completion status code for the URB.
- * Context: in_interrupt()
  *
  * This hands the URB from HCD to its USB device driver, using its
  * completion function.  The HCD has freed all per-urb resources
@@ -2268,7 +2266,7 @@ EXPORT_SYMBOL_GPL(usb_hcd_resume_root_hu
  * usb_bus_start_enum - start immediate enumeration (for OTG)
  * @bus: the bus (must use hcd framework)
  * @port_num: 1-based number of port; usually bus->otg_port
- * Context: in_interrupt()
+ * Context: atomic
  *
  * Starts enumeration, with an immediate reset followed later by
  * hub_wq identifying and possibly configuring the device.
@@ -2474,7 +2472,8 @@ EXPORT_SYMBOL_GPL(__usb_create_hcd);
  * @bus_name: value to store in hcd->self.bus_name
  * @primary_hcd: a pointer to the usb_hcd structure that is sharing the
  *              PCI device.  Only allocate certain resources for the primary HCD
- * Context: !in_interrupt()
+ *
+ * Context: task context, might sleep.
  *
  * Allocate a struct usb_hcd, with extra space at the end for the
  * HC driver's private data.  Initialize the generic members of the
@@ -2496,7 +2495,8 @@ EXPORT_SYMBOL_GPL(usb_create_shared_hcd)
  * @driver: HC driver that will use this hcd
  * @dev: device for this HC, stored in hcd->self.controller
  * @bus_name: value to store in hcd->self.bus_name
- * Context: !in_interrupt()
+ *
+ * Context: task context, might sleep.
  *
  * Allocate a struct usb_hcd, with extra space at the end for the
  * HC driver's private data.  Initialize the generic members of the
@@ -2830,7 +2830,8 @@ EXPORT_SYMBOL_GPL(usb_add_hcd);
 /**
  * usb_remove_hcd - shutdown processing for generic HCDs
  * @hcd: the usb_hcd structure to remove
- * Context: !in_interrupt()
+ *
+ * Context: task context, might sleep.
  *
  * Disconnects the root hub, then reverses the effects of usb_add_hcd(),
  * invoking the HCD's stop() method.
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2171,7 +2171,8 @@ static void hub_disconnect_children(stru
 /**
  * usb_disconnect - disconnect a device (usbcore-internal)
  * @pdev: pointer to device being disconnected
- * Context: !in_interrupt ()
+ *
+ * Context: task context, might sleep
  *
  * Something got disconnected. Get rid of it and all of its children.
  *
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -119,7 +119,7 @@ static int usb_internal_control_msg(stru
  * @timeout: time in msecs to wait for the message to complete before timing
  *	out (if 0 the wait is forever)
  *
- * Context: !in_interrupt ()
+ * Context: task context, might sleep.
  *
  * This function sends a simple control message to a specified endpoint and
  * waits for the message to complete, or timeout.
@@ -173,7 +173,7 @@ EXPORT_SYMBOL_GPL(usb_control_msg);
  * @timeout: time in msecs to wait for the message to complete before
  *	timing out (if 0 the wait is forever)
  *
- * Context: !in_interrupt ()
+ * Context: task context, might sleep.
  *
  * This function sends a simple interrupt message to a specified endpoint and
  * waits for the message to complete, or timeout.
@@ -206,7 +206,7 @@ EXPORT_SYMBOL_GPL(usb_interrupt_msg);
  * @timeout: time in msecs to wait for the message to complete before
  *	timing out (if 0 the wait is forever)
  *
- * Context: !in_interrupt ()
+ * Context: task context, might sleep.
  *
  * This function sends a simple bulk message to a specified endpoint
  * and waits for the message to complete, or timeout.
@@ -473,7 +473,8 @@ EXPORT_SYMBOL_GPL(usb_sg_init);
  * usb_sg_wait - synchronously execute scatter/gather request
  * @io: request block handle, as initialized with usb_sg_init().
  * 	some fields become accessible when this call returns.
- * Context: !in_interrupt ()
+ *
+ * Context: task context, might sleep.
  *
  * This function blocks until the specified I/O operation completes.  It
  * leverages the grouping of the related I/O requests to get good transfer
@@ -627,7 +628,8 @@ EXPORT_SYMBOL_GPL(usb_sg_cancel);
  * @index: the number of the descriptor
  * @buf: where to put the descriptor
  * @size: how big is "buf"?
- * Context: !in_interrupt ()
+ *
+ * Context: task context, might sleep.
  *
  * Gets a USB descriptor.  Convenience functions exist to simplify
  * getting some types of descriptors.  Use
@@ -675,7 +677,8 @@ EXPORT_SYMBOL_GPL(usb_get_descriptor);
  * @index: the number of the descriptor
  * @buf: where to put the string
  * @size: how big is "buf"?
- * Context: !in_interrupt ()
+ *
+ * Context: task context, might sleep.
  *
  * Retrieves a string, encoded using UTF-16LE (Unicode, 16 bits per character,
  * in little-endian byte order).
@@ -810,7 +813,8 @@ static int usb_get_langid(struct usb_dev
  * @index: the number of the descriptor
  * @buf: where to put the string
  * @size: how big is "buf"?
- * Context: !in_interrupt ()
+ *
+ * Context: task context, might sleep.
  *
  * This converts the UTF-16LE encoded strings returned by devices, from
  * usb_get_string_descriptor(), to null-terminated UTF-8 encoded ones
@@ -899,7 +903,8 @@ char *usb_cache_string(struct usb_device
  * usb_get_device_descriptor - (re)reads the device descriptor (usbcore)
  * @dev: the device whose device descriptor is being updated
  * @size: how much of the descriptor to read
- * Context: !in_interrupt ()
+ *
+ * Context: task context, might sleep.
  *
  * Updates the copy of the device descriptor stored in the device structure,
  * which dedicates space for this purpose.
@@ -934,7 +939,7 @@ int usb_get_device_descriptor(struct usb
 /*
  * usb_set_isoch_delay - informs the device of the packet transmit delay
  * @dev: the device whose delay is to be informed
- * Context: !in_interrupt()
+ * Context: can sleep
  *
  * Since this is an optional request, we don't bother if it fails.
  */
@@ -962,7 +967,8 @@ int usb_set_isoch_delay(struct usb_devic
  * @type: USB_STATUS_TYPE_*; for standard or PTM status types
  * @target: zero (for device), else interface or endpoint number
  * @data: pointer to two bytes of bitmap data
- * Context: !in_interrupt ()
+ *
+ * Context: task context, might sleep.
  *
  * Returns device, interface, or endpoint status.  Normally only of
  * interest to see if the device is self powered, or has enabled the
@@ -1039,7 +1045,8 @@ EXPORT_SYMBOL_GPL(usb_get_status);
  * usb_clear_halt - tells device to clear endpoint halt/stall condition
  * @dev: device whose endpoint is halted
  * @pipe: endpoint "pipe" being cleared
- * Context: !in_interrupt ()
+ *
+ * Context: task context, might sleep.
  *
  * This is used to clear halt conditions for bulk and interrupt endpoints,
  * as reported by URB completion status.  Endpoints that are halted are
@@ -1343,7 +1350,8 @@ void usb_enable_interface(struct usb_dev
  * @dev: the device whose interface is being updated
  * @interface: the interface being updated
  * @alternate: the setting being chosen.
- * Context: !in_interrupt ()
+ *
+ * Context: task context, might sleep.
  *
  * This is used to enable data transfers on interfaces that may not
  * be enabled by default.  Not all devices support such configurability.
@@ -1762,7 +1770,8 @@ static void __usb_queue_reset_device(str
  * usb_set_configuration - Makes a particular device setting be current
  * @dev: the device whose configuration is being updated
  * @configuration: the configuration being chosen.
- * Context: !in_interrupt(), caller owns the device lock
+ *
+ * Context: task context, might sleep. Caller holds device lock.
  *
  * This is used to enable non-default device modes.  Not all devices
  * use this kind of configurability; many devices only have one
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -28,7 +28,6 @@
 #include <linux/string.h>
 #include <linux/bitops.h>
 #include <linux/slab.h>
-#include <linux/interrupt.h>  /* for in_interrupt() */
 #include <linux/kmod.h>
 #include <linux/init.h>
 #include <linux/spinlock.h>
@@ -561,7 +560,8 @@ static bool usb_dev_authorized(struct us
  * @parent: hub to which device is connected; null to allocate a root hub
  * @bus: bus used to access the device
  * @port1: one-based index of port; ignored for root hubs
- * Context: !in_interrupt()
+ *
+ * Context: task context, might sleep.
  *
  * Only hub drivers (including virtual root hub drivers for host
  * controllers) should ever call this.

