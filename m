Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1D921F805B
	for <lists+linux-omap@lfdr.de>; Sat, 13 Jun 2020 04:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgFMC1I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Jun 2020 22:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbgFMC1H (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 12 Jun 2020 22:27:07 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C786FC03E96F
        for <linux-omap@vger.kernel.org>; Fri, 12 Jun 2020 19:27:07 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id y5so12232217iob.12
        for <linux-omap@vger.kernel.org>; Fri, 12 Jun 2020 19:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=aWU6EA3NeGobb0KrAuSCDwsU0qyJqr7JoXK7aHHkUdI=;
        b=blq63GWml6cdASjQhjRYdMBek3IC5SvhzWKVgE+sDTHORhsirh7JVBgeQ8YfQzAD9y
         /7r+rNHO7Hr+1BNiXNXnnasoFzuI8etN8Ui2rijMg51zW6ZRFN2MT9UsVxJmnKiEolqu
         7RJy38Ehl0/9o7NVaJLsa6ObIcVSJED461JHklM1y8vAiGbDgu6Z9+t24Hh4nRMnr83d
         WuFzBEbTXAUxNMMw7qxfpiwNacP1UECFWYWxShYjlhgmFV3BWwORvyimH3XGURmBbXaw
         DhwCvynD92c4HJ8dCUAsHTHKlStW1BUj7EmYURHDGLvnJIpM1SzU5ztmJmwBh+K0WzeU
         hLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=aWU6EA3NeGobb0KrAuSCDwsU0qyJqr7JoXK7aHHkUdI=;
        b=gLUElMAYSgLIc/24PGnbYVckW8dpct4/f7xNHRC/bjW+I0kM4mtTHbD5v6jyv7AVwf
         R1OU8wl+rwp5qIMvK3DQhK0XFiD85GYiEOadz7wLqpURG47kpdUecF3E+vOWcce+kGfS
         Mf5Cbl5/sWhC4sJrTSYQGME/1g+ZFLfQqaqdv2A/X4V2SaPs2magRiU2pp7GWSU42e0a
         b/W68QWB8Sc5XXUWScjnS7TdUW4CopE2YMjVya0Y7rQ8iFyEZqee5spQz7BUFNv7eI6C
         GNkQlFErE+Ly5kyxYFZYzpCApyRoc4Vvx0P+RTO1muaGiNXV4rCEJ6YMxzQ/yiYgedAa
         7npA==
X-Gm-Message-State: AOAM532BwMVNyynhlz0x7akXarHdmsKfMx/p6tlyMo7Du6zPc/zNKSjn
        MAvNLRtfhhrigKrkEnOVoe3zlFnVXLbRK2w0qzI7L7QCqPDV/g==
X-Google-Smtp-Source: ABdhPJwgcN4Es8NEfjpyh22FfoxufBR2Qadlr7OanCSEA1j5LMJeGEUptdiKoT7zN0TLYS6ksqVvzxkKD3uPMJqNKvY=
X-Received: by 2002:a6b:740b:: with SMTP id s11mr16728612iog.10.1592015226336;
 Fri, 12 Jun 2020 19:27:06 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 12 Jun 2020 21:26:55 -0500
Message-ID: <CAHCN7xLmhynf5X+2YgMTPcQMwEP4N_XE-BhVjcL1hT4L+EGuCg@mail.gmail.com>
Subject: omap3 dss failues on 5.7
To:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Is anyone else having DSS failures on the 5.7 stable branch using an
omap3 board?

I haven't had time to bisect yet, but before I do I thought I'd ask.

  10.370574] ------------[ cut here ]------------
