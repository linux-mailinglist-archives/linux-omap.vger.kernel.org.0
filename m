Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDF18BF4CB
	for <lists+linux-omap@lfdr.de>; Thu, 26 Sep 2019 16:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfIZONG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 26 Sep 2019 10:13:06 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:34525 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfIZONF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 26 Sep 2019 10:13:05 -0400
Received: by mail-io1-f67.google.com with SMTP id q1so6998275ion.1;
        Thu, 26 Sep 2019 07:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9eJ3LuGZcqrsMGYWVAEXdvEUCIiMalW7hIhmRBiebSM=;
        b=VK0GrDeC1BPRsAeMJoYhQhtnmqJOsrmxpceBNYY9vwThrGxPLTn06QJIIW9DWuxtD0
         8S2MtJKtYlT4uyiNGeqTBNa+hK2Z8uVpqThRCGRVIx/u70ynnE8jnVKkQWL15aUmBdWQ
         3d6QM6sRJsQosQQPGb079FYMcnuca54yuhfRyT8dx8/Hq7TOFPf+83rgAhUU6Z/oXWQo
         8rVrywIvdgu1OCAPd9E7mgNvzIn12hd4/Ld+QkARFb+HzctsNe5HZMmSS+YCFl5c2nIh
         faw5ld584CeIOa7HDlAzDzuCVJU2424LwM3ZnqXVxtiqsSuGhpaLCTSbiAtYHubE8hLc
         7MdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9eJ3LuGZcqrsMGYWVAEXdvEUCIiMalW7hIhmRBiebSM=;
        b=NDxHjhmzfyiKiN2ayJUpZ/lZpyl8qgiKk04yCfUM6O8m/6K/tKVo6J1HqHOfDn/h0p
         0/M/bZxpkvponbNu9RxgxjIaDs/ICxGqxPjsxPnKFNSazqjV5oMhPpPsyIbdl8COCbOX
         DOUmRyifRYWAu6msuWODQW9CEascHsHEHFCiEHkejG+9nkGF7FmYG1yhnvEntW8uTH4l
         qIWZ0Jad4pzyzmxlzzWpywSHcej/ZRM+oPp8/HUEKH/HASU+dM/oCKO10OijERARVHg8
         9VKMpuAXTjtaZcIBl8n5qUXDITLuRCO/JhMA4XWx3jfcVFU6B++X4EPpfe4wG99Zla1H
         Hx5g==
X-Gm-Message-State: APjAAAWVcap9uksMhwVSTNJh7vtuNioGdZpfNTomCH3rRXn1WVvksrGm
        OmvtkQ9FT1Y/xd172va1KKvzgbiWpq7wRRStU18=
X-Google-Smtp-Source: APXvYqzzRFu+/r7rGcQfyw3Sd3alA9P/j3FPwh1++plG7ewxMeVgrmYL/H3IjVLXtDtfGeg78jJ4pQbvtVusRjRMo84=
X-Received: by 2002:a92:3314:: with SMTP id a20mr2584206ilf.276.1569507183259;
 Thu, 26 Sep 2019 07:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com> <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com> <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
In-Reply-To: <845055e2-8182-de74-2077-629fdf50ac6c@ti.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 26 Sep 2019 09:12:52 -0500
Message-ID: <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to dts
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 26, 2019 at 1:55 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> On 25/09/2019 23:51, Adam Ford wrote:
>
> >> Has anyone debugged why the hang is happening?
> > I started to debug this, but I got distracted when I noticed the LCD
> > did't work at all on modern kernels.  I have that fixed now, so I can
> > go back to investigating this.
> >
> > Working version:
> >

> >
> > I noticed there doesn't seem to be the calculation for setting fck,
> > pck or any of the timings.  Are there any more debug options I can
> > enable?
>
> The logs here look very different. The first one doesn't even show the
> DSS rev prints. Can you get full logs for both? And even better, if you
> can build omapdss as a kernel module, and load it after the boot, you
> won't have any "extra" going on at the same time.

Since it's build as a module, I only dumped the stuff starting after
the modules are loading.  I can provide more if you want, but I am
trying to avoid excessive noise.

5.3.1 with drivers build as modules:

