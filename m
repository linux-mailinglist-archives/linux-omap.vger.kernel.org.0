Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED87F23E274
	for <lists+linux-omap@lfdr.de>; Thu,  6 Aug 2020 21:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgHFToq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 6 Aug 2020 15:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgHFToq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 6 Aug 2020 15:44:46 -0400
Received: from ds0.me (ds0.me [IPv6:2602:ffc5::f9bc:b4ce])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05BE9C061574
        for <linux-omap@vger.kernel.org>; Thu,  6 Aug 2020 12:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ds0.me; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID; bh=1PPyQmQmw8olcYIFEs+qztEzjpLDRWtNAEwmNc56UgU=;
        b=he49ZloBpVVRq7f8XMcy7yE3nP8N6tUVgkGMXfP0lubJKit7bYPS/AvHvFq8RpLAH+QAKc9DnZjdNIRT5L74mitxio8ujZ9wYiEizcVqxnWr7+z5/uvq/E1bRORCWFDCz4RRD9vsjiC+6P5dNZm91Z9sYU+LRb/zXbsdeY84mDI=;
Received: from 97e0b068.skybroadband.com ([151.224.176.104] helo=david-5530)
        by ds0.me with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.84_2)
        (envelope-from <dave@ds0.me>)
        id 1k3lof-0004vi-99; Thu, 06 Aug 2020 15:44:41 -0400
Message-ID: <f27830e9fd54455550d400aec6776f74cbdcbf65.camel@ds0.me>
Subject: Re: [Letux-kernel] module_mipi_dsi_driver panel with omapdrm?
From:   David Shah <dave@ds0.me>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>, kernel@pyra-handheld.com
Date:   Thu, 06 Aug 2020 20:44:33 +0100
In-Reply-To: <D37EF178-4C3E-4DD1-89B8-48402DF5D6E8@goldelico.com>
References: <20200706143613.GS37466@atomide.com>
         <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com>
         <20200707180115.GB5849@atomide.com>
         <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com>
         <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com>
         <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com>
         <20200724012411.GJ21353@pendragon.ideasonboard.com>
         <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com>
         <20200801232259.hitcfosiq6f2i57y@earth.universe>
         <4F1BD997-B791-4570-92B9-552C9BFF1350@goldelico.com>
         <20200805112831.akufm5wxkwqehiff@earth.universe>
         <0DDD1D3E-4F63-44B4-91CA-1B5B853837BC@goldelico.com>
         <64416676-a2ea-f11e-4d07-51a3efb55cdd@ti.com>
         <7ef4e081c1a0db81fd98f9e94afc6228a9b68703.camel@ds0.me>
         <1ec9febeb685c7fa866b14b0a4c2a5026f0a3461.camel@ds0.me>
         <63501267004c35bd1dc6971cb9cddda07c967303.camel@ds0.me>
         <D37EF178-4C3E-4DD1-89B8-48402DF5D6E8@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Annoyingly, the display has started working consistently :) but I think there still
is a latent bug related to module load order or similar that would be nice to fix if we can
find a way to reproduce it reliably.

There is at least one other display related issue I notice in v5.7, that I don't 
think is related (but might be in some subtle way). With the omap5 X11 driver,
once the display has gone into DPMS sleep, and is then turned on again by DPMS,
it fails to turn on and I get a number of timeout errors:

