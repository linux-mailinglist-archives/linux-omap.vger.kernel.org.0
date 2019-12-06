Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 448BC115734
	for <lists+linux-omap@lfdr.de>; Fri,  6 Dec 2019 19:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbfLFSfF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Dec 2019 13:35:05 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:16359 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbfLFSfF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 Dec 2019 13:35:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1575657300;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=8xcPnshoEvqmpl8Ihb0gwyd1N4JC6oPtQIQeUEG485c=;
        b=EQEpkiTnvZkaA6lnKETXwKeLpQbqdh1eyKhHYbMh+VFe8FFCT3x9bVksUL8ISK7NC9
        APDKaVKl+WuD6CC3DB7KkMZA5x2Ps++2oBRjh7Ex9y5qlr2A3qHD0/Pcs+0nfTR4djch
        ONbEFVbTaiS1RPX+28KHnoph9tQpsc+LngcHAzAG5InRsj7L3EhbxOMOXsXYPPI8xWVN
        0WE6yXSeiHTP1rWLKm6vi9B/taAl3avN1+EUoqxjVAqWNRIjHgcaUFU09BqiBoQNbY08
        OrECSK/oQNQ2CYeN+gfc7BYPBnpwzYfOO6UNtUQLGXM0rES/G5JJ5f+P2zS2XeKQFwLE
        Jgpw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vgwDOprHg="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.0.2 DYNA|AUTH)
        with ESMTPSA id 6067eavB6IYjLOv
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 6 Dec 2019 19:34:45 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] ARM: OMAP2+: Fix warnings with broken omap2_set_init_voltage()
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191206182040.GH35479@atomide.com>
Date:   Fri, 6 Dec 2019 19:34:44 +0100
Cc:     Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        =?utf-8?Q?Andr=C3=A9_Roth?= <neolynx@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A0DC2BBE-C5A9-4873-BBD2-C69F7697B210@goldelico.com>
References: <20190924233222.52757-1-tony@atomide.com> <8FFD44DB-73F8-4807-91E1-C97DA8F781BA@goldelico.com> <20191202213929.GB35479@atomide.com> <EE749881-C3DB-4BBE-85FE-E5AF3D34884F@goldelico.com> <BAF5B057-1017-4174-8C3F-4B49B31E2E0D@goldelico.com> <20191203154447.GC35479@atomide.com> <5F430C0D-7F25-4680-87B9-2D65A08A9F83@goldelico.com> <FB42ED12-5DDB-4A9E-941A-ACBE2C10C36A@goldelico.com> <20191206182040.GH35479@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 06.12.2019 um 19:20 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [191203 16:55]:
>>> What we could do is augment the printk (or dev_err) to tell
>>> in these warnings what it is looking for...
>>>=20
>>> 	opp =3D dev_pm_opp_find_freq_ceil(dev, &freq);
>>> 	if (IS_ERR(opp)) {
>>> 		pr_err("%s: unable to find boot up OPP for vdd_%s freq =
%ulHz\n",
>>> 		__func__, vdd_name, freq);
>>> 		goto exit;
>>> 	}
>>=20
>> Easier and always prints info:
>>=20
>> 	freq =3D clk_get_rate(clk);
>> 	clk_put(clk);
>>=20
>> 	pr_info("%s: vdd=3D%s clk=3D%s %luHz oh=3D%s\n", __func__, =
vdd_name, clk_name, freq, oh_name);
>>=20
>> 	opp =3D dev_pm_opp_find_freq_ceil(dev, &freq);
>>=20
>> I get this:
>>=20
>> [    2.908142] omap2_set_init_voltage: vdd=3Dmpu_iva clk=3Ddpll1_ck =
1000000000Hz oh=3Dmpu
>> [    2.930816] omap2_set_init_voltage: vdd=3Dcore clk=3Dl3_ick =
200000000Hz oh=3Dl3_main
>> [    2.946228] omap2_set_init_voltage: unable to find boot up OPP for =
vdd_core
>> [    2.953460] omap2_set_init_voltage: unable to set vdd_core
>=20
> OK yeah that's more descriptive.

So what does your board say as it is also unable to find the initial =
mpu_iva?
And/or does it show a different core clock?

>=20
>> Which means that cpufreq already has increased dpll1_ck to 1 GHz
>> (I have removed the turbo-mode tags so that it already boots at
>> full speed) and l3_ick runs at initial 200 MHz.
>=20
> OK. I wonder where this initial code should live though..

Well, we all agree that it should live in deserved retirement :)

But it has some positive effect and maybe "fixes" a bug in cpufreq-only =
setup.

BR,
Nikolaus

