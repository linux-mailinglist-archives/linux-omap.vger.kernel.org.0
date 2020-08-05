Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9FD423D122
	for <lists+linux-omap@lfdr.de>; Wed,  5 Aug 2020 21:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgHET5A (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Aug 2020 15:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbgHEQoM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Aug 2020 12:44:12 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB433C08ED2B;
        Wed,  5 Aug 2020 06:17:29 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id j9so33893460ilc.11;
        Wed, 05 Aug 2020 06:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U9j+MufxMDRYF1VNGK/h8ZpxbV45735lCqjDi7az7Y4=;
        b=HYhDSNmOIeR8Tsx8WIrVaqjB1BsfWU/aDZd+mWUzIkl92tNvGHxuV98CEr4ICg5bZj
         0hMqGfgpfY0LmImX9w5DtGi+O5L/JgjPyvAAnDDwcIFA+JiEH4lTU/iYTZ4kzSfyjVN/
         APHqSnfypG1GSBKovRFe8+eUbJLog8nP7ypyeUlkdqpyuq3+fPS5sXRKdpZpTAHtttDW
         VsLqacvZOAeeZOqzobmFGX5eZWyQyVHa5ExdjZ8ZigsYZzuaQEYs7/LdG+R+u8I7iMWP
         JNNhNcHMSQRRLVOBUQiRIQY1q/eDk8A0E4ZlwRBXgQx4xECv3OiwvnkQxuUSm40BJZWG
         YuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U9j+MufxMDRYF1VNGK/h8ZpxbV45735lCqjDi7az7Y4=;
        b=h92tL9f5cpMt6h3GVoMA0UoUB3ySXn5whPYW9eiwm+bxH5U1fvlOhSCERFcYeI/WKT
         +9dd2EnuYS1oi7gbcm7snOKAueLtZO3RLFYqXTLbG9V9ZJ96PKKvWcCYYDEu56ULHSxr
         INyhRe6/ylaxuUWstTuX6GvIBGnVMy903fDTqnAaOvTsXgqL5Fz1w4e+aX15PHNMOtyR
         pmDuDnqmdRVhGf8oeB+r3X5o8v8QvUFTtN0s46+5TLeRV/xGmoLnMWbVwnRMrjodE4WS
         To3MHjpSCSOuUNaJw2b4qckGviptnnH/I98dGCy5bRY80/2I4K22G+oCfim2Wm4d8xnZ
         +OZA==
X-Gm-Message-State: AOAM532OFR6m1OGh0SOcJMtrkciGM25VFBt8DO/F/s7Dg9GKMAgA8oLx
        5rm6uYDnY1CGTCkrELPIgVMlaRLeE2BFLa93f8gnvg==
X-Google-Smtp-Source: ABdhPJwHeDoHvq2FDyJUbZK5qgI7U+gsBRFp8nkzGnu2r/YdKckPQIeQukn5HdbnZh+8a/s0rnH4tJdWMvWvFKiyjHE=
X-Received: by 2002:a92:60d:: with SMTP id x13mr3933276ilg.214.1596633448397;
 Wed, 05 Aug 2020 06:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191007220540.30690-1-aford173@gmail.com> <20191007220540.30690-2-aford173@gmail.com>
In-Reply-To: <20191007220540.30690-2-aford173@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 5 Aug 2020 08:17:16 -0500
Message-ID: <CAHCN7x+fnyXb+UO3xPd0nKeZNAPhRsXd5kTCAHxvg6hSt8Bx-A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: omap3: Add cpu trips and cooling map for
 omap34/36 families
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     Adam Ford <adam.ford@logicpd.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Oct 7, 2019 at 5:06 PM Adam Ford <aford173@gmail.com> wrote:
>
> The OMAP3530, OMAP3630, and DM3730 all show thresholds of 90C and 105C
> depending on commercial or industrial temperature ratings.
>
> This patch expands the thermal information to include the limits of 90
> and 105C for alert and critical.  It sets the coolings-cells for the
> 34xx and 36xx CPU's which both point to omap3-cpu-thermal.dtsi.
>
> For boards who never use industrial temperatures, these can be
> changed on their respective device trees with something like:
>
> &cpu_alert0 {
>         temperature = <85000>; /* millicelsius */
> };
>
> &cpu_crit {
>         temperature = <90000>; /* millicelsius */
> };
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # on GTA04A5 with dm3730cbp100
>

Tony,

I know this is an old thread.  I am trying to revisit some of the
other issues that came about with this, but is there any way we can
get patch 2/2 applied?  It might not do anything unless the bandgap
sensor is enabled, but it at least gets us one step closer for those
who choose to enable it.  With 1GHz support now available, it would be
nice to have the precautions to protect the processor from running too
fast when its too hot.

thanks

adam

> diff --git a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
> index 235ecfd61e2d..dfbd0cb0b00b 100644
> --- a/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
> +++ b/arch/arm/boot/dts/omap3-cpu-thermal.dtsi
> @@ -17,4 +17,25 @@ cpu_thermal: cpu_thermal {
>
>                         /* sensor       ID */
>         thermal-sensors = <&bandgap     0>;
> +
> +       cpu_trips: trips {
> +               cpu_alert0: cpu_alert {
> +                       temperature = <90000>; /* millicelsius */
> +                       hysteresis = <2000>; /* millicelsius */
> +                       type = "passive";
> +               };
> +               cpu_crit: cpu_crit {
> +                       temperature = <105000>; /* millicelsius */
> +                       hysteresis = <2000>; /* millicelsius */
> +                       type = "critical";
> +               };
> +       };
> +
> +       cpu_cooling_maps: cooling-maps {
> +               map0 {
> +                       trip = <&cpu_alert0>;
> +                       cooling-device =
> +                               <&cpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +               };
> +       };
>  };
> diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx.dtsi
> index 7b09cbee8bb8..99a7161bebb2 100644
> --- a/arch/arm/boot/dts/omap34xx.dtsi
> +++ b/arch/arm/boot/dts/omap34xx.dtsi
> @@ -26,6 +26,7 @@
>                                 600000  1350000
>                         >;
>                         clock-latency = <300000>; /* From legacy driver */
> +                       #cooling-cells = <2>;
>                 };
>         };
>
> diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
> index 1e552f08f120..8096b6ef0ae1 100644
> --- a/arch/arm/boot/dts/omap36xx.dtsi
> +++ b/arch/arm/boot/dts/omap36xx.dtsi
> @@ -28,6 +28,7 @@
>                                 800000  1325000
>                         >;
>                         clock-latency = <300000>; /* From legacy driver */
> +                       #cooling-cells = <2>;
>                 };
>         };
>
> --
> 2.17.1
>
