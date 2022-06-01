Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2318253A32C
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jun 2022 12:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352478AbiFAKrW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jun 2022 06:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352266AbiFAKqq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Jun 2022 06:46:46 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1D5F40;
        Wed,  1 Jun 2022 03:46:42 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2ff90e0937aso13960837b3.4;
        Wed, 01 Jun 2022 03:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rl5sKsmhmEDfqmiD+xq70v8BHXGWDSOfbBXzxj6pAb8=;
        b=jhS46ry21ybzpoF2mmb2fQNXXVIaazpcYlfTIFyKwt84xzDkMJX4iOjokK3n7r7ZEO
         w5/X6FtQivvZ1Hrmv9h0OdEX9tVHzrgLHByv4mY1fwEQggWhwZdrZXQ/4japNa2QzYhJ
         R95S5LV3RYyWqBYUOz+nNxzgI1sF8775e7bg7kLD/cp8tX9mz+RZhVQkGsDGpUpbHHt5
         yfnfzRnMi66UEQJDMPP0EJja8/wUgSjQggWAPElKRSIjqfPPUQuoupSl+LNxcHRaCbrU
         DVj+ubEMNsEG2rsRMz/608UMazOVdws8TWz1HRPwKBk47RqhxUGVVVXopI9ZnKbF8aSK
         2iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rl5sKsmhmEDfqmiD+xq70v8BHXGWDSOfbBXzxj6pAb8=;
        b=I44KxM3dnkWvm4AkFO8fEbvw1hAUqYrFD8ZYahQXs49K3WH9OkQ3sesWwp9mjaCP3+
         oHDUDq8cUaT9hYM8SBk/tOIdgryVlQRJ/yL6xxlqqjymxqrY1cvBdW4F9mVrmWE7e3PO
         LxdskMs0REDgTlXW3We0g73C6JOnAQThBiJixCNgJ13Kc+Zv+tBmAEcw34YkNOqzoriF
         6jeTkBGXmTnEfnoGpFrTCp7Eupgb4jBdvoYvuSexouYqHYWcRgtI4u3Y5Y7z0NwMFYIg
         yxcYY9fNP5r8vgzGdZUb2lpnDRvW7kO0FsZ/bx+KJbmePeWPQTSoT0oc+zNloL1PdrNS
         cMCg==
X-Gm-Message-State: AOAM533zwqhvCl/PyZdsLqC6X8K++74bTQDvEjhe6QUikQ2pBC+uKTfd
        VV3YDsxCb205m7b8QyMBFJPx9rt+h3FfSYCbKKpnaYso4aU=
X-Google-Smtp-Source: ABdhPJytm36LNDPANmd8Z6OibsuVKXXzuqhN80oeLHEmpoQzLCFUsRPdKcL4+t9xTSb3UhNwpza7m67zL2cnAoMtNpo=
X-Received: by 2002:a81:184b:0:b0:30c:846e:e2b with SMTP id
 72-20020a81184b000000b0030c846e0e2bmr13471151ywy.97.1654080402131; Wed, 01
 Jun 2022 03:46:42 -0700 (PDT)
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
 <CAGm1_ku-tygQJrgvHnvJd0xzb6Vw3t_qdz_VKHJx4YWSxCEryA@mail.gmail.com> <CAMj1kXHUoDQ0xZ4yBx9uT6D9=6xfOsJoWLoOKho_-=Z9uYS30w@mail.gmail.com>
In-Reply-To: <CAMj1kXHUoDQ0xZ4yBx9uT6D9=6xfOsJoWLoOKho_-=Z9uYS30w@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Wed, 1 Jun 2022 12:46:30 +0200
Message-ID: <CAGm1_ks8g3RNwOkC8C_B2eYz56cEA7L-6CRdmqmNwSvAg-JP_g@mail.gmail.com>
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

