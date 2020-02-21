Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 972CB167E5D
	for <lists+linux-omap@lfdr.de>; Fri, 21 Feb 2020 14:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgBUNVa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Feb 2020 08:21:30 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50248 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727213AbgBUNVa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Feb 2020 08:21:30 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01LDKJBt130065;
        Fri, 21 Feb 2020 07:20:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582291219;
        bh=1oz4ttO8AEWwtQd/0Abg8qIyHP8s13hjB9qY+Pr19SM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=KSAeNn6Uc1TrPeECEzlqA9rbx4asW6aOnWdKG49BvYT+gM2fPw24dU9RTPwYDp3K5
         f65YHvoODNH32HgY/8B/G21HrDMN8PT0OlXux9zW7IDmkEQm367zvd/S4cEvpt9wjr
         1vBtwgl3m7PDZfS6IPQv9eRBrZKxRB8zlF5X0DaY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01LDKJ8n100794
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 Feb 2020 07:20:19 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 21
 Feb 2020 07:20:18 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 21 Feb 2020 07:20:18 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01LDKENm121770;
        Fri, 21 Feb 2020 07:20:14 -0600
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
To:     Tony Lindgren <tony@atomide.com>
CC:     Sebastian Reichel <sre@kernel.org>,
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
 <a263a857-bb8a-0e37-6932-dd07df98ad63@ti.com>
 <20200220201559.GX37466@atomide.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <9ea8239f-3b2d-8206-95ee-2789fbae83d4@ti.com>
Date:   Fri, 21 Feb 2020 15:20:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200220201559.GX37466@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 20/02/2020 22.15, Tony Lindgren wrote:
> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200220 14:16]:
>> On 18/02/2020 23.16, Sebastian Reichel wrote:
>>> I suppose in the end its a question if generic card can provide TDM
>>> support.
>>
>> Sure it can, but can it handle the switching between the paths based on
>> use cases?
>> There should be machine level DAPM widgets to kick codec2codec (MDM6600
>> - CPAC_voice for example) and also to make sure that when you switch
>> between them the system is not going to get misconfigured.
>> Switching between CPAC and BT route during call?
>> Not allowing VoIP while on call, etc.
> 
> Well I guess the key thing to check here is if it's enough to
> keep track of things in the cpcap codec driver. If cpcap is always
> involved, that should be sufficient.

The codec driver should keep track on what it can do, but should not
start policing the outside world.
The machine driver knows the connections and should tell the components
on what to do.

> Regards,
> 
> Tony
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
