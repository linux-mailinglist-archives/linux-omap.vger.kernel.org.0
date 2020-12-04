Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEB642CF02D
	for <lists+linux-omap@lfdr.de>; Fri,  4 Dec 2020 16:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730370AbgLDPAD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Dec 2020 10:00:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730364AbgLDPAD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Dec 2020 10:00:03 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354FDC0613D1
        for <linux-omap@vger.kernel.org>; Fri,  4 Dec 2020 06:59:23 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id u18so7998039lfd.9
        for <linux-omap@vger.kernel.org>; Fri, 04 Dec 2020 06:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R2hhNqWpvaPMY/nqPJUBMjgnPkxaupCsa/eQGp85mS8=;
        b=VgARPNHHj1qxP+keObG8oNQflyR2GUBeTJ/umthUA2+xie0PrmpbgpNUCLWnbFmWod
         ZeFtgQ33xNW5kthxrMpv00ZeNaGU+i7+b7JbvgncMNv29al3IFEDVtSjAb/Ak+ZG3QEA
         nSNhf9PC5eVy0fRzs2os2QT3WXWPcnwjgnjE9jKCddX+DBmzayv+U8Dn2vJg8IpO681z
         UK32uNHqfY3lfiNWNFBrfF/yjmmujRs16/A2KCxeXX41gcJf1MYz5FFTXoZ2urwfSN8R
         +m6ZUxS+cLRKgjI3VIVOzxTNOEwzVeotu9alNoxiWVYBtdwcH0KKhwfDCjuVD1Ml5ed7
         UrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R2hhNqWpvaPMY/nqPJUBMjgnPkxaupCsa/eQGp85mS8=;
        b=NXZfJklp/Gsw6D2y+tADIh5I0jeR/iNU0/ik8R8dkX9fn/yFvQXuV61QZL6yIZccQ/
         HnRaW53tOPXLI7Z0kV1Vb3YxhPhSlg9KvWu6JJ7+1NycYBni1DDt71ve5qy1u3Lp574w
         difILc+0HCh70ilfpFz4M6nDaO0zz1EprP1qDgLDWlKHVUn1/ugrCi+lmWx31QgGtmF6
         dkadkMDK+l1+Hzi3yqw7LkUoVRQOL5YeVyt0T5Rhx7Y1rFAvc6aooqPe0OwsnzyCkMe2
         tS6H+Tpp3wyb4H8rZqcElXF2d0xM7UWw1vkntFls2hiBPYMOyXHk1/A6HK9x9tfGfS+W
         ouDg==
X-Gm-Message-State: AOAM5317AmHqIbNPmSotE4mW9bW1MS7+ym5gThizKV1jmMIIfzMB23dv
        5GgKdZ/7S+sdG5VtD/ll3MpIaRJidSHvAD0c9/j63w==
X-Google-Smtp-Source: ABdhPJyO7lG98b9pDqSTa4+PB459L3s+ir5d2EbC0zs7JaYEg4f3XRGmvXrVAjBCG02ONhQflstKYOq2JZ4/5cYE5ss=
X-Received: by 2002:a19:8212:: with SMTP id e18mr3692064lfd.361.1607093961689;
 Fri, 04 Dec 2020 06:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20201204095539.31705-1-andreas@kemnade.info>
