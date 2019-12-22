Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A927128F34
	for <lists+linux-omap@lfdr.de>; Sun, 22 Dec 2019 19:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbfLVSA2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 22 Dec 2019 13:00:28 -0500
Received: from muru.com ([72.249.23.125]:49300 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbfLVSA1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 22 Dec 2019 13:00:27 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A3F158117;
        Sun, 22 Dec 2019 18:01:06 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCHv2] phy: cpcap-usb: Fix flakey host idling and enumerating of devices
Date:   Sun, 22 Dec 2019 10:00:19 -0800
Message-Id: <20191222180019.55417-1-tony@atomide.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We must let the USB host idle things properly before we switch to debug
UART mode. Otherwise the USB host may never idle after disconnecting
devices, and that causes the next enumeration to be flakey.

Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Marcel Partap <mpartap@gmx.net>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Michael Scott <hashcode0f@gmail.com>
Cc: NeKit <nekit1000@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Fixes: 6d6ce40f63af ("phy: cpcap-usb: Add CPCAP PMIC USB support")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Kishon, looks like the v1 patch sent in August got lost somewhere.
Here's a resend update against your fixes branch.


 drivers/phy/motorola/phy-cpcap-usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
--- a/drivers/phy/motorola/phy-cpcap-usb.c
+++ b/drivers/phy/motorola/phy-cpcap-usb.c
@@ -283,13 +283,13 @@ static void cpcap_usb_detect(struct work_struct *work)
 		return;
 	}
 
+	cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_OFF);
+
 	/* Default to debug UART mode */
 	error = cpcap_usb_set_uart_mode(ddata);
 	if (error)
 		goto out_err;
 
-	cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_OFF);
-
 	dev_dbg(ddata->dev, "set UART mode\n");
 
 	return;
-- 
2.24.1