[    5.143615] random: udevd: uninitialized urandom read (16 bytes read)
[    5.153869] random: udevd: uninitialized urandom read (16 bytes read)
[    5.160522] random: udevd: uninitialized urandom read (16 bytes read)
[    5.187286] udevd[104]: specified group 'kvm' unknown
[    5.240875] udevd[105]: starting eudev-3.2.7
[    6.026672] DSS: set fck to 172800000
[    6.030487] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    6.084716] omap_ssi 48058000.ssi-controller: ssi controller 0
initialized (2 ports)!
[    6.093536] omap_ssi_port 4805a000.ssi-port: GPIO lookup for
consumer ti,ssi-cawake
[    6.101348] omap_ssi_port 4805a000.ssi-port: using device tree for
GPIO lookup
[    6.108642] of_get_named_gpiod_flags: can't parse
'ti,ssi-cawake-gpios' property of node
'/ocp@68000000/ssi-controller@48058000/ssi-port@4805a000[0]'
[    6.122131] of_get_named_gpiod_flags: can't parse
'ti,ssi-cawake-gpio' property of node
'/ocp@68000000/ssi-controller@48058000/ssi-port@4805a000[0]'
[    6.135559] omap_ssi_port 4805a000.ssi-port: using lookup tables
for GPIO lookup
[    6.143035] omap_ssi_port 4805a000.ssi-port: No GPIO consumer
ti,ssi-cawake found
[    6.150543] omap_ssi_port 4805a000.ssi-port: couldn't get cawake
gpio (err=-2)!
[    6.157958] omap_ssi_port: probe of 4805a000.ssi-port failed with error -2
[    6.164978] omap_ssi_port 4805b000.ssi-port: GPIO lookup for
consumer ti,ssi-cawake
[    6.172698] omap_ssi_port 4805b000.ssi-port: using device tree for
GPIO lookup
[    6.179992] of_get_named_gpiod_flags: can't parse
'ti,ssi-cawake-gpios' property of node
'/ocp@68000000/ssi-controller@48058000/ssi-port@4805b000[0]'
[    6.193481] of_get_named_gpiod_flags: can't parse
'ti,ssi-cawake-gpio' property of node
'/ocp@68000000/ssi-controller@48058000/ssi-port@4805b000[0]'
[    6.206909] omap_ssi_port 4805b000.ssi-port: using lookup tables
for GPIO lookup
[    6.214355] omap_ssi_port 4805b000.ssi-port: No GPIO consumer
ti,ssi-cawake found
[    6.221923] omap_ssi_port 4805b000.ssi-port: couldn't get cawake
gpio (err=-2)!
[    6.229278] omap_ssi_port: probe of 4805b000.ssi-port failed with error -2
[    6.265075] at24 2-0050: GPIO lookup for consumer wp
[    6.270080] at24 2-0050: using device tree for GPIO lookup
[    6.275756] of_get_named_gpiod_flags: can't parse 'wp-gpios'
property of node '/ocp@68000000/i2c@48060000/at24@50[0]'
[    6.286499] of_get_named_gpiod_flags: can't parse 'wp-gpio'
property of node '/ocp@68000000/i2c@48060000/at24@50[0]'
[    6.297119] at24 2-0050: using lookup tables for GPIO lookup
[    6.302856] at24 2-0050: No GPIO consumer wp found
[    6.324035] tsc2004 2-0048: GPIO lookup for consumer reset
[    6.329559] tsc2004 2-0048: using device tree for GPIO lookup
[    6.335571] of_get_named_gpiod_flags: can't parse 'reset-gpios'
property of node '/ocp@68000000/i2c@48060000/tsc2004@48[0]'
[    6.346862] of_get_named_gpiod_flags: can't parse 'reset-gpio'
property of node '/ocp@68000000/i2c@48060000/tsc2004@48[0]'
[    6.358001] tsc2004 2-0048: using lookup tables for GPIO lookup
[    6.363983] tsc2004 2-0048: No GPIO consumer reset found
[    6.417541] usbcore: registered new interface driver usbfs
[    6.423309] usbcore: registered new interface driver hub
[    6.428802] usbcore: registered new device driver usb
[    6.474761] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    6.523010] twl4030_keypad 48070000.i2c:twl@48:keypad: missing or
malformed property linux,keymap: -22
[    6.532531] twl4030_keypad 48070000.i2c:twl@48:keypad: Failed to build keymap
[    6.539764] twl4030_keypad: probe of 48070000.i2c:twl@48:keypad
failed with error -22
[    6.590362] ehci-omap: OMAP-EHCI Host Controller driver
[    6.596557] ehci-omap 48064800.ehci: EHCI Host Controller
[    6.602203] ehci-omap 48064800.ehci: new USB bus registered,
assigned bus number 1
[    6.646911] DSS: set fck to 172800000
[    6.650848] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    6.730804] at24 2-0050: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[    6.756164] input: twl4030_pwrbutton as
/devices/platform/68000000.ocp/48070000.i2c/i2c-0/0-0048/48070000.i2c:twl@48:pwrbutton/input/input2
[    6.778076] DSS: set fck to 172800000
[    6.782104] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    6.794891] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    6.892547] ohci-platform: OHCI generic platform driver
[    6.898437] ohci-platform 48064400.ohci: Generic Platform OHCI controller
[    6.905456] ohci-platform 48064400.ohci: new USB bus registered,
assigned bus number 2
[    6.954040] DSS: set fck to 172800000
[    6.957824] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    6.968170] input: TSC200X touchscreen as
/devices/platform/68000000.ocp/48060000.i2c/i2c-2/2-0048/input/input0
[    7.093811] DSS: set fck to 172800000
[    7.097625] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    7.224639] omap-mailbox 48094000.mailbox: omap mailbox rev 0x40
[    7.274658] twl_rtc 48070000.i2c:twl@48:rtc: Enabling TWL-RTC
[    7.292907] DSS: set fck to 172800000
[    7.297119] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    7.316192] twl_rtc 48070000.i2c:twl@48:rtc: registered as rtc0
[    7.431549] musb-hdrc musb-hdrc.0.auto: MUSB HDRC host driver
[    7.437469] musb-hdrc musb-hdrc.0.auto: new USB bus registered,
assigned bus number 3
[    7.450439] twl4030_usb 48070000.i2c:twl@48:twl4030-usb:
Initialized TWL4030 USB module
[    7.526092] usb usb3: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.03
[    7.534576] usb usb3: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    7.541931] usb usb3: Product: MUSB HDRC host driver
[    7.546936] usb usb3: Manufacturer: Linux
5.3.1-00003-g848fbc000e72-dirty musb-hcd
[    7.554595] usb usb3: SerialNumber: musb-hdrc.0.auto
[    7.590911] Driver for 1-wire Dallas network protocol.
[    7.640197] DSS: set fck to 172800000
[    7.644134] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    7.711212] omap_hdq 480b2000.1w: OMAP HDQ Hardware Rev 0.5. Driver
in Interrupt mode
[    7.722930] mc: Linux media interface: v0.10
[    7.809753] videodev: Linux video capture interface: v2.00
[    7.858215] ohci-platform 48064400.ohci: irq 92, io mem 0x48064400
[    7.875671] hub 3-0:1.0: USB hub found
[    7.890167] omap_wdt: OMAP Watchdog Timer Rev 0x31: initial timeout 60 sec
[    7.899566] DSS: set fck to 172800000
[    7.903533] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    7.915832] hub 3-0:1.0: 1 port detected
[    7.959960] w1_master_driver w1_bus_master1: Attaching one wire
slave 01.000000000000 crc 3d
[    8.080474] DSS: set fck to 172800000
[    8.084411] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    8.127838] power_supply bq27000-battery:
power_supply_get_battery_info currently only supports devicetree
[    8.162322] usb usb2: New USB device found, idVendor=1d6b,
idProduct=0001, bcdDevice= 5.03
[    8.170654] usb usb2: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    8.178039] usb usb2: Product: Generic Platform OHCI controller
[    8.184051] usb usb2: Manufacturer: Linux
5.3.1-00003-g848fbc000e72-dirty ohci_hcd
[    8.191680] usb usb2: SerialNumber: 48064400.ohci
[    8.202484] ehci-omap 48064800.ehci: irq 93, io mem 0x48064800
[    8.245422] ehci-omap 48064800.ehci: USB 2.0 started, EHCI 1.00
[    8.283508] DSS: set fck to 172800000
[    8.287322] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    8.304565] omap3isp 480bc000.isp: ignoring dependency for device,
assuming no driver
[    8.312774] omap3isp 480bc000.isp: 480bc000.isp supply vdd-csiphy1
not found, using dummy regulator
[    8.322143] omap3isp 480bc000.isp: 480bc000.isp supply vdd-csiphy2
not found, using dummy regulator
[    8.331665] omap3isp 480bc000.isp: Revision 15.0 found
[    8.337585] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
[    8.343811] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP
CCP2 was not initialized!
[    8.502380] DSS: set fck to 172800000
[    8.506195] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    8.580474] hub 2-0:1.0: USB hub found
[    8.611572] pwm-backlight backlight: GPIO lookup for consumer enable
[    8.617980] pwm-backlight backlight: using device tree for GPIO lookup
[    8.624694] of_get_named_gpiod_flags: parsed 'enable-gpios'
property of node '/backlight[0]' - status (0)
[    8.634368] gpio gpiochip4: Persistence not supported for GPIO 26
[    8.640502] no flags found for enable
[    8.644287] pwm-backlight backlight: backlight supply power not
found, using dummy regulator
[    8.661285] hub 2-0:1.0: 3 ports detected
[    8.674255] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/gpio_keys/sysboot2[0]' - status (0)
[    8.684326] gpio gpiochip0: Persistence not supported for GPIO 2
[    8.690673] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/gpio_keys/sysboot5[0]' - status (0)
[    8.700561] gpio gpiochip0: Persistence not supported for GPIO 7
[    8.706848] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/gpio_keys/gpio1[0]' - status (0)
[    8.716491] gpio gpiochip5: Persistence not supported for GPIO 21
[    8.722839] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/gpio_keys/gpio2[0]' - status (0)
[    8.732421] gpio gpiochip5: Persistence not supported for GPIO 18
[    8.738983] input: gpio_keys as /devices/platform/gpio_keys/input/input3
[    8.791473] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/leds/user0[0]' - status (0)
[    8.812042] usb usb1: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.03
[    8.820373] usb usb1: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    8.827728] usb usb1: Product: EHCI Host Controller
[    8.832672] usb usb1: Manufacturer: Linux
5.3.1-00003-g848fbc000e72-dirty ehci_hcd
[    8.840270] usb usb1: SerialNumber: 48064800.ehci
[    8.903961] no flags found for gpios
[    8.909759] of_get_named_gpiod_flags: can't parse
'ti,jack-det-gpio' property of node '/sound[0]'
[    8.919403] of_get_named_gpiod_flags: can't parse
'ti,hs_extmute_gpio' property of node
'/ocp@68000000/i2c@48070000/twl@48/audio/codec[0]'
[    8.933105] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/leds/led1[0]' - status (0)
[    8.942230] gpio gpiochip5: Persistence not supported for GPIO 20
[    8.948364] no flags found for gpios
[    8.952270] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/leds/led2[0]' - status (0)
[    8.961334] gpio gpiochip5: Persistence not supported for GPIO 19
[    8.967468] no flags found for gpios
[    9.002960] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP
CSI2a was not initialized!
[    9.035003] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP
CCDC was not initialized!
[    9.055084] hub 1-0:1.0: USB hub found
[    9.068878] panel-simple display: display supply power not found,
using dummy regulator
[    9.077239] panel-simple display: GPIO lookup for consumer enable
[    9.083465] panel-simple display: using device tree for GPIO lookup
[    9.089813] of_get_named_gpiod_flags: parsed 'enable-gpios'
property of node '/display[0]' - status (0)
[    9.099304] gpio gpiochip4: Persistence not supported for GPIO 27
[    9.115875] hub 1-0:1.0: 3 ports detected
[    9.120910] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP
preview was not initialized!
[    9.164428] omap-twl4030 sound: twl4030-hifi <-> 49022000.mcbsp mapping ok
[    9.187957] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP
resizer was not initialized!
[    9.244628] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP
AEWB was not initialized!
[    9.253326] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP
AF was not initialized!
[    9.261810] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP
histogram was not initialized!
[    9.332031] pwm-backlight backlight: GPIO lookup for consumer enable
[    9.338439] pwm-backlight backlight: using device tree for GPIO lookup
[    9.345184] of_get_named_gpiod_flags: parsed 'enable-gpios'
property of node '/backlight[0]' - status (0)
[    9.354858] gpio gpiochip4: Persistence not supported for GPIO 26
[    9.361022] no flags found for enable
[    9.364776] pwm-backlight backlight: backlight supply power not
found, using dummy regulator
[    9.376739] panel-simple display: display supply power not found,
using dummy regulator
[    9.385040] panel-simple display: GPIO lookup for consumer enable
[    9.391204] panel-simple display: using device tree for GPIO lookup
[    9.397552] of_get_named_gpiod_flags: parsed 'enable-gpios'
property of node '/display[0]' - status (0)
[    9.407043] gpio gpiochip4: Persistence not supported for GPIO 27
[    9.413970] DSS: set fck to 172800000
[    9.417724] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    9.714416] DSS: dss_runtime_get
[    9.717773] DSS: dss_restore_context
[    9.721557] DSS: OMAP DSS rev 2.0
[    9.724884] DSS: dss_runtime_put
[    9.728149] DSS: dss_save_context
[    9.731506] DSS: context saved
[    9.735382] DSS: dss_restore_context
[    9.738983] DSS: context restored
[    9.743286] DISPC: dispc_runtime_get
[    9.746917] DISPC: fifo(0) threshold (bytes), old 960/1023, new 960/1023
[    9.753753] DISPC: fifo(1) threshold (bytes), old 960/1023, new 960/1023
[    9.760498] DISPC: fifo(2) threshold (bytes), old 960/1023, new 960/1023
[    9.767242] DISPC: dispc_restore_context
[    9.771301] DISPC: dispc_restore_gamma_tables()
[    9.775909] DISPC: fifo(0) threshold (bytes), old 960/1023, new 960/1023
[    9.782714] DISPC: fifo(1) threshold (bytes), old 960/1023, new 960/1023
[    9.789428] DISPC: fifo(2) threshold (bytes), old 960/1023, new 960/1023
[    9.796203] omapdss_dispc 48050400.dispc: OMAP DISPC rev 3.0
[    9.801940] DISPC: dispc_runtime_put
[    9.805541] DISPC: dispc_save_context
[    9.809265] DISPC: context saved
[    9.812744] omapdss_dss 48050000.dss: bound 48050400.dispc (ops
hdmi5_configure [omapdss])
[    9.839477] mousedev: PS/2 mouse device common for all mice
[   10.145874] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[   10.173217] DSS: dss_save_context
[   10.176666] DSS: context saved
[   10.317047] omapdrm omapdrm.0: DMM not available, disable DMM support
[   10.323730] omapdss_dss 48050000.dss: connect(NULL, 48050000.dss)
[   10.329864] omapdss_dss 48050000.dss: connect(48050000.dss, NULL)
[   10.336151] DISPC: dispc_runtime_get
[   10.339813] DSS: dss_restore_context
[   10.343475] DSS: context restored
[   10.346832] DISPC: dispc_runtime_put
[   10.350433] DISPC: dispc_save_context
[   10.354156] DISPC: context saved
[   10.357452] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   10.364135] [drm] No driver support for vblank timestamp query.
[   10.374847] DSS: dss_save_context
[   10.378265] DSS: context saved

