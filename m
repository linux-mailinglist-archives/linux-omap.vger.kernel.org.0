Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6A3425409
	for <lists+linux-omap@lfdr.de>; Thu,  7 Oct 2021 15:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241075AbhJGN2u (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Oct 2021 09:28:50 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:42946 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232869AbhJGN2u (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Oct 2021 09:28:50 -0400
Received: by mail-vs1-f47.google.com with SMTP id l22so4301569vsq.9;
        Thu, 07 Oct 2021 06:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bkj8dwkFQ63OO4447PidWmaVxAbiH/cdrskhBNReVTk=;
        b=afjR2c8z8bAgL6pldq1cN9sJ3V2m7YbhfmK04OE+pwh1MOq6WRAmFmPL1wYPDcMeqF
         5Pee4JFqPUUmvA1xtGPATc2IFw0DbCXN0Xq2kPD7/Aq7xpNL9iUev6bR8nuU6MgIwdGB
         vgNtgu57VKPJmq12m56FPqLn7+ydTlALW3J8YobngODChZdXXMO8UA+e/Af3qkVFl5tV
         4XGZ4Wk2uy99Hj+O8pKi/u88otCWIgrDUr0ipPEbJhaYH+vRXlsgthzaHyK5+/w3GUIC
         VQtaBzzwO6xxcHmF5Up4PkFv/BVv7WFnpNEqba3XYvKPzH1jPADCwhiXjG68CYyg0vvH
         evXg==
X-Gm-Message-State: AOAM531kJP2o86wC1kDwZgyaGWLcnGb5CEeoNr2uID7cUaV7XXA2ExL1
        E6Z9MGfw2bSStQJGb1gD0KeoIIOuJziBySIh2sE=
X-Google-Smtp-Source: ABdhPJxwTvcJiVL7qUeCezowJd8CF3ARkR4xTMVDfjJBd459kWNVDIXrMB8m8U31lyBmUPNWPXm4kOroxf0W9nVbv04=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr3865390vsl.9.1633613215795;
 Thu, 07 Oct 2021 06:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211007124858.44011-1-tony@atomide.com> <20211007124858.44011-2-tony@atomide.com>
In-Reply-To: <20211007124858.44011-2-tony@atomide.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Oct 2021 15:26:44 +0200
Message-ID: <CAMuHMdX3XBA25sUMF2SpfbH7XX5-UpPFj-0nHuwDOv49YWQn+A@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: bus: simple-pm-bus: Make clocks and
 power-domains optional
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Suman Anna <s-anna@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

Thanks for your patch!

On Thu, Oct 7, 2021 at 2:49 PM Tony Lindgren <tony@atomide.com> wrote:
> Clocks and power domains are not required by the simple-pm-bus driver.
> There are buses with read-only registers for clocks and power domains
> that are always on.

The presence of clocks or power-domains properties is the only
distinguishing factor between simple-pm-bus and simple-bus, from a
DT point of view.  So if there has to be a distinguishment, the
properties should be required

If you don't have clocks and power-domains, you should use simple-bus.

> Even without clocks and power domains configured, simple-pm-bus is still
> different from simple-bus as simple-pm-bus enables runtime PM for the bus
> driver.

Which you need to have working Runtime PM for child devices, right? ;-)

This is not specific to DT, but to Linux.
One more reason to let Linux treat simple-pm-bus and simple-bus exactly
the same.  Linux handles the clocks and power-domains (if present)
transparently anyway, through PM Domains

> Let's update the binding accordingly as this remove the related warnings
> for dt_binding_check for omaps.
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

> --- a/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> +++ b/Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
> @@ -13,10 +13,9 @@ description: |
>    A Simple Power-Managed Bus is a transparent bus that doesn't need a real
>    driver, as it's typically initialized by the boot loader.
>
> -  However, its bus controller is part of a PM domain, or under the control
> -  of a functional clock.  Hence, the bus controller's PM domain and/or
> -  clock must be enabled for child devices connected to the bus (either
> -  on-SoC or externally) to function.
> +  However, its bus controller is typically part of a PM domain, or under
> +  the control of a functional clock.  Without PM domain or functional clock,
> +  it still enables runtime PM for the bus driver unlike "simple-bus".
>
>    While "simple-pm-bus" follows the "simple-bus" set of properties, as
>    specified in the Devicetree Specification, it is not an extension of
> @@ -43,10 +42,10 @@ properties:
>
>    clocks: true
>      # Functional clocks
> -    # Required if power-domains is absent, optional otherwise
> +    # Typically used if power-domains is absent
>
>    power-domains:
> -    # Required if clocks is absent, optional otherwise
> +    # Typically used if clocks is absent
>      minItems: 1
>
>  required:
> @@ -55,12 +54,6 @@ required:
>    - '#size-cells'
>    - ranges
>
> -anyOf:
> -  - required:
> -      - clocks
> -  - required:
> -      - power-domains
> -
>  additionalProperties: true
>
>  examples:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
