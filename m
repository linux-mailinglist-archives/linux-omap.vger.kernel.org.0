Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1A1FC2962
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2019 00:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731806AbfI3WUX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 18:20:23 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44126 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbfI3WUW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Sep 2019 18:20:22 -0400
Received: by mail-ot1-f68.google.com with SMTP id 21so9769659otj.11;
        Mon, 30 Sep 2019 15:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=F7EuIouiHhXnI+Mf2IJX0I4I3pBr8z7vl6hhtN/rydc=;
        b=nanYkIa88zdOcBjfYJinBCYrY35jvSz2AVXYvp9G2XcgAkEu3fzBFxpJo5neLokxRN
         dlxdoWvCNz+rI7kgcLGCJxL+Fo2bYc5T0hoW3X1E57CnXdYCqEsi5jYAM6dwbX8In+8/
         cq/MCKlh3jD1AkgLTlJ715FWF05TC8Iuz9m8DaYEppH9PYvGmiUHBVbtgWUWLhWUgmXc
         uBDCWMXF8zI4EvCXoSs/t+12/nuf4gNN/j1rnS1A/Uhmfp30RhMvbjk5Dc6wDc88grLX
         vWd2FdVbhvq6Vz6HDBfx1BgNtfWR5ICBL95TGVGFN7uI6KjgKsK8v86OYum+OMtjYYKv
         2D5w==
X-Gm-Message-State: APjAAAVDi1wWxKcOwfwZjad7SZJEo91xV3NDxemY5+5lyAoBRKKFSUhi
        rrkMabGU6j7lThacGUQPYw==
X-Google-Smtp-Source: APXvYqwlTz51SdwLtiYS/F6mSjvwoCRn1JCMaKGRrqHAekh5UT3CgLba9X+2enyJqSphfurQyQWK4A==
X-Received: by 2002:a9d:7844:: with SMTP id c4mr577304otm.273.1569882021729;
        Mon, 30 Sep 2019 15:20:21 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v10sm4017054otk.17.2019.09.30.15.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 15:20:21 -0700 (PDT)
Date:   Mon, 30 Sep 2019 17:20:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 2/7] hwrng: omap3-rom - Fix missing clock by probing with
 device tree
Message-ID: <20190930222020.GA13078@bogus>
References: <20190914210300.15836-1-tony@atomide.com>
 <20190914210300.15836-3-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190914210300.15836-3-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 14 Sep 2019 14:02:55 -0700, Tony Lindgren wrote:
> Commit 0ed266d7ae5e ("clk: ti: omap3: cleanup unnecessary clock aliases")
> removed old omap3 clock framework aliases but caused omap3-rom-rng to
> stop working with clock not found error.
> 
> Based on discussions on the mailing list it was requested by Tero Kristo
> that it would be best to fix this issue by probing omap3-rom-rng using
> device tree to provide a proper clk property. The other option would be
> to add back the missing clock alias, but that does not help moving things
> forward with removing old legacy platform_data.
> 
> Let's also add a proper device tree binding and keep it together with
> the fix.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Pali Rohár <pali.rohar@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Tero Kristo <t-kristo@ti.com>
> Fixes: 0ed266d7ae5e ("clk: ti: omap3: cleanup unnecessary clock aliases")
> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../devicetree/bindings/rng/omap3_rom_rng.txt | 27 +++++++++++++++++++
>  arch/arm/boot/dts/omap3-n900.dts              |  6 +++++
>  arch/arm/mach-omap2/pdata-quirks.c            | 12 +--------
>  drivers/char/hw_random/omap3-rom-rng.c        | 17 ++++++++++--
>  4 files changed, 49 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rng/omap3_rom_rng.txt
> 

Acked-by: Rob Herring <robh@kernel.org>
