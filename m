Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE5A3B7940
	for <lists+linux-omap@lfdr.de>; Tue, 29 Jun 2021 22:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234888AbhF2UYX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Jun 2021 16:24:23 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:33951 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234073AbhF2UYX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 29 Jun 2021 16:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624998106;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=AYKtrbWwKS7idk3/CSVElJ7EwbeiNo4eQQ9LvXFsNyU=;
    b=YUoZQZ4KWBEr+DqU9yw8yMZYKTK61yYsMTrnAT8ePmwMWDt0pB6IU8cEtH1pySs03h
    z7zNp4fa4ELMT3Kjky2h3f/Cy1YFBy8jnPP1Q51KO4b/quXh9t7A3mt+SVQgnNBIRLk6
    qGhORW1MCdgS/nTjpuSfDRDq4gYtCvYetFYDKBLanUSPoRhbwO1xRl6CyMGDz7xPRX8C
    F9wdEKZM8kDLlvdFgOMo4oTcZmt2BBqUWnBzDScNurtMP6Yw0S5xs8ysPmgDxNd4IlYM
    mEpXmz5imMkSUiZhW/q2tSC0O06BYVQDNWj/Vd0HiyV0O4Uy56RCUKLpluPS8CvgNXwL
    iiyg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlWfXA0NbQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.27.5 DYNA|AUTH)
    with ESMTPSA id f0359ax5TKLjP6f
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 29 Jun 2021 22:21:45 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH] regulator: palmas: set supply_name after registering the
 regulator
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20210629185638.GG4613@sirena.org.uk>
Date:   Tue, 29 Jun 2021 22:21:45 +0200
Cc:     Liam Girdwood <lgirdwood@gmail.com>, Nishanth Menon <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7B58B1BF-9D65-4CEC-B7D1-4EFDB2C0CB4E@goldelico.com>
References: <4ed67090bc048442567931ede8f1298a0b312b28.1624980242.git.hns@goldelico.com>
 <20210629155922.GD4613@sirena.org.uk>
 <2C7C3A47-4A5B-4052-98FC-7A96E2F138CA@goldelico.com>
 <20210629185638.GG4613@sirena.org.uk>
To:     Mark Brown <broonie@kernel.org>, Tony Lindgren <tony@atomide.com>,
        Graeme Gregory <gg@slimlogic.co.uk>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Mark,

> Am 29.06.2021 um 20:56 schrieb Mark Brown <broonie@kernel.org>:
>=20
> On Tue, Jun 29, 2021 at 08:34:55PM +0200, H. Nikolaus Schaller wrote:
>>> Am 29.06.2021 um 17:59 schrieb Mark Brown <broonie@kernel.org>:
>=20
>=20
>> So it was working fine without having the supplying regulator =
resolved. AFAIK they
>> just serve as fixed regulators in the device tree and have no =
physical equivalent.
>=20
> No, not at all - it's representing whatever provides input power to =
the
> regulator.  There may be no physical control of it at runtime on your
> system but that may not be true on other systems.  It's quite common =
for
> there to be a chain of regulators (eg, DCDCs supplying LDOs) and then
> they all need to get get power managed appropriately and you don't end
> up thinking a regulator is enabled when the input regulator is =
disabled. =20

Yes, that is how it is chained in other cases.

>=20
>> My proposal just moves setting the supply_name behind =
devm_regulator_register() and
>> by that restores the old behaviour.
>=20
> This means that we won't actually map the supply and any system that
> relies on software handling the supply regulator will be broken.

Well, it seems as if the supply regulators are only vsys_cobra and =
vdds_1v8_main.
At least in omap5-board-common.dtsi which is what I can test.

Both are fixed regulators where calling enable or not doesn't become
physically visible. The hardware still supplies the 5V and 1.8V to the =
palmas
chip.

Maybe the new rule by commit 98e48cd9283dreveals a design issue inside =
of
the Palmas driver which assumes that there is no need to control its =
supply
regulators. And does not handle probe deferral.

Then of course my patch is just a work-around for a bug but not a =
solution.

>=20
>> Well, unless...
>=20
>> ... devm_regulator_register() does something differently if =
desc->supply_name
>> is not set before and changed afterwards. It may miss that change.
>=20
> We resolve supplies during regulator registration, this would
> effectively just skip mapping of the supply.
>=20
>> So I hope for guidance if my approach is good or needs a different =
solution.
>=20
> What I would expect to happen here would be that once vsys_cobra is
> registered the regulators supplied by it can register and then all =
their
> consumers would in turn be able to register.  You should look into why
> that supply regulator isn't appearing and resolve that, or if a =
consumer
> isn't handling deferral then that would need to be addressed.

Ah, I think I get an idea what may be going wrong.

There seems to be a deadlock in probing:

	e.g. ldo3_reg depends on vdds_1v8_main supply
	vdds_1v8_main depends on smps7_reg supply
	smps7_reg depends on vsys_cobra supply
	vsys_cobra depends on nothing

This would normally lead to a simple chain as you described above. But
ldo3_reg and smps7_reg share the same driver and can probe successfully =
or
fail only in common.

Now if ldo3_reg defers probe through the new rule, smps7_reg is never
probed successfully because it is the same driver. Hence vdds_1v8_main =
can
not become available. And the Palmas continues to run in boot =
initialization
until some driver (MMC) wants to switch voltages or whatever.

Maybe Tony or Graeme has an idea how to do it right...

BR and thanks,
Nikolaus






