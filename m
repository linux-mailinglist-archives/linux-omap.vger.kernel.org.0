Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7B712BEBA
	for <lists+linux-omap@lfdr.de>; Sat, 28 Dec 2019 20:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfL1Tga (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 28 Dec 2019 14:36:30 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:40682 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfL1Tga (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 28 Dec 2019 14:36:30 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EF9B61C2462; Sat, 28 Dec 2019 20:36:22 +0100 (CET)
Date:   Sat, 28 Dec 2019 20:36:22 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        martin_rysavy@centrum.cz
Subject: Re: Droid 4 on 5.5-rc3
Message-ID: <20191228193622.GA13047@duo.ucw.cz>
References: <20191228162929.GA29269@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
In-Reply-To: <20191228162929.GA29269@duo.ucw.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> 5.4-based kernel works ok on my droid 4.
>=20
> 5.5-rc3 based kernel has problems; it reboots when I try to kexec it.
>=20
> Vanilla 5.5-rc3 reboots, too.
>=20
> If you have any ideas, let me know.

I managed to get partial serial dump. This should be 5.5-rc3: And then
a bit better serial dump (below). But it is silent for few seconds,
and then it restarts...

Best regards,
								Pavel

[    1.154968] NET: Registered protocol family 31                          =
    =20
[    1.159515] Bluetooth: HCI device and connection manager initialized    =
    =20
[    1.166107] Bluetooth: HCI socket layer initialized                     =
    =20
[    1.171142] Bluetooth: L2CAP socket layer initialized                   =
    =20
[    1.176361] Bluetooth: SCO socket layer initialized                     =
    =20
[    1.181976] clocksource: Switched to clocksource 32k_counter            =
    =20
[    1.187988] *** VALIDATE ramfs ***                                      =
    =20
[    1.199371] NET: Registered protocol family 2                           =
    =20
[    1.204467] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, =
1228)
[    1.213256] TCP established hash table entries: 8192 (order: 3, 32768 by=
tes,)
[    1.221313] TCP bind hash table entries: 8192 (order: 5, 163840 bytes, l=
inea)
[    1.228881] TCP: Hash tables configured (established 8192 bind 8192)    =
    =20
[    1.235595] UDP hash table entries: 512 (order: 2, 24576 bytes, linear) =
    =20
[    1.242462] UDP-Lite hash table entries: 512 (order: 2, 24576 bytes, lin=
ear)=20
[    1.249877] NET: Registered protocol family 1                           =
    =20
[    1.254943] RPC: Registered named UNIX socket transport module.         =
    =20
[    1.261047] RPC: Registered udp transport module.                       =
    =20
[    1.265930] RPC: Registered tcp transport module.                       =
    =20
[    1.270751] RPC: Registered tcp NFSv4.1 backchannel transport module.   =
    =20
[    1.278961] Initialise system trusted keyrings                          =
    =20
[    1.283752] workingset: timestamp_bits=3D30 max_order=3D18 bucket_order=
=3D0       =20
[    1.291168] NFS: Registering the id_resolver key type                   =
    =20
[    1.296447] Key type id_resolver registered                             =
    =20
[    1.300750] Key type id_legacy registered                               =
    =20
[    1.305267] jitterentropy: Initialization failed with host not compliant=
 wit2
[    1.314117] Key type asymmetric registered                              =
    =20
[    1.318328] Asymmetric key parser 'x509' registered                     =
    =20
[    1.323394] bounce: pool size: 64 pages                                 =
    =20
[    1.327362] io scheduler mq-deadline registered                         =
    =20
[    1.334869] gpio gpiochip1: (gpio-0-31): added GPIO chardev (254:1)     =
    =20
[    1.341400] gpiochip_setup_dev: registered GPIOs 0 to 31 on device: gpio=
chip)
[    1.349884] OMAP GPIO hardware version 0.1                              =
    =20
[    1.368560] omap-dma-engine 4a056000.dma-controller: OMAP DMA engine dri=
ver )
[    1.384857] omap-mailbox 4a0f4000.mailbox: omap mailbox rev 0x400       =
    =20
[    1.396118] gpio gpiochip2: (gpio-32-63): added GPIO chardev (254:2)    =
    =20
[    1.402770] gpiochip_setup_dev: registered GPIOs 32 to 63 on device: gpi=
ochi)
[    1.412445] gpio gpiochip3: (gpio-64-95): added GPIO chardev (254:3)    =
    =20
[    1.419036] gpiochip_setup_dev: registered GPIOs 64 to 95 on device: gpi=
ochi)
[    1.428619] gpio gpiochip4: (gpio-96-127): added GPIO chardev (254:4)   =
    =20
[    1.435302] gpiochip_setup_dev: registered GPIOs 96 to 127 on device: gp=
ioch)
[    1.445068] gpio gpiochip5: (gpio-128-159): added GPIO chardev (254:5)  =
    =20
[    1.451843] gpiochip_setup_dev: registered GPIOs 128 to 159 on device: g=
pioc)
[    1.461761] gpio gpiochip6: (gpio-160-191): added GPIO chardev (254:6)  =
    =20
[    1.468566] gpiochip_setup_dev: registered GPIOs 160 to 191 on device: g=
pioc)
[    1.478881] omap_i2c 48060000.i2c: bus 2 rev0.10 at 100 kHz             =
    =20
[    1.487274] omap_i2c 48070000.i2c: bus 0 rev0.10 at 100 kHz             =
    =20
[    1.494140] omap_i2c 48072000.i2c: bus 1 rev0.10 at 100 kHz             =
    =20
[    1.507659] omap_i2c 48350000.i2c: bus 3 rev0.10 at 100 kHz             =
    =20
[    1.523223] pinctrl-single 4a31e040.pinmux: 28 pins, size 56            =
    =20
[    1.529724] pinctrl-single 4a100040.pinmux: 203 pins, size 406          =
    =20
[    1.540710] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled     =
    =20
[    1.549438] printk: console [ttyS2] disabled                            =
    =20
