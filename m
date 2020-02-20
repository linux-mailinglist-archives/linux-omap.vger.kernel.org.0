Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3E00165F8B
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 15:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgBTOQZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 09:16:25 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45454 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbgBTOQZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 Feb 2020 09:16:25 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KEFGMm051288;
        Thu, 20 Feb 2020 08:15:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582208116;
        bh=Axzg4rCh+ok1KaDsGcP9AyakqPBpC/mwibitdg3IGVw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=pCKRt1az0CeDDzXENnEc0MpcujZQB0YGekohRP4P5jXgjcreBXflff1LrL4Ub1TZL
         DxnB5RImn2+G2ZNRAVYSsuCfZIUK4AoioyfGKQNj8G3Qufr3OerZ/OA32JqhUfiHat
         rpVl02uBPoe3igOGt4IAxogn0D0GewhssAGRTp5A=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KEFGMQ012068
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 Feb 2020 08:15:16 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 20
 Feb 2020 08:15:16 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 20 Feb 2020 08:15:16 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KEFCgO095562;
        Thu, 20 Feb 2020 08:15:12 -0600
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
To:     Sebastian Reichel <sre@kernel.org>
CC:     Tony Lindgren <tony@atomide.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Arthur D ." <spinal.by@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
 <20200214170322.GZ64767@atomide.com>
 <d9a43fcb-ed0f-5cd5-7e22-58924d571d17@ti.com>
 <20200217231001.GC35972@atomide.com>
 <5402eba8-4f84-0973-e11b-6ab2667ada85@ti.com>
 <20200218211631.fxojsxzvttoidfed@earth.universe>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <a263a857-bb8a-0e37-6932-dd07df98ad63@ti.com>
Date:   Thu, 20 Feb 2020 16:15:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200218211631.fxojsxzvttoidfed@earth.universe>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

On 18/02/2020 23.16, Sebastian Reichel wrote:
>> The simplest use cases you want to support:
>> A. McBSP3 <-> CPCAP_voice (playback/capture)
>> B. MDM6600 <-> CPCAP_voice (handset mic/speaker voice call)
>> C. MDM6600 <-> WL1285 (BT voice call)
>> D. McBSP3 <-> BT (VoIP?)
> 
> Your description matches my understanding of the hardware setup.
> 
>> I would not bother with recording the call as you would need tom
>> reconfigure the McBSP playback pin (is it even possible) as input to
>> OMAP4, I think..
>>
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
> 
> I suppose you mean 1 port, 2 endpoints?

Oh yes. Numbers....

> 
>> 	5.1: to CPAC_voice
>> 	5.2: to WL1285
>> WL1285: 2 ports
> 
> and here too?

here too ;)

> 
>> 	6.1: to McBSP3
>> 	6.2: to MDM6600
>>
>> The machine driver should switch between the graph links based on the
>> use case for the interconnected devices:
>> A: 2.2 <-> 4.1
>> B: 4.2 <-> 5.1
>> C: 6.2 <-> 5.1
>> D: 2.2 <-> 6.1
>>
>> Can a generic card provide such a functionality?
> 
> I suppose in the end its a question if generic card can provide TDM
> support.

Sure it can, but can it handle the switching between the paths based on
use cases?
There should be machine level DAPM widgets to kick codec2codec (MDM6600
- CPAC_voice for example) and also to make sure that when you switch
between them the system is not going to get misconfigured.
Switching between CPAC and BT route during call?
Not allowing VoIP while on call, etc.

>> In case of B/C you should not have a running stream imho.
> 
> I would expect, that MDM6600 codec marks itself as running/stopped
> based on call state. That should enable DAPM widgets automatically
> when CPCAP_voice is routed to MDM6600?
> 
>> In all cases CPCAP_voice should be able to run the clocks on i2s,
>> even if it is not used by the audio setup.
>> Not sure if you can just turn Wl1285 as master, but it is possible
>> that it is master, but silent when it is not used?
> 
> I provided CPCAP registers for BT call, which should be enough to
> figure this out (I did not yet analyze the results myself).

I got the datasheet from NXP (thanks for the pointer!), I try to look at
it in a coming days.

>> I'm not sure if we should span out dummy dais for endpoints within a
>> port. Imho the port _is_ the dai. Different endpoints might use
>> different TDM slots on the port (or the same slot, which makes them
>> exclusive).
> 
> Makes sense to me.
> 
> -- Sebastian
- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
