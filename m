Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3718E4F36E8
	for <lists+linux-omap@lfdr.de>; Tue,  5 Apr 2022 16:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238835AbiDELI5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Apr 2022 07:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349056AbiDEJtD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Apr 2022 05:49:03 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0191A94E8
        for <linux-omap@vger.kernel.org>; Tue,  5 Apr 2022 02:39:23 -0700 (PDT)
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MBmDy-1nhByQ014m-00C93Z for <linux-omap@vger.kernel.org>; Tue, 05 Apr
 2022 11:39:22 +0200
Received: by mail-wm1-f53.google.com with SMTP id m67-20020a1ca346000000b0038e6a1b218aso1251160wme.2
        for <linux-omap@vger.kernel.org>; Tue, 05 Apr 2022 02:39:21 -0700 (PDT)
X-Gm-Message-State: AOAM533R2aKDhnRUHkP7TLJ6gktZuj/hFeMCPu7yHwarSsv2Bt5+yIQR
        /Kp2l/5pXwOUdX2Ud8Jvo0VCJmbx/eiw0Wx4Big=
X-Google-Smtp-Source: ABdhPJyha9IhwgZqq4KZQR2YFzD51eO0xhzMptZ0Fnu2Qn7Atd0aZHv6SHvDvUdaE3ChYjC+EwJM/NlldhCRE3uP3Po=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr2222024wmc.94.1649151561635; Tue, 05
 Apr 2022 02:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220402195155.141364-1-jmkrzyszt@gmail.com>
In-Reply-To: <20220402195155.141364-1-jmkrzyszt@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 5 Apr 2022 11:39:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0ALOvTwFgr=r7v_E6HXjcUTYnkMqQrGc7fmdPaQ3nm3Q@mail.gmail.com>
Message-ID: <CAK8P3a0ALOvTwFgr=r7v_E6HXjcUTYnkMqQrGc7fmdPaQ3nm3Q@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: OMAP1: Prepare for conversion of OMAP1 clocks to CCF
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:F7tFhJDEzzpcCUTDrJYm/Pwdv61kArygL5dJnIoCZiq7cOIeO7Q
 X3/2yRrWE/pokO7yMlOnbkHUMXLMi8sKn04FiGe60J6J3FD19m9SJ4LEDi9TCLcTG5Fj2ge
 BwD4opJYZwgmVtlhoHmW9wfkuoHPTMx5YJGbDGo4sNm83Zr70yKkMkdE9PMcxk5J6K+8Mfn
 F1DfMPcYBWpJbsskb1RoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vY7uAhUbYRo=:fH/3noaBAo7RLpiiUQaCbJ
 t0FY+eb7QpC9y/PXs2cEZcneyXpUJyaSmKXbc/CQT3ilCCzTJcAaw04iqY6zULwoBdWPrnVLn
 bswte3YPArSxs9QJti0hWKCycjYAgTAL8wj54YGZJAXZ1Fa6kCeIMw2l2WLk6+GfkHuHFWhP7
 J6YgA7MiUk6I0pfKuoTBM7/64FipUDC4QZal6sHenkA9+OKJOr1bSEiHLINYfvfJHnX1h8s8N
 OgWIWP7bx8+SMW4TIk1RsGYWX+UvchIzDeqpy3TXKjwaZ4F0o92rImKtwXuaXOqjZHIrJCxlJ
 r9nUU9UCF3hDBEV9pNZ1nXk7yqAkq7y+Xw4NUamvH5/iWSxkB3f7YPA/9V8i8j1iA85Z1zX/w
 Yq4FH6e+C4lAGhBaY+TZ791KA/vfmc47+MlPOCngzvlz5s3/8KrhUDP4wWGMrLYiK+WyUL4CR
 Q41C9SQ8dpavdl3jp4P+haNMNrCk0ECJ6lxsODqo1mVLMzj4x3trnY3F1PppddHtFRsbTiOUi
 +S/zlEnldkMjMuyp8SSP5UCiedBhBx+HS3J+8fO1tifumXAilkfHFiJZcPsFOnvZFMJUSXKuh
 3nMBB8VxMIc/EiX1vtTNngNJGX/R9vm2m8igvZnfGIi6HYu/ZgEd6ihdva1ol1cS87XYeMORX
 VSr6MFrG7udz5zQeulcL021+GyJwUDDDCE9lk8TC6+5tC6jg8dFfm+3pWCXoo7KeDaOI=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Apr 2, 2022 at 9:51 PM Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
>
> In preparation for conversion of OMAP1 clocks to common clock framework,
> identify arch/arm/mach-omap1 local users of those clocks and update them
> to call clk_prepare_enable/clk_disable_unprepare() instead of just
> clk_enable/disable(), as required by CCF implementation of clock API.
>
> Users which reside under /drivers will be updated via separate patches,
> split out from v2 and already submitted.
>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---
>  arch/arm/mach-omap1/mcbsp.c    | 8 ++++----
>  arch/arm/mach-omap1/ocpi.c     | 4 ++--
>  arch/arm/mach-omap1/serial.c   | 6 +++---
>  arch/arm/mach-omap1/timer32k.c | 2 +-
>  4 files changed, 10 insertions(+), 10 deletions(-)

This all looks good to me. I have now rebased my omap1 multiplatform series
on the latest kernel and integrated some of your new work, see [1].

I have also finished up the multiplatform conversion for all other ARMv4T
and ARMv5 platforms and sent them out, hopefully we are getting into the
endgame with this.

Are you able to test your CCF patches in combination with my series?
It would be great if we could get this all working in time for 5.19.

         Arnd

[1] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=omap1-multiplatform-5.18
