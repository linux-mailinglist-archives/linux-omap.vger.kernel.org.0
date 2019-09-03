Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9640A7286
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 20:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729653AbfICS3K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 14:29:10 -0400
Received: from muru.com ([72.249.23.125]:59634 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729079AbfICS3K (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Sep 2019 14:29:10 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3951980CF;
        Tue,  3 Sep 2019 18:29:39 +0000 (UTC)
Date:   Tue, 3 Sep 2019 11:29:06 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Keerthy <j-keerthy@ti.com>,
        linux-omap@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: Linux-next: File system over NFS broken on DRA7/AM5 platforms
Message-ID: <20190903182906.GQ52127@atomide.com>
References: <b5f54d5f-4790-7be1-cb65-847a98d2e8dd@ti.com>
 <c32b9e04-b230-7634-051b-202868597ec1@ti.com>
 <59564d54-c032-7ca0-3130-6fa7d10f43b7@ti.com>
 <c89bd1cb-be2b-eceb-4c3d-144dc9bb951a@ti.com>
 <17acc359-5938-5f43-3f20-c8de93556748@ti.com>
 <20190903140553.GN52127@atomide.com>
 <20190903152427.GO52127@atomide.com>
 <6fa1c2af-457c-3dbc-74a2-72ae539a48b0@ti.com>
 <20190903170107.GP52127@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190903170107.GP52127@atomide.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [190903 17:01]:
> * Grygorii Strashko <grygorii.strashko@ti.com> [190903 15:58]:
> > This might be not right thing to do as in probe this operation is delayed
> > sysc_probe()
> > 	pm_runtime_enable(ddata->dev);
> > 	error = pm_runtime_get_sync(ddata->dev);
> > ^^^ above is the first PM runtime get call, so it might be bette to keep module active
> 
> Oh OK, yeah that needs some more thinking.
> 
> > ^^^ by the way, CPSW will fail here with "ti,no-idle" removed
> 
> > 	if (ddata->cfg.quirks & (SYSC_QUIRK_NO_IDLE_ON_INIT |
> > 				 SYSC_QUIRK_NO_RESET_ON_INIT)) {
> > 		schedule_delayed_work(&ddata->idle_work, 3000);
> > 
> > ^^ and check and double disable module in first PM runtime suspend
> > 	} else {
> 
> Hmm yeah that might work.

Actually we can just decrement the clocks in ti_sysc_idle()
since we have it already available.

> > > +	sysc_clkdm_allow_idle(ddata);
> > 
> > No. if SYSC_QUIRK_NO_IDLE is set we can't do above
> 
> Well we should pair here since we call it unconditionally. The
> calls for sysc_clkdm_deny_idle() and sysc_clkdm_allow_idle()
> are only needed when enabling or disabling the clocks.

I've kept the sysc_clkdm_allow_idle() change to keep things
paired locally. That is assuming you don't come up with good
reasons to not do it :)

Updated patch below to play with.
Regards,

Tony

8< ---------------------
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1632,17 +1632,19 @@ static int sysc_init_module(struct sysc *ddata)
 	if (error)
 		return error;
 
-	if (manage_clocks) {
-		sysc_clkdm_deny_idle(ddata);
+	sysc_clkdm_deny_idle(ddata);
 
-		error = sysc_enable_opt_clocks(ddata);
-		if (error)
-			return error;
+	/*
+	 * Always enable clocks. The bootloader may or may not have enabled
+	 * the related clocks.
+	 */
+	error = sysc_enable_opt_clocks(ddata);
+	if (error)
+		return error;
 
-		error = sysc_enable_main_clocks(ddata);
-		if (error)
-			goto err_opt_clocks;
-	}
+	error = sysc_enable_main_clocks(ddata);
+	if (error)
+		goto err_opt_clocks;
 
 	if (!(ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT)) {
 		error = sysc_rstctrl_reset_deassert(ddata, true);
@@ -1677,10 +1679,10 @@ static int sysc_init_module(struct sysc *ddata)
 	if (manage_clocks)
 		sysc_disable_main_clocks(ddata);
 err_opt_clocks:
-	if (manage_clocks) {
+	if (manage_clocks)
 		sysc_disable_opt_clocks(ddata);
-		sysc_clkdm_allow_idle(ddata);
-	}
+
+	sysc_clkdm_allow_idle(ddata);
 
 	return error;
 }
@@ -2357,6 +2359,28 @@ static void ti_sysc_idle(struct work_struct *work)
 
 	ddata = container_of(work, struct sysc, idle_work.work);
 
+	/*
+	 * One time decrement of clock usage counts if left on from init.
+	 * Note that we disable opt clocks unconditionally in this case
+	 * as they are enabled unconditionally during init without
+	 * considering sysc_opt_clks_needed() at that point.
+	 */
+	if (ddata->cfg.quirks & (SYSC_QUIRK_NO_IDLE |
+				 SYSC_QUIRK_NO_IDLE_ON_INIT)) {
+		sysc_clkdm_deny_idle(ddata);
+		sysc_disable_main_clocks(ddata);
+		sysc_disable_opt_clocks(ddata);
+		sysc_clkdm_allow_idle(ddata);
+	}
+
+	/* Keep permanent PM runtime usage count for SYSC_QUIRK_NO_IDLE */
+	if (ddata->cfg.quirks & SYSC_QUIRK_NO_IDLE)
+		return;
+
+	/*
+	 * Decrement PM runtime usage count for SYSC_QUIRK_NO_IDLE_ON_INIT
+	 * and SYSC_QUIRK_NO_RESET_ON_INIT
+	 */
 	if (pm_runtime_active(ddata->dev))
 		pm_runtime_put_sync(ddata->dev);
 }
@@ -2445,7 +2469,8 @@ static int sysc_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&ddata->idle_work, ti_sysc_idle);
 
 	/* At least earlycon won't survive without deferred idle */
-	if (ddata->cfg.quirks & (SYSC_QUIRK_NO_IDLE_ON_INIT |
+	if (ddata->cfg.quirks & (SYSC_QUIRK_NO_IDLE |
+				 SYSC_QUIRK_NO_IDLE_ON_INIT |
 				 SYSC_QUIRK_NO_RESET_ON_INIT)) {
 		schedule_delayed_work(&ddata->idle_work, 3000);
 	} else {
-- 
2.23.0
