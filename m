Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 896D0D193F
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 21:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730955AbfJITxR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 15:53:17 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:28917 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728804AbfJITxR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 15:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570650793;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=hoeKEzJHGmaPEmTwu9P6ChdSVSO7p2x35e08dIXr/8I=;
        b=fT4QhqM0EiKyFzHgCsxw5fhaZ9VhEffcqvMUMMT/7K3BYPRpK+slz7QAqrvuYjfs+/
        xQbGblheY/9zC1opKS+i3OrJCmVXxTBWNuUzJOFy7NEV+/4AoB3jhEPynxbBDRfyn5wd
        Ieo6RTFO8UWzrgedTjqLM5LSxHsC7xy90Xg+bPCeK03iJDnhIx/DI31rBZCjkMdMy4ko
        +ZpUT7rkuFGMje92sxB/BKb+P+ElYQD5UEUU4OaY6TWl764d7DuxOby35dUf4Q7O/8vG
        K/dCaRZiN6e1eC09jhttfKp4+caBtCL69EzbWJiQgVE0KvOUbeM8lexOZ1GT1Bv26G//
        g5tQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/ztwDqvvQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v99JrB1Fp
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 9 Oct 2019 21:53:11 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <9059e380-3a80-5d93-6224-08e4eeabf116@ti.com>
Date:   Wed, 9 Oct 2019 21:53:10 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Adam Ford <aford173@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        =?utf-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        =?utf-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        James Hilliard <james.hilliard1@gmail.com>,
        kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, maemo-leste@lists.dyne.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4E6A567F-FEC0-479A-A899-55DF6FBB5E13@goldelico.com>
References: <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org> <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com> <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org> <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com> <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org> <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com> <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com> <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com> <ebb50954-b456-4dab-0765-9dfa06c67075@wizzup.org> <C3A56737-6187-4B31-8697-3A02DD164429@goldelico.com> <20191007155252.GQ5610@atomide.com> <64474fb1-f6d2-52d0-175a-65bb493dc1fe@ti.com> <9253CFB5-0AF7-4EA0-AC7F-6DE37318238A@goldelico.com> <0bb4739d-e26f-de49-fd80-257a836e892a@ti.com> <0FEF1AB1-5FE0-4EEE-BEB9-0957BB424C18@goldelico.com> <270E1695-9B1F-4470-AEA2-724E2139BCF5@goldelico.com> <77a524bb-26e7-c090-e7e2-ce0da2896725@ti.com> <C7139FF6-F71F-4FE4-807B-62E1E5C61238@goldelico.com> <9059e380-3a80-5d93-6224-08e4eeabf116@ti.com>
To:     Tero Kristo <t-kristo@ti.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 09.10.2019 um 18:34 schrieb Tero Kristo <t-kristo@ti.com>:
>=20
> On 09/10/2019 17:23, H. Nikolaus Schaller wrote:
>>> Am 09.10.2019 um 15:55 schrieb Tero Kristo <t-kristo@ti.com>:
>>>=20
>>> On 09/10/2019 15:53, H. Nikolaus Schaller wrote:
>>>>> Am 08.10.2019 um 22:15 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>>>>=20
>>>>>=20
>>>>> But I can't access the sgx registers and get memory faults. Maybe
>>>>> my script has a bug and is trying the wrong address. Have to check
>>>>> with some distance...
>>>> Now I have done more tests on am335x. It is not my script but =
something else.
>>>> Trying to read 0x5600fe00 after doing
>>>> echo on > =
/sys/bus/platform/devices/5600fe00.target-module/power/control
>>>> gives page faults.
>>>> When trying to load the kernel driver, the omap_reset_deassert =
message has
>>>> gone but the driver does no initialize:
>>>> root@letux:~# modprobe pvrsrvkm_omap_am335x_sgx530_125
>>>> [   45.774712] pvrsrvkm_omap_am335x_sgx530_125: module is from the =
staging directory, the quality is unknown, you have been warned.
>>>> root@letux:~#
>>>> Here is the CM/PM register dump after enabling power/control
>>>> *** SGX Register Dump ***
>>>> 0x44E00900 00000301 CM_GFX_L3_CLKSTCTRL
>>>> 0x44E00904 00050000 CM_GFX_GFX_CLKCTRL
>>>> 0x44E0090c 00000002 CM_GFX_L4LS_GFX_CLKSTCTR
>>>> 0x44E00910 00030000 CM_GFX_MMUCFG_CLKCTRL
>>>> 0x44E00914 00030000 CM_GFX_MMUDATA_CLKCTRL
>>>> 0x44E0052c 00000000 CM_DPLL.CLKSEL_GFX_FCLK
>>>> 0x44E01100 00060047 PM_GFX_PWRSTCTRL
>>>> 0x44E01104 00000001 RM_GFX_RSTCTRL
>>>> 0x44E01110 00000037 PM_GFX_PWRSTST
>>>=20
>>> Are you sure you have the graphics node properly applied in your =
kernel?
>> Not really... There are several patch sets which seem to be necessary
>> (to support all omap variants) and I am not sure if I have them all =
and correctly.
>> I have collected these patches on top of v5.4-rc2:
>> 272d7200c77a ARM: dts: omap5: fix gpu_cm clock provider name
>> 96fa23010f2a dt-bindings: omap: add new binding for PRM instances
>> a164172c1f40 soc: ti: add initial PRM driver with reset control =
support
>> 42a5e4261993 soc: ti: omap-prm: poll for reset complete during =
de-assert
>> 9237f39716be soc: ti: omap-prm: add support for denying idle for =
reset clockdomain
>> bf2ae22e5bcf soc: ti: omap-prm: add omap4 PRM data
>> be5cb64f10e0 soc: ti: omap-prm: add data for am33xx
>> 86646d7d79be soc: ti: omap-prm: add dra7 PRM data
>> c3b5455dfd65 soc: ti: omap-prm: add am4 PRM data
>> e26d4ff7ad15 soc: ti: omap-prm: add omap5 PRM data
>> 66369100d1fc clk: ti: am43xx: drop idlest polling from gfx clock
>=20
> You should have similar patch as above for am33xx. Otherwise it will =
probably fail probing the ti-sysc, resulting in the failure you see.
>=20
> -Tero
>=20
>> d96899e143de bus: ti-sysc: re-order reset and main clock controls
>> 45071446bd05 bus: ti-sysc: drop the extra hardreset during init
>> 0da134c3aa9d bus: ti-sysc: avoid toggling power state of module =
during probe
>> 17b70c96b539 ARM: OMAP2+: pdata-quirks: add PRM data for reset =
support
>> af81a68c65d7 clk: ti: clkctrl: fix setting up clkctrl clocks
>> d7dd7f44bce4 clk: ti: clkctrl: convert to use bit helper macros =
instead of bitops
>> 42ee8270adfd clk: ti: clkctrl: add new exported API for checking =
standby info
>> 218b39a8c851 dt-bindings: clk: add omap5 iva clkctrl definitions
>> 41b6c466efde clk: ti: omap5: add IVA subsystem clkctrl data
>> 38cfdebcc2f8 clk: ti: dra7xx: Drop idlest polling from IPU & DSP =
clkctrl clocks
>> 39e827b0dfe5 clk: ti: omap4: Drop idlest polling from IPU & DSP =
clkctrl clocks
>> f4584f1e5bff clk: ti: omap5: Drop idlest polling from IPU & DSP =
clkctrl clocks
>> 1c7f5871e5a0 clk: ti: am43xx: drop idlest polling from pruss clkctrl =
clock
>> 53363c4cfb3d clk: ti: am33xx: drop idlest polling from pruss clkctrl =
clock

