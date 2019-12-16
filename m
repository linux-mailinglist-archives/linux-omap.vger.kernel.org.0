Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA41B11FD2B
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2019 04:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfLPDQl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Dec 2019 22:16:41 -0500
Received: from muru.com ([72.249.23.125]:48414 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbfLPDQl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 15 Dec 2019 22:16:41 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9F7B380C5;
        Mon, 16 Dec 2019 03:17:19 +0000 (UTC)
Date:   Sun, 15 Dec 2019 19:16:37 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH] w1: omap-hdq: Simplify driver with PM runtime autosuspend
Message-ID: <20191216031637.GM35479@atomide.com>
References: <20191215173817.47918-1-tony@atomide.com>
 <20191215230331.645b9064@aktux>
 <20191216030948.GL35479@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191216030948.GL35479@atomide.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [191216 03:10]:
> Hi,
> 
> * Andreas Kemnade <andreas@kemnade.info> [191215 22:04]:
> > On Sun, 15 Dec 2019 09:38:17 -0800
> > If I remember correctly this thing is critical to get the hwmod out of
> > reset but I need to examine that again:
> 
> Thanks for testing, yes that's what I thought might cause it
> too, but nope :)
> 
> We currently disable interrupts for some reason after
> the first read. That won't play with runtime PM autosuspend
> at all as we never enable them again until the device has
> idled. Can you try the following additional patch on top?

And we should probably do the following too to make sure
the mode is initialized before we call runtime PM.

Regards,

Tony

8< -------------------
diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
--- a/drivers/w1/masters/omap_hdq.c
+++ b/drivers/w1/masters/omap_hdq.c
@@ -565,6 +565,15 @@ static int omap_hdq_probe(struct platform_device *pdev)
 
 	mutex_init(&hdq_data->hdq_mutex);
 
+	ret = of_property_read_string(pdev->dev.of_node, "ti,mode", &mode);
+	if (ret < 0 || !strcmp(mode, "hdq")) {
+		hdq_data->mode = 0;
+		omap_w1_master.search = omap_w1_search_bus;
+	} else {
+		hdq_data->mode = 1;
+		omap_w1_master.triplet = omap_w1_triplet;
+	}
+
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 300);
@@ -599,15 +608,6 @@ static int omap_hdq_probe(struct platform_device *pdev)
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
-	ret = of_property_read_string(pdev->dev.of_node, "ti,mode", &mode);
-	if (ret < 0 || !strcmp(mode, "hdq")) {
-		hdq_data->mode = 0;
-		omap_w1_master.search = omap_w1_search_bus;
-	} else {
-		hdq_data->mode = 1;
-		omap_w1_master.triplet = omap_w1_triplet;
-	}
-
 	omap_w1_master.data = hdq_data;
 
 	ret = w1_add_master_device(&omap_w1_master);