[    1.553955] 48020000.serial: ttyS2 at MMIO 0x48020000 (irq =3D 112, base=
_baud 0
[    1.563110] printk: console [ttyS2] enabled                             =
    =20
[    1.563110] printk: console [ttyS2] enabled                             =
    =20
[    1.571594] printk: bootconsole [omap8250] disabled                     =
    =20
[    1.571594] printk: bootconsole [omap8250] disabled                     =
    =20
[    1.582366] 4806a000.serial: ttyS0 at MMIO 0x4806a000 (irq =3D 123, base=
_baud 0
[    1.591339] serial serial0: tty port ttyS0 registered                   =
    =20
[    1.596893] 4806c000.serial: ttyS1 at MMIO 0x4806c000 (irq =3D 124, base=
_baud 0
[    1.606384] 4806e000.serial: ttyS3 at MMIO 0x4806e000 (irq =3D 125, base=
_baud 0
[    1.615356] serial serial1: tty port ttyS3 registered                   =
    =20
[    1.623138] omapdss_dss 58000000.dss: 58000000.dss supply vdda_video not=
 four
[    1.632598] DSS: OMAP DSS rev 4.0                                       =
    =20
[    1.641601] connector-hdmi connector: GPIO lookup for consumer hpd      =
    =20
[    1.647857] connector-hdmi connector: using device tree for GPIO lookup =
    =20
[    1.654541] of_get_named_gpiod_flags: parsed 'hpd-gpios' property of nod=
e '/)
[    1.663970] gpio gpiochip2: Persistence not supported for GPIO 31       =
    =20
[    1.684143] brd: module loaded                                          =
    =20
[    1.694458] loop: module loaded                                         =
    =20
[    1.699493] mtdoops: mtd device (mtddev=3Dname/number) must be supplied =
      =20
[    1.708343] cpcap-core spi0.0: CPCAP vendor: ST rev: 2.10 (1a)          =
    =20
[    1.718749] cpcap-regulator cpcap-regulator.0: DMA mask not set         =
    =20
[    1.724945] SW5: Bringing 0uV into 5050000-5050000uV                    =
    =20
[    1.802185] cpcap-usb-phy cpcap-usb-phy.0: DMA mask not set             =
    =20
[    1.808135] cpcap-usb-phy cpcap-usb-phy.0: GPIO lookup for consumer mode=
    =20
[    1.814910] cpcap-usb-phy cpcap-usb-phy.0: using device tree for GPIO lo=
okup=20
[    1.822052] of_get_named_gpiod_flags: parsed 'mode-gpios' property of no=
de ')
[    1.837005] gpio gpiochip2: Persistence not supported for GPIO 28       =
    =20
885955] ------------[ cut here ]------------                               =
    =20
[    1.890624] WARNING: CPU: 0 PID: 1 at /data/fast/l/k/drivers/regulator/c=
ore.c
[    1.900421] Modules linked in:                                          =
    =20
[    1.903533] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.5.0-rc3-00624-g4=
6cf00
[    1.911651] Hardware name: Generic OMAP4 (Flattened Device Tree)        =
    =20
[    1.917724] [<c010f1e4>] (unwind_backtrace) from [<c010b4b0>] (show_stac=
k+0x)
[    1.925537] [<c010b4b0>] (show_stack) from [<c08ecd18>] (dump_stack+0xb4=
/0xd)
[    1.932800] [<c08ecd18>] (dump_stack) from [<c012db50>] (__warn+0xc8/0xf=
0)  =20
[    1.939727] [<c012db50>] (__warn) from [<c012dc04>] (warn_slowpath_fmt+0=
x8c/)
[    1.947235] [<c012dc04>] (warn_slowpath_fmt) from [<c0423b4c>] (_regulat=
or_p)
[    1.955474] [<c0423b4c>] (_regulator_put) from [<c0423b74>] (regulator_p=
ut+0)
[    1.963348] [<c0423b74>] (regulator_put) from [<c04ddcbc>] (release_node=
s+0x)
[    1.971313] [<c04ddcbc>] (release_nodes) from [<c04d9e0c>] (really_probe=
+0x1)
[    1.979187] [<c04d9e0c>] (really_probe) from [<c04da204>] (driver_probe_=
devi)
[    1.987518] [<c04da204>] (driver_probe_device) from [<c04d8490>] (bus_fo=
r_ea)
[    1.996093] [<c04d8490>] (bus_for_each_drv) from [<c04da11c>] (__device_=
atta)
[    2.004394] [<c04da11c>] (__device_attach) from [<c04d91b4>] (bus_probe_=
devi)
[    2.012634] [<c04d91b4>] (bus_probe_device) from [<c04d7370>] (device_ad=
d+0x)
[    2.020599] [<c04d7370>] (device_add) from [<c04dbb04>] (platform_device=
_add)
[    2.028747] [<c04dbb04>] (platform_device_add) from [<c0503a34>] (mfd_ad=
d_de)
[    2.037414] [<c0503a34>] (mfd_add_devices) from [<c0503b4c>] (devm_mfd_a=
dd_d)
[    2.045989] [<c0503b4c>] (devm_mfd_add_devices) from [<c0503f40>] (cpcap=
_pro)
[    2.054382] [<c0503f40>] (cpcap_probe) from [<c054b4ac>] (spi_drv_probe+=
0x80)
[    2.061981] [<c054b4ac>] (spi_drv_probe) from [<c04d9edc>] (really_probe=
+0x1)
[    2.069854] [<c04d9edc>] (really_probe) from [<c04da204>] (driver_probe_=
devi)
[    2.078186] [<c04da204>] (driver_probe_device) from [<c04d8490>] (bus_fo=
r_ea)
[    2.086761] [<c04d8490>] (bus_for_each_drv) from [<c04da11c>] (__device_=
atta)
[    2.095062] [<c04da11c>] (__device_attach) from [<c04d91b4>] (bus_probe_=
devi)
[    2.103302] [<c04d91b4>] (bus_probe_device) from [<c04d7370>] (device_ad=
d+0x)
[    2.111267] [<c04d7370>] (device_add) from [<c054c044>] (spi_add_device+=
0x8c)
[    2.118957] [<c054c044>] (spi_add_device) from [<c054caa8>] (spi_registe=
r_co)
[    2.127868] [<c054caa8>] (spi_register_controller) from [<c054ce10>] (de=
vm_s)
[    2.137847] [<c054ce10>] (devm_spi_register_controller) from [<c0550ab8>=
] (o)
[    2.147460] [<c0550ab8>] (omap2_mcspi_probe) from [<c04db92c>] (platform=
_drv)
[    2.156036] [<c04db92c>] (platform_drv_probe) from [<c04d9edc>] (really_=
prob)
[    2.164367] [<c04d9edc>] (really_probe) from [<c04da204>] (driver_probe_=
devi)
[    2.172668] [<c04da204>] (driver_probe_device) from [<c04da4b8>] (device=
_dri)
[    2.181579] [<c04da4b8>] (device_driver_attach) from [<c04da540>] (__dri=
ver_)
[    2.190155] [<c04da540>] (__driver_attach) from [<c04d8530>] (bus_for_ea=
ch_d)
[    2.198394] [<c04d8530>] (bus_for_each_dev) from [<c04d9370>] (bus_add_d=
rive)
[    2.206604] [<c04d9370>] (bus_add_driver) from [<c04dad1c>] (driver_regi=
ster)
[    2.214752] [<c04dad1c>] (driver_register) from [<c010281c>] (do_one_ini=
tcal)
[    2.222991] [<c010281c>] (do_one_initcall) from [<c0e00e14>] (kernel_ini=
t_fr)
[    2.231750] [<c0e00e14>] (kernel_init_freeable) from [<c0906718>] (kerne=
l_in)
[    2.239959] [<c0906718>] (kernel_init) from [<c01010e8>] (ret_from_fork+=
0x14)
[    2.247589] Exception stack(0xee88dfb0 to 0xee88dff8)                   =
    =20
[    2.252655] dfa0:                                     00000000 00000000 =
00000
[    2.260894] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000
[    2.269104] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 =
    =20
[    2.275848] ---[ end trace 613f9f0138c2e158 ]---                        =
    =20
[    2.284698] SSI protocol aka McSAAB added                               =
    =20
[    2.288787] CMT speech driver added                                     =
    =20
[    2.292388] HSI/SSI char device loaded                                  =
    =20
[    2.296356] mdio_bus fixed-0: GPIO lookup for consumer reset            =
    =20
[    2.302093] mdio_bus fixed-0: using lookup tables for GPIO lookup       =
    =20
[    2.308227] mdio_bus fixed-0: No GPIO consumer reset found              =
    =20
[    2.313812] libphy: Fixed MDIO Bus: probed                              =
    =20
[    2.318237] usbcore: registered new interface driver qmi_wwan           =
    =20
[    2.324035] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver      =
    =20
[    2.330291] ohci-platform: OHCI generic platform driver                 =
    =20
[    2.336364] usbcore: registered new interface driver cdc_wdm            =
    =20
[    2.342132] usbcore: registered new interface driver option             =
    =20
[    2.347778] usbserial: USB Serial support registered for GSM modem (1-po=
rt) =20
[    2.354827] usbcore: registered new interface driver qcaux              =
    =20
[    2.360351] usbserial: USB Serial support registered for qcaux          =
    =20
[    2.366241] usbcore: registered new interface driver qcserial           =
    =20
[    2.372070] usbserial: USB Serial support registered for Qualcomm USB mo=
dem =20
[    2.380584] udc musb-hdrc.0.auto: registering UDC driver [g_ether]      =
    =20
[    2.386871] using random self ethernet address                          =
    =20
[    2.391357] using random host ethernet address                          =
    =20
[    2.395843] g_ether gadget: adding config #1 'CDC Ethernet (ECM)'/(ptrva=
l)  =20
[    2.402770] g_ether gadget: adding 'cdc_ethernet'/(ptrval) to config 'CD=
C Et)
[    2.412231] usb0: HOST MAC d2:e7:15:9b:43:1e                            =
    =20
[    2.416595] usb0: MAC 8e:90:fd:88:9e:3f                                 =
    =20
[    2.420471] g_ether gadget: CDC Ethernet: dual speed IN/ep1in OUT/ep1out=
 NOTn
[    2.428375] g_ether gadget: cfg 1/(ptrval) speeds: high full            =
    =20
[    2.434082] g_ether gadget:   interface 0 =3D cdc_ethernet/(ptrval)     =
      =20
[    2.440216] g_ether gadget:   interface 1 =3D cdc_ethernet/(ptrval)     =
      =20
[    2.446350] g_ether gadget: Ethernet Gadget, version: Memorial Day 2008 =
    =20
[    2.453002] g_ether gadget: g_ether ready                               =
    =20
[    2.457397] mousedev: PS/2 mouse device common for all mice             =
    =20
[    2.463867] input: 4a31c000.keypad as /devices/platform/44000000.ocp/4a3=
00000
[    2.481262] atmel_mxt_ts 1-004a: GPIO lookup for consumer reset         =
    =20
[    2.487243] atmel_mxt_ts 1-004a: using device tree for GPIO lookup      =
    =20
[    2.493499] of_get_named_gpiod_flags: parsed 'reset-gpios' property of n=
ode )
[    2.508941] gpio gpiochip6: Persistence not supported for GPIO 13       =
    =20
[    2.714904] atmel_mxt_ts 1-004a: Family: 129 Variant: 1 Firmware V0.4.31=
 Obj8
[    2.739898] atmel_mxt_ts 1-004a: Direct firmware load for maxtouch.cfg f=
aile2
[    2.748901] cpcap-pwrbutton cpcap-pwrbutton.0: DMA mask not set         =
    =20
[    2.751708] atmel_mxt_ts 1-004a: Touchscreen size X1023Y1023            =
    =20
[    2.755645] input: cpcap-pwrbutton as /devices/platform/44000000.ocp/480=
00001
[    2.760681] input: Atmel maXTouch Touchscreen as /devices/platform/44000=
000.2
[    2.780120] pwm-vibrator vibrator: vibrator supply vcc not found, using =
dummr
[    2.806243] cpcap-rtc cpcap-rtc.0: DMA mask not set                     =
    =20
[    2.812377] cpcap-rtc cpcap-rtc.0: registered as rtc0                   =
    =20
[    2.822418] i2c /dev entries driver                                     =
    =20
[    2.864654] poweroff-gpio gpio-poweroff: GPIO lookup for consumer (null)=
    =20
[    2.871398] poweroff-gpio gpio-poweroff: using device tree for GPIO look=
up  =20
[    2.878356] of_get_named_gpiod_flags: parsed 'gpios' property of node '/=
gpio)
[    2.887725] gpio gpiochip2: Persistence not supported for GPIO 18       =
    =20
[    2.894317] cpcap_battery cpcap_battery.0: DMA mask not set             =
    =20
[    2.902770] cpcap_battery cpcap_battery.0: IRQ cccal not found          =
    =20
[    2.914489] cpcap-charger cpcap-charger.0: DMA mask not set             =
    =20
[    2.942932] lm75 0-0048: hwmon0: sensor 'tmp105'                        =
    =20
[    2.950012] omap_wdt: OMAP Watchdog Timer Rev 0x00: initial timeout 60 s=
ec  =20
[    2.957824] omap_wdt: OMAP Watchdog Timer Rev 0x00: initial timeout 60 s=
ec  =20
[    2.965209] Bluetooth: HCI UART driver ver 2.3                          =
    =20
[    2.969696] Bluetooth: HCI UART protocol H4 registered                  =
    =20
[    2.974945] Bluetooth: HCI UART protocol LL registered                  =
    =20
[    2.975036] hci-ti serial1-0: GPIO lookup for consumer enable           =
    =20
[    2.980285] Bluetooth: HCI UART protocol Broadcom registered            =
    =20
[    2.985931] hci-ti serial1-0: using device tree for GPIO lookup         =
    =20
[    2.993164] omap_hsmmc 4809c000.mmc: GPIO lookup for consumer cd        =
    =20
