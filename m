Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4EAD0F32
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 14:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731129AbfJIMxs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 08:53:48 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:9475 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730994AbfJIMxr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Oct 2019 08:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570625625;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=6vH2V5lHL3NiigClBhih4XYbxC61BJAkQyYykew5ddI=;
        b=INz+ylf3frHd2ICtBuH4ZYk3fs3opbXWj5KXnqL9FIUhpTqQ3cOpyjuVO+e2e4JSOg
        Xy+T8ByHSdz/UoHEmbPauw4zobOU4BjBdlncRHfXlo2raqgLl6KmDef4226KuG1WKwJz
        M6QSL5xSmZFxc1Liu1Bx2MtrYrV1IUShO1iXPTlISkQ8/yjBdj7gtFMc4A/hAL24eQ5p
        GSiQWMf2NVgrGvBKgB1NimQrElTfmHxamQEDPEV2StjobkElJUvz/gV5sr1h2ZW9CNbb
        voO6EP9qopwOcWwJZ+zcant19OjRjezmiN2qwT3hNCB+b1bucb38hwp9aLXCnU2klwQY
        uGoA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/ztwDqvvQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v99CrhzeG
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 9 Oct 2019 14:53:43 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <0FEF1AB1-5FE0-4EEE-BEB9-0957BB424C18@goldelico.com>
Date:   Wed, 9 Oct 2019 14:53:42 +0200
Cc:     Merlijn Wajer <merlijn@wizzup.org>, Adam Ford <aford173@gmail.com>,
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
Message-Id: <270E1695-9B1F-4470-AEA2-724E2139BCF5@goldelico.com>
References: <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org> <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com> <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org> <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com> <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org> <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com> <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com> <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com> <ebb50954-b456-4dab-0765-9dfa06c67075@wizzup.org> <C3A56737-6187-4B31-8697-3A02DD164429@goldelico.com> <20191007155252.GQ5610@atomide.com> <64474fb1-f6d2-52d0-175a-65bb493dc1fe@ti.com> <9253CFB5-0AF7-4EA0-AC7F-6DE37318238A@goldelico.com> <0bb4739d-e26f-de49-fd80-257a836e892a@ti.com> <0FEF1AB1-5FE0-4EEE-BEB9-0957BB424C18@goldelico.com>
To:     Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 08.10.2019 um 22:15 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>=20
>> Am 08.10.2019 um 10:00 schrieb Tero Kristo <t-kristo@ti.com>:
>>=20
>> On 07/10/2019 22:24, H. Nikolaus Schaller wrote:
>>> Hi Tero,
>>>> Am 07.10.2019 um 21:18 schrieb Tero Kristo <t-kristo@ti.com>:
>>>>=20
>>>> On 07/10/2019 18:52, Tony Lindgren wrote:
>>>>> Hi,
>>>>> * H. Nikolaus Schaller <hns@goldelico.com> [191005 16:59]:
>>>>> Please try with Tero's current github branch at =
github.com/t-kristo/linux-pm.git
>>>>> 5.4-rc1-ipc from few days ago, the earlier versions had still =
issues.
>>>>=20
>>>> Yeah, this one should be fixed now.
>>> Ok! Will try asap.
>>>>=20
>>>>>> * OMAP5 (Pyra): fails to enable the clocks (did work with the =
previous version)
>>>>>> [  304.140363] clock-controller:clk:0000:0: failed to enable
>>>>>> [  304.147388] PVR_K:(Error): EnableSGXClocks: =
pm_runtime_get_sync failed (16)
>>>>> Hmm no idea what might be up with this one. Did some clkctrl clock
>>>>> fixes maybe cause a regression here? Tero do you have any ideas?
>>>>=20
>>>> So, this one I am not too sure, I haven't looked at omap5 graphics =
clocking. I don't think it has anything to do with reset handling =
though.
>>>>=20
>>>> Is there some simple way to try this out on board; without PVR =
module that is?
>>> Yes, I have also seen it when just running the commands in the =
original commit message [1]:
>>> # echo on > $(find /sys -name control | grep \/5600)
>>> # rwmem 0x5600fe00	# OCP Revision
>>> 0x5600fe00 =3D 0x40000000
>>> # echo auto > $(find /sys -name control | grep \/5600)
>>> # rwmem 0x5600fe10
>>> # rwmem 0x56000024
>>> But I have not yet tested with 5.4-rc2, just 5.4-rc1.
>>=20
>> Ok, there is a one liner DTS data fix for this issue, attached.
>=20
> Yes, have tested and it fixes omap5. I have the 3D demo running again =
on the Pyra. Yay!
>=20
> Together with the latest rstcrtl patches, am335x is now better.
> No omap_reset_deassert: timedout waiting for gfx:0 any more.
>=20
> But I can't access the sgx registers and get memory faults. Maybe
> my script has a bug and is trying the wrong address. Have to check
> with some distance...

Now I have done more tests on am335x. It is not my script but something =
else.

Trying to read 0x5600fe00 after doing

echo on > /sys/bus/platform/devices/5600fe00.target-module/power/control

gives page faults.

When trying to load the kernel driver, the omap_reset_deassert message =
has
gone but the driver does no initialize:

root@letux:~# modprobe pvrsrvkm_omap_am335x_sgx530_125
[   45.774712] pvrsrvkm_omap_am335x_sgx530_125: module is from the =
staging directory, the quality is unknown, you have been warned.
root@letux:~#

Here is the CM/PM register dump after enabling power/control

*** SGX Register Dump ***
0x44E00900 00000301 CM_GFX_L3_CLKSTCTRL
0x44E00904 00050000 CM_GFX_GFX_CLKCTRL
0x44E0090c 00000002 CM_GFX_L4LS_GFX_CLKSTCTR
0x44E00910 00030000 CM_GFX_MMUCFG_CLKCTRL
0x44E00914 00030000 CM_GFX_MMUDATA_CLKCTRL
0x44E0052c 00000000 CM_DPLL.CLKSEL_GFX_FCLK
0x44E01100 00060047 PM_GFX_PWRSTCTRL
0x44E01104 00000001 RM_GFX_RSTCTRL
0x44E01110 00000037 PM_GFX_PWRSTST

BR,
Nikolaus


