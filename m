Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C28D5247B3
	for <lists+linux-omap@lfdr.de>; Thu, 12 May 2022 10:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351345AbiELIOl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 May 2022 04:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351350AbiELIOk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 May 2022 04:14:40 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909265DBE3;
        Thu, 12 May 2022 01:14:37 -0700 (PDT)
Received: from mail-yb1-f170.google.com ([209.85.219.170]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Md66H-1oOwsi2EM7-00aAd1; Thu, 12 May 2022 10:14:35 +0200
Received: by mail-yb1-f170.google.com with SMTP id x17so8398710ybj.3;
        Thu, 12 May 2022 01:14:35 -0700 (PDT)
X-Gm-Message-State: AOAM530083DOA3IplrTxU3lL5IsjzdG9UIuwOta3au/y3OjoXJ3eNl7c
        zmyLH+uatgDUPQQ/LZND2umTAw+exdRYNvjy65E=
X-Google-Smtp-Source: ABdhPJxYlfZ6T04YTUrbGyvWzZ6qQVJVV0d+mwFo1uTISdfe00UIvNMgHa6nvI/sYpRan8quVF/h+BCmUz790udHgHg=
X-Received: by 2002:a25:d3c2:0:b0:645:74df:f43d with SMTP id
 e185-20020a25d3c2000000b0064574dff43dmr27028464ybf.394.1652343274227; Thu, 12
 May 2022 01:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kvEcvzKBb2O7NEa1SDt8MuOQfnN8LQ+voNGUBDR8JpKSg@mail.gmail.com>
 <YnNb5M+gHI4hIaPG@atomide.com> <CAGm1_kstAbEZXBYwoK4GrFxMmPi=kpmdfJd1WAB8XSE_vNTTNg@mail.gmail.com>
 <Ynyd9HeFNmGQiovY@atomide.com>
In-Reply-To: <Ynyd9HeFNmGQiovY@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 12 May 2022 10:14:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3817c8JMd=vqCjmY_kvBshhzSetgMfEihZ-NdcVZgJpQ@mail.gmail.com>
Message-ID: <CAK8P3a3817c8JMd=vqCjmY_kvBshhzSetgMfEihZ-NdcVZgJpQ@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Tony Lindgren <tony@atomide.com>
Cc:     Yegor Yefremov <yegorslists@googlemail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Lub9ZsxvV1zrOBc1Ujo83uZNaGaWl6GFILH3qo1y0/gpChdnfCO
 wsKxOPZ7H1V80G3yY+dLP7WvEtir0ov+3rJ54jSmokCqKrIuVSvJk0rvpCacaamo5VOGjS2
 +Y2L9maTnyOfqeEfGj1mp2sbmzOgLeZg9EG1Wi7GhXeiXRCTfWsGCS1gCvkKMc9jHQ2xnlz
 U4X8/U7xA7mCotjXF8CPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SiCC8J+dTz0=:AOTX/qndo/uAbz52Ei7oCy
 rTC2wmqnbYJOzudEQKJgPv/5J//Dx9O9hM4gYBILgdpPTKxsMB27B17WsTwgMYF87Tao54kZI
 jCv9ek3PAJTMKB1+gnrIXDeuCuk1EPs7ivGokRLbDcQxuifyWUBo+k8Wi0274U6YDTIgkZIMQ
 UchQ+SNC/Z68Rrk1KCVKyWIlvh+ODOslf2zts6XBXaRsMu4vyqqvs0uno6KvF3+d8zNFwBGmW
 43pqHhCSCwYtCFx/WTj13lm5WhdMXPqLqXty4ARPzW3GvbmidaB02+AWbs3oVZ9tOuMgKsQWO
 C225D0PQCRIxn5lxw7cMdtyySZe4XwJuLzQb9Slhy4dMMFJQ8+xsGk8dNOJZky7ld7FCcyQxa
 kaQkpWjpMaTIGzZYa+vLCBYOPRT2CKW98sLhMxGWhz81w0MZ0wOW53+K14fAWkJ/vbQ6w8GxS
 i2JDbGFwFmooYUj5MzNXJMzXgoMdxSbVqeH3a3sK2AAoEJGD5VD7CUDgC5f6uBJe0FPwA+riX
 qOsZuxWcrPP4AA4AU43aYovndJad3SasacDwY8eRayovARtGtR+EzdjeTQbSBKZzos89IC6aK
 qdg87qF3IWyDRtkA0/yutxkUo8VvkhZlL8hA9LWguInRGg8/ElN2m38akEVusm257F0U0HH/8
 /8IInN00hv4kDVzZalc3Mib8VV1V8J0hWpf4s1aqdbllQ4Hn0YSTqWSZ3O/M6zGdEPM/By4df
 A450LVuW6MxYYqmcz5OHIKGwrj1jV0xw+06nHba6dPKpTWS+mC/h23R4TIyGrWxGWOUTk5kn/
 oy1/JPNNaiH8hiN1LmTRk3KI7x92ACVTcwCo/p+WQ8oiQGfoz8=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 12, 2022 at 7:41 AM Tony Lindgren <tony@atomide.com> wrote:
> Adding Ard and Arnd for vmap stack.

Thanks!

> * Yegor Yefremov <yegorslists@googlemail.com> [220511 14:16]:
> > On Thu, May 5, 2022 at 7:08 AM Tony Lindgren <tony@atomide.com> wrote:
> > > * Yegor Yefremov <yegorslists@googlemail.com> [220504 10:35]:

>
> Maybe Ard and Arnd have some ideas what might be going wrong here.
> Basically anything trying to use a physical address on stack will
> fail in weird ways like we've seen for smc and wl1251.

For this, the first step should be to enable CONFIG_DMA_API_DEBUG.
If any device is getting the wrong DMA address for a stack variable,
this should print a helpful debug message to the console.

> > > > [   88.408578] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > [   88.415777]  (detected by 0, t=2602 jiffies, g=2529, q=17)
> > > > [   88.422026] rcu: All QSes seen, last rcu_sched kthread activity
> > > > 2602 (-21160--23762), jiffies_till_next_fqs=1, root ->qsmask 0x0
> > > > [   88.434445] rcu: rcu_sched kthread starved for 2602 jiffies! g2529
> > > > f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
> > > > [   88.445274] rcu:     Unless rcu_sched kthread gets sufficient CPU
> > > > time, OOM is now expected behavior.
> > > > [   88.454859] rcu: RCU grace-period kthread stack dump:

I looked for a smoking gun in the backtrace, didn't really find anything,
so I'm guessing the problem is something that happened between the
last timer timer and the time it actually ran the rcu_gp_kthread, maybe
some DMA timeout in a device driver running with interrupts disabled.

> > > > [   88.807588]  omap3_noncore_dpll_program from clk_change_rate+0x23c/0x4f8
> > > > [   88.815375]  clk_change_rate from clk_core_set_rate_nolock+0x1b0/0x29c
> > > > [   88.822936]  clk_core_set_rate_nolock from clk_set_rate+0x30/0x64
> > > > [   88.830056]  clk_set_rate from _set_opp+0x254/0x51c
> > > > [   88.835835]  _set_opp from dev_pm_opp_set_rate+0xec/0x228
> > > > [   88.842073]  dev_pm_opp_set_rate from __cpufreq_driver_target+0x584/0x700
> > > > [   88.849792]  __cpufreq_driver_target from od_dbs_update+0xb4/0x168
> > > > [   88.856953]  od_dbs_update from dbs_work_handler+0x2c/0x60
> > > > [   88.863441]  dbs_work_handler from process_one_work+0x284/0x72c
> > > > [   88.870411]  process_one_work from worker_thread+0x28/0x4b0
> > > > [   88.876973]  worker_thread from kthread+0xe4/0x104
> > > > [   88.882692]  kthread from ret_from_fork+0x14/0x28

The only thing I see that is slightly unusual here is that the timer
tick happened
exactly during the cpufreq transition. Is this always the same backtrace when
you run into the bug? What happens when you disable the omap3 cpufreq
driver or set it to run at a fixed frequency?

          Arnd