[    2.997589] of_get_named_gpiod_flags: parsed 'enable-gpios' property of =
node)
[    3.003601] omap_hsmmc 4809c000.mmc: using device tree for GPIO lookup  =
    =20
[    3.003631] of_get_named_gpiod_flags: parsed 'cd-gpios' property of node=
 '/o)
[    3.019073] gpio gpiochip6: Persistence not supported for GPIO 14       =
    =20
[    3.025482] gpio gpiochip6: Persistence not supported for GPIO 16       =
    =20
[    3.051696] omap_gpio 4805d000.gpio: Could not set line 16 debounce to 2=
0000)
[    3.060577] omap_hsmmc 4809c000.mmc: Got CD GPIO                        =
    =20
[    3.065216] omap_hsmmc 4809c000.mmc: GPIO lookup for consumer wp        =
    =20
[    3.071258] omap_hsmmc 4809c000.mmc: using device tree for GPIO lookup  =
    =20
[    3.077850] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of=
 nod'
[    3.091003] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of =
node'
[    3.104034] omap_hsmmc 4809c000.mmc: using lookup tables for GPIO lookup=
    =20
[    3.110778] omap_hsmmc 4809c000.mmc: No GPIO consumer wp found          =
    =20
[    3.144775] omap_hsmmc 480ad000.mmc: GPIO lookup for consumer wp        =
    =20
[    3.150848] omap_hsmmc 480ad000.mmc: using device tree for GPIO lookup  =
    =20
[    3.157470] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of=
 nod'
[    3.170623] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of =
node'
[    3.183685] omap_hsmmc 480ad000.mmc: using lookup tables for GPIO lookup=
    =20
[    3.190460] omap_hsmmc 480ad000.mmc: No GPIO consumer wp found          =
    =20
[    3.197235] omap_hsmmc 480b4000.mmc: GPIO lookup for consumer cd        =
    =20
[    3.203338] omap_hsmmc 480b4000.mmc: using device tree for GPIO lookup  =
    =20
[    3.209930] of_get_named_gpiod_flags: can't parse 'cd-gpios' property of=
 nod'
[    3.223114] of_get_named_gpiod_flags: can't parse 'cd-gpio' property of =
node'
[    3.236145] omap_hsmmc 480b4000.mmc: using lookup tables for GPIO lookup=
    =20
[    3.242919] omap_hsmmc 480b4000.mmc: No GPIO consumer cd found          =
    =20
[    3.248809] omap_hsmmc 480b4000.mmc: GPIO lookup for consumer wp        =
    =20
[    3.254882] omap_hsmmc 480b4000.mmc: using device tree for GPIO lookup  =
    =20
[    3.261505] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of=
 nod'
[    3.274658] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of =
node'
[    3.287719] omap_hsmmc 480b4000.mmc: using lookup tables for GPIO lookup=
    =20
[    3.294494] omap_hsmmc 480b4000.mmc: No GPIO consumer wp found          =
    =20
[    3.325836] omap_hsmmc 480d1000.mmc: GPIO lookup for consumer cd        =
    =20
[    3.331909] omap_hsmmc 480d1000.mmc: using device tree for GPIO lookup  =
    =20
[    3.338562] of_get_named_gpiod_flags: can't parse 'cd-gpios' property of=
 nod'
[    3.351715] of_get_named_gpiod_flags: can't parse 'cd-gpio' property of =
node'
[    3.364776] omap_hsmmc 480d1000.mmc: using lookup tables for GPIO lookup=
    =20
[    3.371551] omap_hsmmc 480d1000.mmc: No GPIO consumer cd found          =
    =20
[    3.377441] omap_hsmmc 480d1000.mmc: GPIO lookup for consumer wp        =
    =20
[    3.383544] omap_hsmmc 480d1000.mmc: using device tree for GPIO lookup  =
    =20
[    3.390136] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of=
 nod'
[    3.403289] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of =
node'
[    3.416351] omap_hsmmc 480d1000.mmc: using lookup tables for GPIO lookup=
    =20
[    3.423126] omap_hsmmc 480d1000.mmc: No GPIO consumer wp found          =
    =20
[    3.450775] mmc0: host does not support reading read-only switch, assumi=
ng we
[    3.459045] omap_hsmmc 480d5000.mmc: GPIO lookup for consumer cd        =
    =20
[    3.465240] omap_hsmmc 480d5000.mmc: using device tree for GPIO lookup  =
    =20
[    3.471923] mmc0: new high speed SDHC card at address e624              =
    =20
[    3.475463] of_get_named_gpiod_flags: can't parse 'cd-gpios' property of=
 nod'
[    3.488067] mmcblk0: mmc0:e624 SU16G 14.8 GiB                           =
    =20
[    3.490783] of_get_named_gpiod_flags: can't parse 'cd-gpio' property of =
node'
[    3.508178] omap_hsmmc 480d5000.mmc: using lookup tables for GPIO lookup=
    =20
[    3.515167] omap_hsmmc 480d5000.mmc: No GPIO consumer cd found          =
    =20
[    3.515197]  mmcblk0: p1 p2                                             =
    =20
[    3.521087] omap_hsmmc 480d5000.mmc: GPIO lookup for consumer wp        =
    =20
[    3.529968] omap_hsmmc 480d5000.mmc: using device tree for GPIO lookup  =
    =20
[    3.536590] random: fast init done                                      =
    =20
[    3.540161] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of=
 nod'
[    3.553405] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of =
node'
[    3.566528] omap_hsmmc 480d5000.mmc: using lookup tables for GPIO lookup=
    =20
[    3.573333] omap_hsmmc 480d5000.mmc: No GPIO consumer wp found          =
    =20
[    3.580352] mmc1: new high speed MMC card at address 0001               =
    =20
[    3.596527] mmcblk1: mmc1:0001 016G92 14.7 GiB                          =
    =20
[    3.601318] mmcblk1boot0: mmc1:0001 016G92 partition 1 4.00 MiB         =
    =20
[    3.606384] cpcap-led cpcap-led.0: DMA mask not set                     =
    =20
[    3.607604] mmcblk1boot1: mmc1:0001 016G92 partition 2 4.00 MiB         =
    =20
[    3.612640] cpcap-led cpcap-led.1: DMA mask not set                     =
    =20
[    3.618347] mmcblk1rpmb: mmc1:0001 016G92 partition 3 512 KiB, chardev (=
244:)
[    3.623413] cpcap-led cpcap-led.2: DMA mask not set                     =
    =20
[    3.635772] cpcap-led cpcap-led.3: DMA mask not set                     =
    =20
[    3.641296] cpcap-led cpcap-led.4: DMA mask not set                     =
    =20
[    3.646850]  mmcblk1: p1 p2 p3 p4 < p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p=
15 p>
[    3.646942] lm3532-led 0-0038: GPIO lookup for consumer enable          =
    =20
[    3.660186] mmcblk1: p25 size 16803584 extends beyond EOD, truncated    =
    =20
[    3.663818] lm3532-led 0-0038: using device tree for GPIO lookup        =
    =20
[    3.670318] mmcblk1: p26 start 31104768 is beyond EOD, truncated        =
    =20
[    3.676391] of_get_named_gpiod_flags: parsed 'enable-gpios' property of =
node)
[    3.698272] gpio gpiochip6: Persistence not supported for GPIO 12       =
    =20
[    3.704589] lm3532-led 0-0038: 0-0038 supply vin not found, using dummy =
regur
[    3.715057] ledtrig-cpu: registered to indicate activity on CPUs        =
    =20
[    3.723693] clk: failed to reparent abe_cm:clk:0060:24 to sys_clkin_ck: =
-22 =20
[    3.731872] cpcap_adc cpcap_adc.0: DMA mask not set                     =
    =20
[    3.812225] cpcap_adc cpcap_adc.0: CPCAP ADC device probed              =
    =20
[    3.818939] isl29028 1-0044: No cache defaults, reading back from HW    =
    =20
[    3.828826] of_get_named_gpiod_flags: can't parse 'gpios' property of no=
de ''
[    3.843627] ak8975 3-000c: mounting matrix not found: using identity... =
    =20
[    3.850494] ak8975 3-000c: 3-000c supply vid not found, using dummy regu=
lator
[    3.886322] gnss: GNSS driver registered with major 242                 =
    =20
[    3.893615] asoc-audio-graph-card soundcard: GPIO lookup for consumer pa=
    =20
[    3.900390] asoc-audio-graph-card soundcard: using device tree for GPIO =
lookp
[    3.907714] of_get_named_gpiod_flags: can't parse 'pa-gpios' property of=
 nod'
[    3.916320] of_get_named_gpiod_flags: can't parse 'pa-gpio' property of =
node'
[    3.924865] asoc-audio-graph-card soundcard: using lookup tables for GPI=
O lop
[    3.932373] asoc-audio-graph-card soundcard: No GPIO consumer pa found  =
    =20
[    3.942565] Initializing XFRM netlink socket                            =
    =20
[    3.946929] NET: Registered protocol family 17                          =
    =20
[    3.951416] NET: Registered protocol family 15                          =
    =20
[    3.956085] Bluetooth: RFCOMM TTY layer initialized                     =
    =20
[    3.961029] Bluetooth: RFCOMM socket layer initialized                  =
    =20
[    3.966278] Bluetooth: RFCOMM ver 1.11                                  =
    =20
[    3.970092] Bluetooth: BNEP (Ethernet Emulation) ver 1.3                =
    =20
[    3.975494] Bluetooth: BNEP filters: protocol multicast                 =
    =20
[    3.980773] Bluetooth: BNEP socket layer initialized                    =
    =20
[    3.985839] Bluetooth: HIDP (Human Interface Emulation) ver 1.2         =
    =20
[    3.991790] Bluetooth: HIDP socket layer initialized                    =
    =20
[    3.996887] NET: Registered protocol family 35                          =
    =20
[    4.001464] Key type dns_resolver registered                            =
    =20
[    4.005981] ThumbEE CPU extension supported.                            =
    =20
[    4.010284] Registering SWP/SWPB emulation handler                      =
    =20
[    4.015777] omap4_vc_i2c_timing_init: using bootloader low-speed timings=
    =20
