Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3F66CD330
	for <lists+linux-omap@lfdr.de>; Sun,  6 Oct 2019 17:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfJFPtX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 6 Oct 2019 11:49:23 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:41504 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbfJFPtS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 6 Oct 2019 11:49:18 -0400
Received: by mail-io1-f67.google.com with SMTP id n26so23388635ioj.8;
        Sun, 06 Oct 2019 08:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DVyb17pYWBVxpEz729OU5EAKrN9e7f4C5QWm7g4uW30=;
        b=nfOY10Ffh32AhKixfrKqArSCvXADVwesNQna11FmoMrBhsi86R1WZHi6JGJA6ww9yf
         ld89BjMPpmLROyAlGAKE6IsJyH1j3vDRJgV3ZwjhppEJPxhv4/nbw7ex8gCCx3fGaPzD
         bK5uJSwliezNwjl6n4j2Gq6m2PoiZphcXW0SwpuG9Odilh2qJc9B9IoiWUbIcj6HyNd4
         NTcV0PhNCQdt7LmqOoGt/mZdJyPSzcRy7ADT2iR/Pdl6fRB9lbKJzU3/c5dz/RzPhYyq
         Lv+ZPgG/+CNKGUWri3Kr7pEsxvWdwDUepOW46srhddDzS319BmqymLaLiwKZ+3L62IWP
         ezsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DVyb17pYWBVxpEz729OU5EAKrN9e7f4C5QWm7g4uW30=;
        b=dXdCWPUWihPkUg+2IqKOT63d3uX/lL5DZXSLWThoZWQBZv5ZP2Kq2mIVweOnzx6M0z
         jvjj5RbW1EyyErberfCqaEg3PzbL1JgIBkp3YP0LjPijOZwUF6K/Ay0g2BTUmM7UHdyN
         PHIYjYZOlf9RAejr60GkZDcE3p5wgRTRg/C5R8fuGsIIiHjHdEIJhdfgEuBKRpHUyLGK
         7QfgkVPFyN+FMEcpviYOfzlO+qrTbkDUr7wnW2BPf+U2tqhSRTf6N37UXBZFuNXQGOXl
         BeI01gDpv7lcEPBoPgZxu1gOfI6hMn/gZcfO2e4djaI+M+vRuPU+zyOjGFL89eRNoi5J
         bJsw==
X-Gm-Message-State: APjAAAXaa2xCVyaw/ROZSDMH2fB+uVxykv0bHVaSeREQ9gnI1JoqqJeK
        pfimrumymSJKYoXWwqC4EG8FXYujPK0fi0gxbaY=
X-Google-Smtp-Source: APXvYqwZsp/r60O7n+AtoPPIk9hHfJMonwDz5ykyikMzeVeg0vmrcwvEzihrePApD3oJ3VMJUmachF0hzobLzrp4Rqo=
X-Received: by 2002:a05:6e02:683:: with SMTP id o3mr23863136ils.58.1570376956996;
 Sun, 06 Oct 2019 08:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191006023254.23841-1-aford173@gmail.com> <CAGm1_ksBaEN0OWR+dTwT9SgoybtnchcCKasjXf5ybP2fZfRF7A@mail.gmail.com>
 <CAHCN7xLgTiXxLrW4njTT8Zaiib6+F4xo07wk0-sQp8h+j=E3yw@mail.gmail.com> <CAGm1_kuPbOLYUfGBHp5TEf9wtF5fQOMcEfLTVCp6uSHJo-YKZQ@mail.gmail.com>
In-Reply-To: <CAGm1_kuPbOLYUfGBHp5TEf9wtF5fQOMcEfLTVCp6uSHJo-YKZQ@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 6 Oct 2019 10:49:05 -0500
Message-ID: <CAHCN7xKihTMqK537Kph-xkzdeovsOQQ1VR7t2fxfTgWjZJxFgQ@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250_omap: Fix gpio check for auto RTS and CTS
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     linux-serial@vger.kernel.org, Adam Ford <adam.ford@logicpd.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, Vignesh R <vigneshr@ti.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tony Lindgren <tony@atomide.com>,
        Douglas Anderson <dianders@chromium.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Stefan Roese <sr@denx.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Oct 6, 2019 at 7:34 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> On Sun, Oct 6, 2019 at 1:38 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Sun, Oct 6, 2019 at 6:21 AM Yegor Yefremov
