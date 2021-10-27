Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B4643CF69
	for <lists+linux-omap@lfdr.de>; Wed, 27 Oct 2021 19:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243166AbhJ0RGN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Oct 2021 13:06:13 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:15874 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243195AbhJ0RGJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Oct 2021 13:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1635354047;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=UcGJA7PEzuSJ63GKIVH98UGJaPpm3sGP7NyUN1zuyBo=;
    b=sOD83cqktCW8+WMvGxX8in5KCcElKPnSn60m5Q+pZQ7KIxtfosolonZl/Gp43SWR3D
    s0eY5AFhUOgsP169qkXq8Ywcn2vH/avd8Q2rWv43hDl8w7I1LPVzMlvx16EoEqKy3oOg
    bWhnBTRq+erj2HB2l6bRyPvInON5aV+NzxB3Q8K5Cb/AMniRKjrpAq9vj74X3Wr5Qman
    UsVUuA/CdC/6PpqGNVoP/db9HyQ+u3MXOfrw0jOXnAxoaGHkj5zpvdswCN0Fx/BPb74t
    hKjdkzl2UdgrCqogsJqAXLFBDIc+2gaREAc+JV7slQ/zwNDC3S68MnNJ/BhqrNsN+wvx
    L6hA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NIGH/jrwDaimQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.34.1 DYNA|AUTH)
    with ESMTPSA id d01d1fx9RH0h350
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Wed, 27 Oct 2021 19:00:43 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [RFC] mmc: core: transplant ti,wl1251 quirks from to be retired
 omap_hsmmc
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <80C6A8DD-183B-4FDD-B203-D3108C106043@goldelico.com>
Date:   Wed, 27 Oct 2021 19:00:42 +0200
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
Message-Id: <935598D6-B8B5-4EC8-B87E-8EDC0F3B58CF@goldelico.com>
References: <8ecc5c79c1dd0627d570ede31e18c860786cacca.1633519499.git.hns@goldelico.com>
 <CAPDyKFraMXqC9OBeUTpm=bxjrFZTCopV3ZJQf1TRsA8UeTWdTA@mail.gmail.com>
 <80C6A8DD-183B-4FDD-B203-D3108C106043@goldelico.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Ulf,

> Am 26.10.2021 um 20:08 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi Uf,
>>=20
>> As a matter of fact, the similar problem that you are looking to
>> address (applying card quirks based on DT compatibility strings), is
>> partly being taken care of in another series [1], being discussed
>> right now. I think the solution for the ti,wl1251 should be based =
upon
>> that too. Please have a look and see if you can play with that!?
>=20
> That is interesting.
> Yes, maybe it can be the basis. At least for finding the chip and =
driver.

I have done a first experiment.

It seems as if the series [1] does the opposite of what we need... It =
just
skips entries in struct mmc_fixup if the DT does *not* match.

This new match is not even tried in the wl1251 case since =
card->cis.vendor
and card->cis.device are not properly initialized when =
mmc_fixup_device() is called.
(in the upstream code the init_card function sets these and also sets =
MMC_QUIRK_NONSTD_SDIO
to early abort before sdio_read_cccr, sdio_read_common_cis, and =
mmc_fixup_device).

What I don't get from the code is how cis.vendor or cis.device can be
initialized from device tree for a specific device. As far as I see it =
can
only be checked for and some quirks can be set from a table if vendor =
and
device read from the CIS registers do match.=20

Instead, we want to match DT and define some values for an otherwise =
unknown
device (i.e. we can't match by vendor or other methods) to help to =
initialize
the interface. So in mmc_fixup_device it is too late and we need =
something
running earlier, based purely on device tree information...

BR and thanks,
Nikolaus


> [1]
> [RFC PATCH 0/2] mmc: allow to rely on the DT to apply quirks
> =
https://lore.kernel.org/lkml/20211014143031.1313783-1-Jerome.Pouiller@sila=
bs.com/

