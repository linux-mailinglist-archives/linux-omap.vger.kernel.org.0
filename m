Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6077B161DF2
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 00:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgBQXg2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 18:36:28 -0500
Received: from muru.com ([72.249.23.125]:55790 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbgBQXg2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 17 Feb 2020 18:36:28 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 20F528087;
        Mon, 17 Feb 2020 23:37:11 +0000 (UTC)
Date:   Mon, 17 Feb 2020 15:36:23 -0800
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
Message-ID: <20200217233623.GE35972@atomide.com>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
 <20200214170322.GZ64767@atomide.com>
 <d9a43fcb-ed0f-5cd5-7e22-58924d571d17@ti.com>
 <20200217231001.GC35972@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200217231001.GC35972@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200217 23:10]:
> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200217 12:10]:
> > On 14/02/2020 19.03, Tony Lindgren wrote:
> > > But right now in droid4 voice call case mcbsp is just the i2s transport,
> > > and everything happens betwee the modem and the cpcap pmic.
> > 
> > Iow you don't need McBSP DAI at all. If you would have added the dummy
> > codec to McBSP !3 and use that, it would work in a same way, or to DMIC
> > or McPDM...
> > 
> > The McBSP ops are NULL for the dummy dai, so McBSP is turned off.
> 
> Hmm yeah I don't know if the cpcap codec on the same mcbsp needs
> mcbsp for voice call.
> 
> According to Sebastian sounds like mcbsp can be idle at that point.
> 
> But what about capture of voice call at the mcbsp from the
> TDM slot? In that case mcbsp would be active.

Looks like only initializing only one mcbsp3 instance here
instead of two will produce an oops as below.

I'm not sure how this is supposed to work for
snd-soc-audio-graph-card with multipe endpoints connected
to just one mcbsp dai instance?

Regards,

Tony

8< -------------------
Internal error: Oops: 805 [#1] PREEMPT SMP ARM
snd_soc_del_component_unlocked+0xf4/0x110
...
[   39.616027] Backtrace:
[   39.616149] [<bf3f6bc4>] (snd_soc_del_component_unlocked [snd_soc_core]) from [<bf3f8ff4>] (snd_soc_add_component+0x238/0x374 [snd_s)
[   39.616149]  r7:00000002 r6:00000002 r5:ec9a0e78 r4:00000122
[   39.678283] qmi_wwan 1-1:1.6: cdc-wdm1: USB WDM device
[   39.739074] [<bf3f8dbc>] (snd_soc_add_component [snd_soc_core]) from [<bf3f9180>] (snd_soc_register_component+0x50/0x60 [snd_soc_cor)
[   39.739074]  r10:bf4582d0 r9:ec9d0840 r8:00000002 r7:00000002 r6:ec9d0640 r5:bf4584ac
[   39.800842] asoc-audio-graph-card soundcard: using device tree for GPIO lookup
[   39.808685]  r4:eed52410
[   39.862304] [<bf3f9130>] (snd_soc_register_component [snd_soc_core]) from [<bf4088b4>] (devm_snd_soc_register_component+0x54/0x90 [s)
[   39.862304]  r7:ec9d0640 r6:bf4584ac r5:ec9d3040 r4:eed52410
[   39.925048] qmi_wwan 1-1:1.6 wwan1: register 'qmi_wwan' at usb-4a064800.ohci-1, WWAN/QMI device, 2e:59:df:3f:4f:ef
[   39.984558] [<bf408860>] (devm_snd_soc_register_component [snd_soc_core]) from [<bf456fb8>] (asoc_mcbsp_probe+0x3e8/0x574 [snd_soc_o)
[   39.984558]  r9:ec9d0840 r8:ec9f4000 r7:eed52410 r6:00000000 r5:eed52400 r4:ec9d0840
[   39.984588] [<bf456bd0>] (asoc_mcbsp_probe [snd_soc_omap_mcbsp]) from [<c068475c>] (platform_drv_probe+0x58/0xa8)
[   39.984619]  r10:00000000 r9:0000002e r8:bf459014 r7:00000000 r6:bf459014 r5:00000000
[   40.044342] of_get_named_gpiod_flags: can't parse 'pa-gpios' property of node '/soundcard[0]'
[   40.051788]  r4:eed52410
[   40.100769] [<c0684704>] (platform_drv_probe) from [<c06820ac>] (really_probe+0x1ec/0x358)
