Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B44745FFE9
	for <lists+linux-omap@lfdr.de>; Sat, 27 Nov 2021 16:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344788AbhK0Pl2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 27 Nov 2021 10:41:28 -0500
Received: from mail.archive.org ([207.241.224.6]:42018 "EHLO mail.archive.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234853AbhK0Pj1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 27 Nov 2021 10:39:27 -0500
Received: from mail.archive.org (localhost [127.0.0.1])
        by mail.archive.org (Postfix) with ESMTP id 1325F2F6CC;
        Sat, 27 Nov 2021 15:35:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.archive.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
        autolearn=disabled version=3.4.2
Received: from [0.0.0.0] (unknown [45.83.235.159])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: merlijn@archive.org)
        by mail.archive.org (Postfix) with ESMTPSA id 871CD2F429;
        Sat, 27 Nov 2021 15:35:41 +0000 (UTC)
Subject: Re: Oops while booting 5.15.2 on Nokia N900
From:   "Merlijn B.W. Wajer" <merlijn@archive.org>
To:     linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
References: <12e13327-3bb5-229e-d784-cd528db4b58e@archive.org>
Message-ID: <6fa3d07a-28e5-7853-e6ca-fc405d3080e4@archive.org>
Date:   Sat, 27 Nov 2021 16:40:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <12e13327-3bb5-229e-d784-cd528db4b58e@archive.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Envelope-From: <merlijn@archive.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 27/11/2021 00:11, Merlijn B.W. Wajer wrote:

> 
> Any ideas what could cause this? Please let me know if I should provide
> additional debug info.

