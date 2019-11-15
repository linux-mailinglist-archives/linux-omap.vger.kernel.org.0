Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1893EFD470
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2019 06:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbfKOFdy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Nov 2019 00:33:54 -0500
Received: from muru.com ([72.249.23.125]:42414 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbfKOFdx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Nov 2019 00:33:53 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C7FA980E7;
        Fri, 15 Nov 2019 05:34:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH] phy: cpcap-usb: Fix error path when no host driver is loaded
Date:   Thu, 14 Nov 2019 21:33:50 -0800
Message-Id: <20191115053350.20004-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If musb_mailbox() returns an error, we must still continue to finish
configuring the phy.

Otherwise the phy state may end up only half initialized, and this can
cause the debug serial console to stop working. And this will happen if the
usb driver musb controller is not loaded.

Let's fix the issue by adding helper for cpcap_usb_try_musb_mailbox().

Fixes: 6d6ce40f63af ("phy: cpcap-usb: Add CPCAP PMIC USB support")
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/phy/motorola/phy-cpcap-usb.c | 29 ++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
--- a/drivers/phy/motorola/phy-cpcap-usb.c
+++ b/drivers/phy/motorola/phy-cpcap-usb.c
@@ -207,6 +207,19 @@ static int cpcap_phy_get_ints_state(struct cpcap_phy_ddata *ddata,
 static int cpcap_usb_set_uart_mode(struct cpcap_phy_ddata *ddata);
 static int cpcap_usb_set_usb_mode(struct cpcap_phy_ddata *ddata);
 
+static void cpcap_usb_try_musb_mailbox(struct cpcap_phy_ddata *ddata,
+				       enum musb_vbus_id_status status)
+{
+	int error;
+
+	error = musb_mailbox(status);
+	if (!error)
+		return;
+
+	dev_dbg(ddata->dev, "%s: musb_mailbox failed: %i\n",
+		__func__, error);
+}
+
 static void cpcap_usb_detect(struct work_struct *work)
 {
 	struct cpcap_phy_ddata *ddata;
@@ -226,9 +239,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 		if (error)
 			goto out_err;
 
-		error = musb_mailbox(MUSB_ID_GROUND);
-		if (error)
-			goto out_err;
+		cpcap_usb_try_musb_mailbox(ddata, MUSB_ID_GROUND);
 
 		error = regmap_update_bits(ddata->reg, CPCAP_REG_USBC3,
 					   CPCAP_BIT_VBUSSTBY_EN |
@@ -257,9 +268,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 			error = cpcap_usb_set_usb_mode(ddata);
 			if (error)
 				goto out_err;
-			error = musb_mailbox(MUSB_ID_GROUND);
-			if (error)
-				goto out_err;
+			cpcap_usb_try_musb_mailbox(ddata, MUSB_ID_GROUND);
 
 			return;
 		}
@@ -269,16 +278,12 @@ static void cpcap_usb_detect(struct work_struct *work)
 		error = cpcap_usb_set_usb_mode(ddata);
 		if (error)
 			goto out_err;
-		error = musb_mailbox(MUSB_VBUS_VALID);
-		if (error)
-			goto out_err;
+		cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_VALID);
 
 		return;
 	}
 
-	error = musb_mailbox(MUSB_VBUS_OFF);
-	if (error)
-		goto out_err;
+	cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_OFF);
 
 	/* Default to debug UART mode */
 	error = cpcap_usb_set_uart_mode(ddata);
-- 
2.23.0
