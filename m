Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19501C436E
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 00:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728658AbfJAWD3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Oct 2019 18:03:29 -0400
Received: from muru.com ([72.249.23.125]:35072 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726521AbfJAWD2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Oct 2019 18:03:28 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5FBCC811B;
        Tue,  1 Oct 2019 22:03:57 +0000 (UTC)
Date:   Tue, 1 Oct 2019 15:03:21 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-omap@vger.kernel.org,
        vkoul@kernel.org, Bin Liu <b-liu@ti.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        Andrey Skvortsov <andrej.skvortzov@gmail.com>,
        giulio.benetti@benettiengineering.com,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: musb: cppi41: broken high speed FTDI functionality when
 connected to musb directly
Message-ID: <20191001220321.GK5610@atomide.com>
References: <20190927155738.GF5610@atomide.com>
 <CAGm1_kvvMc848f6f+kg5K2sQ3+NHA-Se7T_pcwQfrB=4GfZM4Q@mail.gmail.com>
 <CAGm1_kvZpYH+NP8JfYJWE2v3E9v+yFs20L8MSKsAjfC_g+GmaQ@mail.gmail.com>
 <CAGm1_ktjndofS_N-qh7GVRuJFG1Jn87rf4D8Lt2XMj=+RrL2aw@mail.gmail.com>
 <20190930145711.GG5610@atomide.com>
 <20190930152330.GH5610@atomide.com>
 <20190930195411.6porqtm7tlokgel3@earth.universe>
 <20191001080339.GF13531@localhost>
 <CAGm1_ksg2x9USqB+XGhkMQpA-zc77Ha1-j+foPJFR7R3XPZsNg@mail.gmail.com>
 <20191001164351.GJ5610@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001164351.GJ5610@atomide.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Tony Lindgren <tony@atomide.com> [191001 16:52]:
> * Yegor Yefremov <yegorslists@googlemail.com> [191001 09:20]:
> > I've tried to increase the autosuspend_delay_ms and to set control to
> > "on" but nothing changes. Below you can see the output of my testing
> > script [1] (Py2 only). As one can see, the first cycle i.e. after the
> > port is open for the first time, fails. But the subsequent cycle is
> > successful. If you invoke the script again, everything repeats.
> > 
> > I've also made printk() in cppi41_run_queue() and it looks like this
> > routine will be called from cppi41_dma_issue_pending() only in the
> > beginning of the second test cycle.
> 
> So sounds like for you intially cppi41_dma_issue_pending() has
> !cdd->is_suspended and just adds the request to the queue. And
> then cppi41_run_queue() never gets called if this happens while
> we have cppi41_runtime_resume() is still running?

I got it reproducable here by adding msleep(500) to the beginning
of cppi41_runtime_resume() :) Otherwise I'm only able to trigger
the issue maybe one out of 20 tries it seems.

Turns out the first dma call done by musb_ep_program() must wait
if cppi41 is PM runtime suspended. Otherwise musb_ep_program()
continues with other PIO packets before the DMA transfer is
started.

The patch below fixes it for me with a pm_runtime_get_sync()
in device_prep_slave_sg, so adding Peter and Vinod to Cc.

The other way to fix this would be to just wake up cpp41 in
cppi41_dma_prep_slave_sg() and return NULL so that we can
have musb_ep_program() continue with PIO while cppi41 is
asleep.

Anyways, care to try it out and see if it fixes your issue?

Regards,

Tony

8< ------------------
diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -586,9 +586,18 @@ static struct dma_async_tx_descriptor *cppi41_dma_prep_slave_sg(
 	enum dma_transfer_direction dir, unsigned long tx_flags, void *context)
 {
 	struct cppi41_channel *c = to_cpp41_chan(chan);
+	struct cppi41_dd *cdd = c->cdd;
 	struct cppi41_desc *d;
 	struct scatterlist *sg;
 	unsigned int i;
+	int error;
+
+	error = pm_runtime_get_sync(cdd->ddev.dev);
+	if (error < 0) {
+		pm_runtime_put_noidle(cdd->ddev.dev);
+
+		return NULL;
+	}
 
 	d = c->desc;
 	for_each_sg(sgl, sg, sg_len, i) {
@@ -611,6 +620,9 @@ static struct dma_async_tx_descriptor *cppi41_dma_prep_slave_sg(
 		d++;
 	}
 
+	pm_runtime_mark_last_busy(cdd->ddev.dev);
+	pm_runtime_put_autosuspend(cdd->ddev.dev);
+
 	return &c->txd;
 }
 
-- 
2.23.0
