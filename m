Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAC09D66EA
	for <lists+linux-omap@lfdr.de>; Mon, 14 Oct 2019 18:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387931AbfJNQLl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Oct 2019 12:11:41 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:23752 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731121AbfJNQLl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 14 Oct 2019 12:11:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571069496;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=6qSov3Hb5OrALou0VvA4Jh0umGO7LkXI7A0nsJccwFo=;
        b=QJgaaJ6a1lghqyv2BL1MkEdiQonsdvaFry8yVxjKry2uDBVu1NOgY8XRXXmdYEkvlZ
        CyjlVm4UV6tzJAxCQPJSUWEZLKz+vnmwV1OJtf4CbQa3aLQPZM0rkmCZyoMh9rom7EfO
        TXF0qJ3akhYnLNUBsXXCyUGCNH+c0wbu171F8b/zzhR8JQ8lzQ6fVhIrbpHdbYdnY6T9
        7r22FOm73h1sVbcpq9e6Ozr7ygkcPFiFddbplCINmpaqU4zkC8hfS3uow8M1SfgQLWH8
        uk8jaUF5IyjBX6VnU473EJr5qdI7eiGcuA8PSX7jiNkdrg0SIMcWAEc6RBYFzZ7YMcJ1
        bgDg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/zpwDOpBCI="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v9EGBXKQi
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 14 Oct 2019 18:11:33 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] Lay common foundation to make PVR/SGX work without hacks on OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <72851E17-9B56-4CA5-B164-667836A7C894@goldelico.com>
Date:   Mon, 14 Oct 2019 18:11:33 +0200
Cc:     Merlijn Wajer <merlijn@wizzup.org>, Adam Ford <aford173@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Philipp Rossak <embed3d@gmail.com>,
        =?utf-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        =?utf-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        James Hilliard <james.hilliard1@gmail.com>,
        maemo-leste@lists.dyne.org,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@pyra-handheld.com, Robert Nelson <robertcnelson@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1A69DA38-DD6D-4C2B-9F42-D293796AC98A@goldelico.com>
References: <20180108214032.GW3872@atomide.com> <0b00ce0a-969f-e638-8247-c2da96cf7ce6@gmail.com> <20190213004143.GP5720@atomide.com> <480AB632-A544-41E7-95A4-DC354AEBB71A@goldelico.com> <CAKpie0SigGGsQxSU+X-Mz5boy-Xx=3wRNOcrf+F=ehFr3RBi7Q@mail.gmail.com> <092210C3-05DE-4AFB-986F-81BD8F990B67@goldelico.com> <CAKpie0RXM1UC33YFeFy-kAxfGhYGNkw4vUgNTThf-ZCAhPTVXw@mail.gmail.com> <BE23C1E4-2877-49FA-B230-F9C10691B805@goldelico.com> <CAKpie0TSo-8gmDm9_Zw4Sd+kjVVEomp8yA9Vu8qY2U2AcrQc=w@mail.gmail.com> <8A069D96-C65F-43F5-8F54-20019CFB1A8D@goldelico.com> <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org> <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com> <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org> <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com> <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org> <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com> <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com> <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com> <ebb50954-b456- 4dab-0765-9dfa06c67075@wizzup.org> <C3A56737-6187-4B31-8697-3A02DD164429@goldelico.com> <72851E17-9B56-4CA5-B164-667836A7C894@goldelico.com>
To:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 12.10.2019 um 15:09 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi,
>=20
>> Am 05.10.2019 um 18:58 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> I have found the following description, followed all steps, and it =
works:
>=20
> http://blog.0xpebbles.org/PowerVR-SGX-on-the-beaglebone-black-in-2019
>=20
> So with this, I have got a working user-space setup for BeagleBone and =
some working
> pvrsrvkm.ko module (kernel 4.4.155-ti-r155) for evaluation.

> What I don't have yet is the full source code or build recipe for the =
specific
> 4.4.155-ti-r155 pvrsrvkm.ko from TI.
>=20
> But even without having this yet, I can start experiments by replacing
> kernel and pvrsrvkm.ko with mine. This should allow to gain new =
insights.

Good news:

after making a Hybrid SD image of the setup described above and =
replacing the
4.4.155-ti-r155 kernel with its pvrsrvkm.ko by my own 5.4-rc2 kernel and =
pvrsrvkm,
I was able to start the pvrsrv uKernel. And run the gles1test1 on =
beaglebone
(without LCD but also without errors).

With this knowledge I could adapt my user-space. There are indeed =
different
non-free binaries for sgx530, sgx540, sgx544. And SGX needs enough =
coherent memory.
So I could make a completely self-built kernel and rootfs (using the git =
clone from
ti for the firmware + make install) run on BeagleBone.

Here is a quickly taken video:

https://youtu.be/jFCPR_EvtjY

With the same setup, I can now also load the kernel driver and run =
pvrsrvctl on
DM3730 without errors, but the gles1test1 reports some error and fails =
to run.
Maybe something in the video subsystem or memory mapping is still wrong.

Unfortunately, the same setup does not run on omap5. It looks like there =
are different
releases for the non-free binaries and I have to pick the right one.

On BBB the version I could make running is branch =
ti-img-sgx/1.14.3699939_k4.4 from
git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git. Target ti335x =
works while
target jacinto6evm fails for OMAP5. A diff on the binaries for e.g. =
pvrsrvctl shows
that they are different.

If you want to repeat this setup and my instructions are too imprecise, =
please
ask.

So in summary this means:
* the common foundation (clock, reset, power etc.) setup is working - =
thanks to Tero, Tony and others
* I have added device tree nodes for each SoC type to define sgx =
registers, interrupts, compatible etc.
* compiling SoC specific kernel module variants from single source tree =
works
* the work can already be demoed on BBB and OMAP5 Pyra (using different =
user-space binaries)

Basically I am now ready to post an RFC for the sgx child device nodes =
together
with a bindings document [1]. But I am not sure if I should better wait =
until
really all underlaying prm+rtsctl+syscon+idlest-polling patches by Tero =
and Tony [2]
have matured in linux-next and have arrived in v5.5-rc1. Would be short =
before Xmas.

Independent of low level patches, we all have to discuss how we want to =
get the GPLed
kernel driver [3] into mainline drivers/staging. This likely needs more =
cleanup before
it can be proposed.

BR,
Nikolaus

[1]: =
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commits/letux/omap=
-pvr-soc-glue-v5
[2]: =
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commits/letux/omap=
-sysc-prm-gfx
[3]: =
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commits/letux/late=
st-pvr

