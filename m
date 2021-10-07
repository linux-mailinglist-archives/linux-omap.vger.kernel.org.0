Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F8A425A1B
	for <lists+linux-omap@lfdr.de>; Thu,  7 Oct 2021 19:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241738AbhJGR7N (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Oct 2021 13:59:13 -0400
Received: from mail-ua1-f45.google.com ([209.85.222.45]:40948 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233770AbhJGR7M (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Oct 2021 13:59:12 -0400
Received: by mail-ua1-f45.google.com with SMTP id i8so4856944uae.7;
        Thu, 07 Oct 2021 10:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QPyInY3cB0htDoUVoM1+mgQ2cSWEZttP9CPnivklMng=;
        b=lK85hfeFbK+NnGIbDcQHYE9YaRa4AN0q2Dja7X9HMfNPPInACSNdU8H8JURgQ/wqRM
         vMirmdhyuOn2uI2mv8KHifxljbef/qP7ehnjFVFc2owrHcwt0cSgaCJGEGlMAA0oWT2o
         p6G9xmxkn5sFvUUZGRqgEGyyldwOXOShDyJ3W73Zjlt/oV6TnX9xGR2sLAuB9HBylkFk
         xxV5wNT9Ptp36esQFuqhv+N9EeT5YP4XFwvU+zaTZMPVqsHR03YTDi+9Dmji3DZv9Hg5
         CIEDC5y0+C6o0ki9TSlt8oE6JObAG5hLzPiRferGujiN3Yoq44ewt+kcNrulL2SG9MTu
         jyfg==
X-Gm-Message-State: AOAM531b0Zn4k9cNmPz/DCJBFeTS8Td2dHEy4FKbwGOYULra2eo9nYf2
        HUBkfNHQjuUMsWuBOw1dt8Ki/0rJjzPzwJhrlXSIoyn2
X-Google-Smtp-Source: ABdhPJwq2xOSPh+HtkMk5M2vCe4xlirjkzLMpegAyixYIHZNR6XGS2zP2Dc+BfTvKPbgltm4aCiLd9TpzOpW3SfCX7Q=
X-Received: by 2002:ab0:538a:: with SMTP id k10mr6398535uaa.14.1633629438141;
 Thu, 07 Oct 2021 10:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211007124858.44011-1-tony@atomide.com> <20211007124858.44011-2-tony@atomide.com>
 <CAMuHMdX3XBA25sUMF2SpfbH7XX5-UpPFj-0nHuwDOv49YWQn+A@mail.gmail.com> <YV8tZP05lAukFc4E@atomide.com>
In-Reply-To: <YV8tZP05lAukFc4E@atomide.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Oct 2021 19:57:06 +0200
Message-ID: <CAMuHMdUzL7PWrUaO3CeCz7XXm=cmSg4BEZo582cxeTL_YuuETQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: bus: simple-pm-bus: Make clocks and
 power-domains optional
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Suman Anna <s-anna@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Thu, Oct 7, 2021 at 7:24 PM Tony Lindgren <tony@atomide.com> wrote:
> * Geert Uytterhoeven <geert@linux-m68k.org> [211007 13:27]:
> > On Thu, Oct 7, 2021 at 2:49 PM Tony Lindgren <tony@atomide.com> wrote:
> > > Even without clocks and power domains configured, simple-pm-bus is still
> > > different from simple-bus as simple-pm-bus enables runtime PM for the bus
> > > driver.
> >
> > Which you need to have working Runtime PM for child devices, right? ;-)
>
> Right. And based on what I remember we simply cannot do pm_runtime_enable()
> for simple-bus without breaking tons of devices.

Why not? Do you have an example of what would break?
The only reason I created simple-pm-bus was because the DT people
objected to adding PM to simple-bus, as they considered it wrong
conceptually.  AFAIK this wouldn't have caused any actual breakage.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
