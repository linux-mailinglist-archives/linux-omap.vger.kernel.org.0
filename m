Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9D03B8787
	for <lists+linux-omap@lfdr.de>; Wed, 30 Jun 2021 19:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbhF3RUM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Jun 2021 13:20:12 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:20724 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhF3RUM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Jun 2021 13:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625073449;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=PaZ4QfjrWr9o3a5HeoGKce26NQC+59YzfuJZdJpUzpE=;
    b=TSasPWIexuttte1dRb5hyYDoPDvJIV6lyBecevfw3gioYjN0L3dIae464U47zluXkv
    IvIK3EnE4XAlBlpLBceGyN1yetp+PWBRPKf1j2qGMrzQDsIeqCT6y5huePbePSh9ZWGs
    lcNZvf5ZuWyMvg/fMn6PCg7eMODUyHw9yelWeySoMHSQZhqGvs+YMBE4uBg2H0hBM9Xt
    UyOAVzZ4tWFnCdLu4y7J4D/Moe/qwOHE0FZm3vuFuY24RrCGTdctRiBajnkMThQkWQJr
    fE2gqMHeHsF4rE5qCk1QYYcSseS5exycuysEQ0djjHsDcg1JzNWF+0Jw/Q5IBkg6LHbX
    y0jA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlWfXA0NbQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
    with ESMTPSA id h06665x5UHHT24k
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Wed, 30 Jun 2021 19:17:29 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH] regulator: palmas: set supply_name after registering the
 regulator
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20210630164517.GI5106@sirena.org.uk>
Date:   Wed, 30 Jun 2021 19:17:28 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        Graeme Gregory <gg@slimlogic.co.uk>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Nishanth Menon <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <54FC87BA-D45A-4ABF-B233-2A70B4A4A632@goldelico.com>
References: <4ed67090bc048442567931ede8f1298a0b312b28.1624980242.git.hns@goldelico.com>
 <20210629155922.GD4613@sirena.org.uk>
 <2C7C3A47-4A5B-4052-98FC-7A96E2F138CA@goldelico.com>
 <20210629185638.GG4613@sirena.org.uk>
 <7B58B1BF-9D65-4CEC-B7D1-4EFDB2C0CB4E@goldelico.com>
 <20210630121307.GA5106@sirena.org.uk>
 <02EE05C2-588F-4D50-8A37-46CC3B0C302C@goldelico.com>
 <20210630130425.GF5106@sirena.org.uk>
 <E57CB314-F56C-4B33-81E8-7927564DB751@goldelico.com>
 <20210630164517.GI5106@sirena.org.uk>
To:     Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Mark,

> Am 30.06.2021 um 18:45 schrieb Mark Brown <broonie@kernel.org>:
>=20
> On Wed, Jun 30, 2021 at 04:43:14PM +0200, H. Nikolaus Schaller wrote:
>>> Am 30.06.2021 um 15:04 schrieb Mark Brown <broonie@kernel.org>:
>>> On Wed, Jun 30, 2021 at 02:29:02PM +0200, H. Nikolaus Schaller =
wrote:
>>>>> Am 30.06.2021 um 14:13 schrieb Mark Brown <broonie@kernel.org>:
>=20
>>> It's a super weird hardware design if the DT is accurate,
>=20
>> I get the impression that the vdds_1v8_main is in the DT =
(omap5-board-common.dtsi)
>> only as an alias for smps7. Maybe to get more flexibility in =
overwriting
>> in board files? I.e. replace the power controller without having a =
fixed
>> definition of smps7 elsewhere.
>=20
> It doesn't seem to have any effect in software and the input is
> specified at the same voltage as the output which would be very =
unusual.
> No idea why you'd do any aliasing, you can already name the regulators
> with DT handles and with user visible strings.
>=20
>> Looking into the schematics of the OMAP5432EVM or the Pyra handheld =
does
>> not reveal a physical regulator. It is just that the output signal of
>> smps7 is called "VDDS_1v8_MAIN".
>=20
> It could be something incorrectly factored out of some early =
prototypes
> or something.

Yes, most likely. Or as I assumed: separating regulator names from =
signal names.

According to git blame it was introduced 5 years ago by Nisanth.
Maybe he is still reading here and wants to comment.

>=20
>> Therefore, a completely different approach could be to remove =
fixedregulator-vdds_1v8_main
>> and replace by smps7_reg.
>=20
> If there's no physical regulator on the board then that is indeed a DT
> bug, the fixed regulator just shouldn't be there.

Agreed.

>=20
>> But is changing the DT the right solution if the Palmas and Fixed =
regulator
>> drivers can't handle the untouched DT which is logically correct (not =
physically)?
>=20
> Well, it's a good thing to do anyway since the DT is supposed to
> accurately reflect the hardware.  Like I say splitting the LDOs and
> SMPSs can also be done independently and should separately resolve the
> issue.

According to the code they are done separately by calling smps_register
first and then ldo_register inside palmas_regulators_probe().

But separate regulators or regulator blocks could probe independently.

Other similar drivers seem to split registration into many
individual regulators, e.g. twl6030-regulator.c while others
seem to do it more like the Palmas, e.g. tps65090-regulator.c

Splitting into many regulators also needs to touch the device trees
to have individual compatible entries which currently do not exist.

On the other hand, a theoretical system could have a real fixed =
regulator
in between (maybe a power switch?) and should still work. Why should=20
driver core care about that case and not the core system it is using?

>=20
>>> it's hard to see how it's not going to be hurting efficiency.
>=20
>> Well, I think the regulators are enabled only once during boot so =
nobody
>> notices an issue.
>=20
> When I say having an extra regulator in there hurts efficiency I'm
> saying that the power losses from regulation will be increased as
> there's more of it happening.

Ah, you did think about hardware efficiency, I did about software =
efficiency :)

Well, a real "LDO" from 1.8V to 1.8V makes no sense but a power
interrupt switch (with e.g. 12 m=CE=A9 RDSon like some ADP197) could in =
some
circuits, e.g. to reduce reverse leakage or whatever.

We don't have it of course but it would be modeled as a fixed regulator
with GPIO and 1.8V output although input is also 1.8V.

But that doesn't help for the Palmas issue.

Generally, I'd now prefer the "DTS" fix approach and leaving to fix the
intermediate fixed-regulator solution by rewriting the Palmas driver
to future discussion.

BR and thanks,
Nikolaus