Sorry for all the nosice, but the working splat with the divider set to 4:

Populating /dev using udev: [    4.766082] udevd[104]: starting version 3.2.7
[    4.829711] random: udevd: uninitialized urandom read (16 bytes read)
[    4.839935] random: udevd: uninitialized urandom read (16 bytes read)
[    4.847320] random: udevd: uninitialized urandom read (16 bytes read)
[    4.873870] udevd[104]: specified group 'kvm' unknown
[    4.926696] udevd[105]: starting eudev-3.2.7
[    5.715698] DSS: set fck to 172800000
[    5.719512] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    5.777435] omap_ssi 48058000.ssi-controller: ssi controller 0
initialized (2 ports)!
[    5.786315] omap_ssi_port 4805a000.ssi-port: GPIO lookup for
consumer ti,ssi-cawake
[    5.794128] omap_ssi_port 4805a000.ssi-port: using device tree for
GPIO lookup
[    5.801452] of_get_named_gpiod_flags: can't parse
'ti,ssi-cawake-gpios' property of node
'/ocp@68000000/ssi-controller@48058000/ssi-port@4805a000[0]'
[    5.814971] of_get_named_gpiod_flags: can't parse
'ti,ssi-cawake-gpio' property of node
'/ocp@68000000/ssi-controller@48058000/ssi-port@4805a000[0]'
[    5.828369] omap_ssi_port 4805a000.ssi-port: using lookup tables
for GPIO lookup
[    5.835845] omap_ssi_port 4805a000.ssi-port: No GPIO consumer
ti,ssi-cawake found
[    5.843414] omap_ssi_port 4805a000.ssi-port: couldn't get cawake
gpio (err=-2)!
[    5.850769] omap_ssi_port: probe of 4805a000.ssi-port failed with error -2
[    5.857788] omap_ssi_port 4805b000.ssi-port: GPIO lookup for
consumer ti,ssi-cawake
[    5.865539] omap_ssi_port 4805b000.ssi-port: using device tree for
GPIO lookup
[    5.872863] of_get_named_gpiod_flags: can't parse
'ti,ssi-cawake-gpios' property of node
'/ocp@68000000/ssi-controller@48058000/ssi-port@4805b000[0]'
[    5.886352] of_get_named_gpiod_flags: can't parse
'ti,ssi-cawake-gpio' property of node
'/ocp@68000000/ssi-controller@48058000/ssi-port@4805b000[0]'
[    5.899780] omap_ssi_port 4805b000.ssi-port: using lookup tables
for GPIO lookup
[    5.907257] omap_ssi_port 4805b000.ssi-port: No GPIO consumer
ti,ssi-cawake found
[    5.914794] omap_ssi_port 4805b000.ssi-port: couldn't get cawake
gpio (err=-2)!
[    5.922180] omap_ssi_port: probe of 4805b000.ssi-port failed with error -2
[    5.973175] at24 2-0050: GPIO lookup for consumer wp
[    5.978210] at24 2-0050: using device tree for GPIO lookup
[    5.983856] of_get_named_gpiod_flags: can't parse 'wp-gpios'
property of node '/ocp@68000000/i2c@48060000/at24@50[0]'
[    5.994567] of_get_named_gpiod_flags: can't parse 'wp-gpio'
property of node '/ocp@68000000/i2c@48060000/at24@50[0]'
[    6.005187] at24 2-0050: using lookup tables for GPIO lookup
[    6.010894] at24 2-0050: No GPIO consumer wp found
[    6.018280] tsc2004 2-0048: GPIO lookup for consumer reset
[    6.023956] tsc2004 2-0048: using device tree for GPIO lookup
[    6.029754] of_get_named_gpiod_flags: can't parse 'reset-gpios'
property of node '/ocp@68000000/i2c@48060000/tsc2004@48[0]'
[    6.041015] of_get_named_gpiod_flags: can't parse 'reset-gpio'
property of node '/ocp@68000000/i2c@48060000/tsc2004@48[0]'
[    6.052154] tsc2004 2-0048: using lookup tables for GPIO lookup
[    6.058105] tsc2004 2-0048: No GPIO consumer reset found
[    6.159973] usbcore: registered new interface driver usbfs
[    6.165771] usbcore: registered new interface driver hub
[    6.171325] usbcore: registered new device driver usb
[    6.211181] twl4030_keypad 48070000.i2c:twl@48:keypad: missing or
malformed property linux,keymap: -22
[    6.220550] twl4030_keypad 48070000.i2c:twl@48:keypad: Failed to build keymap
[    6.227844] twl4030_keypad: probe of 48070000.i2c:twl@48:keypad
failed with error -22
[    6.242553] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    6.265563] ohci-platform: OHCI generic platform driver
[    6.271759] ohci-platform 48064400.ohci: Generic Platform OHCI controller
[    6.278625] ohci-platform 48064400.ohci: new USB bus registered,
assigned bus number 1
[    6.420623] input: twl4030_pwrbutton as
/devices/platform/68000000.ocp/48070000.i2c/i2c-0/0-0048/48070000.i2c:twl@48:pwrbutton/input/input2
[    6.438446] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    6.445220] Warning! ehci_hcd should always be loaded before
uhci_hcd and ohci_hcd, not after
[    6.491607] at24 2-0050: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
[    6.506927] DSS: set fck to 172800000
[    6.510711] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    6.608886] ehci-omap: OMAP-EHCI Host Controller driver
[    6.614868] ehci-omap 48064800.ehci: EHCI Host Controller
[    6.620330] ehci-omap 48064800.ehci: new USB bus registered,
assigned bus number 2
[    6.647247] input: TSC200X touchscreen as
/devices/platform/68000000.ocp/48060000.i2c/i2c-2/2-0048/input/input0
[    6.659362] DSS: set fck to 172800000
[    6.663299] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    6.804473] DSS: set fck to 172800000
[    6.808288] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    6.890747] ohci-platform 48064400.ohci: irq 92, io mem 0x48064400
[    6.947784] omap-mailbox 48094000.mailbox: omap mailbox rev 0x40
[    7.014312] DSS: set fck to 172800000
[    7.018127] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    7.029022] twl_rtc 48070000.i2c:twl@48:rtc: Enabling TWL-RTC
[    7.096252] twl_rtc 48070000.i2c:twl@48:rtc: registered as rtc0
[    7.154327] DSS: set fck to 172800000
[    7.158111] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    7.168792] usb usb1: New USB device found, idVendor=1d6b,
idProduct=0001, bcdDevice= 5.03
[    7.177246] usb usb1: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    7.184570] usb usb1: Product: Generic Platform OHCI controller
[    7.190521] usb usb1: Manufacturer: Linux
5.3.1-00004-g468b8eee984c-dirty ohci_hcd
[    7.198181] usb usb1: SerialNumber: 48064400.ohci
[    7.204467] musb-hdrc musb-hdrc.0.auto: MUSB HDRC host driver
[    7.235412] Driver for 1-wire Dallas network protocol.
[    7.282104] omap_hdq 480b2000.1w: OMAP HDQ Hardware Rev 0.5. Driver
in Interrupt mode
[    7.322814] ehci-omap 48064800.ehci: irq 93, io mem 0x48064800
[    7.330871] twl4030_usb 48070000.i2c:twl@48:twl4030-usb:
Initialized TWL4030 USB module
[    7.342529] DSS: set fck to 172800000
[    7.346435] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    7.375427] ehci-omap 48064800.ehci: USB 2.0 started, EHCI 1.00
[    7.429779] hub 1-0:1.0: USB hub found
[    7.433898] hub 1-0:1.0: 3 ports detected
[    7.458923] DSS: set fck to 172800000
[    7.462921] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    7.472778] musb-hdrc musb-hdrc.0.auto: new USB bus registered,
assigned bus number 3
[    7.510559] w1_master_driver w1_bus_master1: Attaching one wire
slave 01.000000000000 crc 3d
[    7.526550] mc: Linux media interface: v0.10
[    7.590454] usb usb3: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.03
[    7.598937] usb usb3: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    7.606231] usb usb3: Product: MUSB HDRC host driver
[    7.611297] usb usb3: Manufacturer: Linux
5.3.1-00004-g468b8eee984c-dirty musb-hcd
[    7.618896] usb usb3: SerialNumber: musb-hdrc.0.auto
[    7.691284] DSS: set fck to 172800000
[    7.695190] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    7.738800] power_supply bq27000-battery:
power_supply_get_battery_info currently only supports devicetree
[    7.772583] videodev: Linux video capture interface: v2.00
[    7.810089] omap_wdt: OMAP Watchdog Timer Rev 0x31: initial timeout 60 sec
[    7.908386] DSS: set fck to 172800000
[    7.912292] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    8.029205] hub 3-0:1.0: USB hub found
[    8.077514] hub 3-0:1.0: 1 port detected
[    8.129760] usb usb2: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.03
[    8.138305] usb usb2: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    8.145629] usb usb2: Product: EHCI Host Controller
[    8.150543] usb usb2: Manufacturer: Linux
5.3.1-00004-g468b8eee984c-dirty ehci_hcd
[    8.158172] usb usb2: SerialNumber: 48064800.ehci
[    8.201690] omap3isp 480bc000.isp: ignoring dependency for device,
assuming no driver
[    8.209808] omap3isp 480bc000.isp: 480bc000.isp supply vdd-csiphy1
not found, using dummy regulator
[    8.219207] omap3isp 480bc000.isp: 480bc000.isp supply vdd-csiphy2
not found, using dummy regulator
[    8.228729] omap3isp 480bc000.isp: Revision 15.0 found
[    8.234710] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
[    8.240844] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP
CCP2 was not initialized!
[    8.268341] DSS: set fck to 172800000
[    8.272338] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    8.372863] pwm-backlight backlight: GPIO lookup for consumer enable
[    8.379272] pwm-backlight backlight: using device tree for GPIO lookup
[    8.386047] of_get_named_gpiod_flags: parsed 'enable-gpios'
property of node '/backlight[0]' - status (0)
[    8.395751] gpio gpiochip4: Persistence not supported for GPIO 26
[    8.401916] no flags found for enable
[    8.405639] pwm-backlight backlight: backlight supply power not
found, using dummy regulator
[    8.437988] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/gpio_keys/sysboot2[0]' - status (0)
[    8.448120] gpio gpiochip0: Persistence not supported for GPIO 2
[    8.454620] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/gpio_keys/sysboot5[0]' - status (0)
[    8.464477] gpio gpiochip0: Persistence not supported for GPIO 7
[    8.470733] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/gpio_keys/gpio1[0]' - status (0)
[    8.480346] gpio gpiochip5: Persistence not supported for GPIO 21
[    8.486694] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/gpio_keys/gpio2[0]' - status (0)
[    8.496307] gpio gpiochip5: Persistence not supported for GPIO 18
[    8.502868] input: gpio_keys as /devices/platform/gpio_keys/input/input3
[    8.555450] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/leds/user0[0]' - status (0)
[    8.614593] of_get_named_gpiod_flags: can't parse
'ti,jack-det-gpio' property of node '/sound[0]'
[    8.624176] of_get_named_gpiod_flags: can't parse
'ti,hs_extmute_gpio' property of node
'/ocp@68000000/i2c@48070000/twl@48/audio/codec[0]'
[    8.655914] hub 2-0:1.0: USB hub found
[    8.671874] hub 2-0:1.0: 3 ports detected
[    8.738494] no flags found for gpios
[    8.746582] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/leds/led1[0]' - status (0)
[    8.755798] gpio gpiochip5: Persistence not supported for GPIO 20
[    8.761993] no flags found for gpios
[    8.765838] of_get_named_gpiod_flags: parsed 'gpios' property of
node '/leds/led2[0]' - status (0)
[    8.774902] gpio gpiochip5: Persistence not supported for GPIO 19
[    8.781066] no flags found for gpios
[    8.815582] panel-simple display: display supply power not found,
using dummy regulator
[    8.823944] panel-simple display: GPIO lookup for consumer enable
[    8.830078] panel-simple display: using device tree for GPIO lookup
[    8.836517] of_get_named_gpiod_flags: parsed 'enable-gpios'
property of node '/display[0]' - status (0)
[    8.846038] gpio gpiochip4: Persistence not supported for GPIO 27
[    8.863037] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP
CSI2a was not initialized!
[    8.880096] omap-twl4030 sound: twl4030-hifi <-> 49022000.mcbsp mapping ok
[    8.909973] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP
CCDC was not initialized!
[    8.955505] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP
preview was not initialized!
[    8.996673] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP
resizer was not initialized!
[    9.024017] pwm-backlight backlight: GPIO lookup for consumer enable
[    9.030426] pwm-backlight backlight: using device tree for GPIO lookup
[    9.037170] of_get_named_gpiod_flags: parsed 'enable-gpios'
property of node '/backlight[0]' - status (0)
[    9.046813] gpio gpiochip4: Persistence not supported for GPIO 26
[    9.052978] no flags found for enable
[    9.056701] pwm-backlight backlight: backlight supply power not
found, using dummy regulator
[    9.068450] panel-simple display: display supply power not found,
using dummy regulator
[    9.076690] panel-simple display: GPIO lookup for consumer enable
[    9.082855] panel-simple display: using device tree for GPIO lookup
[    9.089202] of_get_named_gpiod_flags: parsed 'enable-gpios'
property of node '/display[0]' - status (0)
[    9.098693] gpio gpiochip4: Persistence not supported for GPIO 27
[    9.105438] DSS: set fck to 172800000
[    9.109191] omapdss_dss 48050000.dss: 48050000.dss supply
vdda_video not found, using dummy regulator
[    9.139343] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP
AEWB was not initialized!
[    9.148101] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP
AF was not initialized!
[    9.156555] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP
histogram was not initialized!
[    9.296691] mousedev: PS/2 mouse device common for all mice
[    9.480438] DSS: dss_runtime_get
[    9.483886] DSS: dss_restore_context
[    9.487487] DSS: OMAP DSS rev 2.0
[    9.490814] DSS: dss_runtime_put
[    9.494140] DSS: dss_save_context
[    9.497467] DSS: context saved
[    9.501251] DSS: dss_restore_context
[    9.504852] DSS: context restored
[    9.508941] DISPC: dispc_runtime_get
[    9.512725] DISPC: fifo(0) threshold (bytes), old 960/1023, new 960/1023
[    9.519470] DISPC: fifo(1) threshold (bytes), old 960/1023, new 960/1023
[    9.526275] DISPC: fifo(2) threshold (bytes), old 960/1023, new 960/1023
[    9.533020] DISPC: dispc_restore_context
[    9.536987] DISPC: dispc_restore_gamma_tables()
[    9.541564] DISPC: fifo(0) threshold (bytes), old 960/1023, new 960/1023
[    9.548309] DISPC: fifo(1) threshold (bytes), old 960/1023, new 960/1023
[    9.555053] DISPC: fifo(2) threshold (bytes), old 960/1023, new 960/1023
[    9.561828] omapdss_dispc 48050400.dispc: OMAP DISPC rev 3.0
[    9.567504] DISPC: dispc_runtime_put
[    9.571136] DISPC: dispc_save_context
[    9.574829] DISPC: context saved
[    9.578247] omapdss_dss 48050000.dss: bound 48050400.dispc (ops
hdmi5_configure [omapdss])
[    9.709533] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[    9.781860] DSS: dss_save_context
[    9.785278] DSS: context saved
[    9.967437] omapdrm omapdrm.0: DMM not available, disable DMM support
[    9.974121] omapdss_dss 48050000.dss: connect(NULL, 48050000.dss)
[    9.980255] omapdss_dss 48050000.dss: connect(48050000.dss, NULL)
[    9.986541] DISPC: dispc_runtime_get
[    9.990203] DSS: dss_restore_context
[    9.993865] DSS: context restored
[    9.997222] DISPC: dispc_runtime_put
[   10.000793] DISPC: dispc_save_context
[   10.004547] DISPC: context saved
[   10.007843] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   10.014526] [drm] No driver support for vblank timestamp query.
[   10.022430] DSS: dss_save_context
[   10.025787] DSS: context saved
[   10.059051] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   10.076721] DISPC: dispc_runtime_get
[   10.076812] DSS: dss_restore_context
[   10.076812] DSS: context restored
[   10.076873] DPI: dpi_set_timings
[   10.076904] DISPC: dispc_ovl_setup 0, pa 0x8e900000, pa_uv
0x00000000, sw 480, 0,0, 480x272 -> 480x272, cmode 34325258, rot 1,
chan 0 repl 1
[   10.076904] DISPC: scrw 480, width 480
[   10.076904] DISPC: offset0 0, offset1 0, row_inc 1, pix_inc 1
[   10.076934] DISPC: 0,0 480x272 -> 480x272
[   10.076934] DISPC: dispc_enable_plane 0, 1
[   10.076934] DISPC: dispc_runtime_get
[   10.076995] DISPC: dispc_runtime_get
[   10.076995] DSS: set fck to 36000000
[   10.077026] DISPC: lck = 36000000 (1)
[   10.077026] DISPC: pck = 9000000 (4)
[   10.079132] DISPC: channel 0 xres 480 yres 272
[   10.079132] DISPC: pck 9000000
[   10.079132] DISPC: hsync_len 42 hfp 3 hbp 2 vsw 11 vfp 2 vbp 3
[   10.079162] DISPC: vsync_level 1 hsync_level 1 data_pclk_edge 1
de_level 1 sync_pclk_edge -1
[   10.079162] DISPC: hsync 17077Hz, vsync 59Hz
[   10.564025] DISPC: dispc_runtime_put
[   10.564147] Console: switching to colour frame buffer device 60x34
[   10.564514] DISPC: dispc_runtime_get
[   10.564575] DISPC: dispc_ovl_setup 0, pa 0x8e900000, pa_uv
0x00000000, sw 480, 0,0, 480x272 -> 480x272, cmode 34325258, rot 1,
chan 0 repl 1
[   10.564605] DISPC: scrw 480, width 480
[   10.564636] DISPC: offset0 0, offset1 0, row_inc 1, pix_inc 1
[   10.564666] DISPC: 0,0 480x272 -> 480x272
[   10.564666] DISPC: dispc_enable_plane 0, 1
[   10.564697] DISPC: GO LCD
[   10.568481] DISPC: dispc_runtime_put
[   10.718139] omapdrm omapdrm.0: fb0: omapdrmdrmfb frame buffer device
[   10.726226] [drm] Initialized omapdrm 1.0.0 20110917 for omapdrm.0 on minor 0
done
Initializing random number generator... [   10.828277] urandom_read: 1
callbacks suppressed
[   10.828277] random: dd: uninitialized urandom read (512 bytes read)
done.
Starting system message bus: [   10.896789] random: dbus-uuidgen:
uninitialized urandom read (12 bytes read)
[   10.904510] random: dbus-uuidgen: uninitialized urandom read (8 bytes read)
done
Starting network: OK

