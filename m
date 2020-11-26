Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAF32C5E14
	for <lists+linux-omap@lfdr.de>; Fri, 27 Nov 2020 00:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729806AbgKZXT2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 26 Nov 2020 18:19:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729479AbgKZXT1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 26 Nov 2020 18:19:27 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DEBBC0613D4;
        Thu, 26 Nov 2020 15:19:27 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id x22so3449287wmc.5;
        Thu, 26 Nov 2020 15:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gnu2gW5RCUOQYF79kRMT4Ny9ym51U9jc5fVGhWdliA8=;
        b=ZdWHi1gyXGRchWh6DKvJ9y4CSHKDu6kw2BhJTUKdu1ch4vunentk+4sj1MpfiGx+hz
         XBl0FTF2Ysij34KjV0YjKgk1gXXagXwr8oMfYgtvIIqHwlXYG7mc029K1pQCxQHHlqmW
         K5SjTJzdtUajUeZZGiJTGXIXgV9Rj5NTMHP4cFen0FHRqOnPhR85+t3jOIfqsfvUmzVM
         dptXgrIcLturMjxgP6FqRhrkgd5HYGm/SGKtLbYO4nKuQ/0kkhcKeYCrm80I1dBIKmHd
         aR5JfQKliaZKFC01myaQjjL44Ju9mnXVzBGslcKwSB5iMorOb64KadPxolPhPHr1IK0z
         nE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gnu2gW5RCUOQYF79kRMT4Ny9ym51U9jc5fVGhWdliA8=;
        b=cNmALZPf851H1W/Nt4FfeJQRW1gzZXpIibqw5huiduFzMf5C3toTiu3SN3Cs76xWdW
         tSyFiuZSW7Q+lPflwn1OOflODyZaffdo9TZXWBbWqtxjb28imhtBHAD0ftG+lelyoXRu
         87C0PsZbxesDpxSa7YkbmYM6ijTnAhid7gXzGHCeZusk07L8FjcG65zjlIj4AMtI4Iuq
         VIGtJS0d6bJs7cYDM1tvGP02Tz6wfxHxIM7jy6C19UXJSFcx060Ln7EyerAJNSxgQXnl
         QKHsrMaZp8Hj+BtDjRl3ioWy/7UgaAGMao56QIdLczsZUP7soUmdHjO8x5Z7HcrL9xI5
         VczQ==
X-Gm-Message-State: AOAM533W20SaIvbcrjGekLF0n0E/Y9wlmFApGs7PhlxDdBsNiGNqUpBa
        /uK1sK0ALrNvBq4puLOithrQcxj1DOw=
X-Google-Smtp-Source: ABdhPJzgSRxUSgyfEglA6xxoFs2GbRAIbEtdzU9p5qzLuB8xjizJ4q0+67+dd2mZxGnSE/eJk3+wDw==
X-Received: by 2002:a7b:c92d:: with SMTP id h13mr5749724wml.96.1606432764952;
        Thu, 26 Nov 2020 15:19:24 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id h204sm4146867wme.17.2020.11.26.15.19.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 15:19:24 -0800 (PST)
Subject: Re: [REGRESSION] omapdrm/N900 display broken
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
 <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
 <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
 <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
 <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
 <5072a25d-e885-cdd2-978d-70942406c272@gmail.com>
 <09044fd2-2926-c7b3-826b-52b742e84ff5@ti.com>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <79ad8816-815c-14d3-ebe1-3c5007c81dd1@gmail.com>
Date:   Fri, 27 Nov 2020 01:17:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <09044fd2-2926-c7b3-826b-52b742e84ff5@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

On 26.11.20 г. 16:11 ч., Tomi Valkeinen wrote:
> Hi Aaro, Ivaylo,
> 
> On 24/11/2020 23:03, Ivaylo Dimitrov wrote:
> 
>> Is there any progress on the issue? I tried 5.9.1 and still nothing displayed.
> 
> Can you test the attached patch?
> 

