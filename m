Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC7241583DD
	for <lists+linux-omap@lfdr.de>; Mon, 10 Feb 2020 20:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgBJTnU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 10 Feb 2020 14:43:20 -0500
Received: from fgw21-4.mail.saunalahti.fi ([62.142.5.108]:25977 "EHLO
        fgw21-4.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727003AbgBJTnU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 10 Feb 2020 14:43:20 -0500
X-Greylist: delayed 962 seconds by postgrey-1.27 at vger.kernel.org; Mon, 10 Feb 2020 14:43:19 EST
Received: from darkstar.musicnaut.iki.fi (85-76-67-4-nat.elisa-mobile.fi [85.76.67.4])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 57cb43fb-4c3b-11ea-bfc3-005056bdd08f;
        Mon, 10 Feb 2020 21:27:15 +0200 (EET)
Date:   Mon, 10 Feb 2020 21:27:14 +0200
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        "Arthur D." <spinal.by@gmail.com>
Subject: Re: N900: Remove mmc1 "safety feature"? (was: Re: mmc0 on Nokia N900
 on Linux 5.4.18)
Message-ID: <20200210192714.GC14939@darkstar.musicnaut.iki.fi>
References: <5362c659-120f-5247-aaa5-7916229300bc@wizzup.org>
 <20200208190448.GA12984@amd>
 <270f27c9-afd6-171d-7dce-fe1d71dd8f9a@wizzup.org>
 <1eac0db3-17ce-8ebd-4997-8b1c282126e4@wizzup.org>
 <20200208220621.GA18161@amd>
 <d2d6d6ac-c964-ac48-1616-6f1826219385@wizzup.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2d6d6ac-c964-ac48-1616-6f1826219385@wizzup.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Sat, Feb 08, 2020 at 11:19:21PM +0100, Merlijn Wajer wrote:
> On 08/02/2020 23:06, Pavel Machek wrote:
> > It is very bad for debugging, agreed.
> > 
> > It makes sense for regular usage: when user removes back cover, system
> > unmounts the u-SD card, so that it is ready for user to remove
> > it. Note that we do _not_ have "remove the card safely" button in the
> > UI; back cover serves that purpose.
> > 
> > That said... for Leste just keep the patch. And maybe apply that one
> > to shutdown system when battery is low :-).
> 
> So how does this currently happen, the unmounting? Does the mmc1 card
> just disappear from /dev/ without any safe unmount? I don't understand
> how the current setup can work from a userspace point of view.
> 
> Userspace could react on kernel events that tell it the cover is open,
> but I assume the kernel doesn't just decide to nuke the node from /dev/,
> so in that case the current DTS setup still doesn't make sense, right?
> 
> What am I missing? Could you describe how this would work in a 'real
> life' scenario?

I don't think it can work with the current mainline kernel.

I recall the original Nokia kernel used the GPIO for "cover switch"
instead of card detect, and it was visible in sysfs, and this allowed
userspace to react on cover removal.. In the mainline kernel we have
this for older Nokia devices (770, N8x0), but not for N900. Still it
wouldn't help much for "safe unmount" as the unmount can take quite a
while, and user may remove the card too early.

A.
