Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D6F3B77F0
	for <lists+linux-omap@lfdr.de>; Tue, 29 Jun 2021 20:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234140AbhF2Sk1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Jun 2021 14:40:27 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:25756 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234971AbhF2Sk0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 29 Jun 2021 14:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624991696;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=DmULRByj/Wruf56EMqRvLcOMlQUxpgR/pGLuuXfGYjI=;
    b=GefT17oq0aCv/ZNE+kU5nGMlZ5icO5+EEsUDfsx7E4cyzUJ7GgpmGrUwjZSw+An9aO
    VSNwNH3Y3VywrmZwAQaEBJsS3mzCv3osb8AS6QwhN+rJDCtCyP6hbwoIrIf4HS1N6jcl
    vjmAP4c4HuNcviUV3epIb9prM7dA/3J4EuCbY99+XPaA9WhmMuXv5tB1EdeyLlPI8mPW
    2ZWpu6JChTSc+k/PdE7ExZNFEHXf+MI7m7Uzy7KLuA5f6Ki/+SWM/20wqGfm8TrDaSSY
    mS9du/EQdFuJfR9lr7vhUpsP6kohFBy0opr5LFu/uiCj+bAGWuhwFskP+q/8YW5FpfQG
    wv7g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlWfXA0NbQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.27.5 DYNA|AUTH)
    with ESMTPSA id f0359ax5TIYtOuZ
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 29 Jun 2021 20:34:55 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH] regulator: palmas: set supply_name after registering the
 regulator
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20210629155922.GD4613@sirena.org.uk>
Date:   Tue, 29 Jun 2021 20:34:55 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Nishanth Menon <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2C7C3A47-4A5B-4052-98FC-7A96E2F138CA@goldelico.com>
References: <4ed67090bc048442567931ede8f1298a0b312b28.1624980242.git.hns@goldelico.com>
 <20210629155922.GD4613@sirena.org.uk>
To:     Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Mark,

> Am 29.06.2021 um 17:59 schrieb Mark Brown <broonie@kernel.org>:
>=20
> On Tue, Jun 29, 2021 at 05:24:03PM +0200, H. Nikolaus Schaller wrote:
>> Commit 98e48cd9283d ("regulator: core: resolve supply for =
boot-on/always-on regulators")
>>=20
>> introduced a new rule which makes Palmas regulator registration fail:
>>=20
>> [    5.407712] ldo1: supplied by vsys_cobra
>> [    5.412748] ldo2: supplied by vsys_cobra
>> [    5.417603] palmas-pmic 48070000.i2c:palmas@48:palmas_pmic: failed =
to register 48070000.i2c:palmas@48:palmas_pmic regulator
>>=20
>> This seems to block additions initializations and finally the
>> Pyra-Handheld hangs when trying to access MMC because there is
>> no mmc-supply available.
>=20
> What is that rule and how is this patch intended to ensure that Palmas
> meets it?
>  As covered in submitting-patches.rst your changelog should
> explain this so that in review we can verify that this is a good fix.

I am very sorry, but I simply believed that it is not necessary to =
copy&paste or
describe this because it appears not to be difficult to retrieve.

Commit 98e48cd9283d ("regulator: core: resolve supply for =
boot-on/always-on regulators")

    regulator: core: resolve supply for boot-on/always-on regulators
   =20
    For the boot-on/always-on regulators the set_machine_constrainst() =
is
    called before resolving rdev->supply. Thus the code would try to =
enable
    rdev before enabling supplying regulator. Enforce resolving supply
    regulator before enabling rdev.

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index f192bf19492e..e20e77e4c159 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1425,6 +1425,12 @@ static int set_machine_constraints(struct =
regulator_dev *rdev)
         * and we have control then make sure it is enabled.
         */
        if (rdev->constraints->always_on || rdev->constraints->boot_on) =
{
+               /* If we want to enable this regulator, make sure that =
we know
+                * the supplying regulator.
+                */
+               if (rdev->supply_name && !rdev->supply)
+                       return -EPROBE_DEFER;
+
                if (rdev->supply) {
                        ret =3D regulator_enable(rdev->supply);
                        if (ret < 0) {

This rule (rdev->supply_name && !rdev->supply) did not exist before =
98e48cd9283d
and it seems to return early with EPROBE_DEFER if there is a =
desc->supply_name defined,
but no supply resolved.

The Palmas driver is setting desc->supply_name to some string constant =
(i.e. not NULL)
and is then calling devm_regulator_register().

So it was working fine without having the supplying regulator resolved. =
AFAIK they
just serve as fixed regulators in the device tree and have no physical =
equivalent.

My proposal just moves setting the supply_name behind =
devm_regulator_register() and
by that restores the old behaviour.

Well, unless...

... devm_regulator_register() does something differently if =
desc->supply_name
is not set before and changed afterwards. It may miss that change.

I did not observe any indications, but something could happen in the =
guts of
devm_regulator_register(). If it is, then my approach is clearly faulty.

There may be a better solution where I hope more reviewers (especially
those more familiar with the Palmas driver than me) can comment on.

> The change itself looks worrying like it just shuts the error up and
> could cause problems for other systems.


Since this change is confined to the Palmas driver and results in the =
same
behaviour as it had before 98e48cd9283d did break it, it should not harm
other systems.

So I hope for guidance if my approach is good or needs a different =
solution.

BR and thanks,
Nikolaus Schaller

