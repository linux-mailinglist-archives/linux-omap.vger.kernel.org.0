Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 017E2CCDE9
	for <lists+linux-omap@lfdr.de>; Sun,  6 Oct 2019 04:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfJFCjK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 5 Oct 2019 22:39:10 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39307 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfJFCjJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 5 Oct 2019 22:39:09 -0400
Received: by mail-io1-f68.google.com with SMTP id a1so21604603ioc.6;
        Sat, 05 Oct 2019 19:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+S4GlLIFJIY3EVSJ2bVxBrTgK2S22d3IvEfF9vr81TY=;
        b=Xpy+8XBXzMbs9onY2U2rtI9bLpo17gjYMzVJZCXDzNJu1nrPkWlQiLul3IYqsPirwi
         UKKNBpljqExxNP4vgP0YNpziX22UQSWXmEyd7kIH1VKznskFyD+W0UCHHAH1pw0GS7o5
         mz/uk9/pzTwyRx8OPgylRD6+XB83t4zyaOonxIsckAGKGJkViZ8sKspf1FtMlGywaPEQ
         cvYtj55OREHtUubsAei2RsK7vt4WFIhE1gha8CLkigmnVahu4H6zsM54J6F2woyuq3Ur
         vrEdhbLWmxrqjL1ntVBnegzETVg9hsCwVNMZCOa+3UcoqRsbzBEWv3G0uO6+j2qi01kK
         zmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+S4GlLIFJIY3EVSJ2bVxBrTgK2S22d3IvEfF9vr81TY=;
        b=AXMaUqSmaK7wN1L7sonT/R1FyhaWG3/L30V1qXn+l+6jrG/Ujc11DlKmyQjjunxdJT
         WDkQJQbozhYfL5vBplvE1/lsU3+wzAS1p6gqM7QEvAO+OY85+MfaJ+pOkLAU2rxXn0nk
         WVXomfTdtgcUDrk2BxLiXN1s0oVTQCNRo76bhM3FnvAro/+5IrJ6v8696SPqk5dvUW+c
         iWhaEP8YA/yfZBx0uLWgMwLFyXgZksdjYXe6ZZ5OOhUIaqoD0k0L55uCtQIk97DFimWx
         awZW31HPf5Lrj6SK7+ioyohpH+HFnqWY6aszP5+OJ4B1NB1TyLblYEaHjus+PVqUX+xj
         7wWA==
X-Gm-Message-State: APjAAAUoxhvVMxo+ykGfEBSeemJ/cUP3/+q/iqZPL3M6A3942ZDG5uHd
        oJSLY9zJrAdUel0M4ts+fEMpoEG6pE/rYxSI8r0=
X-Google-Smtp-Source: APXvYqzIBdoLSCov57+lRNL2z8ubtQIECyYFYH4u91affrDBLlcz4B4Poc4bxgnm4ix9e1Bc7n0ioI2DckXzbGbt8j8=
X-Received: by 2002:a5d:9c4c:: with SMTP id 12mr18510019iof.276.1570329546560;
 Sat, 05 Oct 2019 19:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xLO5VgA6tW4p7QjwPv_QXv==zbC38TxXtsR5x9H0mUGJA@mail.gmail.com>
 <CAHCN7xJPv7W381R7LS4bB8xWWpugz2NwbTUtj-hqHnDBZ9MFzA@mail.gmail.com>
 <CAGm1_kv6RMUDppu6ZjY9Dq7QL=hS=D+e3KS37+V0ncbwoXE6mQ@mail.gmail.com>
 <CAHCN7xKsGz4UA4gfM5jpS9UE-V7_k265G_hB=wQ5Ueh3T5kaNQ@mail.gmail.com>
 <CAHCN7xKirqyj3un1k+QNeoKc0DvOt4g8ScFScG02pZF=OX+GZg@mail.gmail.com>
 <CAHCN7xLkBi0dWiuirh7sAgywKFM5Oe=sU3nojSuN2MMzkqyEEA@mail.gmail.com> <CAHCN7xL8Ekgi=ht-pNhA7w+E3NAb2J5DY9khEsPmCscQZ=04ww@mail.gmail.com>
In-Reply-To: <CAHCN7xL8Ekgi=ht-pNhA7w+E3NAb2J5DY9khEsPmCscQZ=04ww@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 5 Oct 2019 21:38:55 -0500
Message-ID: <CAHCN7x+DKvKzyyNbzNYPZHZJOWET-=MCrLdo56MGdqGjwD1bQg@mail.gmail.com>
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

