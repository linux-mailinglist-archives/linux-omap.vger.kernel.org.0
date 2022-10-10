Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD68E5F9B9D
	for <lists+linux-omap@lfdr.de>; Mon, 10 Oct 2022 11:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbiJJJIn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 10 Oct 2022 05:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbiJJJIk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 10 Oct 2022 05:08:40 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035E94622E;
        Mon, 10 Oct 2022 02:08:39 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id r8-20020a1c4408000000b003c47d5fd475so2904528wma.3;
        Mon, 10 Oct 2022 02:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKgzXqCMHx5gfpkdet2EJ2jgRUlXxcBezlrjkwY4c3k=;
        b=TaVooOlygmhKK0iZ6bMCYsOXK+1i6HPUty5dXpEYmDUsUdorgNzZQpT00HbhLG5Xz0
         62dJGzkuvqUNMujNy/sCEQsUK4ZKfHDTuuaYLYhzZA5ptByMDTMyIcAFX4gYtFZNVI7N
         E1WHFMrjBuAPwc03jVW88ivqbDJ+1b82OXM9DNHKpA5C+Cas1KQ4YHQ8NrLnRcNysqYT
         qmiuK3CL0R6vMIIkjp8AQMjPvEB19UGnUkE9WTaTCStNxSrRWJw8CxIwzF9Ncbe/wxRp
         EoWZk0toPaTxBWJi3DFsWMGrZfgzgH16536rjp2IgY2U9j8lWNgMjPfCvRq4GjCQV370
         HCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nKgzXqCMHx5gfpkdet2EJ2jgRUlXxcBezlrjkwY4c3k=;
        b=4OVQ1J/Z4Ta76Ozf++IdqBjIYjTNebi5JpzCK/PDqWAgXaVlqdllOnbOaRjk+fBzof
         wLWTT9RA7citWRSTvYTnLYN7xIrxErhTXJ/QJrBneyAGBEemjPKbTzmScV4TBRQjQr66
         mt2wQSCR3pqjFg2UdNeNLaWH6eHZlYWRei3Aspow8XVgvw3/aNBf5wldRvssXRKxuV/X
         mTLJNb/RsDJpL10aqKd0NNlCrd96Qnb5eaVSeVUdSgu035IHMWsyRtmtENr51XMnNqeB
         /YGWPPuxqE28Bx0kY78KbRlvAIw5iOHdqMcTa+NOw+uFX6zIhfW5emX316blzKW1cY30
         ZzOA==
X-Gm-Message-State: ACrzQf0caQ3edZ7QB6wHAFGi8Yz2bK8tPNJgaJ+ZV8aI1JCkiMZWEhLB
        xanJCYFxUyF2fuJdNaHZ5dq5LNnOWTROJA==
X-Google-Smtp-Source: AMsMyM4xgj3racHcdGyLQ3hqepAdpsNrAqhWHFz6CAY2qn+4knwhoD6Kq0JzDg4d0G/uRjLAGXYYuA==
X-Received: by 2002:a1c:5446:0:b0:3c4:1854:abc0 with SMTP id p6-20020a1c5446000000b003c41854abc0mr8578290wmi.7.1665392917208;
        Mon, 10 Oct 2022 02:08:37 -0700 (PDT)
Received: from tp440p.steeds.sam ([69.63.64.50])
        by smtp.gmail.com with ESMTPSA id u11-20020a5d468b000000b0022add5a6fb1sm8267508wrq.30.2022.10.10.02.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 02:08:36 -0700 (PDT)
Date:   Mon, 10 Oct 2022 11:08:32 +0200
From:   Sicelo <absicsz@gmail.com>
To:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     Bin Liu <b-liu@ti.com>, Felipe Balbi <balbi@kernel.org>,
        maemo-leste@lists.dyne.org, phone-devel@vger.kernel.org
Subject: USB PHY Initialization Fails on Nokia N900 Since 5.19
Message-ID: <Y0PhEOl+MwlQ8HAD@tp440p.steeds.sam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

