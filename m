Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7732664E4
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 18:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgIKQrB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Sep 2020 12:47:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:49216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726238AbgIKPIE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Sep 2020 11:08:04 -0400
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 03EF621D91;
        Fri, 11 Sep 2020 14:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599836158;
        bh=MODNvn1q0EWM0KxEcj0BPI6+7nolshGU1ZIKTj0VqvE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=noHcnU8pT+x43562syvyo9v3+hAjq5bRUDdXgGhZcPUqsp2zfHRv2H1pbsxmQJLzH
         j/btsXycqw/nsWxrjXoG9AZfDJM8aW7iECPhUH2rNyXRr3qVyrnh73eszQPr0M/GFg
         Oqn+6CV5bHSU6uWbeNU/HN9f5QUj7e6dI0gDPbxU=
Received: by mail-ed1-f50.google.com with SMTP id t16so10260300edw.7;
        Fri, 11 Sep 2020 07:55:57 -0700 (PDT)
X-Gm-Message-State: AOAM531n3jow6vU4MBHBF5y22b5DbbW4WHev564v+U5fB64BdfVjBQ2p
        X0lhGeqyR0nTh/E3FnH4y0LZBbLiU5eUqsSnKus=
X-Google-Smtp-Source: ABdhPJzEcC9hgRkKbBcGIRRoD07sQpa41ky+62XU2D3IHLOoJAJeufq40eky57Ay1XbJuQznyBIJt98hujV1xn6CD0A=
X-Received: by 2002:a05:6402:1a48:: with SMTP id bf8mr2398191edb.298.1599836156596;
 Fri, 11 Sep 2020 07:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200911143251.399-1-krzk@kernel.org> <bf9aa130-d5e7-d180-5a52-0cb244ffbf4f@ti.com>
In-Reply-To: <bf9aa130-d5e7-d180-5a52-0cb244ffbf4f@ti.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 11 Sep 2020 16:55:44 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeGckdQbHPCw8-sYQgiwSf7aHKnGL0RJjM0K_U6KdROWg@mail.gmail.com>
Message-ID: <CAJKOXPeGckdQbHPCw8-sYQgiwSf7aHKnGL0RJjM0K_U6KdROWg@mail.gmail.com>
Subject: Re: [PATCH] memory: omap-gpmc: Fix compile test on SPARC
To:     Roger Quadros <rogerq@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 11 Sep 2020 at 16:48, Roger Quadros <rogerq@ti.com> wrote:
>
> Hi Krzysztof,
>
> On 11/09/2020 17:32, Krzysztof Kozlowski wrote:
> > SPARC comes without CONFIG_OF_ADDRESS thus compile testing fails on
> > linking:
> >
> >    /usr/bin/sparc64-linux-gnu-ld: drivers/memory/omap-gpmc.o: in function `gpmc_probe_generic_child':
> >    omap-gpmc.c:(.text.unlikely+0x14ec): undefined reference to `of_platform_device_create'
> >
> > Fixes: ea0c0ad6b6eb ("memory: Enable compile testing for most of the drivers")
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >   drivers/memory/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> > index 8072204bc21a..00e013b14703 100644
> > --- a/drivers/memory/Kconfig
> > +++ b/drivers/memory/Kconfig
> > @@ -104,6 +104,7 @@ config TI_EMIF
> >
> >   config OMAP_GPMC
> >       bool "Texas Instruments OMAP SoC GPMC driver" if COMPILE_TEST
> > +     depends on OF_ADDRESS
>
> but of_platform_device_create() is defined in platform.c which gets built
> irrespective of OF_ADDRESS.
>
> Maybe we need to just depend on CONFIG_OF ?

No, the of_platform_device_create() is defined there within #ifdef
CONFIG_OF_ADDRESS

The CONFIG_OF was already selected and was not enough.

Other solution is "depends on !SPARC"...

Best regards,
Krzysztof
