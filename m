Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9835DCD1EC
	for <lists+linux-omap@lfdr.de>; Sun,  6 Oct 2019 14:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfJFMe7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 6 Oct 2019 08:34:59 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42147 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbfJFMe6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 6 Oct 2019 08:34:58 -0400
Received: by mail-vs1-f68.google.com with SMTP id m22so7106769vsl.9;
        Sun, 06 Oct 2019 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xk0fDOteLxzScZXH/iFSGSLC2RoP4iw8G+Vw+UUIrBY=;
        b=dP0gvGRRedRIc2u8VMmj2XI5gpeKawbKnM/SsPaPlZsSlJ2IrpzmNWgXDH3Kuu9UoP
         n5SZEGdkEgGLoKJPgAc+D87q3FOrUe/UUPGntSpr7rASFMjB7pl1sS63PABzJJ+z5jqz
         xfUYYD6Fx0XEBRkc2YxMjaY6jTH1M0zc4o+vhyVxW04xn6ER7XlTt/9oLv4nwqIQ01W5
         fXCJzKxrWCFtd6+b5LsoBNbU3yVe3LNsj1nZYQ4shLFN/rOVxcPSsmM4VkqSUnBR38VM
         sHZUAB+XEr74IMb0JLaZfMmKDhLBoSNjy9R9SoMBv3k6HobNnu1jeCIC6rICVuHN9Kd0
         9e/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xk0fDOteLxzScZXH/iFSGSLC2RoP4iw8G+Vw+UUIrBY=;
        b=fwQ1GufYJIN90kYFac6RPfxcMazOadWo1Jjz4kbulbH38shhygoNqtsCsxlRXtbX70
         IgauC5ZKqc9UiB/Oj2IuXcVkxXov4K7X+HlwYg2JoeZa8UH34mpIgj2ILN96qBNkF1ba
         vBk+H5q8k2LZsXVnSMs1Upp/WYFGpM/dxZIQACQJXgJdHDj/Kd4zC5JnaIziqh6GdxsW
         /6F8dCoYuFifhYBSfj9tBaHAYbgM8afoF4tbxEsQwVx41HUkn/s5HEH0ekq7ZhhXSlvp
         Uo52U41OUAidSK0nHFY+WyK/7ZeBwRuLw70A3BRRI/gbIffpRxtY+cYh9v1+8I8K2jMI
         Zu0Q==
X-Gm-Message-State: APjAAAWjXwKkwQ8Kb2zTJnQBBxEnNWtSd0PiDSL1l5O6SwYvV9KHAfeP
        VQ6I9FacUsf0Yu0+SFCal7u5yNfrmRCaoklY6eo=
X-Google-Smtp-Source: APXvYqxwljZy8fXCKMcl7/d58T+pY21rSfOUx99FETxOFa64By0hOgfwEuRYU1HoFAVGjB6cciWz0TK5ouvLSCC3p6g=
X-Received: by 2002:a67:dc95:: with SMTP id g21mr12866406vsk.164.1570365296635;
 Sun, 06 Oct 2019 05:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191006023254.23841-1-aford173@gmail.com> <CAGm1_ksBaEN0OWR+dTwT9SgoybtnchcCKasjXf5ybP2fZfRF7A@mail.gmail.com>
 <CAHCN7xLgTiXxLrW4njTT8Zaiib6+F4xo07wk0-sQp8h+j=E3yw@mail.gmail.com>
In-Reply-To: <CAHCN7xLgTiXxLrW4njTT8Zaiib6+F4xo07wk0-sQp8h+j=E3yw@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Sun, 6 Oct 2019 14:34:45 +0200
Message-ID: <CAGm1_kuPbOLYUfGBHp5TEf9wtF5fQOMcEfLTVCp6uSHJo-YKZQ@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250_omap: Fix gpio check for auto RTS and CTS
To:     Adam Ford <aford173@gmail.com>
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

On Sun, Oct 6, 2019 at 1:38 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Sun, Oct 6, 2019 at 6:21 AM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> >
> > Hi Adam,
> >
> > On Sun, Oct 6, 2019 at 4:33 AM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > There are two checks to see if the manual gpio is configured, but
> > > these the check is seeing if the structure is NULL instead it
> > > should check to see if there are CTS and/or RTS pins defined.
> > >
> > > This patch uses checks for those individual pins instead of
> > > checking for the structure itself.
> diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index e682390..d5fdb71 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -1031,6 +1031,8 @@ int serial8250_register_8250_port(struct
uart_8250_port *up)
                        } else {
                                uart->gpios = gpios;
                        }
+               } else {
+                       uart->gpios = NULL;
                }

                serial8250_set_defaults(uart);
> >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > >
> > > diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
> > > index c68e2b3a1634..836e736ae188 100644
> > > --- a/drivers/tty/serial/8250/8250_omap.c
> > > +++ b/drivers/tty/serial/8250/8250_omap.c
> > > @@ -141,7 +141,7 @@ static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
> > >
> > >         serial8250_do_set_mctrl(port, mctrl);
> > >
> > > -       if (!up->gpios) {
> > > +       if (!mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_RTS)) {
> > >                 /*
> > >                  * Turn off autoRTS if RTS is lowered and restore autoRTS
> > >                  * setting if RTS is raised
> > > @@ -456,7 +456,8 @@ static void omap_8250_set_termios(struct uart_port *port,
> > >         up->port.status &= ~(UPSTAT_AUTOCTS | UPSTAT_AUTORTS | UPSTAT_AUTOXOFF);
> > >
> > >         if (termios->c_cflag & CRTSCTS && up->port.flags & UPF_HARD_FLOW &&
> > > -           !up->gpios) {
> > > +           !mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_RTS) &&
> > > +           !mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_CTS)) {
> > >                 /* Enable AUTOCTS (autoRTS is enabled when RTS is raised) */
> > >                 up->port.status |= UPSTAT_AUTOCTS | UPSTAT_AUTORTS;
> > >                 priv->efr |= UART_EFR_CTS;
> >
> > Looks good to me but !up->gpios must remain as otherwise, we will get
> > NULL pointer dereference. What do you think?
>
> I was not seeing up->gpios ever NULL so the contents inside the check
> never was executed.  When I removed the check, the performance came
> back.  I looked at examples on how other devices checked for RTS and
> CTS, and I noticed that the Atmel serial driver did something like the
> above.
>
> >
> > Also adding some more people who can be interested in testing this approach.
>
> I am open for ideas.  If something is better, but something is either
> incorrectly setting up->gpios to non-NULL or the check for non-NULL is
> wrong.

I wonder whether we forgot to add this assignment for the ACPI systems:

diff --git a/drivers/tty/serial/8250/8250_core.c
b/drivers/tty/serial/8250/8250_core.c
index e682390..d5fdb71 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -1031,6 +1031,8 @@ int serial8250_register_8250_port(struct
uart_8250_port *up)
                        } else {
                                uart->gpios = gpios;
                        }
+               } else {
+                       uart->gpios = NULL;
                }

                serial8250_set_defaults(uart);
