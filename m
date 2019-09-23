Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75DB5BB54D
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2019 15:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407834AbfIWNcY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 Sep 2019 09:32:24 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40804 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404581AbfIWNcY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 23 Sep 2019 09:32:24 -0400
Received: by mail-io1-f66.google.com with SMTP id h144so33361224iof.7;
        Mon, 23 Sep 2019 06:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Gkx6KfsI/v7RjesbZJM0miCqFfmb10UpE9xFSBSG4M=;
        b=XYNE4TvnKpcq7LW/JhTVMgCt4cU8pZLEMVe7XH0UwDBfwwE+o6ExtyHMX7nBaHe8oT
         mI7NYIP5AataRCuGAJ9tg0nC4owo4+fPvB8vTXk8V2I7hcC2NzGbs30N4UdJ3ZLGAUm5
         11l/j7vKPnT6VC3RW/0y71fviHmelkldDJtMmvkB5SSvJNtV5ZE2LUhUL9QK4uY8zvyX
         Vxg3fgCBY+HUMOz63RFY89I3hAIzJYpXfjSRFey6zsSLkPZrBNHkJSnsbkU8U1fp0042
         vBPielQ6d5yeAsaZc2jCoSqLXCtgU6M1IPmsrRcQEqdki+kZtXOmiRP1l8oD/1F8Wq4+
         NyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Gkx6KfsI/v7RjesbZJM0miCqFfmb10UpE9xFSBSG4M=;
        b=LD6GXgA6pNEeuPFfExT91C/FutejA+pkcEngURmkPNw7WTcvmQ068fFv5WH9bhWkPE
         KGyf01YqJ2UlOcIVazsfONHO4Cic94qxk1Ixs56gF/gX0ahJg7+KfoI5RlXK2pFe02FE
         28ot3Ae2ZKFLR5cD0S1XtIhDXPEhRSs0ONii2dFj0kqp9YtABC9iu3wq6UUp2EMYYeGT
         3FF3ZDDhY8GopmNVbCu0BKZi5NfQqR6H54uArQU4uqKDFqKb+r/0n6N945na3POM+aek
         6hZqALa+y9L39fO0zAas11cAKefg+dpPmqB/OvU+IIQeHVs8WlWZE3QeExIDUbacQ4y2
         QksQ==
X-Gm-Message-State: APjAAAWehUgtzwvFABPYy4FpMM44E+DUK4HIUD1czmiL22MeKM482GiR
        qIv0ezVLxWHRrdMckChVUGt7oKhqXUj3zI6px1U=
X-Google-Smtp-Source: APXvYqwJR3QJD1jIZYV2jbJW2R5s+jizFtekkek5ZBdhPG1M8UvVC0BL2Whi5uGAdV9CgEENkoGzDWq5OShcNE+n+v8=
X-Received: by 2002:a02:6a22:: with SMTP id l34mr25692766jac.33.1569245543173;
 Mon, 23 Sep 2019 06:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190917161214.2913-1-aford173@gmail.com> <20190917161214.2913-3-aford173@gmail.com>
 <20190921190941.GD32133@ravnborg.org>
In-Reply-To: <20190921190941.GD32133@ravnborg.org>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 23 Sep 2019 08:32:11 -0500
Message-ID: <CAHCN7xKqiNxrR+DVDV_7pE0vmQAXQkhf-0RPS3GGgZU=81RC-A@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: logicpd-torpedo-37xx-devkit-28: Reference new
 DRM panel
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Sep 21, 2019 at 2:09 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Adam.
>
> On Tue, Sep 17, 2019 at 11:12:13AM -0500, Adam Ford wrote:
> > With the removal of the panel-dpi from the omap drivers, the
> > LCD no longer works.  This patch points the device tree to
> > a newly created panel named "logicpd,type28"
> >
> > Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> Looks good.
> One nit below.
>
> With this addressed:
>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
>         Sam
> >
> > diff --git a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
> > index 07ac99b9cda6..00c426bd51a0 100644
> > --- a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
> > +++ b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
> > @@ -11,22 +11,8 @@
> >  #include "logicpd-torpedo-37xx-devkit.dts"
> >
> >  &lcd0 {
> > -
> > +     /* This isn't the exact LCD, but the timings meet spec */
> > +     /* To make it work, set CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=4 */
> > +     compatible = "logicpd,type28";
> >       label = "28";
> You left this property - but us it documented and what use has it?

Good catch, I'll remove it and post a V2 today once I can figure out
the yaml stuff.

adam
>
> > -
> > -     panel-timing {
> > -             clock-frequency = <9000000>;
> > -             hactive = <480>;
> > -             vactive = <272>;
> > -             hfront-porch = <3>;
> > -             hback-porch = <2>;
> > -             hsync-len = <42>;
> > -             vback-porch = <3>;
> > -             vfront-porch = <2>;
> > -             vsync-len = <11>;
> > -             hsync-active = <1>;
> > -             vsync-active = <1>;
> > -             de-active = <1>;
> > -             pixelclk-active = <0>;
> > -     };
> >  };
> > --
> > 2.17.1
