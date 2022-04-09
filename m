Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAF64FA9EA
	for <lists+linux-omap@lfdr.de>; Sat,  9 Apr 2022 19:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240144AbiDIRZa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 Apr 2022 13:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232946AbiDIRZ3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 Apr 2022 13:25:29 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1582D1FB51E
        for <linux-omap@vger.kernel.org>; Sat,  9 Apr 2022 10:23:19 -0700 (PDT)
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MfpKZ-1o9qff0nij-00gEAC for <linux-omap@vger.kernel.org>; Sat, 09 Apr
 2022 19:23:18 +0200
Received: by mail-wm1-f51.google.com with SMTP id r7so7430032wmq.2
        for <linux-omap@vger.kernel.org>; Sat, 09 Apr 2022 10:23:18 -0700 (PDT)
X-Gm-Message-State: AOAM531J3anK0ZdSJQV8cqvY6lc5AjU5rxskVmqgtUyF3mCm2cpSlGBA
        bNCVmOl3X+JkFXhNb3JnCzOZ4nTllgZsg/hStGg=
X-Google-Smtp-Source: ABdhPJzseKJHsUkJM5k6hK+bkMrSmeHI0GKJDhmK8UKoK+9CX5oGfTcspt/oWBS0hBx87KMYGL0rd4VrZSCK6HObcEQ=
X-Received: by 2002:a05:600c:1e0b:b0:38c:9ac5:b486 with SMTP id
 ay11-20020a05600c1e0b00b0038c9ac5b486mr21764703wmb.71.1649524997759; Sat, 09
 Apr 2022 10:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220402195155.141364-1-jmkrzyszt@gmail.com> <CAK8P3a0ALOvTwFgr=r7v_E6HXjcUTYnkMqQrGc7fmdPaQ3nm3Q@mail.gmail.com>
 <3167483.44csPzL39Z@dell>
In-Reply-To: <3167483.44csPzL39Z@dell>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 9 Apr 2022 19:23:01 +0200
X-Gmail-Original-Message-ID: <CAK8P3a33KCpwB2X3emyyJqDCbXwabCiJHssOgUgB_3SpiNsm6Q@mail.gmail.com>
Message-ID: <CAK8P3a33KCpwB2X3emyyJqDCbXwabCiJHssOgUgB_3SpiNsm6Q@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: OMAP1: Prepare for conversion of OMAP1 clocks to CCF
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:RYAgdNywZRSzzjIloaRrog1C6ZNORxIXgeQgrhCOlb27A84kNxW
 5kACTf9V6hZR9PX5r5eLxzwIXz3IRXxeXpTvzGmEEACHGB9PKnNryCtXnmzkj/2NLX78Cp8
 brWSznghoF6h/rsD1MAGnmo937A0sdxF7f/YhWZZ6h6ej/NRoyYXTs69lBkP9dfsDP0JqVz
 B1XMb/aP8xd6Z92wwvxYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mcPGrFkau5w=:uXJd6Zvo92R/0nKcq6O7YA
 JlTW80z7b65aKmEElwp86N4KFn1YMB24wXF4MBBEzQ1dD6iMztYsxwxC8O0gkyob6Q8JmZITa
 5EAtHwHAhDWb0lffYg95KX89/DNJ5/lKZuJf+MHnsg5bHCDIl0TEtfsSM0a4dZo3nClEny8X9
 xAGLIbYtiAMT7Hm54VnP3SNxp0niy8Ng9SzICL8KgGPi+QovjF6yiTU967ggkvqRh+3Nrpgq9
 vilIFm6qerLqO2tg/XXvVllvIHhL+x8eULEf8YgqIJzhH/aAUygcKryE4VRRoXYh8BHxL0nzk
 USTwp7n2QJAoEkLdv1ualQc7pCNRwTnDE96Hnq9ISjlJxAaJmiPv/gvp4zGPY4V7eJpGrzahG
 TXSGSX5oxjBSUcJZTj+bInomXnOgvHYW7+8no0F68fse2mvwQrR8mdnxP+Qz534m0jWr2pSrt
 6ZhDDpa2yC67CFR9iv5/j9jHOKBKtb+6oeGOKURJdlJ+6laC05tziTseTk8oIX6E94Oi8RTJ3
 cYh8X3aaStKr1lWXz45JOh1vtzQorfSl32xT+WcFi7G02vbvBDgidmZYTOjYTu1t1vAWy5HML
 3eaXu5KfkY1oDDeQUNjWyh5rsSK3lpMXMFvzuElMzc1eGlXsAuIuZZEB7vcUnJJ7X4JflpKFl
 /1M+OKG8Y60k3kiusvK+MBTJYguJcjvFrD9ueDrMESx68INsMqm3un7wyxMkuRlMTNKU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Apr 9, 2022 at 2:05 PM Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> On Tuesday, 5 April 2022 11:39:05 CEST Arnd Bergmann wrote:
> > This all looks good to me. I have now rebased my omap1 multiplatform series
> > on the latest kernel and integrated some of your new work, see [1].
> >
> > I have also finished up the multiplatform conversion for all other ARMv4T
> > and ARMv5 platforms and sent them out, hopefully we are getting into the
> > endgame with this.
> >
> > Are you able to test your CCF patches in combination with my series?
> > It would be great if we could get this all working in time for 5.19.
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=omap1-multiplatform-5.18
>
> Your branch with my CCF patches on top of it works for me on my OMAP1510
> based Amstrad Delta with the below fix:
>
> diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
> index 8cafe7819e13..292fcb0a24fc 100644
> --- a/drivers/video/fbdev/omap/omapfb_main.c
> +++ b/drivers/video/fbdev/omap/omapfb_main.c
> @@ -1623,7 +1623,7 @@ static int omapfb_do_probe(struct platform_device *pdev,
>
>         init_state = 0;
>
> -       if (pdev->num_resources != 1) {
> +       if (pdev->num_resources != 2) {
>                 dev_err(&pdev->dev, "probed for an unknown device\n");
>                 r = -ENODEV;
>                 goto cleanup;
>
> Amstrad Delta uses internal LCD controller, then the second IRQ (for sossi)
> is not needed, but your patch "fbdev: omap: pass irqs as resource" adds
> both to the array of omapfb resources and sets pdev->num_resources = 2.

Thanks a lot for testing, I folded your fixup into the corresponding
patch now and uploaded the new branch. Can you also send me latest
version of the patches you added on top so I can make them part of the
series before the final patch?

I would then send the complete series for another (possibly last)
round of review and try to get it merged for 5.19 if there are no other
concerns.

I have already merged the (comparatively simple) multiplatform conversion
changes for s3c24xx, ep93xx, ixp4xx and iop into the soc tree, they should
show up in the linux-next on Monday.

        Arnd