With this patch I don't see oops that Aaro reported, so:

Tested-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

Seems to fix the particular issue, however, now we get another oops. As 
this is not upstream kernel but one with PVR related patches, I will try 
again with vanilla 5.9.

Just in case oops rings any bells (the line in question is 
https://github.com/maemo-leste/droid4-linux/blob/maemo-5.9/drivers/gpu/drm/omapdrm/omap_gem.c#L801)

[   17.494506] Unable to handle kernel NULL pointer dereference at 
virtual address 00000000
[   17.502807] pgd = c59ec13e
[   17.505523] [00000000] *pgd=00000000
[   17.509277] Internal error: Oops: 5 [#1] THUMB2
[   17.513824] Modules linked in: joydev hsi_char wl1251_spi wl1251 
omap3_rom_rng rng_core ir_rx51 leds_gpio led_class rc_core 
snd_soc_rx51(+) isp1704_charger pwm_omap_dmtimer gpio_keys mac80211 
cpufreq_dt snd_soc_omap_mcbsp snd_soc_ti_sdma cfg80211 omap3_isp 
videobuf2_dma_contig videobuf2_memops libarc4 videobuf2_v4l2 omap_sham 
videobuf2_common omap2430 tsc2005 panel_sony_acx565akm tsc200x_core 
snd_soc_tlv320aic3x snd_soc_tpa6130a2 omap_mailbox snd_soc_core 
hci_nokia snd_pcm_dmaengine si4713 bq2415x_charger phy_twl4030_usb 
snd_pcm snd_timer bq27xxx_battery_i2c bq27xxx_battery snd tsl2563 
musb_hdrc soundcore udc_core hci_uart btbcm ohci_platform ohci_hcd 
ehci_hcd twl4030_pwrbutton st_accel_i2c st_sensors_i2c st_accel pwm_twl 
st_sensors twl4030_madc pwm_twl_led industrialio_triggered_buffer 
kfifo_buf evdev twl4030_vibra ff_memless bluetooth et8ek8 industrialio 
ad5820 v4l2_fwnode ecdh_generic usbcore ecc libaes usb_common videodev 
lis3lv02d_i2c omap_ssi lis3lv02d hsi mc
[   17.599914] CPU: 0 PID: 10 Comm: kworker/0:1 Tainted: G     U 
    5.9.0-02838-g91f16872ecee #5
[   17.609161] Hardware name: Nokia RX-51 board
[   17.613464] Workqueue: events deferred_probe_work_func
[   17.618652] PC is at omap_gem_dma_sync_buffer 
(/home/user/git/linux-omap/drivers/gpu/drm/omapdrm/omap_gem.c:801)
[   17.623901] LR is at omap_framebuffer_pin 
(/home/user/git/linux-omap/drivers/gpu/drm/omapdrm/omap_fb.c:237 
(discriminator 2))
[   17.628814] pc : lr : psr: 800b0033
[   17.635101] sp : ce1cf978  ip : cbad5040  fp : 00000000
[   17.640350] r10: 00000001  r9 : 00000000  r8 : ccbe5000
[   17.645599] r7 : 00000177  r6 : 00000000  r5 : 00000000  r4 : cba8b000
[   17.652160] r3 : 00000000  r2 : 00000000  r1 : 00000001  r0 : cba8b000
[   17.658721] Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA Thumb 
Segment none
[   17.666046] Control: 50c5387d  Table: 8cb3c019  DAC: 00000051
[   17.671813] Process kworker/0:1 (pid: 10, stack limit = 0x4150a91a)
[   17.678131] Stack: (0xce1cf978 to 0xce1d0000)
[   17.682495] f960: 
   8e900000 cba8b000
[   17.690734] f980: 00000000 c04410e7 cba8b000 cbc75000 00000000 
cbc75080 00000000 cbc750a0
[   17.698944] f9a0: 00000001 cbc7507c cbbb5538 c0440ad9 ccc3ffc0 
00000002 00000000 00000000
[   17.707183] f9c0: 00000001 00000000 ccbe5160 c0411be9 c0413509 
ccc3ffc0 00000000 ccbe5000
[   17.715393] f9e0: 00000000 c041355b c041350d ccc3ffc0 ce1cfa0c 
ccbe5000 cbdfa100 c042e9c9
[   17.723602] fa00: 00000000 c0a04048 00000001 ce0bba80 00000004 
00000007 00000000 00000000
[   17.731842] fa20: cb816858 ccc15a20 00000000 be70958a 00000000 
ccbe5000 cbdfa118 cd742600
[   17.740051] fa40: cbdfa100 c0aed344 00000064 0000001e 00000001 
c042ea7b cbc750c0 c0aef518
[   17.748291] fa60: cbdfa1a8 ccbe5054 ccbe5054 cbdfa100 ccbe5000 
cd742600 cbdfa1a8 c0aed344
[   17.756500] fa80: 00000064 c042eb31 cbdfa1a8 cbdfa100 00000000 
c0416199 ccba8400 00000000
[   17.764739] faa0: ccba8400 cd742600 00000000 c04161f1 ce08e000 
c03cad8f c0a04048 c01c92bd
[   17.772949] fac0: 00000064 0000001e 00200000 00000000 00000000 
ce08e000 c0aefc30 00000000
[   17.781188] fae0: 00000000 c0641e80 00000000 c0aefb34 ce08e000 
c03f627b 00000000 00000000
[   17.789398] fb00: 00000000 00000001 00000000 c03f7875 c0a04048 
c0a6de84 c0768eab 0000003e
[   17.797637] fb20: 00000001 c0aef63c c0a6de84 00000000 c0aef634 
c0641e80 00000000 0000003e
[   17.805847] fb40: 00000000 00000001 c0aefc34 c03f7b09 c0a6de84 
c076ebc5 00000001 ce1cfba4
[   17.814056] fb60: ccba8618 c0aed21c c0a69bf4 c0aed220 c0a04850 
c0a04048 ccba8410 ccba8618
[   17.822296] fb80: 000001e0 c03c9239 ccba8400 00000000 c0aed214 
c03c4cc9 c0768b17 00000000
[   17.830505] fba0: 00000000 00000000 00000000 00000320 000001e0 
00000000 00000000 00000000
[   17.838745] fbc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000020 be70958a
[   17.846954] fbe0: cbdfa100 c0a7208c ccba8400 00000000 ccbe5000 
00000000 cbdfa1a8 c0415ec7
[   17.855194] fc00: cbdfa118 00000001 ccfc598c 00000000 00000000 
00000320 000001e0 00000320
[   17.863403] fc20: 000001e0 00000020 00000018 be70958a c0a7208c 
cbdfa100 ccbe5000 ce365000
[   17.871612] fc40: ce365000 00000002 cbbb5080 ce3650e8 ce365044 
c0443ce7 00000000 ccbe5000
[   17.879852] fc60: ce365000 c043f113 00000000 00000000 00000002 
00000000 c0a72fe4 00000000
[   17.888061] fc80: cd49a210 c0a72fe4 c0af3c20 00000000 c0a72fe4 
00000045 c0a731c0 c044990b
[   17.896301] fca0: cd49a210 00000000 c0af3c28 c04487bf cd49a210 
c0a72fe4 ce1cfd0c c0448a31
[   17.904510] fcc0: 00000001 00000000 00000000 c04489c3 00000000 
c0a04048 00000000 c044766f
[   17.912750] fce0: cd49a254 ce09f1dc ce576ab4 be70958a c0a731c0 
cd49a210 c0a73678 c0a04048
[   17.920959] fd00: cd49a254 c04488fd cd49a210 cd49a210 00000001 
be70958a cd49a210 c0a73678
[   17.929199] fd20: cd49a210 c0a04048 c0a734c8 c0447e2f cd49a210 
00000000 c0a731c0 c0446753
[   17.937408] fd40: ce21be10 00000018 00000000 c03a66b3 c0a04048 
be70958a 00000000 cd49a200
[   17.945617] fd60: 00000000 00000000 ccbe2400 c0a12190 c0a121b0 
00000000 c0a731a4 c04497c3
[   17.953857] fd80: be70958a cd49a200 ce1cfdb0 00000000 ccbe2400 
ce21be10 00000018 c0449d9b
[   17.962066] fda0: 00000000 c0a04048 cbb24018 c04325d7 00000000 
00000000 00000000 c077a4af
[   17.970306] fdc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[   17.978515] fde0: 00000000 00000000 00000018 be70958a cbb24540 
cbb24180 cbb24018 00000002
[   17.986755] fe00: cbbeadc0 c0444251 c0a731b8 cbb24180 c0a731a4 
ce21be10 c06632fc ce21be00
[   17.994964] fe20: c0a04048 ce21be00 cfcac160 c0444589 c0666cb0 
c06632fc cbbeadc0 00000000
[   18.003204] fe40: ccbe2400 ce21be10 00000002 c0432c39 cbbeadc0 
ce21be10 ce1cfe50 be70958a
[   18.011413] fe60: c0a726dc 00000000 ce21be10 c0a726dc c0af3c20 
00000000 c0a726dc 00000043
[   18.019653] fe80: c0a91e94 c044990b ce21be10 00000000 c0af3c28 
c04487bf ce21be10 c0a726dc
[   18.027862] fea0: ce1cfef4 c0448a31 00000001 00000000 c0a73430 
c04489c3 00000000 c0a04048
[   18.036071] fec0: 00000000 c044766f ce21be54 ce09f1dc ce3ba4b4 
be70958a c0a91e94 ce21be10
[   18.044311] fee0: c0a73678 c0a04048 ce21be54 c04488fd ce21be10 
ce21be10 00000001 be70958a
[   18.052520] ff00: c0a73400 c0a73678 ce21be10 cfc74200 00000000 
c0447e2f c0a73400 ce21be10
[   18.060760] ff20: c0a73444 c04482f7 ce1ae400 c0a7342c c0a13e5c 
c01271e5 ce1ae400 c0a7342c
[   18.068969] ff40: ffff2126 ce1ae400 ce1ae414 c0a13e5c c0a91878 
c0a1c4a0 c0a13e70 c0a970e8
[   18.077209] ff60: 00000000 c012758b 00000000 ce1b8a40 ce1b8a00 
ce1ce000 c012743d ce1ae400
[   18.085418] ff80: ce0c5ec0 ce1b8a60 00000000 c012ae47 ce1b8a00 
c012ad89 00000000 00000000
[   18.093658] ffa0: 00000000 00000000 00000000 c0100159 00000000 
00000000 00000000 00000000
[   18.101867] ffc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[   18.110076] ffe0: 00000000 00000000 00000000 00000000 00000013 
00000000 00000000 00000000
[   18.118316] (omap_gem_dma_sync_buffer) from omap_framebuffer_pin 
(/home/user/git/linux-omap/drivers/gpu/drm/omapdrm/omap_fb.c:237 
(discriminator 2))
[   18.127685] (omap_framebuffer_pin) from 
drm_atomic_helper_prepare_planes 
(/home/user/git/linux-omap/drivers/gpu/drm/drm_atomic_helper.c:2401 
/home/user/git/linux-omap/drivers/gpu/drm/drm_atomic_helper.c:2376)
[   18.137756] (drm_atomic_helper_prepare_planes) from 
drm_atomic_helper_commit 
(/home/user/git/linux-omap/drivers/gpu/drm/drm_atomic_helper.c:1820 
/home/user/git/linux-omap/drivers/gpu/drm/drm_atomic_helper.c:1796)
[   18.148162] (drm_atomic_helper_commit) from 
drm_client_modeset_commit_atomic 
(/home/user/git/linux-omap/./arch/arm/include/asm/atomic.h:224 
/home/user/git/linux-omap/./include/linux/atomic-fallback.h:276 
/home/user/git/linux-omap/./include/linux/refcount.h:266 
/home/user/git/linux-omap/./include/linux/refcount.h:294 
/home/user/git/linux-omap/./include/linux/kref.h:64 
/home/user/git/linux-omap/./include/drm/drm_atomic.h:437 
/home/user/git/linux-omap/drivers/gpu/drm/drm_client_modeset.c:1048)
[   18.158660] (drm_client_modeset_commit_atomic) from 
drm_client_modeset_commit_locked 
(/home/user/git/linux-omap/drivers/gpu/drm/drm_client_modeset.c:1148)
[   18.169769] (drm_client_modeset_commit_locked) from 
drm_client_modeset_commit 
(/home/user/git/linux-omap/drivers/gpu/drm/drm_client_modeset.c:1173)
[   18.180267] (drm_client_modeset_commit) from 
__drm_fb_helper_restore_fbdev_mode_unlocked 
(/home/user/git/linux-omap/drivers/gpu/drm/drm_fb_helper.c:238)
[   18.191741] (__drm_fb_helper_restore_fbdev_mode_unlocked) from 
drm_fb_helper_set_par 
(/home/user/git/linux-omap/drivers/gpu/drm/drm_fb_helper.c:1344)
[   18.202819] (drm_fb_helper_set_par) from fbcon_init 
(/home/user/git/linux-omap/drivers/video/fbdev/core/fbcon.c:1141)
[   18.211242] (fbcon_init) from visual_init 
(/home/user/git/linux-omap/drivers/tty/vt/vt.c:1075)
[   18.218597] (visual_init) from do_bind_con_driver 
(/home/user/git/linux-omap/drivers/tty/vt/vt.c:3659)
[   18.226837] (do_bind_con_driver) from do_take_over_console 
(/home/user/git/linux-omap/drivers/tty/vt/vt.c:4241)
[   18.235748] (do_take_over_console) from do_fbcon_takeover 
(/home/user/git/linux-omap/drivers/video/fbdev/core/fbcon.c:566)
[   18.244506] (do_fbcon_takeover) from register_framebuffer 
(/home/user/git/linux-omap/./include/linux/fb.h:641 
/home/user/git/linux-omap/drivers/video/fbdev/core/fbmem.c:1661 
/home/user/git/linux-omap/drivers/video/fbdev/core/fbmem.c:1828)
[   18.253417] (register_framebuffer) from 
__drm_fb_helper_initial_config_and_unlock 
(/home/user/git/linux-omap/drivers/gpu/drm/drm_fb_helper.c:1823)
[   18.264434] (__drm_fb_helper_initial_config_and_unlock) from 
omap_fbdev_init 
(/home/user/git/linux-omap/drivers/gpu/drm/omapdrm/omap_fbdev.c:258)
[   18.274841] (omap_fbdev_init) from pdev_probe 
(/home/user/git/linux-omap/drivers/gpu/drm/omapdrm/omap_drv.c:826 
/home/user/git/linux-omap/drivers/gpu/drm/omapdrm/omap_drv.c:902)
[   18.282745] (pdev_probe) from platform_drv_probe 
(/home/user/git/linux-omap/drivers/base/platform.c:748)
[   18.290710] (platform_drv_probe) from really_probe 
(/home/user/git/linux-omap/drivers/base/dd.c:562)
[   18.299011] (really_probe) from driver_probe_device 
(/home/user/git/linux-omap/drivers/base/dd.c:738)
[   18.307250] (driver_probe_device) from bus_for_each_drv 
(/home/user/git/linux-omap/drivers/base/bus.c:431)
[   18.315826] (bus_for_each_drv) from __device_attach 
(/home/user/git/linux-omap/drivers/base/dd.c:914)
[   18.324035] (__device_attach) from bus_probe_device 
(/home/user/git/linux-omap/drivers/base/bus.c:493)
[   18.332275] (bus_probe_device) from device_add 
(/home/user/git/linux-omap/drivers/base/core.c:2927)
[   18.340240] (device_add) from platform_device_add 
(/home/user/git/linux-omap/drivers/base/platform.c:598 (discriminator 3))
[   18.348358] (platform_device_add) from platform_device_register_full 
(/home/user/git/linux-omap/drivers/base/platform.c:721)
[   18.358093] (platform_device_register_full) from dss_bind 
(/home/user/git/linux-omap/drivers/gpu/drm/omapdrm/dss/dss.c:1319)
[   18.366821] (dss_bind) from try_to_bring_up_master 
(/home/user/git/linux-omap/drivers/base/component.c:257 
/home/user/git/linux-omap/drivers/base/component.c:234)
[   18.374969] (try_to_bring_up_master) from 
component_master_add_with_match 
(/home/user/git/linux-omap/drivers/base/component.c:494 
/home/user/git/linux-omap/drivers/base/component.c:467)
[   18.385101] (component_master_add_with_match) from dss_probe 
(/home/user/git/linux-omap/drivers/gpu/drm/omapdrm/dss/dss.c:1506)
[   18.394287] (dss_probe) from platform_drv_probe 
(/home/user/git/linux-omap/drivers/base/platform.c:748)
[   18.402160] (platform_drv_probe) from really_probe 
(/home/user/git/linux-omap/drivers/base/dd.c:562)
[   18.410491] (really_probe) from driver_probe_device 
(/home/user/git/linux-omap/drivers/base/dd.c:738)
[   18.418701] (driver_probe_device) from bus_for_each_drv 
(/home/user/git/linux-omap/drivers/base/bus.c:431)
[   18.427276] (bus_for_each_drv) from __device_attach 
(/home/user/git/linux-omap/drivers/base/dd.c:914)
[   18.435516] (__device_attach) from bus_probe_device 
(/home/user/git/linux-omap/drivers/base/bus.c:493)
[   18.443725] (bus_probe_device) from deferred_probe_work_func 
(/home/user/git/linux-omap/drivers/base/dd.c:116)
[   18.452758] (deferred_probe_work_func) from process_one_work 
(/home/user/git/linux-omap/./include/linux/jump_label.h:254 
/home/user/git/linux-omap/./include/linux/jump_label.h:264 
/home/user/git/linux-omap/./include/trace/events/workqueue.h:108 
/home/user/git/linux-omap/kernel/workqueue.c:2274)
[   18.461853] (process_one_work) from worker_thread 
(/home/user/git/linux-omap/kernel/workqueue.c:2416)
[   18.470092] (worker_thread) from kthread 
(/home/user/git/linux-omap/kernel/kthread.c:292)
[   18.477355] (kthread) from ret_from_fork 
(/home/user/git/linux-omap/arch/arm/kernel/entry-common.S:156)
[   18.484588] Exception stack(0xce1cffb0 to 0xce1cfff8)
[   18.489685] ffa0:                                     00000000 
00000000 00000000 00000000
[   18.497894] ffc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[   18.506103] ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
[ 18.512786] Code: f8d4 30f4 ea4f 0b86 (f853) 2026
All code
========
    0:	d4                   	(bad)
    1:	f8                   	clc
    2:	f4                   	hlt
    3:	30 4f ea             	xor    %cl,-0x16(%rdi)
    6:	86 0b                	xchg   %cl,(%rbx)
    8:*	53                   	push   %rbx		<-- trapping instruction
    9:	f8                   	clc
    a:	26                   	es
    b:	20                   	.byte 0x20

Code starting with the faulting instruction
===========================================
    0:	53                   	push   %rbx
    1:	f8                   	clc
    2:	26                   	es
    3:	20                   	.byte 0x20


Ivo
