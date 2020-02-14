Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F225715E94A
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 18:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394427AbgBNRGE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 12:06:04 -0500
Received: from muru.com ([72.249.23.125]:55252 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394058AbgBNRGE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 14 Feb 2020 12:06:04 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CF2AC80E7;
        Fri, 14 Feb 2020 17:06:46 +0000 (UTC)
Date:   Fri, 14 Feb 2020 09:05:59 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
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
Message-ID: <20200214170559.GA64767@atomide.com>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
 <20200214124920.GH4827@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200214124920.GH4827@sirena.org.uk>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Mark Brown <broonie@kernel.org> [200214 12:50]:
> On Fri, Feb 14, 2020 at 02:41:30PM +0200, Peter Ujfalusi wrote:
> > On 12/02/2020 16.35, Tony Lindgren wrote:
> 
> > > Oops, that's not good. So should we just keep the old naming if there's
> > > only one endpoint?
> 
> > That's an option, yes, if we really need extra dummy McBSP DAIs at all,
> > again, let's hear from Morimoto-san or Mark.
> 
> We really shouldn't need dummy DAIs at all I think, if we do it feels
> like there's a problem.  It's quite possible that there is actually a
> problem here though...

It's dummy in the droid4 voice call case as mcbsp is not the clock-master
and there's nothing to configure for mcbsp.

But I guess in some cases mcbsp could be the clock-master and then the
secondary DAI would have ops.

I could be wrong though, this is just based on my experience with
getting one device working.

Regards,

Tony
