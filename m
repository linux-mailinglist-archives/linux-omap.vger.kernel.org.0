Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C70365363D3
	for <lists+linux-omap@lfdr.de>; Fri, 27 May 2022 16:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344015AbiE0ONG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 May 2022 10:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352175AbiE0ONF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 May 2022 10:13:05 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010313EF29;
        Fri, 27 May 2022 07:13:03 -0700 (PDT)
Received: from mail-yb1-f169.google.com ([209.85.219.169]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Md6hP-1nM5Iz0AHz-00aCDi; Fri, 27 May 2022 16:13:02 +0200
Received: by mail-yb1-f169.google.com with SMTP id h75so2130558ybg.4;
        Fri, 27 May 2022 07:13:01 -0700 (PDT)
X-Gm-Message-State: AOAM5326uBH3o6n3AwZbKqqvJjGbyK//ExTreCJSA5LZMLjbvbeLbnmj
        BwsPl8M+JHv8R5goNofc06k19GjUo/OSbkLzPNc=
X-Google-Smtp-Source: ABdhPJx4VVpYTy5OaayC0WnaS3FylqwQg8as6lDMvWNI0dX/pRGzG3EXPxKzwu3/xs10+imWdNHNokzV+CPEj8KKsvA=
X-Received: by 2002:a25:4f0a:0:b0:64f:6a76:3d8f with SMTP id
 d10-20020a254f0a000000b0064f6a763d8fmr30918109ybb.134.1653660780782; Fri, 27
 May 2022 07:13:00 -0700 (PDT)
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
 <CAK8P3a22hmSnS4X93ETLpF7vPtK_F1TD51SK5VvhEz9L9H4i3g@mail.gmail.com> <CAMj1kXF2NFxiNm=9ixOncN_wkgg2NrNNm9vE-CGUvpJuThj3JA@mail.gmail.com>
In-Reply-To: <CAMj1kXF2NFxiNm=9ixOncN_wkgg2NrNNm9vE-CGUvpJuThj3JA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 27 May 2022 16:12:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1DnyNvBqdRGHAnHcXBfoNPn4GfUmf_SBGRRU3q3iwwvg@mail.gmail.com>
Message-ID: <CAK8P3a1DnyNvBqdRGHAnHcXBfoNPn4GfUmf_SBGRRU3q3iwwvg@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:jeHUk/k3X7bUbIOTbEePjRmn4hOSPZpds54znsOYZ+45MiBtTss
 tidYob4KH+Zyoe79nUFZl9nSkQzej+mVoiLPk8Z68HJw+a+lzB1VOgu6fC45VBYCIbtxdUW
 3qx+q6Qi8P5BXC20s7ktPGc/v4geaQHemQR/tJLI1+nIWv8LCepqED5qdYixnTZ/LFe351g
 SuKhnAYP3EPaG2Y1yV+IA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vqz0NuqhWUE=:xqe4ZS40iOIi7g+SV/kynv
 WjnLql/mjSUi5pjd3EXwUjQE1UlSfXLYxGSFo0N83QPp+b+hz/jknZ1kWvgyVGo6wnmZB0cDX
 FolnjpNXrMR49Pfe9g8CXJPx9BNZww+AEpPCOH4Kpqqf2bXNF8Yo7BWVpQ2eENMnwHvD0BGyU
 BGM8mmWZzXJ+zfbFYvgv0KhrqyZkxZ+Ums99eM93GGLWU0SKXfWV53AWFudaku1RXrwwm5zaG
 6L2wuiOHlJMVgidB4fnm8V5rMgDWy0sVNZ0uY1J3S+kyHNNVL6jfAAb+WUzLc3pDJaqcOySMS
 E19XwNk7S+sskigp0GWa6oc/tZLLuSx98ncRF+q2BxaQRm/wa6NyYxxiVXZFKDoOg69spsgtI
 FJSRUfJFgsvT9YjSwZs6A4r3JLcVIzne1S7yZCri07C4QgmJFUvkp8b1XWEYB4H5H0ooE/f2A
 Z0mhHbFTbMJZe0Im8gLuTIHdDYmfgJojKZIL/O4z1r/3sUkO8g1DP71HypMCDHKTSesAmy94/
 /vab9i29JxUApQ6oXGSLNgl3ewbzQ3Xck4ax5JXIJZkaqc2jKAXQYrvegRcAz4sQ65oZVEAg5
 wwmGB2VzGiykOCNmQia/n99SqS/NOSlmnpV2UEJ9+l7+UnQi+e9tqbXZGk1TxDpgesZodHGNR
 t/99jHoAFDgajrICoDqaVxzOQFolCCu5HUp0xVnFqxqdfldtP19/rshj6xmtsJNDBWDMo1qxF
 Bd14kbTfHoWvZ58r1zumcsEME5i68y0fqiJhRg==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, May 27, 2022 at 3:12 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Fri, 27 May 2022 at 14:54, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Fri, May 27, 2022 at 11:50 AM Yegor Yefremov <yegorslists@googlemail.com> wrote:
>
> Not just per-cpu data: there is also the 'current' global variable
> which gets used now instead of the user thread ID register, and this
> is also different between modules and the core kernel (unless
> CONFIG_ARM_MODULE_PLTS is disabled)

Right, so if the percpu hack doesn't address it, this one might:

diff --git a/arch/arm/include/asm/current.h b/arch/arm/include/asm/current.h
index 1e1178bf176d..306d1a4cae40 100644
--- a/arch/arm/include/asm/current.h
+++ b/arch/arm/include/asm/current.h
@@ -18,6 +18,8 @@ static __always_inline __attribute_const__ struct
task_struct *get_current(void)
 {
        struct task_struct *cur;

+       return __current;
+
 #if __has_builtin(__builtin_thread_pointer) && \
     defined(CONFIG_CURRENT_POINTER_IN_TPIDRURO) && \
     !(defined(CONFIG_THUMB2_KERNEL) && \

> I looked at the fdti-sio and slcan modules, and didn't find any
> references to per-CPU offsets when building them using the provided
> .config. I did find some references to __current, but these seem to be
> ignored (they are only emitted to satisfy the "m" inline asm
> constraint in get_domain(), but the parameter is never actually used
> in the assembler code)

I see some __current references in the musb driver that come from
tracepoints as well (in omap2plus_defconfig), but these also shouldn't be
active.

        Arnd
