Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50AD52B783F
	for <lists+linux-omap@lfdr.de>; Wed, 18 Nov 2020 09:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgKRIOl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Nov 2020 03:14:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:41862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726181AbgKRIOl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Nov 2020 03:14:41 -0500
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36174241A5;
        Wed, 18 Nov 2020 08:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605687280;
        bh=qJ5zHy+pCbs19PJJvVJMA3zNtj6fFyQGeZR+ojf8+qg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cHMJGI8v5BPFNXRQWeJ0JKJB0knfTBwt1aDU9wi6IE+cWaFR67uysOUaFXuynNxv3
         L+f2pnfDgsMsbcM8mcGho2ThKnebwEFSCxc7llCUFg9B41a/EMmjno58VG+jA58qGB
         L2p5pLsZR52sfdabMOrk4svM+HJ13cYEohUhYY0A=
Received: by mail-ot1-f49.google.com with SMTP id n89so953047otn.3;
        Wed, 18 Nov 2020 00:14:40 -0800 (PST)
X-Gm-Message-State: AOAM531/YNxV2WtUBkV77nraD/8ATVwNtKwRvzUAN38V5OOBedmfCHAb
        tpT7QYLU/THV3EtEWsooWoZgchQ1Cx9b/U6tTfs=
X-Google-Smtp-Source: ABdhPJzf9aND79dMbS2oPlqGaDMX02ziUJv3AxQiefYLxvz2JZIIcPClzq5iJdToVHe28h+vHRKxV2a9AOBgyn30V3E=
X-Received: by 2002:a05:6830:22d2:: with SMTP id q18mr5279342otc.305.1605687279412;
 Wed, 18 Nov 2020 00:14:39 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYuk4imvhyCN7D7T6PMDH6oNp6HDCRiTUKMQ6QXXjBa4ag@mail.gmail.com>
 <CAK8P3a2MmA257e486D2hj_qj9Wk0ybkfg9yk9f5hR=h-KWUHVg@mail.gmail.com> <20201117232343.rg37fkacw43matmh@revered>
In-Reply-To: <20201117232343.rg37fkacw43matmh@revered>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 18 Nov 2020 09:14:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0+RKdNj4q3GTh26jrwBkF-BgWiEUuFB4xbh8gZj4Q4-g@mail.gmail.com>
Message-ID: <CAK8P3a0+RKdNj4q3GTh26jrwBkF-BgWiEUuFB4xbh8gZj4Q4-g@mail.gmail.com>
Subject: Re: [arm] BUG: KASAN: slab-out-of-bounds in memcmp+0x30/0x5c
To:     Nishanth Menon <nm@ti.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
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
        Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Nov 18, 2020 at 12:24 AM Nishanth Menon <nm@ti.com> wrote:
> On 16:25-20201117, Arnd Bergmann wrote:
>
> Yes, this was indeed a bug that has been around for some time now :(
>
> I tested with a variant of the above (did'nt like that
> oinfo was being assigned an invalid address)
> Boot log: https://pastebin.ubuntu.com/p/nZfz3HF8N6/ (with the same
> config as in the report): Would you prefer to me to send the following
> as a formal patch?

Awesome, thanks for the new patch and testing it!

Yes, please send this as a proper patch to have it picked up
into the regulator tree as a bugfix.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> diff --git a/drivers/regulator/ti-abb-regulator.c b/drivers/regulator/ti-abb-regulator.c
> index 3e60bff76194..9f0a4d50cead 100644
> --- a/drivers/regulator/ti-abb-regulator.c
> +++ b/drivers/regulator/ti-abb-regulator.c
> @@ -342,8 +342,17 @@ static int ti_abb_set_voltage_sel(struct regulator_dev *rdev, unsigned sel)
>                 return ret;
>         }
>
> -       /* If data is exactly the same, then just update index, no change */
>         info = &abb->info[sel];
> +       /*
> +        * When Linux kernel is starting up, we are'nt sure of the
> +        * Bias configuration that bootloader has configured.
> +        * So, we get to know the actual setting the first time
> +        * we are asked to transition.
> +        */
> +       if (abb->current_info_idx == -EINVAL)
> +               goto just_set_abb;
> +
> +       /* If data is exactly the same, then just update index, no change */
>         oinfo = &abb->info[abb->current_info_idx];
>         if (!memcmp(info, oinfo, sizeof(*info))) {
>                 dev_dbg(dev, "%s: Same data new idx=%d, old idx=%d\n", __func__,
> @@ -351,6 +360,7 @@ static int ti_abb_set_voltage_sel(struct regulator_dev *rdev, unsigned sel)
>                 goto out;
>         }
>
> +just_set_abb:
>         ret = ti_abb_set_opp(rdev, abb, info);
>
>  out:
