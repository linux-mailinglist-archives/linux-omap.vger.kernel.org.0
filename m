Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 823552CE14B
	for <lists+linux-omap@lfdr.de>; Thu,  3 Dec 2020 23:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729274AbgLCWEl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Dec 2020 17:04:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLCWEk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Dec 2020 17:04:40 -0500
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E00C061A4F
        for <linux-omap@vger.kernel.org>; Thu,  3 Dec 2020 14:04:00 -0800 (PST)
Received: by mail-ua1-x944.google.com with SMTP id k12so1192251uae.13
        for <linux-omap@vger.kernel.org>; Thu, 03 Dec 2020 14:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SIDKM8jn2UL3/HwqIdzGXAPrm6AewabVMy3Jd/dgMoc=;
        b=HsNQW5OgD5rc5Ek073FX/DjEQjYeyJoupo659u+pvwJ9/3ZOhcc9rdkQQpm7+/Y0ZQ
         UtM/2CEhq8MHVY0rYzW/PJONTQ1yDWteqd/QLIdMvHobaADr7jhqHZAjTbcox4ieeF4B
         TYoPEsqvhSai3GKrk5NvQps1v39o1keJD2WfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SIDKM8jn2UL3/HwqIdzGXAPrm6AewabVMy3Jd/dgMoc=;
        b=lXmU0qFEF/C2evr5MZZZ3yU/I/xXgbE4lgalFlelFpD/Wp6jIhzMpRGvBkiU0KUEjj
         aA0hP3Jcwv/uDxztCyWhpSbOyyZvfXEfcpcbFYFs2qtQATVVmH3Q4hBL/Bd96NssFcZX
         Tc1axcEbotk2+svfMeEymiVOqnZ3CFA6i2S6Khq0hGAV/zBlN9jDiVnldHe3OOrW9u2a
         t8AfBgjRSR0Opmz52EYo4Op5/IUmzNx6wacm2AMNjRgdzpyDqfJ3q8pEPr5X2GEdoeM4
         kAap16e1IJX3TwfK0qFVxTP6N0O9rDMYMbvZUW2tZ0alpX24K1HI3kbpX7RxBMY1Edz2
         TyxA==
X-Gm-Message-State: AOAM530MVVMHSdkQJgwTlMkJ/IO1QpMKdRN/VnC9S6TigJLZJagrAvgB
        bGXXMvUu73Ox7/nDro27NVlfM83oGp59sA==
X-Google-Smtp-Source: ABdhPJwSJe4IUB9Fa7ASeMbHBBJ83pBBZF2o71BSV714LSDemwNWlcHXZNT6u5gd7BJ8NzDocMTCWA==
X-Received: by 2002:ab0:2a4a:: with SMTP id p10mr1074618uar.95.1607033039466;
        Thu, 03 Dec 2020 14:03:59 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id s2sm123521vkd.24.2020.12.03.14.03.58
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 14:03:58 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id q68so1207797uaq.3
        for <linux-omap@vger.kernel.org>; Thu, 03 Dec 2020 14:03:58 -0800 (PST)
X-Received: by 2002:ab0:60b1:: with SMTP id f17mr1063797uam.104.1607033038418;
 Thu, 03 Dec 2020 14:03:58 -0800 (PST)
MIME-Version: 1.0
References: <20201201210039.258d3fed@aktux> <20201203224309.5b5e0b50@aktux>
In-Reply-To: <20201203224309.5b5e0b50@aktux>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Dec 2020 14:03:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VucTxW3PxtrN-Dye4h0LravXd-wHLKU91TaKe0eQ4TyA@mail.gmail.com>
Message-ID: <CAD=FV=VucTxW3PxtrN-Dye4h0LravXd-wHLKU91TaKe0eQ4TyA@mail.gmail.com>
Subject: Re: [REGRESSION] mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that
 existed in v4.4
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
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

Hi,

On Thu, Dec 3, 2020 at 1:43 PM Andreas Kemnade <andreas@kemnade.info> wrote:
>
> On Tue, 1 Dec 2020 21:00:39 +0100
> Andreas Kemnade <andreas@kemnade.info> wrote:
>
> > Hi,
> >
> > during probing of second mmc host on the GTA04A5 which has a
> > WL1835 wifi chip attached, I get the following oops. From a first glance
> > this seems to be a timing sensitive. Maybe it rings some bells for someone...
> > so I hesitate a bit to start the bisect job.
> Did the bisect job.
> 21b2cec61c04 (mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4)
>
> is the evil commit. Reverting it on top of v5.10-rc6 solves the problem.
>
> > Wild guessing: bus width is set while mmc module is not active, so registers
> > are not accessible.
> > Kernel configuration is omap2plus_defconfig
> >
> > Regards,
> > Andreas
> >
> >

...snip...

> > [    3.152587]  mmcblk0: p1 p2 p3 p4 < p5 p6 p7 p8 >
> > [    3.159393] 0x000000880000-0x000020000000 : "File System"
> > [    3.179534] omap_hsmmc 480b4000.mmc: omap_device_late_idle: enabled but no driver.  Idling

I'm guessing that this is the key line.  It seems to come from
omap_device_late_idle().

I don't know tons about that function, but a quick guess is that it needs a:

wait_for_device_probe();

...at the start of it.  It seems like it's trying to idle devices that
never got probed but not actually waiting for all devices to probe.
It's just assuming that everything is done by late_initcall_sync().

If that doesn't work, you could use the heavy hammer of changing
things to "PROBE_FORCE_SYNCHRONOUS" in your MMC driver, but IMO that's
kinda papering over the problem...

-Doug
