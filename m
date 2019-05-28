Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7562C9AE
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 17:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbfE1PKK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 11:10:10 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:37844 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfE1PKK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 May 2019 11:10:10 -0400
Received: by mail-it1-f195.google.com with SMTP id m140so4460720itg.2;
        Tue, 28 May 2019 08:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a29Mb9q0C2eZLyL56q8iGFbn8bX3U+5p/qd7Soix2Vo=;
        b=dJ4VLVqBqWx1Dh/6J39dSmZIhfUbFJpeEYQYlvy8X2L7onF4s2LkyNH3mLAdjQwL4m
         jDVEgJfD4dV/7W7J0CE9mIC1iOZ5afiOM/2qO0/n2vn5X9rptNDNPh8/8EPx30w9l3pw
         bgjOdWto43Xvd8pwRbGun48dHHITVKZxq9w0aKJW0mLRintI9Gxo1uwdYdglBA7FOoYH
         4Aw71ad0voCHLkl195lQQCP5nlxBd2kXBMmDcnWa1b29dT85oYDQqaN8Tp8qXVypspcp
         VwMMwXuRifst+if6ud6PWlGbs36HwzCr4Nka7qLBlQWM4WVsJs+rukJAjfGkS62zhERH
         6aMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a29Mb9q0C2eZLyL56q8iGFbn8bX3U+5p/qd7Soix2Vo=;
        b=hNXnhco/i2SRdxYgXDNXUVO+913/k87aUXr86e8mrGgZ+nWO5eh32Z6V2pwSpeMQld
         WlTGOye4ndn3acpbPGHYKlr9Pk1d/NHpQh+eag64w20jwvKWWrNxwVAZRGXNPx52KuDv
         yPFyvuC+5FnX5Q+1begVi8dqF0G+eOCFqDuN9OFC/ZypM54XcxJtCNK5WgWyVrwpbHsv
         vA2/hG1eg8yyjkmJp0P57qhWZ3ySDDw3HieiImOgFa8oRTvJtknWLVFLhE9VUPjP1vlO
         X7GyonJzd8JA8TYBqcJSZ+C+wl4OE6xMFg8E/jcEFJlZOLbqRMCfbf5Xq/j3V0HRrG8l
         Ga8w==
X-Gm-Message-State: APjAAAXVybG/3CqlVkfWmL1OKT6LhuwF8hc1oqBM17Yu8nOa83XFFJBf
        aFbaFtoUWszkt6sUEpGkA9HZW35I5f94yJe//lw=
X-Google-Smtp-Source: APXvYqyS95K39vUT/x85/XSoxgAsyI08vS5uN9aEZf7PB+V6sP+WxMIYGLpEtufzwHkNYsN5cM1qs/J1V9dicbdpae0=
X-Received: by 2002:a02:ccd2:: with SMTP id k18mr5763435jaq.3.1559056209051;
 Tue, 28 May 2019 08:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com> <af325707-3e42-493d-e858-77878ef06138@ti.com>
In-Reply-To: <af325707-3e42-493d-e858-77878ef06138@ti.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 28 May 2019 08:09:57 -0700
Message-ID: <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
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

On Tue, May 28, 2019 at 4:11 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> Hi,
>
> On 10/05/2019 22:42, Adam Ford wrote:
> > Currently the source code is compiled using hard-coded values
> > from CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK.  This patch allows this
> > clock divider value to be moved to the device tree and be changed
> > without having to recompile the kernel.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> I understand why you want to do this, but I'm not sure it's a good idea.
> It's really something the driver should figure out, and if we add it to
> the DT, it effectively becomes an ABI.
>
> That said... I'm not sure how good of a job the driver could ever do, as
> it can't know the future scaling needs of the userspace at the time it
> is configuring the clock. And so, I'm not nacking this patch, but I
> don't feel very good about this patch...
>
> The setting also affects all outputs (exluding venc), which may not be
> what the user wants. Then again, I think this setting is really only
> needed on OMAP2 & 3, which have only a single output. But that's the
> same with the current kconfig option, of course.
>
> So, the current CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK is an ugly hack, in my
> opinion, and moving it to DT makes it a worse hack =). But I don't have
> any good suggestions either.

As it stands the Logic PD OMAP35 and AM37/DM37 boards (SOM-LV and
Torpedo) require this to be hard coded to 4 or it hangs during start.
This is the case for all versions 4.2+.  I haven't tested it with
older stuff.  Tony has a DM3730 Torpedo kit and reported the hanging
issue to me. I told him to set that value to 4 to make it not hang.
He asked that I move it to the DT to avoid custom kernels.  I agree
it's a hack, but if it's create a customized defconfig file for 4
boards or modify the device tree, it seems like the device tree
approach is less intrusive.

adam
>
>   Tomi
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
