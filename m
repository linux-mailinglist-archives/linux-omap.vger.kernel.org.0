Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62BAD43B90B
	for <lists+linux-omap@lfdr.de>; Tue, 26 Oct 2021 20:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236620AbhJZSLa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Oct 2021 14:11:30 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:24024 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233729AbhJZSL2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Oct 2021 14:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1635271724;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=74t1mRAJSitLug010w0F1NW8drDiZWZJSwlgKAAwYPI=;
    b=NIWrYrscnOR/x9mpeRFH6NMUQkRWah+6dtDPHFXz3fhE2c+jeI2EAiuUHVM+fOOJ9I
    aWaGC9M7f4gHYCucgPCtRPj0rAOEDgI5sewSpGVsT/y6Qy8rxE72mBbjm6ZMaO8YJJim
    clXUC2zSIqwWF3gSKGrqmJct+GufrKT5t8BMqNzwTDgR7RosccHy6IHPSm4fY1tY45Ka
    kvSBi4PsXig0C4AVV8UYm1A34dV0F5eZl5n872rJpMCm25cwM5/ZombCvkLQ1GM8AkEi
    CmIIv2xM1UBCGiW8/lCzH5P9lMrWNZTZVsv/OWrA1il1NymoQ9B1FBRdqi/Kmj9ulCrQ
    ZB+Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3i8J+"
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
    by smtp.strato.de (RZmta 47.34.1 SBL|AUTH)
    with ESMTPSA id d01d1fx9QI8hyjg
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 26 Oct 2021 20:08:43 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [RFC] mmc: core: transplant ti,wl1251 quirks from to be retired
 omap_hsmmc
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAPDyKFraMXqC9OBeUTpm=bxjrFZTCopV3ZJQf1TRsA8UeTWdTA@mail.gmail.com>
Date:   Tue, 26 Oct 2021 20:08:42 +0200
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
Message-Id: <80C6A8DD-183B-4FDD-B203-D3108C106043@goldelico.com>
References: <8ecc5c79c1dd0627d570ede31e18c860786cacca.1633519499.git.hns@goldelico.com>
 <CAPDyKFraMXqC9OBeUTpm=bxjrFZTCopV3ZJQf1TRsA8UeTWdTA@mail.gmail.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Uf,

+ Tony, linux-omap list

> Am 26.10.2021 um 19:12 schrieb Ulf Hansson <ulf.hansson@linaro.org>:
>=20
> + Jerome
>=20
> On Wed, 6 Oct 2021 at 13:25, H. Nikolaus Schaller <hns@goldelico.com> =
wrote:
>>=20
>> The TiWi 5 WiFi module needs special setup of the sdio
>> interface before it can be probed.
>>=20
>> So far, this is done in omap_hsmmc_init_card() in omap_hsmmc.c
>> which makes it useable only if connected to omap devices
>> which use the omap_hsmmc. The OpenPandora is the most promient
>> example.
>>=20
>> There are plans to switch to a newer sdhci-omap driver and
>> retire omap_hsmmc. Hence this quirk must be reworked or moved
>> somewhere else. Ideally to some location that is not dependent
>> on the specific SoC mmc host driver.
>>=20
>> Analysis has shown that omap_hsmmc_init_card() is called
>> through the host->ops->init_card hook which itself
>> is called in three generic locations:
>>=20
>> mmc_init_card()
>> mmc_sd_init_card()
>> mmc_sdio_init_card()
>>=20
>> All these functions share a call to mmc_select_card() shortly
>> after running the init hook and therefore I assume that
>> a good place transplanting the special wl1251 handling is
>> mmc_select_card() - unless we want to copy and maintain the
>> code to three different places.
>>=20
>> After this quirk has been moved there, we can remove
>> omap_hsmmc_init_card() in omap_hsmmc.c in a separate patch.
>> Indeed the plan is to remove omap_hsmmc.c completely.
>>=20
>> A future development path to generalize could be to make
>> the code not depend on compatible =3D "ti,wl1251" but check
>> for optional device tree properties (non-std-sdio, bus width,
>> vendor, device, blksize, max_dtr, ocr) which can be defined
>> for any child device of the mmd/sd port needing such special
>> setup.
>=20
> I wouldn't go that path, simply because it may look like we encourage
> vendors to deviate from the SDIO spec. :-)

Well, that ti,wl1251 chip is so old [1] that probably the SDIO spec did
deviate from what the vendor thought it will look like :)

[1] https://www.ti.com/lit/ml/swmt009a/swmt009a.pdf

> At least for now, matching on the compatible string and applying card
> quirks makes perfect sense to me.

Yes, that is how it already was in the omal_hsmmc driver quirks.

>=20
>>=20
>> Related-to: commit f6498b922e57 ("mmc: host: omap_hsmmc: add code for =
special init of wl1251 to get rid of pandora_wl1251_init_card")
>> Related-to: commit 2398c41d6432 ("omap: pdata-quirks: remove =
openpandora quirks for mmc3 and wl1251")
>> Related-to: commit f9d50fef4b64 ("ARM: OMAP2+: omap3-pandora: add =
wifi support")
>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # on OpenPandora
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>=20
> As a matter of fact, the similar problem that you are looking to
> address (applying card quirks based on DT compatibility strings), is
> partly being taken care of in another series [1], being discussed
> right now. I think the solution for the ti,wl1251 should be based upon
> that too. Please have a look and see if you can play with that!?

That is interesting.
Yes, maybe it can be the basis. At least for finding the chip and =
driver.

BR and thanks,
Nikolaus

>=20
> Kind regards
> Uffe
>=20
> [1]
> [RFC PATCH 0/2] mmc: allow to rely on the DT to apply quirks
> =
https://lore.kernel.org/lkml/20211014143031.1313783-1-Jerome.Pouiller@sila=
bs.com/

