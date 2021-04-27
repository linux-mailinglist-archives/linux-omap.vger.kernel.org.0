Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C3436C60F
	for <lists+linux-omap@lfdr.de>; Tue, 27 Apr 2021 14:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235426AbhD0MaF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Apr 2021 08:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235410AbhD0MaE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 27 Apr 2021 08:30:04 -0400
X-Greylist: delayed 463 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 27 Apr 2021 05:29:21 PDT
Received: from mail.solidxs.nl (mail.solidxs.nl [IPv6:2a01:4f8:150:72a3::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870D5C061574
        for <linux-omap@vger.kernel.org>; Tue, 27 Apr 2021 05:29:21 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by mail.solidxs.nl (Postfix) with ESMTP id 3D5074C80C67;
        Tue, 27 Apr 2021 14:21:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at solidxs.nl
Received: from mail.solidxs.nl ([127.0.0.1])
        by localhost (mail.solidxs.nl [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tMAsH9R0Xw4k; Tue, 27 Apr 2021 14:21:34 +0200 (CEST)
Received: from precision.lan (81-227-11-245-no2212.tbcn.telia.com [81.227.11.245])
        by mail.solidxs.nl (Postfix) with ESMTPA id A14074C80C66;
        Tue, 27 Apr 2021 14:21:33 +0200 (CEST)
From:   Marcel Hamer <marcel@solidxs.se>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, Marcel Hamer <marcel@solidxs.se>
Subject: [PATCH] usb: dwc3: omap: improve extcon initialization
Date:   Tue, 27 Apr 2021 14:21:18 +0200
Message-Id: <20210427122118.1948340-1-marcel@solidxs.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When extcon is used in combination with dwc3, it is assumed that the dwc3
registers are untouched and as such are only configured if VBUS is valid
or ID is tied to ground.

In case VBUS is not valid or ID is floating, the registers are not
configured as such during driver initialization, causing a wrong
default state during boot.

If the registers are not in a default state, because they are for
instance touched by a boot loader, this can cause for a kernel error.

Signed-off-by: Marcel Hamer <marcel@solidxs.se>
---
 drivers/usb/dwc3/dwc3-omap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
index 3db17806e92e..e196673f5c64 100644
--- a/drivers/usb/dwc3/dwc3-omap.c
+++ b/drivers/usb/dwc3/dwc3-omap.c
@@ -437,8 +437,13 @@ static int dwc3_omap_extcon_register(struct dwc3_omap *omap)
 
 		if (extcon_get_state(edev, EXTCON_USB) == true)
 			dwc3_omap_set_mailbox(omap, OMAP_DWC3_VBUS_VALID);
+		else
+			dwc3_omap_set_mailbox(omap, OMAP_DWC3_VBUS_OFF);
+
 		if (extcon_get_state(edev, EXTCON_USB_HOST) == true)
 			dwc3_omap_set_mailbox(omap, OMAP_DWC3_ID_GROUND);
+		else
+			dwc3_omap_set_mailbox(omap, OMAP_DWC3_ID_FLOAT);
 
 		omap->edev = edev;
 	}
-- 
2.25.1

