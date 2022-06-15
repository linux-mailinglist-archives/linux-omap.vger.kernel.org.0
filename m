Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9389E54C213
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jun 2022 08:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237456AbiFOGpQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jun 2022 02:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240224AbiFOGpP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Jun 2022 02:45:15 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D86DD45AC9;
        Tue, 14 Jun 2022 23:45:14 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id u99so18846512ybi.11;
        Tue, 14 Jun 2022 23:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=56NRhtnhSNgbv46eTRV22wvonlvUUcBjBO9FfY0p8L8=;
        b=GVKbdo7IThWyJ6C0EMZSyJ5jL8qDACHG5Hzs8PZMlqJDoKKeILXaG5FiSFXBCy6oBY
         FZ4IVAAl4JeScizKVVIKzLH4CWlv8Hz6Q5b5gCdXl3jyIq0wUuo1n8XaBl9bVbVoPsX0
         U2Eyoq1hmChln1p8c5l8gABLb6W9DWDgEpg47uRXVdsn3bFtRj3wN9Rk3+EX38yIQ0vo
         AKjHdtJtpa6eg8lA/RM4SFcJhKv8pENK7CdE/PmS5NVKS9g+iyE4ZLC/JM0LmS/WuybF
         q+RylJawIQS61RdBDCClWLqBRcnbCH0LVWSTMtzOznjNNyaNP3ZnP8aT3NF/R44zdaxR
         O43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=56NRhtnhSNgbv46eTRV22wvonlvUUcBjBO9FfY0p8L8=;
        b=WNaXJUykI+RDw4hcvb7Utw+MtiV8/HCPaxvhhWEYG4Hfewptoc8hKdjQYyjgGT+YHg
         06tEn/vyQPp0V+6ALy0Dw3TguXoenY+sKSvADrMPtVytne97g4kyrtLu6ZTGYpT1EWEY
         eokWnpNmvQDQJWDat3/mU3v0zhjX5FhivtWa/xC2tckiM6YE22/c9NSsWrWJOJJTR1Pr
         aePyIcHwrwhembv3MoCgUS2HxsK0PljyFaHezaxnDelUEdJNjXzE1OIC8NCpzR70zpJc
         qWzibg6axlsDaTLLJUwLbTRYoOWpxA0wWc6UpRUrbbgBmYW/pxZsBhO/iNIBcB2wV2aF
         skiA==
X-Gm-Message-State: AJIora+9qr7a5TJGbavtwS7L3oVyASkGXwJevT92hTbNW+yrmb1GO4bS
        HbH/M8FxyVkX+iZuY86TUOyhnbPPEWvK9zL4fVg=
X-Google-Smtp-Source: AGRyM1s4DEULRVf3TUuf+6nddF8XcVaVV9BFCEalxKoEvDb77l2oCgXbTtWPCxTldUlcQi5jHBzMwGPCwc5Ral6fLKE=
X-Received: by 2002:a25:eb08:0:b0:664:3fbd:f9c9 with SMTP id
 d8-20020a25eb08000000b006643fbdf9c9mr8326649ybs.88.1655275514124; Tue, 14 Jun
 2022 23:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ktMOwwhhgVWj3DpCib-WpRzhkjE4d4DN74mz6kdwJk6BA@mail.gmail.com>
 <YnNagtAtSudCum75@atomide.com>
In-Reply-To: <YnNagtAtSudCum75@atomide.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Wed, 15 Jun 2022 08:45:03 +0200
Message-ID: <CAGm1_ktACExigtZUYFWria8=cxhy6x6vDGpLcaZAvnE9G3Bz_A@mail.gmail.com>
Subject: Re: Linux 5.18.x: sdhci issue
To:     Tony Lindgren <tony@atomide.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
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

Hi Tony, Ulf,

On Thu, May 5, 2022 at 7:03 AM Tony Lindgren <tony@atomide.com> wrote:
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

This is my bisect result:

f433e8aac6b94218394c6e7b80bb89e4e79c9549 is the first bad commit
commit f433e8aac6b94218394c6e7b80bb89e4e79c9549
Author: Tony Lindgren <tony@atomide.com>
Date:   Fri Oct 15 13:47:18 2021 +0300

    mmc: sdhci-omap: Implement PM runtime functions

    Implement PM runtime functions and enable autosuspend.

    Note that we save context in probe to avoid restoring invalid context
    on the first resume. For system suspend, we have the new PM runtime
    functions do most of the work.

    Signed-off-by: Tony Lindgren <tony@atomide.com>
    Link: https://lore.kernel.org/r/20211015104720.52240-5-tony@atomide.com
    Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

:040000 040000 52e18e4301299b678068dceb061cb5cab2b9e1c2
3a23df57d41d54132ca5dac0e8c6d189d5dc3773 M      drivers

Yegor

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
> > [    3.874843]  really_probe.part.0 from __driver_probe_device+0xa0/0x138
> > [    3.881409]  __driver_probe_device from driver_probe_device+0x30/0x10c
> > [    3.887975]  driver_probe_device from __device_attach_driver+0xb0/0xf8
> > [    3.894540]  __device_attach_driver from bus_for_each_drv+0x80/0xd0
> > [    3.900845]  bus_for_each_drv from __device_attach_async_helper+0xac/0xe0
> > [    3.907672]  __device_attach_async_helper from async_run_entry_fn+0x20/0xb0
> > [    3.914675]  async_run_entry_fn from process_one_work+0x284/0x72c
> > [    3.920811]  process_one_work from worker_thread+0x28/0x4b0
> > [    3.926418]  worker_thread from kthread+0xe4/0x104
> > [    3.931243]  kthread from ret_from_fork+0x14/0x28
> > [    3.935977] Exception stack(0xd0035fb0 to 0xd0035ff8)
> > [    3.941056] 5fa0:                                     00000000
> > 00000000 00000000 00000000
> > [    3.949274] 5fc0: 00000000 00000000 00000000 00000000 00000000
> > 00000000 00000000 00000000
> > [    3.957491] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > [    3.964359] sdhci-omap 48060000.mmc: supply pbias not found, using
> > dummy regulator
> > [    3.972468] sdhci-omap 48060000.mmc: supply vqmmc not found, using
> > dummy regulator
> > [    3.982478] sdhci-omap 481d8000.mmc: supply pbias not found, using
> > dummy regulator
> > [    3.990665] sdhci-omap 481d8000.mmc: supply vqmmc not found, using
> > dummy regulator
> >
> > Regards,
> > Yegor
