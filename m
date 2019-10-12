Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C59DFD4FE7
	for <lists+linux-omap@lfdr.de>; Sat, 12 Oct 2019 15:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfJLNKF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 12 Oct 2019 09:10:05 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:33029 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbfJLNKF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 12 Oct 2019 09:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570885799;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ekWesNvGuUfOhCRo6r3UzBvldE9nFhLJRSAGOp9LAyM=;
        b=ZuHOciRvUdJOByokEuqJZB4WY8eAgae/rolIwz5EpKGR5TrwtyhPL0VLldW77gANlv
        5TOaW4ZvM5mCRbVQv70YSxZMbK74IWwgtFuTxi3p8i/ot4vWC6Q9lYD125xGmhw+d1fB
        KPwmtb9BpSfLNW3eocSpZCy+6CwvZoWcJ9FCMdzpMSbkYo7Z6Zuz4lh+8m4I0JR9f47r
        +gNwh4EM5RiThrd0/Yn6+w7CvTeXVdcwZEVuemI9AU0+QX2c5zxRCegLwiW3SkSHg+Ip
        +ytra0BK0BRGrJPjOWqmfvADowLbDdjP5QHlpmQY3VYtvZioyY9lVvHLmCzkt4vdpzMc
        Zl2g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrtwDCoxB0="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v9CD9uDIO
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sat, 12 Oct 2019 15:09:56 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [Letux-kernel] Lay common foundation to make PVR/SGX work without hacks on OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <C3A56737-6187-4B31-8697-3A02DD164429@goldelico.com>
Date:   Sat, 12 Oct 2019 15:09:55 +0200
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
Message-Id: <72851E17-9B56-4CA5-B164-667836A7C894@goldelico.com>
References: <20180108214032.GW3872@atomide.com> <0b00ce0a-969f-e638-8247-c2da96cf7ce6@gmail.com> <20190213004143.GP5720@atomide.com> <480AB632-A544-41E7-95A4-DC354AEBB71A@goldelico.com> <CAKpie0SigGGsQxSU+X-Mz5boy-Xx=3wRNOcrf+F=ehFr3RBi7Q@mail.gmail.com> <092210C3-05DE-4AFB-986F-81BD8F990B67@goldelico.com> <CAKpie0RXM1UC33YFeFy-kAxfGhYGNkw4vUgNTThf-ZCAhPTVXw@mail.gmail.com> <BE23C1E4-2877-49FA-B230-F9C10691B805@goldelico.com> <CAKpie0TSo-8gmDm9_Zw4Sd+kjVVEomp8yA9Vu8qY2U2AcrQc=w@mail.gmail.com> <8A069D96-C65F-43F5-8F54-20019CFB1A8D@goldelico.com> <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org> <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com> <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org> <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com> <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org> <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com> <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com> <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com> <ebb50954-b456- 4dab-0765-9dfa06c67075@wizzup.org> <C3A56737-6187-4B31-8697-3A02DD164429@goldelico.com>
To:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 05.10.2019 um 18:58 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> So I have several ideas what the reasons for the problems on the =
non-omap5
> devices could be:
> * initial code may have some omap5 specific hack inside
> * or has omap5 specific magic constants
> * uKernel may "know" on which platform it runs and
>  we would need differently patched user-space code
>  for each one
> * omap5 has a dual core sgx544 while the other
>  have single core
> * the register address translation is not yet correct and
>  this inhibits communicating of the user-space libs
>  with the uKernel
>=20
> Maybe, if someone can point me to a complete and working BeagleBone =
source
> tree (any kernel release) which makes use of 1.14.3699939 SDK, I could =
compare
> code and address setup to find what makes the difference.

I have found the following description, followed all steps, and it =
works:

http://blog.0xpebbles.org/PowerVR-SGX-on-the-beaglebone-black-in-2019

So with this, I have got a working user-space setup for BeagleBone and =
some working
pvrsrvkm.ko module (kernel 4.4.155-ti-r155) for evaluation.

Symbols of the kernel module are not stripped, so that I can indirectly =
compare
some build/configure options.

root@arm:~# uname -a
Linux arm 4.4.155-ti-r155 #1 SMP Thu May 23 06:00:18 UTC 2019 armv7l =
GNU/Linux
root@arm:~# ls -l /lib/modules/4.4.155-ti-r155/extra/ti335x/pvrsrvkm.ko
-rw-r--r-- 1 root root 408084 May 23 06:46 =
/lib/modules/4.4.155-ti-r155/extra/ti335x/pvrsrvkm.ko
root@arm:~# dmesg|fgrep -i pvr
[   24.589384] pvrsrvkm: loading out-of-tree module taints kernel.
[   25.051602] [drm] Initialized pvr 1.14.3699939 20110701 on minor 1
root@arm:~# sudo /usr/bin/pvrsrvctl --start --no-module
root@arm:~# cat /proc/pvr/version
Version SGX_DDK sgxddk MAIN@3699939 (release) omap_linux
System Version String: SGX revision =3D 125
root@arm:~#=20

For comparison, I have:

root@letux:~# uname -a
Linux letux 5.4.0-rc2-letux+ #1161 SMP PREEMPT Wed Oct 9 19:05:21 CEST =
2019 armv7l GNU/Linux
root@letux:~# ls -l =
/lib/modules/5.4.0-rc2-letux+/kernel/drivers/staging/pvr/1.14.3699939/eura=
sia_km/pvrsrvkm_omap_am335x_sgx530_125.ko
-rw-r--r-- 1 1002 root 4751504 Oct  9 17:09 =
/lib/modules/5.4.0-rc2-letux+/kernel/drivers/staging/pvr/1.14.3699939/eura=
sia_km/pvrsrvkm_omap_am335x_sgx530_125.ko
root@letux:~# dmesg|fgrep -i pvr
[  119.376338] pvrsrvkm_omap_am335x_sgx530_125: module is from the =
staging directory, the quality is unknown, you have been warned.
[  119.478943] [drm] Initialized pvr 1.14.3699939 20110701 for =
56000000.sgx on minor 1
root@letux:~# /usr/bin/pvrsrvctl --start --no-module
[  238.178801] PVR_K: UM DDK-(3699939) and KM DDK-(3699939) match. [ OK =
]
PVR:(Error): LoaduKernelProgram : SGX ukernel program Device Addr: =
0xe400000 invalid alignment
PVR:(Error): SetupuKernel : Failed to load uKernel program
PVR:(Error): SrvInit: Initialisation for device of class 0, type 7, =
index 0, failed (1) [0, ]
[  238.667915] PVR_K:(Error): BridgedDispatchKM: Initialisation failed.  =
Driver unusable.
PVR:(Error): PVRSRVBridgeCall: Failed to access device.  Function =
ID:3223086862 (strerror returns no value.). [0, ]
/usr/bin/pvrsrvctl: SrvInit failed (already initialized?) =
(err=3DPVRSRV_ERROR_OUT_OF_MEMORY - Unable to allocate required memory)
root@letux:~#=20

First observations:
* pvrsrvkm.ko is a little smaller (may be a result of compiler and build =
options)
* both taint the kernel, as expected
* they are exactly the same DDK release 1.14.3699939
* my version is a little more verbose
* but fails loading the uKernel

What I don't have yet is the full source code or build recipe for the =
specific
4.4.155-ti-r155 pvrsrvkm.ko from TI.

But even without having this yet, I can start experiments by replacing
kernel and pvrsrvkm.ko with mine. This should allow to gain new =
insights.

BR,
Nikolaus

