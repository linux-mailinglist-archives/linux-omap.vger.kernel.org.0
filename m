Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8094E3762D4
	for <lists+linux-omap@lfdr.de>; Fri,  7 May 2021 11:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236159AbhEGJ24 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 May 2021 05:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234463AbhEGJ24 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 7 May 2021 05:28:56 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC47CC061761
        for <linux-omap@vger.kernel.org>; Fri,  7 May 2021 02:27:55 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id n15so4800752edw.8
        for <linux-omap@vger.kernel.org>; Fri, 07 May 2021 02:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J/gYeck4lUM7grnsx8SQpzJSN/XTKVSxSWXD4iFD/oQ=;
        b=D10IPK4b2PhhCu2hnFKzAGnI6ajL4rQRqhnhaS7iadmv8UVlRbi2vinA9qsKGa0Uff
         uNkvxsHqgLTxb17g0dBW6Gg3/WIH4FDYH4H1P07+O4nMgGjT7CJJ7AcvLMItPyrkvLJ3
         QxpKBE8gpcflFZLYfOBhJUgzDF2rKWkSQlt8qoOOPUai4RttjARJR2+CNztxfGS0hqf/
         8hAkp4XgWb8Vq3fW1LVsgbugxdSaY5cs6CvU4EqdcHbLvvlZnofh9WwtPL5PiA7CW6Mj
         /ngVvCWwi1BCvWxoBjS13zAfKznt4ROeygEHJwm0ZMOO33frRdKEB0RwOO08iYNpxow9
         NlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J/gYeck4lUM7grnsx8SQpzJSN/XTKVSxSWXD4iFD/oQ=;
        b=uFPrQTgzsT22WdsNeaN7b7GeA0Qpki4rLtJpDsRUyz71FBQFz8xhV9PTYaK1sPVudy
         QRtkXGT/RRs7M58tu3+T4PROvO0+WkZYiHQkE1py8C/+lB8B6G6N9UEzbiFgpxKWXpcu
         siiM7XOqBF+iCFffglknxQfoWnpZyECxHzYsvFLKqR+hApmj7D+AYXdP1gt0X4S8hvBA
         B4k8YC7xCLo01cUcaW8uJ8zHkw2WiUtpSdLjFSwBZcGS/Y93OhF/LU3aTMvM06m9XyrL
         z5r6UifdRzRMTdQEeFkHj58hWicTRn+eZoGQ6KEf+uYkqin8qvIPIVEizBNijAY7UM6I
         ZgIw==
X-Gm-Message-State: AOAM533W3kFzybfnZSQ/ldkP38n2ln4OZPX66FufPV8xGg0z1L6VOva7
        yzCVg8rHk+GSeXOTIGbmbxP+8o6TKLAw0VMTVjpRuw==
X-Google-Smtp-Source: ABdhPJwiqY1yRCcURp1ZifCn2m63FfU/YD9avVmXW4JW5mY4TK3HVNFv7i0w5rNQ22zTBKZ4ABKAXaL2OSLRZ5Q2W7o=
X-Received: by 2002:aa7:c15a:: with SMTP id r26mr10395669edp.78.1620379674473;
 Fri, 07 May 2021 02:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtTN6ug3eBAW3wMcDeESUo+ebj7L5HBe5_fj4uqDExFQg@mail.gmail.com>
 <YJPYvsdkfx4JD4vT@atomide.com> <CA+G9fYv48aJ6tmSaf_HtRKHse4yN40hEYSPR5=A3W6HRoJ8p_g@mail.gmail.com>
 <YJTz+D9Sp8Eyp+iw@atomide.com> <e896704c-c13a-739d-0723-22fec35406ed@leemhuis.info>
In-Reply-To: <e896704c-c13a-739d-0723-22fec35406ed@leemhuis.info>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 7 May 2021 14:57:43 +0530
Message-ID: <CA+G9fYsia4mfJpKXcz0Px3oDdsArHatqe0-rWWWC4iD47vj1oA@mail.gmail.com>
Subject: Re: #regzb introduced: 98feab31ac49 ("ARM: OMAP2+: Drop legacy
 platform data for dra7 sata")
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Tony Lindgren <tony@atomide.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
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

On Fri, 7 May 2021 at 13:57, Thorsten Leemhuis <linux@leemhuis.info> wrote:
>
> On 07.05.21 10:02, Tony Lindgren wrote:
> > * Naresh Kamboju <naresh.kamboju@linaro.org> [210506 15:19]:
> >> On Thu, 6 May 2021 at 17:23, Tony Lindgren <tony@atomide.com> wrote:
> >>> * Naresh Kamboju <naresh.kamboju@linaro.org> [210506 11:00]:
> >>>> Our bisect script pointed this as the first bad commit on linux
> >>>> mainline master branch.
> >>>> commit 98feab31ac491400f28b76a04dabd18ce21e91ba
> >>>> Author: Tony Lindgren <tony@atomide.com>
> >>>> Date:   Wed Mar 10 14:03:51 2021 +0200
> >>>>     ARM: OMAP2+: Drop legacy platform data for dra7 sata
> >>> Thanks for the report, looks like we are now missing the sata related
> >>> quirk flags compared to the patch above.
> >>> Below is a quick patch to add the missing quirk flags that might help
> >>> if you can give it a try.
> >> The reported problem was solved by this patch. Thank you.
> >> Please add reported and tested by tags.
> >> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> >> Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > OK good to hear and thanks for testing. Will send out a proper patch.
>
> Great to see that this is about to be fixed. And Naresh, many thx for
> giving the #regzb tag a try, even if regzbot (shameless plug for the
> unaware: https://linux-regtracking.leemhuis.info/post/regzbot-approach/
> ) is not up and running already, much appreciated!
>
> But FWIW, you don't need to add the tag to the subject; in fact, better
> use it for it's intended purpose. Instead add the tag to the mail's
> body, like this:
>
> #regzb introduced: 98feab31ac49 ("ARM: OMAP2+: Drop legacy platform data
> for dra7 sata")

Thanks for sharing more details about it.
Next time I will add this to the mail's body.

>
> Just ensure there is a blank line after that, as regzbot will have to
> deal with line breaks (as can be seen above) and somehow needs to decide
> where to stop. ;-)

Alright.

>
> Ohh, and Tony, if you want to do me a favour please include
>
> Link:
> https://lore.kernel.org/regressions/CA+G9fYtTN6ug3eBAW3wMcDeESUo+ebj7L5HBe5_fj4uqDExFQg@mail.gmail.com/
>
> in the commit message of the fix, then I have some real data already at
> hand to test regzbot in practice. :-D

- Naresh
