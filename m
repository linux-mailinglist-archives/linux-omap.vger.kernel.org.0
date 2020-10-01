Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFE427FB6A
	for <lists+linux-omap@lfdr.de>; Thu,  1 Oct 2020 10:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgJAIXg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Oct 2020 04:23:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35756 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgJAIXf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Oct 2020 04:23:35 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD26F255;
        Thu,  1 Oct 2020 10:23:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601540613;
        bh=x0PepIt6CqKq++ixDVxQMIsdZRpNM2VpcVlJ+VwJ6is=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JJfspX62Utl9Liltm1A9tFwaCUtaOGkzgh3G9M+DczHbhvz5GujtyKNVmrLXv8MMC
         9o3rU46Qh3KH0JtvF4E0cu27rNW0IpYHFZvMSPCfNKgCX0uDZDM/56l/fZmivZb54m
         z/ZPvhVDH11CHNKmdqNvsNm2vDefpad0iOvapBG8=
Date:   Thu, 1 Oct 2020 11:22:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: Slow booting on x15
Message-ID: <20201001082256.GA3722@pendragon.ideasonboard.com>
References: <20200924055313.GC9471@atomide.com>
 <fe0a4fa8-53fc-d316-261f-52f631f12469@ti.com>
 <20200924060826.GE9471@atomide.com>
 <20200924133049.GH3968@pendragon.ideasonboard.com>
 <20200925115147.GM9471@atomide.com>
 <20200925115817.GB3933@pendragon.ideasonboard.com>
 <20200930052057.GP9471@atomide.com>
 <d8d81891-7e22-81a2-19df-6e9a5f8679c4@ti.com>
 <20201001075344.GU9471@atomide.com>
 <20201001081748.GW9471@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201001081748.GW9471@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Thu, Oct 01, 2020 at 11:17:48AM +0300, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [201001 07:53]:
> > * Peter Ujfalusi <peter.ujfalusi@ti.com> [200930 12:41]:
> > > Fwiw on my beagle x15
> > > 
> > > v5.8
> > > [    9.908787] Run /sbin/init as init process
> > > 
> > > v5.9-rc7
> > > [   15.085373] Run /sbin/init as init process
> > > 
> > > 
> > > It appears to be 'fixed' in next-20200928: the board does not even boot.
> > 
> > Yeah so it seems :(
> > 
> > > next-20200928 on omap5
> > > [    9.936806] Run /sbin/init as init process
> > > 
> > > 
> > > -rc7 spends most of it's time:
> > > [    7.635530] Micrel KSZ9031 Gigabit PHY 48485000.mdio:01: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=48485000.mdio:01, irq=POLL)
> > > [   14.956671] cpsw 48484000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
> > > [   15.005211] IP-Config: Complete:
> > 
> > Booting with initcall_debug I see this with current Linux next:
> > 
> > ...
> > [    1.697313] cpuidle: using governor menu
> > [    1.701353] initcall init_menu+0x0/0xc returned 0 after 0 usecs
> > [    1.707458] calling  gpmc_init+0x0/0x10 @ 1
> > [    1.711784] initcall gpmc_init+0x0/0x10 returned 0 after 0 usecs
> > [    1.717974] calling  omap3_l3_init+0x0/0x10 @ 1
> > [    1.722653] initcall omap3_l3_init+0x0/0x10 returned 0 after 0 usecs
> > [    1.729201] calling  omap_l3_init+0x0/0x10 @ 1
> > [    1.733791] initcall omap_l3_init+0x0/0x10 returned 0 after 0 usecs
> > [    1.740314] calling  gate_vma_init+0x0/0x70 @ 1
> > [    1.744976] initcall gate_vma_init+0x0/0x70 returned 0 after 0 usecs
> > [    1.751522] calling  customize_machine+0x0/0x30 @ 1
> > [    3.823114] initcall customize_machine+0x0/0x30 returned 0 after 2011718 usecs
> > [    3.830566] calling  init_atags_procfs+0x0/0xec @ 1
> > [    3.835583] No ATAGs?
> 
> And the long time above with customize_machine() ends up being
> pdata_quirks_init() calling of_platform_populate().

That's what the delay is for me (I think I've reported that initially).

> > Laurent & Tomi, care to check what you guys see in the slow booting case
> > after booting with initcall_debug?
> 
> But maybe the long delay is something else for you guys so please check.

-- 
Regards,

Laurent Pinchart