[    4.022674] Power Management for TI OMAP4+ devices.                     =
    =20
[    4.027557] OMAP4 PM: u-boot >=3D v2012.07 is required for full PM suppo=
rt    =20
[    4.034484] SmartReflex Class3 initialized                              =
    =20
[    4.039093] Loading compiled-in X.509 certificates                      =
    =20
[    4.067535] dmm 4e000000.dmm: initialized all PAT entries               =
    =20
[    4.073425] reg-fixed-voltage regulator-hdmi: GPIO lookup for consumer (=
null)
[    4.081573] reg-fixed-voltage regulator-hdmi: using device tree for GPIO=
 loop
[    4.089111] of_get_named_gpiod_flags: can't parse 'gpios' property of no=
de ''
[    4.097930] of_get_named_gpiod_flags: parsed 'gpio' property of node '/r=
egul)
[    4.107391] gpio gpiochip2: Persistence not supported for GPIO 27       =
    =20
[    4.113555] reg-fixed-voltage regulator-lcd: GPIO lookup for consumer (n=
ull)=20
[    4.113555] reg-fixed-voltage regulator-lcd: using device tree for GPIO =
lookp
[    4.128356] of_get_named_gpiod_flags: can't parse 'gpios' property of no=
de ''
[    4.137115] of_get_named_gpiod_flags: parsed 'gpio' property of node '/r=
egul)
[    4.146453] gpio gpiochip4: Persistence not supported for GPIO 0        =
    =20
[    4.152526] lcd: supplied by SW5                                        =
    =20
[    4.152526] reg-fixed-voltage regulator-wl12xx: GPIO lookup for consumer=
 (nu)
[    4.163482] reg-fixed-voltage regulator-wl12xx: using device tree for GP=
IO lp
[    4.163482] of_get_named_gpiod_flags: can't parse 'gpios' property of no=
de ''
[    4.179992] of_get_named_gpiod_flags: parsed 'gpio' property of node '/r=
egul)
[    4.189605] gpio gpiochip3: Persistence not supported for GPIO 30       =
    =20
[    4.195770] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer ena=
ble =20
[    4.203216] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.210388] of_get_named_gpiod_flags: parsed 'enable-gpios' property of =
node)
[    4.220062] gpio gpiochip3: Persistence not supported for GPIO 31       =
    =20
[    4.226226] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer pow=
er  =20
[    4.226226] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.240356] of_get_named_gpiod_flags: parsed 'power-gpios' property of n=
ode )
[    4.249908] gpio gpiochip2: Persistence not supported for GPIO 22       =
    =20
[    4.256072] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer res=
et  =20
[    4.256072] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.270202] of_get_named_gpiod_flags: parsed 'reset-gpios' property of n=
ode )
[    4.279754] gpio gpiochip2: Persistence not supported for GPIO 17       =
    =20
[    4.285888] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer mot=
orole
[    4.293548] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.293548] of_get_named_gpiod_flags: parsed 'motorola,mode-gpios' prope=
rty )
[    4.311035] gpio gpiochip5: Persistence not supported for GPIO 20       =
    =20
[    4.317169] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer mot=
orole
[    4.324798] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.332031] of_get_named_gpiod_flags: parsed 'motorola,mode-gpios' prope=
rty )
[    4.342285] gpio gpiochip5: Persistence not supported for GPIO 21       =
    =20
[    4.342285] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer mot=
orols
[    4.356231] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.363403] of_get_named_gpiod_flags: parsed 'motorola,status-gpios' pro=
pert)
[    4.373870] gpio gpiochip2: Persistence not supported for GPIO 20       =
    =20
[    4.380004] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer mot=
orols
[    4.387817] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.395019] of_get_named_gpiod_flags: parsed 'motorola,status-gpios' pro=
pert)
[    4.405456] gpio gpiochip2: Persistence not su

Second try:

[    0.000000] percpu: Embedded 15 pages/cpu s32384 r8192 d20864 u61440    =
    =20
[    0.000000] pcpu-alloc: s32384 r8192 d20864 u61440 alloc=3D15*4096      =
      =20
[    0.000000] pcpu-alloc: [0] 0 [0] 1                                     =
    =20
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 25933=
2   =20
[    0.000000] Kernel command line: root=3D/dev/mmcblk0p2 drm.debug=3D8 roo=
twait=3D10n
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 by=
tes,)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 byte=
s, l)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off     =
    =20
[    0.000000] Memory: 1002608K/1043456K available (9216K kernel code, 359K=
 rwd)
[    0.000000] rcu: Preemptible hierarchical RCU implementation.           =
    =20
[    0.000000]  Tasks RCU enabled.                                         =
    =20
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 1=
0 ji.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16             =
    =20
[    0.000000] L2C: platform provided aux values match the hardware, so hav=
e no.
[    0.000000] L2C-310 errata 727915 769419 enabled                        =
    =20
[    0.000000] L2C-310 enabling early BRESP for Cortex-A9                  =
    =20
[    0.000000] L2C-310 ID prefetch enabled, offset 8 lines                 =
    =20
[    0.000000] L2C-310 cache controller enabled, 16 ways, 1024 kB          =
    =20
[    0.000000] L2C-310: CACHE_ID 0x410000c4, AUX_CTRL 0x7e470000           =
    =20
[    0.000000] random: get_random_bytes called from start_kernel+0x260/0x3e=
4 wi0
[    0.000000] OMAP clockevent source: timer1 at 32768 Hz                  =
    =20
[    0.000000] clocksource: 32k_counter: mask: 0xffffffff max_cycles: 0xfff=
ffffs
[    0.000000] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps eve=
ry 6s
[    0.008575] OMAP clocksource: 32k_counter at 32768 Hz                   =
    =20
[    0.014984] Console: colour dummy device 80x30                          =
    =20
[    0.000000] Booting Linux on physical CPU 0x0                           =
    =20
[    0.000000] Linux version 5.5.0-rc3-00624-g46cf053efec6 (pavel@amd) (gcc=
 ver9
[    0.000000] CPU: ARMv7 Processor [411fc093] revision 3 (ARMv7), cr=3D10c=
5387d =20
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instr=
uctie
[    0.000000] OF: fdt: Machine model: Motorola Droid 4 XT894              =
    =20
[    0.000000] earlycon: omap8250 at MMIO 0x48020000 (options '')          =
    =20
[    0.000000] printk: bootconsole [omap8250] enabled                      =
    =20
[    0.000000] Memory policy: Data cache writealloc                        =
    =20
[    0.000000] cma: Reserved 16 MiB at 0xbe800000                          =
    =20
[    0.000000] OMAP4: Map 0xafe00000 to (ptrval) for dram barrier          =
    =20
[    0.000000] On node 0 totalpages: 260864                                =
    =20
[    0.000000]   Normal zone: 1532 pages used for memmap                   =
    =20
[    0.000000]   Normal zone: 0 pages reserved                             =
    =20
[    0.000000]   Normal zone: 196096 pages, LIFO batch:63                  =
    =20
[    0.000000]   HighMem zone: 64768 pages, LIFO batch:15                  =
    =20
[    0.000000] OMAP4430 ES2.3                                              =
    =20
[    0.000000] percpu: Embedded 15 pages/cpu s32384 r8192 d20864 u61440    =
    =20
[    0.000000] pcpu-alloc: s32384 r8192 d20864 u61440 alloc=3D15*4096      =
      =20
[    0.000000] pcpu-alloc: [0] 0 [0] 1                                     =
    =20
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 25933=
2   =20
[    0.000000] Kernel command line: root=3D/dev/mmcblk0p2 drm.debug=3D8 roo=
twait=3D10n
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 by=
tes,)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 byte=
s, l)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off     =
    =20
[    0.000000] Memory: 1002608K/1043456K available (9216K kernel code, 359K=
 rwd)
[    0.000000] rcu: Preemptible hierarchical RCU implementation.           =
    =20
[    0.000000]  Tasks RCU enabled.                                         =
    =20
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 1=
0 ji.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16             =
    =20
[    0.000000] L2C: platform provided aux values match the hardware, so hav=
e no.
[    0.000000] L2C-310 errata 727915 769419 enabled                        =
    =20
[    0.000000] L2C-310 enabling early BRESP for Cortex-A9                  =
    =20
[    0.000000] L2C-310 ID prefetch enabled, offset 8 lines                 =
    =20
[    0.000000] L2C-310 cache controller enabled, 16 ways, 1024 kB          =
    =20
[    0.000000] L2C-310: CACHE_ID 0x410000c4, AUX_CTRL 0x7e470000           =
    =20
[    0.000000] random: get_random_bytes called from start_kernel+0x260/0x3e=
4 wi0
[    0.000000] OMAP clockevent source: timer1 at 32768 Hz                  =
    =20
[    0.000000] clocksource: 32k_counter: mask: 0xffffffff max_cycles: 0xfff=
ffffs
[    0.000000] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps eve=
ry 6s
[    0.008575] OMAP clocksource: 32k_counter at 32768 Hz                   =
    =20
[    0.014984] Console: colour dummy device 80x30                          =
    =20
[    0.289581] printk: console [tty0] enabled                              =
    =20
[    0.293823] Calibrating delay loop... 2393.70 BogoMIPS (lpj=3D11968512) =
      =20
[    0.356414] pid_max: default: 32768 minimum: 301                        =
    =20
[    0.361297] LSM: Security Framework initializing                        =
    =20
[    0.366088] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes, =
line)
[    0.373657] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 by=
tes,)
[    0.381713] *** VALIDATE tmpfs ***                                      =
    =20
[    0.385650] *** VALIDATE proc ***                                       =
    =20
[    0.389190] *** VALIDATE cgroup1 ***                                    =
    =20
[    0.392883] *** VALIDATE cgroup2 ***                                    =
    =20
[    0.396575] CPU: Testing write buffer coherency: ok                     =
    =20
[    0.401641] CPU0: Spectre v2: using BPIALL workaround                   =
    =20
[    0.407073] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000            =
    =20
