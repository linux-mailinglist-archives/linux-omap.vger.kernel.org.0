Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD5E27FAA4
	for <lists+linux-omap@lfdr.de>; Thu,  1 Oct 2020 09:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgJAHxt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Oct 2020 03:53:49 -0400
Received: from muru.com ([72.249.23.125]:45846 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbgJAHxt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 1 Oct 2020 03:53:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 510AE8057;
        Thu,  1 Oct 2020 07:53:51 +0000 (UTC)
Date:   Thu, 1 Oct 2020 10:53:44 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: Slow booting on x15
Message-ID: <20201001075344.GU9471@atomide.com>
References: <20200923111346.GA3980@pendragon.ideasonboard.com>
 <20200924054220.GA9471@atomide.com>
 <20200924055313.GC9471@atomide.com>
 <fe0a4fa8-53fc-d316-261f-52f631f12469@ti.com>
 <20200924060826.GE9471@atomide.com>
 <20200924133049.GH3968@pendragon.ideasonboard.com>
 <20200925115147.GM9471@atomide.com>
 <20200925115817.GB3933@pendragon.ideasonboard.com>
 <20200930052057.GP9471@atomide.com>
 <d8d81891-7e22-81a2-19df-6e9a5f8679c4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8d81891-7e22-81a2-19df-6e9a5f8679c4@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Peter Ujfalusi <peter.ujfalusi@ti.com> [200930 12:41]:
> Fwiw on my beagle x15
> 
> v5.8
> [    9.908787] Run /sbin/init as init process
> 
> v5.9-rc7
> [   15.085373] Run /sbin/init as init process
> 
> 
> It appears to be 'fixed' in next-20200928: the board does not even boot.

Yeah so it seems :(

> next-20200928 on omap5
> [    9.936806] Run /sbin/init as init process
> 
> 
> -rc7 spends most of it's time:
> [    7.635530] Micrel KSZ9031 Gigabit PHY 48485000.mdio:01: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=48485000.mdio:01, irq=POLL)
> [   14.956671] cpsw 48484000.ethernet eth0: Link is Up - 1Gbps/Full - flow control off
> [   15.005211] IP-Config: Complete:

Booting with initcall_debug I see this with current Linux next:

...
[    1.697313] cpuidle: using governor menu
[    1.701353] initcall init_menu+0x0/0xc returned 0 after 0 usecs
[    1.707458] calling  gpmc_init+0x0/0x10 @ 1
[    1.711784] initcall gpmc_init+0x0/0x10 returned 0 after 0 usecs
[    1.717974] calling  omap3_l3_init+0x0/0x10 @ 1
[    1.722653] initcall omap3_l3_init+0x0/0x10 returned 0 after 0 usecs
[    1.729201] calling  omap_l3_init+0x0/0x10 @ 1
[    1.733791] initcall omap_l3_init+0x0/0x10 returned 0 after 0 usecs
[    1.740314] calling  gate_vma_init+0x0/0x70 @ 1
[    1.744976] initcall gate_vma_init+0x0/0x70 returned 0 after 0 usecs
[    1.751522] calling  customize_machine+0x0/0x30 @ 1
[    3.823114] initcall customize_machine+0x0/0x30 returned 0 after 2011718 usecs
[    3.830566] calling  init_atags_procfs+0x0/0xec @ 1
[    3.835583] No ATAGs?

Laurent & Tomi, care to check what you guys see in the slow booting case
after booting with initcall_debug?

Regards,

Tony
