Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1C99164E01
	for <lists+linux-omap@lfdr.de>; Wed, 19 Feb 2020 19:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbgBSSxH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Feb 2020 13:53:07 -0500
Received: from muru.com ([72.249.23.125]:56130 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726613AbgBSSxH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 19 Feb 2020 13:53:07 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 63BF180F3;
        Wed, 19 Feb 2020 18:53:50 +0000 (UTC)
Date:   Wed, 19 Feb 2020 10:53:02 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Mark Brown <broonie@kernel.org>,
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
Message-ID: <20200219185302.GC37466@atomide.com>
References: <20200211181005.54008-1-tony@atomide.com>
 <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
 <20200212144620.GJ64767@atomide.com>
 <9a060430-5a3e-61e1-3d2c-f89819d9436f@ti.com>
 <20200217232325.GD35972@atomide.com>
 <8fc1dded-6d28-f5cd-f2f9-3a6810571119@ti.com>
 <20200218153211.GI35972@atomide.com>
 <20200218170628.r47xc3yydg6xx2yh@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200218170628.r47xc3yydg6xx2yh@earth.universe>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sebastian Reichel <sebastian.reichel@collabora.com> [200218 17:07]:
> On Tue, Feb 18, 2020 at 07:32:11AM -0800, Tony Lindgren wrote:
> > OK, but so what's the machine driver part in this case?
> 
> simple-graph-card is the current machine driver. We might have to
> introduce a Droid 4 specific driver instead. I used simple(-graph)-card
> instead of introducing a new driver, since the setup was simple enough
> without modem and bluetooth. The simple card was perfect to test the CPCAP
> codec driver. The TDM things might be complex enough to create
> a new machine driver (as I mentioned in the original patchset
> adding CPCAP codec support).

Well we do have the .set_tdm_slot to configure things. If it turns
out we only need to track the machine audio state in cpcap.c, then
we don't need a separate machine driver.

However, if it turns out that cpcap is not always active for
some audio paths, then yeah it seems that we need a custom
machine driver to keep track of the machine audio state.

> Note: Don't use Motorola's tree to learn about ASoC. Their soundcard
> and cpcap codec drivers are full of weird hacks. I'm pretty sure the
> author(s) did not really understand how ASoC works. From my
> experience you should only use their code to understand the
> hardware wiring. You might also want to look into the MC13783
> datasheet for the keyword "network mode".

Yeah nope. And just dumping out the cpcap registers in Android
seems to provide enough information to get the missing features
working.

Regards,

Tony


