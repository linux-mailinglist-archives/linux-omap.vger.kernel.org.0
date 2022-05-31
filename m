Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B530538CDF
	for <lists+linux-omap@lfdr.de>; Tue, 31 May 2022 10:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244846AbiEaI2z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 31 May 2022 04:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244866AbiEaI2y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 31 May 2022 04:28:54 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9865B62137;
        Tue, 31 May 2022 01:28:53 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-30c143c41e5so73660767b3.3;
        Tue, 31 May 2022 01:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x3YwC5Q3VOyALLp0tX3kJCfO82NpiUNZUJAZaHsR+88=;
        b=MYtKroQuWN7m0rI6SB2I1QzDo5GTtsTWpOiX1ND1k/y7frkYdp/5hN89ISn9cMa85p
         ZQN7e88w0csZdh8L+j5bMBw2uYxh7BumO06mcXBs2bAcvOzlCtDjn13QaMijzqnrFuoi
         h7P7+hDPsNfEAivOaEYlvNZhzKxnmjFHCVrdO3SAg8fZfARyYPt4d3tsxZLz26PYbTdQ
         mzvqyrnivWLPACIqKHkJAzQKAp1jqUETJdYXYPjci9mC1j2/MUsxHFJJyVn9fhobypz6
         u6xXDSVGnCvvxmRNPTzcj6xysCZl6bmxwUW75GoCdobw1ofmDP+5iU3dorH06rZjMynu
         fplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x3YwC5Q3VOyALLp0tX3kJCfO82NpiUNZUJAZaHsR+88=;
        b=QPX0J4NRzG48qQ/8yi9hpkSkrFroh7sP16ARRBGMDxp/sEUXaqX+G2mHMvgBh4Y2NO
         7w5uUr9cBSgPxPKG4SrEn74OwklpeewOcCEwbAPFijcK99MSNPQq57uZrUvtRlqddbk9
         mVrkjK4rjZtt1CnDf2/Ur3Aoc3KVxqiNrMqd4gIwWT7135cs5hq+y/3jrhYU9zWvQlF4
         UY9eMjw0fnu3GQwdKiNBwGLminc/mPde0URFpKt/cLmaypMGUK1dxdS7wFt4a9YwgMBW
         EdvA/xVQ1TpdS/wpelWbFhG0Mrs+GjFzAlqhgNcRs3x43V+Nyh8aUZZJB/3itKIv8Sip
         SUFw==
X-Gm-Message-State: AOAM530UQiLp65HbA58KBTFeLIivQNXulDi9q2jv3FDTpTZON1Ne4um0
        kNQJg5TL5Y0nfZaiolPajMgdQkgrgQH1v7o94HI=
X-Google-Smtp-Source: ABdhPJxTFQE3GlINsrKFrZYAyxCtGfOqIbHWcJ0wIerkoQPlNgT3fadEKpqzlV+kTCyucNtldaE67zySOs4lhCKDE+0=
X-Received: by 2002:a81:e04:0:b0:30c:99b9:1704 with SMTP id
 4-20020a810e04000000b0030c99b91704mr4084015ywo.13.1653985732669; Tue, 31 May
 2022 01:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_ktMOwwhhgVWj3DpCib-WpRzhkjE4d4DN74mz6kdwJk6BA@mail.gmail.com>
 <YnNagtAtSudCum75@atomide.com>
In-Reply-To: <YnNagtAtSudCum75@atomide.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Tue, 31 May 2022 10:28:41 +0200
Message-ID: <CAGm1_kv6wYV6ccrGJuGaeR=rffajEBB6H1Mt17iXJeMJg0JozQ@mail.gmail.com>
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

Hi,

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

After enabling the CONFIG_DMA_API_DEBUG option, I also get the following error:

Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Populating /dev using udev: [    7.511893] ------------[ cut here ]------------
[    7.516605] WARNING: CPU: 0 PID: 73 at kernel/dma/debug.c:1073
check_for_illegal_area+0xd0/0x180
[    7.525734] DMA-API: sdhci-omap 48060000.mmc: device driver maps
memory from kernel text or rodata [addr=(ptrval)] [len=12288]
[    7.537275] Modules linked in:
[    7.540429] CPU: 0 PID: 73 Comm: kworker/0:2H Not tainted 5.18.0-rc7 #14
[    7.547182] Hardware name: Generic AM33XX (Flattened Device Tree)
[    7.553320] Workqueue: kblockd blk_mq_run_work_fn
[    7.558098]  unwind_backtrace from show_stack+0x10/0x14
[    7.563386]  show_stack from dump_stack_lvl+0x58/0x70
[    7.568501]  dump_stack_lvl from __warn+0xb4/0x24c
[    7.573342]  __warn from warn_slowpath_fmt+0x74/0xb8
[    7.578352]  warn_slowpath_fmt from check_for_illegal_area+0xd0/0x180
[    7.584845]  check_for_illegal_area from debug_dma_map_sg+0x60/0x3d8
[    7.591249]  debug_dma_map_sg from __dma_map_sg_attrs+0xa4/0x13c
[    7.597316]  __dma_map_sg_attrs from dma_map_sg_attrs+0x14/0x20
[    7.603288]  dma_map_sg_attrs from sdhci_pre_dma_transfer+0xcc/0x134
[    7.609705]  sdhci_pre_dma_transfer from mmc_blk_mq_issue_rq+0x2f4/0xa58
[    7.616462]  mmc_blk_mq_issue_rq from mmc_mq_queue_rq+0x124/0x258
[    7.622604]  mmc_mq_queue_rq from blk_mq_dispatch_rq_list+0x1b8/0x8ac
[    7.629104]  blk_mq_dispatch_rq_list from
blk_mq_do_dispatch_sched+0x2ec/0x350
[    7.636387]  blk_mq_do_dispatch_sched from
__blk_mq_sched_dispatch_requests+0x118/0x170
[    7.644448]  __blk_mq_sched_dispatch_requests from
blk_mq_sched_dispatch_requests+0x34/0x5c
[    7.652859]  blk_mq_sched_dispatch_requests from
__blk_mq_run_hw_queue+0xf8/0x230
[    7.660402]  __blk_mq_run_hw_queue from process_one_work+0x284/0x72c
[    7.666820]  process_one_work from worker_thread+0x28/0x4b0
[    7.672441]  worker_thread from kthread+0xe4/0x104
[    7.677280]  kthread from ret_from_fork+0x14/0x28
[    7.682027] Exception stack(0xd0421fb0 to 0xd0421ff8)
[    7.687116] 1fa0:                                     00000000
00000000 00000000 00000000
[    7.695346] 1fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    7.703574] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    7.710321] irq event stamp: 0
[    7.713411] hardirqs last  enabled at (0): [<00000000>] 0x0
[    7.719029] hardirqs last disabled at (0): [<c0135e68>]
copy_process+0x630/0x19c4
[    7.726626] softirqs last  enabled at (0): [<c0135e68>]
copy_process+0x630/0x19c4
[    7.734219] softirqs last disabled at (0): [<00000000>] 0x0
[    7.739883] ---[ end trace 0000000000000000 ]---
[    7.837580] udevd[101]: starting version 3.2.11

Regards,
Yegor
