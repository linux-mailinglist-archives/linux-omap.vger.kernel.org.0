Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84495A8D0F
	for <lists+linux-omap@lfdr.de>; Wed,  4 Sep 2019 21:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730156AbfIDQW2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Sep 2019 12:22:28 -0400
Received: from muru.com ([72.249.23.125]:59660 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729890AbfIDQW2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 4 Sep 2019 12:22:28 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9283180F3;
        Wed,  4 Sep 2019 16:22:56 +0000 (UTC)
Date:   Wed, 4 Sep 2019 09:22:23 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Keerthy <j-keerthy@ti.com>,
        linux-omap@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: Linux-next: File system over NFS broken on DRA7/AM5 platforms
Message-ID: <20190904162223.GR52127@atomide.com>
References: <c32b9e04-b230-7634-051b-202868597ec1@ti.com>
 <59564d54-c032-7ca0-3130-6fa7d10f43b7@ti.com>
 <c89bd1cb-be2b-eceb-4c3d-144dc9bb951a@ti.com>
 <17acc359-5938-5f43-3f20-c8de93556748@ti.com>
 <20190903140553.GN52127@atomide.com>
 <20190903152427.GO52127@atomide.com>
 <6fa1c2af-457c-3dbc-74a2-72ae539a48b0@ti.com>
 <20190903170107.GP52127@atomide.com>
 <20190903182906.GQ52127@atomide.com>
 <e67d05c7-b35b-1ddc-ca06-9496c3e28f74@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e67d05c7-b35b-1ddc-ca06-9496c3e28f74@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [190904 11:39]:
> On 03/09/2019 21:29, Tony Lindgren wrote:
> > diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> > --- a/drivers/bus/ti-sysc.c
> > +++ b/drivers/bus/ti-sysc.c
> > @@ -1632,17 +1632,19 @@ static int sysc_init_module(struct sysc *ddata)
> >   	if (error)
> >   		return error;
> > -	if (manage_clocks) {
> > -		sysc_clkdm_deny_idle(ddata);
> > +	sysc_clkdm_deny_idle(ddata);
> > -		error = sysc_enable_opt_clocks(ddata);
> > -		if (error)
> > -			return error;
> > +	/*
> > +	 * Always enable clocks. The bootloader may or may not have enabled
> > +	 * the related clocks.
> > +	 */
> > +	error = sysc_enable_opt_clocks(ddata);
> > +	if (error)
> > +		return error;
> > -		error = sysc_enable_main_clocks(ddata);
> > -		if (error)
> > -			goto err_opt_clocks;
> > -	}
> > +	error = sysc_enable_main_clocks(ddata);
> > +	if (error)
> > +		goto err_opt_clocks;
> >   	if (!(ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT)) {
> >   		error = sysc_rstctrl_reset_deassert(ddata, true);
> 
> 
> -       if (!ddata->legacy_mode && manage_clocks) {
> +       if (!ddata->legacy_mode) {
>                 error = sysc_enable_module(ddata->dev);
>                 if (error)
>                         goto err_main_clocks;
> 
> Module should also enabled here.

You are right, good catch. Maybe this in addition to the clocks is
why some dra7 boards fail to enable cpsw depending on the bootloader?

> > @@ -1677,10 +1679,10 @@ static int sysc_init_module(struct sysc *ddata)
> >   	if (manage_clocks)
> >   		sysc_disable_main_clocks(ddata);
> >   err_opt_clocks:
> > -	if (manage_clocks) {
> > +	if (manage_clocks)
> >   		sysc_disable_opt_clocks(ddata);
> > -		sysc_clkdm_allow_idle(ddata);
> > -	}
> > +
> > +	sysc_clkdm_allow_idle(ddata);
> 
> clkdm doesn't have counters while clock do, so if module is in HW_AUTO
> and clkdm in HW_AUTO - the module can go IDLE between this point and  ti_sysc_idle() call.
> 
> Errate i877 required
> CM_GMAC_CLKSTCTRL[1:0] CLKTRCTRL = 0x2:SW_WKUP.
> to be set at boot time and never changed.
> 
> and
> "In addition to programming SW_WKUP(0x2) on CM_GMAC_CLKSTCTRL, SW should
> also program modulemode field as ENABLED(0x2) on CM_GMAC_GMAC_CLKCTRL
> register."

OK makes sense now thanks. I've dropped that change and added a comment
there. Updated patch below again to test.

Regards,

Tony

8< -------------------
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
@@ -1660,7 +1662,7 @@ static int sysc_init_module(struct sysc *ddata)
 			goto err_main_clocks;
 	}
 
-	if (!ddata->legacy_mode && manage_clocks) {
+	if (!ddata->legacy_mode) {
 		error = sysc_enable_module(ddata->dev);
 		if (error)
 			goto err_main_clocks;
@@ -1677,6 +1679,7 @@ static int sysc_init_module(struct sysc *ddata)
 	if (manage_clocks)
 		sysc_disable_main_clocks(ddata);
 err_opt_clocks:
+	/* No re-enable of clockdomain autoidle to prevent module autoidle */
 	if (manage_clocks) {
 		sysc_disable_opt_clocks(ddata);
 		sysc_clkdm_allow_idle(ddata);
@@ -2357,6 +2360,28 @@ static void ti_sysc_idle(struct work_struct *work)
 
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
@@ -2445,7 +2470,8 @@ static int sysc_probe(struct platform_device *pdev)
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
