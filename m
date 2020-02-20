Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA54B165F74
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 15:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727761AbgBTOIc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 09:08:32 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44446 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728042AbgBTOIc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 Feb 2020 09:08:32 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KE7J0D048608;
        Thu, 20 Feb 2020 08:07:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582207639;
        bh=57Udr//2K9Cc8/sUWnFCWsbhzUyakzeFYjICEp4Kpb4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Jv5sVVdTcICqp+DVb+CytSE02ZhkqByElBlMXmx/BjIsIPjOmKLfmXNeid0wwaiBc
         KUdZL511M0H0VlLHfGCGaDxJqi30djHAjz8SGBod34T3o5gN9aA0+tSy9FDTzdj5MS
         AGkDA8AoKr8YPs/tCvqq+f0bIaN5aOEnmOWVEGgE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KE7JT8128850
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 Feb 2020 08:07:19 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 20
 Feb 2020 08:07:18 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 20 Feb 2020 08:07:18 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KE7E7C072937;
        Thu, 20 Feb 2020 08:07:15 -0600
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
To:     Tony Lindgren <tony@atomide.com>
CC:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>,
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
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
 <20200214170322.GZ64767@atomide.com>
 <d9a43fcb-ed0f-5cd5-7e22-58924d571d17@ti.com>
 <20200217231001.GC35972@atomide.com>
 <5402eba8-4f84-0973-e11b-6ab2667ada85@ti.com>
 <20200218152833.GH35972@atomide.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <40a803e2-6a08-2c73-0312-666441716daa@ti.com>
Date:   Thu, 20 Feb 2020 16:07:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200218152833.GH35972@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 18/02/2020 17.28, Tony Lindgren wrote:
> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200218 12:44]:
>> Hi Tony,
>>
>> On 18/02/2020 1.10, Tony Lindgren wrote:
>>> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200217 12:10]:
>>>> On 14/02/2020 19.03, Tony Lindgren wrote:
>>>>> But right now in droid4 voice call case mcbsp is just the i2s transport,
>>>>> and everything happens betwee the modem and the cpcap pmic.
>>>>
>>>> Iow you don't need McBSP DAI at all. If you would have added the dummy
>>>> codec to McBSP !3 and use that, it would work in a same way, or to DMIC
>>>> or McPDM...
>>>>
>>>> The McBSP ops are NULL for the dummy dai, so McBSP is turned off.
>>>
>>> Hmm yeah I don't know if the cpcap codec on the same mcbsp needs
>>> mcbsp for voice call.
>>>
>>> According to Sebastian sounds like mcbsp can be idle at that point.
>>>
>>> But what about capture of voice call at the mcbsp from the
>>> TDM slot? In that case mcbsp would be active.
>>
>> Sure, but with the dummy dai it won't....
> 
> Right. I'm not attached to the dummy dai, but looks like currently
> snd-soc-audio-graph-card won't work without it.

The generic cards will link up a dummy dai/codec when it is needed by DPMC.

> And we potentially
> do need a place to configure TDM slot specific stuff for mcbsp.

Yes, but you still have one port and one endpoint should not change the
configuration which is already in used for the other endpoint.

>> If I understand correctly the HW setup:
>> McBSP2 -> CPCAP_hifi (only playback)
>>
>> CPCAP_voice is the i2s clock master.
>> McBSP3, CPCAP_voice, MDM6600 and WL1285 are all connected together via
>> i2s lines.
>>
>> In case of Voice call with analog mic/speaker only CPCAP_voice and
>> MDM6600 is used.
>> In case of Voice call with BT only MDM6600 and WL1285 is used (but
>> CPCAP_voice must provide the clocks?)
> 
> Yes my guess is cpcap voice is the clock master in that case.
> It should show up from the cpcap register dump from Android with
> audio playing to a bluetooth headset.

OK.

>> In case you would have any algorithm running on OMAP4 for the calls,
>> then you will have McBSP3 inserted and used between MDM6600 and
>> CPAC_voice/WL1285.
>> Similarly, if you would like to tap in and record the data from the bus
>> you will have McBSP3 enabled.
>>
>> The simplest use cases you want to support:
>> A. McBSP3 <-> CPCAP_voice (playback/capture)
>> B. MDM6600 <-> CPCAP_voice (handset mic/speaker voice call)
>> C. MDM6600 <-> WL1285 (BT voice call)
>> D. McBSP3 <-> BT (VoIP?)
>>
>> I would not bother with recording the call as you would need tom
>> reconfigure the McBSP playback pin (is it even possible) as input to
>> OMAP4, I think..
> 
> Oh, I think there are Android apps to do that though.. Never tried
> if they work on droid4. But if they do, doing a register dump of
> mcbsp3 would show up how it's configured.

I don't see how you could record the data from the line which is
connected to McBSP_DX pin (the pin is output).

But I might be missing something.

