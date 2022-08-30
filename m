Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBDA5A66E8
	for <lists+linux-omap@lfdr.de>; Tue, 30 Aug 2022 17:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiH3PIV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Aug 2022 11:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiH3PIU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Aug 2022 11:08:20 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFF7FB0EA
        for <linux-omap@vger.kernel.org>; Tue, 30 Aug 2022 08:08:18 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id y18so8741896qtv.5
        for <linux-omap@vger.kernel.org>; Tue, 30 Aug 2022 08:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=BrJBPAY2KhM6PQbkaPvI9tg6Z8y2QSCev/1xKr7JVA0=;
        b=wYhWVIWb5ahQeWqpOyFcAsuMkQK7K2pGDQyWcsAlVZyn+MI9odapV1etm4FcXQ7vP3
         FlVwkDD8cpKUJU6Ga+kilKKFttWNZI6LB4Uq7hLCDM94a499BY9REJWgyXefREp22jTL
         1h4/vvcsS/kgK5HLwkyqTXqcCk/F+hAQ845bkF3iZ97RjEhV9AoQR+sCSMq9+h/v7MP5
         GuRRi5vxUyZGLSVq+r3ONAzyaLG9w/nN2Leu0NMNXmCZh8Bemcz2VUZnWwU9XkFgD45W
         E8HgZOHRgxilhwIu4C92wlV4E1y8WRMBwxS0QFLVl5NHwwGnMoGjwYQaxWSywEvC+IBJ
         g5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=BrJBPAY2KhM6PQbkaPvI9tg6Z8y2QSCev/1xKr7JVA0=;
        b=CtTDg1JM6c6eUaq5uGENNCoocfiyOudbNPm9jodhoAns8XopBOasBiuV93yukI0iS1
         Peol0NohWVSzfJCZPKzqFwHXCKnyitUVl3w1H6tDOadvzTYCQMrpFAkkpxUnyuKxhX1g
         hY334R5SPVji3pq5p2zS69Ip2SQjcRAzESRY1KUo8RiMzpeKAiheF6wz6Gs4S6F7nXgV
         GSVvm7qaUcV6Aen12BBRbNwZGnOF9m8Aidw1D104MQ3SHkVuJVxxoESMv1XeyWNFY+p3
         /Celu6DBnBaU/aMCuPFZ2D8nzcEGsTnX4rGeORXIVwdJIB6OoUF7CDhyaX0xFc8nHgia
         dIew==
X-Gm-Message-State: ACgBeo1SyyC2NsC9uqW5DD16XnQzEtuYtNtESQzXxPo3l9Lnw0407bMt
        nm4nVyhKC24SUKznjmdMwkCjTnKRe56uyXX30OLWzQ==
X-Google-Smtp-Source: AA6agR4gs9jfjsbm0UZR6tdx5TVoGfo4KS3sCKqH2S605Vysd6k+0Jk+AYk4htzd640Oh7tCzT2ByB5dVfXuQHF6/bE=
X-Received: by 2002:ac8:5812:0:b0:344:97e2:23a9 with SMTP id
 g18-20020ac85812000000b0034497e223a9mr14582742qtg.505.1661872097412; Tue, 30
 Aug 2022 08:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <5b6d3e7f-c638-fdc7-5080-44d34abed610@ideasonboard.com> <a3ed3a2c-86ce-1c85-e8aa-c08b54ad1a43@gmail.com>
 <CAMSo37XdZSZUHLWJj373DdtOBA9=uD8SJ7ywWCYF2pU1i4cB_g@mail.gmail.com>
 <ed4fe238-4fcd-1253-658f-18fe1e1f13b0@gmail.com> <CAMSo37V3U5nYng77jzSnKH73CTLhGYQJu11Q5wRt289se5nFJw@mail.gmail.com>
 <4128aed0-211a-d12a-6a86-deb4457d39f7@gmail.com> <CAMSo37W-DePLDP=zk-nY6FGcZuk0QzHj4=usrieyV0TNcNfbXw@mail.gmail.com>
 <da2a661e-9da0-850c-3067-8c1e8d5531bc@gmail.com> <CAMSo37VXNQeR0qZgzZONBwp_4z9CuUSJJJzhM7k+K39BcwvW6A@mail.gmail.com>
 <235621d0-2141-5ef9-bcd4-5c48b985b3a0@gmail.com> <5dc2c212-4967-ab2d-c016-f3b3a854fe32@ti.com>
