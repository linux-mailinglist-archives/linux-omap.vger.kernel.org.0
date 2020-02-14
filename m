Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD06415D947
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 15:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729359AbgBNOT3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 09:19:29 -0500
Received: from muru.com ([72.249.23.125]:55194 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729336AbgBNOT2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 14 Feb 2020 09:19:28 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D163D80E7;
        Fri, 14 Feb 2020 14:20:11 +0000 (UTC)
Date:   Fri, 14 Feb 2020 06:19:24 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Pavel Machek <pavel@ucw.cz>,
        linux-omap <linux-omap@vger.kernel.org>,
        "Arthur D." <spinal.by@gmail.com>
Subject: Re: N900: Remove mmc1 "safety feature"?
Message-ID: <20200214141924.GY64767@atomide.com>
References: <5362c659-120f-5247-aaa5-7916229300bc@wizzup.org>
 <20200208190448.GA12984@amd>
 <270f27c9-afd6-171d-7dce-fe1d71dd8f9a@wizzup.org>
 <1eac0db3-17ce-8ebd-4997-8b1c282126e4@wizzup.org>
 <20200208220621.GA18161@amd>
 <d2d6d6ac-c964-ac48-1616-6f1826219385@wizzup.org>
 <20200210192714.GC14939@darkstar.musicnaut.iki.fi>
 <8d0ecfcd-f9a7-9563-8a39-9793cfbeb893@wizzup.org>
 <20200214013924.7wcama5ix2ivok2e@earth.universe>
 <8774c76c-e5df-6126-657e-3ac55f241951@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8774c76c-e5df-6126-657e-3ac55f241951@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com> [200214 05:52]:
> Hi,
> 
> On 14.02.20 г. 3:39 ч., Sebastian Reichel wrote:
> > Hi,
> > 
> > On Wed, Feb 12, 2020 at 02:02:53PM +0100, Merlijn Wajer wrote:
> > > On 10/02/2020 20:27, Aaro Koskinen wrote:
> > > > > So how does this currently happen, the unmounting? Does the mmc1 card
> > > > > just disappear from /dev/ without any safe unmount? I don't understand
> > > > > how the current setup can work from a userspace point of view.
> > > > > 
> > > > > Userspace could react on kernel events that tell it the cover is open,
> > > > > but I assume the kernel doesn't just decide to nuke the node from /dev/,
> > > > > so in that case the current DTS setup still doesn't make sense, right?
> > > > > 
> > > > > What am I missing? Could you describe how this would work in a 'real
> > > > > life' scenario?
> > > > 
> > > > I don't think it can work with the current mainline kernel.
> > > > 
> > > > I recall the original Nokia kernel used the GPIO for "cover switch"
> > > > instead of card detect, and it was visible in sysfs, and this allowed
> > > > userspace to react on cover removal.. In the mainline kernel we have
> > > > this for older Nokia devices (770, N8x0), but not for N900. Still it
> > > > wouldn't help much for "safe unmount" as the unmount can take quite a
> > > > while, and user may remove the card too early.
> > > 
> > > Shall I send in a patch removing this check from the device tree, then?
> > 
> > I agree it's mostly annoying and suggest to convert the GPIO
> > into a gpio-key using a newly defined
> > 
> > SW_MACHINE_COVER /* set = cover closed */
> > 
> > Similar to the camera lens cover. It means userspace has a chance to
> > show a warning, but system works generally. I think it's ok to
> > assume that people running mainline on their N900 nowadays know what
> > could happen when they hot-remove SD cards.
> > 
> 
> That sounds way better to me than just removing the check.

Sounds good to me too. The MMC card is there and usable when cover is
off, so the cover GPIO is not the same as MMC detect GPIO.

Regards,

Tony
