Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A176143DDF0
	for <lists+linux-omap@lfdr.de>; Thu, 28 Oct 2021 11:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhJ1Jqj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Oct 2021 05:46:39 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:25570 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbhJ1Jqh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Oct 2021 05:46:37 -0400
X-Greylist: delayed 60166 seconds by postgrey-1.27 at vger.kernel.org; Thu, 28 Oct 2021 05:46:36 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1635414062;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=KhRgye8CY3owm5tetj48D4pQO+58RvsWv1qQ+l2jbdo=;
    b=sZ/CZDz5ZiqvsMwBa+CaNh9MDYp1kKp035LW5k2Kb/Px7Nrx4naKWUJqGbK4r9iTxa
    B4uK3PR1gjLOTRNabs6+UXKMs7/ZFdZDP52EZrfJbTSg/va2LbvU9BdE/IAFY/wqPgP2
    tQ3TV6Wqj32WRqJykj9uWHH7xomNxYBJGIM7LuuAPsewTIlzY9OirWknn9lS1zRKP8eW
    grLS7XbfmoqroxqOZOb1TFR+CSIBjZozkq/A6+dCc6UTF5hEyQIax1wrfSc7SxH2AvJ0
    rcwdwQOYcukwXO+22ngWpnpQGnB33u15TrzuJneS9Tva/V1u/nvwVLUpGhYcVtm3AIEL
    T3VA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw4vtTA=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.1 DYNA|AUTH)
    with ESMTPSA id d01d1fx9S9f15fQ
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Thu, 28 Oct 2021 11:41:01 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [RFC] mmc: core: transplant ti,wl1251 quirks from to be retired
 omap_hsmmc
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <2013308.OSlt1BDEiP@pc-42>
Date:   Thu, 28 Oct 2021 11:40:59 +0200
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
Message-Id: <1EF25CD6-7801-4C15-AB4C-5F499948A653@goldelico.com>
References: <8ecc5c79c1dd0627d570ede31e18c860786cacca.1633519499.git.hns@goldelico.com>
 <CAPDyKFp47sAXhM2s5HOqV2wLf-kYRhdqSdzcn7a62ZW23SSPdg@mail.gmail.com>
 <470A96FD-DB24-4C32-BC9F-AE2F617FBF2D@goldelico.com>
 <2013308.OSlt1BDEiP@pc-42>
To:     =?utf-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi J=C3=A9r=C3=B4me,

> Am 28.10.2021 um 10:59 schrieb J=C3=A9r=C3=B4me Pouiller =
<jerome.pouiller@silabs.com>:
>=20
> Hi Nikolaus,
>=20
> On Thursday 28 October 2021 09:08:50 CEST H. Nikolaus Schaller wrote:
>=20
>>> Let me have a closer look - and for sure, I am willing to help if =
needed.
>=20
> I confirm it does not have the expected behavior. =
!mmc_fixup_of_compatible_match()
> should be mmc_fixup_of_compatible_match(), sorry.

Ok, I see.

One more question: how can I specify "ti,wl1251" in some struct =
mmc_fixup table?
Does it need another macro like MMC_FIXUP() or SDIO_FIXUP() to set the =
.name
field?

>>=20
>> Combining your suggestions we could do roughly:
>>=20
>> in mmc_sdio_init_card():
>>=20
>>        if (host->ops->init_card)
>>                host->ops->init_card(host, card);
>>        else
>>                mmc_fixup_device(host, sdio_prepare_fixups_methods);
>=20
> I think I mostly agree, but why you don't call mmc_fixup_device() if
> init_card is defined? (BTW, mmc_fixup_device() takes a card as
> first parameter)

Because I want to get rid of init_card. It is host specific and not =
client
specific.

>=20
>=20
>> Next we need a location for the sdio_prepare_fixups_methods table and =
functions.
>>=20
>> For "ti,wl1251" we would then provide the entry in the table and a =
function doing
>> the setup. But where should these be defined? Likely not in a header =
file like
>> quirks.h? But there is no quirks.c.
>=20
> I think you can place your function in drivers/mmc/core/card.h. There =
are
> already add_quirk(), add_limit_rate_quirk(), add_quirk_mmc(), etc...

Ok. Would be some add_wl1251_quirk() then.

BR and thanks,
Nikolaus