In-Reply-To: <5dc2c212-4967-ab2d-c016-f3b3a854fe32@ti.com>
From:   Yongqin Liu <yongqin.liu@linaro.org>
Date:   Tue, 30 Aug 2022 23:08:05 +0800
Message-ID: <CAMSo37W+Z2hn_wJ9At1nyJX6XnpZx9JLXJv9g6DoqoaqqjUATw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs through DMM/TILER
To:     Andrew Davis <afd@ti.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc:     "Bajjuri, Praneeth" <praneeth@ti.com>, tomba@kernel.org,
        airlied@linux.ie, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        merlijn@wizzup.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tony@atomide.com,
        linux-omap@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

HI, Andrew

Thanks a lot for the information! And great to have you here!

Hi, Ivaylo

With the code provided by Andrew, could you please help give suggestions
on how to modify it in the gralloc lib side?

to add the OMAP_BO_SCANOUT flag unconditionally as OMAP_BO_MEM_CONTIG?

Thanks,
Yongqin Liu

On Mon, 29 Aug 2022 at 22:36, Andrew Davis <afd@ti.com> wrote:
>
> On 8/29/22 8:24 AM, Ivaylo Dimitrov wrote:
> > Hi,
> >
> >
> > On 29.08.22 =D0=B3. 5:51 =D1=87., Yongqin Liu wrote:
> >> Hi, Ivaylo
> >>
> >> Sorry for the late response, and Thanks very much for the detailed exp=
lanations!
> >>
> >> On Thu, 18 Aug 2022 at 18:23, Ivaylo Dimitrov
> >> <ivo.g.dimitrov.75@gmail.com> wrote:
> >>>
> >>> Hi,
> >>>
> >>> On 17.08.22 =D0=B3. 7:52 =D1=87., Yongqin Liu wrote:
> >>>> Hi, Ivaylo
> >>>>
> >>>> On Mon, 15 Aug 2022 at 14:23, Ivaylo Dimitrov
> >>>> <ivo.g.dimitrov.75@gmail.com> wrote:
> >>>>>
> >>>>> Hi Liu,
> >>>>>
> >>>>> On 14.08.22 =D0=B3. 17:27 =D1=87., Yongqin Liu wrote:
> >>>>>> Hi, IvayIo
> >>>>>>
> >>>>>> Thanks very much for the reply!
> >>>>>>
> >>>>>> On Sat, 13 Aug 2022 at 14:58, Ivaylo Dimitrov
> >>>>>> <ivo.g.dimitrov.75@gmail.com> wrote:
> >>>>>>>
> >>>>>>> Hi Liu,
> >>>>>>>
> >>>>>>> On 12.08.22 =D0=B3. 7:35 =D1=87., Yongqin Liu wrote:
> >>>>>>>> Hi, Ivaylo, Tomi
> >>>>>>>>
> >>>>>>>> We have one X15 Android AOSP master build, it could not have the=
 home
