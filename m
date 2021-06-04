Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AAB539B6C0
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jun 2021 12:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhFDKKL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Jun 2021 06:10:11 -0400
Received: from muru.com ([72.249.23.125]:36256 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229931AbhFDKKK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Jun 2021 06:10:10 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0D4808167;
        Fri,  4 Jun 2021 10:08:30 +0000 (UTC)
Date:   Fri, 4 Jun 2021 13:08:20 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH] usb: musb: Check devctl status again for a spurious
 session request
Message-ID: <YLn7lOueRj3JDkkA@atomide.com>
References: <20210518150615.53464-1-tony@atomide.com>
 <20210527211501.70d176b4@aktux>
 <YLCGZEan87yp9Eeq@atomide.com>
 <20210604103533.6392beeb@aktux>
 <YLn06uuntThMlaTQ@atomide.com>
 <20210604115949.4c74d4af@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604115949.4c74d4af@aktux>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andreas Kemnade <andreas@kemnade.info> [210604 10:00]:
> On Fri, 4 Jun 2021 12:39:54 +0300
> Tony Lindgren <tony@atomide.com> wrote:
> 
> > * Andreas Kemnade <andreas@kemnade.info> [210604 08:35]:
> > > I inserted some more dev-dbg
> > > [   60.241790] PM: suspend entry (deep)
> > > [   60.245513] Filesystems sync: 0.000 seconds
> > > [   60.251312] Freezing user space processes ... (elapsed 0.001 seconds) done.
> > > [   60.260040] OOM killer disabled.
> > > [   60.263275] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > > [   60.272338] printk: Suspending console(s) (use no_console_suspend to debug)
> > > [   60.281311] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_resume  
> > > -> this is triggered by what?  
> > 
> > I think that comes from the pm_runtime_get_sync() in musb_suspend().
> > 
> @@ -2825,6 +2826,7 @@ static int musb_suspend(struct device *dev)
>         struct musb     *musb = dev_to_musb(dev);
>         unsigned long   flags;
>         int ret;
> +       dev_dbg(musb->controller, "musb_suspend begin\n");
>  
>         ret = pm_runtime_get_sync(dev);
>         if (ret < 0) {
> 
> my dev_dbg comes before that.

Hmm maybe try adding dump_stack() call there to see where it comes from?

> > > [   60.281341] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_usb_runtime_resume  
> > > -> and here something stays on...  
> > > 
> > > [   60.346374] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_phy_power_on
> > > [   60.796630] musb-hdrc musb-hdrc.0.auto: musb_suspend begin
> > > [   60.796722] musb-hdrc musb-hdrc.0.auto: musb_suspend end
> > > [   60.796752] musb-omap2430 480ab000.usb_otg_hs: omap2430 suspend
> > > [   60.796783] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_suspend
> > > [   60.796783] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_phy_power_off
> > > [   60.796813] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_usb_suspend
> > > [   60.806549] Disabling non-boot CPUs ...
> > > [   60.806579] Successfully put all powerdomains to target state  
> > 
> > Well since commit 88d26136a256 ("PM: Prevent runtime suspend during system resume")
> > nothing gets runtime idled during suspend with the extra pm_runtime_get_noresume()
> > call in device_prepare() that does not get released until in device_complete().
> > 
> well, the result is that the phy stays powered on. And that is the
> problem.
> static int twl4030_phy_power_off(struct phy *phy)
> and 
> static int __maybe_unused twl4030_usb_suspend(struct device *dev)
> do not turn off the phy. I think the solution is to turn the phy off if
> no cable is connected. 

I recall there's some errata where the phy needs to be always enabled to avoid
PMIC damage when a charger is connected. But if the phy wakes up the glue layer
then that should be ignored for the glue layer maybe with .prepare and .complete
suspend calls..

> > > forcing omap2430 runtime on before suspend:
> > > [  160.467742] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_resume
> > > [  165.001495] PM: suspend entry (deep)
> > > [  165.005218] Filesystems sync: 0.000 seconds
> > > [  165.010284] Freezing user space processes ... (elapsed 0.001 seconds) done.
> > > [  165.018981] OOM killer disabled.
> > > [  165.022247] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > > [  165.031311] printk: Suspending console(s) (use no_console_suspend to debug)
> > > [  165.040496] musb-hdrc musb-hdrc.0.auto: musb_suspend begin
> > > [  165.040618] musb-hdrc musb-hdrc.0.auto: musb_suspend end
> > > [  165.040618] musb-omap2430 480ab000.usb_otg_hs: omap2430 suspend
> > > [  165.040649] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_suspend
> > > [  165.040679] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_usb_suspend
> > > [  165.050506] Disabling non-boot CPUs ...
> > > [  165.050537] Successfully put all powerdomains to target state  
> > 
> > That's interesting. Hmm so we bail out early based on glue->is_runtime_suspended,
> > and omap3 is still probing devices with omap_device.c instead of ti-sysc.c, so
> > sounds like the duplicate calls you noticed might cause the issue.
> > 
> > Does the following patch fix things for you or does something else break again? :)
> > 
> looks like something I have already tried, but I will give it a look
> again.

It seemed to behave for me based on a quick test against Linux next. I saw
suspend power consumption go down, this with no cable connected and device
in my test rack. But maybe your test is a bit different :)

Regards,

Tony
