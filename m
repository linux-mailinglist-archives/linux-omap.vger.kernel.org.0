Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC3F94E88
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2019 21:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbfHSTn2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Aug 2019 15:43:28 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37322 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727957AbfHSTn1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Aug 2019 15:43:27 -0400
Received: by mail-io1-f67.google.com with SMTP id q22so6946180iog.4;
        Mon, 19 Aug 2019 12:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LteuoyutT2WV2dwF2vd0nnFOiyU2EWcBqEz+vG3dUms=;
        b=g35NV6mx5CHu67h2Mt01MleVzz9g5Gzx81F1enSKh55M3qXCWRj81b8OWCNKkKf0SN
         UEkiHnGker7RzbSpOnojildWtkPvD+1aEJhDk3BAR53CmI48XziRIgJfSfyAEPrTrM9c
         +OW9BjFUOseDIMY3EVupeJ0mRORRKiybFzrIkzOP7iK3vTpbzx11uC+blAscJxITFq4P
         TRDBCquI2jUtj/0pXOnTCHfwGvmym2RyDahFFGIr3jVzI3vse29U5nbFLB/fMmgHMlF9
         AfHwiApnPzzCeyikEjmv5hIYv5qEmIVsFuud2M5jWO16uzx0hrtaEYTubn5/KF+dwtkf
         X/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LteuoyutT2WV2dwF2vd0nnFOiyU2EWcBqEz+vG3dUms=;
        b=l/YkVntWxHYTWCVbshUiF+Qx/IBje80I2yGMsmblCl9GzOLPRkECkj/CyXpkhrkrHm
         6uwMAIlNELu+S0mRGg4KOJm7QSyJWItLd0hsM0XpPeP177vabR5wxc8V/OJawh112F5W
         0LmeVnSLl4YhEax++nPbDxgFRT0zMONUipLkd44GPwQjg5UiQ9VrIcLT+PHrj/wjaIQb
         4lSybMFnrkoapbeNA6cHBr6vpXMCpnB+x+zJw/jLEUHi5zj5Ls7mQdtK+4vF964Wbe57
         5q/dIOZzHL4f+/kRQIVlyqXldpUATyXQKjNpKJcg1NO01tZcCJWNY5Yus+jEMFpTK1Ce
         4dTg==
X-Gm-Message-State: APjAAAVmmdqmJEbRvrGykmI9ENjJbiYydNqWweqwY1S6SdeswGdVS/IZ
        85RcL+yHLMEZah2Lb+vthXHD35a6jIc0V9ueLgE=
X-Google-Smtp-Source: APXvYqwWLSAD6ysVPGYvrqX9xRxKMsNCGOoYw5v/ACvV38QCqVjS4yG15ZTSOVeg3wkmGoMTT0ealrSSyOCtKEXiHTU=
X-Received: by 2002:a6b:621a:: with SMTP id f26mr11762609iog.127.1566243806380;
 Mon, 19 Aug 2019 12:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20180108214032.GW3872@atomide.com> <4d99c1ae-7752-949b-7e88-bc8f1dc594a2@wizzup.org>
 <0C51EC59-9CDC-4196-ACF9-24596C9E61B6@goldelico.com> <FA4520D5-62CB-446D-975C-A1C7B9251517@goldelico.com>
 <20190212205132.GO5720@atomide.com> <0b00ce0a-969f-e638-8247-c2da96cf7ce6@gmail.com>
 <20190213004143.GP5720@atomide.com> <480AB632-A544-41E7-95A4-DC354AEBB71A@goldelico.com>
 <CAKpie0SigGGsQxSU+X-Mz5boy-Xx=3wRNOcrf+F=ehFr3RBi7Q@mail.gmail.com>
 <092210C3-05DE-4AFB-986F-81BD8F990B67@goldelico.com> <CAKpie0RXM1UC33YFeFy-kAxfGhYGNkw4vUgNTThf-ZCAhPTVXw@mail.gmail.com>
 <BE23C1E4-2877-49FA-B230-F9C10691B805@goldelico.com> <CAKpie0TSo-8gmDm9_Zw4Sd+kjVVEomp8yA9Vu8qY2U2AcrQc=w@mail.gmail.com>
 <8A069D96-C65F-43F5-8F54-20019CFB1A8D@goldelico.com> <d0cbfaaf-813e-8803-f90b-931a38396750@wizzup.org>
 <3A03FF16-C203-43ED-AEEF-0260F6B3331A@goldelico.com> <3b0a5e78-c4c2-1963-bac7-b49496a1e9b9@wizzup.org>
 <1F942AAB-1648-46C0-ADD5-90F6898778BE@goldelico.com> <84cac9b8-0eff-33f8-464d-4f8045d7db19@wizzup.org>
 <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com>
