Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B33D7161DCE
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 00:23:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgBQXXa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 18:23:30 -0500
Received: from muru.com ([72.249.23.125]:55768 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726107AbgBQXXa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 17 Feb 2020 18:23:30 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7CBE68087;
        Mon, 17 Feb 2020 23:24:12 +0000 (UTC)
Date:   Mon, 17 Feb 2020 15:23:25 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        "Arthur D ." <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [PATCH] ASoC: cpcap: Implement set_tdm_slot for voice call
 support
Message-ID: <20200217232325.GD35972@atomide.com>
References: <20200211181005.54008-1-tony@atomide.com>
 <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
 <20200212144620.GJ64767@atomide.com>
 <9a060430-5a3e-61e1-3d2c-f89819d9436f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a060430-5a3e-61e1-3d2c-f89819d9436f@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Peter Ujfalusi <peter.ujfalusi@ti.com> [200214 13:30]:
> Hi Tony,
> 
> On 12/02/2020 16.46, Tony Lindgren wrote:
> > * Peter Ujfalusi <peter.ujfalusi@ti.com> [200212 09:18]:
> >> On 11/02/2020 20.10, Tony Lindgren wrote:
> >>> +static int cpcap_voice_set_tdm_slot(struct snd_soc_dai *dai,
> >>> +				    unsigned int tx_mask, unsigned int rx_mask,
> >>> +				    int slots, int slot_width)
> >>> +{
> >>> +	struct snd_soc_component *component = dai->component;
> >>> +	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
> >>> +	int err, ts_mask, mask;
> >>> +	bool voice_call;
> >>> +
> >>> +	/*
> >>> +	 * Primitive test for voice call, probably needs more checks
> >>> +	 * later on for 16-bit calls detected, Bluetooth headset etc.
> >>> +	 */
> >>> +	if (tx_mask == 0 && rx_mask == 1 && slot_width == 8)
> >>> +		voice_call = true;
> >>> +	else
> >>> +		voice_call = false;
> >>
> >> You only have voice call if only rx slot0 is in use?
> > 
> > Yeah so it seems. Then there's the modem to wlcore bluetooth path that
> > I have not looked at. But presumably that's again just configuring some
> > tdm slot on the PMIC.
> > 
> >> If you record mono on the voice DAI, then rx_mask is also 1, no?
> > 
> > It is above :) But maybe I don't follow what you're asking here
> 
> If you arecrod -Dvoice_pcm -c1 -fS8 > /dev/null
> then it is reasonable that the machine driver will set rx_mask = 1
> 
> > and maybe you have some better check in mind.
> 
> Not sure, but relying on set_tdm_slots to decide if we are in a call
> case does not sound right.

OK yeah seems at least bluetooth would need to be also handled
in the set_tdm_slots.

> >> You will also set the sampling rate for voice in
> >> cpcap_voice_hw_params(), but that is for normal playback/capture, right?
> > 
> > Yeah so normal playback/capture is already working with cpcap codec driver
> > with mainline Linux. The voice call needs to set rate to 8000.
> 
> But if you have a voice call initiated should not the rate be set by the
> set_sysclk()?

Hmm does set_sysclk called from modem codec know that cpcap codec
is the clock master based on bitclock-master and set the rate
for cpcap codec?

> >> It feels like that these should be done via DAPM with codec to codec route?
> > 
> > Sure if you have some better way of doing it :) Do you have an example to
> > point me to?
> 
> Something along the lines of:
> https://mailman.alsa-project.org/pipermail/alsa-devel/2020-February/162915.html
> 
> The it is a matter of building and connecting the DAPM routes between
> the two codec and with a flip of the switch you would have audio flowing
> between them.

Sounds good to me.

Tony
