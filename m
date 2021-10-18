Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD3524326DB
	for <lists+linux-omap@lfdr.de>; Mon, 18 Oct 2021 20:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbhJRSvo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Oct 2021 14:51:44 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:36444 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232216AbhJRSvn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Oct 2021 14:51:43 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 18ADC206F609
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     <linux-omap@vger.kernel.org>
Subject: [PATCH 12/22] usb: host: ohci-omap: deny IRQ0
Date:   Mon, 18 Oct 2021 21:39:20 +0300
Message-ID: <20211018183930.8448-13-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211018183930.8448-1-s.shtylyov@omp.ru>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...

Fixes: 489447380a29 ("[PATCH] handle errors returned by platform_get_irq*()")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
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

