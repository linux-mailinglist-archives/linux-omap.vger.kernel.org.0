Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76F38166824
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 21:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728926AbgBTUNn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 15:13:43 -0500
Received: from muru.com ([72.249.23.125]:56612 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728770AbgBTUNn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 Feb 2020 15:13:43 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 055CE8080;
        Thu, 20 Feb 2020 20:14:25 +0000 (UTC)
Date:   Thu, 20 Feb 2020 12:13:38 -0800
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
Message-ID: <20200220201338.GW37466@atomide.com>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
 <20200214170322.GZ64767@atomide.com>
 <d9a43fcb-ed0f-5cd5-7e22-58924d571d17@ti.com>
 <20200217231001.GC35972@atomide.com>
 <5402eba8-4f84-0973-e11b-6ab2667ada85@ti.com>
 <20200218152833.GH35972@atomide.com>
 <40a803e2-6a08-2c73-0312-666441716daa@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40a803e2-6a08-2c73-0312-666441716daa@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Peter Ujfalusi <peter.ujfalusi@ti.com> [200220 14:08]:
> On 18/02/2020 17.28, Tony Lindgren wrote:
> > Right. I'm not attached to the dummy dai, but looks like currently
> > snd-soc-audio-graph-card won't work without it.
> 
> The generic cards will link up a dummy dai/codec when it is needed by DPMC.

Not sure what should be fixed here..

> > And we potentially
> > do need a place to configure TDM slot specific stuff for mcbsp.
> 
> Yes, but you still have one port and one endpoint should not change the
> configuration which is already in used for the other endpoint.

OK so what's the fix for snd-soc-audio-graph-card expecting a
separate DAI then?

> > Oh, I think there are Android apps to do that though.. Never tried
> > if they work on droid4. But if they do, doing a register dump of
> > mcbsp3 would show up how it's configured.
> 
> I don't see how you could record the data from the line which is
> connected to McBSP_DX pin (the pin is output).
> 
> But I might be missing something.

Yeah I don't know either, but the pins we have muxed for
mcbsp3 are:

/* 0x4a100106 abe_pdm_ul_data.abe_mcbsp3_dr ag25 */
OMAP4_IOPAD(0x106, PIN_INPUT | MUX_MODE1)

/* 0x4a100108 abe_pdm_dl_data.abe_mcbsp3_dx af25 */
OMAP4_IOPAD(0x108, PIN_OUTPUT | MUX_MODE1)

/* 0x4a10010a abe_pdm_frame.abe_mcbsp3_clkx ae25 */
OMAP4_IOPAD(0x10a, PIN_INPUT | MUX_MODE1)

/* 0x4a10010c abe_pdm_lb_clk.abe_mcbsp3_fsx af26 */
OMAP4_IOPAD(0x10c, PIN_INPUT | MUX_MODE1)

Isn't the data receive there as mcbsp3_dr?

> > I think the link for the patches you posted is patching the
> > snd-soc-audio-graph-card already?
> 
> Yes it does, but the functionality is there via custom machine drivers.
> What I afraid is that such a complex wiring as the Droid4 have it might
> be not possible to use a generic - fits everything - driver without
> making it a customized one ;)
> 
> Otho, if the only thing is the machine level DAPM switching and linking
> the paths then it might be relatively straight forward to extend the
> simple-card family.

Yeah or maybe it just needs to be handled directly in the cpcap,
mdm6600 codec drivers?

> > Right. So right now it seems that for snd-soc-audio-graph-card
> > needs the dummy dai, but it's unclear what would need to be
> > changed to not use a dummy dai for mcbsp.
> 
> Since simple-card family can and will connect up dummy dai/codec when
> needed based on the setup, I would look at that and make it do so.

Oh so make simple-card spin up the dummy dai instead of mcbsp?

> > The dts snippets I posted earlier do follow the graph bindings
> > as far as I know. But just to confirm, do you see any need to
> > move things around there?
> 
> It also states that a port is a physical port which can have multiple
> endpoints. But multiple endpoint != DAI. port == dai.

I guess I'm getting really confused now.. Are you saying
the dts needs to be changed too now?

Regards,

Tony
