Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DEDCC47F8
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 08:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfJBG4w (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 02:56:52 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:43101 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbfJBG4w (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Oct 2019 02:56:52 -0400
Received: by mail-vk1-f195.google.com with SMTP id p189so4091558vkf.10;
        Tue, 01 Oct 2019 23:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m7IoxHvFgvupR3Nk9f01zLRntdU+W6U05TC7wbltaEA=;
        b=PWJSGM0UYXiuSM3qezblzyuC+wpTwSd615hDOXbrv7z8WWfcgZq988et7aE5A2L4qg
         qb1eo0KKIDr7uZRoo7cKQKgmqQlTDhMI6KTPbP5m/xiMzWuEwqyImOhPQyij9+45tL0c
         H6epzPt/SN0S9Fbrc/+3mUmi8KLRicy1EqMcgwuHoXrOzFriLSRNEMgR73uwYnB1xSQY
         T48XZNd0v8Xrw81c5mHumMOO4exGgv5wlFPK2BP/WAhvFm40/fKez4iwBIQ/mbLlGecd
         KZdORCFFW7lNDmeS+1dL2kQi9Kl5jy8Cy1FjozknjU9oIYXN8uky5CLk/5TX8dWj6tKw
         IOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m7IoxHvFgvupR3Nk9f01zLRntdU+W6U05TC7wbltaEA=;
        b=ZxtmrMCdgN3x4EWc/pYy3Js1gbzJ2nmbX0/VbSloCpwLnFl8LV6vEwH8HmFOSMoH2M
         Qs63i3f4cLJXxxujn1cj9mrsT2LG3HGp+ocgeVSk7RTcmDpPVrqCwCu12gKgIiCajM7s
         6XLtNt5eKUcrNGxMQvP/m2gBMonZPNRZeu+TDdkdw4fkf7utvmNMTv7lr2giAZCv3HFr
         JDVsJrQY0xGKlrUMzxNlYxUUA7PuGgynfTi0ij57g+ywkUGNeimskdQm/z2RivjGQ0y5
         6nY8fELtf+7ioTJV+FWqdaSZJWdv74BqVbZz9EP9UA1SXxLk3lmixYoI5atZHxrl9ZrQ
         6A9g==
X-Gm-Message-State: APjAAAW6mu0DGdGhfLnNG7ioF7ATLIE8liotgefTJodDOJzeB85iiAxE
        JsZTxKKHDtAdrVzpJEWFUzy3AgmsBG/1Uwwfe7k=
X-Google-Smtp-Source: APXvYqwC8ca9lQkmVwWoebOPPw7xPSHBRHoHTgOX8MFIVZyBsmAuLskVWC7PbgyAabAeEI472aHMTPIbRVmIpdrPasU=
X-Received: by 2002:ac5:cc63:: with SMTP id w3mr1258263vkm.34.1569999410534;
 Tue, 01 Oct 2019 23:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190927155738.GF5610@atomide.com> <CAGm1_kvvMc848f6f+kg5K2sQ3+NHA-Se7T_pcwQfrB=4GfZM4Q@mail.gmail.com>
 <CAGm1_kvZpYH+NP8JfYJWE2v3E9v+yFs20L8MSKsAjfC_g+GmaQ@mail.gmail.com>
 <CAGm1_ktjndofS_N-qh7GVRuJFG1Jn87rf4D8Lt2XMj=+RrL2aw@mail.gmail.com>
 <20190930145711.GG5610@atomide.com> <20190930152330.GH5610@atomide.com>
 <20190930195411.6porqtm7tlokgel3@earth.universe> <20191001080339.GF13531@localhost>
 <CAGm1_ksg2x9USqB+XGhkMQpA-zc77Ha1-j+foPJFR7R3XPZsNg@mail.gmail.com>
 <20191001164351.GJ5610@atomide.com> <20191001220321.GK5610@atomide.com>
In-Reply-To: <20191001220321.GK5610@atomide.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Wed, 2 Oct 2019 08:56:33 +0200
Message-ID: <CAGm1_kv12P1hb7PXSQUo3EXXrCUCQV0ptoQpxewGYHJgROL=cQ@mail.gmail.com>
Subject: Re: musb: cppi41: broken high speed FTDI functionality when connected
 to musb directly
To:     Tony Lindgren <tony@atomide.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-omap@vger.kernel.org,
        vkoul@kernel.org, Bin Liu <b-liu@ti.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        Andrey Skvortsov <andrej.skvortzov@gmail.com>,
        giulio.benetti@benettiengineering.com,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 2, 2019 at 12:03 AM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * Tony Lindgren <tony@atomide.com> [191001 16:52]:
> > * Yegor Yefremov <yegorslists@googlemail.com> [191001 09:20]:
> > > I've tried to increase the autosuspend_delay_ms and to set control to
> > > "on" but nothing changes. Below you can see the output of my testing
> > > script [1] (Py2 only). As one can see, the first cycle i.e. after the
> > > port is open for the first time, fails. But the subsequent cycle is
> > > successful. If you invoke the script again, everything repeats.
> > >
> > > I've also made printk() in cppi41_run_queue() and it looks like this
> > > routine will be called from cppi41_dma_issue_pending() only in the
> > > beginning of the second test cycle.
> >
> > So sounds like for you intially cppi41_dma_issue_pending() has
> > !cdd->is_suspended and just adds the request to the queue. And
> > then cppi41_run_queue() never gets called if this happens while
> > we have cppi41_runtime_resume() is still running?
>
> I got it reproducable here by adding msleep(500) to the beginning
> of cppi41_runtime_resume() :) Otherwise I'm only able to trigger
> the issue maybe one out of 20 tries it seems.
>
> Turns out the first dma call done by musb_ep_program() must wait
> if cppi41 is PM runtime suspended. Otherwise musb_ep_program()
> continues with other PIO packets before the DMA transfer is
> started.
>
> The patch below fixes it for me with a pm_runtime_get_sync()
> in device_prep_slave_sg, so adding Peter and Vinod to Cc.
>
> The other way to fix this would be to just wake up cpp41 in
> cppi41_dma_prep_slave_sg() and return NULL so that we can
> have musb_ep_program() continue with PIO while cppi41 is
> asleep.
>
> Anyways, care to try it out and see if it fixes your issue?
>
> Regards,
>
> Tony
>
> 8< ------------------
> diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
> --- a/drivers/dma/ti/cppi41.c
> +++ b/drivers/dma/ti/cppi41.c
> @@ -586,9 +586,18 @@ static struct dma_async_tx_descriptor *cppi41_dma_prep_slave_sg(
>         enum dma_transfer_direction dir, unsigned long tx_flags, void *context)
>  {
>         struct cppi41_channel *c = to_cpp41_chan(chan);
> +       struct cppi41_dd *cdd = c->cdd;
>         struct cppi41_desc *d;
>         struct scatterlist *sg;
>         unsigned int i;
> +       int error;
> +
> +       error = pm_runtime_get_sync(cdd->ddev.dev);
> +       if (error < 0) {
> +               pm_runtime_put_noidle(cdd->ddev.dev);
> +
> +               return NULL;
> +       }
>
>         d = c->desc;
>         for_each_sg(sgl, sg, sg_len, i) {
> @@ -611,6 +620,9 @@ static struct dma_async_tx_descriptor *cppi41_dma_prep_slave_sg(
>                 d++;
>         }
>
> +       pm_runtime_mark_last_busy(cdd->ddev.dev);
> +       pm_runtime_put_autosuspend(cdd->ddev.dev);
> +
>         return &c->txd;
>  }

The fix is working but on the first invocation, I get this output
(minicom provokes the same output):

# serialtest.py -c 2 /dev/ttyUSB0 /dev/ttyUSB0
[  210.674524]
[  210.676065] ================================
[  210.680359] WARNING: inconsistent lock state
[  210.684660] 5.4.0-rc1 #5 Not tainted
[  210.688255] --------------------------------
[  210.692550] inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
[  210.698592] serialtest.py/250 [HC0[0]:SC0[0]:HE1:SE1] takes:
[  210.704284] ccce4050 (&(&musb->lock)->rlock){?.-.}, at:
musb_urb_enqueue+0x2e4/0x768 [musb_hdrc]
[  210.713299] {IN-HARDIRQ-W} state was registered at:
[  210.718229]   _raw_spin_lock_irqsave+0x38/0x4c
[  210.722716]   dsps_interrupt+0x28/0x288 [musb_dsps]
[  210.727631]   __handle_irq_event_percpu+0x48/0x35c
[  210.732452]   handle_irq_event_percpu+0x28/0x7c
[  210.737011]   handle_irq_event+0x38/0x5c
[  210.740963]   handle_level_irq+0xc8/0x158
[  210.744999]   generic_handle_irq+0x20/0x34
[  210.749121]   __handle_domain_irq+0x64/0xe0
[  210.753334]   __irq_usr+0x54/0x80
[  210.756669]   0xb6dc6820
[  210.759218] irq event stamp: 28856
[  210.762655] hardirqs last  enabled at (28855): [<c02de7e0>]
kmem_cache_alloc_trace+0xc0/0x724
[  210.771231] hardirqs last disabled at (28856): [<c09983d4>]
_raw_spin_lock_irqsave+0x1c/0x4c
[  210.779718] softirqs last  enabled at (28774): [<c0102580>]
__do_softirq+0x360/0x520
[  210.787507] softirqs last disabled at (28759): [<c0142954>]
irq_exit+0x148/0x180
[  210.794939]
[  210.794939] other info that might help us debug this:
[  210.801499]  Possible unsafe locking scenario:
[  210.801499]
[  210.807449]        CPU0
[  210.809909]        ----
[  210.812367]   lock(&(&musb->lock)->rlock);
[  210.816490]   <Interrupt>
[  210.819125]     lock(&(&musb->lock)->rlock);
[  210.823422]
[  210.823422]  *** DEADLOCK ***
[  210.823422]
[  210.829376] 4 locks held by serialtest.py/250:
[  210.833843]  #0: ccf138dc (&tty->legacy_mutex){+.+.}, at:
tty_init_dev+0x48/0x1cc
[  210.841395]  #1: cce50160 (&port->mutex){+.+.}, at: tty_port_open+0x4c/0xc0
[  210.848412]  #2: ccb08d4c (&serial->disc_mutex){+.+.}, at:
serial_port_activate+0x20/0x90 [usbserial]
[  210.857747]  #3: ccce4050 (&(&musb->lock)->rlock){?.-.}, at:
musb_urb_enqueue+0x2e4/0x768 [musb_hdrc]
[  210.867105]
[  210.867105] stack backtrace:
[  210.871495] CPU: 0 PID: 250 Comm: serialtest.py Not tainted 5.4.0-rc1 #5
[  210.878232] Hardware name: Generic AM33XX (Flattened Device Tree)
[  210.884387] [<c0112220>] (unwind_backtrace) from [<c010cf04>]
(show_stack+0x10/0x14)
[  210.892190] [<c010cf04>] (show_stack) from [<c0977494>]
(dump_stack+0xd8/0x110)
[  210.899554] [<c0977494>] (dump_stack) from [<c01a2af8>]
(mark_lock+0x54c/0x59c)
[  210.906910] [<c01a2af8>] (mark_lock) from [<c01a2b94>]
(mark_held_locks+0x4c/0x78)
[  210.914527] [<c01a2b94>] (mark_held_locks) from [<c01a2c70>]
(lockdep_hardirqs_on+0xb0/0x208)
[  210.923105] [<c01a2c70>] (lockdep_hardirqs_on) from [<c099859c>]
(_raw_spin_unlock_irq+0x24/0x2c)
[  210.932037] [<c099859c>] (_raw_spin_unlock_irq) from [<c065fc94>]
(__rpm_callback+0x70/0x11c)
[  210.940612] [<c065fc94>] (__rpm_callback) from [<c065fd60>]
(rpm_callback+0x20/0x80)
[  210.948402] [<c065fd60>] (rpm_callback) from [<c065f7cc>]
(rpm_resume+0x468/0x7a0)
[  210.956018] [<c065f7cc>] (rpm_resume) from [<c065fb50>]
(__pm_runtime_resume+0x4c/0x64)
[  210.964086] [<c065fb50>] (__pm_runtime_resume) from [<bf020940>]
(cppi41_dma_prep_slave_sg+0x20/0xfc [cppi41])
[  210.974221] [<bf020940>] (cppi41_dma_prep_slave_sg [cppi41]) from
[<bf0bfa5c>] (cppi41_dma_channel_program+0x134/0x3b4 [musb_hdrc])
[  210.986232] [<bf0bfa5c>] (cppi41_dma_channel_program [musb_hdrc])
from [<bf0b4d78>] (musb_start_urb+0xa00/0xe08 [musb_hdrc])
[  210.997626] [<bf0b4d78>] (musb_start_urb [musb_hdrc]) from
[<bf0b6248>] (musb_urb_enqueue+0x620/0x768 [musb_hdrc])
[  211.008416] [<bf0b6248>] (musb_urb_enqueue [musb_hdrc]) from
[<bf07320c>] (usb_hcd_submit_urb+0xdc/0x928 [usbcore])
[  211.019104] [<bf07320c>] (usb_hcd_submit_urb [usbcore]) from
[<bf05911c>] (usb_serial_generic_submit_read_urb+0x44/0x8c
[usbserial])
[  211.031123] [<bf05911c>] (usb_serial_generic_submit_read_urb
[usbserial]) from [<bf05917c>]
(usb_serial_generic_submit_read_urbs+0x18/0x60 [usbserial])
[  211.044795] [<bf05917c>] (usb_serial_generic_submit_read_urbs
[usbserial]) from [<bf05731c>] (serial_port_activate+0x44/0x90
[usbserial])
[  211.057233] [<bf05731c>] (serial_port_activate [usbserial]) from
[<c061ed70>] (tty_port_open+0x80/0xc0)
[  211.066690] [<c061ed70>] (tty_port_open) from [<c06179a8>]
(tty_open+0xdc/0x3f4)
[  211.074144] [<c06179a8>] (tty_open) from [<c02fcb30>]
(chrdev_open+0xa0/0x194)
[  211.081424] [<c02fcb30>] (chrdev_open) from [<c02f4080>]
(do_dentry_open+0x22c/0x40c)
[  211.089312] [<c02f4080>] (do_dentry_open) from [<c030864c>]
(path_openat+0x2bc/0x1494)
[  211.097281] [<c030864c>] (path_openat) from [<c030a984>]
(do_filp_open+0x6c/0xdc)
[  211.104810] [<c030a984>] (do_filp_open) from [<c02f55a0>]
(do_sys_open+0x168/0x218)
[  211.112513] [<c02f55a0>] (do_sys_open) from [<c0101000>]
(ret_fast_syscall+0x0/0x28)
[  211.120298] Exception stack(0xcc9a3fa8 to 0xcc9a3ff0)
[  211.125387] 3fa0:                   b6ee3000 00022050 000c6000
00020902 00000000 00000000
[  211.133616] 3fc0: b6ee3000 00022050 00022050 00000005 0002e7b4
00022050 b6aa8760 00000002
[  211.141838] 3fe0: 00000005 befb4800 b6d44217 b6d458b6

Regards,
Yegor
