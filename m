Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C51C539D6D
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jun 2022 08:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236786AbiFAGtj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jun 2022 02:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233201AbiFAGti (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Jun 2022 02:49:38 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B68068FFBE;
        Tue, 31 May 2022 23:49:37 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-30c2f288f13so8057817b3.7;
        Tue, 31 May 2022 23:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tn4Et6t93FSUGeem3X7ovetc352Wa8MqQtL6j/+Jl2w=;
        b=NX/eMVpqPgoS5ta99ANSUfXB8rkjp+D9lNgyt2QCWXY81tKFIj6M9TT+pH9GNgAQ7f
         8mWcGx+4/OTzHRSQphCQqXUpkLixASW3D934ODJfUhbVBKOhIuhBLH8Dy//i4J+AMACJ
         RYFE+yuLMwe0yqr+fdM7pdIFWVGr6C4AphdzpYwhs9OKR344coez0mEEE4xV2IaiD+qZ
         n8NCNcD9bdqvyqwX5ZhXs1lDd07MOZvD1OnebO+2SlDQpHP0tbQgJ2y/RxHdSRyMrOKU
         /u1dEO2bF0Y9gUwZJfsOa8R1c+Bf13WNh/2sp/jZIEvPOR+68CwZp5IgEWTQI4YOaW31
         cY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tn4Et6t93FSUGeem3X7ovetc352Wa8MqQtL6j/+Jl2w=;
        b=5CZyavTeOyUwBwlMAtdwe61FjowFsV0Hjy306oZ56q4jX5Bayk11Biffp5G1/2fryi
         1ZL3/WqArlVtI+ZB7ausCxRzG7CDQYpfQJTlnpNN6ACxJi0ATwK46hX5I7e5Qi00ug8E
         ecqENVKhQ3u41skcoEjLevncRcQkf62nml9gwFC54K1bZ6s6lrfLv5l+lXwdJQBXNR32
         kF/kvFs47aCIoO9jfzHc27lQZzK9Xb01QWNqieiK37KW5vAAjafIO+GVv+5A0va+VqOQ
         C9+Twq6U557EaT4pX5v65gUmAZhj6FcRrivxDlwLUKrrTLcERnpcLVMJqDkA1ZlN4FAj
         4iJQ==
X-Gm-Message-State: AOAM53074PLPCA2JJPZ08gEjcKTqbGoi1rqlTEByUZEnN1/w/HeAPVue
        /PYbIXPhEFnHMasTKjXEl4WkGP5lXDOunN/rS0U=
X-Google-Smtp-Source: ABdhPJx3tHxRf08E3gMq3C+ZOIKMccYhm0ULmHf3lfdxJldc7wRtCVs46Tnou/OQbCfsPK9CEqnzl6YYBRHEuZudM1I=
X-Received: by 2002:a81:488c:0:b0:302:549f:ffbc with SMTP id
 v134-20020a81488c000000b00302549fffbcmr33359120ywa.495.1654066176872; Tue, 31
 May 2022 23:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ktMOwwhhgVWj3DpCib-WpRzhkjE4d4DN74mz6kdwJk6BA@mail.gmail.com>
 <YnNagtAtSudCum75@atomide.com> <CAGm1_kv6wYV6ccrGJuGaeR=rffajEBB6H1Mt17iXJeMJg0JozQ@mail.gmail.com>
 <CAK8P3a1xxODV3ak-JgqBmVvJTUG6W8eQ+_B8ZcbYFAhP+4o2EQ@mail.gmail.com>
 <CAGm1_kuYGMAbO0aB52hRwZp6qALALQ4LvMkNuC=F9Pk4P5BdXg@mail.gmail.com> <CAK8P3a2kEWU+rS55QXwOq04pRv2oEQAdqcGsDj1or04DQ4Uqag@mail.gmail.com>
In-Reply-To: <CAK8P3a2kEWU+rS55QXwOq04pRv2oEQAdqcGsDj1or04DQ4Uqag@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Wed, 1 Jun 2022 08:49:25 +0200
Message-ID: <CAGm1_ksYy=fueypVJDfVhf=J-cY8r1yJpBYO9cEK5_CTfn5xQA@mail.gmail.com>
Subject: Re: Linux 5.18.x: sdhci issue
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tony Lindgren <tony@atomide.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jun 1, 2022 at 8:45 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Jun 1, 2022 at 8:08 AM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> > On Tue, May 31, 2022 at 11:23 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Tue, May 31, 2022 at 10:28 AM Yegor Yefremov
> > >
> > > +       WARN_ON_ONCE(memory_intersects(_stext, _etext, buf, size));
> > > +       WARN_ON_ONCE(memory_intersects(__start_rodata, __end_rodata,
> > > buf, size));
> > > +       WARN_ON_ONCE(object_is_on_stack(buf));
> > > +       WARN_ON_ONCE(is_vmalloc_or_module_addr(buf));
> > > +
> > >         /* Do the bulk of the transfer using block mode (if supported). */
> > >         if (func->card->cccr.multi_block && (size > sdio_max_byte_size(func))) {
> > >                 /* Blocks per command is limited by host count, host transfer
> > >
> > >  Does that show something new?
> > >
> > > If this is a block device, the change won't help, but I can't find a good place
> > > to hook into that at the moment. mmc_mq_queue_rq() might work, but
> > > I think that is still called asynchronously.
> >
> > No, the patch provides the same output.
>
> Can you say what devices are attached to the mmc controller? Is it
> an eMMC block device, an SDIO device, or both?

From DTS point of view: MMC and WiFi (SDIO). Physically, only MMC
(removable SDcard).

Yegor
