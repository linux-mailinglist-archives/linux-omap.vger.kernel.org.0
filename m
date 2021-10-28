Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C7943DBAF
	for <lists+linux-omap@lfdr.de>; Thu, 28 Oct 2021 09:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhJ1HLj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Oct 2021 03:11:39 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:21061 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbhJ1HLi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Oct 2021 03:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1635404932;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=AmCnIkC4xxL8JxCkpiyDD7JlfpGKYsyeat25tXevaX4=;
    b=jLG7PP43yreRqs2U/5telR2iGo8kTKwncWbdYEzwaXEixgwnzzyHQfHvpq/S82OQes
    AsyOI2BgYqECOyfzjOyyGa/W3p6dSVPtTG2yU10XZYMFyCoQEMxp0Y9RHYWtqL6hTpCT
    WusP6S5qw46BdJFMUPKoNF5IB+i/JkEP9wqEbw5X99NalY0WX2hYiZWke3gU3Wip/h+3
    +ccdwFUUUsFTYX68Qg+sKxIsgyJkWm8FnVgV0keKoO69tl2z456sfZtQ8A86kxJHRvSu
    rE6DoMoECg0dJ2kXG7UE6Rpo6jmeA3TE6uymcscduEWq574YnyuAhGbqOLxFI8vdUrRM
    J1jg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw4vtTA=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.1 DYNA|AUTH)
    with ESMTPSA id d01d1fx9S78p4jN
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Thu, 28 Oct 2021 09:08:51 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [RFC] mmc: core: transplant ti,wl1251 quirks from to be retired
 omap_hsmmc
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAPDyKFp47sAXhM2s5HOqV2wLf-kYRhdqSdzcn7a62ZW23SSPdg@mail.gmail.com>
Date:   Thu, 28 Oct 2021 09:08:50 +0200
Cc:     Jerome Pouiller <Jerome.Pouiller@silabs.com>,
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
Message-Id: <470A96FD-DB24-4C32-BC9F-AE2F617FBF2D@goldelico.com>
References: <8ecc5c79c1dd0627d570ede31e18c860786cacca.1633519499.git.hns@goldelico.com>
 <CAPDyKFraMXqC9OBeUTpm=bxjrFZTCopV3ZJQf1TRsA8UeTWdTA@mail.gmail.com>
 <80C6A8DD-183B-4FDD-B203-D3108C106043@goldelico.com>
 <935598D6-B8B5-4EC8-B87E-8EDC0F3B58CF@goldelico.com>
 <CAPDyKFp47sAXhM2s5HOqV2wLf-kYRhdqSdzcn7a62ZW23SSPdg@mail.gmail.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



> Am 27.10.2021 um 23:31 schrieb Ulf Hansson <ulf.hansson@linaro.org>:
>=20
> On Wed, 27 Oct 2021 at 19:01, H. Nikolaus Schaller <hns@goldelico.com> =
wrote:
>>=20
>> Hi Ulf,
>>=20
>>> Am 26.10.2021 um 20:08 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>>=20
>>> Hi Uf,
>>>>=20
>>>> As a matter of fact, the similar problem that you are looking to
>>>> address (applying card quirks based on DT compatibility strings), =
is
>>>> partly being taken care of in another series [1], being discussed
>>>> right now. I think the solution for the ti,wl1251 should be based =
upon
>>>> that too. Please have a look and see if you can play with that!?
>>>=20
>>> That is interesting.
>>> Yes, maybe it can be the basis. At least for finding the chip and =
driver.
>>=20
>> I have done a first experiment.
>>=20
>> It seems as if the series [1] does the opposite of what we need... It =
just
>> skips entries in struct mmc_fixup if the DT does *not* match.
>=20
> Ohh, I didn't look that close. In that case the code isn't doing what
> it *should*. The point is really to match on the compatible string and
> then add quirks if that is found.

That is what I had expected.

>=20
> Let me have a closer look - and for sure, I am willing to help if =
needed.
>=20
>>=20
>> This new match is not even tried in the wl1251 case since =
card->cis.vendor
>> and card->cis.device are not properly initialized when =
mmc_fixup_device() is called.
>> (in the upstream code the init_card function sets these and also sets =
MMC_QUIRK_NONSTD_SDIO
>> to early abort before sdio_read_cccr, sdio_read_common_cis, and =
mmc_fixup_device).
>=20
> We can call mmc_fixup_device() more than once during initialization
> and provide different struct mmc_fixup* - if that is needed.

Ah, looks good.

>=20
>>=20
>> What I don't get from the code is how cis.vendor or cis.device can be
>> initialized from device tree for a specific device. As far as I see =
it can
>> only be checked for and some quirks can be set from a table if vendor =
and
>> device read from the CIS registers do match.
>=20
> Yes. I thought that should be possible, but maybe it is not?

It seems to be a hen or egg issue here. MMC_QUIRK_NONSTD_SDIO should be =
set
before we can match by vendor and device or compatible. But it can't be =
set
late.

>=20
>>=20
>> Instead, we want to match DT and define some values for an otherwise =
unknown
>> device (i.e. we can't match by vendor or other methods) to help to =
initialize
>> the interface. So in mmc_fixup_device it is too late and we need =
something
>> running earlier, based purely on device tree information...
>=20
> Okay, I will have a closer look. Maybe we need to extend the card
> quirks interface a bit to make it suitable for this case too.

Combining your suggestions we could do roughly:

in mmc_sdio_init_card():

	if (host->ops->init_card)
		host->ops->init_card(host, card);
	else
		mmc_fixup_device(host, sdio_prepare_fixups_methods);

Next we need a location for the sdio_prepare_fixups_methods table and =
functions.

For "ti,wl1251" we would then provide the entry in the table and a =
function doing
the setup. But where should these be defined? Likely not in a header =
file like
quirks.h? But there is no quirks.c.

Best regards,
Nikolaus

