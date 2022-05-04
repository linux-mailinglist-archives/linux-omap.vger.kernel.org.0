Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80F51519B68
	for <lists+linux-omap@lfdr.de>; Wed,  4 May 2022 11:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347129AbiEDJUu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 May 2022 05:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347131AbiEDJTe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 May 2022 05:19:34 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9372224F0E
        for <linux-omap@vger.kernel.org>; Wed,  4 May 2022 02:15:47 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id f4so879543iov.2
        for <linux-omap@vger.kernel.org>; Wed, 04 May 2022 02:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=EoHS3N29jMdzcnaJzMfO8SjKzAgPygoyLPnmY++eJ7c=;
        b=gH8bjcBjP/JA2GpcjFyhWBZuYrjcde9p1JaF1y1P15Np9apDYKDnEeJjbJF6NhNhMU
         JWkr6Y+3IBu+tagAI4UcruNjGMifXYaPkY6+ngW+fnO+pKPYsvB0Ht2Q2imb4fLZx+hd
         LhJAyGG2eyKCwMhsBZVkwSk2wvHCOziNk23Epo/QGH1ac82IUgUy+kRXAzQeI0w7a6nu
         8nFpRJZmHwd9uO+R9DpAgM6/02BFlvQOSCnd1o6K3VOtSHi3XeyQkOSYJY6fz0vyjmTE
         Cfqy+lD7rwaz2IfvU3xQBvdQlK/zKWDuosfyDDXjWTilCF/YzWyNh8Pf/H8ACbS5JAjQ
         C/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=EoHS3N29jMdzcnaJzMfO8SjKzAgPygoyLPnmY++eJ7c=;
        b=WOpAnKbIYoS9Qc3EIkQPLAOje9j8HH6n2rj19/YUHuH7kNZBu1ZpqBWrzbQeZlLXuT
         qBj6qU75km/QNQBkP5Z+xznZDS8e4ciIwypdZXHEnT2OwGUbN6AkBCQUQ0YrMQ3BEB12
         3RQ7bAGBP9HgACncG3Shc9cZK9cNc4mSLvBy3n8tNduDKDrwgPNshpG7EgU+sfYRvk51
         eH/EGz+0Ber8XGPiBOxlRRi9SJmOENxho395IZg+OTnFSkFr2qTtT0mn21y0z6ds6lEP
         lR4wT2tlSYEnZjQboqW29Vi41fJye5tRYbao+rBSDdAxeD7Tfg67h5V0g3sxQ8yZq6tO
         YN6g==
X-Gm-Message-State: AOAM533JM5Oy/aDzTrKYu/Ro5oRS+3Oi+dKJR+ZgFQSfxeuetzSMDTTU
        BjfOvkMdcBHfXJp/hemzLp+YTC+3gpZI6c8EUe/JsJ+UcFY=
X-Google-Smtp-Source: ABdhPJzh7VgyZSQWvEnqVmjH63H6yVi0+Oo+NVlpn4KEla4113GErADnYBaiuglEPLaamsBpmavQcHf8J8m27iS++SA=
X-Received: by 2002:a02:230a:0:b0:32b:6f71:4411 with SMTP id
 u10-20020a02230a000000b0032b6f714411mr5147640jau.214.1651655746782; Wed, 04
 May 2022 02:15:46 -0700 (PDT)
MIME-Version: 1.0
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Wed, 4 May 2022 11:12:13 +0200
Message-ID: <CAGm1_ktMOwwhhgVWj3DpCib-WpRzhkjE4d4DN74mz6kdwJk6BA@mail.gmail.com>
Subject: Linux 5.18.x: sdhci issue
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>
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

Hi Tony, all,

During the kernel boot I see the following error. The device is still
working afterwards. 5.17.5 shows the same behavior. Is this a known
issue?

[    3.734570] sdhci-omap 48060000.mmc: Got CD GPIO
[    3.739989] INFO: trying to register non-static key.
[    3.744991] The code is fine but needs lockdep annotation, or maybe
[    3.751286] you didn't initialize this object before use?
[    3.756707] turning off the locking correctness validator.
[    3.762221] CPU: 0 PID: 8 Comm: kworker/u2:0 Not tainted 5.18.0-rc5 #1
[    3.768787] Hardware name: Generic AM33XX (Flattened Device Tree)
[    3.774913] Workqueue: events_unbound async_run_entry_fn
[    3.780283]  unwind_backtrace from show_stack+0x10/0x14
[    3.785555]  show_stack from dump_stack_lvl+0x58/0x70
[    3.790643]  dump_stack_lvl from register_lock_class+0x4ec/0x55c
[    3.796695]  register_lock_class from __lock_acquire+0x60/0x2bd4
[    3.802738]  __lock_acquire from lock_acquire.part.0+0xb0/0x248
[    3.808695]  lock_acquire.part.0 from _raw_spin_lock_irqsave+0x4c/0x68
[    3.815265]  _raw_spin_lock_irqsave from sdhci_init+0x34/0xf4
[    3.821051]  sdhci_init from sdhci_runtime_resume_host+0x3c/0x1bc
[    3.827180]  sdhci_runtime_resume_host from
sdhci_omap_runtime_resume+0x108/0x110
[    3.834710]  sdhci_omap_runtime_resume from __rpm_callback+0x3c/0x148
[    3.841197]  __rpm_callback from rpm_callback+0x50/0x54
[    3.846453]  rpm_callback from rpm_resume+0x518/0x71c
[    3.851534]  rpm_resume from __pm_runtime_resume+0x50/0x68
[    3.857052]  __pm_runtime_resume from sdhci_omap_probe+0x1e4/0x7a8
[    3.863270]  sdhci_omap_probe from platform_probe+0x58/0xbc
[    3.868886]  platform_probe from really_probe.part.0+0x9c/0x290
[    3.874843]  really_probe.part.0 from __driver_probe_device+0xa0/0x138
[    3.881409]  __driver_probe_device from driver_probe_device+0x30/0x10c
[    3.887975]  driver_probe_device from __device_attach_driver+0xb0/0xf8
[    3.894540]  __device_attach_driver from bus_for_each_drv+0x80/0xd0
[    3.900845]  bus_for_each_drv from __device_attach_async_helper+0xac/0xe0
[    3.907672]  __device_attach_async_helper from async_run_entry_fn+0x20/0xb0
[    3.914675]  async_run_entry_fn from process_one_work+0x284/0x72c
[    3.920811]  process_one_work from worker_thread+0x28/0x4b0
[    3.926418]  worker_thread from kthread+0xe4/0x104
[    3.931243]  kthread from ret_from_fork+0x14/0x28
[    3.935977] Exception stack(0xd0035fb0 to 0xd0035ff8)
[    3.941056] 5fa0:                                     00000000
00000000 00000000 00000000
[    3.949274] 5fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    3.957491] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    3.964359] sdhci-omap 48060000.mmc: supply pbias not found, using
dummy regulator
[    3.972468] sdhci-omap 48060000.mmc: supply vqmmc not found, using
dummy regulator
[    3.982478] sdhci-omap 481d8000.mmc: supply pbias not found, using
dummy regulator
[    3.990665] sdhci-omap 481d8000.mmc: supply vqmmc not found, using
dummy regulator

Regards,
Yegor
