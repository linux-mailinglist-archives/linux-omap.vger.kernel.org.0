Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F930974CE
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2019 10:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbfHUIYE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Aug 2019 04:24:04 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:37030 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfHUIYE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Aug 2019 04:24:04 -0400
Received: by mail-vs1-f65.google.com with SMTP id q188so821743vsa.4;
        Wed, 21 Aug 2019 01:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=0ZYOhaXziyopUu4yQ7NDO9r3XJlJMH+kc0PEY3F5Biw=;
        b=GW2/QhsQg7295rXP4rzhO2ZxxyCnttdz88ovVCRwvoYtsstRBYYLUQU2EbtpRm15c0
         UHPuf4myAXJ1Qc/J9ctnEWWXocTo9v9Jbep6nr7blJwnOYCLkK+/uL+g+Uf4AFOM5tn5
         CS//Q9CisOSZicTmq9xv1P3h76Ldmct8COTbK3w/DJSS6hY9K9h/JvzMcQdg5L3dpdwS
         j+cyYoq8HI60XIaPuS2bCPNSzTdnkV+WPZzcUDIVD8rf6Bmj5iCVHtYMOq2bq+LEv6Cs
         sOd8w77xgylEMddG+Z+61oFg/D9ieLsfAcLKvI6a94eZcmSKVMNx4/x1vWnT1CDws+wn
         Kqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=0ZYOhaXziyopUu4yQ7NDO9r3XJlJMH+kc0PEY3F5Biw=;
        b=phx+00LgcTWfFDWPTGJdCdPoSse1RO53DiSnufe2yl6i2WNGMeJlz8t3/fx3YXr+6P
         Zr9E5eFKaV5UfnSQBeXK5gAcHIkdAlXVrNBXvyIQw4xtuvlT3w8HlahQ3EBI1FB+ZPiA
         1E2toGoXedH2pFvIzOmgLh2qDAl7ngoY0CTNV9FGvyTKEy/jko+u4o1jKRb5oK3YjAkY
         gPhnW9CcvD1SCIhQM/bUZm+hLMRFEl7LxQSgvyQYpRpYveuaLfhi7Oerz+JrJJ8VozMK
         hYJGyv9O0kfA8vsUJZWx1yShMxBWIZT3CRBIBQFqqbOXVsq8CMCy0VGMTjRILAilKpNZ
         x6eA==
X-Gm-Message-State: APjAAAXdCOga4+qMC1VDDThOb7jg4q1d+FAd2EbIF3bhffBohUESO58T
        S19ksLeW7NMnecJyPaLaWsourjt4ptUfg/xRfjNqvGdqtco=
X-Google-Smtp-Source: APXvYqyhIW1BgX238dkpOipJIIDenE8ivDd1DgGtgQNfuw+MwPeN6jaXWpKE3XhPBC27BT9WfEmUa8T5par18ZGTkLc=
X-Received: by 2002:a67:be15:: with SMTP id x21mr20182663vsq.142.1566375842882;
 Wed, 21 Aug 2019 01:24:02 -0700 (PDT)
MIME-Version: 1.0
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Wed, 21 Aug 2019 10:23:12 +0200
Message-ID: <CAGm1_kt_cbLHpw2=JKgKGEmdOu9d-=gT9hsLn_XwJg=gtdJY7Q@mail.gmail.com>
Subject: musb: Could not flush host TX2 fifo: csr: 2403
To:     linux-omap@vger.kernel.org
Cc:     Bin Liu <b-liu@ti.com>, linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I'm moving our systems to the recent kernel and have encountered an
older musb issue [1] that occurs with some 3G/4G modems. In this case
it is  SIMCom 7600G-H. After this dump occurs the modem is still
working though.