[    0.412933] smp: CPU1 parked within kernel, needs reset (0x8011e344 0x80=
11e3)
[    0.479827] Setting up static identity map for 0x80100000 - 0x80100078  =
    =20
[    0.486663] rcu: Hierarchical SRCU implementation.                      =
    =20
[    0.529785] smp: Bringing up secondary CPUs ...                         =
    =20
[    0.649780] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001            =
    =20
[    0.649780] CPU1: Spectre v2: using BPIALL workaround                   =
    =20
[    0.660949] smp: Brought up 1 node, 2 CPUs                              =
    =20
[    0.665161] SMP: Total of 2 processors activated (4787.40 BogoMIPS).    =
    =20
[    0.671752] CPU: All CPU(s) started in SVC mode.                        =
    =20
[    0.676940] devtmpfs: initialized                                       =
    =20
[    0.692993] VFP support v0.3: implementor 41 architecture 3 part 30 vari=
ant 4
[    0.701293] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, ms
[    0.711486] futex hash table entries: 512 (order: 3, 32768 bytes, linear=
)   =20
[    0.719268] pinctrl core: initialized pinctrl subsystem                 =
    =20
[    0.725189] thermal_sys: Registered thermal governor 'step_wise'        =
    =20
[    0.726013] NET: Registered protocol family 16                          =
    =20
[    0.738891] DMA: preallocated 256 KiB pool for atomic coherent allocatio=
ns  =20
[    0.748138] omap_hwmod: l3_main_3 using broken dt data from ocp         =
    =20
[    0.756103] omap_hwmod: l3_main_2 using broken dt data from ocp         =
    =20
[    0.792083] cpuidle: using governor menu                                =
    =20
[    0.814361] omap-gpmc 50000000.gpmc: GPMC revision 6.0                  =
    =20
[    0.819671] gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000       =
    =20
[    0.825988] gpiochip_find_base: found new base at 508                   =
    =20
[    0.831420] gpio gpiochip0: (omap-gpmc): added GPIO chardev (254:0)     =
    =20
[    0.837921] gpiochip_setup_dev: registered GPIOs 508 to 511 on device: g=
pioc)
[    0.850891] No ATAGs?                                                   =
    =20
[    0.852111] OMAP DMA hardware revision 0.0                              =
    =20
[    0.875671] reg-fixed-voltage regulator-hdmi: GPIO lookup for consumer (=
null)
[    0.883117] reg-fixed-voltage regulator-hdmi: using device tree for GPIO=
 loop
[    0.890869] of_get_named_gpiod_flags: can't parse 'gpios' property of no=
de ''
[    0.899902] reg-fixed-voltage regulator-hdmi: No GPIO consumer (null) fo=
und =20
[    0.907135] reg-fixed-voltage regulator-lcd: GPIO lookup for consumer (n=
ull)=20
[    0.914520] reg-fixed-voltage regulator-lcd: using device tree for GPIO =
lookp
[    0.921997] of_get_named_gpiod_flags: can't parse 'gpios' property of no=
de ''
[    0.930908] reg-fixed-voltage regulator-lcd: No GPIO consumer (null) fou=
nd  =20
[    0.938049] reg-fixed-voltage regulator-wl12xx: GPIO lookup for consumer=
 (nu)
[    0.945587] reg-fixed-voltage regulator-wl12xx: using device tree for GP=
IO lp
[    0.953338] of_get_named_gpiod_flags: can't parse 'gpios' property of no=
de ''
[    0.962493] reg-fixed-voltage regulator-wl12xx: No GPIO consumer (null) =
found
[    0.972229] iommu: Default domain type: Translated                      =
    =20
[    0.978607] omap-iommu 4a066000.mmu: 4a066000.mmu registered            =
    =20
[    0.984649] omap-iommu 55082000.mmu: 55082000.mmu registered            =
    =20
[    0.992340] SCSI subsystem initialized                                  =
    =20
[    0.996368] usbcore: registered new interface driver usbfs              =
    =20
[    1.002105] usbcore: registered new interface driver hub                =
    =20
[    1.007659] usbcore: registered new device driver usb                   =
    =20
[    1.013122] usb_phy_generic usb-phy@2: GPIO lookup for consumer reset   =
    =20
[    1.019775] usb_phy_generic usb-phy@2: using device tree for GPIO lookup=
    =20
[    1.026672] of_get_named_gpiod_flags: can't parse 'reset-gpios' property=
 of '
[    1.035736] of_get_named_gpiod_flags: can't parse 'reset-gpio' property =
of n'
[    1.044708] usb_phy_generic usb-phy@2: using lookup tables for GPIO look=
up  =20
[    1.051818] usb_phy_generic usb-phy@2: No GPIO consumer reset found     =
    =20
[    1.058258] usb_phy_generic usb-phy@2: GPIO lookup for consumer vbus-det=
ect =20
[    1.065429] usb_phy_generic usb-phy@2: using device tree for GPIO lookup=
    =20
[    1.072357] of_get_named_gpiod_flags: can't parse 'vbus-detect-gpios' pr=
oper'
[    1.081970] of_get_named_gpiod_flags: can't parse 'vbus-detect-gpio' pro=
pert'
[    1.091461] usb_phy_generic usb-phy@2: using lookup tables for GPIO look=
up  =20
[    1.098541] usb_phy_generic usb-phy@2: No GPIO consumer vbus-detect foun=
d   =20
[    1.105682] usb_phy_generic usb-phy@2: usb-phy@2 supply vcc not found, u=
singr
[    1.115051] mc: Linux media interface: v0.10                            =
    =20
[    1.119476] videodev: Linux video capture interface: v2.00              =
    =20
[    1.125213] pps_core: LinuxPPS API ver. 1 registered                    =
    =20
[    1.130340] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giom>
[    1.139770] PTP clock support registered                                =
    =20
[    1.144287] Advanced Linux Sound Architecture Driver Initialized.       =
    =20
[    1.151000] Bluetooth: Core ver 2.22                                    =
    =20
[    1.154693] NET: Registered protocol family 31                          =
    =20
[    1.159271] Bluetooth: HCI device and connection manager initialized    =
    =20
[    1.165832] Bluetooth: HCI socket layer initialized                     =
    =20
[    1.170898] Bluetooth: L2CAP socket layer initialized                   =
    =20
[    1.176116] Bluetooth: SCO socket layer initialized                     =
    =20
[    1.181762] clocksource: Switched to clocksource 32k_counter            =
    =20
[    1.187774] *** VALIDATE ramfs ***                                      =
    =20
[    1.199157] NET: Registered protocol family 2                           =
    =20
[    1.204284] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, =
1228)
[    1.213043] TCP established hash table entries: 8192 (order: 3, 32768 by=
tes,)
[    1.221099] TCP bind hash table entries: 8192 (order: 5, 163840 bytes, l=
inea)
[    1.228668] TCP: Hash tables configured (established 8192 bind 8192)    =
    =20
[    1.235382] UDP hash table entries: 512 (order: 2, 24576 bytes, linear) =
    =20
[    1.242248] UDP-Lite hash table entries: 512 (order: 2, 24576 bytes, lin=
ear)=20
[    1.249664] NET: Registered protocol family 1                           =
    =20
[    1.254760] RPC: Registered named UNIX socket transport module.         =
    =20
[    1.260864] RPC: Registered udp transport module.                       =
    =20
[    1.265716] RPC: Registered tcp transport module.                       =
    =20
[    1.270568] RPC: Registered tcp NFSv4.1 backchannel transport module.   =
    =20
[    1.278747] Initialise system trusted keyrings                          =
    =20
[    1.283538] workingset: timestamp_bits=3D30 max_order=3D18 bucket_order=
=3D0       =20
[    1.290954] NFS: Registering the id_resolver key type                   =
    =20
[    1.296203] Key type id_resolver registered                             =
    =20
[    1.300506] Key type id_legacy registered                               =
    =20
[    1.305358] jitterentropy: Initialization failed with host not compliant=
 wit2
[    1.314178] Key type asymmetric registered                              =
    =20
[    1.318389] Asymmetric key parser 'x509' registered                     =
    =20
[    1.323455] bounce: pool size: 64 pages                                 =
    =20
[    1.327423] io scheduler mq-deadline registered                         =
    =20
[    1.334930] gpio gpiochip1: (gpio-0-31): added GPIO chardev (254:1)     =
    =20
[    1.341461] gpiochip_setup_dev: registered GPIOs 0 to 31 on device: gpio=
chip)
[    1.349945] OMAP GPIO hardware version 0.1                              =
    =20
[    1.368621] omap-dma-engine 4a056000.dma-controller: OMAP DMA engine dri=
ver )
[    1.384918] omap-mailbox 4a0f4000.mailbox: omap mailbox rev 0x400       =
    =20
[    1.396209] gpio gpiochip2: (gpio-32-63): added GPIO chardev (254:2)    =
    =20
[    1.402862] gpiochip_setup_dev: registered GPIOs 32 to 63 on device: gpi=
ochi)
[    1.412506] gpio gpiochip3: (gpio-64-95): added GPIO chardev (254:3)    =
    =20
[    1.419097] gpiochip_setup_dev: registered GPIOs 64 to 95 on device: gpi=
ochi)
[    1.428680] gpio gpiochip4: (gpio-96-127): added GPIO chardev (254:4)   =
    =20
[    1.435394] gpiochip_setup_dev: registered GPIOs 96 to 127 on device: gp=
ioch)
[    1.445129] gpio gpiochip5: (gpio-128-159): added GPIO chardev (254:5)  =
    =20
[    1.451934] gpiochip_setup_dev: registered GPIOs 128 to 159 on device: g=
pioc)
[    1.461853] gpio gpiochip6: (gpio-160-191): added GPIO chardev (254:6)  =
    =20
[    1.468627] gpiochip_setup_dev: registered GPIOs 160 to 191 on device: g=
pioc)
[    1.478942] omap_i2c 48060000.i2c: bus 2 rev0.10 at 100 kHz             =
    =20
[    1.487365] omap_i2c 48070000.i2c: bus 0 rev0.10 at 100 kHz             =
    =20