On Sat, Oct 5, 2019 at 8:23 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Fri, Oct 4, 2019 at 10:45 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Fri, Oct 4, 2019 at 11:51 AM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > On Fri, Oct 4, 2019 at 9:08 AM Adam Ford <aford173@gmail.com> wrote:
> > > >
> > > > On Fri, Oct 4, 2019 at 7:27 AM Yegor Yefremov
> > > > <yegorslists@googlemail.com> wrote:
> > > > >
> > > > > Hi Adam,
> > > > >
> > > > > On Fri, Oct 4, 2019 at 12:39 PM Adam Ford <aford173@gmail.com> wrote:
> > > > > >
> > > > > > On Fri, Oct 4, 2019 at 5:02 AM Adam Ford <aford173@gmail.com> wrote:
> > > > > > >
> > > > > > > I am running Kernel 5.3.2 trying to troubleshoot some intermittent
> > > > > > > Bluetooth issues, and I think I have narrowed it down to the serial
> > > > > > > driver in use.
> > > > > >
> > > > > > I should have also noted that it's using UART2 with CTS and RTS on the
> > > > > > DM3730 (omap3630) and its configured with a baud rate of 3M.
> > > > > > I tried slowing it to 115200, but that didn't help.  I tried disabling
> > > > > > the DMA hooks from the device tree, and that didn't help.
> > > > > >
> > > > > > > By default, omap2plus_defconfig enables both SERIAL_8250_OMAP and
> > > > > > > SERIAL_OMAP.  I have my console device configured as  ttyS0, and all
> > > > > > > appears fine.  When I enable Bluetooth, however, I get intermittent
> > > > > > > errors on an DM3730 / OMAP3630.
> > > > > > >
> > > > > > > Using the 8250 driver for Blueotooth I get intermittent frame errors
> > > > > > > and data loss.
> > > > > > >
> > > > > > > Scanning ...
> > > > > > > [   28.482452] Bluetooth: hci0: Frame reassembly failed (-84)
> > > > > > > [   36.162170] Bluetooth: hci0: Frame reassembly failed (-84)
> > > > > > >         F4:4E:FC:C9:2F:57       BluJax
> > > > > > > # l2ping F4:4E:FC:C9:2F:57
> > > > > > > Ping: F4:4E:FC:C9:2F:57 from 00:18:30:49:7D:63 (data size 44) ...
> > > > > > > 44 bytes from F4:4E:FC:C9:2F:57 id 0 time 8.27ms
> > > > > > > no response from F4:4E:FC:C9:2F:57: id 1
> > > > > > > ^C2 sent, 1 received, 50% loss
> > > > > > >
> > > > > > > (after a fairly long hang, I hit control-c)
> > > > > > >
> > > > > > > However, disabling the 8250 driver and using the only SERIAL_OMAP and
> > > > > > > the console routed to ttyO0, the Bluetooth works well, so I believe it
> > > > > > > to be a serial driver issue and not a Bluetooth error.
> > > > > > >
> > > > > > > # hcitool scan
> > > > > > > Scanning ...
> > > > > > >         F4:4E:FC:C9:2F:57       BluJax
> > > > > > > ^C
> > > > > > > # l2ping F4:4E:FC:C9:2F:57
> > > > > > > Ping: F4:4E:FC:C9:2F:57 from 00:18:30:49:7D:63 (data size 44) ...
> > > > > > > 44 bytes from F4:4E:FC:C9:2F:57 id 0 time 6.90ms
> > > > > > > ...
> > > > > > > 44 bytes from F4:4E:FC:C9:2F:57 id 14 time 28.29ms
> > > > > > > ^C15 sent, 15 received, 0% loss
> > > > > > > #
> > > > > > >
> > > > > > > 0% loss and regular, repeatable communication without any Frame
> > > > > > > reassembly errors.
> > > > > > >
> > > > > >
> > > > > > I tried disabling SERIAL_OMAP and using only SERIAL_8250_OMAP, but
> > > > > > that didn't help.  Because the issue goes away when I disable
> > > > > > SERIAL_8250_OMAP, I am wondering if something is either being
> > > > > > misconfigured or some IRQ or DMA integration is missing that may be
> > > > > > present with the older SERIAL_OMAP driver.
> > > > > >
> > > > > > > Any suggestions on how to troubleshoot or what might cause the
> > > > > > > difference between the two drivers?
> > > > >
> > > > > Can it be related to this issue [1]? Can you confirm that 5.2 is
> > > > > working as expected with the 8250 driver?
> > > > >
> > > > > [1] https://marc.info/?l=linux-serial&m=156965039008649&w=2
> > > >
> > > > I reverted the whole 8250 directory to d99482673f95 ("serial:
> > > > mctrl_gpio: Check if GPIO property exisits before requesting it") and
> > > > it is somewhat better, but it's not as good as the stock OMAP serial
> > > > driver.  I get some frame errors and eventually, I get some timeouts,
> > > > but it's not as bad.  I'll try to implement the RTS and CTS as gpio
> > > > pins and change the device tree accordingly.  It might shed some light
> > > > on the situation.
> > >

Yegor,

Can you take a look at [1]?  I am still investigating the DMA issue
that I have where the serial port does not correctly work with DMA
enabled, but I submitted a patch that appears to fix my serial port
issue (as long as 8250 DMA is off).
I tested this against 5.4-rc1, and Tony submitted a different patch
that seems to help as well [2] that seems to help with the 5.2 and 5.3
kernels.

thanks

adam

[1] - https://patchwork.kernel.org/patch/11175969/

And for trees prior to 5.4-rc1):
[2] - https://patchwork.kernel.org/patch/11054387/



