Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31E21128F43
	for <lists+linux-omap@lfdr.de>; Sun, 22 Dec 2019 19:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfLVSRU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 22 Dec 2019 13:17:20 -0500
Received: from muru.com ([72.249.23.125]:49330 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbfLVSRT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 22 Dec 2019 13:17:19 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 086C08188;
        Sun, 22 Dec 2019 18:17:58 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 2/3] phy: cpcap-usb: Improve host vs docked mode detection
Date:   Sun, 22 Dec 2019 10:17:03 -0800
Message-Id: <20191222181704.61511-2-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222181704.61511-1-tony@atomide.com>
References: <20191222181704.61511-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When docked to a Motorola lapdock or media dock, we're in USB A-host mode
with VBUS provided by the dock. When in regular USB A-host mode, we're
providing the VBUS. And in regular USB A-host mode we must also keep
kicking the VBUS to keep it active.

Let's wait a bit before configuring the USB PHY to allow some time between
the ID and VBUS changes. And let's add vbus_provider flag so we can detect
docked mode and regularo USB A-host mode better.

With better USB A-host mode detection, we can now also just kick the
VBUS to keep it enabled and leave out the unnecessary line muxing.

We only need to set and clear vbus_provider in the delayed work so no
locking is needed for it currently.

Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/phy/motorola/phy-cpcap-usb.c | 73 ++++++++++++++++++++++------
 1 file changed, 58 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
--- a/drivers/phy/motorola/phy-cpcap-usb.c
+++ b/drivers/phy/motorola/phy-cpcap-usb.c
@@ -134,6 +134,8 @@ struct cpcap_phy_ddata {
 	struct iio_channel *id;
 	struct regulator *vusb;
 	atomic_t active;
+	unsigned int vbus_provider:1;
+	unsigned int docked:1;
 };
 
 static bool cpcap_usb_vbus_valid(struct cpcap_phy_ddata *ddata)
@@ -233,8 +235,60 @@ static void cpcap_usb_detect(struct work_struct *work)
 	if (error)
 		return;
 
-	if (s.id_ground) {
+	vbus = cpcap_usb_vbus_valid(ddata);
+
+	/* We need to kick the VBUS as USB A-host */
+	if (s.id_ground && ddata->vbus_provider) {
+		dev_dbg(ddata->dev, "still in USB A-host mode, kicking VBUS\n");
+
+		cpcap_usb_try_musb_mailbox(ddata, MUSB_ID_GROUND);
+
+		error = regmap_update_bits(ddata->reg, CPCAP_REG_USBC3,
+					   CPCAP_BIT_VBUSSTBY_EN |
+					   CPCAP_BIT_VBUSEN_SPI,
+					   CPCAP_BIT_VBUSEN_SPI);
+		if (error)
+			goto out_err;
+
+		return;
+	}
+
+	if (vbus && s.id_ground && ddata->docked) {
+		dev_dbg(ddata->dev, "still docked as A-host, signal ID down\n");
+
+		cpcap_usb_try_musb_mailbox(ddata, MUSB_ID_GROUND);
+
+		return;
+	}
+
+	/* No VBUS needed with docks */
+	if (vbus && s.id_ground && !ddata->vbus_provider) {
+		dev_dbg(ddata->dev, "connected to a dock\n");
+
+		ddata->docked = true;
+
+		error = cpcap_usb_set_usb_mode(ddata);
+		if (error)
+			goto out_err;
+
+		cpcap_usb_try_musb_mailbox(ddata, MUSB_ID_GROUND);
+
+		/*
+		 * Force check state again after musb has reoriented,
+		 * otherwise devices won't enumerate after loading PHY
+		 * driver.
+		 */
+		schedule_delayed_work(&ddata->detect_work,
+				      msecs_to_jiffies(1000));
+
+		return;
+	}
+
+	if (s.id_ground && !ddata->docked) {
 		dev_dbg(ddata->dev, "id ground, USB host mode\n");
+
+		ddata->vbus_provider = true;
+
 		error = cpcap_usb_set_usb_mode(ddata);
 		if (error)
 			goto out_err;
@@ -259,21 +313,8 @@ static void cpcap_usb_detect(struct work_struct *work)
 
 	vbus = cpcap_usb_vbus_valid(ddata);
 
+	/* Otherwise assume we're connected to a USB host */
 	if (vbus) {
-		/* Are we connected to a docking station with vbus? */
-		if (s.id_ground) {
-			dev_dbg(ddata->dev, "connected to a dock\n");
-
-			/* No VBUS needed with docks */
-			error = cpcap_usb_set_usb_mode(ddata);
-			if (error)
-				goto out_err;
-			cpcap_usb_try_musb_mailbox(ddata, MUSB_ID_GROUND);
-
-			return;
-		}
-
-		/* Otherwise assume we're connected to a USB host */
 		dev_dbg(ddata->dev, "connected to USB host\n");
 		error = cpcap_usb_set_usb_mode(ddata);
 		if (error)
@@ -283,6 +324,8 @@ static void cpcap_usb_detect(struct work_struct *work)
 		return;
 	}
 
+	ddata->vbus_provider = false;
+	ddata->docked = false;
 	cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_OFF);
 
 	/* Default to debug UART mode */
-- 
2.24.1
