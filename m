Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E862B68A7
	for <lists+linux-omap@lfdr.de>; Tue, 17 Nov 2020 16:26:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730358AbgKQPZs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Nov 2020 10:25:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:40724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730357AbgKQPZs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 17 Nov 2020 10:25:48 -0500
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E53D121D7E;
        Tue, 17 Nov 2020 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605626747;
        bh=CVu5v9JWmsPdgzdRxPBbhTfTolFO1h9kmq6zvJbNsA4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J+flaaOm6VKiGyhaAiyG28jsiRK2MGr2u0xtlHBYxq9EFZFL/vZkRU2MuLjDAHpqR
         l7T1iwlBEivDTD5ACSMnms0WmwziXkB3y6Jg1Tl3Lw7xZe79btO/4Qa9nDK0ugAF7m
         G/PpzVaW8dJOpFqhNrp/qRCkITDi1GNQlS7mCyHs=
Received: by mail-oi1-f178.google.com with SMTP id m13so22940158oih.8;
        Tue, 17 Nov 2020 07:25:46 -0800 (PST)
X-Gm-Message-State: AOAM533iaXY6F6GnSVR02/k72uJ/SaaJd79ZbzRFss37Miqwunrz38dH
        xJ0aAGYAON9bMdzzlVN/f7gOFkQ1F00I5PBQqJ8=
X-Google-Smtp-Source: ABdhPJxLUZ3Q/0MTwO5OAvlU6OhPmW7CEX/MHtkC1bhFJ5YyKOy1hu3Q+8GNonKUmEvz1gQd3hmtE7sTnxJK4rgZ2hw=
X-Received: by 2002:aca:180a:: with SMTP id h10mr2585953oih.4.1605626746155;
 Tue, 17 Nov 2020 07:25:46 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYuk4imvhyCN7D7T6PMDH6oNp6HDCRiTUKMQ6QXXjBa4ag@mail.gmail.com>
In-Reply-To: <CA+G9fYuk4imvhyCN7D7T6PMDH6oNp6HDCRiTUKMQ6QXXjBa4ag@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 17 Nov 2020 16:25:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2MmA257e486D2hj_qj9Wk0ybkfg9yk9f5hR=h-KWUHVg@mail.gmail.com>
Message-ID: <CAK8P3a2MmA257e486D2hj_qj9Wk0ybkfg9yk9f5hR=h-KWUHVg@mail.gmail.com>
Subject: Re: [arm] BUG: KASAN: slab-out-of-bounds in memcmp+0x30/0x5c
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "Andrii.Tseglytskyi" <andrii.tseglytskyi@ti.com>,
        Nishanth Menon <nm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Nov 17, 2020 at 3:44 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> While booting arm KASAN config enabled kernel on TI x15 device
> Linux version 5.10.0-rc3-next-20201116.
>
> The reported issue is not a regression since we have recently started testing
> arm+kasan builds on LKFT.
>
> The boot was not successful on x15 and qemu_arm  for some other reason.
> The kernel config and crash log attached to this email.

Nice find!

> [   13.071906] BUG: KASAN: slab-out-of-bounds in memcmp+0x30/0x5c
> [   13.077526] Synopsys Designware Multimedia Card Interface Driver
> [   13.077781] Read of size 1 at addr c5ae1d90 by task kworker/0:0/5
> [   13.089918]
> [   13.091433] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted
> 5.10.0-rc3-next-20201116 #2
> [   13.093605] sdhci-pltfm: SDHCI platform and OF driver helper
> [   13.099135] Hardware name: Generic DRA74X (Flattened Device Tree)
> [   13.110942] Workqueue: events dbs_work_handler
> [   13.115442] [<c0315abc>] (unwind_backtrace) from [<c030ebf8>]
> (show_stack+0x10/0x14)
> [   13.123240] [<c030ebf8>] (show_stack) from [<c16c91cc>]
> (dump_stack+0xc8/0xe0)
> [   13.130518] [<c16c91cc>] (dump_stack) from [<c051b4ec>]
> (print_address_description.constprop.0+0x34/0x2dc)
> [   13.140238] [<c051b4ec>] (print_address_description.constprop.0)
> from [<c051b9e0>] (kasan_report+0x1a8/0x1c4)
> [   13.145871] omap_gpio 4805d000.gpio: Could not set line 27 debounce
> to 200000 microseconds (-22)
> [   13.150221] [<c051b9e0>] (kasan_report) from [<c0997704>] (memcmp+0x30/0x5c)
> [   13.159064] sdhci-omap 4809c000.mmc: Got CD GPIO
> [   13.166123] [<c0997704>] (memcmp) from [<c0c33694>]
> (ti_abb_set_voltage_sel+0x94/0x58c)
> [   13.166150] [<c0c33694>] (ti_abb_set_voltage_sel) from [<c0c0f0f8>]
> (_regulator_call_set_voltage_sel+0xd8/0x12c)


