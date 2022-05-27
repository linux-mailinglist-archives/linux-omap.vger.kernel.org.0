Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 804D05359B7
	for <lists+linux-omap@lfdr.de>; Fri, 27 May 2022 08:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234917AbiE0G5b (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 May 2022 02:57:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239313AbiE0G5a (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 May 2022 02:57:30 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE2A9C965B;
        Thu, 26 May 2022 23:57:29 -0700 (PDT)
Received: from mail-yb1-f177.google.com ([209.85.219.177]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MAPBF-1o6HMK2MrD-00Bqas; Fri, 27 May 2022 08:57:27 +0200
Received: by mail-yb1-f177.google.com with SMTP id l11so753753ybf.8;
        Thu, 26 May 2022 23:57:27 -0700 (PDT)
X-Gm-Message-State: AOAM530O63xfzRDuo/nCtyZuIjaxHYdcWxcKm4jjjJopEHbe+cQoMEQP
        EOBW+LU74yeHQNA4Cgl2gW3A9QUmeAtxRUk8ijE=
X-Google-Smtp-Source: ABdhPJyNC+F/d948zzvAyHaGGylvEQIcyhu+xhRW0/7r+7kjq9IoHnRGPpE7pi+IqnQIoH7P9nnbJRewt/DuhaAQS9A=
X-Received: by 2002:a05:6902:1143:b0:64f:9ab6:691e with SMTP id
 p3-20020a056902114300b0064f9ab6691emr26297597ybu.480.1653634646264; Thu, 26
 May 2022 23:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com>
 <CAGm1_kuaRr3BFWSq-2v4vT0VbVvMX=kMHQsQ1KZnKe9UEff3MA@mail.gmail.com>
 <Yozpa3DlLLEzBR8W@atomide.com> <CAGm1_ku5EusuSJ9zhYZBRGdRUr8_NYsx3=BZQkuYtNJpq3Tn_w@mail.gmail.com>
 <Yo8cLxktTytqAEV3@atomide.com> <CAMj1kXEr848Jaxfk64wDgFHMmq-CLvgXtH_sfqVC-4DRLwCDqA@mail.gmail.com>
 <CAGm1_ksuNbMvg5tVOHswMRWQyX8ZA_U-49Ge6uoG0xV7x5viHA@mail.gmail.com>
 <CAK8P3a04Qc3Qkb2s1OmCFVKi=yrLReL4Np0JJYjskMWozBDr7Q@mail.gmail.com>
 <CAGm1_kvnqOz68UDL=n80kZd1UoUaPGJG10YvkxUnezg1rSf6Lg@mail.gmail.com>
 <CAK8P3a2qat95d14QDp7HfKmqm8Kw0s0WVeLH=GkgBwH2c7nJ8A@mail.gmail.com> <YpB0tdMHh/aBlfyk@atomide.com>
In-Reply-To: <YpB0tdMHh/aBlfyk@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 27 May 2022 08:57:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3ocZDD9odfDe_WBeovHXCNU4CSScrmE4HVtLKef_z+EQ@mail.gmail.com>
Message-ID: <CAK8P3a3ocZDD9odfDe_WBeovHXCNU4CSScrmE4HVtLKef_z+EQ@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Tony Lindgren <tony@atomide.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Gd9Hw3hJTxf6sr+FE/kcCmHESg0L2bNKMEKEXPQTOJJoqW25+4K
 PRECim3AL7h/mWtHxhJq4xRT3SCqVdZjqhEb2STMMqjI5gLhQib4SE+JA5BsDypw2hLL/8J
 7+w65eXm9iLRaDxbnksxaOtP5HPzdFOaN3UsooRzY/Mlw0YFXHOY5QxDk4mGBd3/GauvAGl
 lVPPAhsX6Fn9ug3Y5pVuw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QA8M4DPAaCU=:75Yxsbaj9x0iPdamuwHvcu
 aJ7ShnoZL0FpJn04nK2Dw08zNgprG7L/qilaRZTKayJXSzMUwks3sbgc7NjC/N5nEE3eD39R3
 1QUjHk4TOn+OUJ7hJPpb0ZkjaYOJllSFsX/atZtcZTs0fdKuhlLMuJtQnXEYiKLxCNTbseIWd
 44tUQI6Zms8gDeVx/rx80OrH0E+WdGVybEvn9qejaMIWvkNKmQjMCDh0C6q8PutIfJ2ztRiQm
 sxtdaU7MQQpWxPWjlq6tNzfsc/66sMkPmlkkX1a1sBGKQp+JrDozwL+t49ehO2dzcpTU5d3Nm
 JoQLb+HhwOIVRRwA/QSGIQL6O1CEeXEHEsgcNBHFQbe74klZ8PJGSsGFsQ6IGV4l3vtQEXLCF
 ZREaueGBaA8Ip6cKovtn8bogHzB+y9WkQCBwU/E+QjZUAC48Wp3peux5GPyi0ykKpjRY2AzVk
 RJN4/wH8Zsg4qakX56zpPoLO+HyygfWEzdvczGLklW+DUnOaZi9f1bbYRMjJPb7UUtcFNXRKF
 msCROrxMy+JswQ1+G9962wTJN02fOqtRVTH4dzrohlOmBcjEwjN7dbHcgZw2NQdRH0OwJjU5d
 Lh9iXkEqONhj9Dt3QXM5b0o4/oDPc1rN9JeHIecQLeuoJLyQO/CSovDWKpgKM+zzEgGO6SJLj
 9pPli6/VZpLXctKoN+b6U4Rg/BXTwA4xvzOaSuseD8I0BxGkf1uct1K0Yppcch5UHb7TYOpZz
 eV+lJBegWNJH6CTW1M3nz4IQFRuy7yzTL1F3IqBSqtBI9jzX+EBTFYQHBrILroL/mJlIe66/Z
 knqTLzIVWRF7ZfcE9mvobdoePqfuZ86cL8Ifepu6wqFKnWBGCDgQ7Qv2NzdLru66xCGVww14w
 i4dn2UN4SV2rsuh/dXGA==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, May 27, 2022 at 8:50 AM Tony Lindgren <tony@atomide.com> wrote:
> * Arnd Bergmann <arnd@arndb.de> [220527 06:35]:
> > On Fri, May 27, 2022 at 6:44 AM Yegor Yefremov <yegorslists@googlemail.com> wrote:
> > > On Thu, May 26, 2022 at 4:16 PM Arnd Bergmann <arnd@arndb.de> wrote:

> Based on what we just discussed on #armlinux, testing before and after
> commit 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for uniprocessor
> systems") might be a good idea as it enables some config options that
> did not get enabled earlier.
>
> Another thing that might help is to bisect again and ensure vmap stack
> config option stays disabled so issues related to vmap stack are kept
> out of the way.

Unfortunately the commits around 9c46929e7989 are the ones that failed
to build according to the original report. But it's possible that the
problem has something to do with
CONFIG_CURRENT_POINTER_IN_TPIDRURO, which is disabled
in the V6+SMP config, and which in turn is required for
THREAD_INFO_IN_TASK, IRQSTACKS and STACKPROTECTOR_PER_TASK.

If any of the four are the cause of the stall, then turning off ARCH_OMAP2 and
CONFIG_CPU_V6 should show the same bug in older commits as well.

       Arnd
