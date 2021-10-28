Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704A743DE6D
	for <lists+linux-omap@lfdr.de>; Thu, 28 Oct 2021 12:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhJ1KKR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Oct 2021 06:10:17 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:25062 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbhJ1KKR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Oct 2021 06:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1635415649;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=hXR8Z/Nu1gLX0h4WuKajrdI1yS2oKpMgJtR5xG9UxGM=;
    b=KrW0hEHwbBnKn27A1B4OPBxV1nQgN7v3JNpkZ2R4FQnwHfKUziYbzv8Hr6prIm5J8q
    Nu74y5bmI6E04xlbCVTNFEp056Y0ktmmL8iwMBCR1Aw5UUXktsVjO8Qmgu4y2I3J3lgR
    nbMysHedReIGsVDS/7Q1AjTDRF70YW9nE9egEFaw022ZBHiP+vJS1/kwu1495Tr+3SKh
    Z841xHxiMPdBmSjRvWA6flsGjoGNPmHtw++otWMqHk+o2P2RZJZeXNG89OEVQvta+9SQ
    XdkySfvdHeEfixPMLhYugnxhWac6y6Yc4hqWYWhSbyUl9S1tFyyFndlHjoIjv86uEnuO
    zi1w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw4vtTA=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.1 DYNA|AUTH)
    with ESMTPSA id d01d1fx9SA7S5sY
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Thu, 28 Oct 2021 12:07:28 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [RFC] mmc: core: transplant ti,wl1251 quirks from to be retired
 omap_hsmmc
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <34072875.m9Xp8G9xV5@pc-42>
Date:   Thu, 28 Oct 2021 12:07:27 +0200
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Avri Altman <avri.altman@wdc.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bean Huo <beanhuo@micron.com>, linux-mmc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4153E8E6-2D39-4AEA-9CC6-411D4FF8CE67@goldelico.com>
References: <8ecc5c79c1dd0627d570ede31e18c860786cacca.1633519499.git.hns@goldelico.com>
 <2013308.OSlt1BDEiP@pc-42>
 <1EF25CD6-7801-4C15-AB4C-5F499948A653@goldelico.com>
 <34072875.m9Xp8G9xV5@pc-42>
To:     =?utf-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



> Am 28.10.2021 um 11:55 schrieb J=C3=A9r=C3=B4me Pouiller =
<jerome.pouiller@silabs.com>:
>=20
> On Thursday 28 October 2021 11:40:59 CEST H. Nikolaus Schaller wrote:
>>> Am 28.10.2021 um 10:59 schrieb J=C3=A9r=C3=B4me Pouiller =
<jerome.pouiller@silabs.com>:
>>> On Thursday 28 October 2021 09:08:50 CEST H. Nikolaus Schaller =
wrote:
>>>=20
>>>>> Let me have a closer look - and for sure, I am willing to help if =
needed.
>>>=20
>>> I confirm it does not have the expected behavior. =
!mmc_fixup_of_compatible_match()
>>> should be mmc_fixup_of_compatible_match(), sorry.
>>=20
>> Ok, I see.
>>=20
>> One more question: how can I specify "ti,wl1251" in some struct =
mmc_fixup table?
>> Does it need another macro like MMC_FIXUP() or SDIO_FIXUP() to set =
the .name
>> field?
>=20
> yes, I didn't provide it with my RFC.=20

I see.

Starts to look like a good plan and we just have to execute it.

Please notify if you have a new version to work with (it isn't urgent =
since the
transplantation is only needed if omap_hsmmc is retired which depends on =
merge
of the new driver).

BR and thanks,
Nikolaus

