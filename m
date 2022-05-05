Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8A1151B750
	for <lists+linux-omap@lfdr.de>; Thu,  5 May 2022 07:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242997AbiEEFGl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 May 2022 01:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbiEEFGk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 May 2022 01:06:40 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 154E448897;
        Wed,  4 May 2022 22:03:00 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 651BB80B0;
        Thu,  5 May 2022 04:59:39 +0000 (UTC)
Date:   Thu, 5 May 2022 08:02:58 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>, linux-mmc@vger.kernel.org
Subject: Re: Linux 5.18.x: sdhci issue
Message-ID: <YnNagtAtSudCum75@atomide.com>
References: <CAGm1_ktMOwwhhgVWj3DpCib-WpRzhkjE4d4DN74mz6kdwJk6BA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_ktMOwwhhgVWj3DpCib-WpRzhkjE4d4DN74mz6kdwJk6BA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Yegor Yefremov <yegorslists@googlemail.com> [220504 09:12]:
> Hi Tony, all,
> 
> During the kernel boot I see the following error. The device is still
> working afterwards. 5.17.5 shows the same behavior. Is this a known
> issue?

Thanks for reporting it, I was not aware of this one. Might be worth
bisecting. Adding linux-mmc and Ulf.

Regards,

Tony

> [    3.734570] sdhci-omap 48060000.mmc: Got CD GPIO
> [    3.739989] INFO: trying to register non-static key.
> [    3.744991] The code is fine but needs lockdep annotation, or maybe
> [    3.751286] you didn't initialize this object before use?
> [    3.756707] turning off the locking correctness validator.
> [    3.762221] CPU: 0 PID: 8 Comm: kworker/u2:0 Not tainted 5.18.0-rc5 #1
> [    3.768787] Hardware name: Generic AM33XX (Flattened Device Tree)
> [    3.774913] Workqueue: events_unbound async_run_entry_fn
> [    3.780283]  unwind_backtrace from show_stack+0x10/0x14
> [    3.785555]  show_stack from dump_stack_lvl+0x58/0x70
> [    3.790643]  dump_stack_lvl from register_lock_class+0x4ec/0x55c
> [    3.796695]  register_lock_class from __lock_acquire+0x60/0x2bd4
> [    3.802738]  __lock_acquire from lock_acquire.part.0+0xb0/0x248
> [    3.808695]  lock_acquire.part.0 from _raw_spin_lock_irqsave+0x4c/0x68
> [    3.815265]  _raw_spin_lock_irqsave from sdhci_init+0x34/0xf4
> [    3.821051]  sdhci_init from sdhci_runtime_resume_host+0x3c/0x1bc
> [    3.827180]  sdhci_runtime_resume_host from
> sdhci_omap_runtime_resume+0x108/0x110
> [    3.834710]  sdhci_omap_runtime_resume from __rpm_callback+0x3c/0x148
> [    3.841197]  __rpm_callback from rpm_callback+0x50/0x54
> [    3.846453]  rpm_callback from rpm_resume+0x518/0x71c
> [    3.851534]  rpm_resume from __pm_runtime_resume+0x50/0x68
> [    3.857052]  __pm_runtime_resume from sdhci_omap_probe+0x1e4/0x7a8
> [    3.863270]  sdhci_omap_probe from platform_probe+0x58/0xbc
> [    3.868886]  platform_probe from really_probe.part.0+0x9c/0x290
> [    3.874843]  really_probe.part.0 from __driver_probe_device+0xa0/0x138
> [    3.881409]  __driver_probe_device from driver_probe_device+0x30/0x10c
> [    3.887975]  driver_probe_device from __device_attach_driver+0xb0/0xf8
> [    3.894540]  __device_attach_driver from bus_for_each_drv+0x80/0xd0
> [    3.900845]  bus_for_each_drv from __device_attach_async_helper+0xac/0xe0
> [    3.907672]  __device_attach_async_helper from async_run_entry_fn+0x20/0xb0
> [    3.914675]  async_run_entry_fn from process_one_work+0x284/0x72c
> [    3.920811]  process_one_work from worker_thread+0x28/0x4b0
> [    3.926418]  worker_thread from kthread+0xe4/0x104
> [    3.931243]  kthread from ret_from_fork+0x14/0x28
> [    3.935977] Exception stack(0xd0035fb0 to 0xd0035ff8)
> [    3.941056] 5fa0:                                     00000000
> 00000000 00000000 00000000
> [    3.949274] 5fc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [    3.957491] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    3.964359] sdhci-omap 48060000.mmc: supply pbias not found, using
> dummy regulator
> [    3.972468] sdhci-omap 48060000.mmc: supply vqmmc not found, using
> dummy regulator
> [    3.982478] sdhci-omap 481d8000.mmc: supply pbias not found, using
> dummy regulator
> [    3.990665] sdhci-omap 481d8000.mmc: supply vqmmc not found, using
> dummy regulator
> 
> Regards,
> Yegor
