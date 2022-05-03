Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4587D517F9A
	for <lists+linux-omap@lfdr.de>; Tue,  3 May 2022 10:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232774AbiECIX4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 May 2022 04:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232599AbiECIXt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 May 2022 04:23:49 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 530ADDA
        for <linux-omap@vger.kernel.org>; Tue,  3 May 2022 01:20:12 -0700 (PDT)
Received: from mail-ot1-f50.google.com ([209.85.210.50]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mwfj0-1o1ZWS2FqM-00y6QV for <linux-omap@vger.kernel.org>; Tue, 03 May 2022
 10:20:10 +0200
Received: by mail-ot1-f50.google.com with SMTP id m6-20020a05683023a600b0060612720715so3994769ots.10
        for <linux-omap@vger.kernel.org>; Tue, 03 May 2022 01:20:10 -0700 (PDT)
X-Gm-Message-State: AOAM532RhDYU4H/JXWpFkA3319VB+wZsn0xSm01chGoDJ6mUVe8aIdlH
        /KWCT89uYQkDuYASGglZGFwtPEMF40H9Lh98oRw=
X-Google-Smtp-Source: ABdhPJy9R7zCTI6Aw7C6jGQ+pq3KbkGI+32nQsK+YuLq9Y0CUx+axnAMLXKfzAkG+VRohcKoFtwX2TBaxszBE6C0NQU=
X-Received: by 2002:a81:1697:0:b0:2fa:32f9:78c8 with SMTP id
 145-20020a811697000000b002fa32f978c8mr3738925yww.135.1651564330419; Tue, 03
 May 2022 00:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <FA654A0D-29B7-4B6B-B613-73598A92ADA8@goldelico.com>
 <YmkBAsa+fKlp/GcV@atomide.com> <CAK8P3a3N9WBWC_ECB0pSRHUCT4iz=tdT+Dt9Cyd5Wh3qEaVqqA@mail.gmail.com>
 <4CE23DC3-B3E5-45C1-91F3-B88E5444AE7C@goldelico.com> <CAK8P3a3EFfF0gr5kFkboRfJifrY-D+NgHFekBfSePWuY2c8PMA@mail.gmail.com>
 <11504A17-6B50-4D6C-A9E1-CA943C157C93@goldelico.com> <CAK8P3a2RN77ajZD4xRhKsqozPizneLcLYhm0rTE6qX25-4cJsw@mail.gmail.com>
 <CAMj1kXHqHCt9G+HEawsWmba2Z=WVbp6wRrivAQvQCn2iph9kXg@mail.gmail.com>
In-Reply-To: <CAMj1kXHqHCt9G+HEawsWmba2Z=WVbp6wRrivAQvQCn2iph9kXg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 3 May 2022 09:51:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2gxnrY=gnv+e2Ey4bPE30wYtMkqC--Z0X-ZjZT=B9VaA@mail.gmail.com>
Message-ID: <CAK8P3a2gxnrY=gnv+e2Ey4bPE30wYtMkqC--Z0X-ZjZT=B9VaA@mail.gmail.com>
Subject: Re: kernel panic with v5.18-rc1 on OpenPandora (only)
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ZJIZk8l0EpZUxpXFKmiwWPXTustIFDikkaEJNRg7+O4NH+X/gAb
 NkIZubP/eMz3NsJr6xESadvtlpvxKyNzfbQGkG1FIt06FwC/k0jQzzMfC/NlWfeIhyFBTLl
 1HTMArYgiNiLuNdLFvQO1FcUf5DCPMH78lxqOnEMq0b/+SE8vDXTnwM7uSkDeeDcfOLfHDT
 dFF8BQmQ/22385wLGqwmw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JkbgXSst4jw=:Gy4kxAIs+sm009YA1xG1An
 O4ssSCqIMFpPqcHjlAUBkXg0agElbClD248cbpDMkzztfljwtuKCtu/SAWQshSV4EPSzclSul
 fpvbI3wCHZq3S6Lt4KVPcjr6jMooFe40RED2e9SAsqNauEJ7iw+wtRK4cxwZ4QF4CB+dRG8rV
 NPf2k0j45s0wBOVvAn6YSq3jYEJQvRVcgnaidj2vdK+U25zDqM7Gu3OY4bhJn7cfUTmso2kNM
 fkH5WaxWIbuttAj2g/U4sCX85h5dohjbaze99s9yEa/ebILQvr4jdcdNgF3KV5aHct5qSHO8H
 /LYkDT9Ahp2Sy8ztd5qI7QoWqlr1D50qhQMye1XjMrPiINw1gL8qLoBi/YpxXhC6n0URmffV1
 UyONeIfgfQ7Bs2drom4a/zmxbP0uG50HsaW7keRP12f9niyO1gBk17VcmHn0q0+s+2jAL9i8n
 IWA2C1hKehcCIxkx63HtJDKoaxAW6SCmSnvCPOQI/jqhFNvuRSVX9i3rvz2IBuIlHesjUNH5B
 n5sPP45vxAGAry10HP4j39VgAiToua5L5uQcZ5wvZWxvxu62JC2pT390OOy6yrxIE5by+01KZ
 U7QaVCzJwZLoi55rD4S8NdhK7yp+aWrC4WPWAwzmSdBJU1jAIB0QSFvK1t5ukxxzXjMW4rgb8
 uKgt/W5X162m1iUP0U9tbphktlxePpZvbx4WyFycc7/o5XVguUK0VjDOlyknDleJ1IF8qTCoP
 dBazRpj3uUA+LX0uN/i9aOus//u7gJ7PWNl9gYS0zz61zdGZr6jmDmUJUd14ThL3Kd8WyC8yW
 EEelxU66jF1IY9r/mZAXGUqOl9Ng67KbANnOF1GWN1p6dSHwwk=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 3, 2022 at 9:28 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Sat, 30 Apr 2022 at 20:48, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > I think what is going on here is that your platform is able to detect
> > the broken DMA because of the l3 interrupt handler telling the kernel
> > about it, when on other platforms we would see either silent data corruption
> > or a DMA that never reaches its target.
> >
>
> I wonder if we could narrow this down by adding the possibility to use
> IRQ stacks in the linear map, while using vmap'ed task stacks.

I don't think we have actual DMA attempts to the IRQ stack, so this should
not make a difference. What might help is to print some more information
in omap3_l3_app_irq() that is likely provided by the hardware. The BUG_ON()
happens for any timeout error, and that is most of the possible errors.

Simply dumping the L3 registers should at least show the exact type of
timeout, and maybe the DMA master ID and physical address that can
be traced back into a virtual address.
Setting CONFIG_DMA_API_DEBUG=y should get the same information
I think, but it can't hurt to do both.

        Arnd
