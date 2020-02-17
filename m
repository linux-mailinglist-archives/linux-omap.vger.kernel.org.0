Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2535B161DB6
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 00:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgBQXKG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 18:10:06 -0500
Received: from muru.com ([72.249.23.125]:55732 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbgBQXKG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 17 Feb 2020 18:10:06 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8890B8087;
        Mon, 17 Feb 2020 23:10:48 +0000 (UTC)
Date:   Mon, 17 Feb 2020 15:10:01 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Arthur D ." <spinal.by@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
Message-ID: <20200217231001.GC35972@atomide.com>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
 <20200214170322.GZ64767@atomide.com>
 <d9a43fcb-ed0f-5cd5-7e22-58924d571d17@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9a43fcb-ed0f-5cd5-7e22-58924d571d17@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Peter Ujfalusi <peter.ujfalusi@ti.com> [200217 12:10]:
> On 14/02/2020 19.03, Tony Lindgren wrote:
> > But right now in droid4 voice call case mcbsp is just the i2s transport,
> > and everything happens betwee the modem and the cpcap pmic.
> 
> Iow you don't need McBSP DAI at all. If you would have added the dummy
> codec to McBSP !3 and use that, it would work in a same way, or to DMIC
> or McPDM...
> 
> The McBSP ops are NULL for the dummy dai, so McBSP is turned off.

Hmm yeah I don't know if the cpcap codec on the same mcbsp needs
mcbsp for voice call.

According to Sebastian sounds like mcbsp can be idle at that point.

But what about capture of voice call at the mcbsp from the
TDM slot? In that case mcbsp would be active.

> >>>> I know it was discussed, but can not find the mail:
> >>>> Can you brief again on the audio connection?
> >>>
> >>> Below is a link to a mailing list thread where Sebastian describes
> >>> the audio connection:
> >>>
> >>> https://lkml.org/lkml/2018/3/28/881
> >>
> >> Thanks!
> >>  
> >>>> Do you have branch with working code?
> >>>
> >>> Yeah I have slightly older set of the patches in my droid4-pending-v5.5
> >>> kernel.org git branch with voice calls working.
> >>
> >> I think I should put my droid4 out and try to get it working...
> >> Do you have a link for dummies to follow to get started? ;)
> > 
> > Probably the easiest one to use right now is the Maemo-leste devuan based
> > test image using v5.5 kernel + modem and audio patches:
> > 
> > https://leste.maemo.org/Motorola_Droid_4
> > 
> > Just use a decent speed micro-sd card rated "a1" for example.
> 
> Cool. Now I can dual boot the droid4 :D
> I needed to rewrite the /etc/shadow to get a known root password so I
> can log in.

Not sure if you mean password for the droid4-kexecboot or the
Linux distro you installed.. But for droid4-kexecboot, you
can configure it to automatically download new kernels over wlan.
There's some info on the machine specific password and how to
configure wlan in the droid4-kexecboot buildroot commits here:

https://github.com/tmlind/buildroot/commits/droid4-kexecboot-2017.11

> Wifi is up, so in theory I can scp kernel/dtb to /boot/boot/ and update
> the /boot/boot/boot.cfg to boot my kernel, right?

Yeah you can update kernels and modules over wlan from the distro(s)
you have configured, and also from droid4-kexecboot as above.

And note that kexecboot looks for a boot/boot.cfg file to use on
every usable parition it finds and uses all the found entries
based on the priority configured for the boot.cfg entry.

Regards,

Tony