[    1.494232] omap_i2c 48072000.i2c: bus 1 rev0.10 at 100 kHz             =
    =20
[    1.507720] omap_i2c 48350000.i2c: bus 3 rev0.10 at 100 kHz             =
    =20
[    1.523254] pinctrl-single 4a31e040.pinmux: 28 pins, size 56            =
    =20
[    1.529754] pinctrl-single 4a100040.pinmux: 203 pins, size 406          =
    =20
[    1.540710] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled     =
    =20
[    1.549438] printk: console [ttyS2] disabled                            =
    =20
[    1.553955] 48020000.serial: ttyS2 at MMIO 0x48020000 (irq =3D 112, base=
_baud 0
[    1.563110] printk: console [ttyS2] enabled                             =
    =20
[    1.563110] printk: console [ttyS2] enabled                             =
    =20
[    1.571594] printk: bootconsole [omap8250] disabled                     =
    =20
[    1.571594] printk: bootconsole [omap8250] disabled                     =
    =20
[    1.582366] 4806a000.serial: ttyS0 at MMIO 0x4806a000 (irq =3D 123, base=
_baud 0
[    1.591339] serial serial0: tty port ttyS0 registered                   =
    =20
[    1.596862] 4806c000.serial: ttyS1 at MMIO 0x4806c000 (irq =3D 124, base=
_baud 0
[    1.606384] 4806e000.serial: ttyS3 at MMIO 0x4806e000 (irq =3D 125, base=
_baud 0
[    1.615356] serial serial1: tty port ttyS3 registered                   =
    =20
[    1.623138] omapdss_dss 58000000.dss: 58000000.dss supply vdda_video not=
 four
[    1.632568] DSS: OMAP DSS rev 4.0                                       =
    =20
[    1.641571] connector-hdmi connector: GPIO lookup for consumer hpd      =
    =20
[    1.647827] connector-hdmi connector: using device tree for GPIO lookup =
    =20
[    1.654541] of_get_named_gpiod_flags: parsed 'hpd-gpios' property of nod=
e '/)
[    1.663970] gpio gpiochip2: Persistence not supported for GPIO 31       =
    =20
[    1.684143] brd: module loaded                                          =
    =20
[    1.694396] loop: module loaded                                         =
    =20
[    1.699432] mtdoops: mtd device (mtddev=3Dname/number) must be supplied =
      =20
[    1.708312] cpcap-core spi0.0: CPCAP vendor: ST rev: 2.10 (1a)          =
    =20
[    1.718719] cpcap-regulator cpcap-regulator.0: DMA mask not set         =
    =20
[    1.724884] SW5: Bringing 0uV into 5050000-5050000uV                    =
    =20
[    1.801971] cpcap-usb-phy cpcap-usb-phy.0: DMA mask not set             =
    =20
[    1.807922] cpcap-usb-phy cpcap-usb-phy.0: GPIO lookup for consumer mode=
    =20
[    1.814666] cpcap-usb-phy cpcap-usb-phy.0: using device tree for GPIO lo=
okup=20
[    1.821807] of_get_named_gpiod_flags: parsed 'mode-gpios' property of no=
de ')
[    1.836791] gpio gpiochip2: Persistence not supported for GPIO 28       =
    =20
885711] ------------[ cut here ]------------                               =
    =20
[    1.890380] WARNING: CPU: 0 PID: 1 at /data/fast/l/k/drivers/regulator/c=
ore.c
[    1.900207] Modules linked in:                                          =
    =20
[    1.903289] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.5.0-rc3-00624-g4=
6cf00
[    1.911437] Hardware name: Generic OMAP4 (Flattened Device Tree)        =
    =20
[    1.917510] [<c010f1e4>] (unwind_backtrace) from [<c010b4b0>] (show_stac=
k+0x)
[    1.925292] [<c010b4b0>] (show_stack) from [<c08ecd18>] (dump_stack+0xb4=
/0xd)
[    1.932586] [<c08ecd18>] (dump_stack) from [<c012db50>] (__warn+0xc8/0xf=
0)  =20
[    1.939483] [<c012db50>] (__warn) from [<c012dc04>] (warn_slowpath_fmt+0=
x8c/)
[    1.947021] [<c012dc04>] (warn_slowpath_fmt) from [<c0423b4c>] (_regulat=
or_p)
[    1.955261] [<c0423b4c>] (_regulator_put) from [<c0423b74>] (regulator_p=
ut+0)
[    1.963134] [<c0423b74>] (regulator_put) from [<c04ddcbc>] (release_node=
s+0x)
[    1.971099] [<c04ddcbc>] (release_nodes) from [<c04d9e0c>] (really_probe=
+0x1)
[    1.978973] [<c04d9e0c>] (really_probe) from [<c04da204>] (driver_probe_=
devi)
[    1.987304] [<c04da204>] (driver_probe_device) from [<c04d8490>] (bus_fo=
r_ea)
[    1.995880] [<c04d8490>] (bus_for_each_drv) from [<c04da11c>] (__device_=
atta)
[    2.004180] [<c04da11c>] (__device_attach) from [<c04d91b4>] (bus_probe_=
devi)
[    2.012420] [<c04d91b4>] (bus_probe_device) from [<c04d7370>] (device_ad=
d+0x)
[    2.020385] [<c04d7370>] (device_add) from [<c04dbb04>] (platform_device=
_add)
[    2.028533] [<c04dbb04>] (platform_device_add) from [<c0503a34>] (mfd_ad=
d_de)
[    2.037170] [<c0503a34>] (mfd_add_devices) from [<c0503b4c>] (devm_mfd_a=
dd_d)
[    2.045745] [<c0503b4c>] (devm_mfd_add_devices) from [<c0503f40>] (cpcap=
_pro)
[    2.054168] [<c0503f40>] (cpcap_probe) from [<c054b4ac>] (spi_drv_probe+=
0x80)
[    2.061767] [<c054b4ac>] (spi_drv_probe) from [<c04d9edc>] (really_probe=
+0x1)
[    2.069641] [<c04d9edc>] (really_probe) from [<c04da204>] (driver_probe_=
devi)
[    2.077972] [<c04da204>] (driver_probe_device) from [<c04d8490>] (bus_fo=
r_ea)
[    2.086547] [<c04d8490>] (bus_for_each_drv) from [<c04da11c>] (__device_=
atta)
[    2.094848] [<c04da11c>] (__device_attach) from [<c04d91b4>] (bus_probe_=
devi)
[    2.103057] [<c04d91b4>] (bus_probe_device) from [<c04d7370>] (device_ad=
d+0x)
[    2.111022] [<c04d7370>] (device_add) from [<c054c044>] (spi_add_device+=
0x8c)
[    2.118743] [<c054c044>] (spi_add_device) from [<c054caa8>] (spi_registe=
r_co)
[    2.127655] [<c054caa8>] (spi_register_controller) from [<c054ce10>] (de=
vm_s)
[    2.137634] [<c054ce10>] (devm_spi_register_controller) from [<c0550ab8>=
] (o)
[    2.147247] [<c0550ab8>] (omap2_mcspi_probe) from [<c04db92c>] (platform=
_drv)
[    2.155822] [<c04db92c>] (platform_drv_probe) from [<c04d9edc>] (really_=
prob)
[    2.164154] [<c04d9edc>] (really_probe) from [<c04da204>] (driver_probe_=
devi)
[    2.172454] [<c04da204>] (driver_probe_device) from [<c04da4b8>] (device=
_dri)
[    2.181365] [<c04da4b8>] (device_driver_attach) from [<c04da540>] (__dri=
ver_)
[    2.189941] [<c04da540>] (__driver_attach) from [<c04d8530>] (bus_for_ea=
ch_d)
[    2.198181] [<c04d8530>] (bus_for_each_dev) from [<c04d9370>] (bus_add_d=
rive)
[    2.206390] [<c04d9370>] (bus_add_driver) from [<c04dad1c>] (driver_regi=
ster)
[    2.214538] [<c04dad1c>] (driver_register) from [<c010281c>] (do_one_ini=
tcal)
[    2.222778] [<c010281c>] (do_one_initcall) from [<c0e00e14>] (kernel_ini=
t_fr)
[    2.231536] [<c0e00e14>] (kernel_init_freeable) from [<c0906718>] (kerne=
l_in)
[    2.239746] [<c0906718>] (kernel_init) from [<c01010e8>] (ret_from_fork+=
0x14)
[    2.247375] Exception stack(0xee88dfb0 to 0xee88dff8)                   =
    =20
[    2.252441] dfa0:                                     00000000 00000000 =
00000
[    2.260650] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 =
00000
[    2.268890] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 =
    =20
[    2.275634] ---[ end trace b0329e4be5bce62c ]---                        =
    =20
[    2.284484] SSI protocol aka McSAAB added                               =
    =20
[    2.288543] CMT speech driver added                                     =
    =20
[    2.292144] HSI/SSI char device loaded                                  =
    =20
[    2.296112] mdio_bus fixed-0: GPIO lookup for consumer reset            =
    =20
[    2.301879] mdio_bus fixed-0: using lookup tables for GPIO lookup       =
    =20
[    2.308013] mdio_bus fixed-0: No GPIO consumer reset found              =
    =20
[    2.313568] libphy: Fixed MDIO Bus: probed                              =
    =20
[    2.317993] usbcore: registered new interface driver qmi_wwan           =
    =20
[    2.323791] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver      =
    =20
[    2.330047] ohci-platform: OHCI generic platform driver                 =
    =20
[    2.336120] usbcore: registered new interface driver cdc_wdm            =
    =20
[    2.341888] usbcore: registered new interface driver option             =
    =20
[    2.347534] usbserial: USB Serial support registered for GSM modem (1-po=
rt) =20
[    2.354583] usbcore: registered new interface driver qcaux              =
    =20
[    2.360107] usbserial: USB Serial support registered for qcaux          =
    =20
[    2.365997] usbcore: registered new interface driver qcserial           =
    =20
[    2.371826] usbserial: USB Serial support registered for Qualcomm USB mo=
dem =20
[    2.380340] udc musb-hdrc.0.auto: registering UDC driver [g_ether]      =
    =20
[    2.386627] using random self ethernet address                          =
    =20
[    2.391082] using random host ethernet address                          =
    =20
[    2.395599] g_ether gadget: adding config #1 'CDC Ethernet (ECM)'/(ptrva=
l)  =20
[    2.402526] g_ether gadget: adding 'cdc_ethernet'/(ptrval) to config 'CD=
C Et)
[    2.411987] usb0: HOST MAC 32:49:60:c4:ca:72                            =
    =20
[    2.416351] usb0: MAC a6:39:ce:79:a3:50                                 =
    =20
[    2.420227] g_ether gadget: CDC Ethernet: dual speed IN/ep1in OUT/ep1out=
 NOTn
[    2.428131] g_ether gadget: cfg 1/(ptrval) speeds: high full            =
    =20
[    2.433837] g_ether gadget:   interface 0 =3D cdc_ethernet/(ptrval)     =
      =20
[    2.439971] g_ether gadget:   interface 1 =3D cdc_ethernet/(ptrval)     =
      =20
[    2.446105] g_ether gadget: Ethernet Gadget, version: Memorial Day 2008 =
    =20
[    2.452758] g_ether gadget: g_ether ready                               =
    =20
[    2.457153] mousedev: PS/2 mouse device common for all mice             =
    =20
[    2.463623] input: 4a31c000.keypad as /devices/platform/44000000.ocp/4a3=
00000
[    2.481018] atmel_mxt_ts 1-004a: GPIO lookup for consumer reset         =
    =20
[    2.486999] atmel_mxt_ts 1-004a: using device tree for GPIO lookup      =
    =20
[    2.493255] of_get_named_gpiod_flags: parsed 'reset-gpios' property of n=
ode )
[    2.508697] gpio gpiochip6: Persistence not supported for GPIO 13       =
    =20
