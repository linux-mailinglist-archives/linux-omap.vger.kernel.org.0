Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84FBA5393E0
	for <lists+linux-omap@lfdr.de>; Tue, 31 May 2022 17:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345626AbiEaPXH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 31 May 2022 11:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345619AbiEaPXG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 31 May 2022 11:23:06 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CB62613B;
        Tue, 31 May 2022 08:23:02 -0700 (PDT)
Received: from mail-yw1-f181.google.com ([209.85.128.181]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N8GIa-1nj0uC22jI-0149M2; Tue, 31 May 2022 17:23:00 +0200
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-30c1b401711so79986327b3.2;
        Tue, 31 May 2022 08:23:00 -0700 (PDT)
X-Gm-Message-State: AOAM533d2zESMMie3wO5RjfCtVoMj31eGcelH9lWUFliUHTo/7aezq9I
        8wzBZxQIIxWIqR7fkTnAeD8Nrrdke30GmVACerM=
X-Google-Smtp-Source: ABdhPJybYFAQO9wCO1snmeV7ymS9Wwx8g0pNV6T8iuBn6qDWDMD8u5F2Ryzk1a4ZnFzrScPgFOwE0OI0cF0Os69/WdU=
X-Received: by 2002:a81:488c:0:b0:302:549f:ffbc with SMTP id
 v134-20020a81488c000000b00302549fffbcmr29434661ywa.495.1654010579234; Tue, 31
 May 2022 08:22:59 -0700 (PDT)
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
 <CAMj1kXFfc-e0+dpLJHj9W+=YS=3i0t1+wxF+4qJ5K-g7pTd+YQ@mail.gmail.com>
 <CAGm1_ksndacPPpyZknvHip=7Fv+3NxXjyfCm_DDMm4EbcBuBig@mail.gmail.com>
 <CAK8P3a2VV26MhWz95OwfKz+2k35ee8V876iqdJdZ4o1HuNba8A@mail.gmail.com>
 <CAGm1_ktyCchFwVWhFtrgR621s_fPZJ3u8UmgOPbg7OCOq0h6ZA@mail.gmail.com>
 <CAK8P3a02uFq4edc_VzPaNQXp_cuLXUMbF4c=k6KATApS9hNHkw@mail.gmail.com>
 <CAMj1kXEvxP8ULqy7ajT_cSxMzYLJuCjEZGfYBb=F9qOwz-AFaQ@mail.gmail.com>
 <CAGm1_ksF1UPpdeiTnADiQK8MFbvP8-eDhc=yaCL75EsE_pG=-g@mail.gmail.com> <CAGm1_ksmXTnEo_Mxk7+S4vs_CQAs5ZHoEOpq9Tq3ZFf7sruX7A@mail.gmail.com>
In-Reply-To: <CAGm1_ksmXTnEo_Mxk7+S4vs_CQAs5ZHoEOpq9Tq3ZFf7sruX7A@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 31 May 2022 17:22:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1nhBnbbocBNkKUKYhw14OYE0WPEyQcJJXzbpW4uASu_Q@mail.gmail.com>
Message-ID: <CAK8P3a1nhBnbbocBNkKUKYhw14OYE0WPEyQcJJXzbpW4uASu_Q@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:K+Q6cFdO+Cx2p9qQ+Dtv1MqUK0XZ4i58ODQ6mHi4pqmrgszw1Tq
 3LS/6U2G9Xy2756hZQA1R2UeK1m+A/1SA//2Cvg2kueqFNl1Fug28TWiMsC3LGMR8HlX3F+
 B7nGmZ3iVh2g1YrOjwq/DCVK5CqUbtug3dDlAqpjWJpnpmsaHTQIqAAGGJ8w7WoovEIkQHn
 qfMQ1ByI5x1s555wZIL2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:duki9vA3KCg=:YEZBY2/x0UI3RfWJYKy6y1
 R29drqE6EDEJ02eVryWPGWTBfaSe15ryd9wj0OoPVHEQIfR/RhbcIiF6S7u/e5T6Arss8GxEu
 v1PBZ+ssy5itKuFpQOwZ5JLFvRMw21QaXT5EYDqFJMwjwb+HEW6qPKLgqQPVirGN+7sfXfEPb
 VhTXdAaD27sC5x41u4wvnSt8N16ghZ7ecu29wURpmDmmeerOhABbLOKvLmkUwfbwck7Z9dLHn
 fC/fEhuL+/5iHteOXVlgJl9RMWTRmjiZXYinDcGGqB3vF89h8vhTI9MTOo8vHfxCko4sjzerb
 Qq4gAnDGfJxeKSrPIH92keODTS6zNR+4TEAuq4Ocq/NPfaEwv4jewtJFcvhIB4abypkToY+dl
 V3b7ezgjDO0QVqqFGR/1jvEbqSV8Er89SOp7yVCtLz5X5bZcK1Kymo6YkglrfgS7rZZHYDAo0
 K0MzjqC+uep6JbTneqIUsRmHShgVZAzOQ2CCGqOtrVJjXHd5J7CvCAlEg6q1hnOMaRQKmh7MT
 6HyB2Fpx2wsIooJb8xgnoTS0IJ/wqRyX0UvI+e3YWdVK8UifmmY6zc1Ru+lOKsbZwC8NS2EkR
 ExBh/dcY6Fv1SagkAyA2EpS0YhuTdgAmc6fWx1roEn0mjO8inyaZxUS0TGgPBuIrbdYTbPjii
 CcoEJDTy76QvJA5vCMV3ledxp9yNanIovly9GBJdjVrTAfUFXDsWa4alI9vMf5KtvEQOH8z3Q
 xr9jYVxGF6V7q5Lg9tWjqk/6v7MSZ2nmYdapIg==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 31, 2022 at 4:16 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Tue, May 31, 2022 at 10:36 AM Yegor Yefremov <yegorslists@googlemail.com> wrote:
> # bad: [b6b3b4814e77d2f5a7517297e9ac1d1aa1cda103] [PART 1] ARM:
> implement THREAD_INFO_IN_TASK for uniprocessor systems
> git bisect bad b6b3b4814e77d2f5a7517297e9ac1d1aa1cda103
> # good: [dccfc18999cf4b4e518f01d5c7c578426166e5f2] ARM: v7m: enable
> support for IRQ stacks
> git bisect good dccfc18999cf4b4e518f01d5c7c578426166e5f2
> # first bad commit: [b6b3b4814e77d2f5a7517297e9ac1d1aa1cda103] [PART
> 1] ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems
>
> Though commit b6b3b4814e77d2f5a7517297e9ac1d1aa1cda103 led to a broken
> kernel that didn't even show any output after the bootloader had
> started it.
>
> Commit 2d3456213319c0277ee6082946c43c3afacca9b4 showed the expected stalling.

Ok, good, so we know that the "ARM: implement THREAD_INFO_IN_TASK for
uniprocessor system" commit caused the problem then. This is what we had
already assumed, but now it's confirmed.

Too bad I screwed up that "this_cpu_offset" macro, I think it should
have been

@@ -286,7 +286,7 @@ THUMB(      fpreg   .req    r7      )
         *                   register 'rd'
         */
        .macro          this_cpu_offset, rd:req
-       mov             \rd, #0
+       ldr_va          \rd, __per_cpu_offset
        .endm

        /*

I've pushed a modified branch now, with that fix on the broken commit,
and another change to make CONFIG_IRQSTACKS user-selectable rather
than always enabled. That should tell us if the problem is in the SMP
patching or in the irqstacks.

Can you test the top of this branch with CONFIG_IRQSTACKS disabled,
and (if that still stalls) retest the fixed commit f0191ea5c2e5 ("[PART 1]
ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems")?

      Arnd