In-Reply-To: <BFAA7FA6-A352-476A-99F9-02EA663A6AAD@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 19 Aug 2019 14:43:14 -0500
Message-ID: <CAHCN7x+87xTsA3MeHy7kUWU0SU3X8HmSc2wbk5gKvYm1dRNe6A@mail.gmail.com>
Subject: Re: Lay common foundation to make PVR/SGX work without hacks on
 OMAP34xx, OMAP36xx, AM335x and potentially OMAP4, OMAP5
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        Tony Lindgren <tony@atomide.com>,
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

On Wed, Aug 14, 2019 at 3:56 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Hi all,
>
> > Am 17.07.2019 um 12:51 schrieb Merlijn Wajer <merlijn@wizzup.org>:
> >
> > Hi,
> >
> > On 10/03/2019 08:07, H. Nikolaus Schaller wrote:
> >>
> >>> Am 10.03.2019 um 00:14 schrieb Merlijn Wajer <merlijn@wizzup.org>:
> >>>
> >>> Hi,
> >>>
> >>> On 15/02/2019 14:09, H. Nikolaus Schaller wrote:
> >>>
> >>>>>> At least I can download and start firmware. I just have to find a way to fix the omaplfb so that it works
> >>>>>> with our omapdrm based panels to runs the CLipBlit test [1] on modern kernels...
> >>>>>
> >>>>> Maybe you can compare with what we have here:
> >>>>> https://github.com/maemo-leste/n9xx-linux/tree/pvr-wip-4.15.7/drivers/gpu/pvr
> >>>>
> >>>> I'll take a look into it especially how omaplfb is done.
> >>>>
> >>>> First observation is that there is a "flat" tree while I am working on a structured one...
> >>>> But that is just a marginal difference (mainly significant for Makefile writers).
> >>>
> >>> I've ported the Maemo Leste kernel + pvr to 5.0 and it seems to work:
> >>> https://github.com/maemo-leste/n9xx-linux/commits/pvr-wip-5.0.y
> >>>
> >>> Should I add this as maemo-leste-n900-5.0 branch (or something) to
> >>> https://github.com/openpvrsgx-devgroup/linux_openpvrsgx ?
> >>
> >> Yes, that would be nice to be able to easily compare stuff.
> >
> > I've just pushed the Maemo Leste v5.1 branch + patches here:
> >
> >       https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/tree/n900/v5.1-patch
> >
> > This works on N900 with X, but it doesn't use DRM yet. I'm wondering
> > what a next logical step would be: to try and modules to load/probe on
> > another device (I have a droid4 or a Pandaboard ES rev B1), or to try
> > and get DRM PowerVR to work on the N900, with omapdrmfb and dri3wsegl.
> >
> > For either path, I'll probably need some help. Any updates from anyone
> > else? Maybe we should list things people can work - perhaps document
> > progress in github issues. (Mailing list is also fine, BTW)
> >
> > Cheers,
> > Merlijn
> >
>
> I also have pushed good news to
>
>         https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/tree/letux-pvr
>
> Thanks to the help from the Pyra community, I was able to get a (binary) reference
> implementation using DRM that works on Pyra/OMAP5. At least the gles1test1.

just a question,

If DRM is working, does that mean it works without needing the overhead of X?

adam
>
> With that reference setup I was able to fix my Makefiles for the staging/pvr implementation.
>
> I have tested that it works with v4.19.66 and v5.3-rc4 (LPAE build of the LetuxOS kernel tree)
> on the Pyra.
>
> In which areas does this tree go beyond the TI SDK/IMG DDK 1.14?
>
> * includes internal API fixes for kernels up to v5.3
> * lives in drivers/staging/pvr/1.14.3699939 - so that we can ask for inclusion in linux-next
> * has Kconfig and Makefiles for in-kernel configuration (no separate build system)
> * builds separate kernel modules for omap3430, omap3630, am335x, omap4, omap5, dra7 etc.
>   pvrsrvkm
>   e.g. pvrsrvkm_omap_omap5_sgx544_116
> * the correct kernel module is automatically probed by matching .compatible in device tree
>   so that the code is multi-platform friendly
> * includes SoC integration for OMAP3/4/5 and has some preliminary bindings documentation
> * code base should also support JZ4780/CI20 and some Intel Atom processors (CedarView, Poulsbo)
> * has got a ToDo to describe what should be done during staging phase
>
>         https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/blob/letux/latest-pvr/drivers/staging/pvr/TODO
>
> My plans for the next steps are:
>
> * do more testing (e.g. X11, kmscube)
> * check if and/or how it can run on am335x (BeagleBone) or OMAP3 (e.g. GTA04, OpenPandora)
> * try a JZ480/CI20 build (unfortuantely I have no HDMI there with mainline kernels and I am
>   missing the user-space libraries for MIPS).
>
> BR,
> Nikolaus
>
