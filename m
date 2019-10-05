Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E676CC786
	for <lists+linux-omap@lfdr.de>; Sat,  5 Oct 2019 05:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbfJEDpz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Oct 2019 23:45:55 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:42934 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfJEDpy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Oct 2019 23:45:54 -0400
Received: by mail-io1-f68.google.com with SMTP id n197so17740899iod.9;
        Fri, 04 Oct 2019 20:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RbOV3wUZGc55OMGd29XCe5o36BtLuTkL2nl8j4ZexH8=;
        b=iLaLvLZPDI3+ubx2d1POYTJlXGaqW+uAKgvv/uUNV6F+dNuF/AH/LVe3pXauHSdsBv
         j0yNP+tEZNx7Ha+jUAQrwSK2+0UEpT9nmrH7bBXzrueGjd/aAUrzw2fmf/o0Jk/D7z52
         XyEeU5YtkRixCKjG6zeT/rOUaoHY5q4lLK1uZwQUgHR4y0AZT81aawaZvdntGsHnQnGf
         beo6Jpt/A9Yl5tfuLPpnWYzcZClBVoWjB4NB07MCY90BmHXubbt39PRIoj9FdLBWP5zC
         PLkK9uQSW0P5Yn4x0PsFQm1+TLw2bp0ZTZd95OsnYHyuW8YkNPSfhxYfsH6D/a16obIJ
         kbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RbOV3wUZGc55OMGd29XCe5o36BtLuTkL2nl8j4ZexH8=;
        b=qwu6Ea1rbJNrv+IUNP85HTzQUsCKSoaoYuopt0pIlogDqpGrP8cxbysLAub3J3GfPA
         L1pTsBC3erBo8zxlnKXNaniTkhvS1dvTs9W4oaiE6AqNXoFCvjRFkrMmjRF+1cGUhGaO
         AjE6mlNxwoYPuEvBYVCR5hFRkvr3xAmjlbKxwXC9Rveex7s1YqUl5KZGHutzKs7ff+Fo
         D5RmtJ7Z+wIVMmf7xYZsYAHDNaRLGlbO2tG6PPM9jyO6+DdyHnXJwuT7aeg0YtsG54oL
         8xOrMRAXIPe6bpDshBdNkO0LxxF1dSlHOFVexAhg5ESf0/leg7+9HKuNgWbynl98MIPG
         9/Wg==
X-Gm-Message-State: APjAAAVtlnN5bjFvUFBT1nQl5eYm1GNavYYHRyE7MYvIsJALQXfYtPm0
        uuzN00WBtJRM63CdhK+27Z1lfJZsypUYbwdqynw=
X-Google-Smtp-Source: APXvYqz3tCzOSy/+h7h3l/lcKeA+u1PiF903ta+om2XMsvEk/JNZMNqbbHXnymtiAUL86JYced4BzI8YhAWqrun8eo0=
X-Received: by 2002:a02:6017:: with SMTP id i23mr935803jac.0.1570247153151;
 Fri, 04 Oct 2019 20:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xLO5VgA6tW4p7QjwPv_QXv==zbC38TxXtsR5x9H0mUGJA@mail.gmail.com>
 <CAHCN7xJPv7W381R7LS4bB8xWWpugz2NwbTUtj-hqHnDBZ9MFzA@mail.gmail.com>
 <CAGm1_kv6RMUDppu6ZjY9Dq7QL=hS=D+e3KS37+V0ncbwoXE6mQ@mail.gmail.com>
 <CAHCN7xKsGz4UA4gfM5jpS9UE-V7_k265G_hB=wQ5Ueh3T5kaNQ@mail.gmail.com> <CAHCN7xKirqyj3un1k+QNeoKc0DvOt4g8ScFScG02pZF=OX+GZg@mail.gmail.com>
