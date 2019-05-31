Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D11E730DE7
	for <lists+linux-omap@lfdr.de>; Fri, 31 May 2019 14:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727274AbfEaMNO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 31 May 2019 08:13:14 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:37970 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726233AbfEaMNO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 31 May 2019 08:13:14 -0400
Received: by mail-it1-f193.google.com with SMTP id h9so679838itk.3;
        Fri, 31 May 2019 05:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=atIK3Z4pOl58AUWDjMScnZMywy+rlJAUd7dwx6jXLYM=;
        b=JfNlnKh14mQcZkvyBftIv2uN55Gi1+AGQx8AQbO7XTXI65apQbd43bz6KZLpAd2Qob
         euiTzNdju+Y3idHhtfaJs4vqKwttbD3BEvRCqDp0gLHQIwRd9Eg/urVpmxQK4RRvxSt+
         KdXndu9KABgQN5UFXx2Xuhg+eZzPPRxGkWMOJ2LKPCLfHBNsmbIdexrIdS+KWeGBuIvK
         rDXO4Hq8+qxZJ5AxOOJg3jgHJMIdQg+HKkoDDbM+5thrSrO6JbGHuWzZHsZ1QYsyPKWm
         2IGeqmVZKc/nLYACzJSBsZ21IEEWlqA4vPuvfg/yGfcp+1d6efBUaed+a2H3WPp5SpBy
         gsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=atIK3Z4pOl58AUWDjMScnZMywy+rlJAUd7dwx6jXLYM=;
        b=n9b+d65YoOaa9wNGV9Gs7dUlU+lDhNKxPSxAebx5VARrNNduYTYig1h+t/ROLwiISX
         /KUD5sgvjtdLEo+0mjMn7scC8gjM1uvs9jvRXAcCsfVbhoJ5dvsEGjJ1FGftP85wZCvd
         UcVE2mrWIR77Aj51rgodRyw7WYX0RNnsvUQvLokvjPMpagZRFZDjNfoShk7i+ooI7+oV
         +wk7xZ/sOYe5Htg9/591FO0Tzlk4PbEOs96bqLRO+kIuNYNdLUyb6f+Vv3XyBcDPz0YV
         JL7gR3jSRgEnt48dBffY7862tlk7Q3v+D5i7M3RQ+d+DZSpkMekk9l6dlD2uGrPjxiPG
         6hlg==
X-Gm-Message-State: APjAAAUHvz9Gt9UofNDLmHHXreIfX7eJT/VApHMNWVqidG4j8PCvI4V2
        QMchf0NRKpMxuB8Jmo+Pd5KtfxR12MKxeZ6h510=
X-Google-Smtp-Source: APXvYqz3dZ1ERvd9Fqykdr5sI5iUqO7/DPRb8FpoL6306O+rT/e6QvjuUYL4RuJjfXLC0sNYcoFFAcEz969Hm0wJxcA=
X-Received: by 2002:a24:9ac7:: with SMTP id l190mr5943232ite.100.1559304793222;
 Fri, 31 May 2019 05:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com> <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com> <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
In-Reply-To: <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 31 May 2019 07:13:01 -0500
Message-ID: <CAHCN7xLNCuqDyvOvtQef+CnRCMit2U2XTDP+=XKkjfmrnVv4kg@mail.gmail.com>
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
        dri-devel@lists.freedesktop.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 28, 2019 at 10:53 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> Hi,
>
> On 28/05/2019 18:09, Adam Ford wrote:
> > On Tue, May 28, 2019 at 4:11 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> >>
> >> Hi,
> >>
> >> On 10/05/2019 22:42, Adam Ford wrote:
> >>> Currently the source code is compiled using hard-coded values
> >>> from CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK.  This patch allows this
> >>> clock divider value to be moved to the device tree and be changed
> >>> without having to recompile the kernel.
> >>>
> >>> Signed-off-by: Adam Ford <aford173@gmail.com>
> >>
> >> I understand why you want to do this, but I'm not sure it's a good idea.
> >> It's really something the driver should figure out, and if we add it to
> >> the DT, it effectively becomes an ABI.
> >>
> >> That said... I'm not sure how good of a job the driver could ever do, as
> >> it can't know the future scaling needs of the userspace at the time it
> >> is configuring the clock. And so, I'm not nacking this patch, but I
> >> don't feel very good about this patch...
> >>
> >> The setting also affects all outputs (exluding venc), which may not be
> >> what the user wants. Then again, I think this setting is really only
> >> needed on OMAP2 & 3, which have only a single output. But that's the
> >> same with the current kconfig option, of course.
> >>
> >> So, the current CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK is an ugly hack, in my
> >> opinion, and moving it to DT makes it a worse hack =). But I don't have
> >> any good suggestions either.
> >
> > As it stands the Logic PD OMAP35 and AM37/DM37 boards (SOM-LV and
> > Torpedo) require this to be hard coded to 4 or it hangs during start.
> > This is the case for all versions 4.2+.  I haven't tested it with
> > older stuff.  Tony has a DM3730 Torpedo kit and reported the hanging
> > issue to me. I told him to set that value to 4 to make it not hang.
> > He asked that I move it to the DT to avoid custom kernels.  I agree
> > it's a hack, but if it's create a customized defconfig file for 4
> > boards or modify the device tree, it seems like the device tree
> > approach is less intrusive.
>
> Ok, well, I think that's a separate thing from its intended use. The
> point of the kconfig option is to ensure that the fclk/pclk ratio stays
> under a certain number to allow enough scaling range. It should never
> affect a basic non-scaling use case, unless you set it to a too high
> value, which prevents finding any pclk.
>
> Has anyone debugged why the hang is happening?

I tried debugging this years ago, and I was told to use the
CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK.
>
> If we can't fix the bug itself, rather than adding a DT option, we could
> change add a min_fck_per_pck field (as you do), keep the kconfig option,
> and set the min_fck_per_pck based on the kconfig option, _or_ in case of
> those affected SoCs, set the min_fck_per_pck even without the kconfig
> option.

I am just curious if anyone else sees this.  If nobody is using this
hack, I wonder how much of the impact it will be.  I'm trying trying
to get my board to boot without hanging without creating a custom
defconfig.

adam
>
>   Tomi
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
