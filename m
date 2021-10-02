Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 140AB41FD06
	for <lists+linux-omap@lfdr.de>; Sat,  2 Oct 2021 18:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233583AbhJBQRN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Oct 2021 12:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbhJBQRM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Oct 2021 12:17:12 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF86FC0613EC;
        Sat,  2 Oct 2021 09:15:26 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id bd28so46382471edb.9;
        Sat, 02 Oct 2021 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GU4RaNbxOwXU1AIglgn1YkqGJA8DPAlBXbwJZqnnnz4=;
        b=ohxzd4KXkpBTobxCCJI+EWnhcki2mwF5TARWnr0FNSIxRBV4ADr/1IX9F5sRh0E+qe
         tu7hz0dFBpYErVRlUNTUTgo8ciikJdQGZKoHCplDOcK8sNnSB+lvYXBqqihx0F/NquWJ
         GuLFckHqzfZL+IHhJ0iBsDnpq39i7/e/jECDNLUlCfUv3gO+mzbfPZvvQQ8qyt/CBz3d
         Gp07zNddoyklfm+chXC6vRx5lHi4r2rENYX6TkZDXRSBEOu8CE/qFSuQa3Hve6uiY/D2
         JUHCKBfhVNtfKRyU4CjeP/UeI6F4N/FS4+sAAeGO8rEPQlmzg5LfkqndupxPZzDaCOOF
         Ti5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GU4RaNbxOwXU1AIglgn1YkqGJA8DPAlBXbwJZqnnnz4=;
        b=ipW66doPpbyJcDMdsHxv/vjzShgyEYKZqYQ4E7uSxaw0P7UlqduSyIA1/wMDPrILHY
         txZZYedxbWR8t7p7GoZIz8Soo00/j/xEGlfCAgoUA1LJG8tbJkqt++YMlf4ivp0HsjeK
         uSlDmCaF/mOpwX/ICpL40G84p77liChVboZ7PfgxV0K25zyPdeeJ9qBSCixpqlm+fHEi
         22CrRD2jxVvD/g9Y4TwP4RgGL52B5JLiHPrAO9oufk/A1NeasEw87obsKyQlPAtd+YSd
         +4STmnfVBnPpd4gjcwY3QTkM71+PQzzGlROw40WeRt+3MuPTkD6FA9arOkWESCITJ4t/
         xjYA==
X-Gm-Message-State: AOAM532yBy2gAnrpZhwXtnPtDCbm5aPqYC+USWXjk4/vWyu2F/NoBB7Q
        IvqIwHtYG0PFl3afrA6UsGbZPHur1nKVC0E9B+E=
X-Google-Smtp-Source: ABdhPJx8iGPvBXqIOC79LIMaSFWfmnsPsAvezXdC1Fm0UJHmRbMR3uvQb5Otz+6ieWqCJWaTHSKX4lYjiN3ceab33Lg=
X-Received: by 2002:aa7:d903:: with SMTP id a3mr3840670edr.292.1633191324726;
 Sat, 02 Oct 2021 09:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210930065733.31943-1-tony@atomide.com> <20210930065733.31943-2-tony@atomide.com>
In-Reply-To: <20210930065733.31943-2-tony@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 2 Oct 2021 11:15:13 -0500
Message-ID: <CAHCN7xKTkPEo1mmaG+cRYacpo4-8ONz-S6Nzdg9XeAEd5rt5TA@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: sdhci-omap: Update binding for legacy SoCs
To:     Tony Lindgren <tony@atomide.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 30, 2021 at 1:58 AM Tony Lindgren <tony@atomide.com> wrote:
>
> Let's add compatible values for the legacy SoCs so we can continue
> deprecating omap_hsmmc in favor of sdhci-omap driver.
>
> For omap5, we want to have a separate compatible from omap4 for the
> additional features available on omap5. AFAIK ti81 can just use the
> omap4 compatible.
>
> Cc: devicetree@vger.kernel.org
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

For the series, with an additional change to omap3.dtsi to reference
mmc nodes to ti,omap3-sdhci,

Tested-by: Adam Ford <aford173@gmail.com> # logicpd-torpedo-37xx-devkit

> ---
>  Documentation/devicetree/bindings/mmc/sdhci-omap.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
> --- a/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-omap.txt
> @@ -5,7 +5,11 @@ Refer to mmc.txt for standard MMC bindings.
>  For UHS devices which require tuning, the device tree should have a "cpu_thermal" node which maps to the appropriate thermal zone. This is used to get the temperature of the zone during tuning.
>
>  Required properties:
> -- compatible: Should be "ti,dra7-sdhci" for DRA7 and DRA72 controllers
> +- compatible: Should be "ti,omap2430-sdhci" for omap2430 controllers
> +             Should be "ti,omap3-sdhci" for omap3 controllers
> +             Should be "ti,omap4-sdhci" for omap4 and ti81 controllers
> +             Should be "ti,omap5-sdhci" for omap5 controllers
> +             Should be "ti,dra7-sdhci" for DRA7 and DRA72 controllers
>               Should be "ti,k2g-sdhci" for K2G
>               Should be "ti,am335-sdhci" for am335x controllers
>               Should be "ti,am437-sdhci" for am437x controllers
> --
> 2.33.0
