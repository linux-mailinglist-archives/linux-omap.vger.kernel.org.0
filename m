Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4CC9523544
	for <lists+linux-omap@lfdr.de>; Wed, 11 May 2022 16:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234147AbiEKOUH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 May 2022 10:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243487AbiEKOUF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 May 2022 10:20:05 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE8A2AE38;
        Wed, 11 May 2022 07:20:04 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id z26so2196943iot.8;
        Wed, 11 May 2022 07:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qxVl2HkBy505310Vor0FnjAP+XUJ/b0coUt/URv/Wj8=;
        b=JcQZYxID1aQ2r5JSHn6NSb3dGy899gwt/8GySoW/s5kL9NkBLLxeVARYJhXLKt+UKw
         0hIWKkEjMwhtXJ0cTvxjjAZmNIT8kK8LLWl1zMzEixQlBMTXsWv921rUJkhsySxxi0CT
         UyaWwJhkzO4kuBC+TgAEObcA+Vksa94L4it7DneBuGKRbGjQXqRuL4YolgiACYCs9PK1
         eP9J+sa1SO4KIiUrrgPlaVNR+sgjrwDqBwtRujwl/iMD+7yWSgpOUohvi+gIIK9PkNGs
         AQ/8lhnyapRT1FKeK6HklHXDI9Yb0yBqkb77YLIcqNN2BAjjUn9MSyPipfQV8ek/FidU
         EjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qxVl2HkBy505310Vor0FnjAP+XUJ/b0coUt/URv/Wj8=;
        b=AXgPUuFtQGYt3QpASNJiYFjN5IB+krcv2h1gO8yXRXcfxm2zAnd3mZ0hP8xOb9fahO
         jjJMSEQzkkJXffQi9/SkPhDnGuiUEDRt9dMB3J8W6qeAxKlSIV8+NnfRJxFbtPqv6S4l
         0WSNnVo2E+Xd98TCSuzQI7fobc1jIG9qELIEwBDcG8XIlrIja+MlsS6lyt+nhW/+35iO
         THR8ZAk8dkXq72KWWWA/bVpaA0X7+3FlvI5pggH5he+cf6b0ZYDwDeedyPNtWL2UHR54
         lZ+Hy3t9L0zzZSUGpkRfMQk7XzYnPAfAuT/r1zj0P241VrQ4I7SIbTMTAf+MWn/Txyjo
         suoA==
X-Gm-Message-State: AOAM5323pRm9oSfwGIjMFZX7mlVVN61vGClgmZXXV8hK/DXuscUPMs85
        C+YYfyPV69VA1Jh66YTvy0szebaCEv0v3UAC3C0=
X-Google-Smtp-Source: ABdhPJys+kdcWhuJ4Q0BUBzQO8rrfcN+KHXSQID88mgCEWhOklLzafUG7feEsA1kRCetzl8X9taDIoe/5V0QHI9IvAA=
X-Received: by 2002:a02:230a:0:b0:32b:6f71:4411 with SMTP id
 u10-20020a02230a000000b0032b6f714411mr12986266jau.214.1652278803719; Wed, 11
 May 2022 07:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kvEcvzKBb2O7NEa1SDt8MuOQfnN8LQ+voNGUBDR8JpKSg@mail.gmail.com>
 <YnNb5M+gHI4hIaPG@atomide.com>
