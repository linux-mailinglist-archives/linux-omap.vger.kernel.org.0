Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58E8CC8EFD
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 18:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbfJBQwY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 12:52:24 -0400
Received: from muru.com ([72.249.23.125]:35130 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726076AbfJBQwY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Oct 2019 12:52:24 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 66A7D80E1;
        Wed,  2 Oct 2019 16:52:55 +0000 (UTC)
Date:   Wed, 2 Oct 2019 09:52:19 -0700
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
Message-ID: <20191002165219.GL5610@atomide.com>
References: <CAGm1_kvZpYH+NP8JfYJWE2v3E9v+yFs20L8MSKsAjfC_g+GmaQ@mail.gmail.com>
 <CAGm1_ktjndofS_N-qh7GVRuJFG1Jn87rf4D8Lt2XMj=+RrL2aw@mail.gmail.com>
 <20190930145711.GG5610@atomide.com>
 <20190930152330.GH5610@atomide.com>
 <20190930195411.6porqtm7tlokgel3@earth.universe>
 <20191001080339.GF13531@localhost>
 <CAGm1_ksg2x9USqB+XGhkMQpA-zc77Ha1-j+foPJFR7R3XPZsNg@mail.gmail.com>
 <20191001164351.GJ5610@atomide.com>
 <20191001220321.GK5610@atomide.com>
 <CAGm1_kv12P1hb7PXSQUo3EXXrCUCQV0ptoQpxewGYHJgROL=cQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_kv12P1hb7PXSQUo3EXXrCUCQV0ptoQpxewGYHJgROL=cQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Yegor Yefremov <yegorslists@googlemail.com> [191002 06:57]:
> On Wed, Oct 2, 2019 at 12:03 AM Tony Lindgren <tony@atomide.com> wrote:
> > The other way to fix this would be to just wake up cpp41 in
> > cppi41_dma_prep_slave_sg() and return NULL so that we can
> > have musb_ep_program() continue with PIO while cppi41 is
> > asleep.
> >
> > Anyways, care to try it out and see if it fixes your issue?
>
> The fix is working but on the first invocation, I get this output
> (minicom provokes the same output):
 
> # serialtest.py -c 2 /dev/ttyUSB0 /dev/ttyUSB0
...
> [  210.940612] [<c065fc94>] (__rpm_callback) from [<c065fd60>]
> (rpm_callback+0x20/0x80)
> [  210.948402] [<c065fd60>] (rpm_callback) from [<c065f7cc>]
> (rpm_resume+0x468/0x7a0)
> [  210.956018] [<c065f7cc>] (rpm_resume) from [<c065fb50>]
> (__pm_runtime_resume+0x4c/0x64)
> [  210.964086] [<c065fb50>] (__pm_runtime_resume) from [<bf020940>]
> (cppi41_dma_prep_slave_sg+0x20/0xfc [cppi41])

OK so that won't work, thanks for testing. Here's the alternative
patch to try along the lines described above that just wakes up
cppi41 and returns NULL so musb_ep_program() can continue with PIO
until cppi41 is awake.

Regards,

Tony

8< -----------------------
diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -586,9 +586,22 @@ static struct dma_async_tx_descriptor *cppi41_dma_prep_slave_sg(
 	enum dma_transfer_direction dir, unsigned long tx_flags, void *context)
 {
 	struct cppi41_channel *c = to_cpp41_chan(chan);
+	struct dma_async_tx_descriptor *txd = NULL;
+	struct cppi41_dd *cdd = c->cdd;
 	struct cppi41_desc *d;
 	struct scatterlist *sg;
 	unsigned int i;
+	int error;
+
+	error = pm_runtime_get(cdd->ddev.dev);
+	if (error < 0) {
+		pm_runtime_put_noidle(cdd->ddev.dev);
+
+		return NULL;
+	}
+
+	if (cdd->is_suspended)
+		goto err_out_not_ready;
 
 	d = c->desc;
 	for_each_sg(sgl, sg, sg_len, i) {
@@ -611,7 +624,13 @@ static struct dma_async_tx_descriptor *cppi41_dma_prep_slave_sg(
 		d++;
 	}
 
-	return &c->txd;
+	txd = &c->txd;
+
+err_out_not_ready:
+	pm_runtime_mark_last_busy(cdd->ddev.dev);
+	pm_runtime_put_autosuspend(cdd->ddev.dev);
+
+	return txd;
 }
 
 static void cppi41_compute_td_desc(struct cppi41_desc *d)
-- 
2.23.0
