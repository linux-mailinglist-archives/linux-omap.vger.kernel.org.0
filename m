Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F35B0467EC5
	for <lists+linux-omap@lfdr.de>; Fri,  3 Dec 2021 21:25:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233991AbhLCU2t (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 Dec 2021 15:28:49 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:37646 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233528AbhLCU2s (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 3 Dec 2021 15:28:48 -0500
Received: from mail.kernel.org (unknown [198.145.29.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E12ACB8291F
        for <linux-omap@vger.kernel.org>; Fri,  3 Dec 2021 20:25:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 126EA60E0C;
        Fri,  3 Dec 2021 20:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638563121;
        bh=ndweMjfjg/r5VceHsgT210LHHTRjYDpgfANgXULXfrM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kj1JEspPurtWTr7RuJ4wswkdg4mcjWQKiNI9p7WIUm1MiFKnBmxl10W05C++8AcoF
         cLuhes9MmEEviwpDSUQlnfiiYrl2NxIGDcc8d8T8j4cObso7CCn0acxtf8m0airO73
         skwl/bSli20M3S69cJwYFakTpIEy8ByJk8R3W0XdkP19cwa7HXmGG5IwwPPQOrwk9k
         xOC5RZMASPebBL1h33Rtm5LXd/0HgKnZ7Xfk/0zfmKY0msf3VTBBXNwiVx92kTz86D
         x2OkR5pLnlyeXjilEC4oNKXXVtJd3N7X2ILE5WNH+BC77if0xjacBBkMN+70jlyJ/y
         PVS+l2Nla1DZQ==
Received: by earth.universe (Postfix, from userid 1000)
        id DED453C0CA8; Fri,  3 Dec 2021 21:25:18 +0100 (CET)
Date:   Fri, 3 Dec 2021 21:25:18 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>, zhangqilong3@huawei.com,
        jingxiangfeng@huawei.com, Pavel Machek <pavel@ucw.cz>,
        Tony Lindgren <tony@atomide.com>, Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: Re: Oops in ssi (through nokia-modem)
Message-ID: <20211203202518.rqmpf645n2ysyluo@earth.universe>
References: <4ed95c71-2066-6b4c-ad1b-53ef02d79d53@wizzup.org>
 <9cdcb6d1-dd80-e01b-0758-67879758db08@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7dtn7fzynlo77zii"
Content-Disposition: inline
In-Reply-To: <9cdcb6d1-dd80-e01b-0758-67879758db08@wizzup.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--7dtn7fzynlo77zii
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

No idea (I have not booted my N900 for some time). Newer kernel might
just have slowed down or speed up things and uncovered a race condition.
IIRC the dma_mask warning is old and not a huge issue.

What is IRQ #26 according to /proc/cpuinfo?

Finally for the NULL pointer dereference in ssi_gdd_tasklet it would
help to run the stacktrace through "scripts/decode_stacktrace.sh",
so that we get exact line numbers.

Have you tried bisecting this?

-- Sebastian

On Fri, Dec 03, 2021 at 04:35:48PM +0100, Merlijn Wajer wrote:
> Hi,
>=20
> Any idea what could be causing this regression? I've also enabled
> HSI_CHAR=3Dm just in case that was the problem -- it wasn't, the same
> problem occurs unfortunately.
>=20
> Thanks in advance.
>=20
> Regards,
> Merlijn
>=20
> On 27/11/2021 02:09, Merlijn Wajer wrote:
> > Hi,
> >=20
> > As soon as nokia-modem on my Nokia N900 gets used, I get the following
> > warning, followed by an oops [1]. I believe the nokia-modem module is
> > probed with the "pm=3D1" argument, but that doesn't seem particularly
> > important given the trace, I think.
> >=20
> > Don't know exactly when this would have been introduced, but it worked
> > in 5.1 at least. Please let me know if I should provide more debug info,
> > or how I can help fix the problem.
> >=20
> > Thanks,
> > Cheers,
> > Merlijn
> >=20
> > [1]
> >> [  165.461120] ssi-protocol ssi-protocol: WAKELINES TEST OK
> >> [  165.467529] IPv6: ADDRCONF(NETDEV_CHANGE): phonet0: link becomes re=
ady
> >> [  165.498687] ------------[ cut here ]------------
> >> [  165.503417] WARNING: CPU: 0 PID: 662 at kernel/dma/mapping.c:188 __=
dma_map_sg_attrs+0xd8/0x100
> >> [  165.512237] Modules linked in: usb_f_ecm u_ether usb_f_mass_storage=
 libcomposite bluetooth ecdh_generic ecc libaes zram zsmalloc cmt_speech no=
kia_modem ssi_protocol phonet joydev mousedev evdev wl1251_spi wl1251 mac80=
211 libarc4 omap3_rom_rng ir_rx51 rng_core rc_core snd_soc_rx51 leds_gpio s=
ha256_generic libsha256 pvrsrvkm_omap3_sgx530_121 sha256_arm gpio_keys isp1=
704_charger pwm_omap_dmtimer display_connector cpufreq_dt omap3_isp videobu=
f2_dma_contig videobuf2_memops snd_soc_omap_mcbsp videobuf2_v4l2 snd_soc_ti=
_sdma videobuf2_common v4l2_fwnode v4l2_async cfg80211 videodev snd_soc_tpa=
6130a2 omap_sham crypto_engine mc snd_soc_core snd_pcm_dmaengine tsc2005 ts=
c200x_core panel_sony_acx565akm snd_pcm omap2430 snd_timer phy_twl4030_usb =
leds_lp5523 leds_lp55xx_common snd omap_mailbox bq2415x_charger led_class s=
oundcore bq27xxx_battery_i2c bq27xxx_battery musb_hdrc udc_core rtc_twl ohc=
i_platform ohci_hcd ehci_hcd twl4030_pwrbutton pwm_twl_led st_accel_i2c st_=
sensors_i2c st_accel
> >> [  165.513031]  twl4030_keypad pwm_twl twl4030_charger st_sensors twl4=
030_madc matrix_keymap industrialio_triggered_buffer kfifo_buf usbcore indu=
strialio usb_common omapdrm omap_ssi hsi drm_kms_helper cfbfillrect syscopy=
area cfbimgblt sysfillrect sysimgblt fb_sys_fops cfbcopyarea drm drm_panel_=
orientation_quirks cec
> >> [  165.627838] CPU: 0 PID: 662 Comm: irq/83-SSI PORT Not tainted 5.15.=
2-218696-g31e48a7f0946-dirty #1
> >> [  165.636871] Hardware name: Nokia RX-51 board
> >> [  165.641204] [<c0111254>] (unwind_backtrace) from [<c010b8ac>] (show=
_stack+0x10/0x14)
> >> [  165.649017] [<c010b8ac>] (show_stack) from [<c0a11d84>] (dump_stack=
_lvl+0x40/0x4c)
> >> [  165.656677] [<c0a11d84>] (dump_stack_lvl) from [<c01362c8>] (__warn=
+0xd8/0x100)
> >> [  165.664062] [<c01362c8>] (__warn) from [<c0a0d370>] (warn_slowpath_=
fmt+0x58/0xb8)
> >> [  165.671600] [<c0a0d370>] (warn_slowpath_fmt) from [<c01b9bc0>] (__d=
ma_map_sg_attrs+0xd8/0x100)
> >> [  165.680297] [<c01b9bc0>] (__dma_map_sg_attrs) from [<c01b9bfc>] (dm=
a_map_sg_attrs+0x14/0x20)
> >> [  165.688781] [<c01b9bfc>] (dma_map_sg_attrs) from [<bf0a7738>] (ssi_=
start_transfer+0x208/0x358 [omap_ssi])
> >> [  165.698486] [<bf0a7738>] (ssi_start_transfer [omap_ssi]) from [<bf0=
a7918>] (ssi_async+0x90/0x1f4 [omap_ssi])
> >> [  165.708404] [<bf0a7918>] (ssi_async [omap_ssi]) from [<bf0a7d20>] (=
ssi_pio_complete+0x108/0x244 [omap_ssi])
> >> [  165.718261] [<bf0a7d20>] (ssi_pio_complete [omap_ssi]) from [<bf0a7=
ef8>] (ssi_pio_thread+0x9c/0x3ec [omap_ssi])
> >> [  165.728454] [<bf0a7ef8>] (ssi_pio_thread [omap_ssi]) from [<c019d09=
4>] (irq_thread_fn+0x1c/0x78)
> >> [  165.737335] [<c019d094>] (irq_thread_fn) from [<c019d380>] (irq_thr=
ead+0x108/0x210)
> >> [  165.745056] [<c019d380>] (irq_thread) from [<c0159ba0>] (kthread+0x=
168/0x1a4)
> >> [  165.752288] [<c0159ba0>] (kthread) from [<c0100150>] (ret_from_fork=
+0x14/0x24)
> >> [  165.759552] Exception stack(0xc39adfb0 to 0xc39adff8)
> >> [  165.764648] dfa0:                                     00000000 0000=
0000 00000000 00000000
> >> [  165.772888] dfc0: 00000000 00000000 00000000 00000000 00000000 0000=
0000 00000000 00000000
> >> [  165.781127] dfe0: 00000000 00000000 00000000 00000000 00000013 0000=
0000
> >> [  165.787841] ---[ end trace a3f2b689bab17aa5 ]---
> >> [  166.436523] irq 26: nobody cared (try booting with the "irqpoll" op=
tion)
> >> [  166.443298] CPU: 0 PID: 662 Comm: irq/83-SSI PORT Tainted: G       =
 W         5.15.2-218696-g31e48a7f0946-dirty #1
> >> [  166.453704] Hardware name: Nokia RX-51 board
> >> [  166.458007] [<c0111254>] (unwind_backtrace) from [<c010b8ac>] (show=
_stack+0x10/0x14)
> >> [  166.465820] [<c010b8ac>] (show_stack) from [<c0a11d84>] (dump_stack=
_lvl+0x40/0x4c)
> >> [  166.473449] [<c0a11d84>] (dump_stack_lvl) from [<c0a0ddf8>] (__repo=
rt_bad_irq+0x30/0xc0)
> >> [  166.481628] [<c0a0ddf8>] (__report_bad_irq) from [<c019fe5c>] (note=
_interrupt+0x150/0x2d8)
> >> [  166.489959] [<c019fe5c>] (note_interrupt) from [<c019c518>] (handle=
_irq_event_percpu+0x6c/0x78)
> >> [  166.498718] [<c019c518>] (handle_irq_event_percpu) from [<c019c55c>=
] (handle_irq_event+0x38/0x5c)
> >> [  166.507659] [<c019c55c>] (handle_irq_event) from [<c01a0d60>] (hand=
le_level_irq+0xc0/0x14c)
> >> [  166.516082] [<c01a0d60>] (handle_level_irq) from [<c019bba8>] (hand=
le_domain_irq+0x70/0xac)
> >> [  166.524505] [<c019bba8>] (handle_domain_irq) from [<c0100b3c>] (__i=
rq_svc+0x5c/0x90)
> >> [  166.532318] Exception stack(0xc39ade70 to 0xc39adeb8)
> >> [  166.537414] de60:                                     c3f2b45c 0000=
0202 00000201 00000002
> >> [  166.545623] de80: ccfb9480 00000000 c3f2b440 c3f2b45c 00000001 c305=
a140 c3d01c00 01000100
> >> [  166.553863] dea0: 00000021 c39adec0 bf0a794c c0a21008 60010013 ffff=
ffff
> >> [  166.560516] [<c0100b3c>] (__irq_svc) from [<c0a21008>] (_raw_spin_u=
nlock_bh+0x0/0x34)
> >> [  166.568420] [<c0a21008>] (_raw_spin_unlock_bh) from [<bf0a7888>] (s=
si_async+0x0/0x1f4 [omap_ssi])
> >> [  166.577392] [<bf0a7888>] (ssi_async [omap_ssi]) from [<00000004>] (=
0x4)
> >> [  166.584075] handlers:
> >> [  166.586364] [<9a339024>] omap3_l3_app_irq
> >> [  166.590454] Disabling IRQ #26
> >> [  166.593475] sched: RT throttling activated
> >> [  166.593566] 8<--- cut here ---
> >> [  166.600799] Unable to handle kernel NULL pointer dereference at vir=
tual address 00000000
> >> [  166.608978] pgd =3D 34df813c
> >> [  166.611724] [00000000] *pgd=3D00000000
> >> [  166.615356] Internal error: Oops: 805 [#1] PREEMPT SMP ARM
> >> [  166.620880] Modules linked in: usb_f_ecm u_ether usb_f_mass_storage=
 libcomposite bluetooth ecdh_generic ecc libaes zram zsmalloc cmt_speech no=
kia_modem ssi_protocol phonet joydev mousedev evdev wl1251_spi wl1251 mac80=
211 libarc4 omap3_rom_rng ir_rx51 rng_core rc_core snd_soc_rx51 leds_gpio s=
ha256_generic libsha256 pvrsrvkm_omap3_sgx530_121 sha256_arm gpio_keys isp1=
704_charger pwm_omap_dmtimer display_connector cpufreq_dt omap3_isp videobu=
f2_dma_contig videobuf2_memops snd_soc_omap_mcbsp videobuf2_v4l2 snd_soc_ti=
_sdma videobuf2_common v4l2_fwnode v4l2_async cfg80211 videodev snd_soc_tpa=
6130a2 omap_sham crypto_engine mc snd_soc_core snd_pcm_dmaengine tsc2005 ts=
c200x_core panel_sony_acx565akm snd_pcm omap2430 snd_timer phy_twl4030_usb =
leds_lp5523 leds_lp55xx_common snd omap_mailbox bq2415x_charger led_class s=
oundcore bq27xxx_battery_i2c bq27xxx_battery musb_hdrc udc_core rtc_twl ohc=
i_platform ohci_hcd ehci_hcd twl4030_pwrbutton pwm_twl_led st_accel_i2c st_=
sensors_i2c st_accel
> >> [  166.621673]  twl4030_keypad pwm_twl twl4030_charger st_sensors twl4=
030_madc matrix_keymap industrialio_triggered_buffer kfifo_buf usbcore indu=
strialio usb_common omapdrm omap_ssi hsi drm_kms_helper cfbfillrect syscopy=
area cfbimgblt sysfillrect sysimgblt fb_sys_fops cfbcopyarea drm drm_panel_=
orientation_quirks cec
> >> [  166.736297] CPU: 0 PID: 662 Comm: irq/83-SSI PORT Tainted: G       =
 W         5.15.2-218696-g31e48a7f0946-dirty #1
> >> [  166.746704] Hardware name: Nokia RX-51 board
> >> [  166.751007] PC is at ssi_gdd_tasklet+0x258/0x2e8 [omap_ssi]
> >> [  166.756652] LR is at _raw_spin_unlock+0x28/0x54
> >> [  166.761230] pc : [<bf0a6520>]    lr : [<c0a20cd4>]    psr: 20010013
> >> [  166.767517] sp : c39ade00  ip : ffb80000  fp : c3f2b45c
> >> [  166.772796] r10: 00000001  r9 : c3d01c00  r8 : 00000001
> >> [  166.778045] r7 : 00000000  r6 : 00000000  r5 : c305a140  r4 : ccfb9=
480
> >> [  166.784606] r3 : 00000000  r2 : c3f2b4f4  r1 : 00000000  r0 : c3f2b=
4ec
> >> [  166.791168] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Se=
gment none
> >> [  166.798370] Control: 10c5387d  Table: 85bb4019  DAC: 00000051
> >> [  166.804138] Register r0 information: slab kmalloc-512 start c3f2b40=
0 pointer offset 236 size 512
> >> [  166.813049] Register r1 information: NULL pointer
> >> [  166.817779] Register r2 information: slab kmalloc-512 start c3f2b40=
0 pointer offset 244 size 512
> >> [  166.826660] Register r3 information: NULL pointer
> >> [  166.831420] Register r4 information: slab kmalloc-64 start ccfb9480=
 pointer offset 0 size 64
> >> [  166.839935] Register r5 information: slab kmalloc-256 start c305a10=
0 pointer offset 64 size 256
> >> [  166.848724] Register r6 information: NULL pointer
> >> [  166.853485] Register r7 information: NULL pointer
> >> [  166.858215] Register r8 information: non-paged memory
> >> [  166.863311] Register r9 information: slab kmalloc-1k start c3d01c00=
 pointer offset 0 size 1024
> >> [  166.872009] Register r10 information: non-paged memory
> >> [  166.877197] Register r11 information: slab kmalloc-512 start c3f2b4=
00 pointer offset 92 size 512
> >> [  166.886077] Register r12 information: non-paged memory
> >> [  166.891265] Process irq/83-SSI PORT (pid: 662, stack limit =3D 0xd6=
f455cc)
> >> [  166.898010] Stack: (0xc39ade00 to 0xc39ae000)
> >> [  166.902404] de00: 00000000 c1805e00 c1805e50 00000001 c3e49a00 c3f2=
b440 00000001 00000008
> >> [  166.910644] de20: fa058000 c305a140 00000000 c305a154 00000000 cfb5=
d330 00000000 00000000
> >> [  166.918853] de40: c0ff8760 00000101 c0f03080 c013d9e0 c0f03080 0000=
0001 00000000 00000203
> >> [  166.927093] de60: ffffe000 c01012dc c3d01c00 c0100b3c 0000000a ffff=
cbe2 00208040 00000002
> >> [  166.935333] de80: ccfb9480 60010013 ffffe000 c3f2b440 c3f2b45c 0000=
0001 c305a140 c3d01c00
> >> [  166.943572] dea0: 01000100 c013d468 00000200 c013d554 ccfb9480 0000=
0000 c3f2b440 bf0a794c
> >> [  166.951782] dec0: bf0a7888 c56d9100 c3f2b440 c3f2b45c c3f2b464 0000=
0001 c305a140 c3d01c00
> >> [  166.960021] dee0: 01000100 bf0a7d20 00000004 c3d00410 c019d078 0000=
0000 c3d01c00 c3f2b440
> >> [  166.968261] df00: c3f2b4a4 00000001 00000001 fa058000 c019d078 bf0a=
7ef8 00000004 b3675ddc
> >> [  166.976501] df20: c019d078 c3f200c0 c1837b00 00000000 ffffe000 0000=
0001 00000000 c3f200c0
> >> [  166.984710] df40: c019d078 c019d094 c1837b00 c3f200e4 00000000 c019=
d380 c371d840 00000000
> >> [  166.992950] df60: c019d19c b3675ddc 00000000 c39ac000 c3f7c580 c3f7=
c300 c019d278 c3f200c0
> >> [  167.001190] df80: c395bc04 c3f7c5a0 00000000 c0159ba0 c3f7c300 c015=
9a38 00000000 00000000
> >> [  167.009399] dfa0: 00000000 00000000 00000000 c0100150 00000000 0000=
0000 00000000 00000000
> >> [  167.017639] dfc0: 00000000 00000000 00000000 00000000 00000000 0000=
0000 00000000 00000000
> >> [  167.025878] dfe0: 00000000 00000000 00000000 00000000 00000013 0000=
0000 00000000 00000000
> >> [  167.034118] [<bf0a6520>] (ssi_gdd_tasklet [omap_ssi]) from [<c013d9=
e0>] (tasklet_action_common.constprop.4+0xa8/0xbc)
> >> [  167.044830] [<c013d9e0>] (tasklet_action_common.constprop.4) from [=
<c01012dc>] (__do_softirq+0xf4/0x418)
> >> [  167.054382] [<c01012dc>] (__do_softirq) from [<c013d468>] (do_softi=
rq+0x70/0x7c)
> >> [  167.061828] [<c013d468>] (do_softirq) from [<c013d554>] (__local_bh=
_enable_ip+0xe0/0xfc)
> >> [  167.070007] [<c013d554>] (__local_bh_enable_ip) from [<bf0a794c>] (=
ssi_async+0xc4/0x1f4 [omap_ssi])
> >> [  167.079132] [<bf0a794c>] (ssi_async [omap_ssi]) from [<bf0a7d20>] (=
ssi_pio_complete+0x108/0x244 [omap_ssi])
> >> [  167.088989] [<bf0a7d20>] (ssi_pio_complete [omap_ssi]) from [<bf0a7=
ef8>] (ssi_pio_thread+0x9c/0x3ec [omap_ssi])
> >> [  167.099182] [<bf0a7ef8>] (ssi_pio_thread [omap_ssi]) from [<c019d09=
4>] (irq_thread_fn+0x1c/0x78)
> >> [  167.108062] [<c019d094>] (irq_thread_fn) from [<c019d380>] (irq_thr=
ead+0x108/0x210)
> >> [  167.115783] [<c019d380>] (irq_thread) from [<c0159ba0>] (kthread+0x=
168/0x1a4)
> >> [  167.122985] [<c0159ba0>] (kthread) from [<c0100150>] (ret_from_fork=
+0x14/0x24)
> >> [  167.130279] Exception stack(0xc39adfb0 to 0xc39adff8)
> >> [  167.135375] dfa0:                                     00000000 0000=
0000 00000000 00000000
> >> [  167.143585] dfc0: 00000000 00000000 00000000 00000000 00000000 0000=
0000 00000000 00000000
> >> [  167.151824] dfe0: 00000000 00000000 00000000 00000000 00000013 0000=
0000
> >> [  167.158477] Code: e59210b0 e58240b0 e28220b4 e1c400f0 (e5814000)
> >> [  167.164703] ---[ end trace a3f2b689bab17aa6 ]---
> >> [  167.169433] Kernel panic - not syncing: Fatal exception in interrupt
> >> [  167.175842] ---[ end Kernel panic - not syncing: Fatal exception in=
 interrupt ]---
>=20

--7dtn7fzynlo77zii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmGqfSsACgkQ2O7X88g7
+poJ6RAAh5O850sO/e3NSqIB6DvygGraaIv/GXpEuxHWu7S7DhfgiheIYFAspCvd
6nV/UsG5aa4CQy3szZqS+HnGZAF+md65+dShR48Twtqi2d4lpO0wqfy4gX+guSps
+1Y6upq+x0pobT4POdV+hUFF/zsheFacNi6SJJsbLZ1Cyp/sfsA4Hh1ZLqUJo39O
d1UEuvVZnimx31c6nBcHdcPf1T0vhlrKZ0qqvazv32Ufrpxg2+hWUFzqYL0EyuHY
o0i62aTpqQk6hO2o5SNS9eoRwuQpgM109vCztD5Bm1a/LBMUnhDaQvhyo5wYeIe5
38xHXqkrfjthZBrM8Yrlhg/6x6YmVTsQyl+cvCg4Tu43M8PWWNgP99ZAGPPvX0nt
rIghMOuU6cNv4pD5VAcI2/J+YEIT5GKLNN5KSjsg8m4u9Ah8oY2LWo/2X8YMskR/
CCtYwAJ/Hz4LLHxHHfCrB/mVnis1+zjI2Xfr5RQg3yatS7xIHuZFPx27fk29c+yx
7UijnYIKvo7pxGKGa2SsUUCRqGzWv1FeOfs1ctTofyYC8QvEda8S6NjitUeaW3rI
DixM4XuUHjMQjqPOBSBNJr0mP3nNO6aoDPnArXaAnwZkZtJ77eBSsArJrM7ax7vr
XioC4plHKX10EH6rgQMLEl/ryBqvcq+o8HpPcPeiNsZU9OGtOmI=
=leBO
-----END PGP SIGNATURE-----

--7dtn7fzynlo77zii--
