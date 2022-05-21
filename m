Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6D2B52FEFC
	for <lists+linux-omap@lfdr.de>; Sat, 21 May 2022 21:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232304AbiEUTl5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 21 May 2022 15:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbiEUTl4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 21 May 2022 15:41:56 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9C83E5D3;
        Sat, 21 May 2022 12:41:51 -0700 (PDT)
Received: from mail-yw1-f171.google.com ([209.85.128.171]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MatZt-1nHWfW1MXz-00cRs9; Sat, 21 May 2022 21:41:49 +0200
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-2ef5380669cso115100417b3.9;
        Sat, 21 May 2022 12:41:49 -0700 (PDT)
X-Gm-Message-State: AOAM530ykxv1M15oI+egNT+tLlRgaZBeu/E9w5DLFbFm0Ty9GhkZJey5
        PADyDQkVR+3zi0cRtAphxEDBm9gg1AOB7RBgPYs=
X-Google-Smtp-Source: ABdhPJwrgsMN7Ijgz9GAFGljoJxtQGD9GNwQNTcNuNXHJ2ZAL6jmu8b+7bNBJ5lr3aVVb/VrAwQ23AcpRu82ecv6gFg=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr16588097ywf.347.1653162107872; Sat, 21
 May 2022 12:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kvEcvzKBb2O7NEa1SDt8MuOQfnN8LQ+voNGUBDR8JpKSg@mail.gmail.com>
 <YnNb5M+gHI4hIaPG@atomide.com> <CAGm1_kstAbEZXBYwoK4GrFxMmPi=kpmdfJd1WAB8XSE_vNTTNg@mail.gmail.com>
 <Ynyd9HeFNmGQiovY@atomide.com> <CAK8P3a2wrH9XxGF6uBeQ6J0+KhehxsFO63R6qcwZ1DexH4N=2Q@mail.gmail.com>
 <CAGm1_ku85dL_zn4=9=OVkS3S3eBH-eqrc-c1UZyvnERbMrW98Q@mail.gmail.com> <CAGm1_kvKxe+RFNSxzZq+hy9594ek-s8owneXQqBMy8PxwdHP8Q@mail.gmail.com>
In-Reply-To: <CAGm1_kvKxe+RFNSxzZq+hy9594ek-s8owneXQqBMy8PxwdHP8Q@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 21 May 2022 21:41:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com>
Message-ID: <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:VY39/sLenORkliBZhWfb1XSBeuUrcAgHekxdbPepEkMFg03GT7W
 FQexP6oyNRDDaoHEoippoRiGKAYh7lbj230uZKhsE02EByGC7fUKR5MGFVAQZSn6UAc85p+
 Kin+lmZxeGoi73/au40UptoGTkgNedht+ooXFp/Qk13q4kcrC3eEUNkJQ5vB/hcwU/ylfxx
 Kd1pl4+oXYgXPzKwNe6pw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0gSwTFOLAm8=:eV7mRooO51PZX5gBs/v/0D
 3auoSn3HHl+Uoc69FfdIq28I8YKETDd9C2vibFaERd5B8Ud9fzY6wzciGqfzqdDlNQUjqkkMX
 qgXSfyAFhzgzp4cTKcBF4XgE6BylXwX7Xtc0qi6Uw8nU6j2v6gQ1sJVdex3gm+X0Mbc8LhNRd
 uxN6M/eZfogppYlny1Zv5AQrXyYDkRQErX53rZDgodbKeFHkX6VpYQf31b79i5ESJZFr7Or4M
 IxMkIDKuVaTLEclE9aJ4qZAAhFGPDWu6Rk2OD7LJBUVb7vEg8NUA1p+P4W9B87qc6/25Fvbrd
 7mUEAYNig423WCx1ZV4Skjz8/M/UTwh5XVHuQKUu0FK/5c2W44MwqLOzYXSru+g1i9cn8nmaK
 VkrAh6IYJnYfIsAbYbUDboFHPQclOgLHOiurZs81sxK6K/hDWfB/lbt621qpA8PEX8CeOSbhz
 ihrr56WInxxWA81zgx9XzYmQ9DPTJlul/Lrjs+Nb2RHWDkluLYNWnYsfSfVp1kOSOzAlJleiU
 yzy95PecbIMR1aDRoFLwRucJM+auUev5sasMdKTcia3nLTtLRjC+/z9yBnlzRI1m5IL7v2aUA
 HkuVo3s3/8yRNl7aLdHdRQdjbbx1nWEx4qPjRYaB3u9R42KwvQ24ldiu+O2HJMQnoK6ujK/6a
 Hn99z0j8ogJbrtXdvJPDDT+3PZYHdcyXqc/IWZf2+w0WpaXlhIYlhJy4YD7ig5zbRnfm4vbIq
 gvFgJWXhx4lHNhIZAlUbqop+5l/S0obKuFHUEg==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 19, 2022 at 5:52 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Thu, May 12, 2022 at 12:20 PM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> > On Thu, May 12, 2022 at 10:43 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Thu, May 12, 2022 at 7:41 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > * Yegor Yefremov <yegorslists@googlemail.com> [220511 14:16]:
> > > > > On Thu, May 5, 2022 at 7:08 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > > > * Yegor Yefremov <yegorslists@googlemail.com> [220504 10:35]:
> > > > > > > Hi Tony, all,
> > > > > > >
> > > > > > > since kernel 5.18.x (5.17.x doesn't show this behavior), the system
> > > > > > > stalls as soon as I invoke the following commands (initializing
> > > > > > > USB-to-CAN converter):
> > > > > > >
> > > > > > > slcand -o -s8 -t hw -S 3000000 /dev/ttyUSB0
> > > > > > > ip link set slcan0 up
> > >
> > > Oh, I missed this part at first and only looked at the backtrace.
> > > Which CAN driver
> > > are you using? It's likely a problem in the kernel driver.
> >
> > I am using the slcan driver [1].

Ok, so this is just a serial port based driver, which means the
follow-up question
is what you use for your uart. Is this one of the USB-serial ones or an on-chip
uart? Which driver?

> > > CONFIG_DMA_API_DEBUG is still likely to pinpoint the bug, but I might also
> > > just see it by looking at the right source file.
> >
> > I'll try to get more debug info with CONFIG_DMA_API_DEBUG.
>
> DMA_API_DEBUG showed nothing new. But disabling the CPUfreq driver
> "solved" the problem. I have tried different governors and got these
> two groups:
>
> ondemand, schedutil - cause the problem
> conservative, powersave, performance and userspace - don't cause the problem
>
> So far, I have only seen the same debug output that I've initially
> sent and in most cases, the system stalls without the output.

Ok, so that sounds like it happens when you change the frequency.
I assume this means you are using drivers/cpufreq/omap-cpufreq.c?

When using the usersapce governor, do you see problems when you
manually change the frequency from sysfs?

          Arnd
