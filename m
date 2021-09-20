Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9151E412352
	for <lists+linux-omap@lfdr.de>; Mon, 20 Sep 2021 20:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378158AbhITSXN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Sep 2021 14:23:13 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:26653 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348092AbhITSVI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Sep 2021 14:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632161966;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=cCao+OZWDluWv+h25AE2+VoAlJaTSH+Zc/Bz++1mJh4=;
    b=iKdW239/wE6YfMNFH1TeIVp6YymLDZUj0ic3yqsp9uqhSEQRzZyQL7IHEjL5YYd1SY
    HIUORC200DmvLKzgDKY5mFDvQ99y2tzexAJ4edySakZI8KGHhzRd2RtT/ML58moWUoLs
    uj6tfWjnWkWcHLcH/Cwu5D5dWuB6j+pnXiqV6hl0xfRxzWd64/8bBFxp7M5ne5tOsJVX
    INNbNB6UfcICFLRAlFZX0g35bUI2U1DF8KJBmm9jov6OnRm4vjr7mQtEeWDnx5jhTryA
    f1tYmbu3meKwghJmK99cf9c5Dmcyiv+I5CwkhBCrXbHj3Ewwvy1AGxeWFwWKnAN7f2/t
    9HCQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3iMUbSw=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id I01f74x8KIJP2sR
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Mon, 20 Sep 2021 20:19:25 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: Regression with e428e250fde6 on BeagleBoard Rev C2
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
Date:   Mon, 20 Sep 2021 20:19:25 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andreas Kemnade <andreas@kemnade.info>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3C216B2C-5D6B-489C-A9D8-D14880EC91B7@goldelico.com>
References: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 19.09.2021 um 19:41 schrieb Jarkko Nikula =
<jarkko.nikula@bitmer.com>:
>=20
> I found another timer related regression on BeagleBoard Rev C2 which =
was

I remembered that I have a BB C2 collecting dust...

