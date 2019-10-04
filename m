Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64459CC116
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2019 18:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728671AbfJDQvk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Oct 2019 12:51:40 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33930 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbfJDQvj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Oct 2019 12:51:39 -0400
Received: by mail-io1-f66.google.com with SMTP id q1so15067208ion.1;
        Fri, 04 Oct 2019 09:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1m5jMl+j0wFCdGUDGZKKaL6nviatVJQaN7YzAwj3ZUs=;
        b=rtGE/maStH7QAtH/Tydy2qxQVsveofu5bu6sC5eRUZYx9ILOFtWaXSSpEFFf2iHYF2
         5RIK5U43/6p/zgoe7l3fvcpLHWE1il4GxscoIR+p/PS1bSNc2dmu2g+PVfpK5/rQBGck
         LictbWaY7Dav8baespzhw7QubnIvI09sguG/VFRmSmK/jZ84YvIV6U4SNWxWpUJq3lBd
         K46xH3c7BoYCZavKfwV28ETdeh+MgDs1c4yaxshWpB7fc3dc4Q9qaYaDE5DWUBiKDTIj
         AmczBSiM0UKf8FAa2WFLSIdrFmHcv+WBlZ/J+rUS8ySyBG9/yFHcYYyN1NuN5PBq2Fel
         LLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1m5jMl+j0wFCdGUDGZKKaL6nviatVJQaN7YzAwj3ZUs=;
        b=pPiQCR+Y2d3uaYdWxdNRlu5mapuS3tMq90i3j8OYo03ktUr/bqL7PijFJAziQCi88V
         OWnLYS8kqO90uPZ8Gwb6sJ5YE96H6Ayu7FfRdkVEwYoEWQXctYlHnVagsHVboEiYXT/A
         NOP0xw1d+i1gObV9qsmqxlSNV4QdysLfzXA+ZREukECU8H1ut7bxEkHbqb7pDqxXJMaP
         YmO6hpPUNgyswDplE9etb1YPDe/NznYFYUqHvF3tRqCsEoKDxelE+5YJhdnX9Pujfjl9
         Y6H9Fq54FYagR5Qz0rcpvr1FShkwB8ZW/7lAf+8B707Vi5fVfWpGBOtcmyinvN1+6lKJ
         Y5OQ==
X-Gm-Message-State: APjAAAVcaOptkwxsqNxzjf6GATVpT+Fo8wHiwyWFSz+1FN++Zl9kFjNr
        sNSfzoEBzfNIgD44h0r7Bpkm1tdNyPOfPRZlr1Q=
X-Google-Smtp-Source: APXvYqxjbUkl/PPycJs0mioIVrdWJpeRRCmnG8ST8fukbge6BCLJArIZwITPrFFWqLG9P9I6pPOilOofsMdWyBXaoOg=
X-Received: by 2002:a92:3314:: with SMTP id a20mr16052072ilf.276.1570207898037;
 Fri, 04 Oct 2019 09:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xLO5VgA6tW4p7QjwPv_QXv==zbC38TxXtsR5x9H0mUGJA@mail.gmail.com>
 <CAHCN7xJPv7W381R7LS4bB8xWWpugz2NwbTUtj-hqHnDBZ9MFzA@mail.gmail.com>
 <CAGm1_kv6RMUDppu6ZjY9Dq7QL=hS=D+e3KS37+V0ncbwoXE6mQ@mail.gmail.com> <CAHCN7xKsGz4UA4gfM5jpS9UE-V7_k265G_hB=wQ5Ueh3T5kaNQ@mail.gmail.com>
In-Reply-To: <CAHCN7xKsGz4UA4gfM5jpS9UE-V7_k265G_hB=wQ5Ueh3T5kaNQ@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 4 Oct 2019 11:51:27 -0500
Message-ID: <CAHCN7xKirqyj3un1k+QNeoKc0DvOt4g8ScFScG02pZF=OX+GZg@mail.gmail.com>
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

