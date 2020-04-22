Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889C31B4D65
	for <lists+linux-omap@lfdr.de>; Wed, 22 Apr 2020 21:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgDVTdh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Apr 2020 15:33:37 -0400
Received: from muru.com ([72.249.23.125]:51032 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725935AbgDVTdh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 22 Apr 2020 15:33:37 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6910580EE;
        Wed, 22 Apr 2020 19:34:20 +0000 (UTC)
Date:   Wed, 22 Apr 2020 12:33:28 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Philipp Rossak <embed3d@gmail.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Maxime Ripard <maxime@cerno.tech>,
        Jonathan Bakker <xc-racer2@live.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
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
Subject: Re: [PATCH v6 00/12] ARM/MIPS: DTS: add child nodes describing the
 PVRSGX GPU present in some OMAP SoC and JZ4780 (and many more)
Message-ID: <20200422193328.GD37466@atomide.com>
References: <20200421112129.zjmkmzo3aftksgka@gilmour.lan>
 <20200421141543.GU37466@atomide.com>
 <D9D4D057-A73D-485F-898D-5C05E89C16B7@goldelico.com>
 <20200422065859.quy6ane5v7vsy5tf@gilmour.lan>
 <1AA57A0C-48E6-49BB-BB9A-2AAFFB371BCD@goldelico.com>
 <20200422151328.2oyqz7gqkbunmd6o@gilmour.lan>
 <07923B6C-4CCD-4B81-A98F-E19C43412A89@goldelico.com>
 <MC879Q.XY9S0U9R35681@crapouillou.net>
 <D90A610B-1F26-4AD4-843A-60EB4E410377@goldelico.com>
 <a1fd55a3-23dd-aa0c-35dd-6956ff4baa1c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1fd55a3-23dd-aa0c-35dd-6956ff4baa1c@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Philipp Rossak <embed3d@gmail.com> [200422 19:05]:
> A few years back, I did a big research on the PowerVR GPUs. Back then I
> found an interesting TI datasheet. I forgot about this till I have seen the
> right buzz words. Sorry that I remembered it that late.
> 
> Back then I came to the conclusion that all PowerVR GPU's have in general 3
> Clocks.
> 
> A system clock, a memory clock and a core clock. [1].

Hmm I'm not sure if those names are sgx or SoC specific.

Anyways, the sgx clocks for omap variants are already handled
by the ti-sysc module as "fck" and "ick" so nothing to do there.

> The hyd_clk at sunxi devices seems to be the system clock.
> 
> With those additional information it should be very easy to get a proper
> binding.

It would be best to find the clock(s) name used in the sgx docs
to avoid using SoC specific naming :)

But yeah "sysclk" "memclk" and "coreclk" seem just fine for
me for the optional clocks if that works for other SoCs.

Regards,

Tony

> [1]: https://github.com/embed-3d/PVRSGX_hwdoc/blob/master/sources/pdfs/Spruh73c_chapter_SGX_Graphics_Accelerator.pdf
