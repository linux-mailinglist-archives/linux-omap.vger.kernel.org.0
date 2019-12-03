Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EEAB10FDA6
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2019 13:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbfLCMa2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Dec 2019 07:30:28 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:19858 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbfLCMa1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Dec 2019 07:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1575376223;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=GF0dYqjJYl0N07n81fkOYGJuW0P2Xwn9EWFBb3GXqeg=;
        b=QwheznfoN0BLsYjnuoIOhhZ1SubpTO84xlIdYLohY5msq8vk47ep3y4WDwk8p/btkD
        DpOSkDiXDxLztJmVSHmc2miZwb6ndOpmAt4sUU+LXBFHoZFYClf+4g1QO7uHFsQNr/Sx
        /LXa0ZxZpAd2sZ271+0VJy3o2UJT89z5OQL3vewBRC6Bu/0tYY+1whi7JQPz9uVxZZ2O
        R/z6q28W1trd6tf4sikgbq07kVm+lXee14CqTI8KKxJu1nyfJtGx8vut8d70woun1zVf
        Ig4YmTH9CUBUqLahGOYvjOLXFz+MHWgn2T4LOwwqgHI5WPlpvciwhV9yyKtbS5QNJQic
        02Kg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlacXAYPiQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.0.2 DYNA|AUTH)
        with ESMTPSA id 6067eavB3CU74yO
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 3 Dec 2019 13:30:07 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] ARM: OMAP2+: Fix warnings with broken omap2_set_init_voltage()
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <EE749881-C3DB-4BBE-85FE-E5AF3D34884F@goldelico.com>
Date:   Tue, 3 Dec 2019 13:30:07 +0100
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Adam Ford <aford173@gmail.com>,
        =?utf-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Andreas Kemnade <andreas@kemnade.info>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BAF5B057-1017-4174-8C3F-4B49B31E2E0D@goldelico.com>
