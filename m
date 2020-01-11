Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3087D137BDA
	for <lists+linux-omap@lfdr.de>; Sat, 11 Jan 2020 07:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgAKG2f (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 11 Jan 2020 01:28:35 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35079 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgAKG2f (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 11 Jan 2020 01:28:35 -0500
Received: by mail-lj1-f194.google.com with SMTP id j1so4404777lja.2
        for <linux-omap@vger.kernel.org>; Fri, 10 Jan 2020 22:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8iu5ym5sr3AOgcd1wcHEoi/idPhE3U2NroKtHu8vm/g=;
        b=Bj+UISFu5njRYCt1RyXQyZmlWNkNCjDiuwYAQlgwfZu18jQagW3WmpqVsOHJdXAEZY
         KRmfUmm7fj4Hb7TJtBdsQIbazZz+KstWG32EwRw4ro3e3Ej8NXdvz27rYmz9kyD5Hdgz
         Dzan+zz3mHW6k/opp7CpPbGEUbjfON7KAmJiTNq14QR64ERPn806T8OqdoaBTF4FWGL0
         7rRACcr8nbbvhWbVb9zRedrImZqt8bdR8WEPleBadXdNNjK9NZdVmFXupefqehL1v8EC
         4WQ15ka23Dt3G5lGca5fKo2Sk/E90urqtJ5fHElZbmJ5cTRFbX/r+XGFc5iprk1+EdwI
         kDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8iu5ym5sr3AOgcd1wcHEoi/idPhE3U2NroKtHu8vm/g=;
        b=E2k2nIRA5l8pKigrlzjNWT3aF9m+iBhHTfOihdzTeQPZJJ2TKpl7h3hONNI8YYiLUL
         0bVlzDsKtSIp2fMGy1Zhdt/O36bvmbdxtlEpPhc8ldi9u7ojbMGbDfn/Xe6nMeU1wyJV
         pB9ToWP4FLfcQA9FYxc11h8RQFqLvU+WKcwAuorCmkxgJR/thS5dTRLLIelMXdAWTWsz
         y3IqdQJClbPThOlWRS3NJwdXrz3PdHQyII3CX2FtHbK7szP839zlOTpJCFidbe8Q5pKa
         5YzVTDb7mCy8Xu7ptDgPuC8eWISCjxV95zYDCDctW9rh4FWS66Iwqd1x9wYMjsbgyO1H
         QtDA==
X-Gm-Message-State: APjAAAWxi36BdJes9eYq+k0DuPHzrZ7Fs53mA8a9e1ZxVkPZUKwWt9Gq
        TV1IF2ZK6fEtKbilRbq1v+/PY6H9X51U/vh73DA4Bw==
X-Google-Smtp-Source: APXvYqwnzVhFzOxc2Xax5HKLnQAPb6f7KI8aJHzuxybDifjnyToU9z+4jMk2cz2QtnzOyUVfchd6w00e5aAA7C0cafY=
X-Received: by 2002:a2e:3504:: with SMTP id z4mr2722195ljz.273.1578724113269;
 Fri, 10 Jan 2020 22:28:33 -0800 (PST)
MIME-Version: 1.0
References: <20200106203700.21009-1-tony@atomide.com>
In-Reply-To: <20200106203700.21009-1-tony@atomide.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Sat, 11 Jan 2020 11:58:22 +0530
Message-ID: <CA+G9fYvRNiFK54oiGt9hYP=RTfazf2E7rmnnkwP+ELMUYtJ7bQ@mail.gmail.com>
Subject: Re: [PATCH] clocksource: timer-ti-dm: Fix regression
To:     Tony Lindgren <tony@atomide.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        open list <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Yangtao Li <tiny.windzz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 7 Jan 2020 at 02:07, Tony Lindgren <tony@atomide.com> wrote:
>
> Clean-up commit 8c82723414d5 ("clocksource/drivers/timer-ti-dm: Switch to
> platform_get_irq") caused a regression where we now try to access
> uninitialized data for timer:
>
> drivers/clocksource/timer-ti-dm.c: In function 'omap_dm_timer_probe':
> drivers/clocksource/timer-ti-dm.c:798:13: warning: 'timer' may be used
> uninitialized in this function [-Wmaybe-uninitialized]
>
> On boot we now get:
>
> Unable to handle kernel NULL pointer dereference at virtual address
> 00000004
> ...
> (omap_dm_timer_probe) from [<c061ac7c>] (platform_drv_probe+0x48/0x98)
> (platform_drv_probe) from [<c0618c04>] (really_probe+0x1dc/0x348)
> (really_probe) from [<c0618ef4>] (driver_probe_device+0x5c/0x160)
>
> Let's fix the issue by moving platform_get_irq to happen after timer has
> been allocated.
>
> Fixes: 8c82723414d5 ("clocksource/drivers/timer-ti-dm: Switch to platform_get_irq")

Thanks for fixing this issue.
I have noticed arm BeagleBoard-X15 boot failed on linux next tree
(5.5.0-rc5-next-20200110).

[    6.157822] 8<--- cut here ---
[    6.160911] Unable to handle kernel NULL pointer dereference at
virtual address 00000004
[    6.169120] pgd = 25d83e32
[    6.171903] [00000004] *pgd=80000080204003, *pmd=00000000
[    6.177358] Internal error: Oops: a06 [#1] SMP ARM
[    6.182179] Modules linked in:
[    6.185260] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
5.5.0-rc5-next-20200110 #1
[    6.192694] Hardware name: Generic DRA74X (Flattened Device Tree)
[    6.198832] PC is at omap_dm_timer_probe+0x48/0x310

- Naresh
