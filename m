Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C46690B46
	for <lists+linux-omap@lfdr.de>; Sat, 17 Aug 2019 01:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbfHPXCG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Aug 2019 19:02:06 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36327 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727742AbfHPXCG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Aug 2019 19:02:06 -0400
Received: by mail-io1-f67.google.com with SMTP id o9so9403324iom.3;
        Fri, 16 Aug 2019 16:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y0yqYIEO53tK8G4+aud67uiqL1xftbMRHfD3bIvLa7g=;
        b=OFwbdSh0xrkjmLl1+7hAAP8lTJU7BYVaOt+Jus+OJsZ0mmlvFW/RrW67IsRAsoILPU
         sCZ0GzLcolZHz5fbO7aO3GU49H+0yfqEw+PvLYLlN/D08fF2Hb8LC3hWvSs78ksFD55M
         qFWezE7Ln5ML8IEpBSFgfbAyqsxgn81zNSmPVMxjfEUl4S/dYzaQCo7Wmngg14Ajm/S/
         P/8CsQOvqquIkNHIqZ70L389ci981FuxawY90RS5ohzl1NTMz4HKDRapHINRN9glGXqp
         C3hvz3eVOAdW4hES/1/NEGHzLUSma+v9Qxfdp4pJ4hzfXzqgKCiIxSKpzNC19gsDr0JC
         /k/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y0yqYIEO53tK8G4+aud67uiqL1xftbMRHfD3bIvLa7g=;
        b=FrD8iANM0JCLeFM/PvU1xBbBZSSXQRpeUghPwI9w/op+3pespgo4jpRbunTZSOWyQu
         uy+bjJ8CW7E3x3Q9zHScm9rEBTR3NXK/IcjKNYxgQYmYr29jMrqtLyYXSn6x/+E2EQ6o
         /Ly1CFIY4n/fUkp3HZnRLXK1xWm88fYj2qDiVyvsTDZ18T0XcLt4jdtwlLICFjC/C6Qs
         iydo3laxdnbh15mh1v1fq1XeEWNzas5jVI/3v2rBHKyYZpC9clARNX/xGjpPlIFcx8mm
         Y0UJPZ1YCxZ6BIjh5GnJxW5hClOUvGyEhV/RIU2UywrhEQO5NSPeljsmbxTNl5FVZ/w3
         bHqg==
X-Gm-Message-State: APjAAAWSnxSzAhniixx0rNzxMvrMuyIl+bUbm9Hm+4Ql2VJUdbtqNBnY
        njnhEBsb3hO299j8MSc7M2a8T+Wl4u7Fpujmgaw=
X-Google-Smtp-Source: APXvYqz316FLC55ySq2we+sFp0rLROpZDtnmhJZPeFHaw0w663BCId+xo14l9ynYgNuE/85h/meabCiilVzeqpm8fIU=
X-Received: by 2002:a6b:e511:: with SMTP id y17mr14147354ioc.228.1565996525051;
 Fri, 16 Aug 2019 16:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAKpie0TSo-8gmDm9_Zw4Sd+kjVVEomp8yA9Vu8qY2U2AcrQc=w@mail.gmail.com>
 <8A069D96-C65F-43F5-8F54-20019CFB1A8D@goldelico.com> <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org>
 <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com> <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org>
 <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com> <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org>
 <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com> <20190814094755.GC52127@atomide.com>
 <6A6394A6-9D50-4E43-A8E4-716888897AD6@goldelico.com> <20190814131607.GD52127@atomide.com>
In-Reply-To: <20190814131607.GD52127@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 16 Aug 2019 18:01:53 -0500
Message-ID: <CAHCN7xJ2kcr7dOFvxTB_PX_62sX_QV5EyeMPHMaPbZ9fXts9pg@mail.gmail.com>
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on
 OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
To:     Tony Lindgren <tony@atomide.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        =?UTF-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, maemo-leste@lists.dyne.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Aug 14, 2019 at 8:16 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * H. Nikolaus Schaller <hns@goldelico.com> [190814 10:34]:
> >
> > > Am 14.08.2019 um 11:47 schrieb Tony Lindgren <tony@atomide.com>:
> > >
> > > * H. Nikolaus Schaller <hns@goldelico.com> [190814 08:57]:
> > >> I also have pushed good news to
> > >>
> > >>    https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/tree/letux-pvr
> > >>
> > >> Thanks to the help from the Pyra community, I was able to get a (binary) reference
> > >> implementation using DRM that works on Pyra/OMAP5. At least the gles1test1.
> > >>
> > >> With that reference setup I was able to fix my Makefiles for the staging/pvr implementation.
> > >>
> > >> I have tested that it works with v4.19.66 and v5.3-rc4 (LPAE build of the LetuxOS kernel tree)
> > >> on the Pyra.
> > >>
> > >> In which areas does this tree go beyond the TI SDK/IMG DDK 1.14?
> > >>
> > >> * includes internal API fixes for kernels up to v5.3
> > >> * lives in drivers/staging/pvr/1.14.3699939 - so that we can ask for inclusion in linux-next
> > >> * has Kconfig and Makefiles for in-kernel configuration (no separate build system)
> > >> * builds separate kernel modules for omap3430, omap3630, am335x, omap4, omap5, dra7 etc.
> > >>  pvrsrvkm
> > >>  e.g. pvrsrvkm_omap_omap5_sgx544_116
> > >> * the correct kernel module is automatically probed by matching .compatible in device tree
> > >>  so that the code is multi-platform friendly
> > >> * includes SoC integration for OMAP3/4/5 and has some preliminary bindings documentation
> > >> * code base should also support JZ4780/CI20 and some Intel Atom processors (CedarView, Poulsbo)
> > >> * has got a ToDo to describe what should be done during staging phase
> > >>
> > >>    https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/blob/letux/latest-pvr/drivers/staging/pvr/TODO
> > >>
> > >> My plans for the next steps are:
> > >>
> > >> * do more testing (e.g. X11, kmscube)
> > >> * check if and/or how it can run on am335x (BeagleBone) or OMAP3 (e.g. GTA04, OpenPandora)
> > >> * try a JZ480/CI20 build (unfortuantely I have no HDMI there with mainline kernels and I am
> > >>  missing the user-space libraries for MIPS).



> > >
> > > That sounds good to me, just one comment. Before getting these into
> > > staging, I'd like to have omap variants use proper interconnect
> > > target module in devicetree like we already have in omap4.dtsi
> > > as target-module@56000000. This should simplify things further
> > > as the module child device driver(s) can just enable things with
> > > runtime PM and we can leave out all the legacy hwmod platform data
> > > that sounds like you're still carrying.
> >
> > Yes, there is still a lot of SoC-glue included:
> >
> >       https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/commits/letux/omap-pvr-soc-glue
> >
> > It would indeed be a good move to simplify and reduce the glue code
> > and make it more maintainable / stable / identical on different platforms.
>
> OK yeah all that should just disappear :)
>
> > > I have patches here to add similar interconnect target modules for
> > > at least omap34xx, omap36xx, omap5, and am335x that I'll try to post
> > > later on today to play with. For am335x, things still depend on the
> > > recentely posted prm rstctrl patches. I'm not sure if I already
> > > did a dts patch for dra7 yet, need to check.
> >
> > I assume it is not yet in linux-next... So something for v5.5 or later.
>
> Well I just posted some sgx interconnect target module patches. We might
> still have them in v5.4 assuming people manage to review and test them.

Nikolaus,

I tested Tony's change and I can confirm that I can read the value
when enabled.  Should I apply his patches to your branch before I
test, or is it go too to go as-is? I've got an AM3517, OMAP35 and a
DM3730.  I am not sure if the AM3517 is even on the radar, but it has
an sgx530 as well.

adam

>
> Regards,
>
> Tony
