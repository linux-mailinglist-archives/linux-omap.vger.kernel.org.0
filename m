Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7623184CF5
	for <lists+linux-omap@lfdr.de>; Wed,  7 Aug 2019 15:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388211AbfHGN3e (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 09:29:34 -0400
Received: from muru.com ([72.249.23.125]:56732 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387982AbfHGN3e (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 7 Aug 2019 09:29:34 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 42A988116;
        Wed,  7 Aug 2019 13:29:58 +0000 (UTC)
Date:   Wed, 7 Aug 2019 06:29:28 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tejun Heo <tj@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        ~@devbig004.ftw2.facebook.com, linux-kernel@vger.kernel.org,
        Andrea Arcangeli <aarcange@redhat.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] kernfs: fix memleak in kernel_ops_readdir()
Message-ID: <20190807132928.GD5443@atomide.com>
References: <20190805173404.GF136335@devbig004.ftw2.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805173404.GF136335@devbig004.ftw2.facebook.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Tejun Heo <tj@kernel.org> [691231 23:00]:
> From: Andrea Arcangeli <aarcange@redhat.com>
> 
> If getdents64 is killed or hits on segfault, it'll leave cgroups
> directories in sysfs pinned leaking memory because the kernfs node
> won't be freed on rmdir and the parent neither.

Somehow this causes a regression in Linux next for me where I'm seeing
lots of sysfs entries now missing under /sys/bus/platform/devices.

For example, I now only see one .serial entry show up in sysfs.
Things work again if I revert commit cc798c83898e ("kernfs: fix memleak
inkernel_ops_readdir()"). Any ideas why that would be?

Below is a diff -u of ls /sys/bus/platform/devices for reference
showing the missing entries with cc798c83898e.

Regards,

Tony

8< -----------------------
--- works
+++ fails
@@ -1,227 +1,44 @@
-2c000000.ethernet
 40100000.interconnect
-40100000.interconnect:segment@0
-40122000.mcbsp
-4012208c.target-module
-4012408c.target-module
 4012608c.target-module
-40128000.target-module
-4012c000.target-module
-4012e000.target-module
-40130000.target-module
-40130000.wdt
-40132000.target-module
 40138000.target-module
-40138000.timer
-4013a000.target-module
-4013a000.timer
-4013c000.target-module
-4013c000.timer
 4013e000.target-module
-4013e000.timer
-401f1000.target-module
-40304000.ocmcram
-44000000.ocp
-48000000.interconnect
-48000000.interconnect:segment@0
-48000000.interconnect:segment@200000
-48020000.serial
-48020050.target-module
-48032000.target-module
-48032000.timer
-48034000.target-module
-48034000.timer
-48036000.target-module
 48036000.timer
-4803e000.target-module
-4803e000.timer
 48055000.gpio
-48055000.target-module
-48057000.gpio
-48057000.target-module
-48059000.gpio
 48059000.target-module
-4805b000.gpio
-4805b000.target-module
-4805d000.gpio
 4805d000.target-module
-48060000.i2c
-48060000.target-module
-4806a000.serial
-4806a050.target-module
-4806c000.serial
-4806c050.target-module
 4806e000.serial
 4806e050.target-module
-48070000.i2c
 48070000.i2c:twl@48:gpadc
-48070000.i2c:twl@48:pwm
-48070000.i2c:twl@48:pwmled
-48070000.i2c:twl@48:regulator-v1v8
-48070000.i2c:twl@48:regulator-v2v1
 48070000.i2c:twl@48:regulator-vana
-48070000.i2c:twl@48:regulator-vaux1
-48070000.i2c:twl@48:regulator-vaux2
-48070000.i2c:twl@48:regulator-vaux3
 48070000.i2c:twl@48:regulator-vcxio
-48070000.i2c:twl@48:regulator-vdac
-48070000.i2c:twl@48:regulator-vmmc
-48070000.i2c:twl@48:regulator-vpp
-48070000.i2c:twl@48:regulator-vusb
-48070000.i2c:twl@48:regulator-vusim
-48070000.i2c:twl@48:rtc
 48070000.i2c:twl@48:usb-comparator
-48070000.target-module
-48072000.i2c
-48072000.target-module
-48076000.target-module
-48078000.target-module
-48086000.target-module
 48086000.timer
-48088000.target-module
-48088000.timer
-4809608c.target-module
-48098000.spi
-48098000.target-module
-4809a000.spi
 4809a000.target-module
-4809c000.mmc
 4809c000.target-module
-480a5000.des
-480ad000.target-module
-480b2000.1w
-480b2000.target-module
-480b4000.target-module
 480b8000.spi
-480b8000.target-module
-480ba000.spi
-480ba000.target-module
-480d1000.target-module
 480d5000.mmc
-480d5000.target-module
-48240600.local-timer
 48242000.l2-cache-controller
-48350000.i2c
-48350000.target-module
-4a000000.interconnect
-4a000000.interconnect:segment@0
-4a000000.interconnect:segment@100000
-4a000000.interconnect:segment@180000
-4a000000.interconnect:segment@200000
-4a000000.interconnect:segment@280000
 4a000000.interconnect:segment@300000
 4a000000.interconnect:segment@80000
-4a002000.scm
-4a002000.scm_conf
-4a002000.target-module
-4a002260.bandgap
-4a002300.control-phy
-4a00233c.control-phy
-4a004000.cm1
-4a004000.target-module
-4a004300.mpuss_cm
-4a004400.tesla_cm
-4a004500.abe_cm
-4a008000.cm2
-4a008000.target-module
-4a008600.l4_ao_cm
-4a008700.l3_1_cm
-4a008800.l3_2_cm
-4a008900.ducati_cm
-4a008a00.l3_dma_cm
 4a008b00.l3_emif_cm
 4a008c00.d2d_cm
-4a008d00.l4_cfg_cm
 4a008e00.l3_instr_cm
-4a008f00.ivahd_cm
-4a009000.iss_cm
-4a009100.l3_dss_cm
-4a009200.l3_gfx_cm
-4a009300.l3_init_cm
-4a009400.l4_per_cm
-4a056000.dma-controller
 4a056000.target-module
-4a058000.hsi
-4a058000.target-module
 4a062000.target-module
-4a062000.usbhstll
-4a064000.target-module
 4a064000.usbhshost
 4a064800.ohci
-4a064c00.ehci
-4a066000.mmu
-4a0ab000.usb_otg_hs
 4a0ab400.target-module
-4a0ad000.ocp2scp
-4a0ad000.target-module
 4a0ad080.usb2phy
-4a0d9000.smartreflex
-4a0d9038.target-module
 4a0db000.smartreflex
-4a0db038.target-module
-4a0dd000.smartreflex
-4a0dd038.target-module
-4a0f4000.mailbox
-4a0f4000.target-module
-4a0f6000.spinlock
-4a0f6000.target-module
 4a100000.target-module
 4a100040.pinmux
-4a1005a0.omap4_padconf_global
-4a100600.pbias_regulator
-4a10a000.target-module
-4a300000.interconnect
-4a300000.interconnect:segment@0
-4a300000.interconnect:segment@10000
 4a300000.interconnect:segment@20000
-4a306000.prm
-4a306000.target-module
-4a307bd0.regulator-abb-mpu
 4a30a000.scrm
-4a30a000.target-module
-4a30c000.target-module
 4a30c000.target-module:scm@c000
-4a310000.gpio
-4a310000.target-module
 4a314000.target-module
-4a314000.wdt
-4a31c000.keypad
-4a31c000.target-module
-4a31e000.target-module
-4a31e040.pinmux
 4b100000.sham
-4b501000.aes
 4b701000.aes
 4c000000.emif
-4d000000.emif
-4e000000.dmm
-50000000.gpmc
-52000000.target-module
-55082000.mmu
-5601fc00.target-module
-58000000.dss
-Fixed MDIO bus.0
-a0080000.ramoops
-alarmtimer
-connector
-cpufreq-dt
 gpio_keys
-hsusb1_phy
-leds
-omap_dma_system.0
-oprofile-perf.0
-pmu
 reg-dummy
-regulator-vdd33a
-regulator-vddvario
-serial8250
-soc
-soc:dsp
-soc:iva
-soc:mpu
-sound
-twl
-twl6040-codec
-twl6040-gpo
-twl6040-pdmclk
 w2cbw0015_vmmc
