Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15C011627F6
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 15:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgBROTJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Feb 2020 09:19:09 -0500
Received: from muru.com ([72.249.23.125]:55870 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726445AbgBROTJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 18 Feb 2020 09:19:09 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6B43D8043;
        Tue, 18 Feb 2020 14:19:52 +0000 (UTC)
Date:   Tue, 18 Feb 2020 06:19:05 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
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
Message-ID: <20200218141905.GG35972@atomide.com>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <20200214003452.xuadnylj2udqyljs@earth.universe>
 <20200214013454.GX64767@atomide.com>
 <20200214130428.gkhmr55ptmi2bh2x@earth.universe>
 <20200214170946.GB64767@atomide.com>
 <20200218140431.emrxgvckrpltmg2s@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200218140431.emrxgvckrpltmg2s@earth.universe>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sebastian Reichel <sebastian.reichel@collabora.com> [200218 06:05]:
> Hi,
> 
> On Fri, Feb 14, 2020 at 09:09:46AM -0800, Tony Lindgren wrote:
> > * Sebastian Reichel <sre@kernel.org> [200214 13:05]:
> > > On Thu, Feb 13, 2020 at 05:34:54PM -0800, Tony Lindgren wrote:
> > > > And bluetooth would be similar to cpcap_audio and mot_mdm6600_audio
> > > > above.
> > > 
> > > My understanding is, that CPU is not involved for calls (except for
> > > setting up cpcap registers correctly). Basically McBSP3 should
> > > remain idle for a call and data goes directly from modem to cpcap.
> > > The same should work for modem <-> BT, except that CPCAP seems to
> > > always provide the clock. That would imply a direct link between
> > > modem and codec / BT?
> > 
> > Yes the direct link is i2s. I'm ot sure if mcbsp can be idle during
> > voice call though, I guess it should be doable since mcbsp is not
> > the clock master :)
> > 
> > > > My guess is that only cpcap registers and clock rate needs to be
> > > > changed for bluetooth audio BTW, so if somebody havs a bluetooth
> > > > headset just do the following in Android:
> > > > 
> > > > # cpcaprw --all > /tmp/before
> > > > configure bluetooth headset for audio in android and start
> > > > playing some music or make a phone call
> > > > ...
> > > > # cpcaprw --all > /tmp/after
> > > > stop playing music or phone call
> > > > ...
> > > > diff -u /tmp/before /tmp/after
> > > > 
> > > > The registers will be different for a bluetooth phone call and
> > > > playing music.
> > > 
> > > I can provider register values once I find some time.
> 
> [NI] Normal idle (no BT headset connected)
> [BI] Bluetooth idle (with BT headset connected)
> [BC] Bluetooth call in progress
> [NC] Normal call in progress (BT headset disabled)
> 
>                      [NI]  =>  [BI]  =>  [BC]  =>  [NC]
> CPCAP_REG_VAUDIOC   0x0065 => 0x0065 => 0x0065 => 0x0025
> CPCAP_REG_CC        0x0000 => 0x0000 => 0x6000 => 0x60df
> CPCAP_REG_CDI       0x0040 => 0x0000 => 0xaa40 => 0xae0a
> CPCAP_REG_SDAC      -------------- 0x0000 --------------
> CPCAP_REG_SDACDI    -------------- 0x0004 --------------
> CPCAP_REG_TXI       0x0804 => 0x0004 => 0x0000 => 0x0cc6
> CPCAP_REG_TXMP      0x079c => 0x079c => 0x0400 => 0x0673
> CPCAP_REG_RXOA      0x0000 => 0x0000 => 0x0001 => 0x0001
> CPCAP_REG_RXVC      0x0d34 => 0x0d34 => 0x0000 => 0x0b2c
> CPCAP_REG_RXCOA     0x0000 => 0x0000 => 0x0000 => 0x0601
> CPCAP_REG_RXSDOA    0x0000 => 0x0000 => 0x0600 => 0x0600
> CPCAP_REG_RXEPOA    -------------- 0x0400 --------------
> CPCAP_REG_RXLL      -------------- 0x0000 --------------
> CPCAP_REG_A2LA      -------------- 0x0030 --------------
> CPCAP_REG_MIPIS1    -------------- 0x0000 --------------
> CPCAP_REG_MIPIS2    -------------- 0x0000 --------------
> CPCAP_REG_MIPIS3    -------------- 0x0000 --------------
> CPCAP_REG_LVAB      -------------- 0x0000 --------------

Great thanks! Care to do also a dump just playing music to on
bluetooth headset at some point?

Regards,

Tony


