Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4F4B40F3
	for <lists+linux-omap@lfdr.de>; Mon, 16 Sep 2019 21:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387590AbfIPTP4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Sep 2019 15:15:56 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:28025 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfIPTPz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 16 Sep 2019 15:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568661352;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=ISnqrCPfw9wyjpKuLKC4JbgTPu2Q46+zetbOpdb4vjQ=;
        b=XTt1LfRFi0eQAZ8cuRAlyRs4RX6UDGyMCdM9BCzeV+udWSsNrTK04r3Vj3hAYy7zp/
        mJDGWJopuKM/9oL3elaNjqhUIU0GmBemt+D/Jw84yTmXAQrLT3d4hyYp1C1Q/QF2dh/V
        0F2owlkXmBGV9MwQD8aUWQBdmiiXYE02axw31z/8swFqPFJ4bV/Ol+s5Q3tEpTFdMmmt
        X9pidBhPDVpDz70NIakU4nA8KgmX6iOXTcDvmCo/BAREeFJe/iXw+KHhHJL+bLa1us/B
        4zbHiraQBF60VWZmqGNHT7dPF8CxtOdlPtedPgcG7EuXKK64dYQe2tECEUq/XmTTYCQg
        Ba2Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAgw43rXTg="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.27.0 DYNA|AUTH)
        with ESMTPSA id u036f9v8GJFcSjs
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 16 Sep 2019 21:15:38 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 6/6] ARM: dts: Configure rstctrl reset for SGX
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <6CF46DDB-2EC1-454E-83A1-30CC7BFC335D@goldelico.com>
Date:   Mon, 16 Sep 2019 21:15:38 +0200
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        =?utf-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?utf-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D413323E-6B96-473E-979B-18D476AB3065@goldelico.com>
References: <20190814131408.57162-1-tony@atomide.com> <20190814131408.57162-7-tony@atomide.com> <92652315-A763-485F-A4FA-CB868016E045@goldelico.com> <20190916151730.GZ52127@atomide.com> <20190916180418.GH52127@atomide.com> <6CF46DDB-2EC1-454E-83A1-30CC7BFC335D@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 16.09.2019 um 20:12 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>=20
>> Am 16.09.2019 um 20:04 schrieb Tony Lindgren <tony@atomide.com>:
>>=20
>> Hi,
>>=20
>> * Tony Lindgren <tony@atomide.com> [190916 15:18]:
>>> * H. Nikolaus Schaller <hns@goldelico.com> [190913 09:50]:
>>>> Hi Tony,
>>>>=20
>>>>> Am 14.08.2019 um 15:14 schrieb Tony Lindgren <tony@atomide.com>:
>>>>>=20
>>>>> The following can be tested via sysfs with the following to ensure =
the SGX
>>>>> module gets enabled and disabled properly:
>>>>>=20
>>>>> # echo on > =
/sys/bus/platform/devices/5600fe00.target-module/power/control
>>>>> # rwmem 0x5600fe00		# revision register
>>>>> 0x5600fe00 =3D 0x40000000
>>>>> # echo auto > =
/sys/bus/platform/devices/5600fe00.target-module/power/control
>>>>> # rwmem 0x5000fe00
>>>>> Bus error
>>>>>=20
>>>>> Note that this patch depends on the PRM rstctrl driver that has
>>>>> been recently posted.
>>>>=20
>>>> Do you have a list of these patches or a git for pulling the =
complete set
>>>> of changes? Does it depend on mainline or linux-next?
>>>=20
>>> You need the drivers/bus/ti-sysc.c changes from Linux next,
>>> and the most recent clkctrl and rstctrl patches posted by
>>> Tero.
>>>=20
>>>> I tried to find the correct patches but it does not seem to work =
for
>>>> me on beaglebone.
>>>=20
>>> OK can you please check the dependencies again and let me know
>>> if you still have issues?
>>=20
>> To make things easier to test, I pushed out a test branch with
>> all the pending dependencies :)
>>=20
>> It's basically v5.3 + ti-sysc changes in Linux next, and
>> the following patches posted by Tero:
>>=20
>> [PATCHv5 00/10] soc: ti: add OMAP PRM driver (for reset)
>> [PATCHv3 00/10] clk: ti: remoteproc / iommu support patches
>> [PATCH 00/10] ARM: dts: omap changes for IOMMU / reset support
>>=20
>> And then finally the $subject patch applied on top, and the
>> tests above still work for me.
>=20
> Ok, fine!
>=20
>>=20
>> The test branch is test-pending-ti-sysc-clkctrl-rstctrl-v5.3
>> at [0] and [1] below.
>>=20
>> Can you please test and see if that works for you?
>>=20
>> Regards,
>>=20
>> Tony
>>=20
>> [0] =
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git =
test-pending-ti-sysc-clkctrl-rstctrl-v5.3
>> [1] =
https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/=
?h=3Dtest-pending-ti-sysc-clkctrl-rstctrl-v5.3
>=20
> I'll check out and try to locate missing pieces.