On Wed, Jun 1, 2022 at 12:06 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Wed, 1 Jun 2022 at 12:04, Yegor Yefremov <yegorslists@googlemail.com> wrote:
> >
> > On Wed, Jun 1, 2022 at 11:28 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Wed, 1 Jun 2022 at 10:08, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > >
> > > > On Wed, 1 Jun 2022 at 09:59, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > >
> > > > > On Wed, Jun 1, 2022 at 9:36 AM Yegor Yefremov
> > > > > <yegorslists@googlemail.com> wrote:
> > > > > > On Tue, May 31, 2022 at 5:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > > > I've pushed a modified branch now, with that fix on the broken commit,
> > > > > > > and another change to make CONFIG_IRQSTACKS user-selectable rather
> > > > > > > than always enabled. That should tell us if the problem is in the SMP
> > > > > > > patching or in the irqstacks.
> > > > > > >
> > > > > > > Can you test the top of this branch with CONFIG_IRQSTACKS disabled,
> > > > > > > and (if that still stalls) retest the fixed commit f0191ea5c2e5 ("[PART 1]
> > > > > > > ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems")?
> > > > > >
> > > > > > 1. the top of this branch with CONFIG_IRQSTACKS disabled stalls
> > > > > > 2. f0191ea5c2e5 with the same config - not
> > > > >
> > > > > Ok, perfect, that does narrow down the problem quite a bit: The final
> > > > > patch has seven changes, all of which can be done individually because
> > > > > in each case the simplified version in f0191ea5c2e5 is meant to run
> > > > > the exact same instructions as the version after the change, when running
> > > > > on a uniprocessor machine such as your am335x.
> > > > >
> > > > > You have already shown earlier that the get_current() and
> > > > > __my_cpu_offset() functions are not to blame here, as reverting
> > > > > only those does not change the behavior.
> > > > >
> > > > > This leaves the is_smp() check in set_current(), and the
> > > > > four macros in <asm/assembler.h>. I don't see anything obviously
> > > > > wrong with any of those five, but I would bet on the macros
> > > > > here. Can you try bisecting into this commit, maybe reverting
> > > > > the changes to set_current and get_current first, and then
> > > > > narrowing it down to (hopefully) a single macro that causes the
> > > > > problem?
> > > > >
> > > >
> > > > set_current() is never called by the primary CPU, which is why the
> > > > is_smp() check was removed from there in 57a420435edcb0b94 ("ARM: drop
> > > > pointless SMP check on secondary startup path").
> > > >
> > > > So that leaves only the four macros in asm/assembler.h, but I don't
> > > > see anything obviously wrong with those either.
> > >
> > > I pushed a patch on top of Arnd's branch at the link below that gets
> > > rid of the subsections, and uses normal branches (and code patching)
> > > to switch between the thread ID register and the LDR to retrieve the
> > > CPU offset and the current pointer. I have no explanation whether or
> > > why it could make a difference, but I think it's worth a try.
> >
> > The link to your repo is missing.
> >
>
> Oops, sorry :-)
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=am335x-stall-test

I have tested your branch and it stalls:

[   69.924298] rcu: INFO: rcu_sched self-detected stall on CPU
[   69.930986] rcu:     0-...!: (2600 ticks this GP)
idle=6f5/1/0x40000004 softirq=2257/2257 fqs=0
[   69.940551]  (t=2600 jiffies g=3413 q=11)
[   69.945187] rcu: rcu_sched kthread timer wakeup didn't happen for
2599 jiffies! g3413 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
[   69.957111] rcu:     Possible timer handling issue on cpu=0
timer-softirq=1261
[   69.964668] rcu: rcu_sched kthread starved for 2600 jiffies! g3413
f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=0
[   69.975638] rcu:     Unless rcu_sched kthread gets sufficient CPU
time, OOM is now expected behavior.
[   69.985170] rcu: RCU grace-period kthread stack dump:
[   69.990708] task:rcu_sched       state:I stack:    0 pid:   10
ppid:     2 flags:0x00000000
[   70.000250] [<c0b683b4>] (__schedule) from [<c0b68cf8>] (schedule+0x54/0xe8)
[   70.008705] [<c0b68cf8>] (schedule) from [<c0b6f4fc>]
(schedule_timeout+0xa8/0x210)
[   70.017449] [<c0b6f4fc>] (schedule_timeout) from [<c01d8594>]
(rcu_gp_fqs_loop+0x118/0x6b4)
[   70.026875] [<c01d8594>] (rcu_gp_fqs_loop) from [<c01dc4c4>]
(rcu_gp_kthread+0x138/0x30c)
[   70.036074] [<c01dc4c4>] (rcu_gp_kthread) from [<c0164dd8>]
(kthread+0x13c/0x164)
[   70.044559] [<c0164dd8>] (kthread) from [<c0100150>]
(ret_from_fork+0x14/0x44)
[   70.052732] rcu: Stack dump where RCU GP kthread last ran:
[   70.058773] NMI backtrace for cpu 0
[   70.062840] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.16.0-rc1 #1
[   70.070003] Hardware name: Generic AM33XX (Flattened Device Tree)
[   70.076698] Workqueue: events dbs_work_handler
[   70.082258] [<c01115f0>] (unwind_backtrace) from [<c010bfd4>]
(show_stack+0x10/0x14)
[   70.091113] [<c010bfd4>] (show_stack) from [<d00299f0>] (0xd00299f0)
[   70.099045] NMI backtrace for cpu 0
[   70.103188] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.16.0-rc1 #1
[   70.110357] Hardware name: Generic AM33XX (Flattened Device Tree)
[   70.117027] Workqueue: events dbs_work_handler
[   70.122491] [<c01115f0>] (unwind_backtrace) from [<c010bfd4>]
(show_stack+0x10/0x14)
[   70.131254] [<c010bfd4>] (show_stack) from [<d00299f0>] (0xd00299f0)
