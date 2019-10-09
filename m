Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18588D111B
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 16:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730955AbfJIOXg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 10:23:36 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:31824 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729491AbfJIOXf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 10:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570631013;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=WO78PW8fS4g19APohzZIaUMFUYs62tbEM4a4+EDeSKs=;
        b=m7dpY1LqgTHoqrazd84sw5vGzICJkT7nljVI/BLFgymJ49ETMD0pr9W7BaxVJHqj83
        Rth1S7sIz6etu70SHosXJ17q9Q0f1vAVztP5o5OSZyvD3yD0VS5qMeRVNO2T+GtG/tkT
        KQal7HrY969QrMBiyxeBIIsQVEktBJMbHTTgD3d/MSoMGFJAGa82y0vy7XsFkxxMp7en
        n5p90ffIJ5TMUH2ZiCtcNk9nI5gXUE0hj7lVWcsMdywOVjweSk8oA7LlYAujcZsbfiZZ
        /b2CrLj6ucyx8l/7hBFwjovD3kopshuEo9aLtDF3g+rQ6Wn2YElcrokEWC585RxN92a7
        A/9A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/ztwDqvvQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v99ENV0EX
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 9 Oct 2019 16:23:31 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <77a524bb-26e7-c090-e7e2-ce0da2896725@ti.com>
Date:   Wed, 9 Oct 2019 16:23:31 +0200
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
Message-Id: <C7139FF6-F71F-4FE4-807B-62E1E5C61238@goldelico.com>
References: <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org> <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com> <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org> <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com> <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org> <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com> <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com> <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com> <ebb50954-b456-4dab-0765-9dfa06c67075@wizzup.org> <C3A56737-6187-4B31-8697-3A02DD164429@goldelico.com> <20191007155252.GQ5610@atomide.com> <64474fb1-f6d2-52d0-175a-65bb493dc1fe@ti.com> <9253CFB5-0AF7-4EA0-AC7F-6DE37318238A@goldelico.com> <0bb4739d-e26f-de49-fd80-257a836e892a@ti.com> <0FEF1AB1-5FE0-4EEE-BEB9-0957BB424C18@goldelico.com> <270E1695-9B1F-4470-AEA2-724E2139BCF5@goldelico.com> <77a524bb-26e7-c090-e7e2-ce0da2896725@ti.com>
To:     Tero Kristo <t-kristo@ti.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 09.10.2019 um 15:55 schrieb Tero Kristo <t-kristo@ti.com>:
>=20
> On 09/10/2019 15:53, H. Nikolaus Schaller wrote:
>>> Am 08.10.2019 um 22:15 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>>=20
>>>=20
>>> But I can't access the sgx registers and get memory faults. Maybe
>>> my script has a bug and is trying the wrong address. Have to check
>>> with some distance...
>> Now I have done more tests on am335x. It is not my script but =
something else.
>> Trying to read 0x5600fe00 after doing
>> echo on > =
/sys/bus/platform/devices/5600fe00.target-module/power/control
>> gives page faults.
>> When trying to load the kernel driver, the omap_reset_deassert =
message has
>> gone but the driver does no initialize:
>> root@letux:~# modprobe pvrsrvkm_omap_am335x_sgx530_125
>> [   45.774712] pvrsrvkm_omap_am335x_sgx530_125: module is from the =
staging directory, the quality is unknown, you have been warned.
>> root@letux:~#
>> Here is the CM/PM register dump after enabling power/control
>> *** SGX Register Dump ***
>> 0x44E00900 00000301 CM_GFX_L3_CLKSTCTRL
>> 0x44E00904 00050000 CM_GFX_GFX_CLKCTRL
>> 0x44E0090c 00000002 CM_GFX_L4LS_GFX_CLKSTCTR
>> 0x44E00910 00030000 CM_GFX_MMUCFG_CLKCTRL
>> 0x44E00914 00030000 CM_GFX_MMUDATA_CLKCTRL
>> 0x44E0052c 00000000 CM_DPLL.CLKSEL_GFX_FCLK
>> 0x44E01100 00060047 PM_GFX_PWRSTCTRL
>> 0x44E01104 00000001 RM_GFX_RSTCTRL
>> 0x44E01110 00000037 PM_GFX_PWRSTST
>=20
> Are you sure you have the graphics node properly applied in your =
kernel?