I see this code in ti_abb_set_voltage_sel():

        if (sel >= desc->n_voltages) {
                dev_err(dev, "%s: sel idx(%d) >= n_voltages(%d)\n", __func__,
                        sel, desc->n_voltages);
                return -EINVAL;
        }

        /* If we are in the same index as we were, nothing to do here! */
        if (sel == abb->current_info_idx) {
                dev_dbg(dev, "%s: Already at sel=%d\n", __func__, sel);
                return ret;
        }

        /* If data is exactly the same, then just update index, no change */
        info = &abb->info[sel];
        oinfo = &abb->info[abb->current_info_idx];
        if (!memcmp(info, oinfo, sizeof(*info))) {

One of the two pointers overflows the abb->info array that is allocated
with length 'desc->n_voltages'. The 'sel' argument is checked against
that limit, so I assume it's abb->current_info_idx, and this is indeed
initialized as

        /* We do not know where the OPP voltage is at the moment */
        abb->current_info_idx = -EINVAL;

Using the negative '-EINVAL' as an array index would indeed cause
an out-of-bounds access.

Could you try adding this extra bounds check?

index 3e60bff76194..c475a9461027 100644
--- a/drivers/regulator/ti-abb-regulator.c
+++ b/drivers/regulator/ti-abb-regulator.c
@@ -345,7 +345,8 @@ static int ti_abb_set_voltage_sel(struct
regulator_dev *rdev, unsigned sel)
        /* If data is exactly the same, then just update index, no change */
        info = &abb->info[sel];
        oinfo = &abb->info[abb->current_info_idx];
-       if (!memcmp(info, oinfo, sizeof(*info))) {
+       if (abb->current_info_idx >= 0 &&
+           !memcmp(info, oinfo, sizeof(*info))) {
                dev_dbg(dev, "%s: Same data new idx=%d, old idx=%d\n", __func__,
                        sel, abb->current_info_idx);
                goto out;

      Arnd

(rest of the report below)

> [   13.173027] sdhci-omap 4809c000.mmc: supply vqmmc not found, using
> dummy regulator
> [   13.178825] [<c0c0f0f8>] (_regulator_call_set_voltage_sel) from
> [<c0c0f654>] (_regulator_do_set_voltage+0x508/0x644)
> [   13.207208] [<c0c0f654>] (_regulator_do_set_voltage) from
> [<c0c18558>] (regulator_set_voltage_rdev+0xc4/0x2fc)
> [   13.217276] [<c0c18558>] (regulator_set_voltage_rdev) from
> [<c0c14928>] (regulator_do_balance_voltage+0x304/0x658)
> [   13.227692] [<c0c14928>] (regulator_do_balance_voltage) from
> [<c0c1839c>] (regulator_set_voltage_unlocked+0x1ac/0x2a4)
> [   13.238455] [<c0c1839c>] (regulator_set_voltage_unlocked) from
> [<c0c18834>] (regulator_set_voltage+0xa4/0xfc)
> [   13.248437] [<c0c18834>] (regulator_set_voltage) from [<c1316458>]
> (_opp_set_voltage+0x8c/0x13c)
> [   13.257283] [<c1316458>] (_opp_set_voltage) from [<c13167ac>]
> (ti_opp_supply_set_opp+0x2a4/0x330)
> [   13.266216] [<c13167ac>] (ti_opp_supply_set_opp) from [<c1311a98>]
> (dev_pm_opp_set_rate+0x274/0x7cc)
> [   13.275411] [<c1311a98>] (dev_pm_opp_set_rate) from [<c13188b8>]
> (__cpufreq_driver_target+0x2fc/0x8fc)
> [   13.284779] [<c13188b8>] (__cpufreq_driver_target) from
> [<c131dfac>] (od_dbs_update+0x22c/0x294)
> [   13.293623] [<c131dfac>] (od_dbs_update) from [<c131f484>]
> (dbs_work_handler+0x44/0x88)
> [   13.301683] [<c131f484>] (dbs_work_handler) from [<c038159c>]
> (process_one_work+0x410/0x7ac)
> [   13.310174] [<c038159c>] (process_one_work) from [<c0381998>]
> (worker_thread+0x60/0x8d0)
> [   13.318320] [<c0381998>] (worker_thread) from [<c038c2d4>]
> (kthread+0x258/0x268)
> [   13.325769] [<c038c2d4>] (kthread) from [<c03001b0>]
> (ret_from_fork+0x14/0x24)
> [   13.333031] Exception stack(0xc3937fb0 to 0xc3937ff8)
> [   13.338117] 7fa0:                                     00000000
> 00000000 00000000 00000000
> [   13.346346] 7fc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [   13.354573] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [   13.361223]
> [   13.362729] Allocated by task 1:
> [   13.365987]  ____kasan_kmalloc.constprop.0+0x90/0xa4
> [   13.370986]  __kmalloc_track_caller+0x184/0x5e0
> [   13.375550]  devres_alloc_node+0x24/0x64
> [   13.379507]  __devm_ioremap+0x2c/0xac
> [   13.383194]  __devm_ioremap_resource+0xe8/0x1b8
> [   13.387758]  ti_abb_probe+0x298/0xeb4
> [   13.391447]  platform_drv_probe+0x60/0xb8
> [   13.395490]  really_probe+0x170/0x70c
> [   13.399182]  driver_probe_device+0x94/0x254
> [   13.403394]  device_driver_attach+0x84/0x8c
> [   13.407608]  __driver_attach+0xd4/0x18c
> [   13.411471]  bus_for_each_dev+0xf0/0x144
> [   13.415424]  bus_add_driver+0x248/0x2dc
> [   13.419289]  driver_register+0xcc/0x1a0
> [   13.423151]  do_one_initcall+0xb4/0x248
> [   13.427019]  kernel_init_freeable+0x1ec/0x244
> [   13.431409]  kernel_init+0x8/0x128
> [   13.434836]  ret_from_fork+0x14/0x24
> [   13.438434]  0x0
> [   13.440286]
> [   13.441793] The buggy address belongs to the object at c5ae1d00
> [   13.441793]  which belongs to the cache kmalloc-128 of size 128
> [   13.453682] The buggy address is located 16 bytes to the right of
> [   13.453682]  128-byte region [c5ae1d00, c5ae1d80)
> [   13.464516] The buggy address belongs to the page:
> [   13.469343] page:52ce07bb refcount:1 mapcount:0 mapping:00000000
> index:0x0 pfn:0x85ae1
> [   13.477304] flags: 0x200(slab)
> [   13.480392] raw: 00000200 00000100 00000122 c3801d00 00000000
> 00100010 ffffffff 00000001
> [   13.488526] raw: 00000000
> [   13.491163] page dumped because: kasan: bad access detected
> [   13.496764]
> [   13.498266] Memory state around the buggy address:
> [   13.503086]  c5ae1c80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> [   13.509652]  c5ae1d00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> [   13.516218] >c5ae1d80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> [   13.522780]                  ^
> [   13.525855]  c5ae1e00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> [   13.532422]  c5ae1e80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> [   13.538983] ==================================================================
> [   13.546242] Disabling lock debugging due to kernel taint
>
>
> full test log link,
> https://lkft.validation.linaro.org/scheduler/job/1944986#L2188
>
> metadata:
>   git branch: master
>   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git describe: next-20201116
>   make_kernelversion: 5.10.0-rc3
>   kernel-config: https://builds.tuxbuild.com/1kMYEMmo35DocMgHZ9AtJReL3rN/config
>
>
> --
> Linaro LKFT
> https://lkft.linaro.org
