Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD61B3725A8
	for <lists+linux-omap@lfdr.de>; Tue,  4 May 2021 08:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbhEDGDT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 May 2021 02:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhEDGDT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 4 May 2021 02:03:19 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D37C6C061574
        for <linux-omap@vger.kernel.org>; Mon,  3 May 2021 23:02:24 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id e2so5489262ilr.1
        for <linux-omap@vger.kernel.org>; Mon, 03 May 2021 23:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ja8/Z/e8agzS7njvj4IHS25atnS4dBGqyZHCV02JPWo=;
        b=G1FDULufF/2hitNiCrFHgmA//2LfINxfvZ8z6eGRuSUz6MY1Zht+7/LuSojdQFb1rO
         j/1JeTWHpWsEbdjh+YJDHF3RUZrvTUOWjCLImI8v+mvMaiV5zUhwhQtn3L8CWYXvIN6A
         M2gc2Rp7rjPiLpvuK5m9uJHdI92bnmwNv0zXIsfg/aGCjE97Qt5/w3odXif8CdJ9rcAO
         gjsIzX+2Zv/9VgvF5uuWkUfliRtCYStaYUzsPrIYyK71OrOZEDJ35r1EarbEY2o/sNAJ
         I5z1uYCoXtSMlH4aiGz06j5dNeJgNfCuQqx/EnrZrHp1hPCqheJzI2AilQHckPph7L7X
         N2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ja8/Z/e8agzS7njvj4IHS25atnS4dBGqyZHCV02JPWo=;
        b=Kg4wK3WetXEKp8ItN0aEFhTVt/HyGeUnGH69IUunm/fNaRp8FpuVTZurotwKIi9ajI
         rjbLKw9LKEAW9O8QbE/yjE1FfXB6dvpHypFSbVxWiOM787kPlM0dfDo5wAKTZrVFhF2b
         SsNPF2fEI01mweoATmITCI8k0o6O1DxdT+P0VduFRinHaAMt6iLTyhkfhBLgtlqsIZfY
         JXuzLnqfo14RdaLoEcWFMc+2+HPidI7b4wUM270MJPHYxKzWw/hsYVLmwmh2+zWpSxuJ
         dsaueurOXj2vplNU1CrFcDLIN7r/mfHM1FOqFapjhihN/LvG04Kgi8K9q3xoQNuQoOv5
         SQ6w==
X-Gm-Message-State: AOAM533FkNYjazxmCrqQ6ZoeIxKTtunTx7aOQxIhMSxRGxnI0G+05OFS
        Dn9tx5wfj6dODHJWgWa3+lELOyVJMnRBusRuQv6KeqqIfC9T3w==
X-Google-Smtp-Source: ABdhPJywgvXsw36BZ1oTmLvto5sK6eIVxSaVn+t8eFgYHN13HxVnk0WDj5jHH9IaE5ol5fFesnx5GBR3X4bdpzSRn2I=
X-Received: by 2002:a05:6e02:1a8d:: with SMTP id k13mr308794ilv.31.1620108144099;
 Mon, 03 May 2021 23:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <CACLAQJFHyYESWO0_N8Qin8eY2moswN-eeWi5bHcRWhCJpjsjjg@mail.gmail.com>
 <YI/ONvCE4RuUV6SC@atomide.com>
In-Reply-To: <YI/ONvCE4RuUV6SC@atomide.com>
From:   Mighty M <mightymb17@gmail.com>
Date:   Tue, 4 May 2021 11:32:12 +0530
Message-ID: <CACLAQJH6tgaSqH=hs-=WEOWmD6ozkkRkL_dm0MBNV5qiPHFveg@mail.gmail.com>
Subject: Re: Performance difference in mainline and downstream
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, May 3, 2021 at 3:49 PM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * Mighty M <mightymb17@gmail.com> [210430 07:49]:
> > I have a Samsung Galaxy Tab 2 which has an OMAP 4430 clocked at 1Ghz,
> > with that there is quite some difference in performance when comparing
> > the mainline and downstream kernels. To confirm my suspicions I ran
> > UnixBench(https://github.com/kdlucas/byte-unixbench) on both of them,
> > the results are as follows -
> > 1) Downstream (running SailfishOS) - Kernel Source -
> > https://github.com/CyanogenMod/android_kernel_samsung_espresso10, I
> > get a result of 580.4 in dual-core and 292.9 in single core. I
> > compiled UnixBench manually.
> > 2) Mainline (running PostMarketOS) - Kernel Source -
> > https://github.com/MightyM17/linux_openpvrsgx/tree/letux-pvrsrvkm-5.12-rc1,
> > when using UnixBench package from PostMarketOS repo, I get a score of
> > 352.7 dual core and 192.7 single core, and compiling it myself and
> > then running gives the score 415.1 dual core and 209.9 single core.
> >
> > The downstream scores are quite high even beating Droid 4 which has
> > CPU clocked at 1.2Ghz when Tab 2 has it at 1 GHz.
> >
> > Why is there so much difference in mainline and downstream and what
> > can be done to improve the performance.
>
> If you have a good test case, it would be nice to narrow down the
> performance issue and fix it. My guess is that the following might
> help with the mainline Linux kernel built with omap2plus_defconfig:
>
> - Disable CONFIG_DEBUG in .config
>
> - Disable CONFIG_ARCH_OMAP2 in .config to disable the build options
>   for ARMv6
>
> If the above does not help, then let's look further in the L2
> settings for example.
>
> Regards,
>
> Tony
>
>

Hello, CONFIG_ARCH_OMAP2 is already disabled in my .config and I
couldnt find CONFIG_DEBUG.
https://pastebin.ubuntu.com/p/qKYpCPCk5Q/ here is my .config file.
Anyways it seems we need to look further now.
Thanks!
