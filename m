Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97C01CC131
	for <lists+linux-omap@lfdr.de>; Sat,  9 May 2020 14:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbgEIMLy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 May 2020 08:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726782AbgEIMLy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 May 2020 08:11:54 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C0AC061A0C;
        Sat,  9 May 2020 05:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589026311;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:Message-Id:Cc:Date:From:Subject:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=5gGUHy+PDoNdP9nHLRYt4+OcwQoLGo/lTP0Ip+T5Vwk=;
        b=Kr4+NAVBtAFz/pNxlNgrdDG0x/qNwrpDaJ1/dGMM5/rn7uL3r9T2z3KmvknyUhKj3p
        anAUpuEe4FgAnfiuUML1zN+6ln6lxf0RH1FncFFRmws9IsQDXPkd0yp75WgCPwo10e/j
        WSRIBVlFCt63FEu0b7DIAdOgOiUQ1Ex+7jhkYJtHlRXtj+qgAxfVAYvEt1taTGHNTD5E
        4C0mfo0Btfsk1KRpiFJZzM9fx7/SyEuXzJfql+JXskPXBb6f2AawGWMJk/PTI3It+zwm
        ImWH8x7y0k/7MpyLNldPiOir3lZrO3QohMqzdlsHgTr3pUR1f/hmpxrLoE0ztqAvowCk
        +iIw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCygUY/lNGxpoFHLuGRFsv7A7BXaBhsYgwirVBs0"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:2653:2400:c8f5:8c00:203b:568b]
        by smtp.strato.de (RZmta 46.6.2 AUTH)
        with ESMTPSA id R0acebw49CBi7oT
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 9 May 2020 14:11:44 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Bug with omap3-isp - 30 seconds delay for probe success
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
Date:   Sat, 9 May 2020 14:11:37 +0200
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FC4C8A15-077F-46BA-9C69-947BC820EE9D@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

resend from correct mail address
---

Hi Tony,
I am observing an issue with omap3-isp for a while. It seems
to have started with v5.6 but I have preferred to invest some
time into analysis of the problem instead of trying a bisect.

The problem is that there is a

[   32.483703] WARNING: CPU: 0 PID: 2052 at drivers/base/dd.c:270 =
driver_deferred_probe_check_state+0x44/0x5c
[   32.498809] omap3isp 480bc000.isp: deferred probe timeout, ignoring =
dependency

from the driver, just after exactly 30 seconds. This is when
driver_deferred_probe_timeout had timed out (chaning =
driver_deferred_probe_timeout makes
it take more or less time).

So something is requested for by the omap3-isp driver which never =
becomes
available.

Some analysis shows that the omap3-isp is the only device calling =
of_iommu_xlate()
with a NULL opp table which ends up in =
driver_deferred_probe_check_state() to return
-EPROBE_DEFER until 30 seconds have passed.

Well, it seems to be resonable that there are no ops returned by =
iommu_ops_from_fwnode()
since there is no firmware for the ISP. But there should be no timeout.

This of_iommu_xlate() is called from of_iommu_configure() in the loop to =
handle
all "iommus" references. There is one for omap34xx and omap36xx.dtsi and =
the mmu_isp
is defined in omap3.dtsi. They refer to compatible =3D "ti,omap2-iommu"; =
and
ti,hwmods =3D "mmu_isp";

Are there any ideas what in the iommu or hwmods or firmware loading for =
the mmu_isp
may have changed recently?

Anyways the omap3-isp seems to be initialized after this 30 seconds =
timeout and
responds to media-ctl.

A more complete log attached.

BR,
Nikolaus


