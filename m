Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA5922EF7E2
	for <lists+linux-omap@lfdr.de>; Fri,  8 Jan 2021 20:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbhAHTIb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Jan 2021 14:08:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728539AbhAHTIb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Jan 2021 14:08:31 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66303C0612FE;
        Fri,  8 Jan 2021 11:07:51 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id v3so11306310ilo.5;
        Fri, 08 Jan 2021 11:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NVZl857HB7wVKD8bItyLJ4Yj7dhRp8R9ZtfKjnyuqcs=;
        b=O+ytVj7LbZoqFGa08BBVzJ/B0ii3s37zGw1KHKdx5KGPPcvByHwleJ17tAcepYm/mx
         j1XLV3zSJXurQfDF+u4Lg3cpxmOLqOi1cqD7eZkUXvsDUUBvivwWmkEF6BQGyX9xD6VQ
         J/1nsCTcaknwWb7YogRNWu2DIPLeq/xqtyRCwX9lxclY9SnB5atTutNRJk8I0uoDjVpN
         yKl0Wwbw+0xJGeXWchMle0ydMyzzzR3AoezR56Ci06D9uklpHs1eB2Rnmn9OMA9ruXBT
         5Dpl6P0FNXvK40VHsX6YdcBOccppkrFajBlV7OsUqcQLc2A/LeRsimQMEaZO8PcYFSlm
         RGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NVZl857HB7wVKD8bItyLJ4Yj7dhRp8R9ZtfKjnyuqcs=;
        b=sWce5j1jhJiJNpoatx3sTRj92/UFXBt8Liu/8z+q49MQ9/+K87EoccKmNgIzz2OnWx
         8F/2jo82mLRAheWdfXcuPjzqmgMmDc/fSYzJJ2CQJ+ytAHyqIycOImXZ0W+XzgVUphfp
         0WT5/gXByxFC90I/5LgaiYC1+IZLFxjW9dOZ/fcBa/FAzy7MpRf0OQdVE8gpCScVUGaC
         7BYwCLyVyCUVA7tjmVAC3zl7m4TEF4Ho/60qQXixWojz9abgJvdst2JcpihB+LO3TAPD
         0C9/L0gUtocTparQWxXH/TKs7k9QcK5J6IkdW2hMm94lsDkvrKV8sccQnTfJ1rIAppgy
         FtLA==
X-Gm-Message-State: AOAM531OiDrkILQJg19nfn6MYrkH9kOQj5aUZZk4YAbnBNE5GBODNv6i
        evMM9+DITLDofALySWDTH26Rn9LhH1WoVdQp05zT5hYt83RU7Q==
X-Google-Smtp-Source: ABdhPJxvKP7bIhCeAO87oEwDpGRxgDp/1U9iSFcDXAZsig2Q2LymelwnjwA4As+/vysaIrieSq414L2+PPnTf8Gyhfo=
X-Received: by 2002:a92:d2cf:: with SMTP id w15mr5289303ilg.214.1610132870609;
 Fri, 08 Jan 2021 11:07:50 -0800 (PST)
MIME-Version: 1.0
References: <20201201210039.258d3fed@aktux> <20201203224309.5b5e0b50@aktux>
 <CAD=FV=VucTxW3PxtrN-Dye4h0LravXd-wHLKU91TaKe0eQ4TyA@mail.gmail.com> <20201204092200.0c7894ce@aktux>
In-Reply-To: <20201204092200.0c7894ce@aktux>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 8 Jan 2021 13:07:39 -0600
Message-ID: <CAHCN7xKkh-=kjYWyop2f8Tic86NQtUgy0ihm1niVkvKSPeL6EQ@mail.gmail.com>
Subject: Re: [REGRESSION] mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that
 existed in v4.4
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Doug Anderson <dianders@chromium.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Thierry Reding <treding@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Dec 4, 2020 at 2:23 AM Andreas Kemnade <andreas@kemnade.info> wrote:
>
> On Thu, 3 Dec 2020 14:03:46 -0800
> Doug Anderson <dianders@chromium.org> wrote:
>
> > Hi,
> >
> > On Thu, Dec 3, 2020 at 1:43 PM Andreas Kemnade <andreas@kemnade.info> wrote:
> > >
> > > On Tue, 1 Dec 2020 21:00:39 +0100
> > > Andreas Kemnade <andreas@kemnade.info> wrote:
> > >
> > > > Hi,
> > > >
> > > > during probing of second mmc host on the GTA04A5 which has a
> > > > WL1835 wifi chip attached, I get the following oops. From a first glance
> > > > this seems to be a timing sensitive. Maybe it rings some bells for someone...
> > > > so I hesitate a bit to start the bisect job.
> > > Did the bisect job.
> > > 21b2cec61c04 (mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4)
> > >
> > > is the evil commit. Reverting it on top of v5.10-rc6 solves the problem.
> > >
> > > > Wild guessing: bus width is set while mmc module is not active, so registers
> > > > are not accessible.
> > > > Kernel configuration is omap2plus_defconfig
> > > >
> > > > Regards,
> > > > Andreas
> > > >
> > > >
> >
> > ...snip...
> >
> > > > [    3.152587]  mmcblk0: p1 p2 p3 p4 < p5 p6 p7 p8 >
> > > > [    3.159393] 0x000000880000-0x000020000000 : "File System"
> > > > [    3.179534] omap_hsmmc 480b4000.mmc: omap_device_late_idle: enabled but no driver.  Idling
> >
> > I'm guessing that this is the key line.  It seems to come from
> > omap_device_late_idle().
> >
> > I don't know tons about that function, but a quick guess is that it needs a:
> >
> > wait_for_device_probe();
> >
> > ...at the start of it.  It seems like it's trying to idle devices that
> > never got probed but not actually waiting for all devices to probe.
> > It's just assuming that everything is done by late_initcall_sync().
> >
> hmm, not sure, we have:
> if (od->_driver_status != BUS_NOTIFY_BOUND_DRIVER &&
>             od->_driver_status != BUS_NOTIFY_BIND_DRIVER) {
>                 if (od->_state == OMAP_DEVICE_STATE_ENABLED) {
>                         dev_warn(dev, "%s: enabled but no driver.  Idling\n",
>                                  __func__);
>                         omap_device_idle(pdev);
>                 }
>         }
>
> apparently there is no code to set _driver_status to
> BUS_NOTIFY_BOUND_DRIVER. I think that is the key problem. I will try to
> create a patch to fix that.

I am seeing something similar on my DM3730

>
> Regards,
> Andreas
