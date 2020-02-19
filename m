Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 815BE164DEF
	for <lists+linux-omap@lfdr.de>; Wed, 19 Feb 2020 19:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgBSStV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Feb 2020 13:49:21 -0500
Received: from muru.com ([72.249.23.125]:56096 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726634AbgBSStV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 19 Feb 2020 13:49:21 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9CA2B80F3;
        Wed, 19 Feb 2020 18:50:03 +0000 (UTC)
Date:   Wed, 19 Feb 2020 10:49:16 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        "Arthur D ." <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [PATCH] ASoC: cpcap: Implement set_tdm_slot for voice call
 support
Message-ID: <20200219184916.GB37466@atomide.com>
References: <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
 <20200212144620.GJ64767@atomide.com>
 <9a060430-5a3e-61e1-3d2c-f89819d9436f@ti.com>
 <20200217232325.GD35972@atomide.com>
 <8fc1dded-6d28-f5cd-f2f9-3a6810571119@ti.com>
 <20200218153211.GI35972@atomide.com>
 <20200218170628.r47xc3yydg6xx2yh@earth.universe>
 <20200218174258.GK4232@sirena.org.uk>
 <20200219173902.GA37466@atomide.com>
 <20200219174600.GH4488@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219174600.GH4488@sirena.org.uk>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Mark Brown <broonie@kernel.org> [200219 17:46]:
> On Wed, Feb 19, 2020 at 09:39:02AM -0800, Tony Lindgren wrote:
> > * Mark Brown <broonie@kernel.org> [200218 17:43]:
> 
> > > you to address for system enablement.  OTOH if you manage to get one of
> > > the generic cards working well that'd be excellent!
> 
> > Well to me it seems that we just already have all the data needed with
> > the graph binding and snd-soc-audio-graph-card + codec2codec support.
> 
> > I don't think we have cases where the cpcap codec is not the master,
> > so as long as the cpcap codec knows what's going on then there
> > may not be a need for machine driver.
> 
> > I guess the the bluetooth to modem path is the one to check to see
> > what provides the clocks..
> 
> Usually in telephony cases it's the modem that's the clock master FWIW.

Well at least the samplerate needs to be configured in the cpcap
codec driver for voice calls, and we're setting CPCAP_BIT_CDC_CLK_EN
bit for voice call which is the "Voice DAI Clock". It's also set when
just playing audio using the voice channel is used. And we also have
a similar bit for CPCAP_BIT_ST_CLK_EN for "HiFi DAI Clock" for the
hifi channel. So these would seem to hit that it is really the cpcap
that's the clock master for voice calls in this case.

But I guess the test to do there would be to just clear the bit
for CPCAP_BIT_CDC_CLK_EN during a voice call and see if it still
works.

Regards,

Tony
