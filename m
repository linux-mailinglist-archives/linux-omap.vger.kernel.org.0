Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27FDE39B6E3
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jun 2021 12:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhFDKWB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Jun 2021 06:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbhFDKWA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Jun 2021 06:22:00 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4470C06174A;
        Fri,  4 Jun 2021 03:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=okjnHa33EVd0nOoSUBI5N5mmLepB90O/9QSWXiOPWQc=; b=SYTm3ghcp/cNd2LE3jrR0lDY07
        PCbCtG1iAn1YD2t1MzlPKFJfy0jM42rUEfpSGs8hg1BgS46G1ReXFu7kEXsIqyDn7dU9cNYrk6ur3
        XASYDswnkxwcZela3ruPdFfXwM6YOzIAoUvdmEST80eNkm2znvXQ3pFPW7nAJp3JfV2s=;
Received: from p200300ccff0b2a001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:2a00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1lp6vu-0006E4-Ln; Fri, 04 Jun 2021 12:20:11 +0200
Date:   Fri, 4 Jun 2021 12:20:05 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH] usb: musb: Check devctl status again for a spurious
 session request
Message-ID: <20210604122005.72f9fac7@aktux>
In-Reply-To: <YLn7lOueRj3JDkkA@atomide.com>
References: <20210518150615.53464-1-tony@atomide.com>
        <20210527211501.70d176b4@aktux>
        <YLCGZEan87yp9Eeq@atomide.com>
        <20210604103533.6392beeb@aktux>
        <YLn06uuntThMlaTQ@atomide.com>
        <20210604115949.4c74d4af@aktux>
        <YLn7lOueRj3JDkkA@atomide.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 4 Jun 2021 13:08:20 +0300
Tony Lindgren <tony@atomide.com> wrote:

> * Andreas Kemnade <andreas@kemnade.info> [210604 10:00]:
> > On Fri, 4 Jun 2021 12:39:54 +0300
> > Tony Lindgren <tony@atomide.com> wrote:
> >   
> > > * Andreas Kemnade <andreas@kemnade.info> [210604 08:35]:  
> > > > I inserted some more dev-dbg
> > > > [   60.241790] PM: suspend entry (deep)
> > > > [   60.245513] Filesystems sync: 0.000 seconds
> > > > [   60.251312] Freezing user space processes ... (elapsed 0.001 seconds) done.
> > > > [   60.260040] OOM killer disabled.
> > > > [   60.263275] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > > > [   60.272338] printk: Suspending console(s) (use no_console_suspend to debug)
> > > > [   60.281311] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_resume    
> > > > -> this is triggered by what?    
> > > 
> > > I think that comes from the pm_runtime_get_sync() in musb_suspend().
> > >   
> > @@ -2825,6 +2826,7 @@ static int musb_suspend(struct device *dev)
> >         struct musb     *musb = dev_to_musb(dev);
> >         unsigned long   flags;
> >         int ret;
> > +       dev_dbg(musb->controller, "musb_suspend begin\n");
> >  
> >         ret = pm_runtime_get_sync(dev);
> >         if (ret < 0) {
> > 
> > my dev_dbg comes before that.  
> 
> Hmm maybe try adding dump_stack() call there to see where it comes from?
> 
> > > > [   60.281341] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_usb_runtime_resume    
> > > > -> and here something stays on...    
> > > > 
> > > > [   60.346374] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_phy_power_on
> > > > [   60.796630] musb-hdrc musb-hdrc.0.auto: musb_suspend begin
> > > > [   60.796722] musb-hdrc musb-hdrc.0.auto: musb_suspend end
> > > > [   60.796752] musb-omap2430 480ab000.usb_otg_hs: omap2430 suspend
> > > > [   60.796783] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_suspend
> > > > [   60.796783] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_phy_power_off
> > > > [   60.796813] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_usb_suspend
> > > > [   60.806549] Disabling non-boot CPUs ...
> > > > [   60.806579] Successfully put all powerdomains to target state    
> > > 
> > > Well since commit 88d26136a256 ("PM: Prevent runtime suspend during system resume")
> > > nothing gets runtime idled during suspend with the extra pm_runtime_get_noresume()
> > > call in device_prepare() that does not get released until in device_complete().
> > >   
> > well, the result is that the phy stays powered on. And that is the
> > problem.
> > static int twl4030_phy_power_off(struct phy *phy)
> > and 
> > static int __maybe_unused twl4030_usb_suspend(struct device *dev)
> > do not turn off the phy. I think the solution is to turn the phy off if
> > no cable is connected.   
> 
> I recall there's some errata where the phy needs to be always enabled to avoid
> PMIC damage when a charger is connected. But if the phy wakes up the glue layer
> then that should be ignored for the glue layer maybe with .prepare and .complete
> suspend calls..
> 
yes, phy needs to be enabled when a charger is connected. That was the
reason why we do not use phy_power_off() for turning it off. But if
no charger is connected, the phy does not need to be turned on.

I will test your patch at some time in the afternoon.

Regards,
Andreas
