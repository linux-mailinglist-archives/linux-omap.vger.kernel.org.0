Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3113039B655
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jun 2021 12:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhFDKBp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Jun 2021 06:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhFDKBo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Jun 2021 06:01:44 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A322CC06174A;
        Fri,  4 Jun 2021 02:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=khUB0iXgJtey+/6r11AdEjOKaccdEMO4wcB1qxfa2LY=; b=IkWHvQnnslcaSWb0GBAfDp+EV6
        GrfV9QCEK0LyHaq0drPo1qd93UWk8+n4y+YP3KmzAnJ6F6pBSN6D2M2N85tMJMmf6m8nN0q1HaM8y
        W9npQSkThjsgjU2Sl5LI/eblU6oZfvDiF4otdnAZN9KzX3qPHO2a8xcCbHkaaLdtAfMs=;
Received: from p200300ccff0b2a001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:2a00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1lp6cI-00063L-2l; Fri, 04 Jun 2021 11:59:54 +0200
Date:   Fri, 4 Jun 2021 11:59:49 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH] usb: musb: Check devctl status again for a spurious
 session request
Message-ID: <20210604115949.4c74d4af@aktux>
In-Reply-To: <YLn06uuntThMlaTQ@atomide.com>
References: <20210518150615.53464-1-tony@atomide.com>
        <20210527211501.70d176b4@aktux>
        <YLCGZEan87yp9Eeq@atomide.com>
        <20210604103533.6392beeb@aktux>
        <YLn06uuntThMlaTQ@atomide.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 4 Jun 2021 12:39:54 +0300
Tony Lindgren <tony@atomide.com> wrote:

> * Andreas Kemnade <andreas@kemnade.info> [210604 08:35]:
> > I inserted some more dev-dbg
> > [   60.241790] PM: suspend entry (deep)
> > [   60.245513] Filesystems sync: 0.000 seconds
> > [   60.251312] Freezing user space processes ... (elapsed 0.001 seconds) done.
> > [   60.260040] OOM killer disabled.
> > [   60.263275] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > [   60.272338] printk: Suspending console(s) (use no_console_suspend to debug)
> > [   60.281311] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_resume  
> > -> this is triggered by what?  
> 
> I think that comes from the pm_runtime_get_sync() in musb_suspend().
> 
@@ -2825,6 +2826,7 @@ static int musb_suspend(struct device *dev)
        struct musb     *musb = dev_to_musb(dev);
        unsigned long   flags;
        int ret;
+       dev_dbg(musb->controller, "musb_suspend begin\n");
 
        ret = pm_runtime_get_sync(dev);
        if (ret < 0) {

my dev_dbg comes before that.

> > [   60.281341] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_usb_runtime_resume  
> > -> and here something stays on...  
> > 
> > [   60.346374] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_phy_power_on
> > [   60.796630] musb-hdrc musb-hdrc.0.auto: musb_suspend begin
> > [   60.796722] musb-hdrc musb-hdrc.0.auto: musb_suspend end
> > [   60.796752] musb-omap2430 480ab000.usb_otg_hs: omap2430 suspend
> > [   60.796783] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_suspend
> > [   60.796783] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_phy_power_off
> > [   60.796813] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_usb_suspend
> > [   60.806549] Disabling non-boot CPUs ...
> > [   60.806579] Successfully put all powerdomains to target state  
> 
> Well since commit 88d26136a256 ("PM: Prevent runtime suspend during system resume")
> nothing gets runtime idled during suspend with the extra pm_runtime_get_noresume()
> call in device_prepare() that does not get released until in device_complete().
> 
well, the result is that the phy stays powered on. And that is the
problem.
static int twl4030_phy_power_off(struct phy *phy)
and 
static int __maybe_unused twl4030_usb_suspend(struct device *dev)
do not turn off the phy. I think the solution is to turn the phy off if
no cable is connected. 

> > forcing omap2430 runtime on before suspend:
> > [  160.467742] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_resume
> > [  165.001495] PM: suspend entry (deep)
> > [  165.005218] Filesystems sync: 0.000 seconds
> > [  165.010284] Freezing user space processes ... (elapsed 0.001 seconds) done.
> > [  165.018981] OOM killer disabled.
> > [  165.022247] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > [  165.031311] printk: Suspending console(s) (use no_console_suspend to debug)
> > [  165.040496] musb-hdrc musb-hdrc.0.auto: musb_suspend begin
> > [  165.040618] musb-hdrc musb-hdrc.0.auto: musb_suspend end
> > [  165.040618] musb-omap2430 480ab000.usb_otg_hs: omap2430 suspend
> > [  165.040649] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_suspend
> > [  165.040679] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_usb_suspend
> > [  165.050506] Disabling non-boot CPUs ...
> > [  165.050537] Successfully put all powerdomains to target state  
> 
> That's interesting. Hmm so we bail out early based on glue->is_runtime_suspended,
> and omap3 is still probing devices with omap_device.c instead of ti-sysc.c, so
> sounds like the duplicate calls you noticed might cause the issue.
> 
> Does the following patch fix things for you or does something else break again? :)
> 
looks like something I have already tried, but I will give it a look
again.

Regards,
Andreas