> >>>>>>>> screen displayed
> >>>>>>>> on the hdmi monitor connected with this change, with the followi=
ng
> >>>>>>>> message printed on the serial console
> >>>>>>>>         [  607.404205] omapdrm omapdrm.0: Failed to setup plane =
plane-0
> >>>>>>>>         [  607.410522] omapdrm omapdrm.0: Failed to setup plane =
plane-1
> >>>>>>>>         [  607.416381] omapdrm omapdrm.0: Failed to setup plane =
plane-2
> >>>>>>>>         [  607.422088] omapdrm omapdrm.0: Failed to setup plane =
plane-3
> >>>>>>>>
> >>>>>>>>        # for details, please check the link here: http://ix.io/4=
7m1
> >>>>>>>>
> >>>>>>>> It will work with home screen displayed on the hdmi monitor if t=
his
> >>>>>>>> change is reverted.
> >>>>>>>>
> >>>>>>>> Is this the broken problem you talked about here?
> >>>>>>>>
> >>>>>>>> And could you please give some suggestions on how to have the x1=
5
> >>>>>>>> Android build work with this change?
> >>>>>>>>
> >>>>>>>
> >>>>>>> Make sure scanout (i.e. those to be displayed) buffers are actual=
ly
> >>>>>>> allocated as such - OMAP_BO_SCANOUT flag must be set when calling
> >>>>>>> omap_bo_new().
> >>>>>>
> >>>>>> I am not familiar with this area, I am sorry if I asked quite sill=
y questions:(
> >>>>>> I googled omap_bo_new, and found it's a function of libdrm here[1]=
, is
> >>>>>> it what you meant here?
> >>>>>>
> >>>>>
> >>>>> Yes, calling this function from userspace ends in kernel code the
> >>>>> $subject patch is part of.
> >>>>>
> >>>>>> If it's the omap_bo_new that we should pass OMAP_BO_SCANOUT when i=
t is called,
> >>>>>> then is it the correct way to update omap_bo_new to add the OMAP_B=
O_SCANOUT flag
> >>>>>> before it calls omap_bo_new_impl?
> >>>>>>
> >>>>>
> >>>>> omap_bo_new() is fine and does not need any updates/fixes, it is th=
e
> >>>>> code that uses it (whoever it is, I am not familiar with the usersp=
ace
> >>>>> you are using) that shall pass correct flags (third parameter) when
> >>>>> calling it.
> >>>>
> >>>> Sorry, I do not get the point here.
> >>>> Like you said, the code that calls omap_bo_new needs to pass OMAP_BO=
_SCANOUT,
> >>>> then IMO omap_bo_new should be the best place to add the OMAP_BO_SCA=
NOUT flag,
> >>>> (like via flags =3D flags | OMAP_BO_SCANOUT), that could help avoid
> >>>> missing the flag by some code,
> >>>> and also avoids hacks/changes on the possible blob binaries.
> >>>>
> >>>> Do I misunderstand somewhere?
> >>>> Or is there some case that OMAP_BO_SCANOUT shouldn't be passed when
> >>>> omap_bo_new is called?
> >>>>
> >>>
> >>> Exactly. You need to pass OMAP_BO_SCANOUT only when you want your
> >>> buffers to be 'scanout' buffers(i.e. buffers that can be displayed on
> >>> screen), which is not always the case - there is no need offscreen
> >>> buffers or pixmaps to be scanout capable, for example. There are more
> >>> cases like that.
> >>>
> >>> The problem is that scanout buffer on OMAP4 allocate additional
> >>> resources in DMM/TILER (a piece of hardware) and those resources are
> >>> limited. Not only that, but DMM/TILER memory space eventually gets
> >>> fragmented over time (if you have lots of allocataoins/deallocations)
> >>> and you will start getting ENOMEM (or similar) errors.
> >>>
> >>> Ofc, in your particular use case you may never hit such issues.
> >>
> >> Thanks, I understand the cases now.
> >>
> >>
> >>>>> BTW you shall really find who and how uses OMAP BO API, in theory i=
t
> >>>>> might use ioctls directly and not call omap_bo_xxx functions.
> >>>>
> >>>> Do you mean the DRM_OMAP_GEM_NEW ioctl api?
> >>>> There is no place in the AOSP tree to call that except the
> >>>> omap_bo_new_impl function,
> >>>> which is called by the omap_bo_new and omap_bo_new_tiled functions.
> >>>> The omap_bo_new should not be called with the OMAP_BO_TILED flag,
> >>>> while the omap_bo_new_tiled should be called with the OMAP_BO_TILED =
flag
> >>>>
> >>>> Regarding to the omap_bo_new function, there are 2 places call it in
> >>>> the AOSP tree:
> >>>> #1 ./external/libkmsxx/kms++/src/omap/omapframebuffer.cpp
> >>>> #2 ./device/ti/beagle_x15/gpu/gralloc.am57x.so
> >>>>
> >>>> #1 seems not used in AOSP yet, and #2 is one blob binary we do not
> >>>> have the source for.
> >>>>
> >>>
> >>> I would bet on gralloc.am57x.so.
> >> yeah, that's my guess as well.
> >>
> >>>>> strace
> >>>>> would be your friend there. or gdb, or whatever tools are used on
> >>>>> android. Or put some printfs() in omap_bo_new() that output the PID=
 of
> >>>>> the calling process, etc.
> >>>>
> >>>> Thanks a lot for these great suggestions! Will use them when possibl=
e.
> >>>>
> >>>>>> And another question is that, since the userspace(libdrm) will be =
used
> >>>>>> to work with different kernel versions,
> >>>>>> like the old 4.14, 4.19, etc, do you think there will be problem t=
o
> >>>>>> pass  OMAP_BO_SCANOUT
> >>>>>> from the userspace side with the old kernels(which does not have t=
his change)?
> >>>>>> does this change need to be backported to the old kernel versions?
> >>>>>
> >>>>> There should not be any issue. The changes could be backported if o=
ne
> >>>>> hits the issues this $series is fixing, but there is no need.
> >>>>
> >>>> Thanks for the confirmation!
> >>>> I just boot-tested with adding OMAP_BO_SCANOUT in the omap_bo_new fu=
nction,
> >>>> and it worked with the current 4.14, 4.19, and the mainline kernels.
> >>>> # via adding line "flags =3D flags | OMAP_BO_SCANOUT" in the omap_bo=
_new function.
> >>>>
> >>>
> >>> sure, the point is that with this change *every* BO will be allocated=
 as
> >>> scanout BO, potentially leading to the above explained issues.
> >>
> >> get it.
> >>
> >>>>>>
> >>>>>> And the last question is that, omap_bo_new might be called by some
> >>>>>> property binaries what not everyone
> >>>>>> could get the source to update, for such case what's your suggesti=
ons?
> >>>>>>
> >>>>>
> >>>>> Hard to say without knowing what that library would be.
> >>>>>
> >>>>> When I hit issues with closed blobs, sometimes I reverse-engineer t=
hem
> >>>>> to fix the issue, example:
> >>>>>
> >>>>> https://github.com/maemo-leste/sgx-ddk-um/tree/master/dbm
> >>>>>
> >>>>> This is REed libdbm from sgx-ddk-um 1.17.4948957, that is responsib=
le
> >>>>> for allocating BOs (what omap_bo_new() does) but it uses DUMB buffe=
rs
> >>>>> API, instead of OMAP BO API.
> >>>>>
> >>>>> I guess you are using some older version of sgx-ddk-um, so you may =
fix
> >>>>> in similar way. Or binary patch.
> >>>>
> >>>> The blob binary that calls omap_bo_new is the gralloc.am57x.so here[=
2]:
> >>>> any suggestions with it?
> >>>> # sorry, I am not able to find out how you did the reverse-engineer
> >>>> work# with the dbm repository shared here,
> >>>> # not sure if you could give some tutorial steps for the similar
> >>>> reverse-engineer# work with gralloc.am57x.so
> >>>>
> >>>
> >>> Sorry, but it is like if you ask me to provide you with a tutorial on
> >>> how to do brain surgery :)
> >>>
> >>>> [2]: https://android.googlesource.com/device/ti/beagle-x15/+/refs/he=
ads/master/gpu/gralloc.am57x.so
> >>>>
> >>>
> >>> I investigated this a bit and it seems it calls omap_bo_new() in a
> >>> wrapper function like:
> >>>
> >>> bo =3D omap_bo_new(dev, -page_size & (size + page_size - 1), ((param5=
 &
> >>> 0x800000) !=3D 0) | OMAP_BO_WC | OMAP_BO_MEM_CONTIG);
> >>>
> >>> Didn't investigate further what param5 is, but it controls if
> >>> OMAP_BO_SCANOUT is passed to omap_bo_new or not.
> >>>
> >>> However, this library was not made with upstream kernel in mind, as
> >>> AFAIK OMAP_BO_MEM_CONTIG never made it upstream:
> >>>
> >>> https://yhbt.net/lore/all/2580272.MiZDHyRxZo@avalon/T/
> >>>
> >>> @Tomi - any comment?
> >>>
> >>> So, you have couple of options:
> >>>
> >>> 1. Ask TI for upstream-compatible library.
> >> check is in progress, but it would take quite a long time I guess
> >>> 2. Try to push OMAP_BO_MEM_CONTIG patch upstream.
> >> hmm, sounds like one impossible thing...
> >>> 3. Modify omap_bo_new() to something like:
> >>> .
> >>> #define OMAP_BO_MEM_CONTIG      0x00000008      /* only use contiguou=
s dma mem */
> >>> .
> >>> if (flags & OMAP_BO_MEM_CONTIG)
> >>>     flags |=3D OMAP_BO_SCANOUT;
> >>> .
> >>> This will not achieve exactly what OMAP_BO_MEM_CONTIG is supposed to =
do,
> >>> but should make it work, at least.
> >>
> >> This looks like the only doable thing at the moment, maybe one change
> >> needs to be submitted to the mesa/drm repository.
> >> I can submit a request on your #3 change to the mesa/drm repository
> >> for discussion after some check if you do not mind.
> >>
> >
> > I doubt mesa/drm will accept such hack, I think you will need to suppor=
t your drm clone (with the above fix) until TI fixes the closed library.
> >
>
>
> Hi all,
>
> Just got around to reading this thread. I work with the TI gralloc lib
> and can generate new versions as needed (I was probably the one who compi=
led
> the version you have now). I've wanted to have our gralloc layer open sou=
rce'd
> as there is nothing really propriety in it (and I re-wrote a lot of it al=
ready)
> and to avoid issues like this. But it interacts with the GPU code in some=
 places,
