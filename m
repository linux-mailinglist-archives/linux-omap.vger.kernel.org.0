Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8B34415E5
	for <lists+linux-omap@lfdr.de>; Mon,  1 Nov 2021 10:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbhKAJPs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 1 Nov 2021 05:15:48 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:13764 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231223AbhKAJPr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 1 Nov 2021 05:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1635757973;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=oZ5wN3UpWX/fdbN31f7HesGSNUrq0H/Z//iKpmey02c=;
    b=awNoQOyYU27UORf6o0KFigve8Mp79ghOWLmexLIMrtwIb85toH8wRreg3bXGBycdQ4
    khS9TwtVmbUBGuIq40lxDQwsqVje48FpdHvZbV+ZDa6m1V9XjTTqUJxisdVOxDLQwmTu
    Dkkjc2DCo5UR5+2WnPCFYB6gFPFJHQJDPqCCtUYZt3i0ojvDzYMZC9uJ2lGGdn1D0Bp+
    GxJ0FVVPuId8M8Tkx6r+4UBBKNIt88Lyj5QCuklfYs4HdtnB/WPSV++zwnX2IpBwg0x4
    V46v8300E/DK9jFGshYOEiHeDYmr44n7x/nuE3kw2e8SAm3kw+zbHfiZwwJYyxgDyIVb
    CvFg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3iM4Ukg=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.1 SBL|AUTH)
    with ESMTPSA id d01d1fxA19CqGwO
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 1 Nov 2021 10:12:52 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [RFC] mmc: core: transplant ti,wl1251 quirks from to be retired
 omap_hsmmc
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <4153E8E6-2D39-4AEA-9CC6-411D4FF8CE67@goldelico.com>
Date:   Mon, 1 Nov 2021 10:12:52 +0100
Cc:     Avri Altman <avri.altman@wdc.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bean Huo <beanhuo@micron.com>, linux-mmc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3C22E794-1839-4B53-AC5C-B34DD2C6E2E6@goldelico.com>
References: <8ecc5c79c1dd0627d570ede31e18c860786cacca.1633519499.git.hns@goldelico.com>
 <2013308.OSlt1BDEiP@pc-42>
 <1EF25CD6-7801-4C15-AB4C-5F499948A653@goldelico.com>
 <34072875.m9Xp8G9xV5@pc-42>
 <4153E8E6-2D39-4AEA-9CC6-411D4FF8CE67@goldelico.com>
To:     =?utf-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Jerome and Ulf,

> Am 28.10.2021 um 12:07 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>=20
>=20
>> Am 28.10.2021 um 11:55 schrieb J=C3=A9r=C3=B4me Pouiller =
<jerome.pouiller@silabs.com>:
>>=20
>> On Thursday 28 October 2021 11:40:59 CEST H. Nikolaus Schaller wrote:
>>>> Am 28.10.2021 um 10:59 schrieb J=C3=A9r=C3=B4me Pouiller =
<jerome.pouiller@silabs.com>:
>>>> On Thursday 28 October 2021 09:08:50 CEST H. Nikolaus Schaller =
wrote:
>>>>=20
>>>>>> Let me have a closer look - and for sure, I am willing to help if =
needed.
>>>>=20
>>>> I confirm it does not have the expected behavior. =
!mmc_fixup_of_compatible_match()
>>>> should be mmc_fixup_of_compatible_match(), sorry.

I did take a deeper look and contrary to my first analyses your original =
patches
are correct. I did not completely understand how it was intended to be =
used
and how to match the compatible entry.

>>>=20
>>> Ok, I see.
>>>=20
>>> One more question: how can I specify "ti,wl1251" in some struct =
mmc_fixup table?
>>> Does it need another macro like MMC_FIXUP() or SDIO_FIXUP() to set =
the .name
>>> field?
>>=20
>> yes, I didn't provide it with my RFC.=20

Now I was able to make a version that works on the OpenPandora.

It does not yet use a macro to define the mmc_fixup table, but that can =
be
easily changed.

>=20
> I see.
>=20
> Starts to look like a good plan and we just have to execute it.
>=20
> Please notify if you have a new version to work with (it isn't urgent =
since the
> transplantation is only needed if omap_hsmmc is retired which depends =
on merge
> of the new driver).

I'll send an RFCv2 for the ti,wl1251 quirks now.

Best regards and thanks,
Nikolaus

