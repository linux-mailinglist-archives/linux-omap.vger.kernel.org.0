Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55B8E8735F
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2019 09:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405737AbfHIHqr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Aug 2019 03:46:47 -0400
Received: from muru.com ([72.249.23.125]:56844 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728823AbfHIHqr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 9 Aug 2019 03:46:47 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A2FBF809F;
        Fri,  9 Aug 2019 07:47:13 +0000 (UTC)
Date:   Fri, 9 Aug 2019 00:46:43 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] Regression in next with codec unload and
        snd_soc_component_get/put
Message-ID: <20190809074643.GB52127@atomide.com>
References: <20190809070003.GA52127@atomide.com>
 <s5hwofmhkbs.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hwofmhkbs.wl-tiwai@suse.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Takashi Iwai <tiwai@suse.de> [190809 07:25]:
> On Fri, 09 Aug 2019 09:00:03 +0200,
> Tony Lindgren wrote:
> > 
> > Hi,
> > 
> > Looks like commit 4a81e8f30d0b ("ASoC: soc-component: add
> > snd_soc_component_get/put()") causes a regression where trying
> > to rmmod a codec driver fails with module is in use error after
> > rmmod of snd-soc-audio-graph-card for example.
> > 
> > Any ideas what goes wrong there?
> 
> There is an obvious typo: soc_cleanup_component() should call
> snd_soc_component_module_put_when_remove() instead of *_close().

Making that change locally seems to fix it thanks.

> And the module_get_upon_open boolean switch is a bit hard to
> understand.  Maybe using enum would be simpler there.
> 
> > BTW, looks like the lore.kernel.org link in that commit also is
> > unreachable?
> 
> It's because alsa-devel ML isn't tracked on lore.kernel.org,
> unfortunately.
> 
> Jaroslav, I asked this already.  Shall we ask lore to track alsa-devel
> ML?
>   https://korg.wiki.kernel.org/userdoc/lore

Regards,

Tony