[   45.585644] ------------[ cut here ]------------
[   45.590785] WARNING: CPU: 0 PID: 242 at
drivers/usb/musb/musb_host.c:115 musb_h_tx_flush_fifo+0x118/0x138
[   45.600421] musb-hdrc musb-hdrc.0: Could not flush host TX2 fifo: csr: 2403
[   45.607433] Modules linked in: 8021q garp stp mrp llc wl18xx wlcore
mac80211 libarc4 sha256_generic cfg80211 wlcore_sdio c_can_platform
omap_rng rng_core c_can can_dev at24 gpio_pca953x omap_wdt watchdog
rtc_omap leds_gpio led_class
[   45.628258] CPU: 0 PID: 242 Comm: ModemManager Not tainted 5.3.0-rc5 #2
[   45.634920] Hardware name: Generic AM33XX (Flattened Device Tree)
[   45.641092] [<c0111d28>] (unwind_backtrace) from [<c010d000>]
(show_stack+0x10/0x14)
[   45.648910] [<c010d000>] (show_stack) from [<c09bd0f0>]
(dump_stack+0xd8/0x110)
[   45.656291] [<c09bd0f0>] (dump_stack) from [<c013a034>] (__warn+0xe0/0x10c)
[   45.663314] [<c013a034>] (__warn) from [<c013a0a4>]
(warn_slowpath_fmt+0x44/0x6c)
[   45.670862] [<c013a0a4>] (warn_slowpath_fmt) from [<c076fbf0>]
(musb_h_tx_flush_fifo+0x118/0x138)
[   45.679806] [<c076fbf0>] (musb_h_tx_flush_fifo) from [<c0770ef4>]
(musb_cleanup_urb+0x128/0x204)
[   45.688660] [<c0770ef4>] (musb_cleanup_urb) from [<c077167c>]
(musb_urb_dequeue+0x14c/0x234)
[   45.697165] [<c077167c>] (musb_urb_dequeue) from [<c07323fc>]
(usb_hcd_unlink_urb+0x68/0x84)
[   45.705667] [<c07323fc>] (usb_hcd_unlink_urb) from [<c0768530>]
(usb_wwan_write+0x64/0x1f0)
[   45.714090] [<c0768530>] (usb_wwan_write) from [<c075b600>]
(serial_write+0x34/0x60)
[   45.721898] [<c075b600>] (serial_write) from [<c060e3ec>]
(n_tty_write+0x360/0x460)
[   45.729626] [<c060e3ec>] (n_tty_write) from [<c060a1bc>]
(tty_write+0x1c0/0x36c)
[   45.737092] [<c060a1bc>] (tty_write) from [<c02f0410>]
(__vfs_write+0x28/0x1c4)
[   45.744465] [<c02f0410>] (__vfs_write) from [<c02f2f48>]
(vfs_write+0xa0/0x184)
[   45.751835] [<c02f2f48>] (vfs_write) from [<c02f31e8>] (ksys_write+0x98/0xdc)
[   45.759033] [<c02f31e8>] (ksys_write) from [<c0101000>]
(ret_fast_syscall+0x0/0x28)
[   45.766743] Exception stack(0xcb911fa8 to 0xcb911ff0)
[   45.771845] 1fa0:                   00160170 bea0fc14 00000009
00141be9 00000001 bea0fc14
[   45.780086] 1fc0: 00160170 bea0fc14 00000000 00000004 00141be9
00000001 00000001 00141be9
[   45.788322] 1fe0: 00000000 bea0fbc8 b68d992b b68d9934
[   45.793416] irq event stamp: 109442
[   45.796945] hardirqs last  enabled at (109441): [<c0101a74>]
__irq_svc+0x74/0x98
[   45.804406] hardirqs last disabled at (109442): [<c09dd3e8>]
_raw_spin_lock_irqsave+0x1c/0x4c
[   45.812992] softirqs last  enabled at (109180): [<c0102580>]
__do_softirq+0x360/0x524
[   45.820880] softirqs last disabled at (109157): [<c0141c28>]
irq_exit+0x12c/0x17c
[   45.828416] ---[ end trace eecf6f3aa6209643 ]---

[1] https://patchwork.kernel.org/patch/7389591/

Regards,
Yegor