[  393.549837] omapdrm omapdrm.0: atomic complete timeout (pipe 0)!
[  404.216533] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [CRTC:55:crtc-0] flip_done timed out
[  414.453404] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [PLANE:32:plane-0] flip_done timed out
[  414.723310] omapdrm omapdrm.0: atomic complete timeout (pipe 0)!
[  414.729686] ------------[ cut here ]------------
[  414.736909] WARNING: CPU: 0 PID: 4062 at drivers/gpu/drm/drm_atomic_helper.c:2312 drm_atomic_helper_commit_hw_done+0x140/0x15c [drm_kms_helper]
[  414.751458] Modules linked in: rfcomm cmac ctr ccm omapdrm snd_soc_omap_hdmi wl18xx bnep wlcore mac80211 panel_boe_w677l snd_soc_dmic cfg80211 libarc4 omapdss snd_soc_spdif_tx dwc3 omapdss_base
drm_kms_helper roles syscopyarea sysfillrect sysimgblt fb_sys_fops pvrsrvkm_omap5_sgx544_116 cec etnaviv ti_tpd12s015 display_connector gpu_sched snd_soc_simple_card snd_soc_omap_abe_twl6040 drm
snd_soc_simple_card_utils snd_soc_twl6040 wwan_on_off leds_gpio drm_panel_orientation_quirks snd_soc_gtm601 pwm_omap_dmtimer snd_soc_w2cbw003_bt ehci_omap binfmt_misc dwc3_omap wlcore_sdio hci_uart
btbcm snd_soc_ts3a227e bmp280_spi bmg160_i2c bmc150_accel_i2c bmc150_magn_i2c bmc150_accel_core bmc150_magn bmg160_core leds_is31fl319x tsc2007 industrialio_triggered_buffer bmp280_i2c bno055
bluetooth palmas_gpadc gpio_twl6040 kfifo_buf bmp280 tca8418_keypad twl6040_vibra ecdh_generic industrialio ecc bq27xxx_battery_i2c input_polldev palmas_pwrbutton bq2429x_charger bq27xxx_battery
as5013 ina2xx usb3503
[  414.751690]  snd_soc_omap_mcbsp snd_soc_omap_mcpdm snd_soc_omap_aess snd_soc_ti_sdma sunrpc ip_tables x_tables ipv6 nf_defrag_ipv6 autofs4
[  414.857830] CPU: 0 PID: 4062 Comm: kworker/0:0 Tainted: G        W         5.7.11-letux-lpae-dave #14
[  414.867564] Hardware name: Generic OMAP5 (Flattened Device Tree)
[  414.873974] Workqueue: events drm_mode_rmfb_work_fn [drm]
[  414.879725] [<c0211344>] (unwind_backtrace) from [<c020b8a4>] (show_stack+0x10/0x14)
[  414.887920] [<c020b8a4>] (show_stack) from [<c061cc20>] (dump_stack+0x90/0xa4)
[  414.895549] [<c061cc20>] (dump_stack) from [<c0231088>] (__warn+0xd0/0xf8)
[  414.902813] [<c0231088>] (__warn) from [<c0231448>] (warn_slowpath_fmt+0x64/0xc4)
[  414.910747] [<c0231448>] (warn_slowpath_fmt) from [<bf318880>] (drm_atomic_helper_commit_hw_done+0x140/0x15c [drm_kms_helper])
[  414.922807] [<bf318880>] (drm_atomic_helper_commit_hw_done [drm_kms_helper]) from [<bf41b3f4>] (omap_atomic_commit_tail+0x6c/0xc0 [omapdrm])
[  414.936138] [<bf41b3f4>] (omap_atomic_commit_tail [omapdrm]) from [<bf318d00>] (commit_tail+0x9c/0x194 [drm_kms_helper])
[  414.947643] [<bf318d00>] (commit_tail [drm_kms_helper]) from [<bf319a38>] (drm_atomic_helper_commit+0x134/0x158 [drm_kms_helper])
[  414.960008] [<bf319a38>] (drm_atomic_helper_commit [drm_kms_helper]) from [<bf395e68>] (drm_framebuffer_remove+0x3a4/0x434 [drm])
[  414.972393] [<bf395e68>] (drm_framebuffer_remove [drm]) from [<bf395f30>] (drm_mode_rmfb_work_fn+0x38/0x48 [drm])
[  414.983288] [<bf395f30>] (drm_mode_rmfb_work_fn [drm]) from [<c024d490>] (process_one_work+0x1e8/0x590)
[  414.993206] [<c024d490>] (process_one_work) from [<c024da80>] (worker_thread+0x248/0x528)
[  415.001842] [<c024da80>] (worker_thread) from [<c0253d48>] (kthread+0x190/0x194)
[  415.009655] [<c0253d48>] (kthread) from [<c0200138>] (ret_from_fork+0x14/0x3c)
[  415.017284] Exception stack(0xe109bfb0 to 0xe109bff8)
[  415.022625] bfa0:                                     00000000 00000000 00000000 00000000
[  415.031261] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  415.039898] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[  415.057506] ---[ end trace ce82871c75f51dc1 ]---
[  415.313182] omapdrm omapdrm.0: atomic complete timeout (pipe 0)!
[  425.330241] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [CRTC:55:crtc-0] flip_done timed out
[  435.567303] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR* [CONNECTOR:54:DSI-1] flip_done timed out

Something else to look into.

Best

David

