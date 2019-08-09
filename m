Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00AF4872E7
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2019 09:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbfHIHZO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Aug 2019 03:25:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:46754 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725985AbfHIHZN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 9 Aug 2019 03:25:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 87C48AF68;
        Fri,  9 Aug 2019 07:25:12 +0000 (UTC)
Date:   Fri, 09 Aug 2019 09:25:11 +0200
Message-ID: <s5hwofmhkbs.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] Regression in next with codec unload and      snd_soc_component_get/put
In-Reply-To: <20190809070003.GA52127@atomide.com>
References: <20190809070003.GA52127@atomide.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 09 Aug 2019 09:00:03 +0200,
Tony Lindgren wrote:
> 
> Hi,
> 
> Looks like commit 4a81e8f30d0b ("ASoC: soc-component: add
> snd_soc_component_get/put()") causes a regression where trying
> to rmmod a codec driver fails with module is in use error after
> rmmod of snd-soc-audio-graph-card for example.
> 
> Any ideas what goes wrong there?

There is an obvious typo: soc_cleanup_component() should call
snd_soc_component_module_put_when_remove() instead of *_close().

And the module_get_upon_open boolean switch is a bit hard to
understand.  Maybe using enum would be simpler there.

> BTW, looks like the lore.kernel.org link in that commit also is
> unreachable?

It's because alsa-devel ML isn't tracked on lore.kernel.org,
unfortunately.

Jaroslav, I asked this already.  Shall we ask lore to track alsa-devel
ML?
  https://korg.wiki.kernel.org/userdoc/lore


thanks,

Takashi
