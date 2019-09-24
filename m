Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23610BC230
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2019 09:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409156AbfIXHCo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Sep 2019 03:02:44 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:36238 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390189AbfIXHCn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Sep 2019 03:02:43 -0400
Received: by mail-ua1-f68.google.com with SMTP id r25so215866uam.3;
        Tue, 24 Sep 2019 00:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sql3flZuIztK9oqNiMpTd8hU3HMfoWfMs+I0W9n0wFE=;
        b=DS+iqEqoWLRGQVgEGMrlj3j2o7rEg1VTig6fhyq77e28iGpZHLxI5abTCwVpaelo7K
         3NVP/kM7rBxngXySsSO2TBNzR6Kc3hi1mS8v6ZK5+SrooNGTOCKO1BpJpCKxry+6qBav
         xRIDv2D8+Nd0RDOZ/nkGWquiq8J/ytB8t/I1H4KVP40Lxijl6LasSR+uOY6LPXtozyW4
         zfe3VUBC5Yl7owrmLmXwU489/ee3F4sbhlgS/NaUOeO3MbHD2b9vq8/P+wU/fZVr+JUl
         e5kFCfJW2KjHFVhtf7r+MdGtGEVRL7WoiYpPRiWityyn9cpejk6GAKMlAWbGchjnGx2o
         aGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sql3flZuIztK9oqNiMpTd8hU3HMfoWfMs+I0W9n0wFE=;
        b=QxR5NVsRKBkjFcbV/ZPzgvRlZmOglOkGROtlAy7xcIqrFbnzcmYtoIujxz8OmXnx3G
         DdT96kUuksPQW80Q4lUjmjj3RYBDpkxIHSLnlV2MDLOh22zcrR3JulW357WRDPtoFUri
         NwreiDTkCv+hpMiz5ZmX2vQjBg1wo29MzDDupRB1L4ufjfqCMtnhytZbaG41S/D2pyGr
         gbVXzujJ6nBTfzBxZHmPNqtptUeKafn/0jpuH5RbI+1+CNCJ0ywHDQhn1cbK1z1jJ95j
         W8WsoGHyn13w08UiRRT0pFbYrlKKqIAVyBA8xyc1cr7zKwJR7hTNKAgHhV4tiJBElSlp
         qg7g==
X-Gm-Message-State: APjAAAUc9lLWuhj0J4HX2gLqvsD/T4Kd79mj/ch1l4vr8UpChUPl+UcR
        9EOOMaL6L8cV6pXgDUMNqHDLe6uiljoqUYQH0rk=
X-Google-Smtp-Source: APXvYqwbSJp5p9j2Aw+1vWTPOpKH1yks0mFwKCItSkE/RbVAK5hWC/yoDFvYhKmPk95sY795BLPSvD7mMyEJ5HJpjx4=
X-Received: by 2002:ab0:e10:: with SMTP id g16mr693296uak.42.1569308562260;
 Tue, 24 Sep 2019 00:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kt_cbLHpw2=JKgKGEmdOu9d-=gT9hsLn_XwJg=gtdJY7Q@mail.gmail.com>
 <20190923174507.GW5610@atomide.com>