On Fri, Oct 4, 2019 at 9:08 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Fri, Oct 4, 2019 at 7:27 AM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> >
> > Hi Adam,
> >
> > On Fri, Oct 4, 2019 at 12:39 PM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > On Fri, Oct 4, 2019 at 5:02 AM Adam Ford <aford173@gmail.com> wrote:
> > > >
> > > > I am running Kernel 5.3.2 trying to troubleshoot some intermittent
> > > > Bluetooth issues, and I think I have narrowed it down to the serial
> > > > driver in use.
> > >
> > > I should have also noted that it's using UART2 with CTS and RTS on the
> > > DM3730 (omap3630) and its configured with a baud rate of 3M.
> > > I tried slowing it to 115200, but that didn't help.  I tried disabling
> > > the DMA hooks from the device tree, and that didn't help.
> > >
> > > > By default, omap2plus_defconfig enables both SERIAL_8250_OMAP and
> > > > SERIAL_OMAP.  I have my console device configured as  ttyS0, and all
> > > > appears fine.  When I enable Bluetooth, however, I get intermittent
> > > > errors on an DM3730 / OMAP3630.
> > > >
> > > > Using the 8250 driver for Blueotooth I get intermittent frame errors
> > > > and data loss.
> > > >
> > > > Scanning ...
> > > > [   28.482452] Bluetooth: hci0: Frame reassembly failed (-84)
> > > > [   36.162170] Bluetooth: hci0: Frame reassembly failed (-84)
> > > >         F4:4E:FC:C9:2F:57       BluJax
> > > > # l2ping F4:4E:FC:C9:2F:57
> > > > Ping: F4:4E:FC:C9:2F:57 from 00:18:30:49:7D:63 (data size 44) ...
> > > > 44 bytes from F4:4E:FC:C9:2F:57 id 0 time 8.27ms
> > > > no response from F4:4E:FC:C9:2F:57: id 1
> > > > ^C2 sent, 1 received, 50% loss
> > > >
> > > > (after a fairly long hang, I hit control-c)
> > > >
> > > > However, disabling the 8250 driver and using the only SERIAL_OMAP and
> > > > the console routed to ttyO0, the Bluetooth works well, so I believe it
> > > > to be a serial driver issue and not a Bluetooth error.
> > > >
> > > > # hcitool scan
> > > > Scanning ...
> > > >         F4:4E:FC:C9:2F:57       BluJax
> > > > ^C
> > > > # l2ping F4:4E:FC:C9:2F:57
> > > > Ping: F4:4E:FC:C9:2F:57 from 00:18:30:49:7D:63 (data size 44) ...
> > > > 44 bytes from F4:4E:FC:C9:2F:57 id 0 time 6.90ms
> > > > ...
> > > > 44 bytes from F4:4E:FC:C9:2F:57 id 14 time 28.29ms
> > > > ^C15 sent, 15 received, 0% loss
> > > > #
> > > >
> > > > 0% loss and regular, repeatable communication without any Frame
> > > > reassembly errors.
> > > >
> > >
> > > I tried disabling SERIAL_OMAP and using only SERIAL_8250_OMAP, but
> > > that didn't help.  Because the issue goes away when I disable
> > > SERIAL_8250_OMAP, I am wondering if something is either being
> > > misconfigured or some IRQ or DMA integration is missing that may be
> > > present with the older SERIAL_OMAP driver.
> > >
> > > > Any suggestions on how to troubleshoot or what might cause the
> > > > difference between the two drivers?
> >
> > Can it be related to this issue [1]? Can you confirm that 5.2 is
> > working as expected with the 8250 driver?
> >
> > [1] https://marc.info/?l=linux-serial&m=156965039008649&w=2
>
> I reverted the whole 8250 directory to d99482673f95 ("serial:
> mctrl_gpio: Check if GPIO property exisits before requesting it") and
> it is somewhat better, but it's not as good as the stock OMAP serial
> driver.  I get some frame errors and eventually, I get some timeouts,
> but it's not as bad.  I'll try to implement the RTS and CTS as gpio
> pins and change the device tree accordingly.  It might shed some light
> on the situation.

I tried to manually setup RTS and CTS pins as GPIO, but that didn't
work, so I changed it back.

It looks like the clocking is correct.  I don't know enough about the
DMA or the IRQ to know if it's working correctly.

I was wondering if the problem is in the handshaking or not.
I added " uart-has-rtscts;" to by uart node thinking it might help,
but it did not.

>
8250_omap.c has some checks to see if we can enable autoRTS:

if (termios->c_cflag & CRTSCTS && up->port.flags & UPF_HARD_FLOW &&
    !up->gpios) {
     /* Enable AUTOCTS (autoRTS is enabled when RTS is raised) */
     ...
}

Based on this, I would expect up->gpios to always be zero if we want
auto RTS CTS.

I threw some debug code into the serial driver to look at the status
of the various flags that go into setting up auto RTS/CTS.

[   13.837005] termios->c_cflag & CRTSCTS = 80000000
[   13.841888] up->port.flags & UPF_HARD_FLOW = 300000
[   13.846801] up->gpios = ce3f3cc0
[   17.166595] termios->c_cflag & CRTSCTS = 0
[   17.170745] up->port.flags & UPF_HARD_FLOW = 300000
[   17.175781] up->gpios = ce3f3d40

I don't know which port is which, but I only have two active uarts
(console and Bluetooth)
The Bluetooth port should use handshaking and the console should not.

From the look of the dump, up->gpios is never 0, so the last
evaluation would always be false unless I am misinterpreting
something.

I tried to modify the check to remove !up->gpios check, but that
didn't help either, but it made it a little better.


> adam
> >
> > Cheers,
> > Yegor
