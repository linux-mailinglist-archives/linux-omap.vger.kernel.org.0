Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 060F93B823F
	for <lists+linux-omap@lfdr.de>; Wed, 30 Jun 2021 14:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234645AbhF3Mhs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Jun 2021 08:37:48 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:14736 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234510AbhF3Mho (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Jun 2021 08:37:44 -0400
X-Greylist: delayed 335 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Jun 2021 08:37:43 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625056165;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=bZsMABrIP30hs37+nedxyh4eEvRphAwrH1bbzL0H7+Q=;
    b=BJl9LKYQMGKbxWfKkUCA4+FlI/pDKvslD8BZp8TVzf3sLyy/oOmBvPxx+iaDCgQpjB
    Wn77NtJezyHUzdrF1CGWoEln77Q8LpZ/8p4kqoY5rqZNLyPA5CrU4dHyr1aha6QlQHWA
    j2aNTnbNwGfvUqB8SCChHeKk/ZUFvGvLuHTFGwEaWl29eiKVdrokYJv8NrF2FHZzGRN8
    2dFlNheDawYDBRx+uivp1f07aLXbSvgGW0Wh6wDVP9hxDlhDbPUwvosfHe0VHdSo0z2w
    DYk4xR/6Zz1AaRat30Rl6+hT8pPYSrq/9XpPJkB4rlF6tqIQqccMjoJpliLOL+B7Hn4W
    jbNA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCym3NQGSmPRBNE1Ujq6xQREsTid4kuKCecl97Y="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:263a:bd00:d7b:6d54:c5bb:5950]
    by smtp.strato.de (RZmta 47.28.1 AUTH)
    with ESMTPSA id h06665x5UCTF0Sq
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Wed, 30 Jun 2021 14:29:15 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH] regulator: palmas: set supply_name after registering the
 regulator
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20210630121307.GA5106@sirena.org.uk>
Date:   Wed, 30 Jun 2021 14:29:02 +0200
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
Message-Id: <02EE05C2-588F-4D50-8A37-46CC3B0C302C@goldelico.com>
References: <4ed67090bc048442567931ede8f1298a0b312b28.1624980242.git.hns@goldelico.com>
 <20210629155922.GD4613@sirena.org.uk>
 <2C7C3A47-4A5B-4052-98FC-7A96E2F138CA@goldelico.com>
 <20210629185638.GG4613@sirena.org.uk>
 <7B58B1BF-9D65-4CEC-B7D1-4EFDB2C0CB4E@goldelico.com>
 <20210630121307.GA5106@sirena.org.uk>
To:     Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



> Am 30.06.2021 um 14:13 schrieb Mark Brown <broonie@kernel.org>:
>=20
> On Tue, Jun 29, 2021 at 10:21:45PM +0200, H. Nikolaus Schaller wrote:
>=20
>> There seems to be a deadlock in probing:
>=20
>> 	e.g. ldo3_reg depends on vdds_1v8_main supply
>> 	vdds_1v8_main depends on smps7_reg supply
>> 	smps7_reg depends on vsys_cobra supply
>> 	vsys_cobra depends on nothing
>=20
>> This would normally lead to a simple chain as you described above. =
But
>> ldo3_reg and smps7_reg share the same driver and can probe =
successfully or
>> fail only in common.
>=20
> I don't see any deadlock there?  Just a straightforward set of
> dependencies.  Anything circular would clearly be a driver bug.

I think it could be indirectly circular since ldo3_reg does not find =
smps3
registered. But I have to run more tests with printk inserted.

So I am not sure if that is the issue but the best hypothesis I =
currently know of.

>=20
>> Now if ldo3_reg defers probe through the new rule, smps7_reg is never
>> probed successfully because it is the same driver. Hence =
vdds_1v8_main can
>> not become available. And the Palmas continues to run in boot =
initialization
>> until some driver (MMC) wants to switch voltages or whatever.
>=20
> The driver should just register all the DCDCs before the LDOs, then
> everything will sort itself out.

Basically the driver code does it that way. But fails. Probing seems to =
defer
until deferral limits (AFAIR there is a timer or counter in the probe =
deferral
queue) an does not succeed.

It only works if I disable the new condition - but apparently it =
suffices
to do so for the LDOs because I noticed that the smps initialization =
also
defines supply_name and there it is no problem to have it before
devm_regulator_register(). Every simple problem becomes complex if you =
look
deeper :)

Which I interpret (without additional tests) that the smps7_reg is =
registered
but does not pass the (new) test when asked by ldo3_reg.

>  It's *possible* you might see a system
> trying to link things together regulators of the same type but that's
> very unusual as it makes the system less efficient.

I can check that - and there may be other LDOs in the Palmas
chained (as described by device tree).

It will need some test time to get more factual information about this
issue besides that reverting the new rule or adding a trick to make
the Palmas driver initialize properly again.

BR and thanks,
Nikolaus

