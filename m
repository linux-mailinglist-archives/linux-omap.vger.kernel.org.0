Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC3F32B1C8
	for <lists+linux-omap@lfdr.de>; Wed,  3 Mar 2021 04:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240687AbhCCAsD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 Mar 2021 19:48:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347855AbhCBQc0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 2 Mar 2021 11:32:26 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FF0C06178B
        for <linux-omap@vger.kernel.org>; Tue,  2 Mar 2021 08:21:36 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id a17so24691685ljq.2
        for <linux-omap@vger.kernel.org>; Tue, 02 Mar 2021 08:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dDtVuAUG8eYI5Eln5QS/TclUSCWz1TjGe2OhWQ2Hzok=;
        b=if3nP/oZALnybjJAUkUtzqsvs3YK7lJTKnmGNAKAtkwkVzIB8mFHuhnw39Age4qxUS
         UXw4iYbDW54LVkGsJpSlpCufhFpXSXWrspZnZVQvzvmbL4hoMK6k1yEd5RN5BV+l0zKp
         tXtWk5HPWV2fweqJVtX8sHIWvuZWbxVoSpCFOUKgPtdFaCV2kH7EuRSveUN20qcFG1og
         wyrqlkSN21mX7hX7xxtgzoot8V4HzSFxwkYFb/OJ+vf7aE1D4NJTbKYunNSiNEI9kP9y
         s+wCBi42PEGQZkVQoauPMQTxxO1r/MHtP+jvcnpmfUsTbIdbT4RlvrpKFT5uBgM18SPw
         Mw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dDtVuAUG8eYI5Eln5QS/TclUSCWz1TjGe2OhWQ2Hzok=;
        b=DWY406Zq0g1B6Pbi1ONtINuAunRQWuZBTBG6SGxEfXZxJPdIiTqINiZOV8Bx9+zIKR
         M2Rd8Ac1qbjPuJwGTTT/Mb0C9B03ytW+9odqHs7L9tMJfuwZdzv061w/e79+9SXaRzUU
         0q7PUSzA1c4cnFQuEzsAA63pFPAXFHT7KEk1EMPOnqOzGNa0RIDAfPzR9pZVPzQjPB/S
         ekumR4L5M+eDbiTcD4TObxioC6JTYqANmNx6oD1jUOosLkoCNwMz8021kkCtcLos+7YV
         2PX8Ppk3NWnrYbD0sZbJfGJaZZQct2JA8m1KwZZ8z5WExBXLjUEiKWQN57klF1qmtr0R
         zQYQ==
X-Gm-Message-State: AOAM532RhSS62QiKUNB4R2TPIgglDnejFV3q+3fQKuyvaiHNDRTPenjo
        tHMsS8YFL/g/++702T5UYP2PVeGALDNB3fPXF6A9Sg==
X-Google-Smtp-Source: ABdhPJzXqrYBkkHlZel98Kbs7UOBikTi+iuddAEEWTpHvvJw+VnT+XciCztoznAVqXpZN+sKledBjpv4CVaTd6nqOkQ=
X-Received: by 2002:a2e:9041:: with SMTP id n1mr12550220ljg.273.1614702094699;
 Tue, 02 Mar 2021 08:21:34 -0800 (PST)
MIME-Version: 1.0
References: <20210302011813.2331879-1-alexander.sverdlin@gmail.com>
In-Reply-To: <20210302011813.2331879-1-alexander.sverdlin@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 17:21:23 +0100
Message-ID: <CACRpkdYErJH5RUjL+jPC5vnaqGiOqBwHsr0E42wOWrpBGrpS3w@mail.gmail.com>
Subject: Re: [PATCH] gpio: omap: Honor "aliases" node
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Mar 2, 2021 at 2:18 AM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:

> Currently the naming of the GPIO chips depends on their order in the DT,
> but also on the kernel version (I've noticed the change from v5.10.x to
> v5.11). Honor the persistent enumeration in the "aliases" node like other
> GPIO drivers do.
>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Yes, I noticed checkpatch "WARNING: DT binding docs and includes should be
> a separate patch."
> However, the parts below are tiny and barely make sense separately.

I've shut it down in the past because the instance ordering is a
linuxism and the needs are in the Linux userspace somehow.
It is different from a UART for example, which always need to
be at the same place on any operating system, hence it has an
alias.

For kernelspace the instance order should not matter, since
all resources are obtained from the device tree anyway
by phandle.

For userspace:
The way to determine topology in Linux userspace is to use sysfs,
and combined with the GPIO character device this provides a
unique ID for each GPIO chip and line on the system.

/sys/bus/gpio/devices/gpiochip0/
/sys/bus/gpio/devices/gpiochip1/

etc can change, but these appear as PCI, I2C, SPI, platform
etc nodes as well. On my PC:

/sys/devices/pci0000:00/0000:00:1a.0/usb1/1-1/1-1.5/1-1.5:1.0/gpiochip0

It's pretty clear where that gpiochip sits.

Yours,
Linus Walleij