> so it's up to Imagination :(. The actual code in question if it helps is:
>
>         if(ui32Flags & PVRSRV_MEM_CACHED)
>                 flags &=3D ~OMAP_BO_CACHE_MASK;
>         else
>                 flags |=3D OMAP_BO_WC;
>
>         if (ui32Flags & PVRSRV_HAP_CONTIG)
>                 flags |=3D OMAP_BO_SCANOUT;
>
>         flags &=3D ~OMAP_BO_TILED_MASK;
>         flags |=3D 0x00000008;
>         flags |=3D OMAP_BO_WC;
>
>         bo =3D omap_bo_new(dev, size, flags);
>
> As you can see we use 0x00000008 (OMAP_BO_MEM_CONTIG) unconditionally.
> This was a hack added since even non-scanout buffers sometimes need
> to be contiguous (video decoder surfaces), but we had no way back
> then to communicate this to the gralloc layer. I think your best
> bet would be to modify the gralloc lib to not do that, or put it
> under the CONTIG check.
>
> If you tell me what the code should look like, I can rebuild the
> lib and post a copy.
>
> Long term, I'd like to start using DMA-BUF Heaps for CMA memory
> allocations in gralloc and elsewhere, then drop out the DMM/TILER
> support from OMAPDRM, since it never really belonged there in
> the first place (being a IOMMU unrelated to the display/GPU).
>
> Thanks,
> Andrew
>
>
> > Regards,
> > Ivo
> >
> >> Thanks,
> >> Yongqin Liu
> >>
> >>>>>>>> On Thu, 17 Feb 2022 at 23:29, Ivaylo Dimitrov
> >>>>>>>> <ivo.g.dimitrov.75@gmail.com> wrote:
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> On 17.02.22 =D0=B3. 14:46 =D1=87., Tomi Valkeinen wrote:
> >>>>>>>>>> Hi,
> >>>>>>>>>>
> >>>>>>>>>> On 19/01/2022 12:23, Ivaylo Dimitrov wrote:
> >>>>>>>>>>> On devices with DMM, all allocations are done through either =
DMM or
> >>>>>>>>>>> TILER.
> >>>>>>>>>>> DMM/TILER being a limited resource means that such allocation=
s will start
> >>>>>>>>>>> to fail before actual free memory is exhausted. What is even =
worse is
> >>>>>>>>>>> that
> >>>>>>>>>>> with time DMM/TILER space gets fragmented to the point that e=
ven if we
> >>>>>>>>>>> have
> >>>>>>>>>>> enough free DMM/TILER space and free memory, allocation fails=
 because
