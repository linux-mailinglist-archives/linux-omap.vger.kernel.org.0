Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31BDD47138D
	for <lists+linux-omap@lfdr.de>; Sat, 11 Dec 2021 12:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhLKLEy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 11 Dec 2021 06:04:54 -0500
Received: from mail.wizzup.org ([95.217.97.174]:43712 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229457AbhLKLEy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 11 Dec 2021 06:04:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=E98P1snwibAB6j1XkhyW1iw7PMNDbTK0Fzcf3q8/p2U=; b=DMWo2zrSd/8v8ZOk5Hm0ef47V6
        JUWzQr6wKiMFOhMpc1/4jh8bEku/eT9fyBaOWzVTZX+kMgiUWTDqdEe0D6Q7/V50tl1tUczb/UCUE
        RF5ghqMAMXmxxOsydgyQSudJLonZ5jx6R/kLysEQSkoAr+29+W9DKa4rS14yuVQRCdIbmWLSM7Pm6
        7MT+HnJYW/xsCjB6v3+vGtL11sdFgwU34ht/h4M2C1L/Ruv9Y9u9jnygigB0fP7DBVla7JR9T3cyq
        geU4akyeEySJslMAWuYe77sp9XhhfSdPaTNTwFpNCQxWuj5LBf33001gR6ne3ZKclqvIuH4tH29Vv
        rqUpEMBQ==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mw0BJ-00010l-3h; Sat, 11 Dec 2021 11:04:45 +0000
Subject: Re: Oops while booting 5.15.2 on Nokia N900
To:     Tony Lindgren <tony@atomide.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Merlijn B.W. Wajer" <merlijn@archive.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Pavel Machek <pavel@ucw.cz>,
        linux-omap <linux-omap@vger.kernel.org>,
        Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
References: <12e13327-3bb5-229e-d784-cd528db4b58e@archive.org>
 <6fa3d07a-28e5-7853-e6ca-fc405d3080e4@archive.org>
 <c75ac850-7d9b-6263-a046-57c8f4435090@archive.org>
 <f463d8f2-109e-3040-4350-ce20d651ffe6@archive.org>
 <20211208205700.GA12125@duo.ucw.cz> <20211208220400.1f9cff00@aktux>
 <ee94556b-2c35-c641-a86a-e9e70600aab7@archive.org>
 <20211210111345.GD799423@darkstar.musicnaut.iki.fi>
 <7438fa4a-ea92-a3ce-4cc7-8da8a4af02b5@wizzup.org>
 <YbRL75F/SlcPJjtf@atomide.com>
From:   Merlijn Wajer <merlijn@wizzup.org>
Message-ID: <370c8e25-d582-decb-5dd9-625d6548dcd3@wizzup.org>
Date:   Sat, 11 Dec 2021 12:10:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YbRL75F/SlcPJjtf@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 11/12/2021 07:57, Tony Lindgren wrote:

>>
>> 3. run:
>>
>>> sleep 30 ; blkid
>>
>> So we have a pretty reproducible test case here I think.
> 
> Just to see if this relates to the omap_hsmmc.c driver, maybe try this with
> v5.16-rc1 also with a patch that changes omap3.dtsi ti,omap3-hsmmc compatibles
> with ti,omap3-sdhci compatibles.

I tried this just now on v5.16-rc4 with the following change [1] (and a
few reverts for off mode) and I don't think it helped get rid of the
error, I see the following. [2] Maybe it does help narrow the specific
error down if it happens with both hsmmc and sdhci?

Regards,
Merlijn

[1]


> diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
> index 64b7e6fddd1b..5e24da980719 100644
> --- a/arch/arm/boot/dts/omap3.dtsi
> +++ b/arch/arm/boot/dts/omap3.dtsi
> @@ -510,7 +510,7 @@ hdqw1w: 1w@480b2000 {
>                 };
> 
>                 mmc1: mmc@4809c000 {
> -                       compatible = "ti,omap3-hsmmc";
> +                       compatible = "ti,omap3-sdhci";
>                         reg = <0x4809c000 0x200>;
>                         interrupts = <83>;
>                         ti,hwmods = "mmc1";
> @@ -521,7 +521,7 @@ mmc1: mmc@4809c000 {
>                 };
> 
>                 mmc2: mmc@480b4000 {
> -                       compatible = "ti,omap3-hsmmc";
> +                       compatible = "ti,omap3-sdhci";
>                         reg = <0x480b4000 0x200>;
>                         interrupts = <86>;
>                         ti,hwmods = "mmc2";
> @@ -530,7 +530,7 @@ mmc2: mmc@480b4000 {
>                 };
> 
>                 mmc3: mmc@480ad000 {
> -                       compatible = "ti,omap3-hsmmc";
> +                       compatible = "ti,omap3-sdhci";
>                         reg = <0x480ad000 0x200>;
>                         interrupts = <94>;
>                         ti,hwmods = "mmc3";

[2]

> [   72.589294] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.16.0-rc4-00003-g67523c186596-dirty #4
> [   72.597869] Hardware name: Nokia RX-51 board
>   INSTALL /home/merlijn/maemo-leste/droid4-linux/modout/lib/modules/5.16.0-rc4-00003-g67523c186596-dirty/kernel/sound/soc/codecs/snd-soc-cpcap.ko
> [   72.602172] PC is at omap3_l3_app_irq (drivers/bus/omap_l3_smx.c:177 (discriminator 1))
> [   72.606842] LR is at __handle_irq_event_percpu (./include/linux/atomic/atomic-instrumented.h:28)
> [   72.612304] pc : lr : psr: 20010193
> [   72.618621] sp : c0f01e38  ip : c0f05638  fp : c1833200
> [   72.623901] r10: c0ff9e20  r9 : c0ff9e40  r8 : 0000001a
> [   72.629150] r7 : 00000000  r6 : 00400000  r5 : 00000000  r4 : f8000000
> [   72.635711] r3 : 00400000  r2 : 00000008  r1 : 00400000  r0 : 00000000
> [   72.642303] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [   72.649566] Control: 10c5387d  Table: 81b5c019  DAC: 00000051
> [   72.655334] Register r0 information: NULL pointer
> [   72.660095] Register r1 information: non-paged memory
> [   72.665191] Register r2 information: non-paged memory
> [   72.670288] Register r3 information: non-paged memory
> [   72.675384] Register r4 information: 0-page vmalloc region starting at 0xf8000000 allocated at iotable_init (arch/arm/mm/mmu.c:982)
> [   72.686004] Register r5 information: NULL pointer
> [   72.690765] Register r6 information: non-paged memory
> [   72.695861] Register r7 information: NULL pointer
> [   72.700592] Register r8 information: non-paged memory
> [   72.705688] Register r9 information: non-slab/vmalloc memory
> [   72.711395] Register r10 information: non-slab/vmalloc memory
> [   72.717193] Register r11 information: slab kmalloc-256 start c1833200 pointer offset 0 size 256
> [   72.726013] Register r12 information: non-slab/vmalloc memory
> [   72.731781] Process swapper/0 (pid: 0, stack limit = 0x(ptrval))
> [   72.737854] Stack: (0xc0f01e38 to 0xc0f02000)
> [   72.742248] 1e20:                                                       c065bcf4 c1fbd980
> [   72.750488] 1e40: 0000000d c1a42040 0000000a 00000000 c0f01e98 0000001a c0ff9e40 c01a2274
> [   72.758728] 1e60: c388d000 00000010 00006000 c0f00000 ff38801d c1833200 0000000a c183326c
> [   72.766967] 1e80: c0f05638 00000000 c0f00000 00000000 00000010 c01a24dc 00000000 1f933612
> [   72.775177] 1ea0: c1833200 0000000a c0f01ee0 c01a6d84 c1805a00 c01a1b3c c0e75430 ffffe000
> [   72.783416] 1ec0: c0f01ee0 c0a37afc c07eb424 20010013 ffffffff c0f01f14 cfb6b8f8 c0100b34
> [   72.791656] 1ee0: 00000000 c0f0ba68 0ecf6000 cfb6c740 00000004 c0f0b8e8 00000004 e5c57d3e
> [   72.799896] 1f00: cfb6b8f8 00000010 00000000 00000010 00055522 c0f01f30 c07eb35c c07eb424
> [   72.808135] 1f20: 20010013 ffffffff 00000051 c07eb318 c1838900 e5c8487f e4e9bc00 cfb6b8f8
> [   72.816375] 1f40: c0f0b8e8 00000004 c0f05264 c0e758f0 c0f05638 cfb6b8f8 c0f0b8e8 c07eb644
> [   72.824615] 1f60: c0f00000 00000000 c0f05210 c0173fa8 00000004 c0f00000 01e4ba60 1f933612
> [   72.832855] 1f80: ffffffff 000000e4 c0e4ba60 cfdffb40 ffffffff c0f051c0 00000000 10c5387d
> [   72.841094] 1fa0: 00000000 c0174384 c1002068 c0e00ef8 ffffffff ffffffff 00000000 c0e00588
> [   72.849334] 1fc0: 00000000 c0e4ba60 1f962612 00000000 00000000 c0e00330 00000051 10c0387d
> [   72.857574] 1fe0: 000007a3 8248c360 411fc083 10c5387d 00000000 00000000 00000000 00000000
> [   72.865814] (omap3_l3_app_irq) from __handle_irq_event_percpu (./include/linux/atomic/atomic-instrumented.h:28)
> [   72.875030] (__handle_irq_event_percpu) from handle_irq_event (kernel/irq/handle.c:200)
> [   72.884155] (handle_irq_event) from handle_level_irq (./include/linux/irq.h:346)
> [   72.892578] (handle_level_irq) from generic_handle_domain_irq (kernel/irq/irqdesc.c:647)
> [   72.901702] (generic_handle_domain_irq) from generic_handle_arch_irq (./arch/arm/include/asm/thread_info.h:104)
> [   72.911468] (generic_handle_arch_irq) from __irq_svc (arch/arm/kernel/entry-armv.S:213)
> [   72.919799] Exception stack(0xc0f01ee0 to 0xc0f01f28)
> [   72.924896] 1ee0: 00000000 c0f0ba68 0ecf6000 cfb6c740 00000004 c0f0b8e8 00000004 e5c57d3e
> [   72.933135] 1f00: cfb6b8f8 00000010 00000000 00000010 00055522 c0f01f30 c07eb35c c07eb424
> [   72.941375] 1f20: 20010013 ffffffff
> [   72.944885] (__irq_svc) from cpuidle_enter_state (drivers/cpuidle/cpuidle.c:259)
> [   72.953063] (cpuidle_enter_state) from cpuidle_enter (drivers/cpuidle/cpuidle.c:351)
> [   72.961395] (cpuidle_enter) from do_idle (kernel/sched/idle.c:158)
> [   72.968872] (do_idle) from cpu_startup_entry (kernel/sched/idle.c:402 (discriminator 1))
> [   72.976501] (cpu_startup_entry) from start_kernel (init/main.c:1137)
> [ 72.984802] Code: e0000007 e3c1103c e1913000 0affffe1 (e7f001f2)
> All code
> ========
>    0:	07                   	(bad)
>    1:	00 00                	add    %al,(%rax)
>    3:	e0 3c                	loopne 0x41
>    5:	10 c1                	adc    %al,%cl
>    7:	e3 00                	jrcxz  0x9
>    9:	30 91 e1 e1 ff ff    	xor    %dl,-0x1e1f(%rcx)
>    f:	0a f2                	or     %dl,%dh
>   11:*	01 f0                	add    %esi,%eax	        <-- trapping instruction
>   13:	e7                   	.byte 0xe7
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	f2 01 f0             	repnz add %esi,%eax
>    3:	e7                   	.byte 0xe7
> [   72.990936] ---[ end trace 231dd61ec2cdee97 ]---
> [   72.995605] Kernel panic - not syncing: Fatal exception in interrupt
> [   73.002014] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

