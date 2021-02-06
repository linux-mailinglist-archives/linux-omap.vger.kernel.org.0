Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8417D312044
	for <lists+linux-omap@lfdr.de>; Sat,  6 Feb 2021 23:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbhBFWVu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 6 Feb 2021 17:21:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhBFWVt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 6 Feb 2021 17:21:49 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CABEC06174A
        for <linux-omap@vger.kernel.org>; Sat,  6 Feb 2021 14:21:09 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id y10so5399201plk.7
        for <linux-omap@vger.kernel.org>; Sat, 06 Feb 2021 14:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=4bvVgwtWVRLet4/Fktf8R/vrkt3LRINWCBwZLyzrPPo=;
        b=RxIIVXJrEMcq8L4vt4EhIjd5KglflaSZYEAVjm7OPjzjnTNZImC6YYR8uYy7Cn39bQ
         TmAhRyC9bAd+mfDxcMrxmy7+t0odpFSSV2XfDcm8jy0FBzSA8F4f/XJHnIQVhAC+OJm7
         VXhdr8gaSBky2soBOZFiLvk/IrVIkopPHwl9/8XJ8OnLquWlONTMfvNjGP91Nd4HjUsN
         T1NPc7fqBfcPppojrrtyXn/wUdwxaKWpklpEYOzlW4eY2itZLHwFk55fEpUhyjxluDrQ
         yoL29WxLO9JjJTyo785Nmj0wjntOAlQYIQvVeq4DZjDh1EST2wfiB4S+ufyRg8HtFvyx
         U5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=4bvVgwtWVRLet4/Fktf8R/vrkt3LRINWCBwZLyzrPPo=;
        b=ILyY1gyvUSQOvKjF8KT/YcVcydFyYQdpqebHo8IpBR2bCCC+GHwLiUmcUACDFyfPs9
         SqQod+zbFoBlI0BGHmB2pam4Fr0JrcdPEUfV18yAFfw8gZx+CPfj+EZ9sLrBlMu1GnUw
         Ku4uEwEv7U28GUy7YTX8+DbizzQRwiM/oYCEAOQQGFUMm01WllYmOhgmwv9AAIAI0PuC
         n63Ow53XCOgjTpRBUYzhC0qapycwug6oz3xoQT/Ocmqxb89XZKyUNV51wvDJHk+Ia4MC
         3uD7VovOxwCCmZ0hJ2LFv1WUpWs5Jb0HEmlDi+we8j+pKL7TAOPKQ9ND1NvuHOtTQhGD
         EF3w==
X-Gm-Message-State: AOAM533yexw3jjmpxSNYe1v8WHDHvOC9BcfJ5YygabzzUn06UIdfF+j+
        XimyIXrlPJ1Ixlzh8UHFlitmxeModJxv5d9hA9S8nxTtyx5gBg==
X-Google-Smtp-Source: ABdhPJwaYfz+tW3u+JIchP4FvdZMNt+AHfJZMd3/kZ8FxwPl+S/Ku9LY3sczllBnANS1Dk5hhhkYJjhqeYgr18mjjRg=
X-Received: by 2002:a17:902:ed8d:b029:e2:b3fb:ca95 with SMTP id
 e13-20020a170902ed8db02900e2b3fbca95mr7982402plj.17.1612650068292; Sat, 06
 Feb 2021 14:21:08 -0800 (PST)
MIME-Version: 1.0
References: <CAHCN7xLXK774FTKVXPM1LQbg0KQm+7ASFxtiaYZsUbGKnwYfDQ@mail.gmail.com>
In-Reply-To: <CAHCN7xLXK774FTKVXPM1LQbg0KQm+7ASFxtiaYZsUbGKnwYfDQ@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 6 Feb 2021 16:20:57 -0600
Message-ID: <CAHCN7xKvUx7q0GL+JV8O7MEYo1zb8g2ePbHKQg8SxRmmsj+b6g@mail.gmail.com>
Subject: Re: DM3730 Suspend-Resume with 5.11-rc6
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Feb 6, 2021 at 3:57 PM Adam Ford <aford173@gmail.com> wrote:
>
> I am having issues with suspend on a DM3730 running 5.11-rc6, and it
> seems like core_pwrdm may be the issue.
>
> # echo mem > /sys/power/state
> [   82.024963] PM: suspend entry (deep)
> [   82.053283] Filesystems sync: 0.024 seconds
> [   82.059600] Freezing user space processes ... (elapsed 0.001 seconds) done.
> [   82.068511] OOM killer disabled.
> [   82.071777] Freezing remaining freezable tasks ... (elapsed 0.001
> seconds) done.
> [   82.647033] Disabling non-boot CPUs ...
> [   82.651000] Powerdomain (core_pwrdm) didn't enter target state 0
> [   82.651000] Could not enter target state in pm_suspend
> [   82.896881] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
>  [   83.049072] musb-hdrc musb-hdrc.2.auto: musb_set_peripheral:
> already in peripheral mode: 80
> [   83.519439] OOM killer enabled.
> [   83.522674] Restarting tasks ... done.
> [   83.589050] PM: suspend exit
> sh: write error: Operation not permitted
> #
>
> I am not that versed with the power management stuff and the
> references on elinux.org are outdated, and I was hoping someone might
> have some suggestions.
>
> Does anyone else have any issues?

I forgot to include some debug stuff

#  cat /sys/kernel/debug/pm_debug/count
usbhost_pwrdm (ON),OFF:293,RET:1,INA:0,ON:295,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
sgx_pwrdm (OFF),OFF:1,RET:0,INA:1,ON:2,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
core_pwrdm (ON),OFF:0,RET:0,INA:0,ON:1,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0,RET-MEMBANK2-OFF:0
per_pwrdm (ON),OFF:2,RET:1,INA:0,ON:4,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
dss_pwrdm (ON),OFF:293,RET:1,INA:0,ON:295,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
cam_pwrdm (ON),OFF:5,RET:1,INA:0,ON:7,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
neon_pwrdm (ON),OFF:13,RET:173,INA:109,ON:296,RET-LOGIC-OFF:0
mpu_pwrdm (ON),OFF:12,RET:173,INA:109,ON:295,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0
iva2_pwrdm (OFF),OFF:3,RET:2,INA:0,ON:5,RET-LOGIC-OFF:0,RET-MEMBANK1-OFF:0,RET-MEMBANK2-OFF:0,RET-MEMBANK3-OFF:0,RET-MEMBANK4-OFF:0
usbhost_clkdm->usbhost_pwrdm (1)
sgx_clkdm->sgx_pwrdm (0)
per_clkdm->per_pwrdm (18)
cam_clkdm->cam_pwrdm (1)
dss_clkdm->dss_pwrdm (2)
d2d_clkdm->core_pwrdm (0)
iva2_clkdm->iva2_pwrdm (0)
mpu_clkdm->mpu_pwrdm (0)
core_l4_clkdm->core_pwrdm (22)
core_l3_clkdm->core_pwrdm (1)
neon_clkdm->neon_pwrdm (0)



>
> adam
