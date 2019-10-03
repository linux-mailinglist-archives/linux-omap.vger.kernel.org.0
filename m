Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1AE2C9FA0
	for <lists+linux-omap@lfdr.de>; Thu,  3 Oct 2019 15:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730509AbfJCNmI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Oct 2019 09:42:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:53338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730507AbfJCNmF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Oct 2019 09:42:05 -0400
Received: from jupiter.universe (dyndsl-037-138-174-173.ewe-ip-backbone.de [37.138.174.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A8FF20873;
        Thu,  3 Oct 2019 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570110123;
        bh=IvBaboXYnwBi1bBEoaBBxMqz8oEAQmhVpcr3CIvwQJk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J5RNIagYv3sj4eEJe//lTJfdaHgl3CUKKiFvjmQfsDsJcAB7+Pq4M/7uVQNphvO4b
         hrNGQ2ZI7PW2KdlaUil1TYNmMJYIIVrCURVAWpfcpCRCx8T1ZnTw9DbduBwPYe/Q2k
         9I3YiiJ3nxU2nZl/wJLxmiJM2yx//LQe1qxlSiGI=
Received: by jupiter.universe (Postfix, from userid 1000)
        id 9619C4800C8; Thu,  3 Oct 2019 15:42:01 +0200 (CEST)
From:   Sebastian Reichel <sre@kernel.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Adam Ford <aford173@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-bluetooth@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 4/4] Bluetooth: btwilink: drop superseded driver
Date:   Thu,  3 Oct 2019 15:41:47 +0200
Message-Id: <20191003134147.9458-5-sre@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191003134147.9458-1-sre@kernel.org>
References: <20191003134147.9458-1-sre@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Sebastian Reichel <sebastian.reichel@collabora.com>

All users of this driver have been converted to the serdev based
hci_ll driver. The unused driver can be safely dropped now.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/bluetooth/Kconfig    |  11 --
 drivers/bluetooth/Makefile   |   1 -
 drivers/bluetooth/btwilink.c | 337 -----------------------------------
 3 files changed, 349 deletions(-)
 delete mode 100644 drivers/bluetooth/btwilink.c

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index aae665a3a254..f7aa2dc1ff85 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -380,17 +380,6 @@ config BT_ATH3K
 	  Say Y here to compile support for "Atheros firmware download driver"
 	  into the kernel or say M to compile it as module (ath3k).
 
-config BT_WILINK
-	tristate "Texas Instruments WiLink7 driver"
-	depends on TI_ST
-	help
-	  This enables the Bluetooth driver for Texas Instrument's BT/FM/GPS
-	  combo devices. This makes use of shared transport line discipline
-	  core driver to communicate with the BT core of the combo chip.
-
-	  Say Y here to compile support for Texas Instrument's WiLink7 driver
-	  into the kernel or say M to compile it as module (btwilink).
-
 config BT_MTKSDIO
 	tristate "MediaTek HCI SDIO driver"
 	depends on MMC
diff --git a/drivers/bluetooth/Makefile b/drivers/bluetooth/Makefile
index 34887b9b3a85..1a58a3ae142c 100644
--- a/drivers/bluetooth/Makefile
+++ b/drivers/bluetooth/Makefile
@@ -19,7 +19,6 @@ obj-$(CONFIG_BT_INTEL)		+= btintel.o
 obj-$(CONFIG_BT_ATH3K)		+= ath3k.o
 obj-$(CONFIG_BT_MRVL)		+= btmrvl.o
 obj-$(CONFIG_BT_MRVL_SDIO)	+= btmrvl_sdio.o
-obj-$(CONFIG_BT_WILINK)		+= btwilink.o
 obj-$(CONFIG_BT_MTKSDIO)	+= btmtksdio.o
 obj-$(CONFIG_BT_MTKUART)	+= btmtkuart.o
 obj-$(CONFIG_BT_QCOMSMD)	+= btqcomsmd.o
diff --git a/drivers/bluetooth/btwilink.c b/drivers/bluetooth/btwilink.c
deleted file mode 100644
index e55f06e4270f..000000000000
--- a/drivers/bluetooth/btwilink.c
+++ /dev/null
@@ -1,337 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Texas Instrument's Bluetooth Driver For Shared Transport.
- *
- *  Bluetooth Driver acts as interface between HCI core and
- *  TI Shared Transport Layer.
- *
- *  Copyright (C) 2009-2010 Texas Instruments
- *  Author: Raja Mani <raja_mani@ti.com>
- *	Pavan Savoy <pavan_savoy@ti.com>
- */
-
-#include <linux/platform_device.h>
-#include <net/bluetooth/bluetooth.h>
-#include <net/bluetooth/hci_core.h>
-#include <net/bluetooth/hci.h>
-
-#include <linux/ti_wilink_st.h>
-#include <linux/module.h>
-
-/* Bluetooth Driver Version */
-#define VERSION               "1.0"
-#define MAX_BT_CHNL_IDS		3
-
-/* Number of seconds to wait for registration completion
- * when ST returns PENDING status.
- */
-#define BT_REGISTER_TIMEOUT   6000	/* 6 sec */
-
-/**
- * struct ti_st - driver operation structure
- * @hdev: hci device pointer which binds to bt driver
- * @reg_status: ST registration callback status
- * @st_write: write function provided by the ST driver
- *	to be used by the driver during send_frame.
- * @wait_reg_completion - completion sync between ti_st_open
- *	and st_reg_completion_cb.
- */
-struct ti_st {
-	struct hci_dev *hdev;
-	int reg_status;
-	long (*st_write) (struct sk_buff *);
-	struct completion wait_reg_completion;
-};
-
-/* Increments HCI counters based on pocket ID (cmd,acl,sco) */
-static inline void ti_st_tx_complete(struct ti_st *hst, int pkt_type)
-{
-	struct hci_dev *hdev = hst->hdev;
-
-	/* Update HCI stat counters */
-	switch (pkt_type) {
-	case HCI_COMMAND_PKT:
-		hdev->stat.cmd_tx++;
-		break;
-
-	case HCI_ACLDATA_PKT:
-		hdev->stat.acl_tx++;
-		break;
-
-	case HCI_SCODATA_PKT:
-		hdev->stat.sco_tx++;
-		break;
-	}
-}
-
-/* ------- Interfaces to Shared Transport ------ */
-
-/* Called by ST layer to indicate protocol registration completion
- * status.ti_st_open() function will wait for signal from this
- * API when st_register() function returns ST_PENDING.
- */
-static void st_reg_completion_cb(void *priv_data, int data)
-{
-	struct ti_st *lhst = priv_data;
-
-	/* Save registration status for use in ti_st_open() */
-	lhst->reg_status = data;
-	/* complete the wait in ti_st_open() */
-	complete(&lhst->wait_reg_completion);
-}
-
-/* Called by Shared Transport layer when receive data is available */
-static long st_receive(void *priv_data, struct sk_buff *skb)
-{
-	struct ti_st *lhst = priv_data;
-	int err;
-
-	if (!skb)
-		return -EFAULT;
-
-	if (!lhst) {
-		kfree_skb(skb);
-		return -EFAULT;
-	}
-
-	/* Forward skb to HCI core layer */
-	err = hci_recv_frame(lhst->hdev, skb);
-	if (err < 0) {
-		BT_ERR("Unable to push skb to HCI core(%d)", err);
-		return err;
-	}
-
-	lhst->hdev->stat.byte_rx += skb->len;
-
-	return 0;
-}
-
-/* ------- Interfaces to HCI layer ------ */
-/* protocol structure registered with shared transport */
-static struct st_proto_s ti_st_proto[MAX_BT_CHNL_IDS] = {
-	{
-		.chnl_id = HCI_EVENT_PKT, /* HCI Events */
-		.hdr_len = sizeof(struct hci_event_hdr),
-		.offset_len_in_hdr = offsetof(struct hci_event_hdr, plen),
-		.len_size = 1, /* sizeof(plen) in struct hci_event_hdr */
-		.reserve = 8,
-	},
-	{
-		.chnl_id = HCI_ACLDATA_PKT, /* ACL */
-		.hdr_len = sizeof(struct hci_acl_hdr),
-		.offset_len_in_hdr = offsetof(struct hci_acl_hdr, dlen),
-		.len_size = 2,	/* sizeof(dlen) in struct hci_acl_hdr */
-		.reserve = 8,
-	},
-	{
-		.chnl_id = HCI_SCODATA_PKT, /* SCO */
-		.hdr_len = sizeof(struct hci_sco_hdr),
-		.offset_len_in_hdr = offsetof(struct hci_sco_hdr, dlen),
-		.len_size = 1, /* sizeof(dlen) in struct hci_sco_hdr */
-		.reserve = 8,
-	},
-};
-
-/* Called from HCI core to initialize the device */
-static int ti_st_open(struct hci_dev *hdev)
-{
-	unsigned long timeleft;
-	struct ti_st *hst;
-	int err, i;
-
-	BT_DBG("%s %p", hdev->name, hdev);
-
-	/* provide contexts for callbacks from ST */
-	hst = hci_get_drvdata(hdev);
-
-	for (i = 0; i < MAX_BT_CHNL_IDS; i++) {
-		ti_st_proto[i].priv_data = hst;
-		ti_st_proto[i].max_frame_size = HCI_MAX_FRAME_SIZE;
-		ti_st_proto[i].recv = st_receive;
-		ti_st_proto[i].reg_complete_cb = st_reg_completion_cb;
-
-		/* Prepare wait-for-completion handler */
-		init_completion(&hst->wait_reg_completion);
-		/* Reset ST registration callback status flag,
-		 * this value will be updated in
-		 * st_reg_completion_cb()
-		 * function whenever it called from ST driver.
-		 */
-		hst->reg_status = -EINPROGRESS;
-
-		err = st_register(&ti_st_proto[i]);
-		if (!err)
-			goto done;
-
-		if (err != -EINPROGRESS) {
-			BT_ERR("st_register failed %d", err);
-			return err;
-		}
-
-		/* ST is busy with either protocol
-		 * registration or firmware download.
-		 */
-		BT_DBG("waiting for registration "
-				"completion signal from ST");
-		timeleft = wait_for_completion_timeout
-			(&hst->wait_reg_completion,
-			 msecs_to_jiffies(BT_REGISTER_TIMEOUT));
-		if (!timeleft) {
-			BT_ERR("Timeout(%d sec),didn't get reg "
-					"completion signal from ST",
-					BT_REGISTER_TIMEOUT / 1000);
-			return -ETIMEDOUT;
-		}
-
-		/* Is ST registration callback
-		 * called with ERROR status?
-		 */
-		if (hst->reg_status != 0) {
-			BT_ERR("ST registration completed with invalid "
-					"status %d", hst->reg_status);
-			return -EAGAIN;
-		}
-
-done:
-		hst->st_write = ti_st_proto[i].write;
-		if (!hst->st_write) {
-			BT_ERR("undefined ST write function");
-			for (i = 0; i < MAX_BT_CHNL_IDS; i++) {
-				/* Undo registration with ST */
-				err = st_unregister(&ti_st_proto[i]);
-				if (err)
-					BT_ERR("st_unregister() failed with "
-							"error %d", err);
-				hst->st_write = NULL;
-			}
-			return -EIO;
-		}
-	}
-	return 0;
-}
-
-/* Close device */
-static int ti_st_close(struct hci_dev *hdev)
-{
-	int err, i;
-	struct ti_st *hst = hci_get_drvdata(hdev);
-
-	for (i = MAX_BT_CHNL_IDS-1; i >= 0; i--) {
-		err = st_unregister(&ti_st_proto[i]);
-		if (err)
-			BT_ERR("st_unregister(%d) failed with error %d",
-					ti_st_proto[i].chnl_id, err);
-	}
-
-	hst->st_write = NULL;
-
-	return err;
-}
-
-static int ti_st_send_frame(struct hci_dev *hdev, struct sk_buff *skb)
-{
-	struct ti_st *hst;
-	long len;
-	int pkt_type;
-
-	hst = hci_get_drvdata(hdev);
-
-	/* Prepend skb with frame type */
-	memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
-
-	BT_DBG("%s: type %d len %d", hdev->name, hci_skb_pkt_type(skb),
-	       skb->len);
-
-	/* Insert skb to shared transport layer's transmit queue.
-	 * Freeing skb memory is taken care in shared transport layer,
-	 * so don't free skb memory here.
-	 */
-	pkt_type = hci_skb_pkt_type(skb);
-	len = hst->st_write(skb);
-	if (len < 0) {
-		BT_ERR("ST write failed (%ld)", len);
-		/* Try Again, would only fail if UART has gone bad */
-		return -EAGAIN;
-	}
-
-	/* ST accepted our skb. So, Go ahead and do rest */
-	hdev->stat.byte_tx += len;
-	ti_st_tx_complete(hst, pkt_type);
-
-	return 0;
-}
-
-static int bt_ti_probe(struct platform_device *pdev)
-{
-	struct ti_st *hst;
-	struct hci_dev *hdev;
-	int err;
-
-	hst = devm_kzalloc(&pdev->dev, sizeof(struct ti_st), GFP_KERNEL);
-	if (!hst)
-		return -ENOMEM;
-
-	/* Expose "hciX" device to user space */
-	hdev = hci_alloc_dev();
-	if (!hdev)
-		return -ENOMEM;
-
-	BT_DBG("hdev %p", hdev);
-
-	hst->hdev = hdev;
-	hdev->bus = HCI_UART;
-	hci_set_drvdata(hdev, hst);
-	hdev->open = ti_st_open;
-	hdev->close = ti_st_close;
-	hdev->flush = NULL;
-	hdev->send = ti_st_send_frame;
-
-	err = hci_register_dev(hdev);
-	if (err < 0) {
-		BT_ERR("Can't register HCI device error %d", err);
-		hci_free_dev(hdev);
-		return err;
-	}
-
-	BT_DBG("HCI device registered (hdev %p)", hdev);
-
-	dev_set_drvdata(&pdev->dev, hst);
-	return 0;
-}
-
-static int bt_ti_remove(struct platform_device *pdev)
-{
-	struct hci_dev *hdev;
-	struct ti_st *hst = dev_get_drvdata(&pdev->dev);
-
-	if (!hst)
-		return -EFAULT;
-
-	BT_DBG("%s", hst->hdev->name);
-
-	hdev = hst->hdev;
-	ti_st_close(hdev);
-	hci_unregister_dev(hdev);
-
-	hci_free_dev(hdev);
-
-	dev_set_drvdata(&pdev->dev, NULL);
-	return 0;
-}
-
-static struct platform_driver btwilink_driver = {
-	.probe = bt_ti_probe,
-	.remove = bt_ti_remove,
-	.driver = {
-		.name = "btwilink",
-	},
-};
-
-module_platform_driver(btwilink_driver);
-
-/* ------ Module Info ------ */
-
-MODULE_AUTHOR("Raja Mani <raja_mani@ti.com>");
-MODULE_DESCRIPTION("Bluetooth Driver for TI Shared Transport" VERSION);
-MODULE_VERSION(VERSION);
-MODULE_LICENSE("GPL");
-- 
2.23.0