In-Reply-To: <20190923174507.GW5610@atomide.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Tue, 24 Sep 2019 09:02:28 +0200
Message-ID: <CAGm1_kuRf=pc4D_a8CpP8sF60ZSxUBTL==bxKaVbhVB_ni+hAQ@mail.gmail.com>
Subject: Re: musb: Could not flush host TX2 fifo: csr: 2403
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, Bin Liu <b-liu@ti.com>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 23, 2019 at 7:45 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Yegor Yefremov <yegorslists@googlemail.com> [190821 01:24]:
> > I'm moving our systems to the recent kernel and have encountered an
> > older musb issue [1] that occurs with some 3G/4G modems. In this case
> > it is  SIMCom 7600G-H. After this dump occurs the modem is still
> > working though.
> >
> > [   45.585644] ------------[ cut here ]------------
> > [   45.590785] WARNING: CPU: 0 PID: 242 at
> > drivers/usb/musb/musb_host.c:115 musb_h_tx_flush_fifo+0x118/0x138
> > [   45.600421] musb-hdrc musb-hdrc.0: Could not flush host TX2 fifo: csr: 2403
> > [   45.607433] Modules linked in: 8021q garp stp mrp llc wl18xx wlcore
> > mac80211 libarc4 sha256_generic cfg80211 wlcore_sdio c_can_platform
> > omap_rng rng_core c_can can_dev at24 gpio_pca953x omap_wdt watchdog
> > rtc_omap leds_gpio led_class
> > [   45.628258] CPU: 0 PID: 242 Comm: ModemManager Not tainted 5.3.0-rc5 #2
> > [   45.634920] Hardware name: Generic AM33XX (Flattened Device Tree)
> > [   45.641092] [<c0111d28>] (unwind_backtrace) from [<c010d000>]
> > (show_stack+0x10/0x14)
> > [   45.648910] [<c010d000>] (show_stack) from [<c09bd0f0>]
> > (dump_stack+0xd8/0x110)
> > [   45.656291] [<c09bd0f0>] (dump_stack) from [<c013a034>] (__warn+0xe0/0x10c)
> > [   45.663314] [<c013a034>] (__warn) from [<c013a0a4>]
> > (warn_slowpath_fmt+0x44/0x6c)
> > [   45.670862] [<c013a0a4>] (warn_slowpath_fmt) from [<c076fbf0>]
> > (musb_h_tx_flush_fifo+0x118/0x138)
> > [   45.679806] [<c076fbf0>] (musb_h_tx_flush_fifo) from [<c0770ef4>]
> > (musb_cleanup_urb+0x128/0x204)
> > [   45.688660] [<c0770ef4>] (musb_cleanup_urb) from [<c077167c>]
> > (musb_urb_dequeue+0x14c/0x234)
> > [   45.697165] [<c077167c>] (musb_urb_dequeue) from [<c07323fc>]
> > (usb_hcd_unlink_urb+0x68/0x84)
> > [   45.705667] [<c07323fc>] (usb_hcd_unlink_urb) from [<c0768530>]
> > (usb_wwan_write+0x64/0x1f0)
> > [   45.714090] [<c0768530>] (usb_wwan_write) from [<c075b600>]
> > (serial_write+0x34/0x60)
> > [   45.721898] [<c075b600>] (serial_write) from [<c060e3ec>]
> > (n_tty_write+0x360/0x460)
> > [   45.729626] [<c060e3ec>] (n_tty_write) from [<c060a1bc>]
> > (tty_write+0x1c0/0x36c)
> > [   45.737092] [<c060a1bc>] (tty_write) from [<c02f0410>]
> > (__vfs_write+0x28/0x1c4)
> > [   45.744465] [<c02f0410>] (__vfs_write) from [<c02f2f48>]
> > (vfs_write+0xa0/0x184)
> > [   45.751835] [<c02f2f48>] (vfs_write) from [<c02f31e8>] (ksys_write+0x98/0xdc)
> > [   45.759033] [<c02f31e8>] (ksys_write) from [<c0101000>]
> > (ret_fast_syscall+0x0/0x28)
> > [   45.766743] Exception stack(0xcb911fa8 to 0xcb911ff0)
> > [   45.771845] 1fa0:                   00160170 bea0fc14 00000009
> > 00141be9 00000001 bea0fc14
> > [   45.780086] 1fc0: 00160170 bea0fc14 00000000 00000004 00141be9
> > 00000001 00000001 00141be9
> > [   45.788322] 1fe0: 00000000 bea0fbc8 b68d992b b68d9934
> > [   45.793416] irq event stamp: 109442
> > [   45.796945] hardirqs last  enabled at (109441): [<c0101a74>]
> > __irq_svc+0x74/0x98
> > [   45.804406] hardirqs last disabled at (109442): [<c09dd3e8>]
> > _raw_spin_lock_irqsave+0x1c/0x4c
> > [   45.812992] softirqs last  enabled at (109180): [<c0102580>]
> > __do_softirq+0x360/0x524
> > [   45.820880] softirqs last disabled at (109157): [<c0141c28>]
> > irq_exit+0x12c/0x17c
> > [   45.828416] ---[ end trace eecf6f3aa6209643 ]---
> >
> > [1] https://patchwork.kernel.org/patch/7389591/
>
> Hmm so is this with am335x SoC glue or something else?

I've found the following comment in drivers/usb/musb/musb_host.c [1]:

                /*
                   * FIXME: sometimes the tx fifo flush failed, it has been
                   * observed during device disconnect on AM335x.
                   *
                   * To reproduce the issue, ensure tx urb(s) are queued when
                   * unplug the usb device which is connected to AM335x usb
                   * host port.
                   *
                   * I found using a usb-ethernet device and running iperf
                   * (client on AM335x) has very high chance to trigger it.
                   *
                   * Better to turn on musb_dbg() in musb_cleanup_urb() with
                   * CPPI enabled to see the issue when aborting the tx channel.
                   */

So the issue is already known but so far unresolved :-(

[1] https://github.com/torvalds/linux/blob/master/drivers/usb/musb/musb_host.c#L100

Regards,
Yegor
