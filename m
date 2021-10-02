Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD43141FC51
	for <lists+linux-omap@lfdr.de>; Sat,  2 Oct 2021 15:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233248AbhJBNbG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Oct 2021 09:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbhJBNbF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Oct 2021 09:31:05 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74184C0613EC;
        Sat,  2 Oct 2021 06:29:19 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id dj4so46212653edb.5;
        Sat, 02 Oct 2021 06:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qo3Emk/l8HcCIf+3gstpLuI9ENkhEiIS4ul424Y9Sro=;
        b=aOZwHotJ3gUPWwDNRFcZRYnC6a7noj054IlZhpAzpGNhoxcOlo5TX8RdV5hENx05oj
         EKcg+cvSAcMO2iGcygEUBc6HHJDFbPVMMI/TF15rpVR23QWwoTFk/X8oycnb5NIxMB34
         N5yKIFa0fmRiJKg5fluaBsCK5vQTjwjGLYoEOCOCEsGRqDuqRupcKrQOcfuy7AR83yDK
         WvaRZRxybEcfzxadlwSxat7mWOMPeIVz3bByBEY21ZN+8HrFiJcRpI/yvW4+4uxi1I6e
         u0MWIsYScnt8QzkEz2BLRVx03t+qu5XEeCpmWczO6XhvOQbAMrZB2+fEkPRvzFTYDCwJ
         fp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qo3Emk/l8HcCIf+3gstpLuI9ENkhEiIS4ul424Y9Sro=;
        b=P4BjtikxLX6+8y2Usz8HgKjzCeOQA/zWVGXyayJY0OaZgikwJd2shkAIVtsXQ6qO1Y
         C/PNY0tnY1mb9q4aWY6uyvRaiW1WWTydeIlgWe/PseDhcb48d713QofjPv17QSHk+SZY
         bXwe8739nAI0M98hI9HF6Q3VuZYc/FBPI7BZ1RVrrOc8w87dMv37kcHiRg6+d3Bz6jyU
         mCs6xbQNS7syteHevYYIOU2aH7hbXhN1i1f4d+fZuAXvWfNxnJjKvay8xKRd4F8Ww+PC
         4b0ghSL/VWeTk1wPU8/heO9CSia6i7YcwMS3J2DYA5jOHFPiglYKd+tjYAbFcstDqbzj
         /pww==
X-Gm-Message-State: AOAM533379pQK4pFGb5j5jLeYgszq2ZhWEAHl4DDpPlMge5CZ/CM3sAk
        D8D+XfCn0uIXMqFvetjnq84QHYcez5fr6JD6RzU=
X-Google-Smtp-Source: ABdhPJxTmHrkD5TOWf2Hau50nDISHpJ4h1F8E+CIDPxAHzzjSpfOif6k/wo7Xx2BSYXSD1XoY71m0y3DIXIbtf4M/GM=
X-Received: by 2002:a17:906:948:: with SMTP id j8mr4003927ejd.371.1633181357828;
 Sat, 02 Oct 2021 06:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210930065733.31943-1-tony@atomide.com> <20210930065733.31943-2-tony@atomide.com>
In-Reply-To: <20210930065733.31943-2-tony@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 2 Oct 2021 08:29:06 -0500
Message-ID: <CAHCN7xJ_28ALRds4rduQP3LZoEK9y6mdia_czKU0DWse7FnjoA@mail.gmail.com>
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

Tony,

I noticed that you added omap3 compatibility to the driver and the
bindings, but no device tree changes for omap3.dtsi to enable this.
Is there anything holding back?

I modified omap3.dtsi and changed the compatible flag to
ti,omap3-sdhci and it boots from SD card just fine.  For some reason,
I cannot get the wl1283 to function, but the driver probes, so I need
to spend some time investigating this.

If i can get my wl1283 working again, I'll reply with a tested note.
I hope to have more time tomorrow, but i can't do it any more today.

adam

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
