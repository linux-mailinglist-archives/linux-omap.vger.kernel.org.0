Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E953A53F8D7
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jun 2022 10:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234772AbiFGIzq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jun 2022 04:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238752AbiFGIzp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jun 2022 04:55:45 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16FDF95A04;
        Tue,  7 Jun 2022 01:55:43 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-300628e76f3so167714757b3.12;
        Tue, 07 Jun 2022 01:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DCFzqf63qTXvY8vrDH8nEkvB0ZzP3LV9vfnLAnBhtZ0=;
        b=OXAAsSsqWJi+ZmAnZHwZ3Ov4KAt9dijXM7JEfwDpKzXyfryCFwOzxbC3QZhnFXHp9L
         LFuoi9R8HCIN42XSmqaOQu/XHZqAplNELcuxGGf2VoLBfO3pDcPH93CRMlOVPp8GvbeK
         qJMmXW0vrt5fobyjEU9WsB+TnJ+ocqasY9EneC+gsH6xNA+vf/ufJDaJr6y94B0CeBBU
         gaidajhkoKxsVf6D19cMn5pyY4AhQzoUquMv7X3d6hp4zAVC+3zU+lCaMZfz7I+9F4e6
         pvfblRek8KAGF6ibobsIKH/5/5T74ofRtv2DmzOZI7um4Vz2stoHiTvErbBBkwqUdyil
         nYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DCFzqf63qTXvY8vrDH8nEkvB0ZzP3LV9vfnLAnBhtZ0=;
        b=JFNUP0lvf94KlctMs7wkDXBdNqSouFEgFBsa5SNK3qqWsnojKcLSwTVOCEQ2rq9xYd
         vEfezFTQkxP76UUO1wErXbHMmq9a818QxxRHwVfnKdciKLdnlAPAOg5NIUeIkzSr0ofw
         xx/ZoYcthmsuaavUE97IyPwDck/DnO0XMcCG+8jUDGqIBPqwShr+i3mxlaa4Aj1UZmlw
         TSQ2woviz1s0biMWsKj8kDy3zdmbu7guSx+360ieboWvgtCPgcoiMmg2MP/xU1wSq+Sh
         javDicJdFyx5M17ljRO9/xDz50fLsk05Ve1XIyuufoZEL5tXNCPotiG0Cp+S5WWAESL4
         iV7g==
X-Gm-Message-State: AOAM532aKKBwMGvdevSi2tqptjy8PlFe0UPyqYoPH+0/a/46p3QBzWcu
        m30O3OiSgaJxXVmH6fB4vMsaSuQFRhgSm6xHo0TGFTahMWs=
X-Google-Smtp-Source: ABdhPJyGq9SkLesbmhzSr0UuAwuQTtqxxJDorC0eVc6BFNqsVApafYC11XsGlvmyENwQQcTAjo58orj6ynKJSPaNcr8=
X-Received: by 2002:a81:190f:0:b0:313:43b8:155c with SMTP id
 15-20020a81190f000000b0031343b8155cmr1295247ywz.495.1654592142166; Tue, 07
 Jun 2022 01:55:42 -0700 (PDT)
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
 <CAGm1_kuUVKAxcxENnvsq5AGzeXAeXP6yLmjt1MQSpfjdcvZjng@mail.gmail.com>
 <CAK8P3a1VeP6YMYV6hh13K1Q3epuO5wRUmTByY7YVVT86J1giqg@mail.gmail.com> <CAMj1kXEzK2eEXLHP2OH6APpw+yC66XQafFWs6kMni1i+bDC4uA@mail.gmail.com>
