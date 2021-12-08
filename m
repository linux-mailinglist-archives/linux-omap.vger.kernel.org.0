Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF1446DC02
	for <lists+linux-omap@lfdr.de>; Wed,  8 Dec 2021 20:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233594AbhLHTZR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Dec 2021 14:25:17 -0500
Received: from mxout01.lancloud.ru ([45.84.86.81]:42572 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239940AbhLHTY7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Dec 2021 14:24:59 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 91E2D209719A
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCH v2 09/10] usb: host: ohci-omap: fix deferred probing
Date:   Wed, 8 Dec 2021 22:21:17 +0300
Message-ID: <20211208192118.7483-10-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211208192118.7483-1-s.shtylyov@omp.ru>
References: <20211208192118.7483-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The driver overrides the error codes returned by platform_get_irq() to
-ENXIO for some strange reason, so if it returns -EPROBE_DEFER, the driver
will fail the probe permanently instead of the deferred probing. Switch to
propagating the error codes upstream.

Fixes: 60bbfc84b6d9 ("USB OHCI controller support for PNX4008")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
Changes in version 2:
- refreshed the patch.

 drivers/usb/host/ohci-omap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index ded9738392e4..45dcf8292072 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -306,7 +306,7 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		retval = -ENXIO;
+		retval = irq;
 		goto err3;
 	}
 	retval = usb_add_hcd(hcd, irq, 0);
-- 
2.26.3

