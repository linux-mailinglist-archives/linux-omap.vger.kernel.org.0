Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B64FD141E
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 18:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730708AbfJIQfL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 12:35:11 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47044 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730490AbfJIQfL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 12:35:11 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x99GYqLP019957;
        Wed, 9 Oct 2019 11:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570638892;
        bh=JQva5kQwOc3uXEXEFdvdSEYtpsPh59p8NvoxC7dRA18=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ZxQSSDJPWTbqQf8aokCyp61+/ER2IdC5mbxKK/YwY7QJ6IDbaxyN1DHh9m3H935FD
         lpc0vSIPC0XLD/1DtjLPPyc3VfVpzx3PG6eMiZXpBtiCg2xrA5H8QbOmDaWPmGz4F6
         AmA9Jb2RGpWctYJSti5xdI7CauKzQkhVpDdjqWXk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x99GYqg3035753
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 11:34:52 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 11:34:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 11:34:48 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x99GYmJS070151;
        Wed, 9 Oct 2019 11:34:48 -0500
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on
 OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
CC:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Adam Ford <aford173@gmail.com>,
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
 <77a524bb-26e7-c090-e7e2-ce0da2896725@ti.com>
 <C7139FF6-F71F-4FE4-807B-62E1E5C61238@goldelico.com>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <9059e380-3a80-5d93-6224-08e4eeabf116@ti.com>
Date:   Wed, 9 Oct 2019 19:34:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <C7139FF6-F71F-4FE4-807B-62E1E5C61238@goldelico.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 09/10/2019 17:23, H. Nikolaus Schaller wrote:
> 
>> Am 09.10.2019 um 15:55 schrieb Tero Kristo <t-kristo@ti.com>:
>>
>> On 09/10/2019 15:53, H. Nikolaus Schaller wrote:
>>>> Am 08.10.2019 um 22:15 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
>>>>
>>>>
>>>> But I can't access the sgx registers and get memory faults. Maybe
>>>> my script has a bug and is trying the wrong address. Have to check
>>>> with some distance...
>>> Now I have done more tests on am335x. It is not my script but something else.
>>> Trying to read 0x5600fe00 after doing
>>> echo on > /sys/bus/platform/devices/5600fe00.target-module/power/control
>>> gives page faults.
>>> When trying to load the kernel driver, the omap_reset_deassert message has
>>> gone but the driver does no initialize:
>>> root@letux:~# modprobe pvrsrvkm_omap_am335x_sgx530_125
>>> [   45.774712] pvrsrvkm_omap_am335x_sgx530_125: module is from the staging directory, the quality is unknown, you have been warned.
>>> root@letux:~#
>>> Here is the CM/PM register dump after enabling power/control
>>> *** SGX Register Dump ***
>>> 0x44E00900 00000301 CM_GFX_L3_CLKSTCTRL
>>> 0x44E00904 00050000 CM_GFX_GFX_CLKCTRL
>>> 0x44E0090c 00000002 CM_GFX_L4LS_GFX_CLKSTCTR
>>> 0x44E00910 00030000 CM_GFX_MMUCFG_CLKCTRL
>>> 0x44E00914 00030000 CM_GFX_MMUDATA_CLKCTRL
>>> 0x44E0052c 00000000 CM_DPLL.CLKSEL_GFX_FCLK
>>> 0x44E01100 00060047 PM_GFX_PWRSTCTRL
>>> 0x44E01104 00000001 RM_GFX_RSTCTRL
>>> 0x44E01110 00000037 PM_GFX_PWRSTST
>>
>> Are you sure you have the graphics node properly applied in your kernel?
> 
> Not really... There are several patch sets which seem to be necessary
> (to support all omap variants) and I am not sure if I have them all and correctly.
> 
> I have collected these patches on top of v5.4-rc2:
> 
> 272d7200c77a ARM: dts: omap5: fix gpu_cm clock provider name
> 96fa23010f2a dt-bindings: omap: add new binding for PRM instances
> a164172c1f40 soc: ti: add initial PRM driver with reset control support
> 42a5e4261993 soc: ti: omap-prm: poll for reset complete during de-assert
> 9237f39716be soc: ti: omap-prm: add support for denying idle for reset clockdomain
> bf2ae22e5bcf soc: ti: omap-prm: add omap4 PRM data
> be5cb64f10e0 soc: ti: omap-prm: add data for am33xx
> 86646d7d79be soc: ti: omap-prm: add dra7 PRM data
> c3b5455dfd65 soc: ti: omap-prm: add am4 PRM data
> e26d4ff7ad15 soc: ti: omap-prm: add omap5 PRM data
> 66369100d1fc clk: ti: am43xx: drop idlest polling from gfx clock

You should have similar patch as above for am33xx. Otherwise it will 
probably fail probing the ti-sysc, resulting in the failure you see.

-Tero

> d96899e143de bus: ti-sysc: re-order reset and main clock controls
> 45071446bd05 bus: ti-sysc: drop the extra hardreset during init
> 0da134c3aa9d bus: ti-sysc: avoid toggling power state of module during probe
> 17b70c96b539 ARM: OMAP2+: pdata-quirks: add PRM data for reset support
> af81a68c65d7 clk: ti: clkctrl: fix setting up clkctrl clocks
> d7dd7f44bce4 clk: ti: clkctrl: convert to use bit helper macros instead of bitops
> 42ee8270adfd clk: ti: clkctrl: add new exported API for checking standby info
> 218b39a8c851 dt-bindings: clk: add omap5 iva clkctrl definitions
> 41b6c466efde clk: ti: omap5: add IVA subsystem clkctrl data
> 38cfdebcc2f8 clk: ti: dra7xx: Drop idlest polling from IPU & DSP clkctrl clocks
> 39e827b0dfe5 clk: ti: omap4: Drop idlest polling from IPU & DSP clkctrl clocks
> f4584f1e5bff clk: ti: omap5: Drop idlest polling from IPU & DSP clkctrl clocks
> 1c7f5871e5a0 clk: ti: am43xx: drop idlest polling from pruss clkctrl clock
> 53363c4cfb3d clk: ti: am33xx: drop idlest polling from pruss clkctrl clock
> 1907994ee9ce ARM: dts: omap5: add IVA clkctrl nodes
> 8182f3f282de ARM: dts: dra7: add PRM nodes
> ff2880fb99c7 ARM: dts: omap4: add PRM nodes
> 4d49da48c458 ARM: dts: am33xx: Add PRM data
> 325cffda2b2d ARM: dts: am43xx: Add PRM data
> b6ceeb4c5b74 ARM: dts: omap5: Add PRM data
> 303b7b4bcc60 ARM: dts: dra7: convert IOMMUs to use ti-sysc
> d875126d92f7 ARM: dts: dra74x: convert IOMMUs to use ti-sysc
> 8f699534deb8 ARM: dts: omap4: convert IOMMUs to use ti-sysc
> b1ec9e25a686 ARM: dts: omap5: convert IOMMUs to use ti-sysc
> e90c0cc1e4a5 ARM: dts: Configure rstctrl reset for SGX
> 
> 
>> As you can see the RM_GFX_RSTCTRL is still asserted (it should be zero so that you can access the module) and the CM_GFX_GFX_CLKCTRL is also disabled (bits 0-1 are 0, should be 2 in the working case.)
> 
> Ok.
> 
>>
>> It works for me with my branch + the single am33xx patch from Tony.
> 
> Is there a link so that I can compare with the right version?
> 
> BR and thanks,
> Nikolaus
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
