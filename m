Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A11F1D10A8
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 15:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727920AbfJIN4c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 09:56:32 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54738 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725879AbfJIN4c (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 09:56:32 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x99Du3tW106389;
        Wed, 9 Oct 2019 08:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570629363;
        bh=hbdDrA0vSGnIZLRZOIoGDktsgyTNdj9lFpmEA/gGcxo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jKYu5D9yuPCV40R2N4YRCYuAQ1LSn6zSOsQcAGzUit3tLd9TYmEcG1vtAKJhjGaUr
         TZ7FQSC9DeyFiI4pKNH0bGyeb9CoOVaoJK1LvrmGI9Qdkrju75W44NuJuSQNl98rfU
         eubjWi83qcGdkmKl7unKYhAU4W1rrojlyWv8RMUo=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x99Du2bl112740
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 08:56:02 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 08:56:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 08:56:01 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x99DtvJL084946;
        Wed, 9 Oct 2019 08:55:58 -0500
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on
 OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Merlijn Wajer <merlijn@wizzup.org>, Adam Ford <aford173@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        =?UTF-8?Q?Filip_Matijevi=c4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        James Hilliard <james.hilliard1@gmail.com>,
        <kernel@pyra-handheld.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, <maemo-leste@lists.dyne.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
References: <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org>
 <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com>
 <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org>
 <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com>
 <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org>
 <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com>
 <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com>
 <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com>
 <ebb50954-b456-4dab-0765-9dfa06c67075@wizzup.org>
 <C3A56737-6187-4B31-8697-3A02DD164429@goldelico.com>
 <20191007155252.GQ5610@atomide.com>
 <64474fb1-f6d2-52d0-175a-65bb493dc1fe@ti.com>
 <9253CFB5-0AF7-4EA0-AC7F-6DE37318238A@goldelico.com>
 <0bb4739d-e26f-de49-fd80-257a836e892a@ti.com>
 <0FEF1AB1-5FE0-4EEE-BEB9-0957BB424C18@goldelico.com>
 <270E1695-9B1F-4470-AEA2-724E2139BCF5@goldelico.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <77a524bb-26e7-c090-e7e2-ce0da2896725@ti.com>
Date:   Wed, 9 Oct 2019 16:55:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <270E1695-9B1F-4470-AEA2-724E2139BCF5@goldelico.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 09/10/2019 15:53, H. Nikolaus Schaller wrote:
> 
>> Am 08.10.2019 um 22:15 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
>>
>>
>>> Am 08.10.2019 um 10:00 schrieb Tero Kristo <t-kristo@ti.com>:
>>>
>>> On 07/10/2019 22:24, H. Nikolaus Schaller wrote:
>>>> Hi Tero,
>>>>> Am 07.10.2019 um 21:18 schrieb Tero Kristo <t-kristo@ti.com>:
>>>>>
>>>>> On 07/10/2019 18:52, Tony Lindgren wrote:
>>>>>> Hi,
>>>>>> * H. Nikolaus Schaller <hns@goldelico.com> [191005 16:59]:
>>>>>> Please try with Tero's current github branch at github.com/t-kristo/linux-pm.git
>>>>>> 5.4-rc1-ipc from few days ago, the earlier versions had still issues.
>>>>>
>>>>> Yeah, this one should be fixed now.
>>>> Ok! Will try asap.
>>>>>
>>>>>>> * OMAP5 (Pyra): fails to enable the clocks (did work with the previous version)
>>>>>>> [  304.140363] clock-controller:clk:0000:0: failed to enable
>>>>>>> [  304.147388] PVR_K:(Error): EnableSGXClocks: pm_runtime_get_sync failed (16)
>>>>>> Hmm no idea what might be up with this one. Did some clkctrl clock
>>>>>> fixes maybe cause a regression here? Tero do you have any ideas?
>>>>>
>>>>> So, this one I am not too sure, I haven't looked at omap5 graphics clocking. I don't think it has anything to do with reset handling though.
>>>>>
>>>>> Is there some simple way to try this out on board; without PVR module that is?
>>>> Yes, I have also seen it when just running the commands in the original commit message [1]:
>>>> # echo on > $(find /sys -name control | grep \/5600)
>>>> # rwmem 0x5600fe00	# OCP Revision
>>>> 0x5600fe00 = 0x40000000
>>>> # echo auto > $(find /sys -name control | grep \/5600)
>>>> # rwmem 0x5600fe10
>>>> # rwmem 0x56000024
>>>> But I have not yet tested with 5.4-rc2, just 5.4-rc1.
>>>
>>> Ok, there is a one liner DTS data fix for this issue, attached.
>>
>> Yes, have tested and it fixes omap5. I have the 3D demo running again on the Pyra. Yay!
>>
>> Together with the latest rstcrtl patches, am335x is now better.
>> No omap_reset_deassert: timedout waiting for gfx:0 any more.
>>
>> But I can't access the sgx registers and get memory faults. Maybe
>> my script has a bug and is trying the wrong address. Have to check
>> with some distance...
> 
> Now I have done more tests on am335x. It is not my script but something else.
> 
> Trying to read 0x5600fe00 after doing
> 
> echo on > /sys/bus/platform/devices/5600fe00.target-module/power/control
> 
> gives page faults.
> 
> When trying to load the kernel driver, the omap_reset_deassert message has
> gone but the driver does no initialize:
> 
> root@letux:~# modprobe pvrsrvkm_omap_am335x_sgx530_125
> [   45.774712] pvrsrvkm_omap_am335x_sgx530_125: module is from the staging directory, the quality is unknown, you have been warned.
> root@letux:~#
> 
> Here is the CM/PM register dump after enabling power/control
> 
> *** SGX Register Dump ***
> 0x44E00900 00000301 CM_GFX_L3_CLKSTCTRL
> 0x44E00904 00050000 CM_GFX_GFX_CLKCTRL
> 0x44E0090c 00000002 CM_GFX_L4LS_GFX_CLKSTCTR
> 0x44E00910 00030000 CM_GFX_MMUCFG_CLKCTRL
> 0x44E00914 00030000 CM_GFX_MMUDATA_CLKCTRL
> 0x44E0052c 00000000 CM_DPLL.CLKSEL_GFX_FCLK
> 0x44E01100 00060047 PM_GFX_PWRSTCTRL
> 0x44E01104 00000001 RM_GFX_RSTCTRL
> 0x44E01110 00000037 PM_GFX_PWRSTST

Are you sure you have the graphics node properly applied in your kernel?

As you can see the RM_GFX_RSTCTRL is still asserted (it should be zero 
so that you can access the module) and the CM_GFX_GFX_CLKCTRL is also 
disabled (bits 0-1 are 0, should be 2 in the working case.)

It works for me with my branch + the single am33xx patch from Tony.

-Tero

> 
> BR,
> Nikolaus
> 
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
