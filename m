Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6D824EECA
	for <lists+linux-omap@lfdr.de>; Sun, 23 Aug 2020 18:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgHWQ0c (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 23 Aug 2020 12:26:32 -0400
Received: from fgw20-4.mail.saunalahti.fi ([62.142.5.107]:41342 "EHLO
        fgw20-4.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726056AbgHWQ0b (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Sun, 23 Aug 2020 12:26:31 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-0-157-nat.elisa-mobile.fi [85.76.0.157])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 63b7ac4d-e55d-11ea-ba22-005056bd6ce9;
        Sun, 23 Aug 2020 19:26:26 +0300 (EEST)
Date:   Sun, 23 Aug 2020 19:26:25 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] omapdrm/N900 display broken
Message-ID: <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
 <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
 <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Tue, Aug 04, 2020 at 03:39:37PM +0300, Tomi Valkeinen wrote:
> On 04/08/2020 15:13, Tomi Valkeinen wrote:

> > Can you try to pinpoint a bit where the hang happens? Maybe add
> > DRM/omapdrm debug prints, or perhaps sysrq works and it shows a lock
> > that's in deadlock.
> 
> Also, one data point would be to disable venc, e.g. set venc status to
> "disabled" in dts.

Disabling venc makes no difference.

The hang happens in drm_fb_helper_initial_config(). I followed the
"HANG DEBUGGING" tips in the function comment text and enabled
fb.lockless_register_fb=1 to get more (serial) console output.

Now I get this:

[    6.514739] omapdss_dss 48050000.dss: supply vdda_video not found, using dummy regulator
[    6.566375] DSS: OMAP DSS rev 2.0
[    6.571807] omapdss_dss 48050000.dss: bound 48050400.dispc (ops dispc_component_ops)
[    6.580749] omapdrm omapdrm.0: DMM not available, disable DMM support
[    6.587982] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    6.626617] ------------[ cut here ]------------
[    6.631774] WARNING: CPU: 0 PID: 18 at drivers/gpu/drm/drm_bridge.c:708 drm_atomic_helper_commit_modeset_enables+0x134/0x268
[    6.643768] Modules linked in:
[    6.647033] CPU: 0 PID: 18 Comm: kworker/0:1 Tainted: G     U            5.8.0-omap3-los_16068+-00004-g2e7d4a7efefd-dirty #2
[    6.658966] Hardware name: Nokia RX-51 board
[    6.663635] Workqueue: events deferred_probe_work_func
[    6.669097] [<c010bf18>] (unwind_backtrace) from [<c010a0f4>] (show_stack+0x10/0x14)
[    6.677429] [<c010a0f4>] (show_stack) from [<c0124f18>] (__warn+0xbc/0xd4)
[    6.684844] [<c0124f18>] (__warn) from [<c0124f90>] (warn_slowpath_fmt+0x60/0xb8)
[    6.692901] [<c0124f90>] (warn_slowpath_fmt) from [<c040c0e8>] (drm_atomic_helper_commit_modeset_enables+0x134/0x268)
[    6.704254] [<c040c0e8>] (drm_atomic_helper_commit_modeset_enables) from [<c045442c>] (omap_atomic_commit_tail+0xb4/0xc0)
[    6.715972] [<c045442c>] (omap_atomic_commit_tail) from [<c040d1b4>] (commit_tail+0x9c/0x1a8)
[    6.725128] [<c040d1b4>] (commit_tail) from [<c040de70>] (drm_atomic_helper_commit+0x134/0x158)
[    6.734466] [<c040de70>] (drm_atomic_helper_commit) from [<c043b204>] (drm_client_modeset_commit_atomic+0x16c/0x208)
[    6.745727] [<c043b204>] (drm_client_modeset_commit_atomic) from [<c043b2f8>] (drm_client_modeset_commit_locked+0x58/0x184)
[    6.757629] [<c043b2f8>] (drm_client_modeset_commit_locked) from [<c043b448>] (drm_client_modeset_commit+0x24/0x40)
[    6.768798] [<c043b448>] (drm_client_modeset_commit) from [<c0412778>] (__drm_fb_helper_restore_fbdev_mode_unlocked+0xa0/0xc8)
[    6.780975] [<c0412778>] (__drm_fb_helper_restore_fbdev_mode_unlocked) from [<c0412808>] (drm_fb_helper_set_par+0x38/0x64)
[    6.792785] [<c0412808>] (drm_fb_helper_set_par) from [<c03a9b24>] (fbcon_init+0x3d4/0x568)
[    6.801757] [<c03a9b24>] (fbcon_init) from [<c03eaab0>] (visual_init+0xb8/0xfc)
[    6.809631] [<c03eaab0>] (visual_init) from [<c03ec070>] (do_bind_con_driver+0x1e0/0x3bc)
[    6.818267] [<c03ec070>] (do_bind_con_driver) from [<c03ec59c>] (do_take_over_console+0x138/0x1d8)
[    6.827880] [<c03ec59c>] (do_take_over_console) from [<c03a856c>] (do_fbcon_takeover+0x74/0xd4)
[    6.837219] [<c03a856c>] (do_fbcon_takeover) from [<c03a22e0>] (register_framebuffer+0x204/0x2d8)
[    6.846740] [<c03a22e0>] (register_framebuffer) from [<c0412228>] (__drm_fb_helper_initial_config_and_unlock+0x3a4/0x554)
[    6.858459] [<c0412228>] (__drm_fb_helper_initial_config_and_unlock) from [<c045c230>] (omap_fbdev_init+0x84/0xbc)
[    6.869537] [<c045c230>] (omap_fbdev_init) from [<c04549b8>] (pdev_probe+0x580/0x7d8)
[    6.877807] [<c04549b8>] (pdev_probe) from [<c04669b4>] (platform_drv_probe+0x48/0x98)
[    6.886291] [<c04669b4>] (platform_drv_probe) from [<c0464b3c>] (really_probe+0x1e0/0x344)
[    6.895172] [<c0464b3c>] (really_probe) from [<c0464dac>] (driver_probe_device+0x5c/0xb4)
[    6.903961] [<c0464dac>] (driver_probe_device) from [<c0462fd8>] (bus_for_each_drv+0x80/0xc4)
[    6.913085] [<c0462fd8>] (bus_for_each_drv) from [<c04648e8>] (__device_attach+0xd0/0x13c)
[    6.921966] [<c04648e8>] (__device_attach) from [<c0463c84>] (bus_probe_device+0x84/0x8c)
[    6.930725] [<c0463c84>] (bus_probe_device) from [<c04605e0>] (device_add+0x3f0/0x740)
[    6.939086] [<c04605e0>] (device_add) from [<c0466794>] (platform_device_add+0x110/0x204)
[    6.947845] [<c0466794>] (platform_device_add) from [<c04670b0>] (platform_device_register_full+0xcc/0x110)
[    6.958282] [<c04670b0>] (platform_device_register_full) from [<c044276c>] (dss_bind+0x80/0xa8)
[    6.967620] [<c044276c>] (dss_bind) from [<c045dfc8>] (try_to_bring_up_master+0x160/0x1a8)
[    6.976501] [<c045dfc8>] (try_to_bring_up_master) from [<c045e408>] (component_master_add_with_match+0xc4/0xf8)
[    6.987304] [<c045e408>] (component_master_add_with_match) from [<c0443524>] (dss_probe+0x494/0x55c)
[    6.997100] [<c0443524>] (dss_probe) from [<c04669b4>] (platform_drv_probe+0x48/0x98)
[    7.005523] [<c04669b4>] (platform_drv_probe) from [<c0464b3c>] (really_probe+0x1e0/0x344)
[    7.014404] [<c0464b3c>] (really_probe) from [<c0464dac>] (driver_probe_device+0x5c/0xb4)
[    7.023193] [<c0464dac>] (driver_probe_device) from [<c0462fd8>] (bus_for_each_drv+0x80/0xc4)
[    7.032348] [<c0462fd8>] (bus_for_each_drv) from [<c04648e8>] (__device_attach+0xd0/0x13c)
[    7.041198] [<c04648e8>] (__device_attach) from [<c0463c84>] (bus_probe_device+0x84/0x8c)
[    7.049987] [<c0463c84>] (bus_probe_device) from [<c046410c>] (deferred_probe_work_func+0x64/0x90)
[    7.059570] [<c046410c>] (deferred_probe_work_func) from [<c013b04c>] (process_one_work+0x1d4/0x440)
[    7.069213] [<c013b04c>] (process_one_work) from [<c013b518>] (worker_thread+0x260/0x590)
[    7.078002] [<c013b518>] (worker_thread) from [<c013f958>] (kthread+0x120/0x128)
[    7.085968] [<c013f958>] (kthread) from [<c0100148>] (ret_from_fork+0x14/0x2c)
[    7.093719] Exception stack(0xcfa05fb0 to 0xcfa05ff8)
[    7.099060] 5fa0:                                     00000000 00000000 00000000 00000000
[    7.107849] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    7.116607] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    7.123687] ---[ end trace 415544dc9303b330 ]---
[    7.379821] omapdrm omapdrm.0: atomic complete timeout (pipe 0)!

A.
