Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021332FBE4B
	for <lists+linux-omap@lfdr.de>; Tue, 19 Jan 2021 18:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbhASRuL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Jan 2021 12:50:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:40612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405012AbhASOv5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 19 Jan 2021 09:51:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D8C320DD4;
        Tue, 19 Jan 2021 14:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611067874;
        bh=qOALRYpx8VGwwp5SoEb+UBz0tWOmyG8pglZmxBoikVE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=m7Rm+D4I2y7BtzNch/jc6E/zBCBw/RA5fx5YRY4HqpOxgYIatEi91igNNZKlmUmu8
         X3Lio+WuAAhYLIflvAgUn2GQgB7K5uMpqfL/JEvLLycdMZq7bEJU8Bb47J2dyskSS0
         /ozQP1/8937fGg93pZSb1TABODB1iOa/9v7leF7VICKhA+zOpKvXU4GvH43uUdCxEb
         oj8B+03Ngi6MbMiujtVvdGnCxboKbnyREEWNGnAyN67ptzwyJQhSIJNUrQmu90Quip
         RTOYFcLhowalPAIahNqb9JFni4mh74/G6OXNcskFgdScMWsibylfZ+uhLLJGdR35Nn
         RSx6c3Iws7a0A==
Received: by mail-ej1-f50.google.com with SMTP id l9so23166076ejx.3;
        Tue, 19 Jan 2021 06:51:14 -0800 (PST)
X-Gm-Message-State: AOAM532PER8EDGTKuIS5NcqxuMxV311KKyzTTb0yOo+KVmXkG1D7trsJ
        b7PLY7JuKCKIMS45FmCO3rGVRc+IsxGg/GO7Bg==
X-Google-Smtp-Source: ABdhPJwrYsjRqRbp8W7L7RNsRzd0evjxpOTm49EMHHsM+d5m4OoM4vtdOIpMtlbNj9xIX15UkOfWeW2OVJ+CD82IXC8=
X-Received: by 2002:a17:906:d87:: with SMTP id m7mr3166012eji.108.1611067872941;
 Tue, 19 Jan 2021 06:51:12 -0800 (PST)
MIME-Version: 1.0
References: <20210118073340.62141-1-tony@atomide.com> <CAK8P3a1Eec1cAOdxNQ=8LORop+ESqx_=dg1uhJwpXhknxOydsg@mail.gmail.com>
 <YAVJyjmrbLCFjqVA@atomide.com>
In-Reply-To: <YAVJyjmrbLCFjqVA@atomide.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 19 Jan 2021 08:51:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJWPc4rt0NiaF=zS0XOy4b8pZKDCEaxCjp8rW+joMjvjQ@mail.gmail.com>
Message-ID: <CAL_JsqJWPc4rt0NiaF=zS0XOy4b8pZKDCEaxCjp8rW+joMjvjQ@mail.gmail.com>
Subject: Re: [PATCHv2] drivers: bus: simple-pm-bus: Fix compatibility with
 simple-bus for auxdata
To:     Tony Lindgren <tony@atomide.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jan 18, 2021 at 2:41 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * Arnd Bergmann <arnd@kernel.org> [210118 08:30]:
> > On Mon, Jan 18, 2021 at 8:33 AM Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > After converting am335x to probe devices with simple-pm-bus I noticed
> > > that we are not passing auxdata for of_platform_populate() like we do
> > > with simple-bus.
> > >
> > > While device tree using SoCs should no longer need platform data, there
> > > are still quite a few drivers that still need it as can be seen with
> > > git grep OF_DEV_AUXDATA. We want to have simple-pm-bus be usable as a
> > > replacement for simple-bus also for cases where OF_DEV_AUXDATA is still
> > > needed.
> > >
> > > Let's fix the issue by passing auxdata as platform data to simple-pm-bus.
> > > That way the SoCs needing this can pass the auxdata with OF_DEV_AUXDATA.
> > > And let's pass the auxdata for omaps to fix the issue for am335x.
> > >
> > > As an alternative solution, adding simple-pm-bus handling directly to
> > > drivers/of/platform.c was considered, but we would still need simple-pm-bus
> > > device driver. So passing auxdata as platform data seems like the simplest
> > > solution.
> > >
> > > Fixes: 5a230524f879 ("ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup")
> > > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > ---
> > > Changes since v1: Updated description, added devicetree list to Cc
> >
> > This looks fine to me for now
> >
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks for the review.
>
> > But I think we should take the time to discuss how to phase out auxdata
> > over time. There are still a number of users, but it's not that many in the
> > end. For some of them I see a clear solution, for other ones I do not:
>
> Yes agreed we should remove the auxdata use.
>
> > omap2: I'll leave these for Tony to comment
>
> The three hardest ones to update (because of PM dependencies):
>
> - PRM power managment interrupts that also pinctrl driver uses

I haven't looked at it, but can't one driver go find the other node
and the interrupts it needs? There's nothing wrong with a driver
looking outside 'its node' for information.

Rob
