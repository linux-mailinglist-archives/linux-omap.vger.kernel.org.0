Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B84E31FB487
	for <lists+linux-omap@lfdr.de>; Tue, 16 Jun 2020 16:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgFPOgi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Jun 2020 10:36:38 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:36518 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgFPOgh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Jun 2020 10:36:37 -0400
X-Greylist: delayed 365 seconds by postgrey-1.27 at vger.kernel.org; Tue, 16 Jun 2020 10:36:35 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592318193;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=pxgiNqvLkMzXkU+f5terMvL9GRbMh0HpYhJ1v+JWMqg=;
        b=Jd4O515DfzoQCxTT3BEQx4jlZhnrUmnDKH3K864C3v0MCTO3sysroh+ycTtSnn1k29
        b5bOxal1s6hSsiX5HW2RKS+QQEnn8q7mFpxOQrL/dBQ6AIMcFgrTqYs+oohSIDTyZkbQ
        Wmu7eG4ifddL1AlZZKXXlIlNThYo/zoctV0rqqCfGtjsl3lOj3YZ4PJhJ8356BETnXfN
        AWjjEtuzH3OsHTMvfiSA27SC+Gy+deKbWkFdplecfNg6bBeSxjeE3KEfkKENCbHWWWSJ
        es9gsK+Bouz5jOmApq/RB226OqsLWFHvPH9T9R3qvqtMDazFcvu/KfPINAmRke8u3/lW
        c4DA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vtwDOueXM="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id j05c09w5GEORGeN
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 16 Jun 2020 16:24:27 +0200 (CEST)
Subject: Re: omap3 dss failues on 5.7
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200613160601.GB9722@pendragon.ideasonboard.com>
Date:   Tue, 16 Jun 2020 16:24:26 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8BE96966-02C2-4AB4-B36F-7F0CBBBF4928@goldelico.com>
References: <CAHCN7xLmhynf5X+2YgMTPcQMwEP4N_XE-BhVjcL1hT4L+EGuCg@mail.gmail.com> <20200613160242.GW37466@atomide.com> <20200613160601.GB9722@pendragon.ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam and Laurent,

> Am 13.06.2020 um 04:26 schrieb Adam Ford <aford173@gmail.com>:
>=20
> Is anyone else having DSS failures on the 5.7 stable branch using an
> omap3 board?

The GTA04 omapdss is running on dm3730 and OpenPandora with omap3530.

But I also have a problem on omap5 (not yet analysed in any way...).

> Thanks for any suggestions.  I'll bisect when I have more time.
> Am 13.06.2020 um 18:06 schrieb Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>:
>=20
> Hi Tony,
>=20
> On Sat, Jun 13, 2020 at 09:02:42AM -0700, Tony Lindgren wrote:
>> * Adam Ford <aford173@gmail.com> [200613 02:28]:
>>> Is anyone else having DSS failures on the 5.7 stable branch using an
>>> omap3 board?
>>>=20
>>> I haven't had time to bisect yet, but before I do I thought I'd ask.
>>=20
>> Sounds this might be caused by some panel related between v5.6 and =
v5.7,
>> so adding Laurent to Cc.
>>=20
>> We also started dropping legacy platform data for some SoCs, but that
>> should not affect omap3 so far.
>=20
> I think this is caused by the panel driver not setting the connector
> type. Only the panel-simple driver should be affected,

Both omap3 based devices mentioned above use special panel drivers.=20

> fixing this
> should just be a matter of setting
>=20
> 	.connector_type =3D DRM_MODE_CONNECTOR_DPI
>=20
> for the appropriate panel_desc entry.

