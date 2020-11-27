Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113A82C6BFD
	for <lists+linux-omap@lfdr.de>; Fri, 27 Nov 2020 20:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729330AbgK0TaO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Nov 2020 14:30:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56728 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730098AbgK0TF6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 27 Nov 2020 14:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606503919;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=P4J8EBWPnBVFoHBHwgQRXiVw93w2If7dqdzr9ZCw24E=;
        b=GagEkA9rSJUY+3Kk0NLoDk6fGvYMhc2QV78uZlpYFqu72+prMISH7hclQFyAyziHOwOANW
        sgCwtqvoqfbBPdT4ekzKjMIBZAd8kv96PkQGRXveuqRvEGwSoZBgTpmmk7DBOLVbt/LSJK
        00AoW7LeGp3gA1i/kvlcVFzXZNASaLM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-WdH6WSW3M1C1tnJrRFysrQ-1; Fri, 27 Nov 2020 14:05:17 -0500
X-MC-Unique: WdH6WSW3M1C1tnJrRFysrQ-1
Received: by mail-qt1-f197.google.com with SMTP id i20so3755120qtr.0
        for <linux-omap@vger.kernel.org>; Fri, 27 Nov 2020 11:05:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=P4J8EBWPnBVFoHBHwgQRXiVw93w2If7dqdzr9ZCw24E=;
        b=rJq8DDLo2JFGIAYol+I2jZIChkPRrFWpkwzkGeZ8nSrsFCtSDyeO8x1rDSaGzCcgcW
         +R/DydhRZKXzkFq2eRibvzQiZXvMzS4xjsY0O8WsBdFn3F3Ay4R9DW248xRFmIkcYfSN
         uhDC8mvrdENDhCOw+5i/91cfkfK8kWTW7NGpXHb3G8i5s2A+RBTMP0TiMFc//aU3vVHq
         iKyxzX9o8j79VdQebrq4lvoFbTy/FE4ACrlNMLZwyj/iCV+MjSjq8N/WEc6yKnGxLJsr
         zqJxHPTJoWcBs/FX+hW9lbOu9Ogu2iSRNvewUEn1ezulPgsP1yFWoJaGJbSvt60MGW88
         G+3g==
X-Gm-Message-State: AOAM533E7/PRo0pcxzU3VWlXLNgYwgh9BrdRTsLYwZ56NGYnBzlHjrq3
        gBNLQeml/Yk08Hf+jXwBoNw2HY8iiJxdfkOfF1YG6O1vvj+wTtwJiAeDZ52iAPeO8G4XHj7TP9i
        sueXsoz7tYSvwYpQTB0kvrQ==
X-Received: by 2002:a05:620a:22eb:: with SMTP id p11mr10254701qki.224.1606503916861;
        Fri, 27 Nov 2020 11:05:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlHMd5iGgdFcDE7TXlKessUY1X4ETN8EOl5uRxiIteKlzhnCF61nP8e6tAtR4EIGlPYbb+vw==
X-Received: by 2002:a05:620a:22eb:: with SMTP id p11mr10254684qki.224.1606503916681;
        Fri, 27 Nov 2020 11:05:16 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id k128sm6806898qkd.48.2020.11.27.11.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 11:05:16 -0800 (PST)
From:   trix@redhat.com
To:     b.zolnierkie@samsung.com, pakki001@umn.edu
Cc:     linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] omapfb: fbcon: remove trailing semicolon in macro definition
Date:   Fri, 27 Nov 2020 11:05:08 -0800
Message-Id: <20201127190508.2842786-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tom Rix <trix@redhat.com>

The macro use will already have a semicolon.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c | 2 +-
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c
index 3417618310ff..cc2ad787d493 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc-compat.c
@@ -75,7 +75,7 @@ static void dispc_dump_irqs(struct seq_file *s)
 
 	seq_printf(s, "irqs %d\n", stats.irq_count);
 #define PIS(x) \
-	seq_printf(s, "%-20s %10d\n", #x, stats.irqs[ffs(DISPC_IRQ_##x)-1]);
+	seq_printf(s, "%-20s %10d\n", #x, stats.irqs[ffs(DISPC_IRQ_##x)-1])
 
 	PIS(FRAMEDONE);
 	PIS(VSYNC);
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
index 6f9c25fec994..101fa66f9b58 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -1554,7 +1554,7 @@ static void dsi_dump_dsidev_irqs(struct platform_device *dsidev,
 
 	seq_printf(s, "irqs %d\n", stats.irq_count);
 #define PIS(x) \
-	seq_printf(s, "%-20s %10d\n", #x, stats.dsi_irqs[ffs(DSI_IRQ_##x)-1]);
+	seq_printf(s, "%-20s %10d\n", #x, stats.dsi_irqs[ffs(DSI_IRQ_##x)-1])
 
 	seq_printf(s, "-- DSI%d interrupts --\n", dsi->module_id + 1);
 	PIS(VC0);
-- 
2.18.4

