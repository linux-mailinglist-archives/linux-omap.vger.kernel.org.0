Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C87ED3BC10F
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jul 2021 17:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbhGEPku (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jul 2021 11:40:50 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:22465 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233794AbhGEPjL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jul 2021 11:39:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625499209;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=4UHkmTC6F7GmXKqmzJPtCMGROE3git1vQDxWX3fRojk=;
    b=CMRtUDGnZK/o23e5eJIhH6dOWvEv9hsgqDIqRFRvNNRQUL7ajYzFy6bZLOM11DAQQx
    kALnqAt2k6a2FFMYeDKXrBREb3bZXDhUStF6NJgtTurpR9R68hIAtVm31BsJADImF1kb
    F6bW+rKpMPYin/8TMbQSr8I58+5O454CjrrQ5Bu6nVkaLINCpT7pIIO7vKI59OuYFoFb
    u3LwRQ7KF0tdnZOuczhvQYTg9mBaz3Gh0TpmTLSfROZgpOKaP5J+4IooqRaMiqPMlUC+
    4SAD6Xm2zZ1O82bii5WLvlQ9HKTxz5DI9R9upJVTdslSz/VsP38qixqn9rjg+dn84pb1
    Jfvw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAgw4/qsw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
    with ESMTPSA id h06665x65FXSKgj
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 5 Jul 2021 17:33:28 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and OMAP4
 support
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <e7a02ee7-6c44-f3e1-f3e7-19e908790246@gmail.com>
Date:   Mon, 5 Jul 2021 17:33:28 +0200
Cc:     Mark Brown <broonie@kernel.org>, tony@atomide.com,
        alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AFAB2982-0747-401F-B3AA-47DC5046428C@goldelico.com>
References: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
 <E1C17C0D-1363-4109-89B3-A652A2B47703@goldelico.com>
 <e7a02ee7-6c44-f3e1-f3e7-19e908790246@gmail.com>
To:     =?utf-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



> Am 05.07.2021 um 16:10 schrieb P=C3=A9ter Ujfalusi =
<peter.ujfalusi@gmail.com>:
>=20
> Hi Nikolaus,
>=20
>>=20
>> Yes, definitively.
>>=20
>> I just wonder how compatible it is with the "old" omap-mcasp driver =
we carry
>> along for the Pyra:
>>=20
>> =
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dblob;f=3Dsound/soc/ti/=
omap-mcasp.c;h=3D24d839a24f34ec02456176744d3690016592b5a3;hb=3D7789ab635e5=
6a2fd9fe04ca2e9ccfeaccb8e0f52
>>=20
>> Does it now have additional functionality or robustness?
>=20
> The davinci-mcasp with series does work on OMAP4. I could not made the
> omap-mcasp working. I have picked the driver from pyra in hopes that =
it
> is working so I will ahve a stable base.
> Have you tested it?

AFAIR it was not tested. e have the sound system working (with some =
glitches)
but that goes through McPDM I think.

>=20
> the omap-mcasp supports only 48KHz and 16bit, no passthrough, no =
24bit,
> all is hardwired for the Galaxy Nexus setup, afaik.
>=20
> The davinci-mcasp should be better all around, I think the PM side is
> also more robust.
>=20
> The other point is that I would not accept the omap-mcasp driver
> upstream. The IP is the same so the driver should be also...

:)

>=20
>> And does it need changes of the OMAP5 device tree?
>=20
> In a similar way as the dts patches in this series.
> fwiw:
> =
https://github.com/omap-audio/linux-audio/commit/2f0a632db0b52321f1fc3623d=
088a741aeb72ef7
> is the patch I have for PandaES to get S/PDIF working.

If I find a little time it should not be difficult to replace your
new driver and fix the DTS in our ABE/AESS branch.

>=20
>> And also important seems to be the ABE/AESS integration where we so =
far failed
>> to make it work again on more recent kernels.
>=20
> The McASP is not routed via ABE/AESS, it has been always handled =
outside
> of the firmware, so it is just a simple link outside.

Ah, ok. Makes it easier to test :)

>=20
>> Our most recent patch set is here:
>>=20
>> =
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/letux/aess-v5
>=20
> Yes, I'm following it ;)
>=20
>> Anyways I am happy to see a little progress on the omap4/5 audio =
subsystem.
>=20
> It is in maintenance mode as there is not much of an interest outside =
of
> a small group of people, but I try to help to get it better for Pyra.

And a lot of public information has been lost (OMAPpedia). But there are =
some backups:

=
https://web.archive.org/web/20181111114134/http://omappedia.org/wiki/Audio=
_Drive_Arch

BR and thanks,
Nikolaus


