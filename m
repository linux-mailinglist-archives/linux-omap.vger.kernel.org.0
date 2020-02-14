Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61CA815D87D
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 14:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728557AbgBNNaZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 08:30:25 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49914 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728427AbgBNNaZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 14 Feb 2020 08:30:25 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01EDTKXa099510;
        Fri, 14 Feb 2020 07:29:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581686960;
        bh=1YS7Dkb1NYS+Vzab+7zXb9xNzi0c4pGXQtzL6NFwZhc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=h7/4yVPH0A6KJFxhyxVLluQi0F9+60YTXSitCcA0UnEgri/DNniNo6puJqBm9KDkj
         kGx9TFADBxIQRs1X+KpBZ4IG9fDIMqj4aix+NUbc882FKAiGpCN7NQ/52GHtuaS04K
         DPYIt+BEJdmvf8Ftta9sjdPFqI2slB/jOfEAazSQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01EDTKNn089420
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 14 Feb 2020 07:29:20 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 14
 Feb 2020 07:29:19 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 14 Feb 2020 07:29:19 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01EDTGm2035852;
        Fri, 14 Feb 2020 07:29:17 -0600
Subject: Re: [PATCH] ASoC: cpcap: Implement set_tdm_slot for voice call
 support
To:     Tony Lindgren <tony@atomide.com>
CC:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        "Arthur D ." <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
References: <20200211181005.54008-1-tony@atomide.com>
 <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
 <20200212144620.GJ64767@atomide.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <9a060430-5a3e-61e1-3d2c-f89819d9436f@ti.com>
Date:   Fri, 14 Feb 2020 15:29:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200212144620.GJ64767@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 12/02/2020 16.46, Tony Lindgren wrote:
> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200212 09:18]:
>> On 11/02/2020 20.10, Tony Lindgren wrote:
>>> +static int cpcap_voice_set_tdm_slot(struct snd_soc_dai *dai,
>>> +				    unsigned int tx_mask, unsigned int rx_mask,
>>> +				    int slots, int slot_width)
>>> +{
>>> +	struct snd_soc_component *component = dai->component;
>>> +	struct cpcap_audio *cpcap = snd_soc_component_get_drvdata(component);
>>> +	int err, ts_mask, mask;
>>> +	bool voice_call;
>>> +
>>> +	/*
>>> +	 * Primitive test for voice call, probably needs more checks
>>> +	 * later on for 16-bit calls detected, Bluetooth headset etc.
>>> +	 */
>>> +	if (tx_mask == 0 && rx_mask == 1 && slot_width == 8)
>>> +		voice_call = true;
>>> +	else
>>> +		voice_call = false;
>>
>> You only have voice call if only rx slot0 is in use?
> 
> Yeah so it seems. Then there's the modem to wlcore bluetooth path that
> I have not looked at. But presumably that's again just configuring some
> tdm slot on the PMIC.
> 
>> If you record mono on the voice DAI, then rx_mask is also 1, no?
> 
> It is above :) But maybe I don't follow what you're asking here

If you arecrod -Dvoice_pcm -c1 -fS8 > /dev/null
then it is reasonable that the machine driver will set rx_mask = 1

> and maybe you have some better check in mind.

Not sure, but relying on set_tdm_slots to decide if we are in a call
case does not sound right.

> I have no idea where we would implement recording voice calls for
> example, I guess mcbsp could do that somewhere to dump out a tdm slot
> specific traffic.

Need to check how things are wired and how they expected to work ;)

>>> +
>>> +	ts_mask = 0x7 << CPCAP_BIT_MIC2_TIMESLOT0;
>>> +	ts_mask |= 0x7 << CPCAP_BIT_MIC1_RX_TIMESLOT0;
>>> +
>>> +	mask = (tx_mask & 0x7) << CPCAP_BIT_MIC2_TIMESLOT0;
>>> +	mask |= (rx_mask & 0x7) << CPCAP_BIT_MIC1_RX_TIMESLOT0;
>>> +
>>> +	err = regmap_update_bits(cpcap->regmap, CPCAP_REG_CDI,
>>> +				 ts_mask, mask);
>>> +	if (err)
>>> +		return err;
>>> +
>>> +	err = cpcap_set_samprate(cpcap, CPCAP_DAI_VOICE, slot_width * 1000);
>>> +	if (err)
>>> +		return err;
>>
>> You will also set the sampling rate for voice in
>> cpcap_voice_hw_params(), but that is for normal playback/capture, right?
> 
> Yeah so normal playback/capture is already working with cpcap codec driver
> with mainline Linux. The voice call needs to set rate to 8000.

But if you have a voice call initiated should not the rate be set by the
set_sysclk()?


>>> +
>>> +	err = cpcap_voice_call(cpcap, dai, voice_call);
>>> +	if (err)
>>> +		return err;
>>
>> It feels like that these should be done via DAPM with codec to codec route?
> 
> Sure if you have some better way of doing it :) Do you have an example to
> point me to?

Something along the lines of:
https://mailman.alsa-project.org/pipermail/alsa-devel/2020-February/162915.html

The it is a matter of building and connecting the DAPM routes between
the two codec and with a flip of the switch you would have audio flowing
between them.

> 
> Regards,
> 
> Tony
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