Since about kernel 5.19 onwards, usb/musb does not work properly on the
Nokia N900, with the following showing up in dmesg:

	[    1.389648] musb-hdrc musb-hdrc.0.auto: error -ENXIO: IRQ mc not found

resulting in the charger auto-detection (via isp1704_charger driver) and
usb gadgets not working due to absence of the usb phy as defined in dts:

	[   13.996551] isp1704_charger isp1707: isp1704_test_ulpi failed
	[   13.996612] isp1704_charger isp1707: failed to register isp1704 with error -22
	[   13.996643] isp1704_charger: probe of isp1707 failed with error -22

I have tried to bisect, but due to inexperience and lack of proper
tooling (e.g. no serial console), I have not been able to pinpoint the
cause of the error so far. However, on linux 6.0 with cf081d009c447647
reverted, there is a more detailed trace in dmesg - the same trace
appeared in other kernel versions while bisecting:


[    2.028228] Skipping twl internal clock init and using bootloader value (unknown osc rate)
[    2.042419] twl 1-0048: PIH (irq 23) chaining IRQs 145..153
[    2.048217] twl 1-0048: power (irq 150) chaining IRQs 153..160
[    2.120635] twl4030_gpio twl4030-gpio: gpio (irq 145) chaining IRQs 161..178
[    2.211456] twl4030_usb 48070000.i2c:twl@48:twl4030-usb: Initialized TWL4030 USB module
[    2.223114] input: twl4030_pwrbutton as /devices/platform/68000000.ocp/48070000.i2c/i2c-1/1-0048/48070000.i2c:twl@48:pwrbutton/input/input0
[    2.237854] input: TWL4030 Keypad as /devices/platform/68000000.ocp/48070000.i2c/i2c-1/1-0048/48070000.i2c:twl@48:keypad/input/input1
[    2.296508] omap_i2c 48070000.i2c: bus 1 rev3.3 at 2200 kHz
[    2.324401] bq2415x-charger 2-006b: automode supported, waiting for events
[    2.332580] bq2415x-charger 2-006b: driver registered
[    2.337860] omap_i2c 48072000.i2c: bus 2 rev3.3 at 100 kHz
[    2.346435] omap_i2c 48060000.i2c: bus 3 rev3.3 at 400 kHz
[    2.357330] ti-sysc 480cb024.target-module: sysc_flags 00000100 != 00000110
[    2.365631] smartreflex 480cb000.smartreflex: omap_sr_probe: SmartReflex driver initialized
[    2.375152] ti-sysc 480c9024.target-module: sysc_flags 00000100 != 00000110
[    2.383392] smartreflex 480c9000.smartreflex: omap_sr_probe: SmartReflex driver initialized
[    2.393707] omapdss_dss 48050000.dss: supply vdda_video not found, using dummy regulator
[    2.407470] ------------[ cut here ]------------
[    2.412170] WARNING: CPU: 0 PID: 25 at arch/arm/mach-omap2/omap_hwmod.c:1886 _enable+0x16f/0x170
[    2.421051] omap_hwmod: usb_otg_hs: enabled state can only be entered from initialized, idle, or disabled state
[    2.431182] Modules linked in:
[    2.434295] CPU: 0 PID: 25 Comm: kworker/u2:2 Not tainted 6.0.0-nokia-n900+ #1
[    2.441558] Hardware name: Nokia RX-51 board
[    2.445861] Workqueue: events_unbound deferred_probe_work_func
[    2.451782]  unwind_backtrace from show_stack+0xb/0xc
[    2.456909]  show_stack from dump_stack_lvl+0x2b/0x34
[    2.462036]  dump_stack_lvl from __warn+0xa1/0xf4
[    2.466827]  __warn from warn_slowpath_fmt+0x53/0x74
[    2.471832]  warn_slowpath_fmt from _enable+0x16f/0x170
[    2.477142]  _enable from omap_hwmod_enable+0x19/0x2c
[    2.482238]  omap_hwmod_enable from omap_device_enable+0x25/0x58
[    2.488342]  omap_device_enable from _od_runtime_resume+0xb/0x2c
[    2.494415]  _od_runtime_resume from __rpm_callback+0x33/0x104
[    2.500305]  __rpm_callback from rpm_callback+0x49/0x58
[    2.505584]  rpm_callback from rpm_resume+0x469/0x630
[    2.510711]  rpm_resume from __pm_runtime_resume+0x21/0x4c
[    2.516235]  __pm_runtime_resume from musb_probe+0x2b7/0x9f4
[    2.521972]  musb_probe from platform_probe+0x3d/0x78
[    2.527130]  platform_probe from really_probe+0x81/0x1d8
[    2.532501]  really_probe from __driver_probe_device+0x53/0x90
[    2.538391]  __driver_probe_device from driver_probe_device+0x2d/0xc8
[    2.544891]  driver_probe_device from __device_attach_driver+0x4f/0xa0
[    2.551513]  __device_attach_driver from bus_for_each_drv+0x4b/0x80
[    2.557830]  bus_for_each_drv from __device_attach+0x6b/0x118
[    2.563659]  __device_attach from bus_probe_device+0x55/0x5c
[    2.569366]  bus_probe_device from deferred_probe_work_func+0x51/0x74
[    2.575866]  deferred_probe_work_func from process_one_work+0x153/0x35c
[    2.582580]  process_one_work from worker_thread+0x221/0x3d4
[    2.588287]  worker_thread from kthread+0xad/0xc0
[    2.593048]  kthread from ret_from_fork+0x11/0x20
[    2.597808] Exception stack(0xd0085fb0 to 0xd0085ff8)
[    2.602905] 5fa0:                                     00000000 00000000 00000000 00000000
[    2.611145] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.619384] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.626068] ---[ end trace 0000000000000000 ]---
[    2.630920] musb-hdrc musb-hdrc.0.auto: use pm_runtime_put_sync_suspend() in driver?
[    2.658966] omap-dma-engine 48056000.dma-controller: OMAP DMA engine driver
[    2.667205] omapdss_dss 48050000.dss: supply vdda_video not found, using dummy regulator
[    2.693725] panel-sony-acx565akm spi0.2: acx565akm rev 8d panel detected
[    2.708526] omapdss_dss 48050000.dss: supply vdda_video not found, using dummy regulator
[    2.718780] DSS: OMAP DSS rev 2.0
[    2.725555] omapdss_dss 48050000.dss: bound 48050400.dispc (ops 0xc0755c14)
[    2.732849] omapdss_dss 48050000.dss: bound 48050c00.encoder (ops 0xc075718c)
[    2.740783] omapdrm omapdrm.0: DMM not available, disable DMM support
[    2.876770] Console: switching to colour frame buffer device 100x30
[    2.899505] omapdrm omapdrm.0: [drm] fb0: omapdrmdrmfb frame buffer device
[    2.908996] [drm] Initialized omapdrm 1.0.0 20110917 for omapdrm.0 on minor 0
[    2.920867] input: gpio_keys as /devices/platform/gpio_keys/input/input2
[    2.933471] Waiting for root device /dev/mmcblk0p2...
[    2.944427] mmc0: host does not support reading read-only switch, assuming write-enable
[    2.958496] mmc0: new high speed SDHC card at address aaaa
[    2.966064] mmcblk0: mmc0:aaaa SB16G 14.8 GiB
[    2.979248]  mmcblk0: p1 p2
[    3.012023] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Quota mode: none.
[    3.020904] VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
[    3.032135] devtmpfs: mounted
[    3.038482] Freeing unused kernel image (initmem) memory: 1024K
[    3.045288] Run /sbin/init as init process
[    3.049438]   with arguments:
[    3.052459]     /sbin/init
[    3.055206]     verbose
[    3.057678]     earlyprintk
[    3.060516]   with environment:
[    3.063720]     HOME=/
[    3.066101]     TERM=linux
[    3.495910] mmc1: switch to bus width 8 failed
[    3.504364] mmc1: switch to bus width 4 failed
[    3.508911] mmc1: new high speed MMC card at address 0001
[    3.518463] mmcblk1: mmc1:0001 MMC32G 29.8 GiB
[    3.536773]  mmcblk1: p1 p2 p3
[    3.549835] mmcblk1boot0: mmc1:0001 MMC32G 512 KiB
[    3.560150] mmcblk1boot1: mmc1:0001 MMC32G 512 KiB
[    9.548645] udevd[581]: starting version 3.2.11
[    9.600891] random: udevd: uninitialized urandom read (16 bytes read)
[    9.622772] random: udevd: uninitialized urandom read (16 bytes read)
[    9.637207] random: udevd: uninitialized urandom read (16 bytes read)
[    9.856475] udevd[581]: starting eudev-3.2.11
[   11.152282] omap_ssi 48058000.ssi-controller: ssi controller 0 initialized (1 ports)!
[   11.248077] omap_ssi_port 4805a000.ssi-port: ssi port 0 successfully initialized
[   11.297088] mc: Linux media interface: v0.10
[   11.551513] videodev: Linux video capture interface: v2.00
[   11.575164] st-accel-i2c 3-001d: supply vdd not found, using dummy regulator
[   11.575653] st-accel-i2c 3-001d: supply vddio not found, using dummy regulator
[   11.601226] twl4030_madc 48070000.i2c:twl@48:madc: supply vusb3v1 not found, using dummy regulator
[   11.604370] iio iio:device1: lis3lv02dl_accel: WhoAmI mismatch (0x3b).
[   11.605316] st-accel-i2c: probe of 3-001d failed with error -22
[   11.610137] et8ek8 3-003e: could not get clock
[   11.614166] et8ek8 3-003e: could not get clock
[   11.620147] input: twl4030:vibrator as /devices/platform/68000000.ocp/48070000.i2c/i2c-1/1-0048/48070000.i2c:twl@48:audio/twl4030-vibra/input/input3
[   11.637939] et8ek8 3-003e: could not get clock
[   11.640319] et8ek8 3-003e: could not get clock
[   11.875732] Bluetooth: Core ver 2.22
[   11.875976] NET: Registered PF_BLUETOOTH protocol family
[   11.876007] Bluetooth: HCI device and connection manager initialized
[   11.876037] Bluetooth: HCI socket layer initialized
[   11.876098] Bluetooth: L2CAP socket layer initialized
[   11.876159] Bluetooth: SCO socket layer initialized
[   11.980773] Bluetooth: HCI UART driver ver 2.3
[   11.980834] Bluetooth: HCI UART protocol H4 registered
[   11.980865] Bluetooth: HCI UART protocol BCSP registered
[   11.981109] Bluetooth: HCI UART protocol LL registered
[   11.981231] Bluetooth: HCI UART protocol Three-wire (H5) registered
[   11.981842] Bluetooth: HCI UART protocol Broadcom registered
[   12.106048] twl_rtc 48070000.i2c:twl@48:rtc: Enabling TWL-RTC
[   12.117828] twl_rtc 48070000.i2c:twl@48:rtc: registered as rtc0
[   12.118835] et8ek8 3-003e: could not get clock
[   12.144348] twl_rtc 48070000.i2c:twl@48:rtc: setting system clock to 2022-10-09T20:13:12 UTC (1665346392)
[   12.146606] et8ek8 3-003e: could not get clock
[   12.171386] et8ek8 3-003e: could not get clock
[   12.290863] et8ek8 3-003e: could not get clock
[   12.327453] tsl2563 2-0029: model 7, rev. 0
[   12.349700] et8ek8 3-003e: could not get clock
[   12.473937] omap-mailbox 48094000.mailbox: omap mailbox rev 0x40
[   12.475982] et8ek8 3-003e: could not get clock
[   12.649261] nokia-bluetooth serial0-0: Direct firmware load for nokia/bcmfw.bin failed with error -2
[   12.649322] nokia-bluetooth serial0-0: Falling back to sysfs fallback for: nokia/bcmfw.bin
[   12.733245] input: TSC2005 touchscreen as /devices/platform/68000000.ocp/48098000.spi/spi_master/spi0/spi0.0/input/input4
[   12.738037] et8ek8 3-003e: could not get clock
[   12.791809] et8ek8 3-003e: could not get clock
[   12.843292] et8ek8 3-003e: could not get clock
[   12.869140] et8ek8 3-003e: could not get clock
[   13.299072] omap3isp 480bc000.isp: supply vdd-csiphy1 not found, using dummy regulator
[   13.299621] omap3isp 480bc000.isp: supply vdd-csiphy2 not found, using dummy regulator
[   13.300201] omap3isp 480bc000.isp: Revision 2.0 found
[   13.301574] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
[   13.302398] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP CCP2 was not initialized!
[   13.303192] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP CSI2a was not initialized!
[   13.309600] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP CCDC was not initialized!
[   13.310241] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP preview was not initialized!
[   13.312164] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP resizer was not initialized!
[   13.325134] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP AEWB was not initialized!
[   13.325195] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP AF was not initialized!
[   13.325225] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP histogram was not initialized!
[   13.327239] et8ek8 3-003e: Consider updating driver et8ek8 to match on endpoints
[   13.366394] et8ek8 3-003e: meta_reglist version V14 03-June-2008
[   13.530609] omap_i2c 48072000.i2c: controller timed out
[   13.634216] si4713 2-0063: chip found @ 0xc6 (OMAP I2C adapter)
[   13.700683] lp5523x 2-0032: lp5523 Programmable led chip found
[   13.739868] omap-sham 480c3000.sham: hw accel on OMAP rev 0.9
[   13.763031] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[   13.781402] omap-sham 480c3000.sham: will run requests pump with realtime priority
[   13.870727] omap_wdt: OMAP Watchdog Timer Rev 0x31: initial timeout 60 sec
[   14.202880] 8<--- cut here ---
[   14.202911] Unhandled fault: external abort on non-linefetch (0x1028) at 0xfa0ab001
[   14.202941] [fa0ab001] *pgd=48011452(bad)
[   14.203002] Internal error: : 1028 [#1] SMP THUMB2
[   14.207824] Modules linked in: isp1704_charger(+) pwm_omap_dmtimer cpufreq_dt snd_soc_omap_mcbsp snd_soc_ti_sdma omap_wdt omap_sham crypto_engine cfg80211(+) omap3_isp videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common snd_soc_tlv320aic3x_i2c snd_soc_tlv320aic3x snd_soc_tpa6130a2 tsc2005 regmap_spi tsc200x_core snd_soc_core snd_pcm_dmaengine si4713 snd_pcm snd_timer omap_mailbox leds_lp5523 bq27xxx_battery_i2c leds_lp55xx_common bq27xxx_battery snd soundcore led_class tsl2563 twl4030_wdt rtc_twl hci_nokia hci_uart btbcm bluetooth pwm_twl_led twl4030_vibra et8ek8 pwm_twl ad5820 ff_memless v4l2_fwnode v4l2_async st_accel_i2c twl4030_madc st_sensors_i2c st_accel industrialio_triggered_buffer kfifo_buf ecdh_generic st_sensors ecc rfkill industrialio videodev libaes mc omap_ssi hsi
[   14.279235] CPU: 0 PID: 614 Comm: udevd Tainted: G        W          6.0.0-nokia-n900+ #1
[   14.287475] Hardware name: Nokia RX-51 board
[   14.291778] PC is at musb_default_readb+0x4/0x4c
[   14.296478] LR is at musb_ulpi_write+0x25/0x94
[   14.300964] pc : [<c053fc0c>]    lr : [<c053f86d>]    psr: 00000033
[   14.307250] sp : d0431d88  ip : 00000000  fp : 00000000
[   14.312530] r10: 0000017b  r9 : 00000016  r8 : 000000aa
[   14.317779] r7 : c1f87840  r6 : fa0ab000  r5 : c0bed1c8  r4 : c31831c0
[   14.324340] r3 : c053fc09  r2 : 00000000  r1 : 00000001  r0 : fa0ab000
[   14.330902] Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  ISA Thumb  Segment none
[   14.338287] Control: 50c5387d  Table: 82a64019  DAC: 00000051
[   14.344055] Register r0 information: 0-page vmalloc region starting at 0xfa000000 allocated at iotable_init+0x1/0xbe
[   14.354675] Register r1 information: non-paged memory
[   14.359771] Register r2 information: NULL pointer
[   14.364501] Register r3 information: non-slab/vmalloc memory
[   14.370239] Register r4 information: slab kmalloc-192 start c3183180 pointer offset 64 size 192
[   14.379028] Register r5 information: non-slab/vmalloc memory
[   14.384735] Register r6 information: 0-page vmalloc region starting at 0xfa000000 allocated at iotable_init+0x1/0xbe
[   14.395324] Register r7 information: slab kmalloc-512 start c1f87800 pointer offset 64 size 512
[   14.404144] Register r8 information: non-paged memory
[   14.409240] Register r9 information: non-paged memory
[   14.414306] Register r10 information: non-paged memory
[   14.419494] Register r11 information: NULL pointer
[   14.424316] Register r12 information: NULL pointer
[   14.429168] Process udevd (pid: 614, stack limit = 0x(ptrval))
[   14.435028] Stack: (0xd0431d88 to 0xd0432000)
[   14.439422] 1d80:                   c31831c0 c0bed1c8 c31831c0 c053f86d c053f849 c31831c0
[   14.447662] 1da0: c1f87840 00000000 c1a76810 c1a76800 c1d420c0 bfa09145 00000000 00000000
[   14.455902] 1dc0: 00000000 00000000 00000000 00000000 00000000 6d57280d 00000000 c1a76810
[   14.464141] 1de0: bfa0b014 00000000 c36c1838 c04c8739 c1a76810 00000000 bfa0b014 c04c6d1d
[   14.472381] 1e00: 00000000 c1a76810 bfa0b014 c1a76810 00000058 c04c6ec7 00000001 c0bebbfc
[   14.480621] 1e20: bfa0b014 c04c6f31 c1a76810 bfa0b014 c1a76854 00000000 c36c1838 c04c73bf
[   14.488861] 1e40: 00000000 bfa0b014 c04c7375 c04c590d d0431e70 c1833e58 c1a6d834 6d57280d
[   14.497070] 1e60: bfa0b014 c36c1800 c0b8ecf0 c04c6593 bfa0a1b4 bfa0b0cc bfa0b014 00000000
[   14.505310] 1e80: c1d420c0 0000017b 00000000 c04c7bfb bfa0b000 c0bb1620 bfa23001 c0101c4d
[   14.513549] 1ea0: 7fffffff c0278d35 00000000 00000000 00000000 00000000 6e72656b 00006c65
[   14.521789] 1ec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000008 00000000
[   14.530029] 1ee0: 00000000 bfa0b0c0 d0117000 6d57280d bfa0b0c0 c357ae80 b6f1af94 0000017b
[   14.538269] 1f00: c01002a0 c017b177 0000017b c01002a0 00000000 d0117000 b6f1af94 c017cba9
[   14.546508] 1f20: d0431f34 7fffffff 00000000 00000002 00000002 d0117000 d0117d81 d0118580
[   14.554748] 1f40: d0117000 00002ed8 d01198c0 d011973c d0118ea0 00003000 000030e0 00003bac
[   14.562957] 1f60: 00003193 00000000 00000000 00000000 00000000 00000000 00003b9c 00000024
[   14.571197] 1f80: 00000025 0000001d 00000016 00000015 00000000 6d57280d 00020000 00000000
[   14.579437] 1fa0: 0000017b c0100061 00020000 00000000 00000007 b6f1af94 00000000 b6f2c320
[   14.587677] 1fc0: 00020000 00000000 0000017b 0000017b b6ead110 00454974 00000000 00000000
[   14.595916] 1fe0: b6f1af94 beb71918 b6f15fe1 b6faa93e 40000030 00000007 00000000 00000000
[   14.604156]  musb_default_readb from musb_ulpi_write+0x25/0x94
[   14.610046]  musb_ulpi_write from isp1704_charger_probe+0xa9/0x308 [isp1704_charger]
[   14.617919]  isp1704_charger_probe [isp1704_charger] from platform_probe+0x3d/0x78
[   14.625610]  platform_probe from really_probe+0x81/0x1d8
[   14.630981]  really_probe from __driver_probe_device+0x53/0x90
[   14.636871]  __driver_probe_device from driver_probe_device+0x2d/0xc8
[   14.643371]  driver_probe_device from __driver_attach+0x4b/0xec
[   14.649353]  __driver_attach from bus_for_each_dev+0x3d/0x70
[   14.655059]  bus_for_each_dev from bus_add_driver+0xe7/0x154
[   14.660766]  bus_add_driver from driver_register+0x43/0xac
[   14.666320]  driver_register from do_one_initcall+0x35/0x150
[   14.672027]  do_one_initcall from do_init_module+0x33/0x158
[   14.677673]  do_init_module from sys_finit_module+0x71/0xa8
[   14.683319]  sys_finit_module from ret_fast_syscall+0x1/0x5c
[   14.689025] Exception stack(0xd0431fa8 to 0xd0431ff0)
[   14.694122] 1fa0:                   00020000 00000000 00000007 b6f1af94 00000000 b6f2c320
[   14.702362] 1fc0: 00020000 00000000 0000017b 0000017b b6ead110 00454974 00000000 00000000
[   14.710571] 1fe0: b6f1af94 beb71918 b6f15fe1 b6faa93e
[   14.715667] Code: f8b3 e7e5 b510 b082 (5c44) f645
[   14.720520] ---[ end trace 0000000000000000 ]---
[   14.725189] In-band Error seen by MPU  at address 0
[   14.730102] ------------[ cut here ]------------
[   14.734741] WARNING: CPU: 0 PID: 614 at drivers/bus/omap_l3_smx.c:152 omap3_l3_app_irq+0xf3/0xf8
[   14.743621] Modules linked in: isp1704_charger(+) pwm_omap_dmtimer cpufreq_dt snd_soc_omap_mcbsp snd_soc_ti_sdma omap_wdt omap_sham crypto_engine cfg80211(+) omap3_isp videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common snd_soc_tlv320aic3x_i2c snd_soc_tlv320aic3x snd_soc_tpa6130a2 tsc2005 regmap_spi tsc200x_core snd_soc_core snd_pcm_dmaengine si4713 snd_pcm snd_timer omap_mailbox leds_lp5523 bq27xxx_battery_i2c leds_lp55xx_common bq27xxx_battery snd soundcore led_class tsl2563 twl4030_wdt rtc_twl hci_nokia hci_uart btbcm bluetooth pwm_twl_led twl4030_vibra et8ek8 pwm_twl ad5820 ff_memless v4l2_fwnode v4l2_async st_accel_i2c twl4030_madc st_sensors_i2c st_accel industrialio_triggered_buffer kfifo_buf ecdh_generic st_sensors ecc rfkill industrialio videodev libaes mc omap_ssi hsi
[   14.815002] CPU: 0 PID: 614 Comm: udevd Tainted: G      D W          6.0.0-nokia-n900+ #1
[   14.823211] Hardware name: Nokia RX-51 board
[   14.827514]  unwind_backtrace from show_stack+0xb/0xc
[   14.832641]  show_stack from dump_stack_lvl+0x2b/0x34
[   14.837768]  dump_stack_lvl from __warn+0xa1/0xf4
[   14.842529]  __warn from warn_slowpath_fmt+0x3f/0x74
[   14.847534]  warn_slowpath_fmt from omap3_l3_app_irq+0xf3/0xf8
[   14.853424]  omap3_l3_app_irq from __handle_irq_event_percpu+0x3f/0x128
[   14.860137]  __handle_irq_event_percpu from handle_irq_event+0x35/0x60
[   14.866729]  handle_irq_event from handle_level_irq+0x73/0x108
[   14.872619]  handle_level_irq from generic_handle_domain_irq+0x17/0x20
[   14.879211]  generic_handle_domain_irq from generic_handle_arch_irq+0x27/0x34
[   14.886444]  generic_handle_arch_irq from call_with_stack+0xd/0x10
[   14.892669] ---[ end trace 0000000000000000 ]---


I would appreciate any pointers to track down this issue.

Regards
Sicelo Mhlongo
