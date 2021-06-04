Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F50F39B4F4
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jun 2021 10:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhFDIh3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Jun 2021 04:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbhFDIh3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Jun 2021 04:37:29 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E96C06174A;
        Fri,  4 Jun 2021 01:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4KRWdzBUoXU83AL5+05hHIl3Wbb3m65hCfikxyOgHhY=; b=jRtLji5kG9B+1pZi6tT3t5/M9y
        gR8wRRJ6qIQ8GQE1i3NHneeQa67pnSlWsOBl7TWJXZsR+TtMn/BG+BMLoLdY+rpN/jRvZcHsJgcO3
        AkwmOzP6PG8wEGg46/jWdSEwTpidmd6ykb7Z2EgWRK5GSeJ0w5Ur4b1I8T8SIWWAN4DU=;
Received: from p200300ccff0b2a001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:2a00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1lp5Ik-0005Fd-Ez; Fri, 04 Jun 2021 10:35:38 +0200
Date:   Fri, 4 Jun 2021 10:35:33 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH] usb: musb: Check devctl status again for a spurious
 session request
Message-ID: <20210604103533.6392beeb@aktux>
In-Reply-To: <YLCGZEan87yp9Eeq@atomide.com>
References: <20210518150615.53464-1-tony@atomide.com>
        <20210527211501.70d176b4@aktux>
        <YLCGZEan87yp9Eeq@atomide.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 28 May 2021 08:57:56 +0300
Tony Lindgren <tony@atomide.com> wrote:

> Hi,
> 
> * Andreas Kemnade <andreas@kemnade.info> [210527 19:15]:
> > Hi,
> > 
> > On Tue, 18 May 2021 18:06:15 +0300
> > Tony Lindgren <tony@atomide.com> wrote:
> >   
> > > On start-up, we can get a spurious session request interrupt with nothing
> > > connected. After that the devctl session bit will silently clear, but the
> > > musb hardware is never idled until a cable is plugged in, or the glue
> > > layer module is reloaded.
> > > 
> > > Let's just check the session bit again in 3 seconds in peripheral mode
> > > to catch the issue.
> > >   
> > Tested this together with the other musb patch you sent on gta04.
> > This has some interesting side effects.
> > 
> > Test done:
> > - loading kernel+ramdisk via usb-dfu
> > - disconnecting usb cable
> > - loading omap_hdq (to see battery status)
> > - idling serial ports
> > - checking battery current 1.
> > - loading omap2430, phy-twl4030-usb, g_ether
> > - checking battery current 2 (again with idled serial ports).
> > - rtcwake -s 20 -m mem
> > - checking current during suspend (3)
> > 
> > Without your patches: current 2 is current 1 + approx 15 mA, current 3
> > is near current 1.
> > With your patches: current 2 is near current 1, current 3 is approx
> > 15mA higher.  
> 
> Interesting, so power consumption is now better for runtime with cable
> disconnected, and after booting, but now somehow is now worse for
> suspended state. I'll try to reproduce.
> 
I inserted some more dev-dbg
[   60.241790] PM: suspend entry (deep)
[   60.245513] Filesystems sync: 0.000 seconds
[   60.251312] Freezing user space processes ... (elapsed 0.001 seconds) done.
[   60.260040] OOM killer disabled.
[   60.263275] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[   60.272338] printk: Suspending console(s) (use no_console_suspend to debug)
[   60.281311] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_resume
-> this is triggered by what?

[   60.281341] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_usb_runtime_resume
-> and here something stays on...

[   60.346374] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_phy_power_on
[   60.796630] musb-hdrc musb-hdrc.0.auto: musb_suspend begin
[   60.796722] musb-hdrc musb-hdrc.0.auto: musb_suspend end
[   60.796752] musb-omap2430 480ab000.usb_otg_hs: omap2430 suspend
[   60.796783] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_suspend
[   60.796783] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_phy_power_off
[   60.796813] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_usb_suspend
[   60.806549] Disabling non-boot CPUs ...
[   60.806579] Successfully put all powerdomains to target state

forcing omap2430 runtime on before suspend:
[  160.467742] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_resume
[  165.001495] PM: suspend entry (deep)
[  165.005218] Filesystems sync: 0.000 seconds
[  165.010284] Freezing user space processes ... (elapsed 0.001 seconds) done.
[  165.018981] OOM killer disabled.
[  165.022247] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  165.031311] printk: Suspending console(s) (use no_console_suspend to debug)
[  165.040496] musb-hdrc musb-hdrc.0.auto: musb_suspend begin
[  165.040618] musb-hdrc musb-hdrc.0.auto: musb_suspend end
[  165.040618] musb-omap2430 480ab000.usb_otg_hs: omap2430 suspend
[  165.040649] musb-omap2430 480ab000.usb_otg_hs: omap2430 runtime_suspend
[  165.040679] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: twl4030_usb_suspend
[  165.050506] Disabling non-boot CPUs ...
[  165.050537] Successfully put all powerdomains to target state

Regards,
Andreas
