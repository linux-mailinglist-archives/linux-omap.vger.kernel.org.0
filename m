Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5705115D790
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 13:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgBNMms (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 07:42:48 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43812 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgBNMms (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 14 Feb 2020 07:42:48 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01ECfTWa026882;
        Fri, 14 Feb 2020 06:41:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581684089;
        bh=y7tnLvi1wMpor7S1zrbL6DotuoQylxvUc8QfJzKUkgM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=QAmNcTKHFUnzVmtgcVYHTIZLd4wSjhbw6MqVRYHXpUN6DZq8M31M4k3wqnh1wORBR
         noZnkviZ+tIG7+83Yz6XUom9leNwJZb/w3udw3Pg0QOIukrVjaP5AXUAhFz66jOb1W
         W5TnBt50gXMn8lxDof4rlCl034iHFxSx7tbwLoIg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01ECfTco023629
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 14 Feb 2020 06:41:29 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 14
 Feb 2020 06:41:28 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 14 Feb 2020 06:41:28 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01ECfPKC088492;
        Fri, 14 Feb 2020 06:41:25 -0600
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
To:     Tony Lindgren <tony@atomide.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Arthur D ." <spinal.by@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
Date:   Fri, 14 Feb 2020 14:41:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200212143543.GI64767@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 12/02/2020 16.35, Tony Lindgren wrote:
> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200212 08:02]:
>>
>>
>> On 11/02/2020 19.16, Tony Lindgren wrote:
>>> We can have multiple connections on a single McBSP instance configured
>>> with audio graph card when using TDM (Time Division Multiplexing). Let's
>>> allow that by configuring dais dynamically.
>>
>> It is still one DAI...
>> If you have multiple codec connected to the same I2S lines, but the
>> codecs communicate within different time slots, you still have one DAI
>> on the CPU side, but multiple codecs (codec DAIs) with different TDM slot.
> 
> OK so subject should say "dodec DAIs" then I guess?
> 
>>> See Documentation/devicetree/bindings/sound/audio-graph-card.txt and
>>> Documentation/devicetree/bindings/graph.txt for more details for
>>> multiple endpoints.
>>
>> See the example for 'Multi DAI with DPCM' in audio-graph-card.txt
>> The PCM3168a have 2 DAIs: playback and capture, but you can have
>> multiple endpoints within a DAI.
> 
> Yes this should follow the audio-graph-card.txt example. We end up with
> mcbsp3 dts node as below on droid4:
> 
> &mcbsp3 {
>         #sound-dai-cells = <0>;
>         pinctrl-names = "default";
>         pinctrl-0 = <&mcbsp3_pins>;
>         status = "okay";
> 
>         ports {
>                 mcbsp3_port: port@0 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> 
>                         cpu_dai3: endpoint@0 {
>                                 reg = <0>;
>                                 dai-format = "dsp_a";
>                                 frame-master = <&cpcap_audio_codec1>;
>                                 bitclock-master = <&cpcap_audio_codec1>;
>                                 remote-endpoint = <&cpcap_audio_codec1>;
>                         };
> 
>                         cpu_dai_mdm: endpoint@1 {
>                                 reg = <1>;
>                                 dai-format = "dsp_a";
>                                 frame-master = <&cpcap_audio_codec1>;
>                                 bitclock-master = <&cpcap_audio_codec1>;
>                                 remote-endpoint = <&mot_mdm6600_audio_codec0>;
>                         };
>                 };
>         };
> };

According to
Documentation/devicetree/bindings/sound/audio-graph-card.txt
it should be something like this:
&mcbsp3 {
        #sound-dai-cells = <0>;
        pinctrl-names = "default";
        pinctrl-0 = <&mcbsp3_pins>;
        status = "okay";

        ports {
		#address-cells = <1>;
		#size-cells = <0>;
                port@0 {
			reg = <0>;

			cpu_dai3: endpoint@0 {
				dai-format = "dsp_a";
				frame-master = <&cpcap_audio_codec1>;
				bitclock-master = <&cpcap_audio_codec1>;
				remote-endpoint = <&cpcap_audio_codec1>;
			};

			cpu_dai_mdm: endpoint@1 {
				dai-format = "dsp_a";
				frame-master = <&cpcap_audio_codec1>;
				bitclock-master = <&cpcap_audio_codec1>;
				remote-endpoint = <&mot_mdm6600_audio_codec0>;
			};
		};
	};
};

If you span out dummy DAIs got dai1+ then how you will get anything
working via endpoint1+?
There will be no ops for McBSP, so it is not going to do anything...


> That is pretty much the same as the 'Multi DAI with DPCM' example, with
> dne dai, and multiple endpoints. I think we still have just one port
> for one i2s transport on the mcbsp :)
> 
> Does the above look as what you would expect based on the binding?

The audio-graph-card.txt example shows pcm3168a which have two DAIs,
one for playback and one for capture.

I guess Morimoto-san can explain if he carries out of tree patches to
get the described setup working on top of mainline...

But, no, based on the documentation I don't ;)

>>> I've tested this with droid4 where cpcap pmic and modem voice are both
>>> both wired to mcbsp3. I've also tested this on droid4 both with and
>>> without the pending modem audio codec driver that is waiting for n_gsm
>>> serdev dependencies to clear.
>>
>> What this patch you effectively just creating dummy-dais on top of the
>> real McBSP DAI.
> 
> Yes I think this is needed for snd-soc-audio-graph-card, and this allows
> configuring whatever is needed for the i2s slot. But maybe you have some
> better way of doing it in mind?
> 
>> You also rename the DAIs, which might break ams-delta.
> 
> Oops, that's not good. So should we just keep the old naming if there's
> only one endpoint?

That's an option, yes, if we really need extra dummy McBSP DAIs at all,
again, let's hear from Morimoto-san or Mark.
 
>> We still have legacy support in
>> omap-twl4030.c
>> omap3pandora.c
>> osk5912.c
>> rx51.c
>>
>> which will break with the renamed DAI. On the other hand I think the
>> legacy support can be dropped from them.
> 
> I'm not sure what all that would take.

For some it should not be a big deal as they only boot in DT mode.
/me adds this to the TODO list.
 
>> I know it was discussed, but can not find the mail:
>> Can you brief again on the audio connection?
> 
> Below is a link to a mailing list thread where Sebastian describes
> the audio connection:
> 
> https://lkml.org/lkml/2018/3/28/881

Thanks!
 
>> Do you have branch with working code?
> 
> Yeah I have slightly older set of the patches in my droid4-pending-v5.5
> kernel.org git branch with voice calls working.

I think I should put my droid4 out and try to get it working...
Do you have a link for dummies to follow to get started? ;)

> 
> Regards,
> 
> Tony
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
