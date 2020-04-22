Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7D51B4B89
	for <lists+linux-omap@lfdr.de>; Wed, 22 Apr 2020 19:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgDVRX7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Apr 2020 13:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726057AbgDVRX7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 22 Apr 2020 13:23:59 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707F2C03C1A9;
        Wed, 22 Apr 2020 10:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587576236;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=0rEv5vtIu8s1R6u/s9ENbcEJ/9O1X+purU+T3mOlO00=;
        b=fAz/SXRpNvzrZQnNuQiahgyYTCE3Hh0/g3eciq8IQbb/HgOe9SnL2LFDjQUv71eNpS
        jBqT6wKEtvRXoGgALTV9RxbkON6TB8UKjx2cwIMGhCFQwpr8or34KOZA9fOTCfnwt2+E
        2vGICsVFvQKGjdHmgY6LUTOv99B5puvReTv67b5amKJJfMhuYRSW4Mw8qzAU4t2585vt
        ftf5m5mJQef7KZiKjGqeM2xAZ1vl7I1D7R8/7MlesjW22QF+mnZOdcWG3DHrzx1g+sY1
        Ro4RPQLTlNP5b7XCDNz2CKa7iOkNML9eh6aY2+tkb6FykalUOZrEQMSP6y+z1ykjhJQp
        cSrg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMiw43tskc="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw3MHNj3a9
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 22 Apr 2020 19:23:45 +0200 (CEST)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <MC879Q.XY9S0U9R35681@crapouillou.net>
Date:   Wed, 22 Apr 2020 19:23:52 +0200
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Tony Lindgren <tony@atomide.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?iso-8859-1?Q?Beno=EEt_Cousson?= <bcousson@baylibre.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        OpenPVRSGX Linux Driver Group <openpvrsgx-devgroup@letux.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D90A610B-1F26-4AD4-843A-60EB4E410377@goldelico.com>
References: <20200415130233.rgn7xrtwqicptke2@gilmour.lan> <C589D06E-435E-4316-AD0A-8498325039E3@goldelico.com> <10969e64-fe1f-d692-4984-4ba916bd2161@gmail.com> <20200420073842.nx4xb3zqvu23arkc@gilmour.lan> <b5a06c19-7a3e-bcb8-5ae3-76901b9c6c35@gmail.com> <20200421112129.zjmkmzo3aftksgka@gilmour.lan> <20200421141543.GU37466@atomide.com> <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com> <20200422065859.quy6ane5v7vsy5tf@gilmour.lan> <1AA57A0C-48E6-49BB-BB9A-2AAFFB371BCD@goldelico.com> <20200422151328.2oyqz7gqkbunmd6o@gilmour.lan> <07923B6C-4CCD-4B81-A98F-E19C43412A89@goldelico.com> <MC879Q.XY9S0U9R35681@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Paul,

> Am 22.04.2020 um 18:55 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
>=20
> Le mer. 22 avril 2020 =E0 18:09, H. Nikolaus Schaller =
<hns@goldelico.com> a =E9crit :
>> Hi Maxime,
>>> Am 22.04.2020 um 17:13 schrieb Maxime Ripard <maxime@cerno.tech>:
>>> On Wed, Apr 22, 2020 at 09:10:57AM +0200, H. Nikolaus Schaller =
wrote:
>>>>> Am 22.04.2020 um 08:58 schrieb Maxime Ripard <maxime@cerno.tech>:
>>>>>> It also allows to handle different number of clocks (A31 seems to
>>>>>> need 4, Samsung, A83 and JZ4780 one) without changing the sgx =
bindings
>>>>>> or making big lists of conditionals. This variance would be =
handled
>>>>>> outside the sgx core bindings and driver.
>>>>> I disagree. Every other GPU binding and driver is handling that =
just fine, and
>>>>> the SGX is not special in any case here.
>>>> Can you please better explain this? With example or a description
>>>> or a proposal?
>>> I can't, I don't have any knowledge about this GPU.
>> Hm. Now I am fully puzzled.
>> You have no knowledge about this GPU but disagree with our proposal?
>> Is it just gut feeling?
>> Anyways, we need to find a solution. Together.
>>>> I simply do not have your experience with "every other GPU" as you =
have.
>>>> And I admit that I can't read from your statement what we should do
>>>> to bring this topic forward.
>>>> So please make a proposal how it should be in your view.
>>> If you need some inspiration, I guess you could look at the mali and =
vivante
>>> bindings once you have an idea of what the GPU needs across the SoCs =
it's
>>> integrated in.
>> Well, I do not need inspiration, we need to come to an agreement =
about
>> img,pvrsgx.yaml and we need some maintainer to finally pick it up.
>> I wonder how we can come to this stage.
>> If I look at vivante,gc.yaml or arm,mali-utgard.yaml I don't
>> see big differences to what we propose and those I see seem to come
>> from technical differences between sgx, vivante, mali etc. So there
>> is no single scheme that fits all different gpu types.
>> One thing we can learn is that "core" seems to be a de facto standard
>> for the core clock-name. An alternative "gpu" is used by =
nvidia,gk20a.txt.
>=20
> The Vivante GPU binding requires "bus", "core" and "shader" clocks. =
But if your SoC only has one clock for the GPU, there's nothing that =
prevents you from passing the very same clock as "bus", "core" and =
"shader". This is what we do on the Ingenic JZ4770 SoC.

Fine and good to know.

Well, for the SGX we so far only know a single "core" clock (with =
different
names). Only the A31 seems to be different.

Fortunately I finally found a little time to scan through the a31
user manual: =
http://dl.linux-sunxi.org/A31/A31%20User%20Manual%20V1.20.pdf

There are 3 clock dividers. And there is a single clock PLL8 dedicated =
to
the gpu. The clock dividers are called "gpu core", "gpu mem", "gpu hyd".

Then, there are dedicated clock gating registers. And idle/power status
registers.

Unfortunately, chapter "5.1. GPU" is almost empty and has no block =
diagram.
So I have no idea what "HYD" stands for. And if the memory and HYD =
clocks
are needed and how they should be initialized. If they are different =
ones
or can all be driven by PLL8 in parallel.

That scarce information makes it difficult to form a "proper" bindings
document out of it. Any can fit or be false.

At least there is something common with all other SGX implementations I
am aware of: there is a "core" clock.

So I'd suggest to get things moving forwards:
* we add a "core" clock-names to the bindings
* this can't be wrong for the A31 since it is defined in the data sheet
* we make it optional since the omap chips have a clock wrapper
* "core" is a name I think all architectures/drivers can live with
  and can add later "shader", "bus" etc. if needed
* any additions for the A31 will be additions

If that sounds ok and nobody objects to it, I can submit a new patch
version for further review.

BR and thanks,
Nikolaus

