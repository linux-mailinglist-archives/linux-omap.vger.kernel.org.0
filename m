Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 830CC1102F7
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2019 17:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfLCQye (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Dec 2019 11:54:34 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:24930 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfLCQyd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Dec 2019 11:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1575392071;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=GNEqwNnWqE/8Qot7d9H4fL3t7NY8bPr8DWMHXiCXNdM=;
        b=HNhoXdw2wRLImvHreZX/TJuGQuQRs529M8AmpXiAg/W43twA0FUaCdpCvTnMBz/J8H
        GUEECYu6nHHpo0ZWQUyiwMZVdHmBHwvnkDxoaE6nC07FBGI5UMdQQ1cwYT3iQwI+ClsP
        cvV57iTvcGxX4qCCCYP2amyAe1o60hcexhdGXLR8M4iZKUm5W60P6cSt58Oa4xl4pu59
        CmStsQaWoN6SNoRERyuCFqiQo0ITKLONOwDgXnT44anhwm92WAs7udfciTrlt9t41Q2h
        5UmtFTTnYMwVNpkTfn64muCHBZ4xpOejbg0+xiLHIm6i+pxx8judD7Rv+gFGycsVa8pC
        FrSg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlacXAYPiQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.0.2 DYNA|AUTH)
        with ESMTPSA id 6067eavB3GsN6cC
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 3 Dec 2019 17:54:23 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] ARM: OMAP2+: Fix warnings with broken omap2_set_init_voltage()
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <5F430C0D-7F25-4680-87B9-2D65A08A9F83@goldelico.com>
Date:   Tue, 3 Dec 2019 17:54:23 +0100
Cc:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?utf-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FB42ED12-5DDB-4A9E-941A-ACBE2C10C36A@goldelico.com>
References: <20190924233222.52757-1-tony@atomide.com> <8FFD44DB-73F8-4807-91E1-C97DA8F781BA@goldelico.com> <20191202213929.GB35479@atomide.com> <EE749881-C3DB-4BBE-85FE-E5AF3D34884F@goldelico.com> <BAF5B057-1017-4174-8C3F-4B49B31E2E0D@goldelico.com> <20191203154447.GC35479@atomide.com> <5F430C0D-7F25-4680-87B9-2D65A08A9F83@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 03.12.2019 um 16:58 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>=20
>> Am 03.12.2019 um 16:44 schrieb Tony Lindgren <tony@atomide.com>:
>>=20
>> * H. Nikolaus Schaller <hns@goldelico.com> [191203 12:31]:
>>> Ok, dev_pm_opp_find_freq_ceil() is doing what it should do and it
>>> returns the first OPP higher or equal than the frequency passed in.
>>>=20
>>> The real reason for the warning is that the same OPP table is used
>>> for vdd_mpu_iva and vdd_core and it appears as if "core" (l3_ick)
>>> runs at 200 MHz which does not correspond to a valid OPP.
>>=20
>> OK
>>=20
>>> So to silcence the warning it suffices to remove
>>>=20
>>> 	omap2_set_init_voltage("core", "l3_ick", "l3_main");
>>>=20
>>> The question is now what l3_ick has to do with the OPPs at all
>>> and how it should interwork with OPPs and cpufreq.
>>=20
>> So what changed then for iva in your configuration then?
>>=20
>> At least I'm getting errors for both for 34xx and dm3730 with
>> Linux next and reverted commit cf395f7ddb9e ("ARM: OMAP2+: Fix
>> warnings with broken omap2_set_init_voltage()"):
>>=20
>> omap2_set_init_voltage: unable to find boot up OPP for vdd_mpu_iva
>> omap2_set_init_voltage: unable to set vdd_mpu_iva
>> omap2_set_init_voltage: unable to find boot up OPP for vdd_core
>> omap2_set_init_voltage: unable to set vdd_core
>=20
> Hm... Is there maybe a dependency on u-boot?
>=20
> We are using a quite old version which may boot with vdd_mpu_iva
> as 300 MHz while yours may have a different clock.
>=20
> What we could do is augment the printk (or dev_err) to tell
> in these warnings what it is looking for...
>=20
> 	opp =3D dev_pm_opp_find_freq_ceil(dev, &freq);
> 	if (IS_ERR(opp)) {
> 		pr_err("%s: unable to find boot up OPP for vdd_%s freq =
%ulHz\n",
> 		__func__, vdd_name, freq);
> 		goto exit;
> 	}

Easier and always prints info:

	freq =3D clk_get_rate(clk);
	clk_put(clk);

	pr_info("%s: vdd=3D%s clk=3D%s %luHz oh=3D%s\n", __func__, =
vdd_name, clk_name, freq, oh_name);

	opp =3D dev_pm_opp_find_freq_ceil(dev, &freq);

I get this:

[    2.908142] omap2_set_init_voltage: vdd=3Dmpu_iva clk=3Ddpll1_ck =
1000000000Hz oh=3Dmpu
[    2.930816] omap2_set_init_voltage: vdd=3Dcore clk=3Dl3_ick =
200000000Hz oh=3Dl3_main
[    2.946228] omap2_set_init_voltage: unable to find boot up OPP for =
vdd_core
[    2.953460] omap2_set_init_voltage: unable to set vdd_core

Which means that cpufreq already has increased dpll1_ck to 1 GHz
(I have removed the turbo-mode tags so that it already boots at
full speed) and l3_ick runs at initial 200 MHz.

>=20
>> Then for fixing this code, seems like this can all happen from
>> a regular device driver init based on the dts data.. We've had
>> PM init completely ignore these errors already for years so
>> whatever dependency there might be seems non-critical :)
>>=20
>>> Or does all this mean we may need a second OPP fable for vdd_core
>>> and 200 MHz? But what would it be good for? I have not seen any
>>> reference for "core-OPPs" in the TRM.
>>=20
>> OK yeah sounds like all the domains need an opp table.
>>=20
>> Also, I recall some SoCs having a dependency between having to
>> run DSP at a lower rate for higher MPU rates, not sure if omap3
>> has such dependencies though.
>=20
> Well, I not aware of documentation of such dependencies and there
> is also some confusion what vdd_mpu_iva exactly is and what vdd_core =
is.
> twl4030 has vdd1 and vdd2 but their relationship isn't clear either.
>=20
> Maybe Tero or Nisanth can clarify?
>=20
> BR and thanks,
> Nikolaus
>=20
>=20
> _______________________________________________
> http://projects.goldelico.com/p/gta04-kernel/
> Letux-kernel mailing list
> Letux-kernel@openphoenux.org
> http://lists.goldelico.com/mailman/listinfo.cgi/letux-kernel