On Thu, 2020-08-06 at 21:01 +0200, H. Nikolaus Schaller wrote:
> Hi David,
> thanks for finding a fix faster than I could take a look at it!
> 
> > Am 06.08.2020 um 20:44 schrieb David Shah <dave@ds0.me>:
> > 
> > Following a bit of testing, the DSI issues are fixed by 
> > https://github.com/daveshah1/pyra-kernel-devel/commit/3161275854a0f2cd44a55b8eb039bd201f894486
> > (I will prepare a proper patch set shortly).
> > This makes the display
> > work with HDMI disabled.
> 
> So it seems that my conjecture:
> 
> > Am 05.08.2020 um 13:49 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> > 
> > There are 715a5a978733f0 and 671ab615bd507f which arrived in v5.7-rc1 as well
> > and are related to hdmi clocks. So this may be (or not) an influencing factor.
> 
> was almost true. You patch seems to fix
> 5a507162f096b5 ("ARM: dts: Configure interconnect target module for omap5 dsi1")
> 
> > There also seems to be a race condition between the hdmi0 connector
> > and tpd12s015 "encoder". This results in the tpd12s015 permanently
> > returning EPROBE_DEFER and the display subsystem never successfully
> > probing.
> > 
> > Reversing the order of the encoder and connector in the device tree
> > (omap5-board-common.dtsi) makes the display work again with HDMI
> > enabled; as does adding some printks to the display-connector driver.
> 
> Good to know where to look at.
> 
> So we will then have a fix for v5.7 and v5.8 and can start to test/compare
> our module_mipi_dsi_driver with Sebastian's patches as soon as they
> arrive and see what happens.
> 
> BR and thanks,
> Nikolaus
> 
> > On Thu, 2020-08-06 at 17:04 +0100, David Shah wrote:
> > > Sorry, my error. I forgot the Pyra is LPAE and therefore using 64-bit
> > > physical addresses.
> > > 
> > > The start is indeed a correct physical address, 0x58005000, but off
> > > by
> > > 0x1000 from what the DSI driver is expecting.
> > > 
> > > On Thu, 2020-08-06 at 16:50 +0100, David Shah wrote:
> > > > I had a moment to give letux-5.7.y a test on the Pyra hardware.
> > > > 
> > > > I notice an error in dmesg:
> > > > 
> > > > DSI: omapdss DSI error: unsupported DSI module
> > > > 
> > > > which comes from this code (with a small patch added by me):
> > > > 
> > > > 	d = dsi->data->modules;
> > > > 	while (d->address != 0 && d->address != dsi_mem->start)
> > > > 		d++;
> > > > 
> > > > 	if (d->address == 0) {
> > > > 		DSSERR("unsupported DSI module (start: %08x)\n",
> > > > dsi_mem->start);
> > > > 		return -ENODEV;
> > > > 	}
> > > > 
> > > > "start" here is c0b3ba5c - a kernel virtual address - which
> > > > definitely
> > > > doesn't seem right as it would never match. 
> > > > 
> > > > Not sure my kernel-fu is quite up to tracking this down yet, but I
> > > > will
> > > > keep trying to trace out what is happening.
> > > > 
> > > > Best
> > > > 
> > > > Davidg
> > > > 
> > > > On Wed, 2020-08-05 at 15:08 +0300, Tomi Valkeinen wrote:
> > > > > On 05/08/2020 14:49, H. Nikolaus Schaller wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > > Am 05.08.2020 um 13:28 schrieb Sebastian Reichel <
> > > > > > > sebastian.reichel@collabora.com>:
> > > > > > > 
> > > > > > > Hi,
> > > > > > > 
> > > > > > > On Wed, Aug 05, 2020 at 11:19:20AM +0200, H. Nikolaus
> > > > > > > Schaller
> > > > > > > wrote:
> > > > > > > > What I do not yet understand is how Laurent's patch should
> > > > > > > > be
> > > > > > > > able
> > > > > > > > to break it.
> > > > > > > 
> > > > > > > omapdrm will not probe successfully if any DT enabled
> > > > > > > component
> > > > > > > does not probe correctly. Since the patch you identified
> > > > > > > touched
> > > > > > > HDMI and VENC and you are probably using HDMI, I suggest
> > > > > > > looking
> > > > > > > there first.
> > > > > > 
> > > > > > Yes, that is a very good explanation.
> > > > > > 
> > > > > > Maybe there is a subtle change in how the HDMI connector has to
> > > > > > be
> > > > > > defined
> > > > > > which is missing in our (private) DTB. Maybe the OMAP5-uEVM DTS
> > > > > > gives a hint.
> > > > > > 
> > > > > > A quick check shows last hdmi specific change for omap5-board-
> > > > > > common or uevm
> > > > > > was in 2017 but I may have missed something.
> > > > > > 
> > > > > > There are 715a5a978733f0 and 671ab615bd507f which arrived in
> > > > > > v5.7-
> > > > > > rc1 as well
> > > > > > and are related to hdmi clocks. So this may be (or not) and
> > > > > > influencing factor.
> > > > > 
> > > > > HDMI should "just work", and has been tested. But maybe there's
> > > > > some
> > > > > conflict with HDMI and DSI.
> > > > > 
> > > > > Tomi
> > > > > 
> > > > 
> > > > _______________________________________________
> > > > https://projects.goldelico.com/p/gta04-kernel/
> > > > Letux-kernel mailing list
> > > > Letux-kernel@openphoenux.org
> > > > http://lists.goldelico.com/mailman/listinfo.cgi/letux-kernel
> > > 
> > > _______________________________________________
> > > Kernel mailing list
> > > Kernel@pyra-handheld.com
> > > http://pyra-handheld.com/cgi-bin/mailman/listinfo/kernel

