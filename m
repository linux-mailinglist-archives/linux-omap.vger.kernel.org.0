Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E94B716861C
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 19:08:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727699AbgBUSI1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 13:08:27 -0500
Received: from muru.com ([72.249.23.125]:56780 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbgBUSI0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 Feb 2020 13:08:26 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 060D9807E;
        Fri, 21 Feb 2020 18:09:08 +0000 (UTC)
Date:   Fri, 21 Feb 2020 10:08:21 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Arthur D ." <spinal.by@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
Message-ID: <20200221180821.GA37466@atomide.com>
References: <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
 <20200214170322.GZ64767@atomide.com>
 <d9a43fcb-ed0f-5cd5-7e22-58924d571d17@ti.com>
 <20200217231001.GC35972@atomide.com>
 <5402eba8-4f84-0973-e11b-6ab2667ada85@ti.com>
 <20200218211631.fxojsxzvttoidfed@earth.universe>
 <a263a857-bb8a-0e37-6932-dd07df98ad63@ti.com>
 <20200220201559.GX37466@atomide.com>
 <9ea8239f-3b2d-8206-95ee-2789fbae83d4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ea8239f-3b2d-8206-95ee-2789fbae83d4@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Peter Ujfalusi <peter.ujfalusi@ti.com> [200221 13:21]:
> Hi Tony,
> 
> On 20/02/2020 22.15, Tony Lindgren wrote:
> > * Peter Ujfalusi <peter.ujfalusi@ti.com> [200220 14:16]:
> >> On 18/02/2020 23.16, Sebastian Reichel wrote:
> >>> I suppose in the end its a question if generic card can provide TDM
> >>> support.
> >>
> >> Sure it can, but can it handle the switching between the paths based on
> >> use cases?
> >> There should be machine level DAPM widgets to kick codec2codec (MDM6600
> >> - CPAC_voice for example) and also to make sure that when you switch
> >> between them the system is not going to get misconfigured.
> >> Switching between CPAC and BT route during call?
> >> Not allowing VoIP while on call, etc.
> > 
> > Well I guess the key thing to check here is if it's enough to
> > keep track of things in the cpcap codec driver. If cpcap is always
> > involved, that should be sufficient.
> 
> The codec driver should keep track on what it can do, but should not
> start policing the outside world.
> The machine driver knows the connections and should tell the components
> on what to do.

OK that makes senes to me. So I guess now the question is if
we can maintain this state in snd-soc-audio-graph-card instead
of needing a custom machine driver.

Regards,

Tony
