Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21CF34D13F0
	for <lists+linux-omap@lfdr.de>; Tue,  8 Mar 2022 10:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236785AbiCHJzn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Mar 2022 04:55:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235300AbiCHJzm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Mar 2022 04:55:42 -0500
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27ABD42494;
        Tue,  8 Mar 2022 01:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646733277;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=wjjSK7dEE22rrGMows8/A+m4W60RJvkYkoSVymWJKTk=;
    b=AnrLLV+LPCJCsxpvdzY+Gpa8c6MXV3FxMzoKgqiZIj8oXD8JjgTSbeKvUbwdzLLAlX
    nFsjW+Uuk/kBBkzG4gctP91cARKNcHBN/UQYKm//9W4NRgm8mwLof6eHuMxhR5+rFUJA
    /uzYnlujcfrgW/dSBj6Zia2LRhwjSbdf7tkNL0ttXDXXQKlGycQjS2QT2CMEcFIqZd8F
    QYPO6n3FxqQL+OrJpiEKEIr6ZT+jLZTnSHgNolNo5NdGRBvVKG6RKDMXeIeN6AeWt0H1
    Yw4NxN1v1aABGLzqKXKqQN0wpDvNN6WsOBjpxS68vkCmgtuaVWoyUvN3/cisEQqaRGJK
    ++zQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NIGH/jrwDqoZQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.40.1 DYNA|AUTH)
    with ESMTPSA id n729cey289sbREg
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 8 Mar 2022 10:54:37 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH] ARM: dts: am33xx-l4: Add missing touchscreen clock
 properties
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20220308104843.23142c85@xps13>
Date:   Tue, 8 Mar 2022 10:54:36 +0100
Cc:     =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E3122758-2031-47B3-9C18-0DFBE4D5C4CD@goldelico.com>
References: <20220307111413.8903-1-miquel.raynal@bootlin.com>
 <511C8854-13D9-4B52-ACA7-6F519A9B3048@goldelico.com>
 <20220308104843.23142c85@xps13>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Miquel,

> Am 08.03.2022 um 10:48 schrieb Miquel Raynal =
<miquel.raynal@bootlin.com>:
>=20
> Hi H.,
>=20
> hns@goldelico.com wrote on Mon, 7 Mar 2022 20:19:48 +0100:
>=20
>> Hi Miquel,
>> some tiny typos...
>>=20
>>> Am 07.03.2022 um 12:14 schrieb Miquel Raynal =
<miquel.raynal@bootlin.com>:
>>>=20
>>> When adding support for TI magadc, the MFD driver (common to the =20
>>=20
>> "magadc"?
>=20
> It's actually the name of the hardware block. It stands for 'magnetic
> stripe reader and/or ADC', very much like the first ADC which has a
> specific Touchscreen hardware feature as well. You can wire X lines to
> a touchscreen, and TOTAL - X lines to the ADC, same applies to the
> magnetic stripe reader.
>=20
> I can s|magadc|Magnetic Stripe Reader/second ADC| to clarify.

Ok, I see. I had googled and grepped through the kernel logs and found
no hint about "magadc". But if support is newly added, this explains.

>=20
>>> touchscreen and the ADC) got updated to ease the insertion of a new =
DT
>>> node for the ADC, with its own compatible, clocks, etc. Commit
>>> 235a96e92c16 ("mfd: ti_am335x_tscadc: Don't search the tree for our
>>> clock") removed one compatible specific information which was the =
clock
>>> name, because the clock was looked up from scratch in the DT while =
this
>>> hardware block was only fed by a single clock, already defined and
>>> properly filled in the DT.
>>>=20
>>> Problem is, this change was only validated with an am437x-based =
board,
>>> where the clocks are effectively correctly defined and referenced. =
But
>>> on am33xx, the ADC clock is also correctly defined but is not =
referenced
>>> with a clock phandle as it out to be. =20
>>=20
>> maybe you mean "ought to be"?
>=20
> I knew there was something wrong with it, but not what exactly :)

That is what peer review is good for...

>=20
>>> The touchscreen bindings clearly state that the clocks/clock-names
>>> properties are mandatory, but they have been forgotten in one DTSI. =
This
>>> was probably not noticed in the first place because of the clock
>>> actually existing and the clk_get() call going through all the tree
>>> anyway.
>>>=20
>>> Add the missing clock phandles in the am33xx touchscreen =
description. =20
>>=20
>> Yes, makes touch on BeagleBoard Black with Chipsee 4"3 panel work =
again!
>>=20
>>>=20
>>> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> Fixes: 235a96e92c16 ("mfd: ti_am335x_tscadc: Don't search the tree =
for our clock") =20
>> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
>=20
> Thanks!
> Miqu=C3=A8l

BR and thanks,
Nikolaus

