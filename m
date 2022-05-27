Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2B7536303
	for <lists+linux-omap@lfdr.de>; Fri, 27 May 2022 14:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345205AbiE0MyL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 May 2022 08:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiE0MyL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 May 2022 08:54:11 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E687F19FBC;
        Fri, 27 May 2022 05:54:09 -0700 (PDT)
Received: from mail-yw1-f175.google.com ([209.85.128.175]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MtOSu-1ngc4E09i2-00uoLr; Fri, 27 May 2022 14:54:08 +0200
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-300312ba5e2so46709527b3.0;
        Fri, 27 May 2022 05:54:07 -0700 (PDT)
X-Gm-Message-State: AOAM533SwZ5+A8WYthm5FiGIrdv7h7IONwXrFxJhUIGqU8BTsjnMwyN5
        6KyRFqSpGsfBUQwSlMTMv4fEIBZmZOLlVyFj4B4=
X-Google-Smtp-Source: ABdhPJwps2pOL8pz/t48Ul9mcKwJz3NqwtY4uP6vESFT7XU/lsoHJwvUtFL3rZ9eKNSBSa0B/PGUpo6rFFnMmbYwbnI=
X-Received: by 2002:a81:488c:0:b0:302:549f:ffbc with SMTP id
 v134-20020a81488c000000b00302549fffbcmr7378718ywa.495.1653656046751; Fri, 27
 May 2022 05:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a1YTBRO_pRZLqbNHwG4DaYA56tn1_E0g3c1VW0B-jz-qg@mail.gmail.com>
 <CAGm1_kuaRr3BFWSq-2v4vT0VbVvMX=kMHQsQ1KZnKe9UEff3MA@mail.gmail.com>
 <Yozpa3DlLLEzBR8W@atomide.com> <CAGm1_ku5EusuSJ9zhYZBRGdRUr8_NYsx3=BZQkuYtNJpq3Tn_w@mail.gmail.com>
 <Yo8cLxktTytqAEV3@atomide.com> <CAMj1kXEr848Jaxfk64wDgFHMmq-CLvgXtH_sfqVC-4DRLwCDqA@mail.gmail.com>
 <CAGm1_ksuNbMvg5tVOHswMRWQyX8ZA_U-49Ge6uoG0xV7x5viHA@mail.gmail.com>
 <CAK8P3a04Qc3Qkb2s1OmCFVKi=yrLReL4Np0JJYjskMWozBDr7Q@mail.gmail.com>
 <CAGm1_kvnqOz68UDL=n80kZd1UoUaPGJG10YvkxUnezg1rSf6Lg@mail.gmail.com>
 <CAK8P3a2qat95d14QDp7HfKmqm8Kw0s0WVeLH=GkgBwH2c7nJ8A@mail.gmail.com>
 <YpB0tdMHh/aBlfyk@atomide.com> <CAK8P3a3ocZDD9odfDe_WBeovHXCNU4CSScrmE4HVtLKef_z+EQ@mail.gmail.com>
 <CAGm1_ktOPgUSVjPP44Y49GgFLpDMrECu7eqQu7d2ZvJiOftWAQ@mail.gmail.com>
 <CAK8P3a36s6S2B8PTixxEkmaKXL88NAydTm4abdeC+roGtrUTsw@mail.gmail.com> <CAGm1_kvdhqrptEYy8WMfqZqG6gaWoBtAojSW5uXYnyXMVfV=Fw@mail.gmail.com>
In-Reply-To: <CAGm1_kvdhqrptEYy8WMfqZqG6gaWoBtAojSW5uXYnyXMVfV=Fw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 27 May 2022 14:53:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a22hmSnS4X93ETLpF7vPtK_F1TD51SK5VvhEz9L9H4i3g@mail.gmail.com>
Message-ID: <CAK8P3a22hmSnS4X93ETLpF7vPtK_F1TD51SK5VvhEz9L9H4i3g@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:XEshiZagnPhtcKyx6dm/HntoBV9nm+rbUuNr1cKbgChRnybdTb9
 MV4cgSXAo1Pl1NIXM7ppjVDie1nX+a8P1nrx/Hv2K71rgVNDtint/Af/CnwMU90ofz9TZ3b
 H+Io+gZ7vpEYkymXgRGP4G9bewUJBIveL7zFM9x5LVTZ/CfdGe9yyrSr/MWrrothy52Uv33
 +euZn20OJ8E3mA0cfKq0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FLGsz8ooLvU=:uhX9SDrL1nT/w0wyXkk8m8
 9oSsrbJq2hQ/Q+iKk3Y/0JTytoKWu0LQBIh49S1PlbH0mC+4/eCr1j3FC87Xug5cuImgFCmJv
 6EPWKWK5mKMQ4F6NDhSO6dyrIa7JwKZ9Bn9TQgt4HOppsH1AGjsvPhUZf44h8A1ISVO7RVg8/
 FMkKZVkVGUuBvxCTYaOPvMEwb8t7qV0hLFti49KCqTf8HmjDIUY9Getf4PQaBXNYHQbA2S1A5
 NOw7CTF3L1LTxJ0Reh4HmHcpZKSq/aZogsCsfSRlephUUijVOERLdXZM1CZACb+IPdIUChUiI
 nDf7pMat3kET5oEsqQd22pMdYrIR/GsnjuuIP222Ggeul17i6Z34VT41MmgeRoUNhc23vVejx
 Usdn3x4bNahyU10WVwlOagLizAI3sPkYtnud4oQVN94Rjp2IIvjGfQGteRaFRMMjvAjHdoQXV
 ne30ttazmYW4ecThbT52rS6gJcUp7vmnEG9hn2ZZ9qLSEbIWq6spDrFlTF0ixTsV663lP2m0m
 M4JKZgNRoC74laIYuqgmDnQ804VwMgTGLNn7ykRmqHypu+nQ0QX4GXeJbPgMSvmVFo++o6G6B
 wAPEMjLsyHjLw46fHGuL0iwP7+92ikAcQe2l3Zyl9EXK+CgdGpXc+xhg3WgtCi2gpKafBwrMj
 pq6OY1XAFl2EYBWMDAU+476CYy2Q4Ln/5foxwR6Ji/GCYGMG923xr7tSHlS0lJfNk7+s/TpaP
 JM1nVGoTZ+Y/g2bgsVVOUnnxJ/eqVe2x482fNQ==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, May 27, 2022 at 11:50 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> # zcat /proc/config.gz | grep 'CONFIG_ARCH_MULTI_V6\|CONFIG_SMP'
> # CONFIG_ARCH_MULTI_V6 is not set
> CONFIG_ARCH_MULTI_V6_V7=y
> CONFIG_SMP=y
> CONFIG_SMP_ON_UP=y
>
> No stalls.
>
> # zcat /proc/config.gz | grep 'CONFIG_ARCH_MULTI_V6\|CONFIG_SMP\|ARCH_OMAP2'
> CONFIG_ARCH_MULTI_V6=y
> CONFIG_ARCH_MULTI_V6_V7=y
> CONFIG_ARCH_OMAP2=y
> CONFIG_ARCH_OMAP2PLUS=y
> CONFIG_ARCH_OMAP2PLUS_TYPICAL=y
>
> No stalls.
>
> As soon as I enable both SMP and OMAP2 options the system stalls.

Ok, that points to the SMP patching for percpu data, which doesn't happen
before the patch, and which is different between loadable modules and
the normal code.

Can you try out this patch to short-circuit the logic and always return
the offset for CPU 0? This is obviously broken on SMP machines but
would get around the bit of code that is V6+SMP specific.

        Arnd

diff --git a/arch/arm/include/asm/percpu.h b/arch/arm/include/asm/percpu.h
index 7545c87c251f..3057c5fef970 100644
--- a/arch/arm/include/asm/percpu.h
+++ b/arch/arm/include/asm/percpu.h
@@ -25,10 +25,13 @@ static inline void set_my_cpu_offset(unsigned long off)
        asm volatile("mcr p15, 0, %0, c13, c0, 4" : : "r" (off) : "memory");
 }

+extern unsigned long __per_cpu_offset[];
 static __always_inline unsigned long __my_cpu_offset(void)
 {
        unsigned long off;

+       return __per_cpu_offset[0];
+
        /*
         * Read TPIDRPRW.
         * We want to allow caching the value, so avoid using volatile and
