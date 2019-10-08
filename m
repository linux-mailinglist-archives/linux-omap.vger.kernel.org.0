Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7910DD01FB
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 22:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbfJHUQD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 16:16:03 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:12874 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727835AbfJHUQD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Oct 2019 16:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570565758;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=7l9B9WgbcHPP/uN48vYMG6DLjIQ8bhPWoUt9/moHWNI=;
        b=o7ykyomEUU/VES7IicBQUFyAQyicwjpWqS9M+lOtDcgkLq19ppVEDGPUQBubyk9obp
        sNZ44ayXrbuXKe6lTkkms5ghM+xTYp0/yp2yokuXodSRnP1NYqh0fo7RvunzJ4OuZBHg
        Swl3M9niIhDBHJUi+2VNZKhQbz1URbV51Cw6b8LGcovw75QE2gc9Q4MMFgIZQEPjxZtd
        QcV9Cz0aaHsy0p3oHYJxVFCHRnlQnl+RvC/7Yuu/l83epxvaQZBDUPRePvISfXpPL+Wl
        jPbP+MilFsE535JoYygPvVEnxQXit2es/O7szK9wz//buSKP8yMcIEpth7bF8R8wZYCo
        UFEg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAgw47ve18="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v98KFvw6X
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Tue, 8 Oct 2019 22:15:57 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <0bb4739d-e26f-de49-fd80-257a836e892a@ti.com>
Date:   Tue, 8 Oct 2019 22:15:57 +0200
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
Message-Id: <0FEF1AB1-5FE0-4EEE-BEB9-0957BB424C18@goldelico.com>
References: <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org> <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com> <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org> <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com> <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org> <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com> <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com> <04809E3E-A690-4931-B949-1CFDAF407C14@goldelico.com> <ebb50954-b456-4dab-0765-9dfa06c67075@wizzup.org> <C3A56737-6187-4B31-8697-3A02DD164429@goldelico.com> <20191007155252.GQ5610@atomide.com> <64474fb1-f6d2-52d0-175a-65bb493dc1fe@ti.com> <9253CFB5-0AF7-4EA0-AC7F-6DE37318238A@goldelico.com> <0bb4739d-e26f-de49-fd80-257a836e892a@ti.com>
To:     Tero Kristo <t-kristo@ti.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 08.10.2019 um 10:00 schrieb Tero Kristo <t-kristo@ti.com>:
>=20
> On 07/10/2019 22:24, H. Nikolaus Schaller wrote:
>> Hi Tero,
>>> Am 07.10.2019 um 21:18 schrieb Tero Kristo <t-kristo@ti.com>:
>>>=20
>>> On 07/10/2019 18:52, Tony Lindgren wrote:
>>>> Hi,
>>>> * H. Nikolaus Schaller <hns@goldelico.com> [191005 16:59]:
>>>> Please try with Tero's current github branch at =
github.com/t-kristo/linux-pm.git
>>>> 5.4-rc1-ipc from few days ago, the earlier versions had still =
issues.
>>>=20
>>> Yeah, this one should be fixed now.
>> Ok! Will try asap.
>>>=20
>>>>> * OMAP5 (Pyra): fails to enable the clocks (did work with the =
previous version)
>>>>> [  304.140363] clock-controller:clk:0000:0: failed to enable
>>>>> [  304.147388] PVR_K:(Error): EnableSGXClocks: pm_runtime_get_sync =
failed (16)
>>>> Hmm no idea what might be up with this one. Did some clkctrl clock
>>>> fixes maybe cause a regression here? Tero do you have any ideas?
>>>=20
>>> So, this one I am not too sure, I haven't looked at omap5 graphics =
clocking. I don't think it has anything to do with reset handling =
though.
>>>=20
>>> Is there some simple way to try this out on board; without PVR =
module that is?
>> Yes, I have also seen it when just running the commands in the =
original commit message [1]:
>> # echo on > $(find /sys -name control | grep \/5600)
>> # rwmem 0x5600fe00	# OCP Revision
>> 0x5600fe00 =3D 0x40000000
>> # echo auto > $(find /sys -name control | grep \/5600)
>> # rwmem 0x5600fe10
>> # rwmem 0x56000024
>> But I have not yet tested with 5.4-rc2, just 5.4-rc1.
>=20
> Ok, there is a one liner DTS data fix for this issue, attached.

Yes, have tested and it fixes omap5. I have the 3D demo running again on =
the Pyra. Yay!

Together with the latest rstcrtl patches, am335x is now better.
No omap_reset_deassert: timedout waiting for gfx:0 any more.

But I can't access the sgx registers and get memory faults. Maybe
my script has a bug and is trying the wrong address. Have to check
with some distance...

I have also tested omap3630 and omap4460 and they are not worse,
but also not better. So I think the foundation for sgx clock and
reset is now ok.

BR and thanks,
Nikolaus=