[   32.478759] ------------[ cut here ]------------
[   32.483703] WARNING: CPU: 0 PID: 2052 at drivers/base/dd.c:270 =
driver_deferred_probe_check_state+0x44/0x5c
[   32.498809] omap3isp 480bc000.isp: deferred probe timeout, ignoring =
dependency
[   32.498840] Modules linked in: omapdrm libertas_sdio libertas =
cfg80211 panel_tpo_td028ttec1 snd_soc_simple_card =
snd_soc_simple_card_utils snd_soc_omap_twl4030 simple_bridge wwan_on_off =
pvrsrvkm_omap3630_sgx530_125 snd_soc_gtm601 pwm_omap_dmtimer =
omap_aes_driver crypto_engine omap_crypto omap_sham omap3_isp =
videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common =
bq27xxx_battery_hdq bq27xxx_battery omap_hdq omap2430 bmp280_spi =
bmp280_i2c itg3200 bmp280 at24 tsc2007 leds_tca6507 bma180 =
phy_twl4030_usb musb_hdrc twl4030_pwrbutton hci_uart snd_soc_twl4030 =
twl4030_vibra btbcm ov9655 twl4030_madc v4l2_fwnode twl4030_charger =
videodev hmc5843_i2c bluetooth hmc5843_core gnss_sirf =
industrialio_triggered_buffer mc kfifo_buf ecdh_generic snd_soc_si47xx =
ecc gnss snd_soc_omap_mcbsp snd_soc_ti_sdma ehci_omap omapdss =
omapdss_base drm_kms_helper syscopyarea sysfillrect sysimgblt =
fb_sys_fops cec display_connector generic_adc_battery drm industrialio =
drm_panel_orientation_quirks input_polldev
[   32.509704]  pwm_bl ip_tables x_tables ipv6 nf_defrag_ipv6 autofs4
[   32.612792] CPU: 0 PID: 2052 Comm: kworker/0:5 Not tainted =
5.7.0-rc4-letux+ #2570
[   32.620758] Hardware name: Generic OMAP36xx (Flattened Device Tree)
[   32.627471] Workqueue: events deferred_probe_work_func
[   32.632995] [<c010f1f4>] (unwind_backtrace) from [<c010a7c8>] =
(show_stack+0x10/0x14)
[   32.641235] [<c010a7c8>] (show_stack) from [<c047d3c4>] =
(dump_stack+0x88/0xa8)
[   32.648925] [<c047d3c4>] (dump_stack) from [<c01304f0>] =
(__warn+0xc8/0xf4)
[   32.656249] [<c01304f0>] (__warn) from [<c013058c>] =
(warn_slowpath_fmt+0x70/0x9c)
[   32.664215] [<c013058c>] (warn_slowpath_fmt) from [<c056fa44>] =
(driver_deferred_probe_check_state+0x44/0x5c)
[   32.674652] [<c056fa44>] (driver_deferred_probe_check_state) from =
[<c05641d4>] (of_iommu_configure+0x98/0x1b4)
[   32.685302] [<c05641d4>] (of_iommu_configure) from [<c06dd6cc>] =
(of_dma_configure+0x1d8/0x234)
[   32.694458] [<c06dd6cc>] (of_dma_configure) from [<c056fc6c>] =
(really_probe+0x104/0x324)
[   32.703063] [<c056fc6c>] (really_probe) from [<c05700dc>] =
(driver_probe_device+0x10c/0x154)
[   32.711944] [<c05700dc>] (driver_probe_device) from [<c056e3a8>] =
(bus_for_each_drv+0x90/0xb8)
[   32.721008] [<c056e3a8>] (bus_for_each_drv) from [<c056ff1c>] =
(__device_attach+0x90/0x120)
[   32.729797] [<c056ff1c>] (__device_attach) from [<c056efdc>] =
(bus_probe_device+0x28/0x80)
[   32.738494] [<c056efdc>] (bus_probe_device) from [<c056f464>] =
(deferred_probe_work_func+0x5c/0x80)
[   32.748016] [<c056f464>] (deferred_probe_work_func) from [<c014986c>] =
(process_one_work+0x1e4/0x394)
[   32.757720] [<c014986c>] (process_one_work) from [<c0149a44>] =
(process_scheduled_works+0x28/0x30)
[   32.767150] [<c0149a44>] (process_scheduled_works) from [<c0149f38>] =
(worker_thread+0x210/0x2d8)
[   32.776489] [<c0149f38>] (worker_thread) from [<c014e7cc>] =
(kthread+0x138/0x148)
[   32.784362] [<c014e7cc>] (kthread) from [<c0100148>] =
(ret_from_fork+0x14/0x2c)
[   32.792022] Exception stack(0xda649fb0 to 0xda649ff8)
[   32.797393] 9fa0:                                     00000000 =
00000000 00000000 00000000
[   32.806091] 9fc0: 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000 00000000
[   32.814788] 9fe0: 00000000 00000000 00000000 00000000 00000013 =
00000000
[   32.842346] omap3isp 480bc000.isp: supply vdd-csiphy1 not found, =
using dummy regulator
[   32.855133] omap3isp 480bc000.isp: supply vdd-csiphy2 not found, =
using dummy regulator
[   32.864746] omap3isp 480bc000.isp: Revision 15.0 found
[   32.870971] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
[   32.879913] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
CCP2 was not initialized!
[   32.897247] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
CSI2a was not initialized!
[   32.917999] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
CCDC was not initialized!
[   32.938446] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
preview was not initialized!
[   32.966888] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
resizer was not initialized!
[   32.987548] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
AEWB was not initialized!
[   33.010803] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
AF was not initialized!
[   33.026519] omap3isp 480bc000.isp: Entity type for entity OMAP3 ISP =
histogram was not initialized!
[   33.052062] ov9655 1-0030: ov9655_probe
[   33.064910] ov9655 1-0030: supply dvdd not found, using dummy =
regulator
[   33.075714] ov9655 1-0030: supply dovdd not found, using dummy =
regulator
[   33.097900] ov9655 1-0030: __ov9655_set_power on=3D1
[   33.206787] ov9655 1-0030: OV9655 read register 1c : 7f
[   33.212707] ov9655 1-0030: OV9655 read register 1d : a2
[   33.220336] ov9655 1-0030: OV9655 read register 0a : 96
[   33.226104] ov9655 1-0030: OV9655 read register 0b : 57
[   33.231872] ov9655 1-0030: __ov9655_set_power on=3D0
[   33.238586] ov9655 1-0030: OV9655 REV5 detected at address 0x30
[   33.258605] platform sound_bluetooth: deferred probe pending
[   35.915588] omap-iommu 480bd400.mmu: 480bd400.mmu: version 1.1
[   36.040069] ov9655 1-0030: ov9655_open=
