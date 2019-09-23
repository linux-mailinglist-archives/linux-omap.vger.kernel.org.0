Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54E3EBBAAB
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2019 19:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394086AbfIWRpL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 Sep 2019 13:45:11 -0400
Received: from muru.com ([72.249.23.125]:34262 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389763AbfIWRpL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 23 Sep 2019 13:45:11 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 783B2809F;
        Mon, 23 Sep 2019 17:45:42 +0000 (UTC)
Date:   Mon, 23 Sep 2019 10:45:07 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     linux-omap@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: musb: Could not flush host TX2 fifo: csr: 2403
Message-ID: <20190923174507.GW5610@atomide.com>
References: <CAGm1_kt_cbLHpw2=JKgKGEmdOu9d-=gT9hsLn_XwJg=gtdJY7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_kt_cbLHpw2=JKgKGEmdOu9d-=gT9hsLn_XwJg=gtdJY7Q@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Yegor Yefremov <yegorslists@googlemail.com> [190821 01:24]:
> I'm moving our systems to the recent kernel and have encountered an
> older musb issue [1] that occurs with some 3G/4G modems. In this case
> it is  SIMCom 7600G-H. After this dump occurs the modem is still
> working though.
> 
> [   45.585644] ------------[ cut here ]------------
> [   45.590785] WARNING: CPU: 0 PID: 242 at
> drivers/usb/musb/musb_host.c:115 musb_h_tx_flush_fifo+0x118/0x138
> [   45.600421] musb-hdrc musb-hdrc.0: Could not flush host TX2 fifo: csr: 2403
> [   45.607433] Modules linked in: 8021q garp stp mrp llc wl18xx wlcore
> mac80211 libarc4 sha256_generic cfg80211 wlcore_sdio c_can_platform
> omap_rng rng_core c_can can_dev at24 gpio_pca953x omap_wdt watchdog
> rtc_omap leds_gpio led_class
> [   45.628258] CPU: 0 PID: 242 Comm: ModemManager Not tainted 5.3.0-rc5 #2
> [   45.634920] Hardware name: Generic AM33XX (Flattened Device Tree)
> [   45.641092] [<c0111d28>] (unwind_backtrace) from [<c010d000>]
> (show_stack+0x10/0x14)
> [   45.648910] [<c010d000>] (show_stack) from [<c09bd0f0>]
> (dump_stack+0xd8/0x110)
> [   45.656291] [<c09bd0f0>] (dump_stack) from [<c013a034>] (__warn+0xe0/0x10c)
> [   45.663314] [<c013a034>] (__warn) from [<c013a0a4>]
> (warn_slowpath_fmt+0x44/0x6c)
> [   45.670862] [<c013a0a4>] (warn_slowpath_fmt) from [<c076fbf0>]
> (musb_h_tx_flush_fifo+0x118/0x138)
> [   45.679806] [<c076fbf0>] (musb_h_tx_flush_fifo) from [<c0770ef4>]
> (musb_cleanup_urb+0x128/0x204)
> [   45.688660] [<c0770ef4>] (musb_cleanup_urb) from [<c077167c>]
> (musb_urb_dequeue+0x14c/0x234)
> [   45.697165] [<c077167c>] (musb_urb_dequeue) from [<c07323fc>]
> (usb_hcd_unlink_urb+0x68/0x84)
> [   45.705667] [<c07323fc>] (usb_hcd_unlink_urb) from [<c0768530>]
> (usb_wwan_write+0x64/0x1f0)
> [   45.714090] [<c0768530>] (usb_wwan_write) from [<c075b600>]
> (serial_write+0x34/0x60)
> [   45.721898] [<c075b600>] (serial_write) from [<c060e3ec>]
> (n_tty_write+0x360/0x460)
> [   45.729626] [<c060e3ec>] (n_tty_write) from [<c060a1bc>]
> (tty_write+0x1c0/0x36c)
> [   45.737092] [<c060a1bc>] (tty_write) from [<c02f0410>]
> (__vfs_write+0x28/0x1c4)
> [   45.744465] [<c02f0410>] (__vfs_write) from [<c02f2f48>]
> (vfs_write+0xa0/0x184)
> [   45.751835] [<c02f2f48>] (vfs_write) from [<c02f31e8>] (ksys_write+0x98/0xdc)
> [   45.759033] [<c02f31e8>] (ksys_write) from [<c0101000>]
> (ret_fast_syscall+0x0/0x28)
> [   45.766743] Exception stack(0xcb911fa8 to 0xcb911ff0)
> [   45.771845] 1fa0:                   00160170 bea0fc14 00000009
> 00141be9 00000001 bea0fc14
> [   45.780086] 1fc0: 00160170 bea0fc14 00000000 00000004 00141be9
> 00000001 00000001 00141be9
> [   45.788322] 1fe0: 00000000 bea0fbc8 b68d992b b68d9934
> [   45.793416] irq event stamp: 109442
> [   45.796945] hardirqs last  enabled at (109441): [<c0101a74>]
> __irq_svc+0x74/0x98
> [   45.804406] hardirqs last disabled at (109442): [<c09dd3e8>]
> _raw_spin_lock_irqsave+0x1c/0x4c
> [   45.812992] softirqs last  enabled at (109180): [<c0102580>]
> __do_softirq+0x360/0x524
> [   45.820880] softirqs last disabled at (109157): [<c0141c28>]
> irq_exit+0x12c/0x17c
> [   45.828416] ---[ end trace eecf6f3aa6209643 ]---
> 
> [1] https://patchwork.kernel.org/patch/7389591/

Hmm so is this with am335x SoC glue or something else?

Regards,

Tony

