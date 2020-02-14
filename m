Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87AD515CF7B
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 02:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbgBNBfA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Feb 2020 20:35:00 -0500
Received: from muru.com ([72.249.23.125]:55160 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728052AbgBNBfA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 13 Feb 2020 20:35:00 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6A538804F;
        Fri, 14 Feb 2020 01:35:41 +0000 (UTC)
Date:   Thu, 13 Feb 2020 17:34:54 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Sebastian Reichel <sre@kernel.org>
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
Message-ID: <20200214013454.GX64767@atomide.com>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <20200214003452.xuadnylj2udqyljs@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200214003452.xuadnylj2udqyljs@earth.universe>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sebastian Reichel <sre@kernel.org> [200214 00:35]:
> On Wed, Feb 12, 2020 at 06:35:43AM -0800, Tony Lindgren wrote:
> > Yes this should follow the audio-graph-card.txt example. We end up with
> > mcbsp3 dts node as below on droid4:
> > 
> > &mcbsp3 {
> >         #sound-dai-cells = <0>;
> >         pinctrl-names = "default";
> >         pinctrl-0 = <&mcbsp3_pins>;
> >         status = "okay";
> > 
> >         ports {
> >                 mcbsp3_port: port@0 {
> >                         #address-cells = <1>;
> >                         #size-cells = <0>;
> > 
> >                         cpu_dai3: endpoint@0 {
> 
> cpu_dai3_cpcap
> 
> >                                 reg = <0>;
> >                                 dai-format = "dsp_a";
> >                                 frame-master = <&cpcap_audio_codec1>;
> >                                 bitclock-master = <&cpcap_audio_codec1>;
> >                                 remote-endpoint = <&cpcap_audio_codec1>;
> >                         };
> > 
> >                         cpu_dai_mdm: endpoint@1 {
> 
> cpu_dai3_mdm

OK

> >                                 reg = <1>;
> >                                 dai-format = "dsp_a";
> >                                 frame-master = <&cpcap_audio_codec1>;
> >                                 bitclock-master = <&cpcap_audio_codec1>;
> >                                 remote-endpoint = <&mot_mdm6600_audio_codec0>;
> >                         };
> >                 };
> >         };
> > };
> > 
> > That is pretty much the same as the 'Multi DAI with DPCM' example, with
> > dne dai, and multiple endpoints. I think we still have just one port
> > for one i2s transport on the mcbsp :)
> > 
> > Does the above look as what you would expect based on the binding?
> 
> I haven't had a look at this for quite some time. I suppose the
> cpcap voice DAI and the modem will also have two endpoints? So
> once the BT support is added it will looks like this [simplified]?

Well it will be even simpler, no need for extra endpoints at
the codecs, see below.
 
> &mcbsp3 {
>     ports {
>         port@0 {
>             cpu_dai3_cpcap: endpoint@0 {};
>             cpu_dai3_modem: endpoint@1 {};
>             cpu_dai3_bt: endpoint@2 {};
>         };
>     };
> };

But yes, bluetooth would be just added as above under mcbsp3.

> &cpcap {
>     ports {
>         voice: port@1 {
>             cpcap_voice_cpu: endpoint@0 {};
>             cpcap_voice_modem: endpoint@1 {};
>             cpcap_voice_bt: endpoint@2 {};
>         };
>     };
> };

But above there's no need to add anything under cpcap, it still
only has the same two endpoints as it already has. So it's
just as specified in the graph binding, just the #address-cells,
#size-cells and reg added:

cpcap_audio: audio-codec {
	#sound-dai-cells = <1>;
	#address-cells = <1>;
	#size-cells = <0>;
	port@0 {
		reg = <0>;
		cpcap_audio_codec0: endpoint {
		};
	};
	port@1 {
		reg = <1>;
		cpcap_audio_codec1: endpoint {
		};
	};
};

Then the modem codec looks like this:

mot_mdm6600_audio: audio-codec {
	#address-cells = <1>;
	#size-cells = <0>;
	#sound-dai-cells = <1>;

	port@0 {
		mot_mdm6600_audio_codec0: endpoint {
			remote-endpoint = <&cpu_dai_mdm>;
		};
	};
};

> &bluetooth {
>     ports {
>         port@0 {
>             bt_dai_cpu: endpoint@0 {};
>             bt_dai_modem: endpoint@1 {};
>             bt_dai_cpcap: endpoint@2 {};
>         };
>     };
> };

And bluetooth would be similar to cpcap_audio and mot_mdm6600_audio
above.

My guess is that only cpcap registers and clock rate needs to be
changed for bluetooth audio BTW, so if somebody havs a bluetooth
headset just do the following in Android:

# cpcaprw --all > /tmp/before
configure bluetooth headset for audio in android and start
playing some music or make a phone call
...
# cpcaprw --all > /tmp/after
stop playing music or phone call
...
diff -u /tmp/before /tmp/after

The registers will be different for a bluetooth phone call and
playing music.

> > > > I've tested this with droid4 where cpcap pmic and modem voice are both
> > > > both wired to mcbsp3. I've also tested this on droid4 both with and
> > > > without the pending modem audio codec driver that is waiting for n_gsm
> > > > serdev dependencies to clear.
> > > 
> > > What this patch you effectively just creating dummy-dais on top of the
> > > real McBSP DAI.
> > 
> > Yes I think this is needed for snd-soc-audio-graph-card, and this allows
> > configuring whatever is needed for the i2s slot. But maybe you have some
> > better way of doing it in mind?
> > 
> > > You also rename the DAIs, which might break ams-delta.
> > 
> > Oops, that's not good. So should we just keep the old naming if there's
> > only one endpoint?
> > 
> > > We still have legacy support in
> > > omap-twl4030.c
> > > omap3pandora.c
> > > osk5912.c
> > > rx51.c
> 
> also n810.c

OK

> > > which will break with the renamed DAI. On the other hand I think the
> > > legacy support can be dropped from them.
> > 
> > I'm not sure what all that would take.
> 
> rx51 and omap-twl4030 override the hardcoded paths with DT
> information when DT is available (= always), so hardcoded paths
> do not matter at all and could simply be removed (the patch
> should also make DT mandatory).
> 
> For omap3pandora, n810 and osk5912 the hardcoded information seems
> to be used and there does not seem to be any soundcard DT node for
> them. I suppose it's a bit of work for those devices. n810
> looks simple enough to just use simple-card.

OK I'll just keep the old naming if there's only one child node.

Regards,

Tony
