Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E538EA7141
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 19:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729746AbfICRBM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 13:01:12 -0400
Received: from muru.com ([72.249.23.125]:59626 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729705AbfICRBM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Sep 2019 13:01:12 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id ABF5480CF;
        Tue,  3 Sep 2019 17:01:40 +0000 (UTC)
Date:   Tue, 3 Sep 2019 10:01:07 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Keerthy <j-keerthy@ti.com>,
        linux-omap@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: Linux-next: File system over NFS broken on DRA7/AM5 platforms
Message-ID: <20190903170107.GP52127@atomide.com>
References: <b5f54d5f-4790-7be1-cb65-847a98d2e8dd@ti.com>
 <c32b9e04-b230-7634-051b-202868597ec1@ti.com>
 <59564d54-c032-7ca0-3130-6fa7d10f43b7@ti.com>
 <c89bd1cb-be2b-eceb-4c3d-144dc9bb951a@ti.com>
 <17acc359-5938-5f43-3f20-c8de93556748@ti.com>
 <20190903140553.GN52127@atomide.com>
 <20190903152427.GO52127@atomide.com>
 <6fa1c2af-457c-3dbc-74a2-72ae539a48b0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fa1c2af-457c-3dbc-74a2-72ae539a48b0@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [190903 15:58]:
> 
> 
> On 03/09/2019 18:24, Tony Lindgren wrote:
> > * Tony Lindgren <tony@atomide.com> [190903 14:06]:
> > > * Grygorii Strashko <grygorii.strashko@ti.com> [190903 12:46]:
> > > > > The clock definition itself looks fine, however the question is why does someone try to disable it while it
> > > >   is apparently still used (by NFS that is)? If it fails to disable, clock core is trying to disable it, but the IDLEST bit does not switch for some reason.
> > > > 
> > > > I've tried to disable "ti,no-idle" in DT for dra7 cpsw and got below failure
> > > > 
> > > > [    0.634530] gmac-clkctrl:0000:0: failed to enable 08070002
> > > > [    0.634557] ti-sysc: probe of 48485200.target-module failed with error -16
> > > > 
> > > > so samthing is not right with GMAC clocks as it should probe without "ti,no-idle".
> > > > 
> > > > 
> > > > original place of the issue is:
> > > > 
> > > > cpsw_probe()
> > > >   -> pm_runtime_get_sync()
> > > >      -> sysc_runtime_resume()
> > > >         -> sysc_enable_main_clocks()
> > > > 
> > > > Note. the sysc_init_module() for "ti,no-idle" case looks a little bit strange as there is
> > > > no guarantee that target-module or clock were enabled before.
> > > 
> > > Good point on the "ti,no-idle" handling. That is easy to fix by always enabling
> > > the clocks. The "ti,no-idle-on-init" handling needs probably a flag set for
> > > PM runtime.
> > 
> > The following should fix the clock handling for "ti,no-idle" and
> 
> It does - i have mostly similar diff. I've posted it below for you reference -
>  feel free to reuse or combine.

OK

> Note. pm_runtime_get_noresume() in my patch should be done only for SYSC_QUIRK_NO_IDLE.

Hmm so what would pm_runtime_get_noresume() for SYSC_QUIRK_NO_IDLE_ON_INIT?
The PM runtime callbacks will run in that case.

> > "ti,no-idle-on-init". Sounds like we still might have other issues
> > left though based on removing "ti,no-idle"?
> 
> Yes. if you remove "ti,no-idle" cpsw 48485200.target-module will fail to probe at all.
> 
> X15 may boot due to u-boot differences.

Maybe we have missing assigned-clocks and assigned-clock-parents for
one of the clocks?

> > +	if (unlikely(ddata->clocks_enabled_from_init)) {
> > +		sysc_disable_main_clocks(ddata);
> > +		sysc_disable_opt_clocks(ddata);
> > +		ddata->clocks_enabled_from_init = false;
> > +	}
> > +
> 
> This might be not right thing to do as in probe this operation is delayed
> sysc_probe()
> 	pm_runtime_enable(ddata->dev);
> 	error = pm_runtime_get_sync(ddata->dev);
> ^^^ above is the first PM runtime get call, so it might be bette to keep module active

Oh OK, yeah that needs some more thinking.

> ^^^ by the way, CPSW will fail here with "ti,no-idle" removed

> 	if (ddata->cfg.quirks & (SYSC_QUIRK_NO_IDLE_ON_INIT |
> 				 SYSC_QUIRK_NO_RESET_ON_INIT)) {
> 		schedule_delayed_work(&ddata->idle_work, 3000);
> 
> ^^ and check and double disable module in first PM runtime suspend
> 	} else {

Hmm yeah that might work.

> > +	sysc_clkdm_allow_idle(ddata);
> 
> No. if SYSC_QUIRK_NO_IDLE is set we can't do above

Well we should pair here since we call it unconditionally. The
calls for sysc_clkdm_deny_idle() and sysc_clkdm_allow_idle()
are only needed when enabling or disabling the clocks.

> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> index 9207ac291341..04e2f87799b1 100644
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -1632,17 +1632,15 @@ static int sysc_init_module(struct sysc *ddata)
>         if (error)
>                 return error;
> -       if (manage_clocks) {
> -               sysc_clkdm_deny_idle(ddata);
> +       sysc_clkdm_deny_idle(ddata);
> -               error = sysc_enable_opt_clocks(ddata);
> -               if (error)
> -                       return error;
> +       error = sysc_enable_opt_clocks(ddata);
> +       if (error)
> +               return error;
> -               error = sysc_enable_main_clocks(ddata);
> -               if (error)
> -                       goto err_opt_clocks;
> -       }
> +       error = sysc_enable_main_clocks(ddata);
> +       if (error)
> +               goto err_opt_clocks;
>         if (!(ddata->cfg.quirks & SYSC_QUIRK_NO_RESET_ON_INIT)) {
>                 error = sysc_rstctrl_reset_deassert(ddata, true);
> @@ -1660,7 +1658,7 @@ static int sysc_init_module(struct sysc *ddata)
>                         goto err_main_clocks;
>         }
> -       if (!ddata->legacy_mode && manage_clocks) {
> +       if (!ddata->legacy_mode) {
>                 error = sysc_enable_module(ddata->dev);
>                 if (error)
>                         goto err_main_clocks;
> @@ -1673,6 +1671,9 @@ static int sysc_init_module(struct sysc *ddata)
>         if (!ddata->legacy_mode && manage_clocks)
>                 sysc_disable_module(ddata->dev);
> +       if (!manage_clocks)
> +               pm_runtime_get_noresume(ddata->dev);
> +
>  err_main_clocks:
>         if (manage_clocks)
>                 sysc_disable_main_clocks(ddata);

So this is missing the "ti,no-idle-on-init" handling but
if we can handle it all with the pm_runtime_* variants that's
great.

Regards,

Tony
