Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63A273739CE
	for <lists+linux-omap@lfdr.de>; Wed,  5 May 2021 14:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbhEEMFL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 May 2021 08:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232911AbhEEMFJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 May 2021 08:05:09 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D612C061574
        for <linux-omap@vger.kernel.org>; Wed,  5 May 2021 05:04:13 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id p11so1383124iob.9
        for <linux-omap@vger.kernel.org>; Wed, 05 May 2021 05:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sa4gGnatpFPgFeIeFOrEjuxWwi1DtsuBKQhEsi8llps=;
        b=ukaWmJJImwBK8f5EL+j/w1/I2a40hZVNUyhAh2Jasnw9+xp8O97pekgWBtdnLmf7j9
         Utl3X3x/1jQ+vlmk0WeBos82y5T4lOOJmw9bYIf8hTJA7uGIETSccDtXH9lZ4cTIahSp
         E574XsDu4yb0UTo2T/7TjVHfeTSELFRkB9/qJHmjXN2dwe9RVmouuZd6rgXucbyHf4lW
         OQZoS0jLYVZd3aVaFLG1HgXcpDI5stcFlGkP1i5Ii8Osv/nSFh7JWDpto1aPJ1bRJvm3
         SBi+MYe73TkPRdzIMKEtrNawTyf6tqJoBCYvph9zeg+A9F+j6R/p6TpYdc8sLRLydMA+
         waJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sa4gGnatpFPgFeIeFOrEjuxWwi1DtsuBKQhEsi8llps=;
        b=IHu3zMbDuOnvYJXdLUbY4I+Td18p1tx2r/qW4Ov/fG4wpimhibMm92eswMpB3OqqMG
         Qwh21DhrkLLAyCgXIluZEfgMAOHqK2Z4lq10m7JCwIqsHFIS0Bv3Ncgw0Ia1lawMK+/6
         SIWMloF0T9IEJj0C0DQ34C/arI1x6LDJDJ2px3KLRUiP+v16uzT5XzQAc3iSvLQfREpC
         O6bqPiyVaYP+wKDp4us1RrRBTJL57uiuAybXWY+Vou2B6LbqMiHToWaHsiTnncXruI75
         izKD0KPDjPuTVBx2Yr6L1zsaDsO+bp0MOQ4BlfJK4mtrH9pc9M6slamV0e5Y09LGDNOd
         6Qzw==
X-Gm-Message-State: AOAM533rJjqOOAV7T0E0Vmqp+op8aAX03IalsnV0N4LaPQYOd/YY/xkd
        WtFUUJQHz4iWfo367xpwADbtpWxTbQ3ZyJOpKE81Yvw0xhg=
X-Google-Smtp-Source: ABdhPJypHhANRqosLNk2yGZ+DKTmUMtZohGiDJGTtfO5LQCDSLAd9dz9GAN/SvhUk9UrwwvB6vyl290QIIwxDRCx43I=
X-Received: by 2002:a05:6638:3010:: with SMTP id r16mr29236338jak.126.1620216252644;
 Wed, 05 May 2021 05:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <CACLAQJFHyYESWO0_N8Qin8eY2moswN-eeWi5bHcRWhCJpjsjjg@mail.gmail.com>
 <YI/ONvCE4RuUV6SC@atomide.com> <CACLAQJH6tgaSqH=hs-=WEOWmD6ozkkRkL_dm0MBNV5qiPHFveg@mail.gmail.com>
 <YJFDHfRc1Q02gh/k@atomide.com> <20210504184824.d24a29c4fdb4c807b54f3d33@uvos.xyz>
In-Reply-To: <20210504184824.d24a29c4fdb4c807b54f3d33@uvos.xyz>
From:   Mighty M <mightymb17@gmail.com>
Date:   Wed, 5 May 2021 17:34:01 +0530
Message-ID: <CACLAQJG0pb5vRqig96Lks-dv6Ju7ykAXWGb2ZogeerMFUEtFsQ@mail.gmail.com>
Subject: Re: Performance difference in mainline and downstream
To:     Dev Null <devnull@uvos.xyz>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 4, 2021 at 10:18 PM Dev Null <devnull@uvos.xyz> wrote:
>
> armv7h in general also has some of the secuity mitigations around
> speculative execution / branch prediction.
>
> no clue what the cumulative inpact of these is on omap4 but the vendor
> kernel very likely dosent have any
>
> On Tue, 4 May 2021 15:50:37 +0300
> Tony Lindgren <tony@atomide.com> wrote:
>
> > * Mighty M <mightymb17@gmail.com> [210504 06:02]:
> > > Hello, CONFIG_ARCH_OMAP2 is already disabled in my .config and I
> > > couldnt find CONFIG_DEBUG.
> >
> > Sorry I meant CONFIG_DEBUG_KERNEL :)
> >
> > Try first dropping these lines from your .config:
> >
> > CONFIG_EXPERT=y
> > CONFIG_DEBUG_KERNEL=y
> >
> > Regards,
> >
> > Tony
>
>
> --
> Dev Null <devnull@uvos.xyz>

Well that might be a proper reason, also its running on 1GB /system
partition which might be a factor as well
