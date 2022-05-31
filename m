Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56CC9538D0D
	for <lists+linux-omap@lfdr.de>; Tue, 31 May 2022 10:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244909AbiEaImx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 31 May 2022 04:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234948AbiEaImv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 31 May 2022 04:42:51 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39DF260B81;
        Tue, 31 May 2022 01:42:49 -0700 (PDT)
Received: from mail-yb1-f172.google.com ([209.85.219.172]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M28O9-1nxtGj0CFt-002bfE; Tue, 31 May 2022 10:42:48 +0200
Received: by mail-yb1-f172.google.com with SMTP id g4so9069655ybf.12;
        Tue, 31 May 2022 01:42:47 -0700 (PDT)
X-Gm-Message-State: AOAM531uxcvy6RsXI37Mhf++U9j16MFQxH4jsDEirPs0ZP38RuywoJQT
        XQbM/e0QowhX4uPHkNDYuxnqv7ZjCpdIVqVZA7k=
X-Google-Smtp-Source: ABdhPJzMbwQ60cNQw5N2yAxTS00a0cWoqK9kLQPXsSd9Xm9YHToypB7bOmry3YTLzRG+QB4XB8L1LgZHUx7273dPIeU=
X-Received: by 2002:a25:31c2:0:b0:641:660f:230f with SMTP id
 x185-20020a2531c2000000b00641660f230fmr56946945ybx.472.1653986566762; Tue, 31
 May 2022 01:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ktMOwwhhgVWj3DpCib-WpRzhkjE4d4DN74mz6kdwJk6BA@mail.gmail.com>
 <YnNagtAtSudCum75@atomide.com>
In-Reply-To: <YnNagtAtSudCum75@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 31 May 2022 10:42:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3JS3GWEA_A9oCyWX7msxHwFObnKi_1=U_FMPNOV=f6qg@mail.gmail.com>
Message-ID: <CAK8P3a3JS3GWEA_A9oCyWX7msxHwFObnKi_1=U_FMPNOV=f6qg@mail.gmail.com>
Subject: Re: Linux 5.18.x: sdhci issue
To:     Tony Lindgren <tony@atomide.com>
Cc:     Yegor Yefremov <yegorslists@googlemail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:B9tghU71wK3vs6NrCl+s+6AYSWcjKYiaTHzEgjQ1/dPlZ4eNF/u
 jdXwhGBRAN6s9j+DnoAEN6XWIOoUD/D2j196g1j0lyPcIlAuZqN8SP0K765HAo8KQLp4hMF
 0XjSkPQTGMRktoziInkouOKO58XveHsuqNtRTCk5L9oJtvqp5EUpMA0E5De7yyhU+bN2tMM
 Tz+zn8Mic8HAqpdk8tnNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jzgbv762Esw=:LmvyDZPWhXwyZCc+9TEhWz
 f5NsrGr9EUJGcVEiP0L+NDtE+G1bn5yglz9pi2tnRrYCii1Se61zIwqIGuvjcObeWrcjG6z4Z
 jYwjssTlpMc1XrGVoKhDtJ1ZtkNJWGNX9ia4EnGz056ygiMOgaM2OQ98LGNmbRKMmqOMhrtU1
 USYcPs2WA7QAC1wy3zcRFNLVHM4zuFu0O34qWof4lC4JYQ45735vSBWmE+TxzkenGOqOTzHZD
 iv0MycHRP7dFl/dEltsTLGYy0k2TUVV1jmuHiAGx4Oe0smxBl1z2NOXVhsFz0sEeCNADZlf0p
 sdVZIf5uvrnW5aJjAUunfqqk/fOIVfcBB8yWI2reS4qe0rf95gw4W3tSSekh928NDItPalNxh
 COuPSMtNK7QGnKlgZiUjj7QW2x3n30J6dztBdQ8Z+50KnvujhK24VxxLZUdxWoZgkxPH5f6m8
 Wyf3ANH1uqOYMQfr8CewMc/ZA85mNoBhCtBYxmFs9j7YF+ZVFeg63JcG4waNhtAAjtraguDFk
 +JW/tmJreCTKzf945Rutrel7fZkVNxn/3C8QhpofgDLcefFDolXqBU5OWU7o9xCkTZqSUlNRr
 Am3kqaXa4imStRSVXLQ1aCkRIm/4iX46luYR2KiTBJN5uID4aR5YFUfKiAznAHGiu6A7ePUXb
 kr53S91p03lHR4Gw7tQWEGh+FqcgHhicD4tCM+pjskWPpX+rdKswLzC6ytkwlkO9MpYkMLDmw
 XGflyELwwXucBMku1JjycR/1LUIgEQlhjkXAs/x7Iv/wkjSO3n4YCyNje8mTDCN2XNIFlKUlX
 0hwL1kGcOUwpZmFUVXzIDnaq8YoFhYuyO85WdDYXNF3lGh2VrEAxe0qH/0H/kFG+5jJyowvAx
 jhKLQ5cnENbATq9GWHAA==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 5, 2022 at 7:02 AM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * Yegor Yefremov <yegorslists@googlemail.com> [220504 09:12]:
> > Hi Tony, all,
> >
> > During the kernel boot I see the following error. The device is still
> > working afterwards. 5.17.5 shows the same behavior. Is this a known
> > issue?
>
> Thanks for reporting it, I was not aware of this one. Might be worth
> bisecting. Adding linux-mmc and Ulf.
>
> Regards,
>
> Tony
>
> > [    3.734570] sdhci-omap 48060000.mmc: Got CD GPIO
> > [    3.739989] INFO: trying to register non-static key.
> > [    3.744991] The code is fine but needs lockdep annotation, or maybe
> > [    3.751286] you didn't initialize this object before use?
> > [    3.756707] turning off the locking correctness validator.
> > [    3.762221] CPU: 0 PID: 8 Comm: kworker/u2:0 Not tainted 5.18.0-rc5 #1
> > [    3.768787] Hardware name: Generic AM33XX (Flattened Device Tree)
> > [    3.774913] Workqueue: events_unbound async_run_entry_fn
> > [    3.780283]  unwind_backtrace from show_stack+0x10/0x14
> > [    3.785555]  show_stack from dump_stack_lvl+0x58/0x70
> > [    3.790643]  dump_stack_lvl from register_lock_class+0x4ec/0x55c
> > [    3.796695]  register_lock_class from __lock_acquire+0x60/0x2bd4
> > [    3.802738]  __lock_acquire from lock_acquire.part.0+0xb0/0x248
> > [    3.808695]  lock_acquire.part.0 from _raw_spin_lock_irqsave+0x4c/0x68
> > [    3.815265]  _raw_spin_lock_irqsave from sdhci_init+0x34/0xf4
> > [    3.821051]  sdhci_init from sdhci_runtime_resume_host+0x3c/0x1bc
> > [    3.827180]  sdhci_runtime_resume_host from
> > sdhci_omap_runtime_resume+0x108/0x110
> > [    3.834710]  sdhci_omap_runtime_resume from __rpm_callback+0x3c/0x148
> > [    3.841197]  __rpm_callback from rpm_callback+0x50/0x54
> > [    3.846453]  rpm_callback from rpm_resume+0x518/0x71c
> > [    3.851534]  rpm_resume from __pm_runtime_resume+0x50/0x68
> > [    3.857052]  __pm_runtime_resume from sdhci_omap_probe+0x1e4/0x7a8
> > [    3.863270]  sdhci_omap_probe from platform_probe+0x58/0xbc
> > [    3.868886]  platform_probe from really_probe.part.0+0x9c/0x290

The problem is that sdhci_omap_probe() calls pm_runtime_enable()
before calling sdhci_setup_host(), so it's not in the correct state at this
point. One could get rid of the warning by moving the spin_lock_init()
from sdhci_setup_host() to sdhi_alloc_host(), but I suspect the problem
is in the omap part, and it would still be wrong to do the resume first.

       Arnd