Welcome to Buildroot
buildroot login: [   11.284576] wlcore: WARNING Detected unconfigured
mac address in nvs, derive from fuse instead.
[   11.293518] wlcore: WARNING Your device performance is not optimized.
[   11.299987] wlcore: WARNING Please use the calibrator tool to
configure your device.
[   11.313751] wlcore: loaded
[   11.761871] DISPC: dispc_runtime_get
[   11.765563] DISPC: dispc_ovl_setup 0, pa 0x8e900000, pa_uv
0x00000000, sw 480, 0,0, 480x272 -> 480x272, cmode 34325258, rot 1,
chan 0 repl 1
[   11.778472] DISPC: scrw 480, width 480
[   11.782348] DISPC: offset0 0, offset1 0, row_inc 1, pix_inc 1
[   11.788177] DISPC: 0,0 480x272 -> 480x272
[   11.792297] DISPC: dispc_enable_plane 0, 1
[   11.796447] DISPC: GO LCD
[   11.803985] DISPC: dispc_runtime_put

>
> And what is the hdmi5_configure there? I don't see anything in the
> driver that would print hdmi5_configure. And, of course, there's no
> hdmi5 on that platform. Hmm, ok... it's from component.c, using "%ps".
> Somehow that goes wrong. Which is a bit alarming, but perhaps a totally
> different issue.

I'll try to take a look later.  For Logic PD distributions, we create
a custom defconfig with all those drivers removed, so I'm not worked
up about it, but it would be nice to not call drivers that don't
exist.

>
> The hang happens at an odd time. The last line shows that the driver has
> managed to do its work at suspend time. Afaics, the only thing the
> driver does after that is calling pinctrl_pm_select_sleep_state(). You
> could add a print after that to be sure that goes fine. But I suspect it
> does.
>
> Which then hints that the hang is somewhere outside the driver, in
> omap_device perhaps?

Thanks for reviewing this.  I've been coping for a while by manually
changing the config option, but with 5.4 being the expected next LTS,
I was hoping to address this so I don't have to keep working around
it.

>
> You could try adding an extra call to dss_runtime_get(). Say, at the
> beginning of dss_probe_hardware(), do another dss_runtime_get(). That
> should force DSS to be always on (until reboot). runtime PM suspend
> related bugs should disappear.

I'll send out a second e-mail with some of your suggestions, but I
don't want to litter this e-mail with too many logs.

adam
>
>   Tomi
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
