Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9D5164C34
	for <lists+linux-omap@lfdr.de>; Wed, 19 Feb 2020 18:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgBSRjL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Feb 2020 12:39:11 -0500
Received: from muru.com ([72.249.23.125]:56066 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbgBSRjL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 19 Feb 2020 12:39:11 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9F75C80F3;
        Wed, 19 Feb 2020 17:39:53 +0000 (UTC)
Date:   Wed, 19 Feb 2020 09:39:02 -0800
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
Message-ID: <20200219173902.GA37466@atomide.com>
References: <20200211181005.54008-1-tony@atomide.com>
 <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
 <20200212144620.GJ64767@atomide.com>
 <9a060430-5a3e-61e1-3d2c-f89819d9436f@ti.com>
 <20200217232325.GD35972@atomide.com>
 <8fc1dded-6d28-f5cd-f2f9-3a6810571119@ti.com>
 <20200218153211.GI35972@atomide.com>
 <20200218170628.r47xc3yydg6xx2yh@earth.universe>
 <20200218174258.GK4232@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200218174258.GK4232@sirena.org.uk>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Mark Brown <broonie@kernel.org> [200218 17:43]:
> On Tue, Feb 18, 2020 at 06:06:28PM +0100, Sebastian Reichel wrote:
> 
> > simple-graph-card is the current machine driver. We might have to
> > introduce a Droid 4 specific driver instead. I used simple(-graph)-card
> > instead of introducing a new driver, since the setup was simple enough
> > without modem and bluetooth. The simple card was perfect to test the CPCAP
> > codec driver. The TDM things might be complex enough to create
> > a new machine driver (as I mentioned in the original patchset
> > adding CPCAP codec support).
> 
> I tend to agree here, phones are generally one of the most complicated
> classes of system for clocking and interconnects and the CODECs they use
> often the most complex too so they're really stretching the generic
> cards.  It'd be nice to be able to handle things with generic cards but
> it's likely you'll run into issues that it'd be unreasonable to force
> you to address for system enablement.  OTOH if you manage to get one of
> the generic cards working well that'd be excellent!

Well to me it seems that we just already have all the data needed with
the graph binding and snd-soc-audio-graph-card + codec2codec support.

I don't think we have cases where the cpcap codec is not the master,
so as long as the cpcap codec knows what's going on then there
may not be a need for machine driver.

I guess the the bluetooth to modem path is the one to check to see
what provides the clocks..

Regards,

Tony