In-Reply-To: <CAMj1kXEzK2eEXLHP2OH6APpw+yC66XQafFWs6kMni1i+bDC4uA@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Tue, 7 Jun 2022 10:55:30 +0200
Message-ID: <CAGm1_kvutEPNXSVLD6PJ+ND8urrTksKHtELwCLd7sboBUyoz+w@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Jun 5, 2022 at 4:59 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Fri, 3 Jun 2022 at 22:47, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Fri, Jun 3, 2022 at 9:11 PM Yegor Yefremov
> > <yegorslists@googlemail.com> wrote:
> > >
> > > With compiled-in drivers the system doesn't stall. All other tests and
> > > related outputs will come next week.
> >
> > Ah, nice!
> >
> > It's probably a reasonable assumption that the smp-patched get_current()
> > is (at least sometimes) broken in modules but working in the kernel itself.
> > I suppose that means in the worst case we can hot-fix the issue by
> > having an 'extern' version of get_current() for the case of
> > armv6+smp+module ;-)
> >
>
> I've coded something up along those lines, and pushed it to my
> am335x-stall-test branch.
>
> > Maybe start with the ".long 0xe7f001f2" hack I suggested in my last
> > mail. If that gives you an oops for the module case, then we know
> > that the patching doesn't work at all and you don't have to try anything
> > else, otherwise it's more likely that an incorrect instruction sequence
> > is patched in.
> >
>
> Yeah, I'd be really surprised if the patching misses some occurrences,
> so I have no clue what is going on here.
>
> Yegor, can you please try my branch with the original config (i.e.,
> slcan and ftdio as modules)
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=am335x-stall-test

@Arnd: I have applied your patch with this change:

asm("0: .long 0xe7f001f2                        \n\t" // BUG() trap

But it revealed nothing new:

[   50.754130] rcu: INFO: rcu_sched self-detected stall on CPU
[   50.760834] rcu:     0-...!: (2600 ticks this GP)
idle=ec9/1/0x40000004 softirq=1852/1852 fqs=0
[   50.770407]  (t=2600 jiffies g=2577 q=17)
[   50.775046] rcu: rcu_sched kthread timer wakeup didn't happen for
2599 jiffies! g2577 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[   50.786961] rcu:     Possible timer handling issue on cpu=0 timer-softirq=872
[   50.794429] rcu: rcu_sched kthread starved for 2600 jiffies! g2577
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=0
[   50.805403] rcu:     Unless rcu_sched kthread gets sufficient CPU
time, OOM is now expected behavior.
[   50.814927] rcu: RCU grace-period kthread stack dump:
[   50.820464] task:rcu_sched       state:I stack:    0 pid:   10
ppid:     2 flags:0x00000000
[   50.830019] [<c0b683d4>] (__schedule) from [<c0b68d18>] (schedule+0x54/0xe8)
[   50.838470] [<c0b68d18>] (schedule) from [<c0b6f51c>]
(schedule_timeout+0xa8/0x210)
[   50.847208] [<c0b6f51c>] (schedule_timeout) from [<c01d85b4>]
(rcu_gp_fqs_loop+0x118/0x6b4)
[   50.856631] [<c01d85b4>] (rcu_gp_fqs_loop) from [<c01dc4e4>]
(rcu_gp_kthread+0x138/0x30c)
[   50.865832] [<c01dc4e4>] (rcu_gp_kthread) from [<c0164df8>]
(kthread+0x13c/0x164)
[   50.874315] [<c0164df8>] (kthread) from [<c0100140>]
(ret_from_fork+0x14/0x34)
[   50.882477] rcu: Stack dump where RCU GP kthread last ran:
[   50.888512] NMI backtrace for cpu 0
[   50.892575] CPU: 0 PID: 62 Comm: kworker/0:12 Not tainted 5.16.0-rc1 #1
[   50.899912] Hardware name: Generic AM33XX (Flattened Device Tree)
[   50.906610] Workqueue: events dbs_work_handler
[   50.912202] [<c0111600>] (unwind_backtrace) from [<c010bff4>]
(show_stack+0x10/0x14)
[   50.921035] [<c010bff4>] (show_stack) from [<d03919f0>] (0xd03919f0)
[   50.928943] NMI backtrace for cpu 0
[   50.933084] CPU: 0 PID: 62 Comm: kworker/0:12 Not tainted 5.16.0-rc1 #1
[   50.940419] Hardware name: Generic AM33XX (Flattened Device Tree)
[   50.947083] Workqueue: events dbs_work_handler
[   50.952574] [<c0111600>] (unwind_backtrace) from [<c010bff4>]
(show_stack+0x10/0x14)
[   50.961334] [<c010bff4>] (show_stack) from [<d03919f0>] (0xd03919f0)

@Ard: I have tried your branch
(21b6671c82d4df52ea0c7837705331acb375c5c8). The system still stalls.

Yegor