In-Reply-To: <20201204095539.31705-1-andreas@kemnade.info>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 4 Dec 2020 15:58:45 +0100
Message-ID: <CAPDyKFrQchk05cmWB9c4wepkquwodd-hHPJi8Lb46aAoSVReNQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: omap_device: fix idling of devices during probe
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Tony Lindgren <tony@atomide.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Doug Anderson <dianders@chromium.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 4 Dec 2020 at 10:55, Andreas Kemnade <andreas@kemnade.info> wrote:
>
> On the GTA04A5 od->_driver_status was not set to BUS_NOTIFY_BIND_DRIVER
> during probe of the second mmc used for wifi. Therefore
> omap_device_late_idle idled the device during probing causing oopses when
> accessing the registers.
>
> It was not set because od->_state was set to OMAP_DEVICE_STATE_IDLE
> in the notifier callback. Therefore set od->_driver_status also in that
> case.
>
> This came apparent after
> commit 21b2cec61c04 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4")
> causing this oops:
>
> [    3.179534] omap_hsmmc 480b4000.mmc: omap_device_late_idle: enabled but no driver.  Idling
> [    3.265594] 8<--- cut here ---
> [    3.268707] Unhandled fault: external abort on non-linefetch (0x1028) at 0xfa0b402c
> [    3.276397] pgd = (ptrval)
> [    3.279144] [fa0b402c] *pgd=48011452(bad)
> [    3.283203] Internal error: : 1028 [#1] SMP ARM
> [    3.287750] Modules linked in:
> [    3.290832] CPU: 0 PID: 7 Comm: kworker/u2:0 Not tainted 5.10.0-rc6 #3
> [    3.297393] Hardware name: Generic OMAP36xx (Flattened Device Tree)
> [    3.303710] Workqueue: events_unbound async_run_entry_fn
> [    3.309082] PC is at omap_hsmmc_set_bus_width+0x8/0x78
> [    3.314239] LR is at omap_hsmmc_set_ios+0x11c/0x258
> [    3.319152] pc : [<c079787c>]    lr : [<c07996bc>]    psr: 20000013
> [    3.325469] sp : c10f9e00  ip : c175c800  fp : 00000066
> [    3.330718] r10: c175cb80  r9 : fa0b4000  r8 : 00000000
> [    3.335968] r7 : c123e010  r6 : c175ca58  r5 : c175cb80  r4 : c175c800
> [    3.342529] r3 : 00000001  r2 : 58ad940c  r1 : fa0b4000  r0 : c175cb80
> [    3.349090] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [    3.356262] Control: 10c5387d  Table: 80004019  DAC: 00000051
> [    3.362030] Process kworker/u2:0 (pid: 7, stack limit = 0x(ptrval))
> [    3.368347] Stack: (0xc10f9e00 to 0xc10fa000)
> [    3.372741] 9e00: c175c800 00000007 c123e000 c123e010 00000000 c077b2b0 c175c800 00000000
> [    3.380950] 9e20: c123e000 c077c14c c175c800 c077d284 c175c800 c175c800 c123e000 c0799190
> [    3.389190] 9e40: 00000000 c1755040 c175cb80 00000000 c123fd68 58ad940c 00000001 c123e010
> [    3.397430] 9e60: 00000000 c0edaec8 00000000 00000000 c0edaec8 00000006 ffffe000 c0666728
> [    3.405639] 9e80: c123e010 c0f38c28 c0f38c30 00000000 00000000 c066457c c123e010 c0edaec8
> [    3.413879] 9ea0: c06649bc c0e051c8 00000000 00000000 c0efa4a0 c06648b8 00000000 c10f9ef4
> [    3.422119] 9ec0: c06649bc c066298c 00000000 c1039e6c c1653738 58ad940c c123e010 c123e010
> [    3.430328] 9ee0: c0e051c8 c123e054 c100f000 c0663e60 c0e03d00 c123e010 00010101 58ad940c
> [    3.438568] 9f00: c12642d0 c0f02018 c12642c0 c015da48 c12642d0 c10bbf00 c1009400 c100f000
> [    3.446807] 9f20: 00000000 c0153b74 c10bc800 c1009400 00000088 c10bbf00 c10bbf14 c1009400
> [    3.455017] 9f40: 00000088 c1009418 c0e03d00 c1009400 ffffe000 c0153eec ffffe000 00000000
> [    3.463256] 9f60: c10bbf00 00000000 c10b1ac0 c10b1c40 c10f8000 c0153ec0 c10bbf00 c10ebe94
> [    3.471466] 9f80: c10b1ae4 c015a9ac 00000001 c10b1c40 c015a87c 00000000 00000000 00000000
> [    3.479705] 9fa0: 00000000 00000000 00000000 c0100168 00000000 00000000 00000000 00000000
> [    3.487945] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    3.496154] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> [    3.504394] [<c079787c>] (omap_hsmmc_set_bus_width) from [<c07996bc>] (omap_hsmmc_set_ios+0x11c/0x258)
> [    3.513763] [<c07996bc>] (omap_hsmmc_set_ios) from [<c077b2b0>] (mmc_power_up.part.8+0x3c/0xd0)
> [    3.522521] [<c077b2b0>] (mmc_power_up.part.8) from [<c077c14c>] (mmc_start_host+0x88/0x9c)
> [    3.530944] [<c077c14c>] (mmc_start_host) from [<c077d284>] (mmc_add_host+0x58/0x84)
> [    3.538726] [<c077d284>] (mmc_add_host) from [<c0799190>] (omap_hsmmc_probe+0x5fc/0x8c0)
> [    3.546874] [<c0799190>] (omap_hsmmc_probe) from [<c0666728>] (platform_drv_probe+0x48/0x98)
> [    3.555358] [<c0666728>] (platform_drv_probe) from [<c066457c>] (really_probe+0x1dc/0x3b4)
> [    3.563690] [<c066457c>] (really_probe) from [<c06648b8>] (driver_probe_device+0x58/0xb4)
> [    3.571929] [<c06648b8>] (driver_probe_device) from [<c066298c>] (bus_for_each_drv+0x7c/0xc4)
> [    3.580505] [<c066298c>] (bus_for_each_drv) from [<c0663e60>] (__device_attach_async_helper+0xa4/0xd8)
> [    3.589874] [<c0663e60>] (__device_attach_async_helper) from [<c015da48>] (async_run_entry_fn+0x3c/0x1)
> [    3.599487] [<c015da48>] (async_run_entry_fn) from [<c0153b74>] (process_one_work+0x228/0x574)
> [    3.608154] [<c0153b74>] (process_one_work) from [<c0153eec>] (worker_thread+0x2c/0x5d0)
> [    3.616302] [<c0153eec>] (worker_thread) from [<c015a9ac>] (kthread+0x130/0x144)
> [    3.623748] [<c015a9ac>] (kthread) from [<c0100168>] (ret_from_fork+0x14/0x2c)
>
> Fixes: 21b2cec61c04 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Sounds like you found a quite nasty bug, which I guess has existed all
time - but was triggered easily with the async probe thingy, right?

In any case, thanks for helping out and fixing the regression!

FWIW:
Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  arch/arm/mach-omap2/omap_device.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-omap2/omap_device.c b/arch/arm/mach-omap2/omap_device.c
> index fc7bb2ca1672..13adf88d472b 100644
> --- a/arch/arm/mach-omap2/omap_device.c
> +++ b/arch/arm/mach-omap2/omap_device.c
> @@ -230,10 +230,12 @@ static int _omap_device_notifier_call(struct notifier_block *nb,
>                 break;
>         case BUS_NOTIFY_BIND_DRIVER:
>                 od = to_omap_device(pdev);
> -               if (od && (od->_state == OMAP_DEVICE_STATE_ENABLED) &&
> -                   pm_runtime_status_suspended(dev)) {
> +               if (od) {
>                         od->_driver_status = BUS_NOTIFY_BIND_DRIVER;
> -                       pm_runtime_set_active(dev);
> +                       if ((od->_state == OMAP_DEVICE_STATE_ENABLED) &&
> +                           pm_runtime_status_suspended(dev)) {
> +                               pm_runtime_set_active(dev);
> +                       }
>                 }
>                 break;
>         case BUS_NOTIFY_ADD_DEVICE:
> --
> 2.20.1
>
