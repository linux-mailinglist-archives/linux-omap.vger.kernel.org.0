Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12B6FD1AD5
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 23:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731072AbfJIVWH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 17:22:07 -0400
Received: from muru.com ([72.249.23.125]:36630 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731916AbfJIVWH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Oct 2019 17:22:07 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E2D9881CA;
        Wed,  9 Oct 2019 21:22:39 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 5/7] usb: musb: omap2430: Clean up enable and remove devctl tinkering
Date:   Wed,  9 Oct 2019 14:21:42 -0700
Message-Id: <20191009212145.28495-6-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009212145.28495-1-tony@atomide.com>
References: <20191009212145.28495-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There should be no need to tinker with devctl in enable in the SoC glue
code. We have musb_start() to take care of handling it already.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/omap2430.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
--- a/drivers/usb/musb/omap2430.c
+++ b/drivers/usb/musb/omap2430.c
@@ -275,33 +275,13 @@ static int omap2430_musb_init(struct musb *musb)
 
 static void omap2430_musb_enable(struct musb *musb)
 {
-	u8		devctl;
-	unsigned long timeout = jiffies + msecs_to_jiffies(1000);
 	struct device *dev = musb->controller;
 	struct omap2430_glue *glue = dev_get_drvdata(dev->parent);
-	struct musb_hdrc_platform_data *pdata = dev_get_platdata(dev);
-	struct omap_musb_board_data *data = pdata->board_data;
-
 
 	switch (glue->status) {
 
 	case MUSB_ID_GROUND:
 		omap_control_usb_set_mode(glue->control_otghs, USB_MODE_HOST);
-		if (data->interface_type != MUSB_INTERFACE_UTMI)
-			break;
-		devctl = musb_readb(musb->mregs, MUSB_DEVCTL);
-		/* start the session */
-		devctl |= MUSB_DEVCTL_SESSION;
-		musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);
-		while (musb_readb(musb->mregs, MUSB_DEVCTL) &
-				MUSB_DEVCTL_BDEVICE) {
-			cpu_relax();
-
-			if (time_after(jiffies, timeout)) {
-				dev_err(dev, "configured as A device timeout");
-				break;
-			}
-		}
 		break;
 
 	case MUSB_VBUS_VALID:
-- 
2.23.0
