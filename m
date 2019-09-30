Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 664F8C23B9
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 16:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731499AbfI3O44 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 10:56:56 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:25134 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730780AbfI3O44 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Sep 2019 10:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1569855413;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=fWF7W1fXCBUVnV4e5QpVkAAjp4iG3lMu6dcgraOrTws=;
        b=kI5DKDcOpapO+gO51sThRP6X0Z9ko0jhyTP8mntLW0kIZt27ofUUVwp9xLq32+133H
        nT5QSqMmq9fvLdJHnIUwgH+gHEVqlEZ3amNGTIFQqCZDUOTnVgZaEovblGAf6/H/4+dz
        6npvlhtkcPUIeT9uWXoKY2W9LGL3Zur5Nj++5giV/JPuQV7rsQAF4huPWdiPqcV9tgQh
        85Jpn7aeDTyO9YcduGuShXdF1ghSzjGcTSjCbnrm/nepS9lL8I8naRvT1SomHrM1zIk3
        fpZ2NxwiFtyOOPbIiF7P4GsxRaMZrP2bBWNfe9VYFAZ078S7N3fSPnJ/YGXuDJ67uCj2
        CLCw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaZXA0Ji18="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v8UEueSkh
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 30 Sep 2019 16:56:40 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to dts
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <3777f1b1-2d9a-334b-b9e7-99dfda2ae29b@ti.com>
Date:   Mon, 30 Sep 2019 16:56:39 +0200
Cc:     Adam Ford <aford173@gmail.com>, Tero Kristo <t-kristo@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BCB0237F-1AF7-4603-A778-8944C3618BC7@goldelico.com>
References: <20190510194229.20628-1-aford173@gmail.com> <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com> <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com> <845055e2-8182-de74-2077-629fdf50ac6c@ti.com> <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com> <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com> <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com> <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com> <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com> <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com> <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com> <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com> <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com> <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com> <CAHCN7x+vCfPTRE+zzYUwAXdbBzRotTP2hSOgsHB0FdgBhZV5zA@mail.gmail.com> <CAHCN7xJDV=R9Ysjhff7=mEXdciwPP_5LQbHwaUT8KvhSkLKw8A@mail.gmail.com> <04306a5e-f9be-35a4-1aa1-5795d780e289@ti.com> <3777f1b1-2d9a-334b-b9e7-99dfda2ae29b@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 30.09.2019 um 16:27 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>=20
> On 30/09/2019 17:20, Tomi Valkeinen wrote:
>=20
>> Let's see what Tero says, but yeah, something is odd here. I expected =
the max divider to be 16 with Tero's patch, but I don't see it having =
that effect. I can get the div to 31.
>> You can see this from the clock register 0x48004e40 (CM_CLKSEL_DSS). =
The lowest bits are the divider, 5 to 0. The TRM says max div is 32.
>> Tero said for him the dividers > 16 didn't "stick" to the register. =
I'm now wondering if he has an old beagleboard with OMAP34xx, which has =
max div 16.
>=20
> So testing a bit more here, I can see the DSS working fine and fps as =
expected when I write values directly to CM_CLKSEL_DSS:5:0, with =
dividers up to 31. With 32, DSS breaks. The TRM (AM/DM37x) says value 32 =
is valid.

Just a blind guess: is there something in the errata to take care of?

