Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3BB53D2EE
	for <lists+linux-omap@lfdr.de>; Fri,  3 Jun 2022 22:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346929AbiFCUq0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Jun 2022 16:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344714AbiFCUqZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Jun 2022 16:46:25 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1615B89D;
        Fri,  3 Jun 2022 13:46:24 -0700 (PDT)
Received: from mail-yb1-f172.google.com ([209.85.219.172]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N9d91-1nlQOx3IBR-015aZC; Fri, 03 Jun 2022 22:46:23 +0200
Received: by mail-yb1-f172.google.com with SMTP id v106so15818012ybi.0;
        Fri, 03 Jun 2022 13:46:22 -0700 (PDT)
X-Gm-Message-State: AOAM531RmBnREoJki5dVl60R9PCoEls1+yrh5Ibx8XkzIM1MLa8vUpmG
        oWSYv9TrjWFegA0D3W26bC7+j49fdokwzHc0hko=
X-Google-Smtp-Source: ABdhPJxeD6w6m6F9CVwFsS5VbNSgm02jMEaD11IY6b67kJoJNWXfIieWwJGAqX3QfpLf8e5BPmOQ9BXPY602TUwH8Fg=
X-Received: by 2002:a25:1209:0:b0:65d:63f9:e10a with SMTP id
 9-20020a251209000000b0065d63f9e10amr12789538ybs.480.1654289181550; Fri, 03
 Jun 2022 13:46:21 -0700 (PDT)
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
 <CAK8P3a1nhBnbbocBNkKUKYhw14OYE0WPEyQcJJXzbpW4uASu_Q@mail.gmail.com>
 <CAGm1_kswMZkoV9_DnB71ugVTF_rh5SV2NazkHROwXiFqhxTWYA@mail.gmail.com>
 <CAK8P3a0Qdav2JaF8yLydxr9amQp30gnY67CVx+ubowUHeG1VeA@mail.gmail.com>
 <CAMj1kXEL48=w08A2t7522y1visAUcnkkq4LA6ERRP_FbCbEgiw@mail.gmail.com>
 <CAMj1kXFmFfQ1oZ-CUcwe+ojSkk+9KBH1azhGrEJ4=-pZgMXX-Q@mail.gmail.com>
 <CAGm1_ku-tygQJrgvHnvJd0xzb6Vw3t_qdz_VKHJx4YWSxCEryA@mail.gmail.com>
 <CAMj1kXHUoDQ0xZ4yBx9uT6D9=6xfOsJoWLoOKho_-=Z9uYS30w@mail.gmail.com>
 <CAGm1_ks8g3RNwOkC8C_B2eYz56cEA7L-6CRdmqmNwSvAg-JP_g@mail.gmail.com>
 <CAMj1kXH+WR03MX94rd1p7Yz60mfrkOvOx=NYoZ9FCSnqMP4nTw@mail.gmail.com>
 <CAGm1_kvZ_6tPgfrTc3pH+6TedoU+mvuEXb+7aEp5mXfx516fmA@mail.gmail.com>
 <CAMj1kXEfKLYYxt9imEO155oxWTzXtWPpF8txGZ-xCs_6vez-WA@mail.gmail.com>
 <CAGm1_kvJpoDk=G3xYKT5UD5QnjRGr9Npft-8OCgtB9+qCjRtqQ@mail.gmail.com>
 <CAGm1_kvrivJLsFJaZtr6ojryDZFu3Xmpum8FURoFT9vMr54LUA@mail.gmail.com>
 <CAK8P3a2113EnZw9BNjCYYmKuNqEk4CtZCC0ydBNNQXetvzTSEg@mail.gmail.com> <CAGm1_kuUVKAxcxENnvsq5AGzeXAeXP6yLmjt1MQSpfjdcvZjng@mail.gmail.com>
In-Reply-To: <CAGm1_kuUVKAxcxENnvsq5AGzeXAeXP6yLmjt1MQSpfjdcvZjng@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 3 Jun 2022 22:46:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1VeP6YMYV6hh13K1Q3epuO5wRUmTByY7YVVT86J1giqg@mail.gmail.com>
Message-ID: <CAK8P3a1VeP6YMYV6hh13K1Q3epuO5wRUmTByY7YVVT86J1giqg@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xPqhkauarN5C+ExCtlazP0A8aoqfSXWuJ9+oPGgB8ZsVDuXMZca
 6VcsQEL7dqC+1DoFcLLLW3kqS2T1/tboTbV3Y4J9jIcKVHr/TFyzyq9RLCaTS62z/La0vLz
 X8RmvvI/6y7urE3vbdOazmc42wR7tlWPLs1PtVW/jIylMRhLxjuJHvAsE2HEF6TB/d5VADH
 OeJpK4jKPjQdWAjt0awkg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2SdwqDVsGsc=:2sw4sshLC6vcE+tLS4Zd2R
 SjaSAzmqshar/xKgbIwXbTlwCV84LAer67Em6ZhogKp7TAxrUKqg7HZOb7zEx7Yv21Fvm/v+N
 MCM+qwXXKsJ0+mcZOROoKBvc1UkpZ/xXJofom3FnE3aB5fgmMnDLehaxMYgzn7BxiqSSJaFb9
 EnsQNi2BvcwEMCPMURJbFbqt2RkKS2vHLnaipfOl3OxccedlsL2e1s3NhUQxUp7M3iD/iGYy2
 Y5jco1FcAa5LKU+PFfoSlmx23y5J9pp3xMGlhL9+PjFoJ5STBnz3cSeLIYOWHh+bbKXSW/9PF
 F41xLJ8/cHkpJiXOgfHAkUpo7T8V7rkVSTaPOj6jxV8fGg+msLZ0ZgeFOPmbrZq2Hec4/OnWR
 mxN4ZDYFMiNz6N1tnUFQOcOn+Ytbg0mv/GfvXp3UM94Ftxg6AqwXFS+R1PZemTDd51tNrmHrT
 Rwyy2nW1ChcYfzbTcgudn79WuAnfcQhI78gimHFWKa7FI3XQxAf4GxRqM5/c/0S8D7XRESoj9
 Y0HtNTz59bknoX/bpgDAp4BUDXB0pTqSDXnIVNugi4ViHo3kunNyCW4e4UE3BJ0QO3gBw5VB0
 uL4t9Py+IsmYvT6s8Gq1QGBigFH26l1C8T4LzYLM5OLnyk/L9gen29Ehjl55Czv2/p3eG6bne
 vD7gazcP3BZhzCgVK07XfEZFCSzspAMoY1kX8I5m1DkbC9e6H0KQGv6OT7kNpiH69c1qAPmJK
 dypMDMjQwxW1SVQs7+Uf49vbIqvcva32SGcovQ==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jun 3, 2022 at 9:11 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> With compiled-in drivers the system doesn't stall. All other tests and
> related outputs will come next week.

Ah, nice!

It's probably a reasonable assumption that the smp-patched get_current()
is (at least sometimes) broken in modules but working in the kernel itself.
I suppose that means in the worst case we can hot-fix the issue by
having an 'extern' version of get_current() for the case of
armv6+smp+module ;-)

Maybe start with the ".long 0xe7f001f2" hack I suggested in my last
mail. If that gives you an oops for the module case, then we know
that the patching doesn't work at all and you don't have to try anything
else, otherwise it's more likely that an incorrect instruction sequence
is patched in.

        Arnd
