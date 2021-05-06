Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B567E375666
	for <lists+linux-omap@lfdr.de>; Thu,  6 May 2021 17:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235088AbhEFPUA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 6 May 2021 11:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbhEFPT7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 6 May 2021 11:19:59 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88FFC061761
        for <linux-omap@vger.kernel.org>; Thu,  6 May 2021 08:18:59 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id u3so8793099eja.12
        for <linux-omap@vger.kernel.org>; Thu, 06 May 2021 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YP24ik0YFY+2RKJGevsfG1nOnOK5im66pfhuvAoWUhs=;
        b=tTFWv9t5g8z2bUpnTXSzgd4oMQ5rDcHfANsGbH2l/KJ12fZaxC562MlPcakkOelJKE
         qkQqlKZy0fmmxgU6Cmz/v28R9oxYZTUuy15uAUPkLuFgDuXwcVJjdC0Pc7evTOJdHO4w
         hdUBuqe8LhNqY1t34yN54kkLIHhukOFpaD5/xup2VIfLJ7pxwhtIyLQpJYVD8iM9a+fk
         iJFqCJ4L9R/at6eGqdFnhvBJXQP2X6OZCq7A0iU3G4II5jP3E7VGbFFS1Pbecvsblo7j
         8xqUa1ucUEf7hAd2u4jrDGdJj0s+28wwYHXg7xhSZGF2IEVP+L35prpsLf/HkG9tApWn
         0btQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YP24ik0YFY+2RKJGevsfG1nOnOK5im66pfhuvAoWUhs=;
        b=Tft58hUjKJkMnU1ZzXd/GUV++vvTdmJrfzxOhEnCi9O4VBbdhXj6XP/LMJGgex/jGw
         GRs1gzPKcu+v3P5f/Eq1FMZeHcxItGwG2gi8lYNXjxJgSsVveny5eVLnAGnqaX7yKHWc
         oqlILmBMjM2v6T1/jjI92ekqzOpEzeyNgJjLgXRLN9PVol/7eKCN4NvyCQ/gsk1UHLGA
         x/F6OY4CT/HTbMfrjX4pyfjR38xB28i7UJzeGVIVEXa8rtC0qR7EZiz9vJR5b/02RNAA
         dxioyk/08eOZx1pc/tJEfeayC1cejVWoAmfxj05skLY+c0vKgpuaug7/5F8Q4oxWjOlE
         0OaQ==
X-Gm-Message-State: AOAM533nJcspoKVSY8ZN2ONvdlscmUtC0HIWESvh/G+k47LiXSyOflNp
        NijBKKZOjvVE21WEyuZbpc6yv8FLL9ivZsCjGg+2tvnD22ZZRxIM
X-Google-Smtp-Source: ABdhPJxJRLbaNyR1550tOnih64Mj/K5bU7JfR6N4gmFUaxx/UgY/dqtwMx5DdgAPz5/iy5AzL3dAbCAC/WJxw2zyaMg=
X-Received: by 2002:a17:906:4f91:: with SMTP id o17mr4909703eju.503.1620314338343;
 Thu, 06 May 2021 08:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtTN6ug3eBAW3wMcDeESUo+ebj7L5HBe5_fj4uqDExFQg@mail.gmail.com>
 <YJPYvsdkfx4JD4vT@atomide.com>
In-Reply-To: <YJPYvsdkfx4JD4vT@atomide.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 6 May 2021 20:48:46 +0530
Message-ID: <CA+G9fYv48aJ6tmSaf_HtRKHse4yN40hEYSPR5=A3W6HRoJ8p_g@mail.gmail.com>
Subject: Re: #regzb introduced: 98feab31ac49 ("ARM: OMAP2+: Drop legacy
 platform data for dra7 sata")
To:     Tony Lindgren <tony@atomide.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkft-triage@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        regressions@lists.linux.dev,
        Benoit Cousson <bcousson@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 6 May 2021 at 17:23, Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * Naresh Kamboju <naresh.kamboju@linaro.org> [210506 11:00]:
> > Our bisect script pointed this as the first bad commit on linux
> > mainline master branch.
> >
> > Full test log:
> > ----------------
> > SATA detection failed log link,
> > https://lkft.validation.linaro.org/scheduler/job/2580998#L1973
> >
> > --
> > commit 98feab31ac491400f28b76a04dabd18ce21e91ba
> > Author: Tony Lindgren <tony@atomide.com>
> > Date:   Wed Mar 10 14:03:51 2021 +0200
> >
> >     ARM: OMAP2+: Drop legacy platform data for dra7 sata
>
> Thanks for the report, looks like we are now missing the sata related
> quirk flags compared to the patch above.
>
> Below is a quick patch to add the missing quirk flags that might help
> if you can give it a try.

The reported problem was solved by this patch. Thank you.
Please add reported and tested by tags.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

>
> Regards,
>
> Tony
>
> 8< --------------------------
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -1459,6 +1459,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
>                    SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
>         SYSC_QUIRK("tptc", 0, 0, -ENODEV, -ENODEV, 0x40007c00, 0xffffffff,
>                    SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
> +       SYSC_QUIRK("sata", 0, 0xfc, 0x1100, -ENODEV, 0x5e412000, 0xffffffff,
> +                  SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
>         SYSC_QUIRK("usb_host_hs", 0, 0, 0x10, 0x14, 0x50700100, 0xffffffff,
>                    SYSC_QUIRK_SWSUP_SIDLE | SYSC_QUIRK_SWSUP_MSTANDBY),
>         SYSC_QUIRK("usb_host_hs", 0, 0, 0x10, -ENODEV, 0x50700101, 0xffffffff,
> @@ -1524,7 +1526,6 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
>         SYSC_QUIRK("prcm", 0, 0, -ENODEV, -ENODEV, 0x40000400, 0xffffffff, 0),
>         SYSC_QUIRK("rfbi", 0x4832a800, 0, 0x10, 0x14, 0x00000010, 0xffffffff, 0),
>         SYSC_QUIRK("rfbi", 0x58002000, 0, 0x10, 0x14, 0x00000010, 0xffffffff, 0),
> -       SYSC_QUIRK("sata", 0, 0xfc, 0x1100, -ENODEV, 0x5e412000, 0xffffffff, 0),
>         SYSC_QUIRK("scm", 0, 0, 0x10, -ENODEV, 0x40000900, 0xffffffff, 0),
>         SYSC_QUIRK("scm", 0, 0, -ENODEV, -ENODEV, 0x4e8b0100, 0xffffffff, 0),
>         SYSC_QUIRK("scm", 0, 0, -ENODEV, -ENODEV, 0x4f000100, 0xffffffff, 0),
> --
> 2.31.1


Tested full log,
https://lkft.validation.linaro.org/scheduler/job/2641881#L1940

- Naresh
