Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3FF8C04E9
	for <lists+linux-omap@lfdr.de>; Fri, 27 Sep 2019 14:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfI0MOL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Sep 2019 08:14:11 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:46915 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbfI0MOL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 Sep 2019 08:14:11 -0400
Received: by mail-io1-f68.google.com with SMTP id c6so15561220ioo.13;
        Fri, 27 Sep 2019 05:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XJJtNuqioZl6sa+W5Rtd/VG7UjoMxElWqoWFvVmwcPg=;
        b=iROi2TOrPbDzeqog2o0irRLDYv8v0KQxALF63dP95BRHup05sWPpMyhjL8kxbpnyUl
         9rlyIezwuakpTw24pXZQuDTN5ePY1nXjUTJw/ORTVKLPHr08x+DR2fAHWXJAXM/XapbP
         2SRvVM6DubGI/ojN759mp2E01zstJgN+YsNaR8VbCOivsWZFBw3j7x3TBnuAmeUOc2b4
         4yU1ltsIaulzT0xipQDIjckwMUOPeuxWhmX5T6yzKWYhIS2Kbe5xXa8UhNi24k+O6BQ1
         6PP/D77y76Lb7Upg1jzA+KtGKbBy7q25jgPBcJx3HT+5pHqciyJYyW1A11MIjJSUeNgT
         7Png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XJJtNuqioZl6sa+W5Rtd/VG7UjoMxElWqoWFvVmwcPg=;
        b=CowIxsp9KdcKzs9FVzdXQ+DWROajpK94dFP1gw4rDO4J5gatRAIFIpAz3Wd9zfF3qm
         CAgjJTl5HnAjzioPWHCIOWKdR91CfORpD/uwqufsXyrohmbRPoETDC49UXQDqRDbYxbC
         BTfQ27ph8cX7IW0iRPBn9jKODyj/domkQnbX4YrzBWPEorf8bObd0JE1/dMtV3ZppJwD
         Ksq56QEp7fbFz6/naBF7lcPrwE906hLfZPDGu+yOLNLtlyClgXPAxUv82aLpMBf/iGTy
         bsOpYBVRt5MNse270MsxxPm3ZZW0oFC1Dur4GpqHSgKfCoWW+Cmh6au4T5JEzTDEFHh7
         SDZg==
X-Gm-Message-State: APjAAAUSTZfsI07nHl+e1HJLuu6SrjqbvfaMUYmnYMN/49wGes6GJACm
        ZqQaqYpyHdg7SGbSipe7ADV/QzXVdn84QMW6CXFn4Y0oFlw=
X-Google-Smtp-Source: APXvYqwyOKCiZQF6ncWvp6oVJF/zzgcf1p5FbkC23Qgharm/Cg3vsMj4M3mHWcQhIQJk7EAyi5Ecx3hZvquvq5qC//8=
X-Received: by 2002:a92:3f0a:: with SMTP id m10mr4235717ila.158.1569586450690;
 Fri, 27 Sep 2019 05:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com> <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com> <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com> <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <f6012b3a-7b96-6020-d09d-c458fa8742d8@ti.com>
In-Reply-To: <f6012b3a-7b96-6020-d09d-c458fa8742d8@ti.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 27 Sep 2019 07:13:59 -0500
Message-ID: <CAHCN7x+ysOEXFCE5DXvoPh6sQBdnHRE8t-KJfcijWesJRx9iXg@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to dts
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Sep 27, 2019 at 1:22 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> On 26/09/2019 17:12, Adam Ford wrote:
>
> >> And what is the hdmi5_configure there? I don't see anything in the
> >> driver that would print hdmi5_configure. And, of course, there's no
> >> hdmi5 on that platform. Hmm, ok... it's from component.c, using "%ps".
> >> Somehow that goes wrong. Which is a bit alarming, but perhaps a totally
> >> different issue.
> >
> > I'll try to take a look later.  For Logic PD distributions, we create
> > a custom defconfig with all those drivers removed, so I'm not worked
> > up about it, but it would be nice to not call drivers that don't
> > exist.
>
> So you have CONFIG_OMAP5_DSS_HDMI=n? Then it's even more disturbing, as
> there's no way the string "hdmi5_configure" can be in the kernel image...

For the logs and problems I am showing in this thread, I am using a
stock omap2plus_defconfig which has it enabled.  I was only trying to
state that I am not worried about the omap5 hdmi stuff, because when I
do a custom distribution for Logic PD, I remove those config options
to make the issue go away.
>
> Maybe it's nothing, but... It's just so odd.

I don't think we need to worry about it now.  Ideally, it would be
nice to have the drivers recognize they are not needed and or setup
the Kconfig options to make these drivers dependent on the platforms
that support it so unselecting OMAP5 could make the omap5 options
disappear.

Sorry if I accidentally threw in a distraction or confusion.

adam
>
>   Tomi
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
