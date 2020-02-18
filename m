Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1E33162655
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 13:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgBRMoc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Feb 2020 07:44:32 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35564 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbgBRMoc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Feb 2020 07:44:32 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01IChFUY016476;
        Tue, 18 Feb 2020 06:43:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582029795;
        bh=ta+i5kdqlBabGZiL7sfQra7k6ZhyhgsMg6lC7O4YRD4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=chFZvMokcZf3+ThmhqogSYcURzUmjtM+mSxFkhhuLBLvJ5HeogjpZH8LIk93wfSAz
         FDDhnTTRIOIdNddPOnaH3ZvulVWD5JJRLbqL7Z9kSAng1sfyoc8S6vmUaMvXhiuuGH
         se9vRKHuocyxMXT5XN2s5iUB0WE6QiRv2SnuAGhA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01IChFi1081232
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 18 Feb 2020 06:43:15 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 18
 Feb 2020 06:43:14 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 18 Feb 2020 06:43:14 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01IChA0F048688;
        Tue, 18 Feb 2020 06:43:11 -0600
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
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <5402eba8-4f84-0973-e11b-6ab2667ada85@ti.com>
Date:   Tue, 18 Feb 2020 14:43:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200217231001.GC35972@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 18/02/2020 1.10, Tony Lindgren wrote:
> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200217 12:10]:
>> On 14/02/2020 19.03, Tony Lindgren wrote:
>>> But right now in droid4 voice call case mcbsp is just the i2s transport,
>>> and everything happens betwee the modem and the cpcap pmic.
>>
>> Iow you don't need McBSP DAI at all. If you would have added the dummy
>> codec to McBSP !3 and use that, it would work in a same way, or to DMIC
>> or McPDM...
>>
>> The McBSP ops are NULL for the dummy dai, so McBSP is turned off.
> 
> Hmm yeah I don't know if the cpcap codec on the same mcbsp needs
> mcbsp for voice call.
> 
> According to Sebastian sounds like mcbsp can be idle at that point.
> 
> But what about capture of voice call at the mcbsp from the
> TDM slot? In that case mcbsp would be active.

Sure, but with the dummy dai it won't....

If I understand correctly the HW setup:
McBSP2 -> CPCAP_hifi (only playback)

CPCAP_voice is the i2s clock master.
McBSP3, CPCAP_voice, MDM6600 and WL1285 are all connected together via
i2s lines.

In case of Voice call with analog mic/speaker only CPCAP_voice and
MDM6600 is used.
In case of Voice call with BT only MDM6600 and WL1285 is used (but
CPCAP_voice must provide the clocks?)
In case you would have any algorithm running on OMAP4 for the calls,
then you will have McBSP3 inserted and used between MDM6600 and
CPAC_voice/WL1285.
Similarly, if you would like to tap in and record the data from the bus
you will have McBSP3 enabled.

The simplest use cases you want to support:
A. McBSP3 <-> CPCAP_voice (playback/capture)
B. MDM6600 <-> CPCAP_voice (handset mic/speaker voice call)
C. MDM6600 <-> WL1285 (BT voice call)
D. McBSP3 <-> BT (VoIP?)

I would not bother with recording the call as you would need tom
reconfigure the McBSP playback pin (is it even possible) as input to
OMAP4, I think..

B/C is codec2codec, McBSP3 is not involved at all.
A/D is when McBSP3 is used only.

Imho this can be represented as
McBSP2: 1 port
	1.1: to CPCAP_hifi

McBSP3: 1 port, 2 endpoint
	2.1: to CPCAP_voice
	2.2: to WL1285
CPCAP: 2 ports
	hifi:	3.1: to McBSP2
	voice:	4.1: to McBSP3
		4.2: to MDM6600
MDM6600: 2 ports
	5.1: to CPAC_voice
	5.2: to WL1285
WL1285: 2 ports
	6.1: to McBSP3
	6.2: to MDM6600

The machine driver should switch between the graph links based on the
use case for the interconnected devices:
A: 2.2 <-> 4.1
B: 4.2 <-> 5.1
C: 6.2 <-> 5.1
D: 2.2 <-> 6.1

Can a generic card provide such a functionality?
In case of B/C you should not have a running stream imho.
In all cases CPCAP_voice should be able to run the clocks on i2s, even
if it is not used by the audio setup.
Not sure if you can just turn Wl1285 as master, but it is possible that
it is master, but silent when it is not used?

I'm not sure if we should span out dummy dais for endpoints within a
port. Imho the port _is_ the dai. Different endpoints might use
different TDM slots on the port (or the same slot, which makes them
exclusive).

> 
>>>>>> I know it was discussed, but can not find the mail:
>>>>>> Can you brief again on the audio connection?
>>>>>
>>>>> Below is a link to a mailing list thread where Sebastian describes
>>>>> the audio connection:
>>>>>
>>>>> https://lkml.org/lkml/2018/3/28/881
>>>>
>>>> Thanks!
>>>>  
>>>>>> Do you have branch with working code?
>>>>>
>>>>> Yeah I have slightly older set of the patches in my droid4-pending-v5.5
>>>>> kernel.org git branch with voice calls working.
>>>>
>>>> I think I should put my droid4 out and try to get it working...
>>>> Do you have a link for dummies to follow to get started? ;)
>>>
>>> Probably the easiest one to use right now is the Maemo-leste devuan based
>>> test image using v5.5 kernel + modem and audio patches:
>>>
>>> https://leste.maemo.org/Motorola_Droid_4
>>>
>>> Just use a decent speed micro-sd card rated "a1" for example.
>>
>> Cool. Now I can dual boot the droid4 :D
>> I needed to rewrite the /etc/shadow to get a known root password so I
>> can log in.
> 
> Not sure if you mean password for the droid4-kexecboot or the
> Linux distro you installed..

It was for the maemo-leste.
Bringing up Gentoo will be a bit harder as I don't have wifi stuff in my
reference image...

> But for droid4-kexecboot, you
> can configure it to automatically download new kernels over wlan.
> There's some info on the machine specific password and how to
> configure wlan in the droid4-kexecboot buildroot commits here:
> 
> https://github.com/tmlind/buildroot/commits/droid4-kexecboot-2017.11
> 
>> Wifi is up, so in theory I can scp kernel/dtb to /boot/boot/ and update
>> the /boot/boot/boot.cfg to boot my kernel, right?
> 
> Yeah you can update kernels and modules over wlan from the distro(s)
> you have configured, and also from droid4-kexecboot as above.

I need to try droid4-kexecboot's wifi support then.

> And note that kexecboot looks for a boot/boot.cfg file to use on
> every usable parition it finds and uses all the found entries
> based on the priority configured for the boot.cfg entry.

OK, thanks!

> 
> Regards,
> 
> Tony
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
