Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64AB715AB32
	for <lists+linux-omap@lfdr.de>; Wed, 12 Feb 2020 15:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgBLOqZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Feb 2020 09:46:25 -0500
Received: from muru.com ([72.249.23.125]:54896 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727526AbgBLOqZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 12 Feb 2020 09:46:25 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4A8A680F6;
        Wed, 12 Feb 2020 14:47:07 +0000 (UTC)
Date:   Wed, 12 Feb 2020 06:46:20 -0800
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
Message-ID: <20200212144620.GJ64767@atomide.com>
References: <20200211181005.54008-1-tony@atomide.com>
 <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Peter Ujfalusi <peter.ujfalusi@ti.com> [200212 09:18]:
> On 11/02/2020 20.10, Tony Lindgren wrote:
> > +static int cpcap_voice_set_tdm_slot(struct snd_soc_dai *dai,
> > +				    unsigned int tx_mask, unsigned int rx_mask,
> > +				    int slots, int slot_width)
> > +{
> > +	struct snd_soc_component *component = dai->component;
> > +	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
> > +	int err, ts_mask, mask;
> > +	bool voice_call;
> > +
> > +	/*
> > +	 * Primitive test for voice call, probably needs more checks
> > +	 * later on for 16-bit calls detected, Bluetooth headset etc.
> > +	 */
> > +	if (tx_mask == 0 && rx_mask == 1 && slot_width == 8)
> > +		voice_call = true;
> > +	else
> > +		voice_call = false;
> 
> You only have voice call if only rx slot0 is in use?

Yeah so it seems. Then there's the modem to wlcore bluetooth path that
I have not looked at. But presumably that's again just configuring some
tdm slot on the PMIC.

> If you record mono on the voice DAI, then rx_mask is also 1, no?

It is above :) But maybe I don't follow what you're asking here and
maybe you have some better check in mind.

I have no idea where we would implement recording voice calls for
example, I guess mcbsp could do that somewhere to dump out a tdm slot
specific traffic.

> > +
> > +	ts_mask = 0x7 << CPCAP_BIT_MIC2_TIMESLOT0;
> > +	ts_mask |= 0x7 << CPCAP_BIT_MIC1_RX_TIMESLOT0;
> > +
> > +	mask = (tx_mask & 0x7) << CPCAP_BIT_MIC2_TIMESLOT0;
> > +	mask |= (rx_mask & 0x7) << CPCAP_BIT_MIC1_RX_TIMESLOT0;
> > +
> > +	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_CDI,
> > +				 ts_mask, mask);
> > +	if (err)
> > +		return err;
> > +
> > +	err = cpcap_set_samprate(cpcap, CPCAP_DAI_VOICE, slot_width * 1000);
> > +	if (err)
> > +		return err;
> 
> You will also set the sampling rate for voice in
> cpcap_voice_hw_params(), but that is for normal playback/capture, right?

Yeah so normal playback/capture is already working with cpcap codec driver
with mainline Linux. The voice call needs to set rate to 8000.

> > +
> > +	err = cpcap_voice_call(cpcap, dai, voice_call);
> > +	if (err)
> > +		return err;
> 
> It feels like that these should be done via DAPM with codec to codec route?

Sure if you have some better way of doing it :) Do you have an example to
point me to?

Regards,

Tony
