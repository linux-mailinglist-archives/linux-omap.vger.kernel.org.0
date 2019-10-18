Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39D18DCB00
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 18:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389310AbfJRQaJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 12:30:09 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37941 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732948AbfJRQaJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 12:30:09 -0400
Received: by mail-wr1-f65.google.com with SMTP id o15so6497661wru.5;
        Fri, 18 Oct 2019 09:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lJc0hj7tQVxDAaGjfCOv7vwr1QfJ/5Ay/O35J4hdg0E=;
        b=W34HiTmzG0Wkh8A4mK+ZBdO7Aae+UoxMX9i9O7wdsm3reQ/ZEtdu3N4gw0ACWa8nbe
         bpAzAeXA+eqX577RWAm+tQVEQNxRs/1GBLc1TlbBsfMvvme0U/x7Eb1DuRhjJLNIPkhe
         ooAQtfe2s6JHbVqwyj6nDJiDFV57IXFscjR0vUXmroN10dCjWUV2pMbbyeds/UYgy5sY
         zNVyoJbEmrWGwDSPlUh4BpS9OyhC0mgDHuWjGZ+CUu0rKVG7nxzrEKjihpX8SvUvsnlV
         URGpEeu27I3kqsfnJUqoSHj+bzMoZHrhTcGOsbC/rwnDWn6TUGXE6Y4ZY9P0ltJZgFjJ
         UdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lJc0hj7tQVxDAaGjfCOv7vwr1QfJ/5Ay/O35J4hdg0E=;
        b=Vp1Ycb7Vt1noBRj3fBkas+grtSsIyuCJlb68XVhJXQStmSRmnvvvj2V8a3kLvkJuox
         rYSjZLZ0sCO1dBsTd6H8WaiifTxkLDyJufS8CY8v9W06GSDeoRJsS5ypbrcafoLUuYAO
         uHNU1sQ3wLz7QZA5zXkj/haeT5pnBpNJOQhqz1k7Aa+YI6R7TxRd5FgyaJUBgIaf3vGK
         vH21RA8fGvN2r549IVBKWtsubvt5vl+RIHdlZFGf6P47vcf20UzH1Zz67fmoeUWzXyTn
         UYHw1ma5SaapZGO0nNr0731Fxx8IiiH8JhO3z95nUhY89w2hde6wlheSB9Vzrdi1npxn
         wSfw==
X-Gm-Message-State: APjAAAV5K+sL8mQKAX9BLW7jtK4zW+IBDie/GXeiLJxijCpAGfCrdiE6
        KVobB3zG/9pKhQrjCy0nbgw=
X-Google-Smtp-Source: APXvYqyYIv1KczmfhzvFNVLt5B5gajKUiA+enUgcWK2XtyuUq3g+DU3XrKJg4cwXJvIMYHUnnEdVSA==
X-Received: by 2002:a5d:484e:: with SMTP id n14mr8206328wrs.110.1571416206126;
        Fri, 18 Oct 2019 09:30:06 -0700 (PDT)
Received: from debian.office.codethink.co.uk. ([78.40.148.180])
        by smtp.gmail.com with ESMTPSA id m16sm5010123wml.11.2019.10.18.09.30.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Oct 2019 09:30:05 -0700 (PDT)
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] omapfb: reduce stack usage
Date:   Fri, 18 Oct 2019 17:30:04 +0100
Message-Id: <20191018163004.23498-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The build of xtensa allmodconfig is giving a warning of:
In function 'dsi_dump_dsidev_irqs':
warning: the frame size of 1120 bytes is larger than 1024 bytes

Allocate the memory for 'struct dsi_irq_stats' dynamically instead
of assigning it in stack.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
index d620376216e1..43402467bf40 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -1536,22 +1536,25 @@ static void dsi_dump_dsidev_irqs(struct platform_device *dsidev,
 {
 	struct dsi_data *dsi = dsi_get_dsidrv_data(dsidev);
 	unsigned long flags;
-	struct dsi_irq_stats stats;
+	struct dsi_irq_stats *stats;
 
+	stats = kmalloc(sizeof(*stats), GFP_KERNEL);
+	if (!stats)
+		return;
 	spin_lock_irqsave(&dsi->irq_stats_lock, flags);
 
-	stats = dsi->irq_stats;
+	memcpy(stats, &dsi->irq_stats, sizeof(*stats));
 	memset(&dsi->irq_stats, 0, sizeof(dsi->irq_stats));
 	dsi->irq_stats.last_reset = jiffies;
 
 	spin_unlock_irqrestore(&dsi->irq_stats_lock, flags);
 
 	seq_printf(s, "period %u ms\n",
-			jiffies_to_msecs(jiffies - stats.last_reset));
+			jiffies_to_msecs(jiffies - stats->last_reset));
 
-	seq_printf(s, "irqs %d\n", stats.irq_count);
+	seq_printf(s, "irqs %d\n", stats->irq_count);
 #define PIS(x) \
-	seq_printf(s, "%-20s %10d\n", #x, stats.dsi_irqs[ffs(DSI_IRQ_##x)-1]);
+	seq_printf(s, "%-20s %10d\n", #x, stats->dsi_irqs[ffs(DSI_IRQ_##x)-1]);
 
 	seq_printf(s, "-- DSI%d interrupts --\n", dsi->module_id + 1);
 	PIS(VC0);
@@ -1575,10 +1578,10 @@ static void dsi_dump_dsidev_irqs(struct platform_device *dsidev,
 
 #define PIS(x) \
 	seq_printf(s, "%-20s %10d %10d %10d %10d\n", #x, \
-			stats.vc_irqs[0][ffs(DSI_VC_IRQ_##x)-1], \
-			stats.vc_irqs[1][ffs(DSI_VC_IRQ_##x)-1], \
-			stats.vc_irqs[2][ffs(DSI_VC_IRQ_##x)-1], \
-			stats.vc_irqs[3][ffs(DSI_VC_IRQ_##x)-1]);
+			stats->vc_irqs[0][ffs(DSI_VC_IRQ_##x)-1], \
+			stats->vc_irqs[1][ffs(DSI_VC_IRQ_##x)-1], \
+			stats->vc_irqs[2][ffs(DSI_VC_IRQ_##x)-1], \
+			stats->vc_irqs[3][ffs(DSI_VC_IRQ_##x)-1]);
 
 	seq_printf(s, "-- VC interrupts --\n");
 	PIS(CS);
@@ -1594,7 +1597,7 @@ static void dsi_dump_dsidev_irqs(struct platform_device *dsidev,
 
 #define PIS(x) \
 	seq_printf(s, "%-20s %10d\n", #x, \
-			stats.cio_irqs[ffs(DSI_CIO_IRQ_##x)-1]);
+			stats->cio_irqs[ffs(DSI_CIO_IRQ_##x)-1]);
 
 	seq_printf(s, "-- CIO interrupts --\n");
 	PIS(ERRSYNCESC1);
@@ -1618,6 +1621,7 @@ static void dsi_dump_dsidev_irqs(struct platform_device *dsidev,
 	PIS(ULPSACTIVENOT_ALL0);
 	PIS(ULPSACTIVENOT_ALL1);
 #undef PIS
+	kfree(stats);
 }
 
 static void dsi1_dump_irqs(struct seq_file *s)
-- 
2.11.0