Just a follow up, this also seems to happen after booting, depending on
the modules that are loaded, it looks like. I blacklisted a few more
modules and now my system consistently doesn't stay up for more than a
few minutes [1]. (I am trying to make it idle properly, but of course
wasn't  counting on that causing crashes more often. :-))

In my case, commenting these in my modprobe blacklist made crashes go
away (but that could simply be because my system was finally idling with
these modules blocked and unblocking them makes it not idle...):

> # Blocks idle (maybe audio does not complete?)
> #blacklist omap3_isp
> # Untested, just adding to prevent more usb loading
> #blacklist libcomposite
> #blacklist usb_f_ecm
> #blacklist usb_f_mass_storage

Not sure if it helps...

Cheers,
Merlijn

[1]

> [  132.892974] Internal error: Oops - undefined instruction: 0 [#1] PREEMPT SMP ARM
> [  132.900573] Modules linked in: bluetooth ecdh_generic ecc libaes zram zsmalloc cmt_speech nokia_mode
> m ssi_protocol phonet evdev wl1251_spi wl1251 mac80211 libarc4 omap3_rom_rng rng_core ir_rx51 rc_core s
> nd_soc_rx51 leds_gpio isp1704_charger pvrsrvkm_omap3_sgx530_121 sha256_generic libsha256 sha256_arm udc
> _core gpio_keys pwm_omap_dmtimer display_connector cpufreq_dt snd_soc_omap_mcbsp snd_soc_ti_sdma snd_so
> c_tpa6130a2 cfg80211 snd_soc_core snd_pcm_dmaengine snd_pcm omap_sham crypto_engine snd_timer snd bq27x
> xx_battery_i2c soundcore bq27xxx_battery bq2415x_charger leds_lp5523 leds_lp55xx_common led_class panel
> _sony_acx565akm omap_mailbox rtc_twl ohci_platform ohci_hcd ehci_hcd twl4030_pwrbutton pwm_twl_led st_a
> ccel_i2c st_sensors_i2c twl4030_keypad st_accel pwm_twl twl4030_madc matrix_keymap st_sensors twl4030_c
> harger industrialio_triggered_buffer kfifo_buf usbcore industrialio usb_common omap_ssi omapdrm hsi drm
> _kms_helper cfbfillrect syscopyarea cfbimgblt sysfillrect sysimgblt
> [  132.902496]  fb_sys_fops cfbcopyarea drm drm_panel_orientation_quirks cec
> [  132.996398] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.15.2-218697-gd1b31b78bf22-dirty #1
> [  133.004760] Hardware name: Nokia RX-51 board
> [  133.009094] PC is at omap3_l3_app_irq+0x100/0x120
> [  133.013885] LR is at __handle_irq_event_percpu+0x48/0x250
> [  133.019409] pc : [<c05b0ac8>]    lr : [<c019c2a4>]    psr: 20010193
> [  133.025756] sp : c0f01d58  ip : 3ccf0000  fp : c1834200
> [  133.031036] r10: c0ff8760  r9 : c0ff8780  r8 : 0000001a
> [  133.036315] r7 : 00000000  r6 : 00400000  r5 : 00000000  r4 : f8000000
> [  133.042907] r3 : 00400000  r2 : 49b67397  r1 : 00000000  r0 : 00400000
> [  133.049530] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [  133.056823] Control: 10c5387d  Table: 850d8019  DAC: 00000051
> [  133.062652] Register r0 information: non-paged memory
> [  133.067779] Register r1 information: NULL pointer
> [  133.072570] Register r2 information: non-paged memory
> [  133.077728] Register r3 information: non-paged memory
> [  133.082855] Register r4 information: 0-page vmalloc region starting at 0xf8000000 allocated at iotab
> le_init+0x0/0xf4
> [  133.093536] Register r5 information: NULL pointer
> [  133.098327] Register r6 information: non-paged memory
> [  133.103485] Register r7 information: NULL pointer
> [  133.108245] Register r8 information: non-paged memory
> [  133.113403] Register r9 information: non-slab/vmalloc memory
> [  133.119140] Register r10 information: non-slab/vmalloc memory
> [  133.124999] Register r11 information: slab kmalloc-256 start c1834200 pointer offset 0 size 256
> [  133.133880] Register r12 information: non-paged memory
> [  133.139129] Process swapper/0 (pid: 0, stack limit = 0xcece1d46)
> [  133.145202] Stack: (0xc0f01d58 to 0xc0f02000)
> [  133.149627] 1d40:                                                       c0627a10 c1fc4d80
> [  133.157928] 1d60: c0f04dc8 c1a47500 c0f04dc8 00000000 c0f01db0 0000001a c0ff8780 c019c2a4
> [  133.166198] 1d80: 00000000 49b67397 c0f04dc8 c1834200 c0f04dc8 c0f01ec0 c1805a00 0000000a
> [  133.174468] 1da0: c0f01e08 f1069c8e c0f03080 c019c4d4 00000000 49b67397 c1834200 c183426c
> [  133.182739] 1dc0: c0f01ec0 c019c55c c1834200 c183426c c0f01ec0 c01a0d60 c0e6d5b0 00000000
> [  133.191009] 1de0: c0f01ec0 c019bba8 c0101268 20010113 ffffffff c0f01e3c 0000001f c0f00000
> [  133.199310] 1e00: f1069c8e c0100b3c 00000000 00000000 0ecf6000 c0e6e480 c0e6e480 ffffffc0
> [  133.207580] 1e20: 00000000 00000040 0000001f c0f01ec0 f1069c8e c0f03080 00000101 c0f01e58
> [  133.215850] 1e40: c0101250 c0101268 20010113 ffffffff 00000051 c0101250 c1805c50 80000000
> [  133.224121] 1e60: 0000000a ffffbeb9 04200002 c01a3124 c1835700 c0e6e480 00000000 00000000
> [  133.232391] 1e80: c1805a00 0000001f c0f01ec0 f1069c8e 0000001e c013d7d8 c0e6d5b0 c019bbac
> [  133.240661] 1ea0: c07af038 20010013 ffffffff c0f01ef4 cfb63a78 c0f00000 f1069c8e c0100b3c
> [  133.248931] 1ec0: 00000000 c0f0b798 ffffe000 0ecf6000 00000004 c0f0b618 00000000 00000004
> [  133.257232] 1ee0: cfb63a78 c0ff94c0 f1069c8e 0000001e 00000001 c0f01f10 c07aef64 c07af038
> [  133.265502] 1f00: 20010013 ffffffff 00000051 c07aef3c 0000000a cfb63a78 f0e7e0be 00000000
> [  133.273773] 1f20: c0f01f73 0000001e f043e400 0000001e 007689ec cfb63a78 c0f0b618 00000004
> [  133.282043] 1f40: c0f04e64 cfb63a78 c0f04dc8 c0f0b618 c0e6da70 c07af2fc ffffe000 c0f04e10
> [  133.290313] 1f60: 00000001 c016e754 00000004 c0f04dc0 01000000 49b67397 c0f084ac 000000e4
> [  133.298583] 1f80: c0e43a60 cfdff0d4 c0f04dc0 00000000 cfdff0c0 c0f084ac c0ccdbc8 c016eae8
> [  133.306884] 1fa0: c1000068 c0e00f0c ffffffff ffffffff 00000000 c0e00598 00000000 c0f04dc8
> [  133.315155] 1fc0: 00000000 c0e43a60 49b37c95 00000000 00000000 c0e00330 00000051 10c0387d
> [  133.323425] 1fe0: 000007a3 8249c028 411fc083 10c5387d 00000000 00000000 00000000 00000000
> [  133.331695] [<c05b0ac8>] (omap3_l3_app_irq) from [<c019c2a4>] (__handle_irq_event_percpu+0x48/0x250)
> [  133.340972] [<c019c2a4>] (__handle_irq_event_percpu) from [<c019c4d4>] (handle_irq_event_percpu+0x28
> /0x78)
> [  133.350769] [<c019c4d4>] (handle_irq_event_percpu) from [<c019c55c>] (handle_irq_event+0x38/0x5c)
> [  133.359802] [<c019c55c>] (handle_irq_event) from [<c01a0d60>] (handle_level_irq+0xc0/0x14c)
> [  133.368286] [<c01a0d60>] (handle_level_irq) from [<c019bba8>] (handle_domain_irq+0x70/0xac)
> [  133.376770] [<c019bba8>] (handle_domain_irq) from [<c0100b3c>] (__irq_svc+0x5c/0x90)
> [  133.384643] Exception stack(0xc0f01e08 to 0xc0f01e50)
> [  133.389770] 1e00:                   00000000 00000000 0ecf6000 c0e6e480 c0e6e480 ffffffc0
> [  133.398040] 1e20: 00000000 00000040 0000001f c0f01ec0 f1069c8e c0f03080 00000101 c0f01e58
> [  133.406311] 1e40: c0101250 c0101268 20010113 ffffffff
> [  133.411437] [<c0100b3c>] (__irq_svc) from [<c0101268>] (__do_softirq+0x80/0x418)
> [  133.418945] [<c0101268>] (__do_softirq) from [<c013d7d8>] (irq_exit+0xc4/0x104)
> [  133.426391] [<c013d7d8>] (irq_exit) from [<c019bbac>] (handle_domain_irq+0x74/0xac)
> [  133.434173] [<c019bbac>] (handle_domain_irq) from [<c0100b3c>] (__irq_svc+0x5c/0x90)
> [  133.442047] Exception stack(0xc0f01ec0 to 0xc0f01f08)
> [  133.447174] 1ec0: 00000000 c0f0b798 ffffe000 0ecf6000 00000004 c0f0b618 00000000 00000004
> [  133.455474] 1ee0: cfb63a78 c0ff94c0 f1069c8e 0000001e 00000001 c0f01f10 c07aef64 c07af038
> [  133.463714] 1f00: 20010013 ffffffff
> [  133.467285] [<c0100b3c>] (__irq_svc) from [<c07af038>] (cpuidle_enter_state+0x258/0x4b8)
> [  133.475524] [<c07af038>] (cpuidle_enter_state) from [<c07af2fc>] (cpuidle_enter+0x50/0x54)
> [  133.483917] [<c07af2fc>] (cpuidle_enter) from [<c016e754>] (do_idle+0x224/0x284)
> [  133.491424] [<c016e754>] (do_idle) from [<c016eae8>] (cpu_startup_entry+0x18/0x20)
> [  133.499114] [<c016eae8>] (cpu_startup_entry) from [<c0e00f0c>] (start_kernel+0x5c8/0x6c8)
> [  133.507446] Code: e3c0003c e007100c e1903001 0affffc9 (e7f001f2)
> [  133.513641] ---[ end trace acca9e0df4827c8a ]---
> [  133.518341] Kernel panic - not syncing: Fatal exception in interrupt
> [  133.524780] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---