[    2.714691] atmel_mxt_ts 1-004a: Family: 129 Variant: 1 Firmware V0.4.31=
 Obj8
[    2.739624] atmel_mxt_ts 1-004a: Direct firmware load for maxtouch.cfg f=
aile2
[    2.748626] cpcap-pwrbutton cpcap-pwrbutton.0: DMA mask not set         =
    =20
[    2.751434] atmel_mxt_ts 1-004a: Touchscreen size X1023Y1023            =
    =20
[    2.755371] input: cpcap-pwrbutton as /devices/platform/44000000.ocp/480=
00001
[    2.760406] input: Atmel maXTouch Touchscreen as /devices/platform/44000=
000.2
[    2.779846] pwm-vibrator vibrator: vibrator supply vcc not found, using =
dummr
[    2.805969] cpcap-rtc cpcap-rtc.0: DMA mask not set                     =
    =20
[    2.812072] cpcap-rtc cpcap-rtc.0: registered as rtc0                   =
    =20
[    2.822143] i2c /dev entries driver                                     =
    =20
[    2.864440] poweroff-gpio gpio-poweroff: GPIO lookup for consumer (null)=
    =20
[    2.871185] poweroff-gpio gpio-poweroff: using device tree for GPIO look=
up  =20
[    2.878143] of_get_named_gpiod_flags: parsed 'gpios' property of node '/=
gpio)
[    2.887512] gpio gpiochip2: Persistence not supported for GPIO 18       =
    =20
[    2.894104] cpcap_battery cpcap_battery.0: DMA mask not set             =
    =20
[    2.902587] cpcap_battery cpcap_battery.0: IRQ cccal not found          =
    =20
[    2.914337] cpcap-charger cpcap-charger.0: DMA mask not set             =
    =20
[    2.942687] lm75 0-0048: hwmon0: sensor 'tmp105'                        =
    =20
[    2.949707] omap_wdt: OMAP Watchdog Timer Rev 0x00: initial timeout 60 s=
ec  =20
[    2.957489] omap_wdt: OMAP Watchdog Timer Rev 0x00: initial timeout 60 s=
ec  =20
[    2.964874] Bluetooth: HCI UART driver ver 2.3                          =
    =20
[    2.969360] Bluetooth: HCI UART protocol H4 registered                  =
    =20
[    2.974609] Bluetooth: HCI UART protocol LL registered                  =
    =20
[    2.974670] hci-ti serial1-0: GPIO lookup for consumer enable           =
    =20
[    2.979949] Bluetooth: HCI UART protocol Broadcom registered            =
    =20
[    2.985595] hci-ti serial1-0: using device tree for GPIO lookup         =
    =20
[    2.992828] omap_hsmmc 4809c000.mmc: GPIO lookup for consumer cd        =
    =20
[    2.997253] of_get_named_gpiod_flags: parsed 'enable-gpios' property of =
node)
[    3.003265] omap_hsmmc 4809c000.mmc: using device tree for GPIO lookup  =
    =20
[    3.018707] gpio gpiochip6: Persistence not supported for GPIO 14       =
    =20
[    3.025177] of_get_named_gpiod_flags: parsed 'cd-gpios' property of node=
 '/o)
[    3.045227] gpio gpiochip6: Persistence not supported for GPIO 16       =
    =20
[    3.051391] omap_gpio 4805d000.gpio: Could not set line 16 debounce to 2=
0000)
[    3.060241] omap_hsmmc 4809c000.mmc: Got CD GPIO                        =
    =20
[    3.064880] omap_hsmmc 4809c000.mmc: GPIO lookup for consumer wp        =
    =20
[    3.070922] omap_hsmmc 4809c000.mmc: using device tree for GPIO lookup  =
    =20
[    3.077514] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of=
 nod'
[    3.090667] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of =
node'
[    3.103698] omap_hsmmc 4809c000.mmc: using lookup tables for GPIO lookup=
    =20
[    3.110443] omap_hsmmc 4809c000.mmc: No GPIO consumer wp found          =
    =20
[    3.144409] omap_hsmmc 480ad000.mmc: GPIO lookup for consumer wp        =
    =20
[    3.150482] omap_hsmmc 480ad000.mmc: using device tree for GPIO lookup  =
    =20
[    3.157104] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of=
 nod'
[    3.170257] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of =
node'
[    3.183319] omap_hsmmc 480ad000.mmc: using lookup tables for GPIO lookup=
    =20
[    3.190093] omap_hsmmc 480ad000.mmc: No GPIO consumer wp found          =
    =20
[    3.196868] omap_hsmmc 480b4000.mmc: GPIO lookup for consumer cd        =
    =20
[    3.202972] omap_hsmmc 480b4000.mmc: using device tree for GPIO lookup  =
    =20
[    3.209564] of_get_named_gpiod_flags: can't parse 'cd-gpios' property of=
 nod'
[    3.222747] of_get_named_gpiod_flags: can't parse 'cd-gpio' property of =
node'
[    3.235778] omap_hsmmc 480b4000.mmc: using lookup tables for GPIO lookup=
    =20
[    3.242553] omap_hsmmc 480b4000.mmc: No GPIO consumer cd found          =
    =20
[    3.248443] omap_hsmmc 480b4000.mmc: GPIO lookup for consumer wp        =
    =20
[    3.254516] omap_hsmmc 480b4000.mmc: using device tree for GPIO lookup  =
    =20
[    3.261138] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of=
 nod'
[    3.274291] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of =
node'
[    3.287353] omap_hsmmc 480b4000.mmc: using lookup tables for GPIO lookup=
    =20
[    3.294097] omap_hsmmc 480b4000.mmc: No GPIO consumer wp found          =
    =20
[    3.325469] omap_hsmmc 480d1000.mmc: GPIO lookup for consumer cd        =
    =20
[    3.331542] omap_hsmmc 480d1000.mmc: using device tree for GPIO lookup  =
    =20
[    3.338195] of_get_named_gpiod_flags: can't parse 'cd-gpios' property of=
 nod'
[    3.351348] of_get_named_gpiod_flags: can't parse 'cd-gpio' property of =
node'
[    3.364410] omap_hsmmc 480d1000.mmc: using lookup tables for GPIO lookup=
    =20
[    3.371185] omap_hsmmc 480d1000.mmc: No GPIO consumer cd found          =
    =20
[    3.377075] omap_hsmmc 480d1000.mmc: GPIO lookup for consumer wp        =
    =20
[    3.383178] omap_hsmmc 480d1000.mmc: using device tree for GPIO lookup  =
    =20
[    3.389770] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of=
 nod'
[    3.402923] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of =
node'
[    3.415985] omap_hsmmc 480d1000.mmc: using lookup tables for GPIO lookup=
    =20
[    3.422760] omap_hsmmc 480d1000.mmc: No GPIO consumer wp found          =
    =20
[    3.437347] mmc0: host does not support reading read-only switch, assumi=
ng we
[    3.449401] mmc0: new high speed SDHC card at address e624              =
    =20
[    3.455444] mmcblk0: mmc0:e624 SU16G 14.8 GiB                           =
    =20
[    3.458404] omap_hsmmc 480d5000.mmc: GPIO lookup for consumer cd        =
    =20
[    3.466156] omap_hsmmc 480d5000.mmc: using device tree for GPIO lookup  =
    =20
[    3.472900] of_get_named_gpiod_flags: can't parse 'cd-gpios' property of=
 nod'
[    3.486114] of_get_named_gpiod_flags: can't parse 'cd-gpio' property of =
node'
[    3.499542] omap_hsmmc 480d5000.mmc: using lookup tables for GPIO lookup=
    =20
[    3.499572]  mmcblk0: p1 p2                                             =
    =20
[    3.506347] omap_hsmmc 480d5000.mmc: No GPIO consumer cd found          =
    =20
[    3.515045] omap_hsmmc 480d5000.mmc: GPIO lookup for consumer wp        =
    =20
[    3.521179] omap_hsmmc 480d5000.mmc: using device tree for GPIO lookup  =
    =20
[    3.527832] of_get_named_gpiod_flags: can't parse 'wp-gpios' property of=
 nod'
[    3.541198] of_get_named_gpiod_flags: can't parse 'wp-gpio' property of =
node'
[    3.554260] random: fast init done                                      =
    =20