> present before 6cfcd5563b4f ("clocksource/drivers/timer-ti-dm: Fix
> suspend and resume for am3 and am4") and which remains after fix
> 3ff340e24c9d ("bus: ti-sysc: Fix gpt12 system timer issue with =
reserved
> status") including today's head d4d016caa4b8 ("alpha: move =
__udiv_qrnnd
> library function to arch/alpha/lib/").
>=20
> Issue occurs when omap3_isp is not loaded and symptoms are the same =
than
> my previous finding [1]. I.e. timer interrupts appear missing and need
> to hit keys on serial console in order to let boot (when omap3_isp not
> built) or "sleep 1" in shell to continue.

After removing dust, I can confirm both effects after doing
echo blacklist omap3_isp >/etc/modprobe.d/isp.conf
and rebooting.

Another effect I have seen is that heartbeat (I think it is a local =
patch
I have in our devicetree) stops and toggles almost each time I press the =
enter
key on the serial console.

And, I once got attached log.

Hope this helps.

BR and thanks,
Nikolaus


root@letux:~# uname -a
Linux letux 5.15.0-rc2-letux+ #6867 SMP PREEMPT Mon Sep 20 19:47:48 CEST =
2021 armv7l GNU/Linux
root@letux:~#=20

root@letux:~# [  444.397186] rcu: INFO: rcu_preempt self-detected stall =
on CPU
[  444.403594] rcu:     0-...!: (1 ticks this GP) idle=3D869/1/0x40000002 =
softirq=3D7514/7514 fqs=3D0=20
[  444.412689]  (t=3D5297 jiffies g=3D17433 q=3D5)
[  444.417144] rcu: rcu_preempt kthread timer wakeup didn't happen for =
5296 jiffies! g17433 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402
[  444.429595] rcu:     Possible timer handling issue on cpu=3D0 =
timer-softirq=3D4616
[  444.437225] rcu: rcu_preempt kthread starved for 5297 jiffies! g17433 =
f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D0
[  444.448638] rcu:     Unless rcu_preempt kthread gets sufficient CPU =
time, OOM is now expected behavior.
[  444.458618] rcu: RCU grace-period kthread stack dump:
[  444.464172] task:rcu_preempt     state:I stack:    0 pid:   11 ppid:  =
   2 flags:0x00000000
[  444.473449] [<c089cd68>] (__schedule) from [<c089cfcc>] =
(schedule+0xdc/0x12c)
[  444.481353] [<c089cfcc>] (schedule) from [<c08a006c>] =
(schedule_timeout+0xc0/0xec)
[  444.489685] [<c08a006c>] (schedule_timeout) from [<c018e794>] =
(rcu_gp_fqs_loop+0x108/0x2d4)
[  444.498901] [<c018e794>] (rcu_gp_fqs_loop) from [<c018f940>] =
(rcu_gp_kthread+0xf0/0x128)
[  444.507812] [<c018f940>] (rcu_gp_kthread) from [<c0150878>] =
(kthread+0x14c/0x154)
[  444.516082] [<c0150878>] (kthread) from [<c0100150>] =
(ret_from_fork+0x14/0x24)
[  444.524047] Exception stack(0xc10dbfb0 to 0xc10dbff8)
[  444.529632] bfa0:                                     ???????? =
???????? ???????? ????????
[  444.538574] bfc0: ???????? ???????? ???????? ???????? ???????? =
???????? ???????? ????????
[  444.547515] bfe0: ???????? ???????? ???????? ???????? ???????? =
????????
[  444.554779] rcu: Stack dump where RCU GP kthread last ran:
[  444.560821] NMI backtrace for cpu 0
[  444.564697] CPU: 0 PID: 0 Comm: swapper/0 Not tainted =
5.15.0-rc2-letux+ #6867
[  444.572540] Hardware name: Generic OMAP3-GP (Flattened Device Tree)
[  444.579406] [<c010f1a0>] (unwind_backtrace) from [<c010a47c>] =
(show_stack+0x10/0x14)
[  444.587951] [<c010a47c>] (show_stack) from [<c0896148>] =
(dump_stack_lvl+0x40/0x4c)
[  444.596313] [<c0896148>] (dump_stack_lvl) from [<c04cc82c>] =
(nmi_cpu_backtrace+0xd4/0xe8)
[  444.605316] [<c04cc82c>] (nmi_cpu_backtrace) from [<c04cc8f0>] =
(nmi_trigger_cpumask_backtrace+0xb0/0x184)
[  444.615814] [<c04cc8f0>] (nmi_trigger_cpumask_backtrace) from =
[<c0893c54>] (rcu_check_gp_kthread_starvation+0x118/0x150)
[  444.627716] [<c0893c54>] (rcu_check_gp_kthread_starvation) from =
[<c01926e8>] (rcu_sched_clock_irq+0x360/0xae0)
[  444.638702] [<c01926e8>] (rcu_sched_clock_irq) from [<c019b8f4>] =
(update_process_times+0x90/0xc4)
[  444.648468] [<c019b8f4>] (update_process_times) from [<c01ac714>] =
(tick_sched_handle+0x54/0x60)
[  444.658020] [<c01ac714>] (tick_sched_handle) from [<c01acb84>] =
(tick_sched_timer+0x44/0x9c)
[  444.667205] [<c01acb84>] (tick_sched_timer) from [<c019c520>] =
(__hrtimer_run_queues+0x17c/0x280)
[  444.676849] [<c019c520>] (__hrtimer_run_queues) from [<c019d25c>] =
(hrtimer_interrupt+0xb0/0x208)
[  444.686492] [<c019d25c>] (hrtimer_interrupt) from [<c0727df8>] =
(dmtimer_clockevent_interrupt+0x24/0x2c)
[  444.696807] [<c0727df8>] (dmtimer_clockevent_interrupt) from =
[<c017ebd4>] (__handle_irq_event_percpu+0xb8/0x200)
[  444.707977] [<c017ebd4>] (__handle_irq_event_percpu) from =
[<c017ed40>] (handle_irq_event_percpu+0x24/0x70)
[  444.718566] [<c017ed40>] (handle_irq_event_percpu) from [<c017edc4>] =
(handle_irq_event+0x38/0x5c)
[  444.728302] [<c017edc4>] (handle_irq_event) from [<c0183598>] =
(handle_level_irq+0x7c/0xb4)
[  444.737396] [<c0183598>] (handle_level_irq) from [<c017def0>] =
(handle_irq_desc+0x24/0x34)
[  444.746398] [<c017def0>] (handle_irq_desc) from [<c017e574>] =
(handle_domain_irq+0x3c/0x54)
[  444.755493] [<c017e574>] (handle_domain_irq) from [<c0100b3c>] =
(__irq_svc+0x5c/0x90)
[  444.764007] Exception stack(0xc0d01ed0 to 0xc0d01f18)
[  444.769561] 1ec0:                                     ???????? =
???????? ???????? ????????
[  444.778503] 1ee0: ???????? ???????? ???????? ???????? ???????? =
???????? ???????? ????????
[  444.787445] 1f00: ???????? ???????? ???????? ???????? ???????? =
????????
[  444.794708] [<c0100b3c>] (__irq_svc) from [<c06f64cc>] =
(cpuidle_enter_state+0x1c4/0x2f8)
[  444.803619] [<c06f64cc>] (cpuidle_enter_state) from [<c06f6664>] =
(cpuidle_enter+0x50/0x54)
[  444.812713] [<c06f6664>] (cpuidle_enter) from [<c01603e4>] =
(do_idle+0x274/0x2a0)
[  444.820861] [<c01603e4>] (do_idle) from [<c0160714>] =
(cpu_startup_entry+0x18/0x1c)
[  444.829193] [<c0160714>] (cpu_startup_entry) from [<c0c0128c>] =
(start_kernel+0x770/0x958)
[  444.838409] NMI backtrace for cpu 0
[  444.842285] CPU: 0 PID: 0 Comm: swapper/0 Not tainted =
5.15.0-rc2-letux+ #6867
[  444.850128] Hardware name: Generic OMAP3-GP (Flattened Device Tree)
[  444.857025] [<c010f1a0>] (unwind_backtrace) from [<c010a47c>] =
(show_stack+0x10/0x14)
[  444.865570] [<c010a47c>] (show_stack) from [<c0896148>] =
(dump_stack_lvl+0x40/0x4c)
[  444.873901] [<c0896148>] (dump_stack_lvl) from [<c04cc82c>] =
(nmi_cpu_backtrace+0xd4/0xe8)
[  444.882904] [<c04cc82c>] (nmi_cpu_backtrace) from [<c04cc8f0>] =
(nmi_trigger_cpumask_backtrace+0xb0/0x184)
[  444.893402] [<c04cc8f0>] (nmi_trigger_cpumask_backtrace) from =
[<c0893dac>] (rcu_dump_cpu_stacks+0x120/0x144)
[  444.904174] [<c0893dac>] (rcu_dump_cpu_stacks) from [<c01926ec>] =
(rcu_sched_clock_irq+0x364/0xae0)
[  444.914001] [<c01926ec>] (rcu_sched_clock_irq) from [<c019b8f4>] =
(update_process_times+0x90/0xc4)
[  444.923736] [<c019b8f4>] (update_process_times) from [<c01ac714>] =
(tick_sched_handle+0x54/0x60)
[  444.933288] [<c01ac714>] (tick_sched_handle) from [<c01acb84>] =
(tick_sched_timer+0x44/0x9c)
[  444.942443] [<c01acb84>] (tick_sched_timer) from [<c019c520>] =
(__hrtimer_run_queues+0x17c/0x280)
[  444.952087] [<c019c520>] (__hrtimer_run_queues) from [<c019d25c>] =
(hrtimer_interrupt+0xb0/0x208)
[  444.961730] [<c019d25c>] (hrtimer_interrupt) from [<c0727df8>] =
(dmtimer_clockevent_interrupt+0x24/0x2c)
[  444.972045] [<c0727df8>] (dmtimer_clockevent_interrupt) from =
[<c017ebd4>] (__handle_irq_event_percpu+0xb8/0x200)
[  444.983215] [<c017ebd4>] (__handle_irq_event_percpu) from =
[<c017ed40>] (handle_irq_event_percpu+0x24/0x70)
[  444.993804] [<c017ed40>] (handle_irq_event_percpu) from [<c017edc4>] =
(handle_irq_event+0x38/0x5c)
[  445.003540] [<c017edc4>] (handle_irq_event) from [<c0183598>] =
(handle_level_irq+0x7c/0xb4)
[  445.012634] [<c0183598>] (handle_level_irq) from [<c017def0>] =
(handle_irq_desc+0x24/0x34)
[  445.021636] [<c017def0>] (handle_irq_desc) from [<c017e574>] =
(handle_domain_irq+0x3c/0x54)
[  445.030700] [<c017e574>] (handle_domain_irq) from [<c0100b3c>] =
(__irq_svc+0x5c/0x90)
[  445.039215] Exception stack(0xc0d01ed0 to 0xc0d01f18)
[  445.044799] 1ec0:                                     ???????? =
???????? ???????? ????????
[  445.053741] 1ee0: ???????? ???????? ???????? ???????? ???????? =
???????? ???????? ????????
[  445.062683] 1f00: ???????? ???????? ???????? ???????? ???????? =
????????
[  445.069946] [<c0100b3c>] (__irq_svc) from [<c06f64cc>] =
(cpuidle_enter_state+0x1c4/0x2f8)
[  445.078857] [<c06f64cc>] (cpuidle_enter_state) from [<c06f6664>] =
(cpuidle_enter+0x50/0x54)
[  445.087951] [<c06f6664>] (cpuidle_enter) from [<c01603e4>] =
(do_idle+0x274/0x2a0)
[  445.096099] [<c01603e4>] (do_idle) from [<c0160714>] =
(cpu_startup_entry+0x18/0x1c)
[  445.104431] [<c0160714>] (cpu_startup_entry) from [<c0c0128c>] =
(start_kernel+0x770/0x958)

root@letux:~#=20


