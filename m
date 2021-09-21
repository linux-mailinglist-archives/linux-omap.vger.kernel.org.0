Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B66C94137B6
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 18:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhIUQlk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 12:41:40 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:12173 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhIUQlj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Sep 2021 12:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632242402;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=O59OMJ7jgr0cc2k0rt+xGJpk+MfxqU0dBMMc8r48QcQ=;
    b=poG6h4706jl6ObZS4sshaluwzoDngoH29I5ZE4pvRpaj/FiJ15RSTzsDz+sMLIOHmS
    ODoUTLyLojOM25x+WzJuQ4wzVXiHBC0ZWIMd5cq45Vnb2ZgjgfiKUbugmtgdEvL5jRv6
    zLENmfcwzWWQFV3a4AoJbT+TwzxrAij09d0EZfsClYf8qFqsUqlwjpd2caJbDHYS18LS
    vvrMtWArVhSaOMXJFSpCoEMO4/OEcmGOhPSbtJdBVBHbSqqYjjt8G3/Qda5ExujVMI8y
    nId5CqDtMw49J3IpZx8beGiC3PR7R0zzPMLZDN9OP3G46LJtF8qDmhbAKkmBJLqyRWDV
    CGAA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NIGH/jrwDOpYIw="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id I01f74x8LGe28Mt
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 21 Sep 2021 18:40:02 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <cce97271-11d2-cc1a-a0fc-c8e8b4482329@ti.com>
Date:   Tue, 21 Sep 2021 18:40:01 +0200
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7C582E1F-13F6-4432-AE99-FF9B7EE9B06D@goldelico.com>
References: <120a0ca4-28c7-5a7b-f1ab-2015c8817bda@fi.rohmeurope.com>
 <YUQyQgFAOFnBlcdP@atomide.com>
 <0679a5bb-88d1-077d-6107-d5f88ef60dbf@fi.rohmeurope.com>
 <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com>
 <331ab81e-cd42-7e9b-617a-fde4c773c07a@ti.com>
 <615b6fec-6c62-4a97-6d0c-d2e5a5d1ccb2@fi.rohmeurope.com>
 <dab93132-2e5a-78f2-4313-fc541ea36a10@ti.com>
 <36785ccf-57b4-eaf1-cfc0-b024857f7694@gmail.com>
 <YUmOGFUFONR/ynfW@atomide.com> <cce97271-11d2-cc1a-a0fc-c8e8b4482329@ti.com>
To:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Matti, Tony,

> Am 21.09.2021 um 18:07 schrieb Suman Anna <s-anna@ti.com>:
>=20
> Hi Matti, Tony,
>=20
> On 9/21/21 2:47 AM, Tony Lindgren wrote:
>> * Matti Vaittinen <mazziesaccount@gmail.com> [210920 08:23]:
>>> Finally, adding the udelay(100); (as Tony suggested) at the end of =
the
>>> omap_reset_deassert() did make the oops go away even when pruss_tm =
was
>>> enabled. I don't know what would be a proper fix though.
>=20
> I have been able to boot v5.15-rc1 just fine on my BBB without any =
additional
> changes [1].

Same for me with a v5.15-rc1 based kernel.

> May I ask what is your BBB board version? My board is rev.A5C.

I have an Rev B6 with EXP41 display attached. I think Matti reported a =
Rev C board?

> I vaguely remember from all those years ago when I first enabled PRUSS =
on AM335x
> that some earlier BBB versions had some issues around PRUSS.

What I am not using is PRUSS so it may (or may not) be disabled in =
CONFIG.

BR,
Nikolaus=