In-Reply-To: <CAHCN7xKirqyj3un1k+QNeoKc0DvOt4g8ScFScG02pZF=OX+GZg@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 4 Oct 2019 22:45:46 -0500
Message-ID: <CAHCN7xLkBi0dWiuirh7sAgywKFM5Oe=sU3nojSuN2MMzkqyEEA@mail.gmail.com>
Subject: Re: DM3730 Bluetooth Performance differences between SERIAL_8250_OMAP
 vs SERIAL_OMAP
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Vignesh R <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Oct 4, 2019 at 11:51 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Fri, Oct 4, 2019 at 9:08 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Fri, Oct 4, 2019 at 7:27 AM Yegor Yefremov
> > <yegorslists@googlemail.com> wrote:
> > >
> > > Hi Adam,
> > >
> > > On Fri, Oct 4, 2019 at 12:39 PM Adam Ford <aford173@gmail.com> wrote:
> > > >
> > > > On Fri, Oct 4, 2019 at 5:02 AM Adam Ford <aford173@gmail.com> wrote:
> > > > >
> > > > > I am running Kernel 5.3.2 trying to troubleshoot some intermittent
> > > > > Bluetooth issues, and I think I have narrowed it down to the serial
> > > > > driver in use.
> > > >
> > > > I should have also noted that it's using UART2 with CTS and RTS on the
> > > > DM3730 (omap3630) and its configured with a baud rate of 3M.
> > > > I tried slowing it to 115200, but that didn't help.  I tried disabling
> > > > the DMA hooks from the device tree, and that didn't help.
> > > >
> > > > > By default, omap2plus_defconfig enables both SERIAL_8250_OMAP and
> > > > > SERIAL_OMAP.  I have my console device configured as  ttyS0, and all
> > > > > appears fine.  When I enable Bluetooth, however, I get intermittent
> > > > > errors on an DM3730 / OMAP3630.
> > > > >
> > > > > Using the 8250 driver for Blueotooth I get intermittent frame errors
> > > > > and data loss.
> > > > >
> > > > > Scanning ...
> > > > > [   28.482452] Bluetooth: hci0: Frame reassembly failed (-84)
> > > > > [   36.162170] Bluetooth: hci0: Frame reassembly failed (-84)
> > > > >         F4:4E:FC:C9:2F:57       BluJax
> > > > > # l2ping F4:4E:FC:C9:2F:57
> > > > > Ping: F4:4E:FC:C9:2F:57 from 00:18:30:49:7D:63 (data size 44) ...
> > > > > 44 bytes from F4:4E:FC:C9:2F:57 id 0 time 8.27ms
> > > > > no response from F4:4E:FC:C9:2F:57: id 1
> > > > > ^C2 sent, 1 received, 50% loss
> > > > >
> > > > > (after a fairly long hang, I hit control-c)
> > > > >
> > > > > However, disabling the 8250 driver and using the only SERIAL_OMAP and
> > > > > the console routed to ttyO0, the Bluetooth works well, so I believe it
> > > > > to be a serial driver issue and not a Bluetooth error.
> > > > >
> > > > > # hcitool scan
> > > > > Scanning ...
> > > > >         F4:4E:FC:C9:2F:57       BluJax
> > > > > ^C
> > > > > # l2ping F4:4E:FC:C9:2F:57
> > > > > Ping: F4:4E:FC:C9:2F:57 from 00:18:30:49:7D:63 (data size 44) ...
> > > > > 44 bytes from F4:4E:FC:C9:2F:57 id 0 time 6.90ms
> > > > > ...
> > > > > 44 bytes from F4:4E:FC:C9:2F:57 id 14 time 28.29ms
> > > > > ^C15 sent, 15 received, 0% loss
> > > > > #
> > > > >
> > > > > 0% loss and regular, repeatable communication without any Frame
> > > > > reassembly errors.
> > > > >
> > > >
> > > > I tried disabling SERIAL_OMAP and using only SERIAL_8250_OMAP, but
> > > > that didn't help.  Because the issue goes away when I disable
> > > > SERIAL_8250_OMAP, I am wondering if something is either being
> > > > misconfigured or some IRQ or DMA integration is missing that may be
> > > > present with the older SERIAL_OMAP driver.
> > > >
> > > > > Any suggestions on how to troubleshoot or what might cause the
> > > > > difference between the two drivers?
> > >
> > > Can it be related to this issue [1]? Can you confirm that 5.2 is
> > > working as expected with the 8250 driver?
> > >
> > > [1] https://marc.info/?l=linux-serial&m=156965039008649&w=2
> >
> > I reverted the whole 8250 directory to d99482673f95 ("serial:
> > mctrl_gpio: Check if GPIO property exisits before requesting it") and
> > it is somewhat better, but it's not as good as the stock OMAP serial
> > driver.  I get some frame errors and eventually, I get some timeouts,
> > but it's not as bad.  I'll try to implement the RTS and CTS as gpio
> > pins and change the device tree accordingly.  It might shed some light
> > on the situation.
>
> I tried to manually setup RTS and CTS pins as GPIO, but that didn't
> work, so I changed it back.
>
> It looks like the clocking is correct.  I don't know enough about the
> DMA or the IRQ to know if it's working correctly.
>
> I was wondering if the problem is in the handshaking or not.
> I added " uart-has-rtscts;" to by uart node thinking it might help,
> but it did not.
>
> >
> 8250_omap.c has some checks to see if we can enable autoRTS:
>
> if (termios->c_cflag & CRTSCTS && up->port.flags & UPF_HARD_FLOW &&
>     !up->gpios) {
>      /* Enable AUTOCTS (autoRTS is enabled when RTS is raised) */
>      ...
> }
>
> Based on this, I would expect up->gpios to always be zero if we want
> auto RTS CTS.
>
> I threw some debug code into the serial driver to look at the status
> of the various flags that go into setting up auto RTS/CTS.
>
> [   13.837005] termios->c_cflag & CRTSCTS = 80000000
> [   13.841888] up->port.flags & UPF_HARD_FLOW = 300000
> [   13.846801] up->gpios = ce3f3cc0
> [   17.166595] termios->c_cflag & CRTSCTS = 0
> [   17.170745] up->port.flags & UPF_HARD_FLOW = 300000
> [   17.175781] up->gpios = ce3f3d40
>
> I don't know which port is which, but I only have two active uarts
> (console and Bluetooth)
> The Bluetooth port should use handshaking and the console should not.
>
> From the look of the dump, up->gpios is never 0, so the last
> evaluation would always be false unless I am misinterpreting
> something.
>
> I tried to modify the check to remove !up->gpios check, but that
> didn't help either, but it made it a little better.

I have it working now on the 5.3.y branch, but I had to do 4 things.

1)   Disable the older OMAP serial driver
2)   Apply [1] patch
3)   Disable 8250 DMA support
4)  Remove checks for !up->gpios in the 8250-omap.c code.

With all those changes, I am able to successfully and repeatedly scan
and l2ping Bluetooth devices.  Without any one of those, I get frame
errors or lost packets.

I wonder if we can dump the legacy omap serial driver once  the 8250
driver is working better.  That would eliminate at least one of the 4.
I am not sure what's up with the DMA, and I've already stated some
thoughts on item 4 in a previous e-mail.

I think the [1] patch is probably going to help fix some other issues
and should probably be backported, but by itself it isn't enough to
fix the Bluetooth problem on the OMAP3630.

[1] - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/tty/serial/8250/8250_omap.c?h=v5.4-rc1&id=627a545c6bb0c7de09208e6546f5111290477261

adam
>
>
> > adam
> > >
> > > Cheers,
> > > Yegor