In-Reply-To: <YnNb5M+gHI4hIaPG@atomide.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Wed, 11 May 2022 16:16:26 +0200
Message-ID: <CAGm1_kstAbEZXBYwoK4GrFxMmPi=kpmdfJd1WAB8XSE_vNTTNg@mail.gmail.com>
Subject: Re: am335x: 5.18.x: system stalling
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Thu, May 5, 2022 at 7:08 AM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * Yegor Yefremov <yegorslists@googlemail.com> [220504 10:35]:
> > Hi Tony, all,
> >
> > since kernel 5.18.x (5.17.x doesn't show this behavior), the system
> > stalls as soon as I invoke the following commands (initializing
> > USB-to-CAN converter):
> >
> > slcand -o -s8 -t hw -S 3000000 /dev/ttyUSB0
> > ip link set slcan0 up
> >
> > Have you already seen such an issue? Should I try to bisect this?
>
> No have not seen this one either, yes please bisect if you can.
>
> Note that v5.18-rc1 has revert commit 859c2c7b1d06 ("Revert "clk: Drop
> the rate range on clk_put()"") that you may need to carry along in the
> bisect.

I had to skip a lot of commits due to assembler related build issues:

/tmp/cc5p087h.s: Assembler messages:
/tmp/cc5p087h.s:500: Error: invalid literal constant: pool needs to be closer

Hence, I don't have the exact commit:

#There are only 'skip'ped commits left to test.
The first bad commit could be any of:
9cf72c358a20b95e040e6a54a03baf6d264e0719
cafc0eab168917ec9c0cd47d530a40cd40eb2928
23d9a9280efea105852de358f21d69231992ae73
9c46929e7989efacc1dd0a1dd662a839897ea2b6
5fe41793bc78d9bb47fea37d1a16984ad6cf294b
We cannot bisect more!

git bisect log
git bisect start
# good: [f443e374ae131c168a065ea1748feac6b2e76613] Linux 5.17
git bisect good f443e374ae131c168a065ea1748feac6b2e76613
# bad: [672c0c5173427e6b3e2a9bbb7be51ceeec78093a] Linux 5.18-rc5
git bisect bad 672c0c5173427e6b3e2a9bbb7be51ceeec78093a
# bad: [25fd2d41b505d0640bdfe67aa77c549de2d3c18a] selftests: kselftest
framework: provide "finished" helper
git bisect bad 25fd2d41b505d0640bdfe67aa77c549de2d3c18a
# bad: [b4bc93bd76d4da32600795cd323c971f00a2e788] Merge tag
'arm-drivers-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect bad b4bc93bd76d4da32600795cd323c971f00a2e788
# good: [3fe2f7446f1e029b220f7f650df6d138f91651f2] Merge tag
'sched-core-2022-03-22' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect good 3fe2f7446f1e029b220f7f650df6d138f91651f2
# good: [182966e1cd74ec0e326cd376de241803ee79741b] Merge tag
'media/v5.18-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
git bisect good 182966e1cd74ec0e326cd376de241803ee79741b
# good: [49a24e9d9c740d3bd8b1200f225f67d45e3d68a5] Make the SOF
control, PCM and PM code IPC agnostic
git bisect good 49a24e9d9c740d3bd8b1200f225f67d45e3d68a5
# bad: [8ffa5709e577385a1c8d20fb434cb02732f1d991] Merge tag
'arm-defconfig-5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect bad 8ffa5709e577385a1c8d20fb434cb02732f1d991
# good: [e6aef3496a00a12e78a571f61d98300cf0a86e6a] Merge tag
'm68knommu-for-v5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu
git bisect good e6aef3496a00a12e78a571f61d98300cf0a86e6a
# bad: [9c0e6a89b592f4c4e4d769dbc22d399ab0685159] Merge tag
'for-linus' of git://git.armlinux.org.uk/~rmk/linux-arm
git bisect bad 9c0e6a89b592f4c4e4d769dbc22d399ab0685159
# skip: [cafc0eab168917ec9c0cd47d530a40cd40eb2928] ARM: v7m: enable
support for IRQ stacks
git bisect skip cafc0eab168917ec9c0cd47d530a40cd40eb2928
# skip: [54f481a2308efab49d2b14c3f8263b34fdb1c65e] ARM: remove
old-style irq entry
git bisect skip 54f481a2308efab49d2b14c3f8263b34fdb1c65e
# good: [8cdfdf7fe4fec5a952edfb8927ee7cc639c58184] ARM: export
dump_mem() to other objects
git bisect good 8cdfdf7fe4fec5a952edfb8927ee7cc639c58184
# bad: [5fe41793bc78d9bb47fea37d1a16984ad6cf294b] ARM: 9176/1: avoid
literal references in inline assembly
git bisect bad 5fe41793bc78d9bb47fea37d1a16984ad6cf294b
# good: [90890f17ccd2aa96350abd1f4d37d4667e09027f] ARM: footbridge:
use GENERIC_IRQ_MULTI_HANDLER
git bisect good 90890f17ccd2aa96350abd1f4d37d4667e09027f
# good: [4e918ab13eaf40f19938659cb5a22c93172778a8] ARM: assembler: add
optimized ldr/str macros to load variables from memory
git bisect good 4e918ab13eaf40f19938659cb5a22c93172778a8
# skip: [9c46929e7989efacc1dd0a1dd662a839897ea2b6] ARM: implement
THREAD_INFO_IN_TASK for uniprocessor systems
git bisect skip 9c46929e7989efacc1dd0a1dd662a839897ea2b6
# good: [c2755910373bb5dfb9aa68ba2924036686815c9e] ARM: smp: defer
TPIDRURO update for SMP v6 configurations too
git bisect good c2755910373bb5dfb9aa68ba2924036686815c9e
# skip: [9cf72c358a20b95e040e6a54a03baf6d264e0719] Merge tag
'arm-irq-and-vmap-stacks-for-rmk' of
git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux into
devel-stable
git bisect skip 9cf72c358a20b95e040e6a54a03baf6d264e0719
# skip: [23d9a9280efea105852de358f21d69231992ae73] ARM: 9177/1:
disable vmap'ed stacks on suspend-capable SMP configs
git bisect skip 23d9a9280efea105852de358f21d69231992ae73
# only skipped commits left to test
# possible first bad commit:
[5fe41793bc78d9bb47fea37d1a16984ad6cf294b] ARM: 9176/1: avoid literal
references in inline assembly
# possible first bad commit:
[23d9a9280efea105852de358f21d69231992ae73] ARM: 9177/1: disable
vmap'ed stacks on suspend-capable SMP configs
# possible first bad commit:
[9cf72c358a20b95e040e6a54a03baf6d264e0719] Merge tag
'arm-irq-and-vmap-stacks-for-rmk' of
git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux into
devel-stable
# possible first bad commit:
[cafc0eab168917ec9c0cd47d530a40cd40eb2928] ARM: v7m: enable support
for IRQ stacks
# possible first bad commit:
[9c46929e7989efacc1dd0a1dd662a839897ea2b6] ARM: implement
THREAD_INFO_IN_TASK for uniprocessor systems

Best regards,
Yegor

> > [   88.408578] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> > [   88.415777]  (detected by 0, t=2602 jiffies, g=2529, q=17)
> > [   88.422026] rcu: All QSes seen, last rcu_sched kthread activity
> > 2602 (-21160--23762), jiffies_till_next_fqs=1, root ->qsmask 0x0
> > [   88.434445] rcu: rcu_sched kthread starved for 2602 jiffies! g2529
> > f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
> > [   88.445274] rcu:     Unless rcu_sched kthread gets sufficient CPU
> > time, OOM is now expected behavior.
> > [   88.454859] rcu: RCU grace-period kthread stack dump:
> > [   88.460446] task:rcu_sched       state:R  running task     stack:
> >  0 pid:   11 ppid:     2 flags:0x00000000
> > [   88.471840]  __schedule from schedule+0x58/0xcc
> > [   88.477680]  schedule from schedule_timeout+0x78/0xf8
> > [   88.483754]  schedule_timeout from rcu_gp_fqs_loop+0x108/0x3cc
> > [   88.490629]  rcu_gp_fqs_loop from rcu_gp_kthread+0xa8/0x134
> > [   88.497187]  rcu_gp_kthread from kthread+0xe4/0x104
> > [   88.503061]  kthread from ret_from_fork+0x14/0x28
> > [   88.508627] Exception stack(0xd0041fb0 to 0xd0041ff8)
> > [   88.514443] 1fa0:                                     00000000
> > 00000000 00000000 00000000
> > [   88.523433] 1fc0: 00000000 00000000 00000000 00000000 00000000
> > 00000000 00000000 00000000
> > [   88.532374] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> > [   88.539639] rcu: Stack dump where RCU GP kthread last ran:
> > [   88.545694] NMI backtrace for cpu 0
> > [   88.549779] CPU: 0 PID: 58 Comm: kworker/0:8 Not tainted 5.18.0-rc5 #1
> > [   88.557103] Hardware name: Generic AM33XX (Flattened Device Tree)
> > [   88.563822] Workqueue: events dbs_work_handler
> > [   88.569398]  unwind_backtrace from show_stack+0x10/0x14
> > [   88.575662]  show_stack from dump_stack_lvl+0x58/0x70
> > [   88.581627]  dump_stack_lvl from nmi_cpu_backtrace+0xe0/0x128
> > [   88.588345]  nmi_cpu_backtrace from nmi_trigger_cpumask_backtrace+0xec/0x184
> > [   88.596339]  nmi_trigger_cpumask_backtrace from
> > trigger_single_cpu_backtrace+0x20/0x2c
> > [   88.605221]  trigger_single_cpu_backtrace from
> > rcu_check_gp_kthread_starvation+0xf4/0x148
> > [   88.614328]  rcu_check_gp_kthread_starvation from
> > rcu_sched_clock_irq+0xdf0/0xf7c
> > [   88.622778]  rcu_sched_clock_irq from update_process_times+0x88/0xc0
> > [   88.630182]  update_process_times from tick_sched_handle+0x48/0x54
> > [   88.637293]  tick_sched_handle from tick_sched_timer+0x48/0xac
> > [   88.643993]  tick_sched_timer from __hrtimer_run_queues+0x244/0x4d8
> > [   88.651212]  __hrtimer_run_queues from hrtimer_interrupt+0x128/0x2c8
> > [   88.658582]  hrtimer_interrupt from dmtimer_clockevent_interrupt+0x24/0x2c
> > [   88.666506]  dmtimer_clockevent_interrupt from
> > __handle_irq_event_percpu+0x98/0x334
> > [   88.675241]  __handle_irq_event_percpu from handle_irq_event+0x38/0xc0
> > [   88.682749]  handle_irq_event from handle_level_irq+0xb4/0x1a8
> > [   88.689639]  handle_level_irq from handle_irq_desc+0x1c/0x2c
> > [   88.696253]  handle_irq_desc from generic_handle_arch_irq+0x2c/0x64
> > [   88.703524]  generic_handle_arch_irq from __irq_svc+0x90/0xbc
> > [   88.710195] Exception stack(0xd0001f58 to 0xd0001fa0)
> > [   88.715947] 1f40:
> >     c01015c8 00000000
> > [   88.724939] 1f60: 0eae9000 00000000 fffffffe 60000013 ffffffff
> > d0385d74 00000000 c2702a80
> > [   88.733926] 1f80: 00000002 c2702a80 00000000 d0001fa8 c01015c8
> > c01015d0 60000113 ffffffff
> > [   88.742765]  __irq_svc from __do_softirq+0xa0/0x604
> > [   88.748533]  __do_softirq from __irq_exit_rcu+0x138/0x178
> > [   88.754961]  __irq_exit_rcu from irq_exit+0x8/0x28
> > [   88.760758]  irq_exit from call_with_stack+0x18/0x20
> > [   88.766687]  call_with_stack from __irq_svc+0x9c/0xbc
> > [   88.772576] Exception stack(0xd0385d40 to 0xd0385d88)
> > [   88.778458] 5d40: 00000005 00000488 00000000 00000000 c208c0c0
> > 00006402 c208b800 c1874ff0
> > [   88.787451] 5d60: 00000000 c208c0c0 c1109210 c208c0d8 00000000
> > d0385d90 c06e068c c06e08a4
> > [   88.796305] 5d80: 60000013 ffffffff
> > [   88.800369]  __irq_svc from omap3_noncore_dpll_program+0x3f8/0x5ec
> > [   88.807588]  omap3_noncore_dpll_program from clk_change_rate+0x23c/0x4f8
> > [   88.815375]  clk_change_rate from clk_core_set_rate_nolock+0x1b0/0x29c
> > [   88.822936]  clk_core_set_rate_nolock from clk_set_rate+0x30/0x64
> > [   88.830056]  clk_set_rate from _set_opp+0x254/0x51c
> > [   88.835835]  _set_opp from dev_pm_opp_set_rate+0xec/0x228
> > [   88.842073]  dev_pm_opp_set_rate from __cpufreq_driver_target+0x584/0x700
> > [   88.849792]  __cpufreq_driver_target from od_dbs_update+0xb4/0x168
> > [   88.856953]  od_dbs_update from dbs_work_handler+0x2c/0x60
> > [   88.863441]  dbs_work_handler from process_one_work+0x284/0x72c
> > [   88.870411]  process_one_work from worker_thread+0x28/0x4b0
> > [   88.876973]  worker_thread from kthread+0xe4/0x104
> > [   88.882692]  kthread from ret_from_fork+0x14/0x28
> > [   88.888225] Exception stack(0xd0385fb0 to 0xd0385ff8)
> > [   88.893998] 5fa0:                                     00000000
> > 00000000 00000000 00000000
> > [   88.902971] 5fc0: 00000000 00000000 00000000 00000000 00000000
> > 00000000 00000000 00000000
> > [   88.911888] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> >
> > Regards,
> > Yegor