>> B/C is codec2codec, McBSP3 is not involved at all.
>> A/D is when McBSP3 is used only.
>>
>> Imho this can be represented as
>> McBSP2: 1 port
>> 	1.1: to CPCAP_hifi
>>
>> McBSP3: 1 port, 2 endpoint
>> 	2.1: to CPCAP_voice
>> 	2.2: to WL1285
>> CPCAP: 2 ports
>> 	hifi:	3.1: to McBSP2
>> 	voice:	4.1: to McBSP3
>> 		4.2: to MDM6600
>> MDM6600: 2 ports
>> 	5.1: to CPAC_voice
>> 	5.2: to WL1285
>> WL1285: 2 ports
>> 	6.1: to McBSP3
>> 	6.2: to MDM6600
>>
>> The machine driver should switch between the graph links based on the
>> use case for the interconnected devices:
>> A: 2.2 <-> 4.1
>> B: 4.2 <-> 5.1
>> C: 6.2 <-> 5.1
>> D: 2.2 <-> 6.1
> 
> OK
> 
>> Can a generic card provide such a functionality?
> 
> I think the link for the patches you posted is patching the
> snd-soc-audio-graph-card already?

Yes it does, but the functionality is there via custom machine drivers.
What I afraid is that such a complex wiring as the Droid4 have it might
be not possible to use a generic - fits everything - driver without
making it a customized one ;)

Otho, if the only thing is the machine level DAPM switching and linking
the paths then it might be relatively straight forward to extend the
simple-card family.

>> In case of B/C you should not have a running stream imho.
>> In all cases CPCAP_voice should be able to run the clocks on i2s, even
>> if it is not used by the audio setup.
>> Not sure if you can just turn Wl1285 as master, but it is possible that
>> it is master, but silent when it is not used?
> 
> Yeah, no idea.. But that's easy to configure in the dts based on
> the graph bindings :)

Yep, indeed.

>> I'm not sure if we should span out dummy dais for endpoints within a
>> port. Imho the port _is_ the dai. Different endpoints might use
>> different TDM slots on the port (or the same slot, which makes them
>> exclusive).
> 
> Right. So right now it seems that for snd-soc-audio-graph-card
> needs the dummy dai, but it's unclear what would need to be
> changed to not use a dummy dai for mcbsp.

Since simple-card family can and will connect up dummy dai/codec when
needed based on the setup, I would look at that and make it do so.

> The dts snippets I posted earlier do follow the graph bindings
> as far as I know. But just to confirm, do you see any need to
> move things around there?

It also states that a port is a physical port which can have multiple
endpoints. But multiple endpoint != DAI. port == dai.

>>>>>>>> I know it was discussed, but can not find the mail:
>>>>>>>> Can you brief again on the audio connection?
>>>>>>>
>>>>>>> Below is a link to a mailing list thread where Sebastian describes
>>>>>>> the audio connection:
>>>>>>>
>>>>>>> https://lkml.org/lkml/2018/3/28/881
>>>>>>
>>>>>> Thanks!
>>>>>>  
>>>>>>>> Do you have branch with working code?
>>>>>>>
>>>>>>> Yeah I have slightly older set of the patches in my droid4-pending-v5.5
>>>>>>> kernel.org git branch with voice calls working.
>>>>>>
>>>>>> I think I should put my droid4 out and try to get it working...
>>>>>> Do you have a link for dummies to follow to get started? ;)
>>>>>
>>>>> Probably the easiest one to use right now is the Maemo-leste devuan based
>>>>> test image using v5.5 kernel + modem and audio patches:
>>>>>
>>>>> https://leste.maemo.org/Motorola_Droid_4
>>>>>
>>>>> Just use a decent speed micro-sd card rated "a1" for example.
>>>>
>>>> Cool. Now I can dual boot the droid4 :D
>>>> I needed to rewrite the /etc/shadow to get a known root password so I
>>>> can log in.
>>>
>>> Not sure if you mean password for the droid4-kexecboot or the
>>> Linux distro you installed..
>>
>> It was for the maemo-leste.
>> Bringing up Gentoo will be a bit harder as I don't have wifi stuff in my
>> reference image...
> 
> Gentoo cool :)
> 
> I've had good luck with just plain alpine armv7 edge, the package
> updates work very fast for a slow system. The musl stuff requires
> running stellarium with 3d acceleration in a minimal devuan or
> whatever chroot environment though for stellarium etc..

I see, I might go via the lazy route and take buildroot ;)

>>> But for droid4-kexecboot, you
>>> can configure it to automatically download new kernels over wlan.
>>> There's some info on the machine specific password and how to
>>> configure wlan in the droid4-kexecboot buildroot commits here:
>>>
>>> https://github.com/tmlind/buildroot/commits/droid4-kexecboot-2017.11
>>>
>>>> Wifi is up, so in theory I can scp kernel/dtb to /boot/boot/ and update
>>>> the /boot/boot/boot.cfg to boot my kernel, right?
>>>
>>> Yeah you can update kernels and modules over wlan from the distro(s)
>>> you have configured, and also from droid4-kexecboot as above.
>>
>> I need to try droid4-kexecboot's wifi support then.
> 
> Yeah you need to configure wpa_supplicant.conf and wlan.conf or
> whatever it was called. And make sure you have copied the old
> stock v3.0.8 kernel wlan modules and firmware as mentioned in
> the droid4-kexecboot git readme and install files.

OK.

> Oh, and also read about the flags you need to use for mkfs.ext4 if
> doing mkfs.ext4 on a PC, the old v3.0.8 kernel won't understand
> all the new flags if you want a partition to be readable for the
> droid4-kexecboot bootloader. And also the all the old Android
> distros currently still stuck with the ancient v3.0.8 kernel :p

I see, thanks for the warning!

> 
> Regards,
> 
> Tony
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
