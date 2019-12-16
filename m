Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBBB611FD24
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2019 04:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbfLPDJw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Dec 2019 22:09:52 -0500
Received: from muru.com ([72.249.23.125]:48390 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726808AbfLPDJw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 15 Dec 2019 22:09:52 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 692DB80C5;
        Mon, 16 Dec 2019 03:10:30 +0000 (UTC)
Date:   Sun, 15 Dec 2019 19:09:48 -0800
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
Message-ID: <20191216030948.GL35479@atomide.com>
References: <20191215173817.47918-1-tony@atomide.com>
 <20191215230331.645b9064@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191215230331.645b9064@aktux>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Andreas Kemnade <andreas@kemnade.info> [191215 22:04]:
> On Sun, 15 Dec 2019 09:38:17 -0800
> If I remember correctly this thing is critical to get the hwmod out of
> reset but I need to examine that again:

Thanks for testing, yes that's what I thought might cause it
too, but nope :)

We currently disable interrupts for some reason after
the first read. That won't play with runtime PM autosuspend
at all as we never enable them again until the device has
idled. Can you try the following additional patch on top?

Regards,

Tony

8< -----------------
diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
--- a/drivers/w1/masters/omap_hdq.c
+++ b/drivers/w1/masters/omap_hdq.c
@@ -86,15 +86,6 @@ static inline u8 hdq_reg_merge(struct hdq_data *hdq_data, u32 offset,
 	return new_val;
 }
 
-static void hdq_disable_interrupt(struct hdq_data *hdq_data, u32 offset,
-				  u32 mask)
-{
-	u32 ie;
-
-	ie = readl(hdq_data->hdq_base + offset);
-	writel(ie & mask, hdq_data->hdq_base + offset);
-}
-
 /*
  * Wait for one or more bits in flag change.
  * HDQ_FLAG_SET: wait until any bit in the flag is set.
@@ -474,15 +465,9 @@ static u8 omap_w1_read_byte(void *_hdq)
 	}
 
 	ret = hdq_read_byte(hdq_data, &val);
-	if (ret) {
+	if (ret)
 		ret = -1;
-		goto out_err;
-	}
 
-	hdq_disable_interrupt(hdq_data, OMAP_HDQ_CTRL_STATUS,
-			      ~OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK);
-
-out_err:
 	pm_runtime_mark_last_busy(hdq_data->dev);
 	pm_runtime_put_autosuspend(hdq_data->dev);
 
