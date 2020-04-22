Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 476D51B4EE0
	for <lists+linux-omap@lfdr.de>; Wed, 22 Apr 2020 23:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgDVVM0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Apr 2020 17:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgDVVMZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Apr 2020 17:12:25 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E6B7C03C1A9;
        Wed, 22 Apr 2020 14:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587589941;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=bQAgadQgOVbS4DuKshH2v+YQnNnb7kL7V3XzA7l6NS4=;
        b=f8/p86/psnan71ptAKB8sm6uDtakdvSg5Msf2w8C3R5RBmfvw7iGAlAjdhUyC79Qyh
        Qx93IvYlkAzddb24UjuiINUrQGECHHOYzM2fsFVq+ws5VDBVarEJOvigz/WdBF8NkNCK
        63VKyvpQ9FNIRCJR8dNsOL9kCbtrH/69nAPzGDXwdk4ZdZjAQbLAZPRScCrCOmiEkbAy
        9Y2gSeS5sWpkQiY6DtNNWkb8OyTfH1AyDp5chFZh2p9sBaApes/L9G7ixJwoq1asU6AK
        BJGKcwgPoSpIIHvJPaZFtMkUhX9KOIHAtG80Cw5nUhYBMus8feGDwvKf7xj4oYLMaOu5
        LixQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMiw43tskc="
X-RZG-CLASS-ID: mo00
Received: from mbp-13-nikolaus.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw3MLCI3zq
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 22 Apr 2020 23:12:18 +0200 (CEST)
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200422193328.GD37466@atomide.com>
Date:   Wed, 22 Apr 2020 23:12:26 +0200
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Maxime Ripard <maxime@cerno.tech>,
        Jonathan Bakker <xc-racer2@live.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
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
Message-Id: <266D5048-8339-433F-B66D-CAAB1C2CB1A2@goldelico.com>
References: <20200421112129.zjmkmzo3aftksgka@gilmour.lan> <20200421141543.GU37466@atomide.com> <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com> <20200422065859.quy6ane5v7vsy5tf@gilmour.lan> <1AA57A0C-48E6-49BB-BB9A-2AAFFB371BCD@goldelico.com> <20200422151328.2oyqz7gqkbunmd6o@gilmour.lan> <07923B6C-4CCD-4B81-A98F-E19C43412A89@goldelico.com> <MC879Q.XY9S0U9R35681@crapouillou.net> <D90A610B-1F26-4AD4-843A-60EB4E410377@goldelico.com> <a1fd55a3-23dd-aa0c-35dd-6956ff4baa1c@gmail.com> <20200422193328.GD37466@atomide.com>
To:     Tony Lindgren <tony@atomide.com>,
        Philipp Rossak <embed3d@gmail.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony and Philip,

> Am 22.04.2020 um 21:33 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * Philipp Rossak <embed3d@gmail.com> [200422 19:05]:
>> A few years back, I did a big research on the PowerVR GPUs. Back then =
I
>> found an interesting TI datasheet. I forgot about this till I have =
seen the
>> right buzz words. Sorry that I remembered it that late.
>>=20
>> Back then I came to the conclusion that all PowerVR GPU's have in =
general 3
>> Clocks.
>>=20
>> A system clock, a memory clock and a core clock. [1].

Great!  This is an excerpt of the am335x TRM.
I may have seen this information in the past but also forgot about it.

Indeed, it seems to change a lot of our thinking.

>=20
> Hmm I'm not sure if those names are sgx or SoC specific.

It depends. Here is some quick research:

the am335x lists:
  THALIAIRQ, SYSCLK & MEMCLK (connected in parallel), CORECLK

The omap3530 TRM has different information. It names them
  SGX_FCLK, SGX_ICLK, SGX_RST and SGX_IRQ
  but this is likely a TI nomenclature defined by the PRCM wrapper.

DM3730 and OMAP4 and TRM tells the same.

The OMAP5 TRM is interestingly different. It has:
  GPU_ICLK, GPU_FCLK1, GPU_FCLK2, GPU_RST and GPU_IRQ.
  Really surprising is that the PRCM outputs are called
    GPU_L3_GICLK, GPU_CORE_GCLK and GPU_HYS_GCLK.

  I.e. the same "HYD" as we have seen in the A31. It seems to
  be a feature of the sgx544 to have two functional clocks and
  one being called "HYD".

Now I know why it didn't play a role so far. Because the omap5
wrapper hides this detail from the sgx implementation.

Next I checked the AM572x TRM:
 it has also a hyd_clk, a core_clk, sys_clk, some reset and a gpu_irq

The DRA7xx TRM does the same as AM57xx.

So the "hyd" clock seems to be a second functional clock
with unknown function in some SGX variants. It seems to be
something different from the "memclock" of the am335x but may
be the same.

>=20
> Anyways, the sgx clocks for omap variants are already handled
> by the ti-sysc module as "fck" and "ick" so nothing to do there.

Which brings back the question if this complexity and not well
defined clocks of the SGX core should really be part of the bindings
any why we have to care about...

What is the benefit of modeling at this level of pretend accuracy?

>=20
>> The hyd_clk at sunxi devices seems to be the system clock.
>>=20
>> With those additional information it should be very easy to get a =
proper
>> binding.
>=20
> It would be best to find the clock(s) name used in the sgx docs
> to avoid using SoC specific naming :)

If there were specific SGX docs describing the VHDL signal names :)

>=20
> But yeah "sysclk" "memclk" and "coreclk" seem just fine for
> me for the optional clocks if that works for other SoCs.

Well, if the other SoC would follow the PRCM/sysc approach
the omap uses, all these clocks would be part of the wrapper
and can be named and numbered as it best fits to the SoC
data sheet and clock control registers.

>=20
> Regards,
>=20
> Tony
>=20
>> [1]: =
https://github.com/embed-3d/PVRSGX_hwdoc/blob/master/sources/pdfs/Spruh73c=
_chapter_SGX_Graphics_Accelerator.pdf

So a compromise could be to

* define

  clock-names:
    items:
      - const: core
      - const: mem
      - const: sys
      - const: hyd

* make clocks optional (for omap or others wanting to use a wrapper =
driver)
* DTs can request the same clock providers for core and hyd or mem if =
that fits best
* the driver must enable all 4 clocks if they exists

BR and thanks,
Nikolaus