[    3.557739] omap_hsmmc 480d5000.mmc: using lookup tables for GPIO lookup=
    =20
[    3.564575] omap_hsmmc 480d5000.mmc: No GPIO consumer wp found          =
    =20
[    3.571319] mmc1: new high speed MMC card at address 0001               =
    =20
[    3.587341] mmcblk1: mmc1:0001 016G92 14.7 GiB                          =
    =20
[    3.592163] mmcblk1boot0: mmc1:0001 016G92 partition 1 4.00 MiB         =
    =20
[    3.597808] cpcap-led cpcap-led.0: DMA mask not set                     =
    =20
[    3.598388] mmcblk1boot1: mmc1:0001 016G92 partition 2 4.00 MiB         =
    =20
[    3.603485] cpcap-led cpcap-led.1: DMA mask not set                     =
    =20
[    3.609222] mmcblk1rpmb: mmc1:0001 016G92 partition 3 512 KiB, chardev (=
244:)
[    3.614410] cpcap-led cpcap-led.2: DMA mask not set                     =
    =20
[    3.626586] cpcap-led cpcap-led.3: DMA mask not set                     =
    =20
[    3.632141] cpcap-led cpcap-led.4: DMA mask not set                     =
    =20
[    3.637725]  mmcblk1: p1 p2 p3 p4 < p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p=
15 p>
[    3.637756] lm3532-led 0-0038: GPIO lookup for consumer enable          =
    =20
[    3.651031] mmcblk1: p25 size 16803584 extends beyond EOD, truncated    =
    =20
[    3.654846] lm3532-led 0-0038: using device tree for GPIO lookup        =
    =20
[    3.661193] mmcblk1: p26 start 31104768 is beyond EOD, truncated        =
    =20
[    3.667236] of_get_named_gpiod_flags: parsed 'enable-gpios' property of =
node)
[    3.689117] gpio gpiochip6: Persistence not supported for GPIO 12       =
    =20
[    3.695556] lm3532-led 0-0038: 0-0038 supply vin not found, using dummy =
regur
[    3.706054] ledtrig-cpu: registered to indicate activity on CPUs        =
    =20
[    3.714660] clk: failed to reparent abe_cm:clk:0060:24 to sys_clkin_ck: =
-22 =20
[    3.722869] cpcap_adc cpcap_adc.0: DMA mask not set                     =
    =20
[    3.802032] cpcap_adc cpcap_adc.0: CPCAP ADC device probed              =
    =20
[    3.808715] isl29028 1-0044: No cache defaults, reading back from HW    =
    =20
[    3.818634] of_get_named_gpiod_flags: can't parse 'gpios' property of no=
de ''
[    3.833435] ak8975 3-000c: mounting matrix not found: using identity... =
    =20
[    3.840270] ak8975 3-000c: 3-000c supply vid not found, using dummy regu=
lator
[    3.876068] gnss: GNSS driver registered with major 242                 =
    =20
[    3.883361] asoc-audio-graph-card soundcard: GPIO lookup for consumer pa=
    =20
[    3.890136] asoc-audio-graph-card soundcard: using device tree for GPIO =
lookp
[    3.897430] of_get_named_gpiod_flags: can't parse 'pa-gpios' property of=
 nod'
[    3.906036] of_get_named_gpiod_flags: can't parse 'pa-gpio' property of =
node'
[    3.914550] asoc-audio-graph-card soundcard: using lookup tables for GPI=
O lop
[    3.922119] asoc-audio-graph-card soundcard: No GPIO consumer pa found  =
    =20
[    3.932312] Initializing XFRM netlink socket                            =
    =20
[    3.936676] NET: Registered protocol family 17                          =
    =20
[    3.941162] NET: Registered protocol family 15                          =
    =20
[    3.945831] Bluetooth: RFCOMM TTY layer initialized                     =
    =20
[    3.950744] Bluetooth: RFCOMM socket layer initialized                  =
    =20
[    3.955993] Bluetooth: RFCOMM ver 1.11                                  =
    =20
[    3.959808] Bluetooth: BNEP (Ethernet Emulation) ver 1.3                =
    =20
[    3.965270] Bluetooth: BNEP filters: protocol multicast                 =
    =20
[    3.970550] Bluetooth: BNEP socket layer initialized                    =
    =20
[    3.975585] Bluetooth: HIDP (Human Interface Emulation) ver 1.2         =
    =20
[    3.981567] Bluetooth: HIDP socket layer initialized                    =
    =20
[    3.986663] NET: Registered protocol family 35                          =
    =20
[    3.991210] Key type dns_resolver registered                            =
    =20
[    3.995727] ThumbEE CPU extension supported.                            =
    =20
[    4.000061] Registering SWP/SWPB emulation handler                      =
    =20
[    4.005554] omap4_vc_i2c_timing_init: using bootloader low-speed timings=
    =20
[    4.012451] Power Management for TI OMAP4+ devices.                     =
    =20
[    4.017364] OMAP4 PM: u-boot >=3D v2012.07 is required for full PM suppo=
rt    =20
[    4.024291] SmartReflex Class3 initialized                              =
    =20
[    4.028930] Loading compiled-in X.509 certificates                      =
    =20
[    4.057250] dmm 4e000000.dmm: initialized all PAT entries               =
    =20
[    4.063140] reg-fixed-voltage regulator-hdmi: GPIO lookup for consumer (=
null)
[    4.071258] reg-fixed-voltage regulator-hdmi: using device tree for GPIO=
 loop
[    4.078857] of_get_named_gpiod_flags: can't parse 'gpios' property of no=
de ''
[    4.087646] of_get_named_gpiod_flags: parsed 'gpio' property of node '/r=
egul)
[    4.097076] gpio gpiochip2: Persistence not supported for GPIO 27       =
    =20
[    4.103240] reg-fixed-voltage regulator-lcd: GPIO lookup for consumer (n=
ull)=20
[    4.110687] reg-fixed-voltage regulator-lcd: using device tree for GPIO =
lookp
[    4.117980] of_get_named_gpiod_flags: can't parse 'gpios' property of no=
de ''
[    4.126678] of_get_named_gpiod_flags: parsed 'gpio' property of node '/r=
egul)
[    4.136047] gpio gpiochip4: Persistence not supported for GPIO 0        =
    =20
[    4.142120] lcd: supplied by SW5                                        =
    =20
[    4.145385] reg-fixed-voltage regulator-wl12xx: GPIO lookup for consumer=
 (nu)
[    4.153045] reg-fixed-voltage regulator-wl12xx: using device tree for GP=
IO lp
[    4.160614] of_get_named_gpiod_flags: can't parse 'gpios' property of no=
de ''
[    4.169525] of_get_named_gpiod_flags: parsed 'gpio' property of node '/r=
egul)
[    4.179168] gpio gpiochip3: Persistence not supported for GPIO 30       =
    =20
[    4.185729] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer ena=
ble =20
[    4.192749] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.199951] of_get_named_gpiod_flags: parsed 'enable-gpios' property of =
node)
[    4.209625] gpio gpiochip3: Persistence not supported for GPIO 31       =
    =20
[    4.215789] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer pow=
er  =20
[    4.222717] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.229919] of_get_named_gpiod_flags: parsed 'power-gpios' property of n=
ode )
[    4.239471] gpio gpiochip2: Persistence not supported for GPIO 22       =
    =20
[    4.245635] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer res=
et  =20
[    4.245635] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.259735] of_get_named_gpiod_flags: parsed 'reset-gpios' property of n=
ode )
[    4.269317] gpio gpiochip2: Persistence not supported for GPIO 17       =
    =20
[    4.275482] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer mot=
orole
[    4.283111] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.290283] of_get_named_gpiod_flags: parsed 'motorola,mode-gpios' prope=
rty )
[    4.300598] gpio gpiochip5: Persistence not supported for GPIO 20       =
    =20
[    4.306762] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer mot=
orole
[    4.306762] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.321594] of_get_named_gpiod_flags: parsed 'motorola,mode-gpios' prope=
rty )
[    4.331848] gpio gpiochip5: Persistence not supported for GPIO 21       =
    =20
[    4.331848] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer mot=
orols
[    4.345794] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.352996] of_get_named_gpiod_flags: parsed 'motorola,status-gpios' pro=
pert)
[    4.363433] gpio gpiochip2: Persistence not supported for GPIO 20       =
    =20
[    4.369567] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer mot=
orols
[    4.377380] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.384582] of_get_named_gpiod_flags: parsed 'motorola,status-gpios' pro=
pert)
[    4.395019] gpio gpiochip2: Persistence not supported for GPIO 21       =
    =20
[    4.401153] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer mot=
orols
[    4.408966] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.416137] of_get_named_gpiod_flags: parsed 'motorola,status-gpios' pro=
pert)
[    4.426605] gpio gpiochip2: Persistence not supported for GPIO 23       =
    =20
[    4.432769] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer mot=
orold
[    4.432769] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.447479] of_get_named_gpiod_flags: parsed 'motorola,cmd-gpios' proper=
ty o)
[    4.457672] gpio gpiochip4: Persistence not supported for GPIO 7        =
    =20
[    4.463714] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer mot=
orold
[    4.471252] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.478454] of_get_named_gpiod_flags: parsed 'motorola,cmd-gpios' proper=
ty o)
[    4.488647] gpio gpiochip4: Persistence not supported for GPIO 8        =
    =20
[    4.494689] phy-mapphone-mdm6600 usb-phy@1: GPIO lookup for consumer mot=
orold
[    4.494720] phy-mapphone-mdm6600 usb-phy@1: using device tree for GPIO l=
ookup
[    4.509429] of_get_named_gpiod_flags: parsed 'motorola,cmd-gpios' proper=
ty o)
[    4.519622] gpio gpiochip5: Persistence not supported for GPIO 14       =
    =20



--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXgeutgAKCRAw5/Bqldv6
8rdgAKCp2Zuufg2kA7KE78SJoZ+s0nqg0gCgkyYII+jJ657kisUq2EGtZ59lF2c=
=RW6Y
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