References: <20190924233222.52757-1-tony@atomide.com> <8FFD44DB-73F8-4807-91E1-C97DA8F781BA@goldelico.com> <20191202213929.GB35479@atomide.com> <EE749881-C3DB-4BBE-85FE-E5AF3D34884F@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 03.12.2019 um 10:53 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> HiTony,
>=20
>> Am 02.12.2019 um 22:39 schrieb Tony Lindgren <tony@atomide.com>:
>>=20
>> Hi,
>>=20
>> * H. Nikolaus Schaller <hns@goldelico.com> [191202 21:10]:
>>>> Am 25.09.2019 um 01:32 schrieb Tony Lindgren <tony@atomide.com>:
>>>> Guys, please check and ack if we can really do this to get rid of =
some
>>>> pointless dmesg -l3 errors without affecting the ongoing cpufreq =
and
>>>> voltage work.
>>>=20
>>> unfortunately we did not yet test in combination with the 1GHz OPP
>>> patches for omap3630 (queued for v5.5-rc1) and it appears that this
>>> patch breaks the 1GHz OPP.
>>>=20
>>> The symptom is that it works fine on a dm3730 with 800MHz rating
>>> but results in spurious kernel panics, stack corruption, virtual =
memory
>>> failures, OneNAND DMA timeouts etc. on a dm3730 with 1GHz speed =
grade.
>>=20
>> Hmm yeah OK, I was a bit worried about this breaking something.
>>=20
>>> We can also re-add the "turbo-mode" tags in the omap36xx.dtsi (or
>>> remove the 1GHz OPP) and can then boot with 800MHz max. clock. But
>>> enabling boost (echo 1 >/sys/devices/system/cpu/cpufreq/boost) makes
>>> the problem and its symptoms appear almost immediately.
>>>=20
>>> After some scratching our heads we found that v5.3.7 is still good =
and
>>> v5.3.8 is bad. A bisect of our tree (which includes the 1GHz OPP) =
did
>>> point to this patch whichwas apparently already backported to v5.3.8 =
and
>>> v5.4.
>>>=20
>>> So I assume that the code removed here enabled or initialized =
something
>>> we need for safe 1GHz transitions. Maybe the ABB-LDO. Or it looks up =
the
>>> vdd regulator and initializes it earlier than without this code. =
Maybe
>>> it also (pre-)initializes some clk which could now be left =
uninitialized
>>> too long?
>>=20
>> It was just doing voltdm_lookup() and clk_get_rate() and then failed
>> dev_pm_opp_find_freq_ceil(), but I don't see what these might =
affect..
>>=20
>>> Note that seeing the log message indicates that voltdm_scale() and
>>> dev_pm_opp_get_voltage() are not called, but all functions before =
could
>>> be with side-effects.
>>=20
>> Yes that is strange. There's no clk_prepare() before we proceed to
>> call clk_get_rate() either, not sure if that matter here though.
>>=20
>>> v5.5-rc1 will likely fail right from the beginning (only on 1GHz =
rated
>>> omap36xx) because it makes the combination of this patch and 1GHz =
OPP
>>> public (linux-next should already fail but it appears that nobody =
has
>>> tested).
>>=20
>> OK
>=20
> Well, it is not that urgent as I thought since I have not yet =
submitted
> my patch to remove the turbo-mode tags for 1GHz OPP. Therefore even if =
this
> code is deployed, no dm3730 will try to boot or run at 1GHz unless
> manually enabled by echo 1 >/sys/devices/system/cpu/cpufreq/boost.
>=20
>>=20
>>> Any ideas how to fix? Before I try to do a revert and then add goto =
exit;
>>> after each function call and see which ones are essential for 1GHz.
>>=20
>> If you have things reproducable, care to try to narrow the issue down
>> a bit by trying see which parts of the old omap2_set_init_voltage()
>> fix the issue?
>>=20
>> The issue should be there somewhere in the few lines of code before
>> dev_pm_opp_find_freq_ceil(), right?
>>=20
>> It would be good to understand what's going on before reverting or
>> fixing things condering that a revert would add back code that has
>> it's own errors and fails to init :)
>=20
> Indeed!
>=20
>>=20
>> Another thing to check is if the dev instance is actually the right
>> one we had in omap2_set_init_voltage() vs the dts dev instance as
>> we use that with dev_pm_opp_find_freq_ceil().
>=20
> As a first step I tried to comment out some steps but immediately
> got failures.
>=20
> What I then noticed is that there is only a message for
>=20
> [    2.508392] omap2_set_init_voltage: unable to find boot up OPP for =
vdd_core
> [    2.517639] omap2_set_init_voltage: unable to set vdd_core
>=20
> There is none for vdd_mpu_iva. This OPP initialization is successful
> and does call voltdm_scale() once.
>=20
> So it appears as if omap3_init_voltages() is not a complete no-op.
>=20
> IMHO the reason for the message is that u-boot defines a frequency
> and voltage that can not be found in the OPP table at all.
>=20
> Maybe a better solution to get rid of the message would be to modify=20=

> dev_pm_opp_find_freq_ceil() to interpolate between OPPs?
>=20
> Hm. After looking into the code I start to wonder why it fails at
> all. _find_freq_ceil() should return the highest available frequency
> above the one passed in and u-boot should not pass more than 800 =
MHz...
>=20
> That is IMHO a good next step to go into details.

Ok, dev_pm_opp_find_freq_ceil() is doing what it should do and it
returns the first OPP higher or equal than the frequency passed in.

The real reason for the warning is that the same OPP table is used
for vdd_mpu_iva and vdd_core and it appears as if "core" (l3_ick)
runs at 200 MHz which does not correspond to a valid OPP.

So to silcence the warning it suffices to remove

	omap2_set_init_voltage("core", "l3_ick", "l3_main");

The question is now what l3_ick has to do with the OPPs at all
and how it should interwork with OPPs and cpufreq.

Or does all this mean we may need a second OPP fable for vdd_core
and 200 MHz? But what would it be good for? I have not seen any
reference for "core-OPPs" in the TRM.

BR,
Nikolaus