> > <yegorslists@googlemail.com> wrote:
> > >
> > > Hi Adam,
> > >
> > > On Sun, Oct 6, 2019 at 4:33 AM Adam Ford <aford173@gmail.com> wrote:
> > > >
> > > > There are two checks to see if the manual gpio is configured, but
> > > > these the check is seeing if the structure is NULL instead it
> > > > should check to see if there are CTS and/or RTS pins defined.
> > > >
> > > > This patch uses checks for those individual pins instead of
> > > > checking for the structure itself.
> > diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
> index e682390..d5fdb71 100644
> --- a/drivers/tty/serial/8250/8250_core.c
> +++ b/drivers/tty/serial/8250/8250_core.c
> @@ -1031,6 +1031,8 @@ int serial8250_register_8250_port(struct
> uart_8250_port *up)
>                         } else {
>                                 uart->gpios = gpios;
>                         }
> +               } else {
> +                       uart->gpios = NULL;
>                 }
>
>                 serial8250_set_defaults(uart);
> > >
> > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > >
> > > > diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
> > > > index c68e2b3a1634..836e736ae188 100644
> > > > --- a/drivers/tty/serial/8250/8250_omap.c
> > > > +++ b/drivers/tty/serial/8250/8250_omap.c
> > > > @@ -141,7 +141,7 @@ static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
> > > >
> > > >         serial8250_do_set_mctrl(port, mctrl);
> > > >
> > > > -       if (!up->gpios) {
> > > > +       if (!mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_RTS)) {
> > > >                 /*
> > > >                  * Turn off autoRTS if RTS is lowered and restore autoRTS
> > > >                  * setting if RTS is raised
> > > > @@ -456,7 +456,8 @@ static void omap_8250_set_termios(struct uart_port *port,
> > > >         up->port.status &= ~(UPSTAT_AUTOCTS | UPSTAT_AUTORTS | UPSTAT_AUTOXOFF);
> > > >
> > > >         if (termios->c_cflag & CRTSCTS && up->port.flags & UPF_HARD_FLOW &&
> > > > -           !up->gpios) {
> > > > +           !mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_RTS) &&
> > > > +           !mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_CTS)) {
> > > >                 /* Enable AUTOCTS (autoRTS is enabled when RTS is raised) */
> > > >                 up->port.status |= UPSTAT_AUTOCTS | UPSTAT_AUTORTS;
> > > >                 priv->efr |= UART_EFR_CTS;
> > >
> > > Looks good to me but !up->gpios must remain as otherwise, we will get
> > > NULL pointer dereference. What do you think?

What we if add a check to make sure we deference it?  I was thinking
something like:

diff --git a/drivers/tty/serial/serial_mctrl_gpio.c
b/drivers/tty/serial/serial_mctrl_gpio.c
index d9074303c88e..fb4781292d40 100644
--- a/drivers/tty/serial/serial_mctrl_gpio.c
+++ b/drivers/tty/serial/serial_mctrl_gpio.c
@@ -66,6 +66,9 @@ EXPORT_SYMBOL_GPL(mctrl_gpio_set);
 struct gpio_desc *mctrl_gpio_to_gpiod(struct mctrl_gpios *gpios,
                                      enum mctrl_gpio_idx gidx)
 {
+       if (gpios == NULL)
+               return NULL;
+
        return gpios->gpio[gidx];
 }
 EXPORT_SYMBOL_GPL(mctrl_gpio_to_gpiod);

This should make my previous patch tolerate situations where gpios is
NULL.  It also explictly looks for conditions where the gpios are
manually configured for RTS and/or CTS.

> >
> > I was not seeing up->gpios ever NULL so the contents inside the check
> > never was executed.  When I removed the check, the performance came
> > back.  I looked at examples on how other devices checked for RTS and
> > CTS, and I noticed that the Atmel serial driver did something like the
> > above.
> >
> > >
> > > Also adding some more people who can be interested in testing this approach.
> >
> > I am open for ideas.  If something is better, but something is either
> > incorrectly setting up->gpios to non-NULL or the check for non-NULL is
> > wrong.
>
> I wonder whether we forgot to add this assignment for the ACPI systems:
>

I unwound my patch and applied your patch instead, but it is back to
having corrupt frames again.

> diff --git a/drivers/tty/serial/8250/8250_core.c
> b/drivers/tty/serial/8250/8250_core.c
> index e682390..d5fdb71 100644
> --- a/drivers/tty/serial/8250/8250_core.c
> +++ b/drivers/tty/serial/8250/8250_core.c
> @@ -1031,6 +1031,8 @@ int serial8250_register_8250_port(struct
> uart_8250_port *up)
>                         } else {
>                                 uart->gpios = gpios;
>                         }
> +               } else {
> +                       uart->gpios = NULL;
>                 }
>
I did not check the value of uart->gpios after this patch, but since
the flow control code isn't executing, I am guessing it's still not
NULL.
>                 serial8250_set_defaults(uart);

adam