> >>>>>>>>>>> there
> >>>>>>>>>>> is no big enough free block in DMM/TILER space.
> >>>>>>>>>>>
> >>>>>>>>>>> Such failures can be easily observed with OMAP xorg DDX, for =
example -
> >>>>>>>>>>> starting few GUI applications (so buffers for their windows a=
re
> >>>>>>>>>>> allocated)
> >>>>>>>>>>> and then rotating landscape<->portrait while closing and open=
ing new
> >>>>>>>>>>> windows soon results in allocation failures.
> >>>>>>>>>>>
> >>>>>>>>>>> Fix that by mapping buffers through DMM/TILER only when reall=
y needed,
> >>>>>>>>>>> like, for scanout buffers.
> >>>>>>>>>>
> >>>>>>>>>> Doesn't this break users that get a buffer from omapdrm and ex=
pect it to
> >>>>>>>>>> be contiguous?
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> If you mean dumb buffer, then no, this does not break users as =
dumb
> >>>>>>>>> buffers are allocated as scanout:
> >>>>>>>>>
> >>>>>>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/=
omapdrm/omap_gem.c#L603
> >>>>>>>>>
> >>>>>>>>> If you mean omap_bo allocated buffers, then if users want
> >>>>>>>>> linear(scanout) buffer, then they request it explicitly by pass=
ing
> >>>>>>>>> OMAP_BO_SCANOUT.
> >>>>>>>>>
> >>>>>>>>> Ivo
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>
> >>>>
> >>>>
> >>
> >>
> >>



--=20
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android