[   10.375335] WARNING: CPU: 0 PID: 71 at
drivers/gpu/drm/bridge/panel.c:176 drm_panel_bridge_add+0x40/0x4c
[drm_kms_helper]
[   10.386474] Modules linked in: joydev mousedev evdev leds_gpio
pwm_bl panel_simple snd_soc_omap_twl4030 pwm_omap_dmtimer led_class
gpio_keys cpufreq_dt snd_soc_omap_mcbsp bq27xxx_battery_hdq
snd_soc_ti_sdma bq27xxx_battery omap_wdt omap3_isp
videobuf2_dma_contig videobuf2_memops omap_hdq videobuf2_v4l2
omap_sham videobuf2_common v4l2_fwnode wire cn hwmon mt9p031
aptina_pll phy_twl4030_usb omap_aes_driver omap2430 crypto_engine
omap_crypto musb_hdrc hci_uart omap_rng btbcm wlcore_sdio udc_core
rng_core videodev omap_mailbox mc usbcore snd_soc_twl4030 twl4030_wdt
usb_common watchdog rtc_twl snd_soc_core snd_pcm_dmaengine bluetooth
snd_pcm snd_timer twl4030_pwrbutton snd omapdss pwm_twl_led
twl4030_charger ecdh_generic soundcore ecc omapdss_base industrialio
libaes pwm_twl drm_kms_helper tsc2004 at24 tsc200x_core cfbfillrect
omap_ssi syscopyarea cfbimgblt hsi sysfillrect sysimgblt fb_sys_fops
cfbcopyarea drm drm_panel_orientation_quirks cec
[   10.470123] CPU: 0 PID: 71 Comm: kworker/0:3 Not tainted 5.7.2-dirty #2
[   10.476776] Hardware name: Generic OMAP36xx (Flattened Device Tree)
[   10.483093] Workqueue: events deferred_probe_work_func
[   10.488281] [<c01119f8>] (unwind_backtrace) from [<c010ba28>]
(show_stack+0x10/0x14)
[   10.496063] [<c010ba28>] (show_stack) from [<c054dd30>]
(dump_stack+0xc0/0xdc)
[   10.503326] [<c054dd30>] (dump_stack) from [<c01389f4>] (__warn+0xc0/0xf8)
[   10.510223] [<c01389f4>] (__warn) from [<c0138d8c>]
(warn_slowpath_fmt+0x5c/0xc0)
[   10.517822] [<c0138d8c>] (warn_slowpath_fmt) from [<bf0d4810>]
(drm_panel_bridge_add+0x40/0x4c [drm_kms_helper])
[   10.528106] [<bf0d4810>] (drm_panel_bridge_add [drm_kms_helper])
from [<bf1258fc>] (omapdss_device_init_output+0x7c/0x780
[omapdss_base])
[   10.540618] [<bf1258fc>] (omapdss_device_init_output
[omapdss_base]) from [<bf14aecc>] (dpi_init_port+0x188/0x288
[omapdss])
[   10.551971] [<bf14aecc>] (dpi_init_port [omapdss]) from
[<bf142240>] (dss_probe+0x29c/0x578 [omapdss])
[   10.561370] [<bf142240>] (dss_probe [omapdss]) from [<c063dd0c>]
(platform_drv_probe+0x48/0x98)
[   10.570129] [<c063dd0c>] (platform_drv_probe) from [<c063bce4>]
(really_probe+0x1d8/0x344)
[   10.578430] [<c063bce4>] (really_probe) from [<c063bf60>]
(driver_probe_device+0x5c/0x164)
[   10.586730] [<c063bf60>] (driver_probe_device) from [<c063a128>]
(bus_for_each_drv+0x80/0xcc)
[   10.595306] [<c063a128>] (bus_for_each_drv) from [<c063ba90>]
(__device_attach+0xd4/0x148)
[   10.603607] [<c063ba90>] (__device_attach) from [<c063adfc>]
(bus_probe_device+0x84/0x8c)
[   10.611816] [<c063adfc>] (bus_probe_device) from [<c063b288>]
(deferred_probe_work_func+0x60/0x8c)
[   10.620819] [<c063b288>] (deferred_probe_work_func) from
[<c01553b4>] (process_one_work+0x1ec/0x530)
[   10.630004] [<c01553b4>] (process_one_work) from [<c0155728>]
(worker_thread+0x30/0x558)
[   10.638153] [<c0155728>] (worker_thread) from [<c015c048>]
(kthread+0x134/0x148)
[   10.645568] [<c015c048>] (kthread) from [<c0100168>]
(ret_from_fork+0x14/0x2c)
[   10.652832] Exception stack(0xcc84bfb0 to 0xcc84bff8)
[   10.657897] bfa0:                                     00000000
00000000 00000000 00000000
[   10.666137] bfc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[   10.674346] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   10.681060] ---[ end trace 9571aa0bd994d08b ]---
[   10.967132] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[   11.284881] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   11.867645] ------------[ cut here ]------------
[   11.872619] WARNING: CPU: 0 PID: 15 at
drivers/gpu/drm/bridge/panel.c:176 drm_panel_bridge_add+0x40/0x4c
[drm_kms_helper]
[   11.883819] Modules linked in: wl12xx wlcore mac80211 libarc4
sha256_generic libsha256 sha256_arm cfg80211 joydev mousedev evdev
leds_gpio pwm_bl panel_simple snd_soc_omap_twl4030 pwm_omap_dmtimer
led_class gpio_keys cpufreq_dt snd_soc_omap_mcbsp bq27xxx_battery_hdq
snd_soc_ti_sdma bq27xxx_battery omap_wdt omap3_isp
videobuf2_dma_contig videobuf2_memops omap_hdq videobuf2_v4l2
omap_sham videobuf2_common v4l2_fwnode wire cn hwmon mt9p031
aptina_pll phy_twl4030_usb omap_aes_driver omap2430 crypto_engine
omap_crypto musb_hdrc hci_uart omap_rng btbcm wlcore_sdio udc_core
rng_core videodev omap_mailbox mc usbcore snd_soc_twl4030 twl4030_wdt
usb_common watchdog rtc_twl snd_soc_core snd_pcm_dmaengine bluetooth
snd_pcm snd_timer twl4030_pwrbutton snd omapdss pwm_twl_led
twl4030_charger ecdh_generic soundcore ecc omapdss_base industrialio
libaes pwm_twl drm_kms_helper tsc2004 at24 tsc200x_core cfbfillrect
omap_ssi syscopyarea cfbimgblt hsi sysfillrect sysimgblt fb_sys_fops
cfbcopyarea drm
[   11.884246]  drm_panel_orientation_quirks cec
[   11.976013] CPU: 0 PID: 15 Comm: kworker/0:1 Tainted: G        W
     5.7.2-dirty #2
