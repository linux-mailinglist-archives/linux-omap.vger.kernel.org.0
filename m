Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDDD6B32B7
	for <lists+linux-omap@lfdr.de>; Mon, 16 Sep 2019 01:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfIOXxS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Sep 2019 19:53:18 -0400
Received: from muru.com ([72.249.23.125]:33052 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727109AbfIOXxS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 15 Sep 2019 19:53:18 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BA4B480BB;
        Sun, 15 Sep 2019 23:53:49 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH] usb: musb: Cancel delayed work on host controller rmmod
Date:   Sun, 15 Sep 2019 16:53:15 -0700
Message-Id: <20190915235315.54749-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If we rmmod the musb host controller with gadgets configured,
musb_gadget_stop() gets called. We need to also flush the delayed
work.

Fixes: 2bff3916fda9 ("usb: musb: Fix PM for hub disconnect")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/musb_gadget.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1910,6 +1910,7 @@ static int musb_gadget_stop(struct usb_gadget *g)
 
 	/* Force check of devctl register for PM runtime */
 	schedule_delayed_work(&musb->irq_work, 0);
+	flush_delayed_work(&musb->irq_work);
 
 	pm_runtime_mark_last_busy(musb->controller);
 	pm_runtime_put_autosuspend(musb->controller);
-- 
2.23.0
