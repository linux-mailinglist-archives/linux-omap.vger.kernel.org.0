Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC59CC004
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2019 18:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390241AbfJDQEb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Oct 2019 12:04:31 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:42710 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390091AbfJDQEb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Oct 2019 12:04:31 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
        id 1iGPhH-0001FJ-3M; Sat, 05 Oct 2019 01:40:48 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Sat, 05 Oct 2019 01:40:41 +1000
Date:   Sat, 5 Oct 2019 01:40:41 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Matt Mackall <mpm@selenic.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-crypto@vger.kernel.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org
Subject: Re: [PATCHv2 0/7] Non-urgent fixes and improvments for omap3-rom-rng
Message-ID: <20191004154041.GL5148@gondor.apana.org.au>
References: <20190914210300.15836-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190914210300.15836-1-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Sep 14, 2019 at 02:02:53PM -0700, Tony Lindgren wrote:
> Hi all,
> 
> Here are fixes and improvments for omap3-rom-rng that's been broken for
> a while.
> 
> The first four patches get it working, and then the last two patches add
> support for runtime PM.
> 
> I did not add Sebastian's acks from v1 set as many of the patches
> changed. Please review again :)
> 
> Regards,
> 
> Tony
> 
> Changes since v1:
> - Use clk_prepare_enable() as pointed out by Sebastian
> - Simplify runtime PM changes patch
> - Add a new patch for devm changes as suggested by Sebastian
> 
> 
> Tony Lindgren (7):
>   ARM: OMAP2+: Check omap3-rom-rng for GP device instead of HS device
>   hwrng: omap3-rom - Fix missing clock by probing with device tree
>   hwrng: omap3-rom - Call clk_disable_unprepare() on exit only if not
>     idled
>   hwrng: omap3-rom - Initialize default quality to get data
>   hwrng: omap3-rom - Update to use standard driver data
>   hwrng: omap3-rom - Use runtime PM instead of custom functions
>   hwrng: omap3-rom - Use devm hwrng and runtime PM
> 
>  .../devicetree/bindings/rng/omap3_rom_rng.txt |  27 +++
>  arch/arm/boot/dts/omap3-n900.dts              |   6 +
>  arch/arm/mach-omap2/pdata-quirks.c            |  14 +-
>  drivers/char/hw_random/omap3-rom-rng.c        | 168 +++++++++++-------
>  4 files changed, 139 insertions(+), 76 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rng/omap3_rom_rng.txt

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
