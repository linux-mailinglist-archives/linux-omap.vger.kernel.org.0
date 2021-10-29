Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041EC43F8D5
	for <lists+linux-omap@lfdr.de>; Fri, 29 Oct 2021 10:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbhJ2IbF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Oct 2021 04:31:05 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:40627 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbhJ2IbD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Oct 2021 04:31:03 -0400
Received: by mail-ua1-f52.google.com with SMTP id e2so16726347uax.7;
        Fri, 29 Oct 2021 01:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7D7n4zKwOftMKeYPi/HfP+/e549fNZjw4uN7YVlzcCA=;
        b=REpTAMCuEcvBcZG05BYr+owNep+eUsDzFLRgCXGhxUZIvHUKqENJYFI5sq8UOdr/HK
         UCR5kYlCR6TQER9BohbSRAl1zWXpzMbBMEEp7AzR6U4jsfBOmuRzoGNOqTaUcTsp/xAC
         /FbHQb8W520hRGnvPMmsL90LW6R8NLJzd6XcRNeAjsEKAnzi0NqX3BHaO2nFNUUASDsr
         n5jhlYury4C9dAqYUW4/sgVQ5lHaiofCOfXcZoINMphRDO9/++TMcc69+CMLaFVATWQ2
         5+8/dYsAVEEymbREETqNlBjBp2L/PyWTnyTaydbMxnlO1ANvRO5gZE3rZSPowTWZBz6s
         fPRg==
X-Gm-Message-State: AOAM530DuQXlFzUjo9+IT+zkFBPKAr9tliLtesAIDFndHtFjN1zxbSge
        zSgiwOWPs6dHlYretm/IrkjZU57pWJ3p8g==
X-Google-Smtp-Source: ABdhPJwIGmVfHea/XDDWhijIQkLFnGrqabW3gf7oUEUOifyOSEE+9aM5YMvwt1mgN7Na+AP8aXdJdA==
X-Received: by 2002:a67:b149:: with SMTP id z9mr10823866vsl.16.1635496114717;
        Fri, 29 Oct 2021 01:28:34 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id w4sm794698uae.20.2021.10.29.01.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 01:28:34 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id bc10so4250270vkb.1;
        Fri, 29 Oct 2021 01:28:34 -0700 (PDT)
X-Received: by 2002:a05:6122:804:: with SMTP id 4mr9584050vkj.7.1635496113976;
 Fri, 29 Oct 2021 01:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634822085.git.geert+renesas@glider.be> <1f6bf58d76efc2e869b800534b818d1451ef98a2.1634822085.git.geert+renesas@glider.be>
 <YXtIsCnJ+L5zqCVk@robh.at.kernel.org> <YXusEUpTBUdvS7LY@shell.armlinux.org.uk>
In-Reply-To: <YXusEUpTBUdvS7LY@shell.armlinux.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Oct 2021 10:28:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+Ke54zyi2Z2ROk-2xpbcXU6+FFH71gEz0vEBXCAgVXw@mail.gmail.com>
Message-ID: <CAMuHMdX+Ke54zyi2Z2ROk-2xpbcXU6+FFH71gEz0vEBXCAgVXw@mail.gmail.com>
Subject: Re: [PATCH 3/3] [RFC] dt-bindings: display: bridge: nxp,tda998x:
 Convert to json-schema
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Russell,

Thanks for your comments!

On Fri, Oct 29, 2021 at 10:08 AM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Thu, Oct 28, 2021 at 08:04:48PM -0500, Rob Herring wrote:
> > On Thu, Oct 21, 2021 at 03:18:53PM +0200, Geert Uytterhoeven wrote:
> > > +    properties:
> > > +      port@0:
> > > +        type: object
> > > +        description: FIXME
> >
> > Looks like the input from the example
> >
> > > +
> > > +      port@1:
> > > +        type: object
> > > +        description: FIXME
> >
> > Presumably the output to connector or another bridge.
>
> This is changing the binding. The original had:
>
> Required node:
>   - port: Input port node with endpoint definition, as described
>         in Documentation/devicetree/bindings/graph.txt

Indeed, cfr. "Add ports hierarchy, as an alternative to port." in the
patch description. Some users use port, other use ports with one or
two port subnodes.

> The above change appears to require that tda998x now has two ports.

No, you can still use port:

+oneOf:
+  - required:
+      - port
+  - required:
+      - ports

When using ports, no further requirements are set, but perhaps port@0
should be made required in that case?

> This goes against current usage in DT and the example.

The original example didn't even have the original required input
port node, so it was incomplete.

arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts has two port subnodes.
Is that wrong?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
