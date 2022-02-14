Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB4B4B512C
	for <lists+linux-omap@lfdr.de>; Mon, 14 Feb 2022 14:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343987AbiBNNIQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Feb 2022 08:08:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233705AbiBNNIP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 14 Feb 2022 08:08:15 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 740324B85D
        for <linux-omap@vger.kernel.org>; Mon, 14 Feb 2022 05:08:07 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 501AE80DE;
        Mon, 14 Feb 2022 13:07:29 +0000 (UTC)
Date:   Mon, 14 Feb 2022 15:08:04 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Romain Naour <romain.naour@smile.fr>
Cc:     linux-omap@vger.kernel.org
Subject: Re: AM5749: tty serial 8250 omap driver crash
Message-ID: <YgpUNMAiXgu+vrtl@atomide.com>
References: <2c80fd8a-2935-9a6d-43fd-f95fa53c93d2@smile.fr>
 <YgDSj7FJS7nbkJol@atomide.com>
 <e3cf5082-b494-9309-6878-da208920fa5a@smile.fr>
 <YgT/fhpFQfkj1b0j@atomide.com>
 <9f0cb8f9-ac94-eb50-266a-95df521a7360@smile.fr>
 <YgoIMPZd7bi6XDGW@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgoIMPZd7bi6XDGW@atomide.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [220214 07:43]:
> Looks like the following script to just toggle the module state locks
> up things for me on beagle-x15 very fast. So yeah now I'm able to
> reproduce the issue. Seems like the module is not ready right after
> enabling it live we've seen for dra7 iva for example.

Looks like the following patch is also needed for uarts to avoid unbind
clock_unprepare warnings. But even with this patch dra7 uarts won't behave.
On unbind, there will be a clock "l4per-clkctrl:0128:0: failed to disable"
warning. Looks like after that any following clock enable does not seem to
work and that will cause the register access errors.

Looks like this is a dra7 specific issue as a similar test script on omap4
duovero keeps on going instead.

Regards,

Tony

8< --------------
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -3381,7 +3381,9 @@ static int sysc_remove(struct platform_device *pdev)
 	struct sysc *ddata = platform_get_drvdata(pdev);
 	int error;
 
-	cancel_delayed_work_sync(&ddata->idle_work);
+	/* Device can still be enabled, see deferred idle quirk in probe */
+	if (cancel_delayed_work_sync(&ddata->idle_work))
+		ti_sysc_idle(&ddata->idle_work.work);
 
 	error = pm_runtime_resume_and_get(ddata->dev);
 	if (error < 0) {
