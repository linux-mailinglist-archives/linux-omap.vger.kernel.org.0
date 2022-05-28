Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF234536D11
	for <lists+linux-omap@lfdr.de>; Sat, 28 May 2022 15:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235638AbiE1NOP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Sat, 28 May 2022 09:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235631AbiE1NOO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 28 May 2022 09:14:14 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B08D19C01;
        Sat, 28 May 2022 06:14:10 -0700 (PDT)
Received: from mail-yb1-f180.google.com ([209.85.219.180]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MCsLo-1o3hh2464m-008rtv; Sat, 28 May 2022 15:14:09 +0200
Received: by mail-yb1-f180.google.com with SMTP id z186so7842201ybz.3;
        Sat, 28 May 2022 06:14:08 -0700 (PDT)
X-Gm-Message-State: AOAM531+PoH+yiquIQU4H1Fwge4ZxyF6R/cO4wE4V4D5Rlm0mVhKs39v
        xq0GtKTO6T7xPvSTd350RNQ2LqU4e122S9LDlMw=
X-Google-Smtp-Source: ABdhPJyguWa96+0lPvTeqCEV6/LGQ59wW0u7JuLPaWpR+8VjbwDjqo/tET/Zy7enU3pvsb8nexEPETNryWIm/aRIB2U=
X-Received: by 2002:a25:bd8b:0:b0:657:8392:55c3 with SMTP id
 f11-20020a25bd8b000000b00657839255c3mr10466309ybh.452.1653743647744; Sat, 28
 May 2022 06:14:07 -0700 (PDT)
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
 <CAK8P3a36s6S2B8PTixxEkmaKXL88NAydTm4abdeC+roGtrUTsw@mail.gmail.com>
 <CAGm1_kvdhqrptEYy8WMfqZqG6gaWoBtAojSW5uXYnyXMVfV=Fw@mail.gmail.com>
 <CAK8P3a22hmSnS4X93ETLpF7vPtK_F1TD51SK5VvhEz9L9H4i3g@mail.gmail.com>
 <CAMj1kXF2NFxiNm=9ixOncN_wkgg2NrNNm9vE-CGUvpJuThj3JA@mail.gmail.com>
 <CAK8P3a1DnyNvBqdRGHAnHcXBfoNPn4GfUmf_SBGRRU3q3iwwvg@mail.gmail.com>
 <CAGm1_kta63UM8um5BB5jOh+r9uFMiGwAiYsrNDOwG3dN-Oo47Q@mail.gmail.com>
 <CAK8P3a2yaKcEiO-LvH5z5azTEX1XTh=9U2MChRS92dtatceY5g@mail.gmail.com>
 <CAGm1_kvXaH19nOmP_Dy3nxWpG0UiX7eyauTLB+9Cd2rBovDcEQ@mail.gmail.com>
 <CAMj1kXFfc-e0+dpLJHj9W+=YS=3i0t1+wxF+4qJ5K-g7pTd+YQ@mail.gmail.com> <CAGm1_ksndacPPpyZknvHip=7Fv+3NxXjyfCm_DDMm4EbcBuBig@mail.gmail.com>
In-Reply-To: <CAGm1_ksndacPPpyZknvHip=7Fv+3NxXjyfCm_DDMm4EbcBuBig@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 28 May 2022 15:13:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2VV26MhWz95OwfKz+2k35ee8V876iqdJdZ4o1HuNba8A@mail.gmail.com>
Message-ID: <CAK8P3a2VV26MhWz95OwfKz+2k35ee8V876iqdJdZ4o1HuNba8A@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:v/vgM9TyMDPvBXEjHRNt783/GGGVoL+MieqKRMlZvU80/dQGfFq
 mKuKg7onizq9oHMxN9Xb25XfULbd7XzpATOXrC3f9Y4T91YOnhEm61Pji3NLChygMC0Q6Lu
 4Y5X2kckcpOkGViEyZYAeo6EGpcPSh42U+x/TujwMGJfsHrygsilpbiz2I3HhaJGnux3Kj+
 TLOQiZ4Yh/pG0uFSbqaEQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nFIkU0Q9HJA=:c4XEXvtRrcz/Jdx7ksqtTk
 mKYu8nt5Sx8R2vw48WVlLqmBpUhVOkRf1kjGeD0/CJQs8G06xr/OBQv4FLs+Gqm8ubX6w+yRq
 ZOVYbrYlqRM6vDW6hGgBEyc/8o/LqkH9RKpXY2vrlXzklY2rgiMDdspPCtiCSDZLqdNpwlvXz
 lE0Z7k8L4WaTxezhkCtcVS11o1Baa/FCyF92vLfUVOuIWFKJ5dEVhPR0YSe7djgA0dDrxY9Jz
 TcMkMbisTiBeDhCtqPHB6UmxD65kjt5HC0i0uz4VAFmES1y8lNIfhi5rtMrBeZMLtQA+HD3X9
 8rqYQAOKLtZKGsqlWaG/tuBiXm/fVWE8inmbI1muR1Y4K13469A8srECHiT8K/oxbV+T/kcJC
 kFhZKuVljX1ETGRqZABq1SC5mZMVNM3SpT5nRWxl7s680aLO5dLTmZ62K/zRJ69ZTSMcNYy7g
 CTZvHOvYrqjo8IVVfE1VgqHYlVCCjXKRFG/rvNkHur3asfIKZUwrME3wchnxye6WVHkSyY2Ep
 blriBG2OpDZifiR4uz3A/kZsZ3PkJpI03wblD4Qc90MyG1z+mWrMz6V00mXTmCfzbKIhGzhc3
 Yu3JDpnLrK4tks447tSZ+NnGi1bw3YeQESuy4bUsvaZvSmeYELd0TKZ+2+U9YefsGROXCB95z
 333vCZr8ItxFgxl0aObMZonZPZJxmmbNI61Iv94PhGEigj3yEPW8aHWhmpJbNL8bbPjEQQ6Q4
 pYhgC/PWKHDf0bzhmrBzKmZdNe0l3tHjT9FHuw==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, May 28, 2022 at 3:01 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Sat, May 28, 2022 at 11:07 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> In file included from ./include/linux/irqflags.h:17,
>                  from ./arch/arm/include/asm/bitops.h:28,
>                  from ./include/linux/bitops.h:33,
>                  from ./include/linux/log2.h:12,
>                  from kernel/bounds.c:13:
> ./arch/arm/include/asm/percpu.h: In function ‘__my_cpu_offset’:
> ./arch/arm/include/asm/percpu.h:32:9: error: ‘__per_cpu_offset’
> undeclared (first use in this function); did you mean
> ‘__my_cpu_offset’?
>    32 |  return __per_cpu_offset[0];
>       |         ^~~~~~~~~~~~~~~~
>       |         __my_cpu_offset
> ./arch/arm/include/asm/percpu.h:32:9: note: each undeclared identifier
> is reported only once for each function it appears in

I think you just missed the line in my patch that adds the
"extern unsigned long __per_cpu_offset[];" variable declaration.

       Arnd