> > > I tried to manually setup RTS and CTS pins as GPIO, but that didn't
> > > work, so I changed it back.
> > >
> > > It looks like the clocking is correct.  I don't know enough about the
> > > DMA or the IRQ to know if it's working correctly.
> > >
> > > I was wondering if the problem is in the handshaking or not.
> > > I added " uart-has-rtscts;" to by uart node thinking it might help,
> > > but it did not.
> > >
> > > >
> > > 8250_omap.c has some checks to see if we can enable autoRTS:
> > >
> > > if (termios->c_cflag & CRTSCTS && up->port.flags & UPF_HARD_FLOW &&
> > >     !up->gpios) {
> > >      /* Enable AUTOCTS (autoRTS is enabled when RTS is raised) */
> > >      ...
> > > }
> > >
> > > Based on this, I would expect up->gpios to always be zero if we want
> > > auto RTS CTS.
> > >
> > > I threw some debug code into the serial driver to look at the status
> > > of the various flags that go into setting up auto RTS/CTS.
> > >
> > > [   13.837005] termios->c_cflag & CRTSCTS = 80000000
> > > [   13.841888] up->port.flags & UPF_HARD_FLOW = 300000
> > > [   13.846801] up->gpios = ce3f3cc0
> > > [   17.166595] termios->c_cflag & CRTSCTS = 0
> > > [   17.170745] up->port.flags & UPF_HARD_FLOW = 300000
> > > [   17.175781] up->gpios = ce3f3d40
> > >
> > > I don't know which port is which, but I only have two active uarts
> > > (console and Bluetooth)
> > > The Bluetooth port should use handshaking and the console should not.
> > >
> > > From the look of the dump, up->gpios is never 0, so the last
> > > evaluation would always be false unless I am misinterpreting
> > > something.
> > >
> > > I tried to modify the check to remove !up->gpios check, but that
> > > didn't help either, but it made it a little better.
> >
> > I have it working now on the 5.3.y branch, but I had to do 4 things.
> >
> > 1)   Disable the older OMAP serial driver
> > 2)   Apply [1] patch
> > 3)   Disable 8250 DMA support
> > 4)  Remove checks for !up->gpios in the 8250-omap.c code.
> >
> > With all those changes, I am able to successfully and repeatedly scan
> > and l2ping Bluetooth devices.  Without any one of those, I get frame
> > errors or lost packets.
> >
> > I wonder if we can dump the legacy omap serial driver once  the 8250
> > driver is working better.  That would eliminate at least one of the 4.
> > I am not sure what's up with the DMA, and I've already stated some
> > thoughts on item 4 in a previous e-mail.
> >
> > I think the [1] patch is probably going to help fix some other issues
> > and should probably be backported, but by itself it isn't enough to
> > fix the Bluetooth problem on the OMAP3630.
> >
> > [1] - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/tty/serial/8250/8250_omap.c?h=v5.4-rc1&id=627a545c6bb0c7de09208e6546f5111290477261
> >
> In the latest 'master' branch of 5.4-RC1 (43b815c6a8e7), I have
> confirmed that by removing the DMA and forcing the checks for
> !up->gpios to be true to keep the hardware flow control working, I can
> repeatably make Bluetooth work.
>
> I am not sure what's broken in the DMA, but the check for  !up->gpios
> is never false, so it never actually does the code inside to address
> handshaking
>
> index c68e2b3a1634..884fcba61303 100644
> --- a/drivers/tty/serial/8250/8250_omap.c
> +++ b/drivers/tty/serial/8250/8250_omap.c
> @@ -141,7 +141,7 @@ static void omap8250_set_mctrl(struct uart_port
> *port, unsigned int mctrl)
>
>         serial8250_do_set_mctrl(port, mctrl);
>
> -       if (!up->gpios) {
> +       if (1 /* !up->gpios */) {
>                 /*
>                  * Turn off autoRTS if RTS is lowered and restore autoRTS
>                  * setting if RTS is raised
> @@ -455,8 +455,7 @@ static void omap_8250_set_termios(struct uart_port *port,
>         priv->efr = 0;
>         up->port.status &= ~(UPSTAT_AUTOCTS | UPSTAT_AUTORTS | UPSTAT_AUTOXOFF);
>
> -       if (termios->c_cflag & CRTSCTS && up->port.flags & UPF_HARD_FLOW &&
> -           !up->gpios) {
> +       if (termios->c_cflag & CRTSCTS && up->port.flags & UPF_HARD_FLOW) {
>                 /* Enable AUTOCTS (autoRTS is enabled when RTS is raised) */
>                 up->port.status |= UPSTAT_AUTOCTS | UPSTAT_AUTORTS;
>                 priv->efr |= UART_EFR_CTS;
>
> I know this is wrong to do what I did, but whatever is setting gpios
> is clearly not setting it to NULL, so I am guessing these checks here
> to be something else or something needs to be able to set these to
> NULL when there are no manually configured gpio pints for cts/rts.
>
> adam
>
> > adam
> > >
> > >
> > > > adam
> > > > >
> > > > > Cheers,
> > > > > Yegor
