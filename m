Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5B5539ED8
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jun 2022 09:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244461AbiFAH7s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jun 2022 03:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350449AbiFAH7r (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Jun 2022 03:59:47 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BF58B08C;
        Wed,  1 Jun 2022 00:59:44 -0700 (PDT)
Received: from mail-yb1-f172.google.com ([209.85.219.172]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MlfCm-1nVXHp0VwQ-00ioNe; Wed, 01 Jun 2022 09:59:43 +0200
Received: by mail-yb1-f172.google.com with SMTP id z186so1533387ybz.3;
        Wed, 01 Jun 2022 00:59:42 -0700 (PDT)
X-Gm-Message-State: AOAM533uDDlKAiJvtiPnLfcWiu7XEv8ZMgcCb5XiR8Yw8nM1+6e1Uh2D
        XeazRkhtHhMMCDYqqSCTS2l31eQ3M66h8PL6t5c=
X-Google-Smtp-Source: ABdhPJzoWPaCkT1VZk6Y6xdPwsZG7YGq4YdyqYdk9hnpO8XDD4fVWG6RMcr3k33Ge326LgxfboYwcTuMLxQdt36KBvI=
X-Received: by 2002:a25:4f0a:0:b0:64f:6a76:3d8f with SMTP id
 d10-20020a254f0a000000b0064f6a763d8fmr52296373ybb.134.1654070381814; Wed, 01
 Jun 2022 00:59:41 -0700 (PDT)
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
 <CAGm1_ksF1UPpdeiTnADiQK8MFbvP8-eDhc=yaCL75EsE_pG=-g@mail.gmail.com>
 <CAGm1_ksmXTnEo_Mxk7+S4vs_CQAs5ZHoEOpq9Tq3ZFf7sruX7A@mail.gmail.com>
 <CAK8P3a1nhBnbbocBNkKUKYhw14OYE0WPEyQcJJXzbpW4uASu_Q@mail.gmail.com> <CAGm1_kswMZkoV9_DnB71ugVTF_rh5SV2NazkHROwXiFqhxTWYA@mail.gmail.com>
In-Reply-To: <CAGm1_kswMZkoV9_DnB71ugVTF_rh5SV2NazkHROwXiFqhxTWYA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 1 Jun 2022 09:59:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Qdav2JaF8yLydxr9amQp30gnY67CVx+ubowUHeG1VeA@mail.gmail.com>
Message-ID: <CAK8P3a0Qdav2JaF8yLydxr9amQp30gnY67CVx+ubowUHeG1VeA@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:b9ASgxEDgqZ8ii6ib33MpCJCchT4gApGIl6hJpXQkZxL19nTNn5
 qBv1LR5oi0gJ3Oatwh5ZRa7C7V5IwQ8VKdIy+LcmmrGJSVLw3Cfy4nCGcrUftkMgowZhZw7
 vLWbPZZSFDdWnS3HrmYmFWDs7WdplVvfKBoy3rjw1JoUQoEzO0gOMmT0XNWn6BnYmkvadGN
 x8DwSdXK6uQDo9oJBNtCQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J7AHqQzNyl8=:4qgbc1LXw0qHAMXwqp1VbV
 xtBKmdy//u7/kvw3cYUGC/RnoVNarlY9gy91VSl94iO5uLjZrrYaRgjq6NvU41RDnVNozbBR9
 LjWB4A2hWTJXgxx9d6NBNJt/0vIUAx4hFFZyo36uR4oKWX9KqHvT8zZNk2d595T1bgiDoX/ID
 a3fsicIYSroE48A1fAvWyIHwEj2XBVEMa3XgDFnNiIjx7lqUnWRyasBP867UUx3Twa8HoimOU
 ULVtX514v5/95Iy1tdsrl5GaPpxFpPwm/C1KMoNQ/0oKLQ8fi4ahz+sULaJFWK0oZ9fxOpVM2
 lcfPVep4yFwqSZpT+JPRT34V5ciJKs7f+5ukDiYF7jLgvF6ngsxyffCAiTszHuVnUZ4n7859e
 KVI1Y06bz7ZP1bQAsFCqEOzddQgqfHKmlFBPnsT5m+TuVjrV/v/Fz72I0Q9ypS4OBQiI4wK8a
 RmNvUGTIm+Pqxb+FVNdHpCZ3LMCMerF/56qQuB7e7HLZIYUVStcl1X87KnqgnmwW3bvYeLKYE
 +LfSY+fmXecq9RxDgDwYBQtIbgehKipbnJ5CdOgjOZfEChqJ7kUMFWZTept081JHQeiiEDZPB
 ajIkbaOgBGdljFofwhNOGjqPBN/FD7zplBsyhJOxI/O364/XTvkvgOA31dAhQ6TmyDF8K5gRM
 o2Hp3pA/Gl5fHGAGr5GxYYOn4Hy9buaq4yvWjsrNVesWnEiNVFh+dg6/74y1BnvFYP7jBJvHJ
 rSggpRxIBnHa4IAtoKPJF+ico5Yr7nyhUVWgTedbEK7OmdS5ES9Mk3DcL5wkG538je5DdT7cb
 D2XdB2fiVx6pazJTFUvk3HcXwV0+9ENdw3gNm2XgaE5p1FwJRXmLEugnDnpKhfc7d9hUfU9gc
 W2HEtEzaFxzYTqG65/vw==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jun 1, 2022 at 9:36 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Tue, May 31, 2022 at 5:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > I've pushed a modified branch now, with that fix on the broken commit,
> > and another change to make CONFIG_IRQSTACKS user-selectable rather
> > than always enabled. That should tell us if the problem is in the SMP
> > patching or in the irqstacks.
> >
> > Can you test the top of this branch with CONFIG_IRQSTACKS disabled,
> > and (if that still stalls) retest the fixed commit f0191ea5c2e5 ("[PART 1]
> > ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems")?
>
> 1. the top of this branch with CONFIG_IRQSTACKS disabled stalls
> 2. f0191ea5c2e5 with the same config - not

Ok, perfect, that does narrow down the problem quite a bit: The final
patch has seven changes, all of which can be done individually because
in each case the simplified version in f0191ea5c2e5 is meant to run
the exact same instructions as the version after the change, when running
on a uniprocessor machine such as your am335x.

You have already shown earlier that the get_current() and
__my_cpu_offset() functions are not to blame here, as reverting
only those does not change the behavior.

This leaves the is_smp() check in set_current(), and the
four macros in <asm/assembler.h>. I don't see anything obviously
wrong with any of those five, but I would bet on the macros
here. Can you try bisecting into this commit, maybe reverting
the changes to set_current and get_current first, and then
narrowing it down to (hopefully) a single macro that causes the
problem?

        Arnd
