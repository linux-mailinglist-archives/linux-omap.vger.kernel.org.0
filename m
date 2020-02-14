Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 377BD15E8EC
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 18:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392614AbgBNRD3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 12:03:29 -0500
Received: from muru.com ([72.249.23.125]:55210 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390191AbgBNRD3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 14 Feb 2020 12:03:29 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B396480E7;
        Fri, 14 Feb 2020 17:04:09 +0000 (UTC)
Date:   Fri, 14 Feb 2020 09:03:22 -0800
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
Message-ID: <20200214170322.GZ64767@atomide.com>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Peter Ujfalusi <peter.ujfalusi@ti.com> [200214 12:42]:
> Hi Tony,
> 
> On 12/02/2020 16.35, Tony Lindgren wrote:
> > * Peter Ujfalusi <peter.ujfalusi@ti.com> [200212 08:02]:
> >>
> >>
> >> On 11/02/2020 19.16, Tony Lindgren wrote:
> >>> We can have multiple connections on a single McBSP instance configured
> >>> with audio graph card when using TDM (Time Division Multiplexing). Let's
> >>> allow that by configuring dais dynamically.
> >>
> >> It is still one DAI...
> >> If you have multiple codec connected to the same I2S lines, but the
> >> codecs communicate within different time slots, you still have one DAI
> >> on the CPU side, but multiple codecs (codec DAIs) with different TDM slot.
> > 
> > OK so subject should say "dodec DAIs" then I guess?
> > 
> >>> See Documentation/devicetree/bindings/sound/audio-graph-card.txt and
> >>> Documentation/devicetree/bindings/graph.txt for more details for
> >>> multiple endpoints.
> >>
> >> See the example for 'Multi DAI with DPCM' in audio-graph-card.txt
> >> The PCM3168a have 2 DAIs: playback and capture, but you can have
> >> multiple endpoints within a DAI.
> > 
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
> >                                 reg = <0>;
> >                                 dai-format = "dsp_a";
> >                                 frame-master = <&cpcap_audio_codec1>;
> >                                 bitclock-master = <&cpcap_audio_codec1>;
> >                                 remote-endpoint = <&cpcap_audio_codec1>;
> >                         };
> > 
> >                         cpu_dai_mdm: endpoint@1 {
> >                                 reg = <1>;
> >                                 dai-format = "dsp_a";
> >                                 frame-master = <&cpcap_audio_codec1>;
> >                                 bitclock-master = <&cpcap_audio_codec1>;
> >                                 remote-endpoint = <&mot_mdm6600_audio_codec0>;
> >                         };
> >                 };
> >         };
> > };
> 
> According to
> Documentation/devicetree/bindings/sound/audio-graph-card.txt
> it should be something like this:
> &mcbsp3 {
>         #sound-dai-cells = <0>;
>         pinctrl-names = "default";
>         pinctrl-0 = <&mcbsp3_pins>;
>         status = "okay";
> 
>         ports {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
>                 port@0 {
> 			reg = <0>;
> 
> 			cpu_dai3: endpoint@0 {
> 				dai-format = "dsp_a";
> 				frame-master = <&cpcap_audio_codec1>;
> 				bitclock-master = <&cpcap_audio_codec1>;
> 				remote-endpoint = <&cpcap_audio_codec1>;
> 			};
> 
> 			cpu_dai_mdm: endpoint@1 {
> 				dai-format = "dsp_a";
> 				frame-master = <&cpcap_audio_codec1>;
> 				bitclock-master = <&cpcap_audio_codec1>;
> 				remote-endpoint = <&mot_mdm6600_audio_codec0>;
> 			};
> 		};
> 	};
> };

Hmms so I only spot reg use at different level changing above. Well
that's not according to Documentation/devicetree/bindings/graph.txt,
the reg numbering is per endpoint.

Sounds like the we have the example not following graph.txt in
Documentation/devicetree/bindings/sound/audio-graph-card.txt while
the code is now behaving as in graph.txt.

> If you span out dummy DAIs got dai1+ then how you will get anything
> working via endpoint1+?
> There will be no ops for McBSP, so it is not going to do anything...

Eventually it could have ops though. For things like capture of the tdm
slot data for recording audio call for example, I don't know how that's
supposed to work though. I guess mcbsp could be the clock master too,
and for those cases it would have ops.

But right now in droid4 voice call case mcbsp is just the i2s transport,
and everything happens betwee the modem and the cpcap pmic.

> > That is pretty much the same as the 'Multi DAI with DPCM' example, with
> > dne dai, and multiple endpoints. I think we still have just one port
> > for one i2s transport on the mcbsp :)
> > 
> > Does the above look as what you would expect based on the binding?
> 
> The audio-graph-card.txt example shows pcm3168a which have two DAIs,
> one for playback and one for capture.
> 
> I guess Morimoto-san can explain if he carries out of tree patches to
> get the described setup working on top of mainline...
>
> But, no, based on the documentation I don't ;)

Sounds like audio-graph-card.txt is just out of sync with graph.txt
as we do have several working examples?

> >>> I've tested this with droid4 where cpcap pmic and modem voice are both
> >>> both wired to mcbsp3. I've also tested this on droid4 both with and
> >>> without the pending modem audio codec driver that is waiting for n_gsm
> >>> serdev dependencies to clear.
> >>
> >> What this patch you effectively just creating dummy-dais on top of the
> >> real McBSP DAI.
> > 
> > Yes I think this is needed for snd-soc-audio-graph-card, and this allows
> > configuring whatever is needed for the i2s slot. But maybe you have some
> > better way of doing it in mind?
> > 
> >> You also rename the DAIs, which might break ams-delta.
> > 
> > Oops, that's not good. So should we just keep the old naming if there's
> > only one endpoint?
> 
> That's an option, yes, if we really need extra dummy McBSP DAIs at all,
> again, let's hear from Morimoto-san or Mark.

Well it would not necessarily be a dummy mcbsp dai in all cases it seems
to me. But yeah nothing for the second dai to do right now for droid4
voice call as it's all between the modem and the pmic.

> >> We still have legacy support in
> >> omap-twl4030.c
> >> omap3pandora.c
> >> osk5912.c
> >> rx51.c
> >>
> >> which will break with the renamed DAI. On the other hand I think the
> >> legacy support can be dropped from them.
> > 
> > I'm not sure what all that would take.
> 
> For some it should not be a big deal as they only boot in DT mode.
> /me adds this to the TODO list.

OK

> >> I know it was discussed, but can not find the mail:
> >> Can you brief again on the audio connection?
> > 
> > Below is a link to a mailing list thread where Sebastian describes
> > the audio connection:
> > 
> > https://lkml.org/lkml/2018/3/28/881
> 
> Thanks!
>  
> >> Do you have branch with working code?
> > 
> > Yeah I have slightly older set of the patches in my droid4-pending-v5.5
> > kernel.org git branch with voice calls working.
> 
> I think I should put my droid4 out and try to get it working...
> Do you have a link for dummies to follow to get started? ;)

Probably the easiest one to use right now is the Maemo-leste devuan based
test image using v5.5 kernel + modem and audio patches:

https://leste.maemo.org/Motorola_Droid_4

Just use a decent speed micro-sd card rated "a1" for example.

Regards,

Tony
