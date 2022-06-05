Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BED653DC65
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jun 2022 16:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345296AbiFEO7d (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Jun 2022 10:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237838AbiFEO7b (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 5 Jun 2022 10:59:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5561FCE4;
        Sun,  5 Jun 2022 07:59:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 14EF2B80DAD;
        Sun,  5 Jun 2022 14:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25B3C34115;
        Sun,  5 Jun 2022 14:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654441166;
        bh=yO8sK4GA4oi2wE61QwnwNeFEL4N9bZFVguHqyvO1Mzg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Rpx0QtvP3OAEnVJTixTh8HY6tbax6mGj7K9c6NngTFlHmc6FTGio7ehu8ftzLojXd
         jHaDSsX8FnBaLQmHcpHRcLMQuCEWABulcvKVGCBK2MkkTjEPRk6whdEwpogpJPVDpl
         WtcrQOMi69NEw3mh8dznD94xqkqa9JHwUlUWLdMiHSHUIyNKFK3xvU4PGnYxDNCl4r
         j2avMjRYrKugCOM5YR1iv8DwLOHOkTT9o1tSv73SRQCw9SxB03htrDU78PFd2fOfoj
         sU/s8Y5M3kRWkp6mF4I9bIrhWfYsCTIhySfny/dSUmjhvpUdD81STpUhbTe/9z9aS5
         9s5fkjLZD0kFw==
Received: by mail-ot1-f47.google.com with SMTP id r14-20020a056830418e00b0060b8da9ff75so9061444otu.11;
        Sun, 05 Jun 2022 07:59:26 -0700 (PDT)
X-Gm-Message-State: AOAM5325qOpkiVXoWEkvNDCFXquh2XiqZecBhhxCuIiIe6nbJcqaEyR/
        B7bmek/PuYQFQxPuHUx7QecEM3QEFVRoS/OoBi4=
X-Google-Smtp-Source: ABdhPJyCWqBoqXwsEu9hOeuWUnIcpP2DSHl1ydlpagstI1NVmseMrv7ch9qdqJ9amFY2RQLE5GxctR+FAhM0jfEi8Hc=
X-Received: by 2002:a9d:76d5:0:b0:60b:1882:78bd with SMTP id
 p21-20020a9d76d5000000b0060b188278bdmr8393936otl.71.1654441165799; Sun, 05
 Jun 2022 07:59:25 -0700 (PDT)
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
 <CAK8P3a2113EnZw9BNjCYYmKuNqEk4CtZCC0ydBNNQXetvzTSEg@mail.gmail.com>
 <CAGm1_kuUVKAxcxENnvsq5AGzeXAeXP6yLmjt1MQSpfjdcvZjng@mail.gmail.com> <CAK8P3a1VeP6YMYV6hh13K1Q3epuO5wRUmTByY7YVVT86J1giqg@mail.gmail.com>
In-Reply-To: <CAK8P3a1VeP6YMYV6hh13K1Q3epuO5wRUmTByY7YVVT86J1giqg@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Sun, 5 Jun 2022 16:59:14 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEzK2eEXLHP2OH6APpw+yC66XQafFWs6kMni1i+bDC4uA@mail.gmail.com>
Message-ID: <CAMj1kXEzK2eEXLHP2OH6APpw+yC66XQafFWs6kMni1i+bDC4uA@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Yegor Yefremov <yegorslists@googlemail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 3 Jun 2022 at 22:47, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Jun 3, 2022 at 9:11 PM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> >
> > With compiled-in drivers the system doesn't stall. All other tests and
> > related outputs will come next week.
>
> Ah, nice!
>
> It's probably a reasonable assumption that the smp-patched get_current()
> is (at least sometimes) broken in modules but working in the kernel itself.
> I suppose that means in the worst case we can hot-fix the issue by
> having an 'extern' version of get_current() for the case of
> armv6+smp+module ;-)
>

I've coded something up along those lines, and pushed it to my
am335x-stall-test branch.

> Maybe start with the ".long 0xe7f001f2" hack I suggested in my last
> mail. If that gives you an oops for the module case, then we know
> that the patching doesn't work at all and you don't have to try anything
> else, otherwise it's more likely that an incorrect instruction sequence
> is patched in.
>

Yeah, I'd be really surprised if the patching misses some occurrences,
so I have no clue what is going on here.

Yegor, can you please try my branch with the original config (i.e.,
slcan and ftdio as modules)

https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=am335x-stall-test