Ok, this variant works as a basis! At least for register access.

root@letux:~# devmem2 0x5600fe00
Value at address 0x5600FE00 (0xb6fede00): 0x40000000
root@letux:~# devmem2 0x5600fe04
Value at address 0x5600FE04 (0xb6fa1e04): 0x5
root@letux:~# devmem2 0x5600fe10
Value at address 0x5600FE10 (0xb6f80e10): 0x28
root@letux:~#=20

This is quite similar to OMAP5 where I got

> root@letux:~# devmem2 0x5600fe00
> Value at address 0x5600FE00 (0xb6f87e00): 0x40000000
> root@letux:~# devmem2 0x5600fe04
> Value at address 0x5600FE04 (0xb6f11e04): 0x5
> root@letux:~# devmem2 0x5600fe10
> Value at address 0x5600FE10 (0xb6f93e10): 0x3C

or OMAP3:

> root@letux:~# devmem2 0x5000fe00
> Value at address 0x5000FE00 (0xb6f81e00): 0x40000000
> root@letux:~# devmem2 0x5000fe04
> Value at address 0x5000FE04 (0xb6f28e04): 0x5
> root@letux:~# devmem2 0x5000fe10
> Value at address 0x5000FE10 (0xb6f5fe10): 0x28
> root@letux:~#=20

But SGX driver initialization still fails with a reset_deassert timeout.

root@letux:~# modprobe pvrsrvkm_omap_am335x_sgx530_125
[  187.528139] pvrsrvkm_omap_am335x_sgx530_125: module is from the =
staging directory, the quality is unknown, you have been warned.
[  187.584580] omap_reset_deassert: timedout waiting for gfx:0
[  187.614430] [drm] Initialized pvr 1.14.3699939 20110701 for =
56000000.sgx on minor 1
root@letux:~# pvrsrvctl --start --no-module
[  209.085931] PVR_K: UM DDK-(3699939) and KM DDK-(3699939) match. [ OK =
]
[  209.116399] PVR_K:(Error): BridgedDispatchKM: Initialisation failed.  =
Driver unusable.
PVR:(Error): LoaduKernelProgram : SGX ukernel program Device Addr: =
0xe400000 invalid alignment [0, ]
PVR:(Error): SetupuKernel : Failed to load uKernel programs [0, ]
PVR:(Error): SrvInit: Initialisation for device of class 0, type 7, =
index 0, failed (1) [0, ]
PVR:(Error): PVRSRVBridgeCall: Failed to access device.  Function =
ID:3223086862 (strerror returns no value.). [0, ]
pvrsrvctl: SrvInit failed (already initialized?) =
(err=3DPVRSRV_ERROR_OUT_OF_MEMORY - Unable to allocate required memory)
root@letux:~#

A simple reason may be that I have a bad offset in my device tree setup
and the driver doesn't see feedback from SGX.

" for 56000000.sgx on minor 1" is suspect.
IMHO, it should have to be " for 5600fe00.sgx on minor 1"
But anyways this is a big step forwards having giving me three different
platforms for testing and comparisons.

BR and thanks,
Nikolaus