I have another panel in panel-simple where .connector_type is not set.
(Haven't tested yet but would assume it fails as well).

I wonder why it was not a bulk change for all panel_desc there if it is
that important.

BR and thanks for pointing out a solution,
Nikolaus



>=20
>>>  10.370574] ------------[ cut here ]------------
>>> [   10.375335] WARNING: CPU: 0 PID: 71 at
>>> drivers/gpu/drm/bridge/panel.c:176 drm_panel_bridge_add+0x40/0x4c
>>> [drm_kms_helper]
>>> [   10.386474] Modules linked in: joydev mousedev evdev leds_gpio
>>> pwm_bl panel_simple snd_soc_omap_twl4030 pwm_omap_dmtimer led_class
>>> gpio_keys cpufreq_dt snd_soc_omap_mcbsp bq27xxx_battery_hdq
>>> snd_soc_ti_sdma bq27xxx_battery omap_wdt omap3_isp
>>> videobuf2_dma_contig videobuf2_memops omap_hdq videobuf2_v4l2
>>> omap_sham videobuf2_common v4l2_fwnode wire cn hwmon mt9p031
>>> aptina_pll phy_twl4030_usb omap_aes_driver omap2430 crypto_engine
>>> omap_crypto musb_hdrc hci_uart omap_rng btbcm wlcore_sdio udc_core
>>> rng_core videodev omap_mailbox mc usbcore snd_soc_twl4030 =
twl4030_wdt
>>> usb_common watchdog rtc_twl snd_soc_core snd_pcm_dmaengine bluetooth
>>> snd_pcm snd_timer twl4030_pwrbutton snd omapdss pwm_twl_led
>>> twl4030_charger ecdh_generic soundcore ecc omapdss_base industrialio
>>> libaes pwm_twl drm_kms_helper tsc2004 at24 tsc200x_core cfbfillrect
>>> omap_ssi syscopyarea cfbimgblt hsi sysfillrect sysimgblt fb_sys_fops
>>> cfbcopyarea drm drm_panel_orientation_quirks cec
>>> [   10.470123] CPU: 0 PID: 71 Comm: kworker/0:3 Not tainted =
5.7.2-dirty #2
>>> [   10.476776] Hardware name: Generic OMAP36xx (Flattened Device =
Tree)
>>> [   10.483093] Workqueue: events deferred_probe_work_func
>>> [   10.488281] [<c01119f8>] (unwind_backtrace) from [<c010ba28>]
>>> (show_stack+0x10/0x14)
>>> [   10.496063] [<c010ba28>] (show_stack) from [<c054dd30>]
>>> (dump_stack+0xc0/0xdc)
>>> [   10.503326] [<c054dd30>] (dump_stack) from [<c01389f4>] =
(__warn+0xc0/0xf8)
>>> [   10.510223] [<c01389f4>] (__warn) from [<c0138d8c>]
>>> (warn_slowpath_fmt+0x5c/0xc0)
>>> [   10.517822] [<c0138d8c>] (warn_slowpath_fmt) from [<bf0d4810>]
>>> (drm_panel_bridge_add+0x40/0x4c [drm_kms_helper])
>>> [   10.528106] [<bf0d4810>] (drm_panel_bridge_add [drm_kms_helper])
>>> from [<bf1258fc>] (omapdss_device_init_output+0x7c/0x780
>>> [omapdss_base])
>>> [   10.540618] [<bf1258fc>] (omapdss_device_init_output
>>> [omapdss_base]) from [<bf14aecc>] (dpi_init_port+0x188/0x288
>>> [omapdss])
>>> [   10.551971] [<bf14aecc>] (dpi_init_port [omapdss]) from
>>> [<bf142240>] (dss_probe+0x29c/0x578 [omapdss])
>>> [   10.561370] [<bf142240>] (dss_probe [omapdss]) from [<c063dd0c>]
>>> (platform_drv_probe+0x48/0x98)
>>> [   10.570129] [<c063dd0c>] (platform_drv_probe) from [<c063bce4>]
>>> (really_probe+0x1d8/0x344)
>>> [   10.578430] [<c063bce4>] (really_probe) from [<c063bf60>]
>>> (driver_probe_device+0x5c/0x164)
>>> [   10.586730] [<c063bf60>] (driver_probe_device) from [<c063a128>]
>>> (bus_for_each_drv+0x80/0xcc)
>>> [   10.595306] [<c063a128>] (bus_for_each_drv) from [<c063ba90>]
>>> (__device_attach+0xd4/0x148)
>>> [   10.603607] [<c063ba90>] (__device_attach) from [<c063adfc>]
>>> (bus_probe_device+0x84/0x8c)
>>> [   10.611816] [<c063adfc>] (bus_probe_device) from [<c063b288>]
>>> (deferred_probe_work_func+0x60/0x8c)
>>> [   10.620819] [<c063b288>] (deferred_probe_work_func) from
>>> [<c01553b4>] (process_one_work+0x1ec/0x530)
>>> [   10.630004] [<c01553b4>] (process_one_work) from [<c0155728>]
>>> (worker_thread+0x30/0x558)
>>> [   10.638153] [<c0155728>] (worker_thread) from [<c015c048>]
>>> (kthread+0x134/0x148)
>>> [   10.645568] [<c015c048>] (kthread) from [<c0100168>]
>>> (ret_from_fork+0x14/0x2c)
>>> [   10.652832] Exception stack(0xcc84bfb0 to 0xcc84bff8)
>>> [   10.657897] bfa0:                                     00000000
>>> 00000000 00000000 00000000
>>> [   10.666137] bfc0: 00000000 00000000 00000000 00000000 00000000
>>> 00000000 00000000 00000000
>>> [   10.674346] bfe0: 00000000 00000000 00000000 00000000 00000013 =
00000000
>>> [   10.681060] ---[ end trace 9571aa0bd994d08b ]---
>>> [   10.967132] cfg80211: Loading compiled-in X.509 certificates for
>>> regulatory database
>>> [   11.284881] cfg80211: Loaded X.509 cert 'sforshee: =
00b28ddf47aef9cea7'
>>> [   11.867645] ------------[ cut here ]------------
>>> [   11.872619] WARNING: CPU: 0 PID: 15 at
>>> drivers/gpu/drm/bridge/panel.c:176 drm_panel_bridge_add+0x40/0x4c
>>> [drm_kms_helper]
>>> [   11.883819] Modules linked in: wl12xx wlcore mac80211 libarc4
>>> sha256_generic libsha256 sha256_arm cfg80211 joydev mousedev evdev
>>> leds_gpio pwm_bl panel_simple snd_soc_omap_twl4030 pwm_omap_dmtimer
>>> led_class gpio_keys cpufreq_dt snd_soc_omap_mcbsp =
bq27xxx_battery_hdq
>>> snd_soc_ti_sdma bq27xxx_battery omap_wdt omap3_isp
>>> videobuf2_dma_contig videobuf2_memops omap_hdq videobuf2_v4l2
>>> omap_sham videobuf2_common v4l2_fwnode wire cn hwmon mt9p031
>>> aptina_pll phy_twl4030_usb omap_aes_driver omap2430 crypto_engine
>>> omap_crypto musb_hdrc hci_uart omap_rng btbcm wlcore_sdio udc_core
>>> rng_core videodev omap_mailbox mc usbcore snd_soc_twl4030 =
twl4030_wdt
>>> usb_common watchdog rtc_twl snd_soc_core snd_pcm_dmaengine bluetooth
>>> snd_pcm snd_timer twl4030_pwrbutton snd omapdss pwm_twl_led
>>> twl4030_charger ecdh_generic soundcore ecc omapdss_base industrialio
>>> libaes pwm_twl drm_kms_helper tsc2004 at24 tsc200x_core cfbfillrect
>>> omap_ssi syscopyarea cfbimgblt hsi sysfillrect sysimgblt fb_sys_fops
>>> cfbcopyarea drm
>>> [   11.884246]  drm_panel_orientation_quirks cec
>>> [   11.976013] CPU: 0 PID: 15 Comm: kworker/0:1 Tainted: G        W
>>>     5.7.2-dirty #2
>>> [   11.984069] Hardware name: Generic OMAP36xx (Flattened Device =
Tree)
>>> [   11.990417] Workqueue: events deferred_probe_work_func
>>> [   11.995635] [<c01119f8>] (unwind_backtrace) from [<c010ba28>]
>>> (show_stack+0x10/0x14)
>>> [   12.003448] [<c010ba28>] (show_stack) from [<c054dd30>]
>>> (dump_stack+0xc0/0xdc)
>>> [   12.010742] [<c054dd30>] (dump_stack) from [<c01389f4>] =
(__warn+0xc0/0xf8)
>>> [   12.017669] [<c01389f4>] (__warn) from [<c0138d8c>]
>>> (warn_slowpath_fmt+0x5c/0xc0)
>>> [   12.025360] [<c0138d8c>] (warn_slowpath_fmt) from [<bf0d4810>]
>>> (drm_panel_bridge_add+0x40/0x4c [drm_kms_helper])
>>> [   12.035766] [<bf0d4810>] (drm_panel_bridge_add [drm_kms_helper])
>>> from [<bf1258fc>] (omapdss_device_init_output+0x7c/0x780
>>> [omapdss_base])
>>> [   12.048400] [<bf1258fc>] (omapdss_device_init_output
>>> [omapdss_base]) from [<bf14aecc>] (dpi_init_port+0x188/0x288
>>> [omapdss])
>>> [   12.059906] [<bf14aecc>] (dpi_init_port [omapdss]) from
>>> [<bf142240>] (dss_probe+0x29c/0x578 [omapdss])
>>> [   12.069396] [<bf142240>] (dss_probe [omapdss]) from [<c063dd0c>]
>>> (platform_drv_probe+0x48/0x98)
>>> [   12.078186] [<c063dd0c>] (platform_drv_probe) from [<c063bce4>]
>>> (really_probe+0x1d8/0x344)
>>> [   12.086517] [<c063bce4>] (really_probe) from [<c063bf60>]
>>> (driver_probe_device+0x5c/0x164)
>>> [   12.094848] [<c063bf60>] (driver_probe_device) from [<c063a128>]
>>> (bus_for_each_drv+0x80/0xcc)
>>> [   12.103454] [<c063a128>] (bus_for_each_drv) from [<c063ba90>]
>>> (__device_attach+0xd4/0x148)
>>> [   12.111785] [<c063ba90>] (__device_attach) from [<c063adfc>]
>>> (bus_probe_device+0x84/0x8c)
>>> [   12.120025] [<c063adfc>] (bus_probe_device) from [<c063b288>]
>>> (deferred_probe_work_func+0x60/0x8c)
>>> [   12.129058] [<c063b288>] (deferred_probe_work_func) from
>>> [<c01553b4>] (process_one_work+0x1ec/0x530)
>>> [   12.138275] [<c01553b4>] (process_one_work) from [<c0155728>]
>>> (worker_thread+0x30/0x558)
>>> [   12.146423] [<c0155728>] (worker_thread) from [<c015c048>]
>>> (kthread+0x134/0x148)
>>> [   12.153900] [<c015c048>] (kthread) from [<c0100168>]
>>> (ret_from_fork+0x14/0x2c)
>>> [   12.161163] Exception stack(0xce1d7fb0 to 0xce1d7ff8)
>>> [   12.166259] 7fa0:                                     00000000
>>> 00000000 00000000 00000000
>>> [   12.174530] 7fc0: 00000000 00000000 00000000 00000000 00000000
>>> 00000000 00000000 00000000
>>> [   12.182769] 7fe0: 00000000 00000000 00000000 00000000 00000013 =
00000000
>>> [   12.189544] ---[ end trace 9571aa0bd994d08c ]---
>>>=20
>>>=20
>>> Thanks for any suggestions.  I'll bisect when I have more time.
>>>=20
>>> adam
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