Not really... There are several patch sets which seem to be necessary
(to support all omap variants) and I am not sure if I have them all and =
correctly.

I have collected these patches on top of v5.4-rc2:

272d7200c77a ARM: dts: omap5: fix gpu_cm clock provider name
96fa23010f2a dt-bindings: omap: add new binding for PRM instances
a164172c1f40 soc: ti: add initial PRM driver with reset control support
42a5e4261993 soc: ti: omap-prm: poll for reset complete during de-assert
9237f39716be soc: ti: omap-prm: add support for denying idle for reset =
clockdomain
bf2ae22e5bcf soc: ti: omap-prm: add omap4 PRM data
be5cb64f10e0 soc: ti: omap-prm: add data for am33xx
86646d7d79be soc: ti: omap-prm: add dra7 PRM data
c3b5455dfd65 soc: ti: omap-prm: add am4 PRM data
e26d4ff7ad15 soc: ti: omap-prm: add omap5 PRM data
66369100d1fc clk: ti: am43xx: drop idlest polling from gfx clock
d96899e143de bus: ti-sysc: re-order reset and main clock controls
45071446bd05 bus: ti-sysc: drop the extra hardreset during init
0da134c3aa9d bus: ti-sysc: avoid toggling power state of module during =
probe
17b70c96b539 ARM: OMAP2+: pdata-quirks: add PRM data for reset support
af81a68c65d7 clk: ti: clkctrl: fix setting up clkctrl clocks
d7dd7f44bce4 clk: ti: clkctrl: convert to use bit helper macros instead =
of bitops
42ee8270adfd clk: ti: clkctrl: add new exported API for checking standby =
info
218b39a8c851 dt-bindings: clk: add omap5 iva clkctrl definitions
41b6c466efde clk: ti: omap5: add IVA subsystem clkctrl data
38cfdebcc2f8 clk: ti: dra7xx: Drop idlest polling from IPU & DSP clkctrl =
clocks
39e827b0dfe5 clk: ti: omap4: Drop idlest polling from IPU & DSP clkctrl =
clocks
f4584f1e5bff clk: ti: omap5: Drop idlest polling from IPU & DSP clkctrl =
clocks
1c7f5871e5a0 clk: ti: am43xx: drop idlest polling from pruss clkctrl =
clock
53363c4cfb3d clk: ti: am33xx: drop idlest polling from pruss clkctrl =
clock
1907994ee9ce ARM: dts: omap5: add IVA clkctrl nodes
8182f3f282de ARM: dts: dra7: add PRM nodes
ff2880fb99c7 ARM: dts: omap4: add PRM nodes
4d49da48c458 ARM: dts: am33xx: Add PRM data
325cffda2b2d ARM: dts: am43xx: Add PRM data
b6ceeb4c5b74 ARM: dts: omap5: Add PRM data
303b7b4bcc60 ARM: dts: dra7: convert IOMMUs to use ti-sysc
d875126d92f7 ARM: dts: dra74x: convert IOMMUs to use ti-sysc
8f699534deb8 ARM: dts: omap4: convert IOMMUs to use ti-sysc
b1ec9e25a686 ARM: dts: omap5: convert IOMMUs to use ti-sysc
e90c0cc1e4a5 ARM: dts: Configure rstctrl reset for SGX


> As you can see the RM_GFX_RSTCTRL is still asserted (it should be zero =
so that you can access the module) and the CM_GFX_GFX_CLKCTRL is also =
disabled (bits 0-1 are 0, should be 2 in the working case.)

Ok.

>=20
> It works for me with my branch + the single am33xx patch from Tony.

Is there a link so that I can compare with the right version?

BR and thanks,
Nikolaus

