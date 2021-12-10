Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4751470ED7
	for <lists+linux-omap@lfdr.de>; Sat, 11 Dec 2021 00:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243838AbhLJXlx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Dec 2021 18:41:53 -0500
Received: from mail.wizzup.org ([95.217.97.174]:43572 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243792AbhLJXlw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 10 Dec 2021 18:41:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:Subject:From:References:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=ESJE8E6Nxf6TL3boP6zaj4itsJqifr5CNdaOX4G7li4=; b=M6IugmejrDp2VP9K8QdXCEioev
        yufnfMGuW3spt2w7NSM6pnWWrWVFHZ5SjYL3wBpuNBIfShuQ2+CDKJWD4ERiKPzwftR65Mr+g93Mn
        mW4O/0g3KsXmlK8aHGZ3jwRzRIbYZH6GksOGKfH/Cyagb5GJPMLKKIy8lEhk7322w6sRCO3YgWDRZ
        wxtoxQWTMIRcRtZX754BThXMg0xTi3WyklrjZ3wD9SSL/TwK0oXFXkAHJPc6Do+EGl3RTn7lK86ic
        zG783pZVHtesYFjtL/mmW7o/GUuuX1+7wXIZQgM+lvH2wppZxKJ8yV26+3MEVDkP/QcsZpmXgGPSw
        3dair//Q==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mvpSr-0000qI-FK; Fri, 10 Dec 2021 23:38:09 +0000
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Merlijn B.W. Wajer" <merlijn@archive.org>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Pavel Machek <pavel@ucw.cz>,
        linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, Dev Null <devnull@uvos.xyz>,
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
From:   Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: Oops while booting 5.15.2 on Nokia N900
Message-ID: <3667ed22-ae49-2ca6-5c15-2dcd6cd73822@wizzup.org>
Date:   Sat, 11 Dec 2021 00:43:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211210111345.GD799423@darkstar.musicnaut.iki.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 10/12/2021 12:13, Aaro Koskinen wrote:
> Hi,
> 
> On Wed, Dec 08, 2021 at 11:34:53PM +0100, Merlijn B.W. Wajer wrote:
>> What I have seen is that if off mode is enabled from userspace
>> (debugfs), it does not cause a problem (or I don't hit the problem at
>> least). That said, my off mode tests are pretty minimal with
>> init=/bin/sh, and I haven't gotten a fully booted (with lots of modules
>> loaded, gui and daemons) system to enter off mode yet.
> 
> I also started seeing crashes with fb2c599f0566 on N900. It's been several
> months since I last tested, but I remember I was able to trigger the
> crashes reliably with MMC access from the minimal shell enviroment.
> I see the MMC is also visible in your crash logs. My test case was
> something like "sleep 30 ; blkid ; sleep 30".

I can confirm now that enable off mode through userspace later on (when
the system actually can idle) can indeed still cause trouble. That means
that likely fb2c599f0566 is not at fault (since I have it reverted
currently), and we have other problems related to idle.

This is the output of scripts/decode_stacktrace.sh:

> # [  194.349151] Internal error: Oops - undefined instruction: 0 [#1] PREEMPT SMP ARM
> [  194.356750] Modules linked in: cbc aes_arm_bs crypto_simd cryptd aes_arm aes_generic ccm bluetooth ecdh_generic ecc libaes zram zsmalloc evdev wl1251_spi wl1251 mac80
> 211 libarc4 omap3_rom_rng isp1704_charger rng_core ir_rx51 rc_core snd_soc_rx51 udc_core leds_gpio sha256_generic libsha256 sha256_arm pvrsrvkm_omap3_sgx530_121 gpio_key
> s pwm_omap_dmtimer display_connector cpufreq_dt snd_soc_omap_mcbsp snd_soc_ti_sdma cfg80211 snd_soc_tpa6130a2 snd_soc_core omap_sham snd_pcm_dmaengine crypto_engine snd_
> pcm snd_timer snd bq2415x_charger panel_sony_acx565akm leds_lp5523 soundcore bq27xxx_battery_i2c leds_lp55xx_common bq27xxx_battery led_class omap_mailbox rtc_twl ohci_p
> latform ohci_hcd ehci_hcd twl4030_pwrbutton pwm_twl_led st_accel_i2c twl4030_keypad st_sensors_i2c pwm_twl st_accel matrix_keymap usbcore twl4030_madc twl4030_charger st
> _sensors industrialio_triggered_buffer kfifo_buf omapdrm industrialio usb_common omap_ssi hsi drm_kms_helper cfbfillrect syscopyarea cfbimgblt sysfillrect
> [  194.358612]  sysimgblt fb_sys_fops cfbcopyarea drm drm_panel_orientation_quirks cec
> [  194.453826] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.15.2-00597-g68be8fac7cbd #48
> [  194.461669] Hardware name: Nokia RX-51 board
> [  194.466003] PC is at omap3_l3_app_irq (drivers/bus/omap_l3_smx.c:177 (discriminator 1)) 
> [  194.470733] LR is at __handle_irq_event_percpu (./include/linux/atomic/atomic-instrumented.h:28) 
> [  194.476226] pc : lr : psr: 20070193 
> [  194.482574] sp : c0f01e10  ip : ffffe000  fp : c0f00000
> [  194.487854] r10: c0ff8160  r9 : c0ff8180  r8 : 0000001a
> [  194.493164] r7 : 00000000  r6 : 00400000  r5 : 00000000  r4 : f8000000
> [  194.499755] r3 : 00400000  r2 : 00010001  r1 : 00400000  r0 : 00000000
> [  194.506347] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [  194.513671] Control: 10c5387d  Table: 86150019  DAC: 00000051
> [  194.519470] Register r0 information: NULL pointer
> [  194.524261] Register r1 information: non-paged memory
> [  194.529418] Register r2 information: non-paged memory
> [  194.534545] Register r3 information: non-paged memory
> [  194.539672] Register r4 information: 0-page vmalloc region starting at 0xf8000000 allocated at iotable_init (arch/arm/mm/mmu.c:982) 
> [  194.550354] Register r5 information: NULL pointer
> [  194.555145] Register r6 information: non-paged memory
> [  194.560272] Register r7 information: NULL pointer
> [  194.565063] Register r8 information: non-paged memory
> [  194.570190] Register r9 information: non-slab/vmalloc memory
> [  194.575958] Register r10 information: non-slab/vmalloc memory
> [  194.581787] Register r11 information: non-slab/vmalloc memory
> [  194.587615] Register r12 information: non-paged memory
> [  194.592834] Process swapper/0 (pid: 0, stack limit = 0x4aa785a2)
> [  194.598937] Stack: (0xc0f01e10 to 0xc0f02000)
> [  194.603363] 1e00:                                     c0644a40 c1f9fa00 c0f00000 c1a45500
> [  194.611633] 1e20: c0f00000 00000000 c0f01e70 0000001a c0ff8180 c01a203c c0f00000 c0697fd4
> [  194.619903] 1e40: c183db40 c1832200 c0f00000 c1832200 c0f00000 c0f00000 c183226c 00000000
> [  194.628173] 1e60: c1805a00 0000000a c0f01ed8 c01a22ec 00000000 3d6d10de c0f01ed8 c1832200
> [  194.636474] 1e80: c183226c c0f00000 c0f05638 c01a6b00 c0e6d570 c0e6d570 c0f00000 c0f05638
> [  194.644744] 1ea0: 00000000 c01a18b0 00000000 c0f00000 c1f75440 c07d3478 20070013 ffffffff
> [  194.653015] 1ec0: c0f01f0c cfb63a38 c0f00000 00000000 0000002d c0100b3c 00000000 c0f0ba30
> [  194.661285] 1ee0: 00000001 0ecf6000 00000004 c0f0b8b0 00000004 401a616e cfb63a38 0000002d
> [  194.669555] 1f00: 00000000 0000002d ffffe000 c0f01f28 c07d33b0 c07d3478 20070013 ffffffff
> [  194.677825] 1f20: 00000051 c07d3388 3ef87a80 4016308c 03f44f77 cfb63a38 c0f0b8b0 00000004
> [  194.686096] 1f40: c0f05260 cfb63a38 c0f0b8b0 c0f00000 c0e6da30 c07d3710 c0f00000 00000000
> [  194.694366] 1f60: c0f0520c c01740ec 00000004 c0f00000 01f00000 3d6d10de cfdff0c0 000000e4
> [  194.702636] 1f80: c0f00000 c0e43a60 cfdff0c0 c0f051c0 00000000 c0f0872c c0cc1404 c01744e4
> [  194.710906] 1fa0: c1000068 c0e00ef8 ffffffff ffffffff 00000000 c0e00588 00000000 c0f00000
> [  194.719177] 1fc0: 00000000 c0e43a60 3d681fdc 00000000 00000000 c0e00330 00000051 10c0387d
> [  194.727447] 1fe0: 000007a3 8248ab30 411fc083 10c5387d 00000000 00000000 00000000 00000000
> [  194.735717] (omap3_l3_app_irq) from __handle_irq_event_percpu (./include/linux/atomic/atomic-instrumented.h:28) 
> [  194.745025] (__handle_irq_event_percpu) from handle_irq_event (kernel/irq/handle.c:198) 
> [  194.754211] (handle_irq_event) from handle_level_irq (./include/linux/irq.h:346) 
> [  194.762695] (handle_level_irq) from handle_domain_irq (kernel/irq/irqdesc.c:694) 
> [  194.771179] (handle_domain_irq) from __irq_svc (arch/arm/kernel/entry-armv.S:208) 
> [  194.779022] Exception stack(0xc0f01ed8 to 0xc0f01f20)
> [  194.784149] 1ec0:                                                       00000000 c0f0ba30
> [  194.792419] 1ee0: 00000001 0ecf6000 00000004 c0f0b8b0 00000004 401a616e cfb63a38 0000002d
> [  194.800720] 1f00: 00000000 0000002d ffffe000 c0f01f28 c07d33b0 c07d3478 20070013 ffffffff
> [  194.808959] (__irq_svc) from cpuidle_enter_state (drivers/cpuidle/cpuidle.c:259) 
> [  194.817199] (cpuidle_enter_state) from cpuidle_enter (drivers/cpuidle/cpuidle.c:351) 
> [  194.825592] (cpuidle_enter) from do_idle (kernel/sched/idle.c:158) 
> [  194.833129] (do_idle) from cpu_startup_entry (kernel/sched/idle.c:402 (discriminator 1)) 
> [  194.840820] (cpu_startup_entry) from start_kernel (init/main.c:1144) 
> [ 194.849151] Code: e0000007 e3c1103c e1913000 0affffe1 (e7f001f2)
> All code
> ========
>    0:	07                   	(bad)  
>    1:	00 00                	add    %al,(%rax)
>    3:	e0 3c                	loopne 0x41
>    5:	10 c1                	adc    %al,%cl
>    7:	e3 00                	jrcxz  0x9
>    9:	30 91 e1 e1 ff ff    	xor    %dl,-0x1e1f(%rcx)
>    f:	0a f2                	or     %dl,%dh
>   11:*	01 f0                	add    %esi,%eax		<-- trapping instruction
>   13:	e7                   	.byte 0xe7
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	f2 01 f0             	repnz add %esi,%eax
>    3:	e7                   	.byte 0xe7
> [  194.855346] ---[ end trace f0dbb8dd5ceba01a ]---


Regards,
Merlijn
