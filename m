Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF929156CC2
	for <lists+linux-omap@lfdr.de>; Sun,  9 Feb 2020 22:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgBIVe3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 9 Feb 2020 16:34:29 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:55136 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726658AbgBIVe3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 9 Feb 2020 16:34:29 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 76BA71C210C; Sun,  9 Feb 2020 22:34:24 +0100 (CET)
Date:   Sun, 9 Feb 2020 22:34:22 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        martin_rysavy@centrum.cz
Subject: 5.6-rc0.95: /dev/motmdm no longer there
Message-ID: <20200209213422.GA3009@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

5.6-rc0.95 -- based on:

commit fdfa3a6778b194974df77b384cc71eb2e503639a
Merge: 291abfea4746 e0a514259378
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Feb 8 17:24:41 2020 -0800

    Merge tag 'scsi-misc' of
    git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi


/dev/motmdm* is not there for me. Unfortunately,
drivers/mfd/motorola-mdm.c is not mainline, so I can't just try with
the mainline....

Does it work for you?

I have ... rather a lot of warnings in dmesg :-(. /dev/ttyUSB4 works
ok for me.

Can I somehow help get /dev/motmdmX upstream?

Best regards,
								Pavel

[    1.048980] gpiochip_setup_dev: registered GPIOs 0 to 31 on device:
gpiochip1 (gpio-0-31)
[    1.057495] OMAP GPIO hardware version 0.1
[    1.070434] omap-dma-engine 4a056000.dma-controller: WARN: Device
release is not defined so it is not safe to unbind this driver while
in use
[    1.089538] omap-dma-engine 4a056000.dma-controller: OMAP DMA
engine driver (LinkedList1/2/3 supported)
[    1.106231] omap-mailbox 4a0f4000.mailbox: omap mailbox rev 0x400
[    1.117401] gpio gpiochip2: (gpio-32-63): added GPIO chardev
(254:2)
=2E.
[    1.459411] mtdoops: mtd device (mtddev=3Dname/number) must be
supplied
[    1.468475] cpcap-core spi0.0: CPCAP vendor: ST rev: 2.10 (1a)
[    1.478942] cpcap-regulator cpcap-regulator.0: DMA mask not set
[    1.485137] SW5: Bringing 0uV into 5050000-5050000uV
[    1.490386] ------------[ cut here ]------------
[    1.495117] WARNING: CPU: 0 PID: 1 at
/data/fast/l/k/drivers/base/regmap/regmap.c:2875
_regmap_update_bits+0x118/0x124
[    1.505889] Modules linked in:
[    1.508972] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
5.5.0-13279-g0d9b337280e8 #125
[    1.516754] Hardware name: Generic OMAP4 (Flattened Device Tree)
[    1.522827] [<c010f2e4>] (unwind_backtrace) from [<c010b578>]
(show_stack+0x10/0x14)
[    1.530609] [<c010b578>] (show_stack) from [<c08fef98>]
(dump_stack+0xb4/0xd4)
[    1.537902] [<c08fef98>] (dump_stack) from [<c012d464>]
(__warn+0xc8/0xf0)
[    1.544830] [<c012d464>] (__warn) from [<c012d518>]
(warn_slowpath_fmt+0x8c/0x94)
[    1.552337] [<c012d518>] (warn_slowpath_fmt) from [<c04f6024>]
(_regmap_update_bits+0x118/0x124)
[    1.561187] [<c04f6024>] (_regmap_update_bits) from [<c04f6f94>]
(regmap_update_bits_base+0x50/0x74)
[    1.570373] [<c04f6f94>] (regmap_update_bits_base) from
[<c042e648>] (regulator_enable_regmap+0x48/0x5c)
[    1.579925] [<c042e648>] (regulator_enable_regmap) from
[<c04302c8>] (cpcap_regulator_enable+0x1c/0x78)
[    1.589385] [<c04302c8>] (cpcap_regulator_enable) from [<c0429dbc>]
(_regulator_do_enable+0x118/0x154)
[    1.598754] [<c0429dbc>] (_regulator_do_enable) from [<c042cc9c>]
(regulator_register+0x6f0/0x1090)
[    1.607849] [<c042cc9c>] (regulator_register) from [<c042f02c>]
(devm_regulator_register+0x3c/0x70)
[    1.616943] [<c042f02c>] (devm_regulator_register) from
[<c04303d8>] (cpcap_regulator_probe+0xb4/0x118)
[    1.626403] [<c04303d8>] (cpcap_regulator_probe) from [<c04e1c64>]
(platform_drv_probe+0x48/0x98)
[    1.635314] [<c04e1c64>] (platform_drv_probe) from [<c04e0220>]
(really_probe+0x1dc/0x32c)
[    1.643646] [<c04e0220>] (really_probe) from [<c04e0540>]
(driver_probe_device+0x5c/0x168)
[    1.651947] [<c04e0540>] (driver_probe_device) from [<c04de7d4>]
(bus_for_each_drv+0x44/0x8c)
[    1.660522] [<c04de7d4>] (bus_for_each_drv) from [<c04e0458>]
(__device_attach+0x9c/0x104)
[    1.668823] [<c04e0458>] (__device_attach) from [<c04df4f8>]
(bus_probe_device+0x84/0x8c)
[    1.677062] [<c04df4f8>] (bus_probe_device) from [<c04dd6b4>]
(device_add+0x594/0x6fc)
[    1.685028] [<c04dd6b4>] (device_add) from [<c04e1e3c>]
(platform_device_add+0xf0/0x208)
[    1.693176] [<c04e1e3c>] (platform_device_add) from [<c050a1a4>]
(mfd_add_devices+0x304/0x3bc)
[    1.701843] [<c050a1a4>] (mfd_add_devices) from [<c050a2bc>]
(devm_mfd_add_devices+0x60/0x9c)
[    1.710418] [<c050a2bc>] (devm_mfd_add_devices) from [<c050a6b0>]
(cpcap_probe+0x1cc/0x26c)
[    1.718841] [<c050a6b0>] (cpcap_probe) from [<c0553660>]
(spi_drv_probe+0x80/0xa0)
[    1.726440] [<c0553660>] (spi_drv_probe) from [<c04e0220>]
(really_probe+0x1dc/0x32c)
[    1.734313] [<c04e0220>] (really_probe) from [<c04e0540>]
(driver_probe_device+0x5c/0x168)
[    1.742645] [<c04e0540>] (driver_probe_device) from [<c04de7d4>]
(bus_for_each_drv+0x44/0x8c)
[    1.751220] [<c04de7d4>] (bus_for_each_drv) from [<c04e0458>]
(__device_attach+0x9c/0x104)
[    1.759521] [<c04e0458>] (__device_attach) from [<c04df4f8>]
(bus_probe_device+0x84/0x8c)
[    1.767761] [<c04df4f8>] (bus_probe_device) from [<c04dd6b4>]
(device_add+0x594/0x6fc)
[    1.775726] [<c04dd6b4>] (device_add) from [<c05541e4>]
(spi_add_device+0x8c/0x150)
[    1.783416] [<c05541e4>] (spi_add_device) from [<c0554c8c>]
(spi_register_controller+0x788/0xb08)
[    1.792358] [<c0554c8c>] (spi_register_controller) from
[<c055503c>] (devm_spi_register_controller+0x30/0x6c)
[    1.802307] [<c055503c>] (devm_spi_register_controller) from
[<c0558d88>] (omap2_mcspi_probe+0x2f8/0x418)
[    1.811950] [<c0558d88>] (omap2_mcspi_probe) from [<c04e1c64>]
(platform_drv_probe+0x48/0x98)
[    1.820526] [<c04e1c64>] (platform_drv_probe) from [<c04e0220>]
(really_probe+0x1dc/0x32c)
[    1.828826] [<c04e0220>] (really_probe) from [<c04e0540>]
(driver_probe_device+0x5c/0x168)
[    1.837158] [<c04e0540>] (driver_probe_device) from [<c04e07f4>]
(device_driver_attach+0x58/0x60)
[    1.846069] [<c04e07f4>] (device_driver_attach) from [<c04e087c>]
(__driver_attach+0x80/0xbc)
[    1.854644] [<c04e087c>] (__driver_attach) from [<c04de874>]
(bus_for_each_dev+0x58/0x7c)
[    1.862854] [<c04de874>] (bus_for_each_dev) from [<c04df6b4>]
(bus_add_driver+0xcc/0x1c8)
[    1.871093] [<c04df6b4>] (bus_add_driver) from [<c04e1058>]
(driver_register+0x7c/0x110)
[    1.879241] [<c04e1058>] (driver_register) from [<c01028c8>]
(do_one_initcall+0x70/0x1b4)
[    1.887481] [<c01028c8>] (do_one_initcall) from [<c0e00f70>]
(kernel_init_freeable+0x130/0x1e0)
[    1.896209] [<c0e00f70>] (kernel_init_freeable) from [<c09189e4>]
(kernel_init+0x8/0x110)
[    1.904449] [<c09189e4>] (kernel_init) from [<c01010e8>]
(ret_from_fork+0x14/0x2c)
[    1.912048] Exception stack(0xee88ffb0 to 0xee88fff8)
[    1.917144] ffa0:                                     00000000
00000000 00000000 00000000
[    1.925354] ffc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    1.933593] ffe0: 00000000 00000000 00000000 00000000 00000013
00000000
[    1.940307] ---[ end trace 28755eeb13d0b2c9 ]---
[    2.016540] VRF2: Bringing 0uV into 2775000-2775000uV
[    2.303924] cpcap-usb-phy cpcap-usb-phy.0: DMA mask not set
[    2.311218] cpcap-usb-phy cpcap-usb-phy.0: GPIO lookup for consumer
mode
[    2.317962] cpcap-usb-phy cpcap-usb-phy.0: using device tree for
GPIO lookup
[    2.325103] of_get_named_gpiod_flags: parsed 'mode-gpios' property
of node
'/ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/phy[=
0]'
- status (0)
[    2.340087] gpio gpiochip2: Persistence not supported for GPIO 28
[    2.346252] cpcap-usb-phy cpcap-usb-phy.0: GPIO lookup for consumer
mode
[    2.352996] cpcap-usb-phy cpcap-usb-phy.0: using device tree for
GPIO lookup
[    2.360107] of_get_named_gpiod_flags: parsed 'mode-gpios' property
of node
'/ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/phy[=
1]'
- status (0)
[    2.375091] gpio gpiochip1: Persistence not supported for GPIO 0
[    2.381164] cpcap-usb-phy cpcap-usb-phy.0: could not initialize
VBUS or ID IIO: -517
[    2.389038] ------------[ cut here ]------------
[    2.393707] WARNING: CPU: 0 PID: 1 at
/data/fast/l/k/drivers/regulator/core.c:2051 _regulator_put+0xf0/0xfc
[    2.403533] Modules linked in:
[    2.406616] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W
5.5.0-13279-g0d9b337280e8 #125
[    2.415802] Hardware name: Generic OMAP4 (Flattened Device Tree)
[    2.421844] [<c010f2e4>] (unwind_backtrace) from [<c010b578>]
(show_stack+0x10/0x14)
[    2.429626] [<c010b578>] (show_stack) from [<c08fef98>]
(dump_stack+0xb4/0xd4)
[    2.436920] [<c08fef98>] (dump_stack) from [<c012d464>]
(__warn+0xc8/0xf0)
[    2.443817] [<c012d464>] (__warn) from [<c012d518>]
(warn_slowpath_fmt+0x8c/0x94)
[    2.451354] [<c012d518>] (warn_slowpath_fmt) from [<c0428f8c>]
(_regulator_put+0xf0/0xfc)
[    2.459594] [<c0428f8c>] (_regulator_put) from [<c0428fb4>]
(regulator_put+0x1c/0x2c)
[    2.467468] [<c0428fb4>] (regulator_put) from [<c04e3fe0>]
(release_nodes+0x1b4/0x244)
[    2.475433] [<c04e3fe0>] (release_nodes) from [<c04e0150>]
(really_probe+0x10c/0x32c)
[    2.483306] [<c04e0150>] (really_probe) from [<c04e0540>]
(driver_probe_device+0x5c/0x168)
[    2.491638] [<c04e0540>] (driver_probe_device) from [<c04de7d4>]
(bus_for_each_drv+0x44/0x8c)
[    2.500213] [<c04de7d4>] (bus_for_each_drv) from [<c04e0458>]
(__device_attach+0x9c/0x104
)
[    2.508514] [<c04e0458>] (__device_attach) from [<c04df4f8>]
(bus_probe_device+0x84/0x8c)
[    2.516754] [<c04df4f8>] (bus_probe_device) from [<c04dd6b4>]
(device_add+0x594/0x6fc)
[    2.524719] [<c04dd6b4>] (device_add) from [<c04e1e3c>]
(platform_device_add+0xf0/0x208)
[    2.532867] [<c04e1e3c>] (platform_device_add) from [<c050a1a4>]
(mfd_add_devices+0x304/0x3bc)
[    2.541534] [<c050a1a4>] (mfd_add_devices) from [<c050a2bc>]
(devm_mfd_add_devices+0x60/0x9c)
[    2.550109] [<c050a2bc>] (devm_mfd_add_devices) from [<c050a6b0>]
(cpcap_probe+0x1cc/0x26c)
[    2.558502] [<c050a6b0>] (cpcap_probe) from [<c0553660>]
(spi_drv_probe+0x80/0xa0)
[    2.566131] [<c0553660>] (spi_drv_probe) from [<c04e0220>]
(really_probe+0x1dc/0x32c)
[    2.574005] [<c04e0220>] (really_probe) from [<c04e0540>]
(driver_probe_device+0x5c/0x168)
[    2.582305] [<c04e0540>] (driver_probe_device) from [<c04de7d4>]
(bus_for_each_drv+0x44/0x8c)
[    2.590881] [<c04de7d4>] (bus_for_each_drv) from [<c04e0458>]
(__device_attach+0x9c/0x104)
[    2.599182] [<c04e0458>] (__device_attach) from [<c04df4f8>]
(bus_probe_device+0x84/0x8c)
[    2.607421] [<c04df4f8>] (bus_probe_device) from [<c04dd6b4>]
(device_add+0x594/0x6fc)
[    2.615386] [<c04dd6b4>] (device_add) from [<c05541e4>]
(spi_add_device+0x8c/0x150)
[    2.623077] [<c05541e4>] (spi_add_device) from [<c0554c8c>]
(spi_register_controller+0x788/0xb08)
[    2.632019] [<c0554c8c>] (spi_register_controller) from
[<c055503c>] (devm_spi_register_controller+0x30/0x6c)
[    2.641998] [<c055503c>] (devm_spi_register_controller) from
[<c0558d88>] (omap2_mcspi_probe+0x2f8/0x418)
[    2.651611] [<c0558d88>] (omap2_mcspi_probe) from [<c04e1c64>]
(platform_drv_probe+0x48/0x98)
[    2.660186] [<c04e1c64>] (platform_drv_probe) from [<c04e0220>]
(really_probe+0x1dc/0x32c)
[    2.668487] [<c04e0220>] (really_probe) from [<c04e0540>]
(driver_probe_device+0x5c/0x168)
[    2.676818] [<c04e0540>] (driver_probe_device) from [<c04e07f4>]
(device_driver_attach+0x58/0x60)
[    2.685729] [<c04e07f4>] (device_driver_attach) from [<c04e087c>]
(__driver_attach+0x80/0xbc)
[    2.694305] [<c04e087c>] (__driver_attach) from [<c04de874>]
(bus_for_each_dev+0x58/0x7c)
[    2.702545] [<c04de874>] (bus_for_each_dev) from [<c04df6b4>]
(bus_add_driver+0xcc/0x1c8)
[    2.710754] [<c04df6b4>] (bus_add_driver) from [<c04e1058>]
(driver_register+0x7c/0x110)
[    2.718902] [<c04e1058>] (driver_register) from [<c01028c8>]
(do_one_initcall+0x70/0x1b4)
[    2.727142] [<c01028c8>] (do_one_initcall) from [<c0e00f70>]
(kernel_init_freeable+0x130/0x1e0)
[    2.735870] [<c0e00f70>] (kernel_init_freeable) from [<c09189e4>]
(kernel_init+0x8/0x110)
[    2.744110] [<c09189e4>] (kernel_init) from [<c01010e8>]
(ret_from_fork+0x14/0x2c)
[    2.751708] Exception stack(0xee88ffb0 to 0xee88fff8)
[    2.756805] ffa0:                                     00000000
00000000 00000000 00000000
[    2.765014] ffc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    2.773254] ffe0: 00000000 00000000 00000000 00000000 00000013
00000000
[    2.779937] ---[ end trace 28755eeb13d0b2ca ]---
[    2.788787] SSI protocol aka McSAAB added
[    2.792938] CMT speech driver added
[    2.796478] HSI/SSI char device loaded
[    2.800689] mdio_bus fixed-0: GPIO lookup for consumer reset
[    2.806457] mdio_bus fixed-0: using lookup tables for GPIO lookup
[    2.812622] mdio_bus fixed-0: No GPIO consumer reset found
[    2.818145] libphy: Fixed MDIO Bus: probed
[    2.822631] usbcore: registered new interface driver qmi_wwan
[    2.828430] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.834686] ohci-platform: OHCI generic platform driver
[    2.840972] usbcore: registered new interface driver cdc_wdm
[    2.846740] usbcore: registered new interface driver option
[    2.852386] usbserial: USB Serial support registered for GSM modem
(1-port)
[    2.859405] usbcore: registered new interface driver qcaux
[    2.864959] usbserial: USB Serial support registered for qcaux
[    2.870880] usbcore: registered new interface driver qcserial
=2E..
[    5.156738] lm3532-led 0-0038: GPIO lookup for consumer enable
[    5.162658] lm3532-led 0-0038: using device tree for GPIO lookup
[    5.168762] of_get_named_gpiod_flags: parsed 'enable-gpios'
property of node
'/ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/led-control=
ler@38[0]'
- status (0)
[    5.184600] gpio gpiochip6: Persistence not supported for GPIO 12
[    5.190795] lm3532-led 0-0038: 0-0038 supply vin not found, using
dummy regulator
[    5.201293] ledtrig-cpu: registered to indicate activity on CPUs
[    5.209869] clk: failed to reparent abe_cm:clk:0060:24 to
sys_clkin_ck: -22
[    5.218139] cpcap_adc cpcap_adc.0: DMA mask not set
[    5.301208] cpcap_adc cpcap_adc.0: CPCAP ADC device probed
[    5.307952] isl29028 1-0044: No cache defaults, reading back from
HW
=2E..
[    5.539703] Registering SWP/SWPB emulation handler
[    5.545074] omap4_vc_i2c_timing_init: using bootloader low-speed
timings
[    5.551910] Power Management for TI OMAP4+ devices.
[    5.556793] OMAP4 PM: u-boot >=3D v2012.07 is required for full PM
support
[    5.563720] SmartReflex Class3 initialized
[    5.568298] Loading compiled-in X.509 certificates
[    5.598266] dmm 4e000000.dmm: initialized all PAT entries
[    5.604797] reg-fixed-voltage regulator-hdmi: GPIO lookup for
consumer (null)
[    5.612060] reg-fixed-voltage regulator-hdmi: using device tree for
GPIO lookup
=2E..
[    5.682647] lcd: supplied by SW5
[    5.686096] reg-fixed-voltage regulator-wl12xx: GPIO lookup for
consumer (null)
[    5.693603] reg-fixed-voltage regulator-wl12xx: using device tree
for GPIO lookup
[    5.701171] of_get_named_gpiod_flags: can't parse 'gpios' property
of node '/regulator-wl12xx[0]'
[    5.710083] of_get_named_gpiod_flags: parsed 'gpio' property of
node '/regulator-wl12xx[0]' - status (0)
[    5.719726] gpio gpiochip3: Persistence not supported for GPIO 30
[    5.727386] omap-iommu 4a066000.mmu: 4a066000.mmu registered
[    5.733428] omap-iommu 55082000.mmu: 55082000.mmu registered
[    5.739868] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for
consumer enable
[    5.746887] phy-mapphone-mdm6600 usb-phy@1: using device tree for
GPIO lookup
[    5.754089] of_get_named_gpiod_flags: parsed 'enable-gpios'
property of node '/usb-phy@1[0]' - status (0)
[    5.763763] gpio gpiochip3: Persistence not supported for GPIO 31
[    5.769683] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for
consumer power
[    5.776824] phy-mapphone-mdm6600 usb-phy@1: using device tree for
GPIO lookup
[    5.784057] of_get_named_gpiod_flags: parsed 'power-gpios' property
of node '/usb-phy@1[0]' - status (0)
[    5.793609] gpio gpiochip2: Persistence not supported for GPIO 22
[    5.799743] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for
consumer reset
[    5.806701] phy-mapphone-mdm6600 usb-phy@1: using device tree for
GPIO lookup
[    5.813903] of_get_named_gpiod_flags: parsed 'reset-gpios' property
of node '/usb-phy@1[0]' - status (0)
[    5.823455] gpio gpiochip2: Persistence not supported for GPIO 17
[    5.824768] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for
consumer motorola,mode
[    5.837371] phy-mapphone-mdm6600 usb-phy@1: using device tree for
GPIO lookup
[    5.844573] of_get_named_gpiod_flags: parsed 'motorola,mode-gpios'
property of node '/usb-phy@1[0]' - status (0)
[    5.854888] gpio gpiochip5: Persistence not supported for GPIO 20
[    5.861022] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for
consumer motorola,mode
[    5.868652] phy-mapphone-mdm6600 usb-phy@1: using device tree for
GPIO lookup
[    5.875854] of_get_named_gpiod_flags: parsed 'motorola,mode-gpios'
property of node '/usb-phy@1[1]' - status (0)
[    5.886108] gpio gpiochip5: Persistence not supported for GPIO 21
[    5.892272] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for
consumer motorola,status
[    5.900085] phy-mapphone-mdm6600 usb-phy@1: using device tree for
GPIO lookup
[    5.907287] of_get_named_gpiod_flags: parsed
'motorola,status-gpios' property of node '/usb-phy@1[0]' - status (0)
[    5.917724] gpio gpiochip2: Persistence not supported for GPIO 20
[    5.923858] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for
consumer motorola,status
[    5.931671] phy-mapphone-mdm6600 usb-phy@1: using device tree for
GPIO lookup
[    5.938842] of_get_named_gpiod_flags: parsed
'motorola,status-gpios' property of node '/usb-phy@1[1]' - status (0)
[    5.949310] gpio gpiochip2: Persistence not supported for GPIO 21
[    5.955444] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for
consumer motorola,status
[    5.963256] phy-mapphone-mdm6600 usb-phy@1: using device tree for
GPIO lookup
[    5.970458] of_get_named_gpiod_flags: parsed
'motorola,status-gpios' property of node '/usb-phy@1[2]' - status (0)
[    5.980895] gpio gpiochip2: Persistence not supported for GPIO 23
[    5.987030] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for
consumer motorola,cmd
[    5.994567] phy-mapphone-mdm6600 usb-phy@1: using device tree for
GPIO lookup
[    6.001800] of_get_named_gpiod_flags: parsed 'motorola,cmd-gpios'
property of node '/usb-phy@1[0]' - status (0)
[    6.011962] gpio gpiochip4: Persistence not supported for GPIO 7
[    6.015472] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for
consumer motorola,cmd
[    6.025543] phy-mapphone-mdm6600 usb-phy@1: using device tree for
GPIO lookup
[    6.032745] of_get_named_gpiod_flags: parsed 'motorola,cmd-gpios'
property of node '/usb-phy@1[1]' - status (0)
[    6.042938] gpio gpiochip4: Persistence not supported for GPIO 8
[    6.048980] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for
consumer motorola,cmd
[    6.056518] phy-mapphone-mdm6600 usb-phy@1: using device tree for
GPIO lookup
[    6.063720] of_get_named_gpiod_flags: parsed 'motorola,cmd-gpios'
property of node '/usb-phy@1[2]' - status (0)
[    6.073913] gpio gpiochip5: Persistence not supported for GPIO 14
[   10.660766] phy-mapphone-mdm6600 usb-phy@1: Waiting for power up
request to complete..
[   11.009033] dmtimer_probe
[   11.011993] dmtimer_probe: have timer
[   11.015869] dmtimer: have timer-pwm
[   11.019775] dmtimer: registering pwm
[   11.023803] dmtimer: all good
[   11.023803] dmtimer_probe
[   11.029632] dmtimer_probe: have timer
[   11.033325] dmtimer: have timer-pwm
[   11.036987] dmtimer: registering pwm
[   11.040649] dmtimer: all good
[   11.045196] panel-dsi-cm 58004000.encoder:display: GPIO lookup for
consumer reset
[   11.045196] panel-dsi-cm 58004000.encoder:display: using device
tree for GPIO lookup
[   11.060791] of_get_named_gpiod_flags: parsed 'reset-gpios' property
of node '/ocp/dss@58000000/encoder@58004000/display[0]' - status (0)
[   11.073181] gpio gpiochip4: Persistence not supported for GPIO 5
[   11.079223] panel-dsi-cm 58004000.encoder:display: GPIO lookup for
consumer te
[   11.086517] panel-dsi-cm 58004000.encoder:display: using device
tree for GPIO lookup
[   11.094329] of_get_named_gpiod_flags: can't parse 'te-gpios'
property of node '/ocp/dss@58000000/encoder@58004000/display[0]'
[   11.105712] of_get_named_gpiod_flags: can't parse 'te-gpio'
property of node '/ocp/dss@58000000/encoder@58004000/display[0]'
[   11.117065] panel-dsi-cm 58004000.encoder:display: using lookup
tables for GPIO lookup
[   11.125030] panel-dsi-cm 58004000.encoder:display: No GPIO consumer
te found
[   11.154144] omapdss_dss 58000000.dss: bound 58001000.dispc (ops
dispc_component_ops)
[   11.162109] omapdss_dss 58000000.dss: bound 58004000.encoder (ops
dsi_component_ops)
[   11.170745] omap-hdmi-audio omap-hdmi-audio.1.auto:
snd-soc-dummy-dai <-> 58006000.encoder mapping ok
[   11.181030] omapdss_dss 58000000.dss: bound 58006000.encoder (ops
hdmi4_component_ops)
[   11.189636] [drm] Supports vblank timestamp caching Rev 2
(21.10.2013).
[   11.196411] [drm] No driver support for vblank timestamp query.
[   11.214599] [drm] Enabling DMM ywrap scrolling
[   11.219940] ------------[ cut here ]------------
[   11.219940] WARNING: CPU: 1 PID: 85 at
/data/fast/l/k/drivers/base/regmap/regmap.c:2875
_regmap_update_bits+0x118/0x124
[   11.219970] Modules linked in:
[   11.219970] CPU: 1 PID: 85 Comm: kworker/1:1 Tainted: G        W
5.5.0-13279-g0d9b337280e8 #125
[   11.219970] Hardware name: Generic OMAP4 (Flattened Device Tree)
[   11.220001] Workqueue: events deferred_probe_work_func
[   11.220001] [<c010f2e4>] (unwind_backtrace) from [<c010b578>]
(show_stack+0x10/0x14)
[   11.220001] [<c010b578>] (show_stack) from [<c08fef98>]
(dump_stack+0xb4/0xd4)
[   11.220001] [<c08fef98>] (dump_stack) from [<c012d464>]
(__warn+0xc8/0xf0)
[   11.220001] [<c012d464>] (__warn) from [<c012d518>]
(warn_slowpath_fmt+0x8c/0x94)
[   11.220092] [<c012d518>] (warn_slowpath_fmt) from [<c04f6024>]
(_regmap_update_bits+0x118/0x124)
[   11.220092] [<c04f6024>] (_regmap_update_bits) from [<c04f6f94>]
(regmap_update_bits_base+0x50/0x74)
[   11.220123] [<c04f6f94>] (regmap_update_bits_base) from
[<c042e648>] (regulator_enable_regmap+0x48/0x5c)
[   11.220123] [<c042e648>] (regulator_enable_regmap) from
[<c04302c8>] (cpcap_regulator_enable+0x1c/0x78)
[   11.220153] [<c04302c8>] (cpcap_regulator_enable) from [<c0429dbc>]
(_regulator_do_enable+0x118/0x154)
[   11.220153] [<c0429dbc>] (_regulator_do_enable) from [<c042c394>]
(_regulator_enable+0x12c/0x150)
[   11.220153] [<c042c394>] (_regulator_enable) from [<c042c290>]
(_regulator_enable+0x28/0x150)
[   11.220184] [<c042c290>] (_regulator_enable) from [<c042c3dc>]
(regulator_enable+0x24/0x40)
[   11.220184] [<c042c3dc>] (regulator_enable) from [<c04cbc58>]
(dsicm_power_on+0x74/0x3a0)
[   11.220184] [<c04cbc58>] (dsicm_power_on) from [<c04ccfb8>]
(dsicm_enable+0x30/0xc4)
[   11.220214] [<c04ccfb8>] (dsicm_enable) from [<c04ad7b8>]
(omapdss_device_enable+0x20/0x34)
[   11.220214] [<c04ad7b8>] (omapdss_device_enable) from [<c04cfc40>]
(omap_encoder_enable+0x3c/0x58)
[   11.220245] [<c04cfc40>] (omap_encoder_enable) from [<c0478590>]
(drm_atomic_helper_commit_modeset_enables+0x228/0x284)
[   11.220275] [<c0478590>] (drm_atomic_helper_commit_modeset_enables)
=66rom [<c04cd41c>] (omap_atomic_commit_tail+0x48/0xc4)
[   11.220275] [<c04cd41c>] (omap_atomic_commit_tail) from
[<c047af48>] (commit_tail+0x9c/0x1a0)
[   11.220275] [<c047af48>] (commit_tail) from [<c047bcc8>]
(drm_atomic_helper_commit+0x12c/0x158)
[   11.220306] [<c047bcc8>] (drm_atomic_helper_commit) from
[<c0494444>] (drm_atomic_commit+0x40/0x50)
[   11.220306] [<c0494444>] (drm_atomic_commit) from [<c04a6ef4>]
(drm_client_modeset_commit_atomic+0x150/0x1ec)
[   11.220336] [<c04a6ef4>] (drm_client_modeset_commit_atomic) from
[<c04a7130>] (drm_client_modeset_commit_force+0x58/0x188)
[   11.220336] [<c04a7130>] (drm_client_modeset_commit_force) from
[<c0480a18>] (drm_fb_helper_restore_fbdev_mode_unlocked+0x4c/0x94)
[   11.220336] [<c0480a18>]
(drm_fb_helper_restore_fbdev_mode_unlocked) from [<c0480aa8>]
(drm_fb_helper_set_par+0x2c/0x5c)
[   11.220367] [<c0480aa8>] (drm_fb_helper_set_par) from [<c04059a4>]
(fbcon_init+0x45c/0x530)
[   11.220397] [<c04059a4>] (fbcon_init) from [<c044df58>]
(visual_init+0xbc/0x114)
[   11.220397] [<c044df58>] (visual_init) from [<c0450754>]
(do_bind_con_driver+0x140/0x328)
[   11.220397] [<c0450754>] (do_bind_con_driver) from [<c0450a58>]
(do_take_over_console+0x11c/0x1b4)
[   11.220428] [<c0450a58>] (do_take_over_console) from [<c0402538>]
(do_fbcon_takeover+0x64/0xcc)
[   11.220428] [<c0402538>] (do_fbcon_takeover) from [<c03fa18c>]
(register_framebuffer+0x194/0x2a0)
[   11.220428] [<c03fa18c>] (register_framebuffer) from [<c0480720>]
(__drm_fb_helper_initial_config_and_unlock+0x3b0/0x580)
[   11.220458] [<c0480720>]
(__drm_fb_helper_initial_config_and_unlock) from [<c04d586c>]
(omap_fbdev_init+0x80/0xc0)
[   11.220458] [<c04d586c>] (omap_fbdev_init) from [<c04cdab4>]
(pdev_probe+0x61c/0x790)
[   11.220489] [<c04cdab4>] (pdev_probe) from [<c04e1c64>]
(platform_drv_probe+0x48/0x98)
[   11.220489] [<c04e1c64>] (platform_drv_probe) from [<c04e0220>]
(really_probe+0x1dc/0x32c)
[   11.220489] [<c04e0220>] (really_probe) from [<c04e0540>]
(driver_probe_device+0x5c/0x168)
[   11.220489] [<c04e0540>] (driver_probe_device) from [<c04de7d4>]
(bus_for_each_drv+0x44/0x8c)
[   11.220520] [<c04de7d4>] (bus_for_each_drv) from [<c04e0458>]
(__device_attach+0x9c/0x104)
[   11.220520] [<c04e0458>] (__device_attach) from [<c04df4f8>]
(bus_probe_device+0x84/0x8c)
[   11.220550] [<c04df4f8>] (bus_probe_device) from [<c04dd6b4>]
(device_add+0x594/0x6fc)
[   11.220550] [<c04dd6b4>] (device_add) from [<c04e1e3c>]
(platform_device_add+0xf0/0x208)
[   11.220550] [<c04e1e3c>] (platform_device_add) from [<c04e2894>]
(platform_device_register_full+0x11c/0x14c)
[   11.220581] [<c04e2894>] (platform_device_register_full) from
[<c04ae82c>] (dss_bind+0x7c/0xa4)
[   11.220581] [<c04ae82c>] (dss_bind) from [<c04d9f24>]
(try_to_bring_up_master+0x164/0x1a4)
[   11.220581] [<c04d9f24>] (try_to_bring_up_master) from [<c04da534>]
(__component_add+0xa4/0x160)
[   11.220611] [<c04da534>] (__component_add) from [<c04c6574>]
(hdmi4_probe+0x19c/0x234)
[   11.220611] [<c04c6574>] (hdmi4_probe) from [<c04e1c64>]
(platform_drv_probe+0x48/0x98)
[   11.220611] [<c04e1c64>] (platform_drv_probe) from [<c04e0220>]
(really_probe+0x1dc/0x32c)
[   11.220642] [<c04e0220>] (really_probe) from [<c04e0540>]
(driver_probe_device+0x5c/0x168)
[   11.220642] [<c04e0540>] (driver_probe_device) from [<c04de7d4>]
(bus_for_each_drv+0x44/0x8c)
[   11.220642] [<c04de7d4>] (bus_for_each_drv) from [<c04e0458>]
(__device_attach+0x9c/0x104)
[   11.220642] [<c04e0458>] (__device_attach) from [<c04df4f8>]
(bus_probe_device+0x84/0x8c)
[   11.220672] [<c04df4f8>] (bus_probe_device) from [<c04dfc7c>]
(deferred_probe_work_func+0x68/0x94)
[   11.220672] [<c04dfc7c>] (deferred_probe_work_func) from
[<c0143f28>] (process_one_work+0x160/0x3a8)
[   11.220672] [<c0143f28>] (process_one_work) from [<c0144198>]
(process_scheduled_works+0x28/0x38)
[   11.220703] [<c0144198>] (process_scheduled_works) from
[<c0144f10>] (worker_thread+0x20c/0x4bc)
[   11.220703] [<c0144f10>] (worker_thread) from [<c014b380>]
(kthread+0x110/0x148)
[   11.220733] [<c014b380>] (kthread) from [<c01010e8>]
(ret_from_fork+0x14/0x2c)
[   11.220733] Exception stack(0xeeb7dfb0 to 0xeeb7dff8)
[   11.220733] dfa0:                                     00000000
00000000 00000000 00000000
[   11.220733] dfc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[   11.220733] dfe0: 00000000 00000000 00000000 00000000 00000013
00000000
[   11.220764] ---[ end trace 28755eeb13d0b2cc ]---
[   11.510833] panel-dsi-cm 58004000.encoder:display: panel revision
70.01.02
[   11.540832] Console: switching to colour frame buffer device 120x33
[   12.411407] omapdrm omapdrm.0: fb0: omapdrmdrmfb frame buffer
device
[   12.421600] [drm] Initialized omapdrm 1.0.0 20110917 for omapdrm.0
on minor 0
[   12.432342] cpcap-usb-phy cpcap-usb-phy.0: GPIO lookup for consumer
mode
[   12.442321] cpcap-usb-phy cpcap-usb-phy.0: using device tree for
GPIO lookup
[   12.452239] of_get_named_gpiod_flags: parsed 'mode-gpios' property
of node
'/ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/phy[=
0]'
- status (0)
[   12.472961] gpio gpiochip2: Persistence not supported for GPIO 28
[   12.481964] cpcap-usb-phy cpcap-usb-phy.0: GPIO lookup for consumer
mode
[   12.488708] cpcap-usb-phy cpcap-usb-phy.0: using device tree for
GPIO lookup
[   12.488708] of_get_named_gpiod_flags: parsed 'mode-gpios' property
of node
'/ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/pmic@0/phy[=
1]'
- status (0)
[   12.522216] gpio gpiochip1: Persistence not supported for GPIO 0
[   12.559875] cpcap-usb-phy cpcap-usb-phy.0: connected to USB host
[   12.687866] phy-mapphone-mdm6600 usb-phy@1: modem status: 4 awake
[   12.696960] phy-mapphone-mdm6600 usb-phy@1: Powered up OK
[   12.760772] ohci-platform 4a064800.ohci: Generic Platform OHCI
controller
[   12.770446] ohci-platform 4a064800.ohci: new USB bus registered,
assigned bus number 1
[   12.781341] ohci-platform 4a064800.ohci: irq 98, io mem 0x4a064800
[   12.819488] musb-hdrc musb-hdrc.0.auto: VBUS b_idle, devctl 80
[   12.882354] hub 1-0:1.0: USB hub found
[   12.888854] hub 1-0:1.0: 3 ports detected
[   12.895843] pwm-vibrator vibrator: vibrator supply vcc not found,
using dummy regulator
[   12.907196] omap-dmtimer-pwm dmtimer-pwm-9: requested duty cycle: 0
ns, period: 10000000 ns
[   12.918426] omap-dmtimer-pwm dmtimer-pwm-9: clk rate: 32768Hz
[   12.926971] omap-dmtimer-pwm dmtimer-pwm-9: duty cycle 0 ns is too
short for clock rate 32768 Hz
[   12.938629] omap-dmtimer-pwm dmtimer-pwm-9: using minimum of 1
clock cycle
[   12.945526] omap-dmtimer-pwm dmtimer-pwm-9: effective duty cycle:
30518 ns, period: 10009766 ns
[   12.960144] omap-dmtimer-pwm dmtimer-pwm-9: load value: 0xfffffeb8
(-328), match value: 0xfffffeb8 (-328)
[   12.973571] omap-dmtimer-pwm dmtimer-pwm-8: requested duty cycle: 0
ns, period: 10000000 ns
[   12.984741] omap-dmtimer-pwm dmtimer-pwm-8: clk rate: 32768Hz
[   12.987792] omap-dmtimer-pwm dmtimer-pwm-8: duty cycle 0 ns is too
short for clock rate 32768 Hz
[   13.002044] omap-dmtimer-pwm dmtimer-pwm-8: using minimum of 1
clock cycle
[   13.014373] omap-dmtimer-pwm dmtimer-pwm-8: effective duty cycle:
30518 ns, period: 10009766 ns
[   13.026275] omap-dmtimer-pwm dmtimer-pwm-8: load value: 0xfffffeb8
(-328), match value: 0xfffffeb8 (-328)
[   13.039886] input: pwm-vibrator as
/devices/platform/vibrator/input/input4
[   13.053894] power_supply battery: Not all required supplies found,
defer probe
[   13.063964] cpcap_battery cpcap_battery.0: failed to register power
supply
[   13.085540] cpcap-charger cpcap-charger.0: GPIO lookup for consumer
mode


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5Aet4ACgkQMOfwapXb+vKm0wCguk8LicF/0H7S4QjVl3QqsSB/
nxMAoLam1pDQakrFNGjsp70v+2eU3Gc9
=6+I8
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