[   11.984069] Hardware name: Generic OMAP36xx (Flattened Device Tree)
[   11.990417] Workqueue: events deferred_probe_work_func
[   11.995635] [<c01119f8>] (unwind_backtrace) from [<c010ba28>]
(show_stack+0x10/0x14)
[   12.003448] [<c010ba28>] (show_stack) from [<c054dd30>]
(dump_stack+0xc0/0xdc)
[   12.010742] [<c054dd30>] (dump_stack) from [<c01389f4>] (__warn+0xc0/0xf8)
[   12.017669] [<c01389f4>] (__warn) from [<c0138d8c>]
(warn_slowpath_fmt+0x5c/0xc0)
[   12.025360] [<c0138d8c>] (warn_slowpath_fmt) from [<bf0d4810>]
(drm_panel_bridge_add+0x40/0x4c [drm_kms_helper])
[   12.035766] [<bf0d4810>] (drm_panel_bridge_add [drm_kms_helper])
from [<bf1258fc>] (omapdss_device_init_output+0x7c/0x780
[omapdss_base])
[   12.048400] [<bf1258fc>] (omapdss_device_init_output
[omapdss_base]) from [<bf14aecc>] (dpi_init_port+0x188/0x288
[omapdss])
[   12.059906] [<bf14aecc>] (dpi_init_port [omapdss]) from
[<bf142240>] (dss_probe+0x29c/0x578 [omapdss])
[   12.069396] [<bf142240>] (dss_probe [omapdss]) from [<c063dd0c>]
(platform_drv_probe+0x48/0x98)
[   12.078186] [<c063dd0c>] (platform_drv_probe) from [<c063bce4>]
(really_probe+0x1d8/0x344)
[   12.086517] [<c063bce4>] (really_probe) from [<c063bf60>]
(driver_probe_device+0x5c/0x164)
[   12.094848] [<c063bf60>] (driver_probe_device) from [<c063a128>]
(bus_for_each_drv+0x80/0xcc)
[   12.103454] [<c063a128>] (bus_for_each_drv) from [<c063ba90>]
(__device_attach+0xd4/0x148)
[   12.111785] [<c063ba90>] (__device_attach) from [<c063adfc>]
(bus_probe_device+0x84/0x8c)
[   12.120025] [<c063adfc>] (bus_probe_device) from [<c063b288>]
(deferred_probe_work_func+0x60/0x8c)
[   12.129058] [<c063b288>] (deferred_probe_work_func) from
[<c01553b4>] (process_one_work+0x1ec/0x530)
[   12.138275] [<c01553b4>] (process_one_work) from [<c0155728>]
(worker_thread+0x30/0x558)
[   12.146423] [<c0155728>] (worker_thread) from [<c015c048>]
(kthread+0x134/0x148)
[   12.153900] [<c015c048>] (kthread) from [<c0100168>]
(ret_from_fork+0x14/0x2c)
[   12.161163] Exception stack(0xce1d7fb0 to 0xce1d7ff8)
[   12.166259] 7fa0:                                     00000000
00000000 00000000 00000000
[   12.174530] 7fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[   12.182769] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   12.189544] ---[ end trace 9571aa0bd994d08c ]---


Thanks for any suggestions.  I'll bisect when I have more time.

adam
