Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60C62F5033
	for <lists+linux-omap@lfdr.de>; Wed, 13 Jan 2021 17:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbhAMQmn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Jan 2021 11:42:43 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:47065 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbhAMQmm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Jan 2021 11:42:42 -0500
Received: by mail-oi1-f179.google.com with SMTP id q205so2708194oig.13;
        Wed, 13 Jan 2021 08:42:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vap5TT0/vuELy61/38Zp/Lb5iLNCn4QaTE4h5oVUqUw=;
        b=naLYb2PanxeBpOuLA+XNEdW0txWYYJHSgfkUGp8Y4h0QnypxMrom2MzfooRMJufHEN
         OfHeEWtdtGVmYhaHTKmqaNV/bkP8w0GOFesjnhvO08vwB0ZkIizr5BnBnQWBdJJlPRuO
         KSc4wAOTFy5Q++pAFKgn0AhNCapRKIIZ6a1GuLrSkFl3UyOe2d0KA3Nd6gfqe7nABBzC
         nraF07xQQ/R84SsIi73jYnqenuV3hXFO4lr9afpiVn3/JXdk3OHIjiFgMbVsGAfQIOJo
         AE1Tf6RkMQ5PKAabx+0iCVSutcvQOJGm7agenlPhslNkMcKOu3zDu9gQ9d0J5lN1qxs9
         SHqw==
X-Gm-Message-State: AOAM531drknVexEowAkkD2cESzakC/7k+gcy0OG491e18w8NHKHRa+kq
        UqPc5VH5oWMQ7SPsIT0l36XwLfa0gATPHYOZlpA=
X-Google-Smtp-Source: ABdhPJyo+7Tj5DUcdZfn7HXw2KIVa3ENf7AlIPhH9Cdz/CypqLr4DGXMT/MTYH3CaBKDVzT4+GJ+/qgAEQx09itwiBU=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr97930oia.54.1610556121749;
 Wed, 13 Jan 2021 08:42:01 -0800 (PST)
MIME-Version: 1.0
References: <20201026112222.56894-1-tony@atomide.com> <20201026112222.56894-14-tony@atomide.com>
 <CAMuHMdWribr=eg1LkKce=Hamm+JwSz5UFEXLKUmKkqqz1RpL_w@mail.gmail.com> <X/8ei0o9ULpRdx7T@atomide.com>
In-Reply-To: <X/8ei0o9ULpRdx7T@atomide.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Jan 2021 17:41:50 +0100
Message-ID: <CAMuHMdW+y5Y+0U1beebq7EGiarBKYdHszL+vW5r4xG6HBspVgQ@mail.gmail.com>
Subject: Re: [PATCH 13/18] ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup
To:     Tony Lindgren <tony@atomide.com>
Cc:     "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Wed, Jan 13, 2021 at 5:23 PM Tony Lindgren <tony@atomide.com> wrote:
> * Geert Uytterhoeven <geert@linux-m68k.org> [210113 16:09]:
> > On Mon, Oct 26, 2020 at 1:57 PM Tony Lindgren <tony@atomide.com> wrote:
> > > We can now enable simple-pm-bus to use genpd.
> > >
> > > Signed-off-by: Tony Lindgren <tony@atomide.com>
> >
> > Thanks for your patch, which is now commit 5a230524f87926f2 ("ARM:
> > dts: Use simple-pm-bus for genpd for am3 l4_wkup") in v5.11-rc1.
> >
> > I have bisected a boot failure on BeagleBone Black to this commit.
> > Reverting this commit on top of a v5.11-rc3-based tree does not help.
> >
> > With "earlycon keep_bootcon", I do get some output, the last line is
> >
> >     l4-wkup-clkctrl:00d4:0: failed to disable
> >
> > I have attached the kernel output of the previous (good) commit,
> > and the failing one.
> >
> > Do you have a clue?
>
> Strange, bbb has been working for me with NFSroot, that's with
> omap2plus_defconfig. Care to send your .config so I can give it a
> try tomorrow?

Sent by private email.

Just tried omap2plus_defconfig, and it also hangs during boot.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
