Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA9243B85D
	for <lists+linux-omap@lfdr.de>; Tue, 26 Oct 2021 19:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237854AbhJZRmS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Oct 2021 13:42:18 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:51778 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237856AbhJZRmP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Oct 2021 13:42:15 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 45A4A2093220
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCH v2 12/22] usb: host: ohci-omap: deny IRQ0
Date:   Tue, 26 Oct 2021 20:39:33 +0300
Message-ID: <20211026173943.6829-13-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211026173943.6829-1-s.shtylyov@omp.ru>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...

Fixes: 489447380a29 ("[PATCH] handle errors returned by platform_get_irq*()")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
Changes in version 2:
- added Alan's ACK.

 drivers/usb/host/ohci-omap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index ded9738392e4..6d5f964d0995 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -309,6 +309,10 @@ static int ohci_hcd_omap_probe(struct platform_device *pdev)
 		retval = -ENXIO;
 		goto err3;
 	}
+	if (!irq) {
+		retval = -EINVAL;
+		goto err3;
+	}
 	retval = usb_add_hcd(hcd, irq, 0);
 	if (retval)
 		goto err3;
-- 
2.26.3