so the pattern of ^^^ but for gfx clock?

Yes, there seems to be

[PATCH 1/2] clk: ti: am33xx: drop idlest polling from gfx clock

which I am missing. Most likely, I accidentally did download from
patchwork just a single patch (am43xx) and not the series...

With this patch added, I now have access to the sgx registers:

root@letux:~# ./sgxdump=20
*** SGX Register Dump ***
0x44E00900 00000302 CM_GFX_L3_CLKSTCTRL
0x44E00904 00040002 CM_GFX_GFX_CLKCTRL
0x44E0090c 00000002 CM_GFX_L4LS_GFX_CLKSTCTR
0x44E00910 00030000 CM_GFX_MMUCFG_CLKCTRL
0x44E00914 00030000 CM_GFX_MMUDATA_CLKCTRL
0x44E0052c 00000000 CM_DPLL.CLKSEL_GFX_FCLK
0x44E01100 00060047 PM_GFX_PWRSTCTRL
0x44E01104 00000000 RM_GFX_RSTCTRL
0x44E01110 00000037 PM_GFX_PWRSTST
0x5600fe14 00000000 SGX_CORE_VERSION
0x5600fe00 40000000 OCP_REVISION
0x5600fe04 00000005 OCP_HWINFO
0x5600fe10 00000028 OCP_SYSCONFIG
0x5600fe24 00000000 OCP_IRQSTATUS_RA_0
0x5600fe28 00000000 OCP_IRQSTATUS_RA_1
0x5600fe2c 00000000 OCP_IRQSTATUS_RA_2
0x5600fe30 00000000 OCP_IRQSTATUS_0
0x5600fe34 00000000 OCP_IRQSTATUS_1
0x5600fe38 00000000 OCP_IRQSTATUS_2
0x5600fe3c 00000000 OCP_IRQENABLE_SET_0
0x5600fe40 00000000 OCP_IRQENABLE_SET_1
0x5600fe44 00000000 OCP_IRQENABLE_SET_2
0x5600fe48 00000000 OCP_IRQENABLE_CLR_0
0x5600fe4c 00000000 OCP_IRQENABLE_CLR_1
0x5600fe50 00000000 OCP_IRQENABLE_CLR_2
0x5600ff00 00000014 OCP_PAGE_CONFIG
0x5600ff04 00000000 OCP_INTERRUPT_EVENT
0x5600ff08 00000000 OCP_DEBUG_CONFIG
0x5600ff0c 023fe407 OCP_DEBUG_STATUS
0x56000010 01120000 SGX_CORE_VERSION
0x56000014 00010205 SGX_CORE_REVISION
root@letux:~# root@letux:~# modprobe pvrsrvkm_omap_am335x_sgx530_125
[  282.569941] pvrsrvkm_omap_am335x_sgx530_125: module is from the =
staging directory, the quality is unknown, you have been warned.
[  282.673908] [drm] Initialized pvr 1.14.3699939 20110701 for =
56000000.sgx on minor 1
root@letux:~#=20

The 0112 of SGX_CORE_VERSION is sgx530 and 010205 is revision -125
as expected.

Starting pvr still reports that the ukernel can not be loaded,
but that is somewhere in the pvrsrvkm code that my driver
only likes the omap5+sgx544 at the moment.

Latest v5.4-rc2 code is here: [1]

Thanks and BR,
Nikolaus

[1]: =
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/tree/letux-pvr=
