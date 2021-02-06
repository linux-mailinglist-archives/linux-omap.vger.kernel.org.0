Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDCF31203C
	for <lists+linux-omap@lfdr.de>; Sat,  6 Feb 2021 22:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbhBFV6N (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 6 Feb 2021 16:58:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhBFV6N (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 6 Feb 2021 16:58:13 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB06C06174A
        for <linux-omap@vger.kernel.org>; Sat,  6 Feb 2021 13:57:32 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id u11so5361628plg.13
        for <linux-omap@vger.kernel.org>; Sat, 06 Feb 2021 13:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=fKSrDzYYS1DVm77baWFlfXa1LzWdxJZEgPegFo92j6Y=;
        b=l2Jzm7SQwcyN6QtLuZglQnX26Xc6QJNS9JrFqJsp8JYUrSt2IFpMQ68FlvXPLI2cLp
         Hwq7vOKgSpYsZLj0sQ4be9WVfTpCJOi9DAdB21IlTJUrCoiY+7R4P1wzbjLRcM4LYYQj
         dLKAVxGsOOYQvEFrLhi44wQsCJQwjD2C05sC4I8Ao9+KHP51Ks9AzbAQjMWGK31k4l2l
         ZpE+rxxzWh1STfJNrn3cZ/qy+dW21u9ad9u4QgLkKaXIMOH+dUuhI1oLLBDiRck6r3ij
         EYVWgfJrxngkscXKofc3AbEAv8qDFgCkGCwzR2q+NYmlYVdF7VaVlD7Mi2kaDK4hLeeM
         GIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=fKSrDzYYS1DVm77baWFlfXa1LzWdxJZEgPegFo92j6Y=;
        b=H5Lo8jkf4oPYb7kdsX7yWaKoELfKSLLDuQdreyQW9sJdVzlbnC3cjfzZdvxR0cfZKI
         s4019mNEy3udwrcjB/wAab11xhMFQ7/l1TKvlqyHD0V35h3Q9lIm6Glm1RKhMk6m05A+
         +tAZSo6xFQAToKZpjjkUHiBa+90wiQOnUadtDgb+/mwK7hQ1Mbl7K/7ZUnDSqnHNBC6P
         xmfpU6xEcusOep/5sBB7O23wsaXUrlB+fT609EIwnC+BBO9v+iC01DfiZfsgBUdgApTV
         pvkO9tjExHL0fIdRWxGvtaLWfDIMuZmTGwaiUyFWE/FguFmcekBlibiYsgsGt19D5yul
         iV0Q==
X-Gm-Message-State: AOAM532UDoGkHrg03cCbc+m1ua9yjytUOwMoWHOWSVu64m6ga2EEnbaY
        H5e4jNstRmuSi5AVVGT5WkEwGVq05cC+V/ii+YB3I5Xc1R7O9g==
X-Google-Smtp-Source: ABdhPJxNdCPgrBFSngp3GknFcKIkCwAdqHDlhFMUtDIlCxofKNpiyxA5UYwea1yzdB40td+96vZlT7xXtcp0Zz9jJw8=
X-Received: by 2002:a17:902:c284:b029:e1:8863:b3d6 with SMTP id
 i4-20020a170902c284b02900e18863b3d6mr9737807pld.64.1612648652016; Sat, 06 Feb
 2021 13:57:32 -0800 (PST)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 6 Feb 2021 15:57:21 -0600
Message-ID: <CAHCN7xLXK774FTKVXPM1LQbg0KQm+7ASFxtiaYZsUbGKnwYfDQ@mail.gmail.com>
Subject: DM3730 Suspend-Resume with 5.11-rc6
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I am having issues with suspend on a DM3730 running 5.11-rc6, and it
seems like core_pwrdm may be the issue.

# echo mem > /sys/power/state
[   82.024963] PM: suspend entry (deep)
[   82.053283] Filesystems sync: 0.024 seconds
[   82.059600] Freezing user space processes ... (elapsed 0.001 seconds) done.
[   82.068511] OOM killer disabled.
[   82.071777] Freezing remaining freezable tasks ... (elapsed 0.001
seconds) done.
[   82.647033] Disabling non-boot CPUs ...
[   82.651000] Powerdomain (core_pwrdm) didn't enter target state 0
[   82.651000] Could not enter target state in pm_suspend
[   82.896881] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
 [   83.049072] musb-hdrc musb-hdrc.2.auto: musb_set_peripheral:
already in peripheral mode: 80
[   83.519439] OOM killer enabled.
[   83.522674] Restarting tasks ... done.
[   83.589050] PM: suspend exit
sh: write error: Operation not permitted
#

I am not that versed with the power management stuff and the
references on elinux.org are outdated, and I was hoping someone might
have some suggestions.

Does anyone else have any issues?

adam
