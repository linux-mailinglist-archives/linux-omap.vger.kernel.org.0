Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC3A4CD355
	for <lists+linux-omap@lfdr.de>; Sun,  6 Oct 2019 18:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfJFQDj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 6 Oct 2019 12:03:39 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:35931 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbfJFQDj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 6 Oct 2019 12:03:39 -0400
Received: by mail-ua1-f67.google.com with SMTP id r25so3343584uam.3;
        Sun, 06 Oct 2019 09:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uq1yTMjJxVrrmQg6Vw7e0l/Q44DjBU8KLu0PbdRO8wI=;
        b=MYntRpAxJBc9qfwO5jFNB2Rz3OUPm7O02jTeEk/WhoRH2ofkfVXizEKn4SWH/fn+4y
         QBFL8iik/lLkae9rOMc9ucEat3XWFfGM89WHJ50Hgs93MkB6xSP6EzTN5Zy0jl/kZhpi
         Yaoj58676bwka2qsBlHJHkHJkspiUQgZUs33todwhPxwWe+fy3Dyt5VuCJz1kAR4HsEy
         mQtdslK8LtRglyh0VCZz5PMSMLq+HWEY6Jk/p5WfS+pArkIrkPHzfcfASHcihtYu3Flb
         /UaxMrXBP8sE+kDibB3ylikNPOEW9bL2IKAv16vohJ9Qwna/McXhd+KSZeDeQnVHCLWu
         NFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uq1yTMjJxVrrmQg6Vw7e0l/Q44DjBU8KLu0PbdRO8wI=;
        b=PXPev3LIrLmx45SH1WILBRIIQjMPP1iiiSO4pFfV238vQH9CL2MR5fQKrkoh/TjQk3
         FiQ071bAbILbmAaIobmSoPtYqNp8n2Pngna7a/mh4UNKi9bkawJu50bw9n9BUoKdGCgg
         /7EhvtGiB962r8ldTseYRpkEFUqaiSdm4UVZMVex4Uh/fMjpH2fY3VwgV1A6e3dLar/4
         kYodhphvNgbuxS9PGrPGQWfRlHkAv0G/JoDvHkfAtUXVmIHdma3yK74GlA+R+sh5MNrd
         VCRJBrVXGDbMK2jSiES9FPFHEjrEhpGEYxfGHR51zHOfE1zKLmg1L9MAGG+L13zssNzm
         ZU8g==
X-Gm-Message-State: APjAAAUjutuWjv8vgVre9GvxiVXOQWWVPnEqc+RDLBtjqA6DteqCfdCl
        9mngu19SC6xuzyPEHE95T6JE/sPghaCcR04wyJM=
X-Google-Smtp-Source: APXvYqxYxmm18GiZo9LTURV0DeVetqvs2lC+HHaIrXaZmVBQdwcNQc1Zyo2qUwm0TfqQgza30ipGxvnE2PN8mWs1RMk=
X-Received: by 2002:ab0:e10:: with SMTP id g16mr135473uak.42.1570377817752;
 Sun, 06 Oct 2019 09:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191006023254.23841-1-aford173@gmail.com> <CAGm1_ksBaEN0OWR+dTwT9SgoybtnchcCKasjXf5ybP2fZfRF7A@mail.gmail.com>
 <CAHCN7xLgTiXxLrW4njTT8Zaiib6+F4xo07wk0-sQp8h+j=E3yw@mail.gmail.com>
 <CAGm1_kuPbOLYUfGBHp5TEf9wtF5fQOMcEfLTVCp6uSHJo-YKZQ@mail.gmail.com> <CAHCN7xKihTMqK537Kph-xkzdeovsOQQ1VR7t2fxfTgWjZJxFgQ@mail.gmail.com>
In-Reply-To: <CAHCN7xKihTMqK537Kph-xkzdeovsOQQ1VR7t2fxfTgWjZJxFgQ@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Sun, 6 Oct 2019 18:03:27 +0200
Message-ID: <CAGm1_kum6070b_TWrajva8e9rBL1-1QX+k=pTqvZjoS2vKYF9A@mail.gmail.com>
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

On Sun, Oct 6, 2019 at 5:49 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Sun, Oct 6, 2019 at 7:34 AM Yegor Yefremov
> <yegorslists@googlemail.com> wrote:
> >
> > On Sun, Oct 6, 2019 at 1:38 PM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > On Sun, Oct 6, 2019 at 6:21 AM Yegor Yefremov
> > > <yegorslists@googlemail.com> wrote:
> > > >
> > > > Hi Adam,
> > > >
> > > > On Sun, Oct 6, 2019 at 4:33 AM Adam Ford <aford173@gmail.com> wrote:
> > > > >
> > > > > There are two checks to see if the manual gpio is configured, but
> > > > > these the check is seeing if the structure is NULL instead it
> > > > > should check to see if there are CTS and/or RTS pins defined.
> > > > >
> > > > > This patch uses checks for those individual pins instead of
> > > > > checking for the structure itself.
> > > diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
> > index e682390..d5fdb71 100644
> > --- a/drivers/tty/serial/8250/8250_core.c
> > +++ b/drivers/tty/serial/8250/8250_core.c
> > @@ -1031,6 +1031,8 @@ int serial8250_register_8250_port(struct
> > uart_8250_port *up)
> >                         } else {
> >                                 uart->gpios = gpios;
> >                         }
> > +               } else {
> > +                       uart->gpios = NULL;
> >                 }
> >
> >                 serial8250_set_defaults(uart);
> > > >
> > > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > >
> > > > > diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
> > > > > index c68e2b3a1634..836e736ae188 100644
> > > > > --- a/drivers/tty/serial/8250/8250_omap.c
> > > > > +++ b/drivers/tty/serial/8250/8250_omap.c
> > > > > @@ -141,7 +141,7 @@ static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
> > > > >
> > > > >         serial8250_do_set_mctrl(port, mctrl);
> > > > >
> > > > > -       if (!up->gpios) {
> > > > > +       if (!mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_RTS)) {
> > > > >                 /*
> > > > >                  * Turn off autoRTS if RTS is lowered and restore autoRTS
> > > > >                  * setting if RTS is raised
> > > > > @@ -456,7 +456,8 @@ static void omap_8250_set_termios(struct uart_port *port,
> > > > >         up->port.status &= ~(UPSTAT_AUTOCTS | UPSTAT_AUTORTS | UPSTAT_AUTOXOFF);
> > > > >
> > > > >         if (termios->c_cflag & CRTSCTS && up->port.flags & UPF_HARD_FLOW &&
> > > > > -           !up->gpios) {
> > > > > +           !mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_RTS) &&
> > > > > +           !mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_CTS)) {
> > > > >                 /* Enable AUTOCTS (autoRTS is enabled when RTS is raised) */
> > > > >                 up->port.status |= UPSTAT_AUTOCTS | UPSTAT_AUTORTS;
> > > > >                 priv->efr |= UART_EFR_CTS;
> > > >
> > > > Looks good to me but !up->gpios must remain as otherwise, we will get
> > > > NULL pointer dereference. What do you think?
>
> What we if add a check to make sure we deference it?  I was thinking
> something like:
>
> diff --git a/drivers/tty/serial/serial_mctrl_gpio.c
> b/drivers/tty/serial/serial_mctrl_gpio.c
> index d9074303c88e..fb4781292d40 100644
> --- a/drivers/tty/serial/serial_mctrl_gpio.c
> +++ b/drivers/tty/serial/serial_mctrl_gpio.c
> @@ -66,6 +66,9 @@ EXPORT_SYMBOL_GPL(mctrl_gpio_set);
>  struct gpio_desc *mctrl_gpio_to_gpiod(struct mctrl_gpios *gpios,
>                                       enum mctrl_gpio_idx gidx)
>  {
> +       if (gpios == NULL)
> +               return NULL;
> +
>         return gpios->gpio[gidx];
>  }
>  EXPORT_SYMBOL_GPL(mctrl_gpio_to_gpiod);
>
> This should make my previous patch tolerate situations where gpios is
> NULL.  It also explictly looks for conditions where the gpios are
> manually configured for RTS and/or CTS.

I like this idea. This would solve my concern.

Yegor

> > >
> > > I was not seeing up->gpios ever NULL so the contents inside the check
> > > never was executed.  When I removed the check, the performance came
> > > back.  I looked at examples on how other devices checked for RTS and
> > > CTS, and I noticed that the Atmel serial driver did something like the
> > > above.
> > >
> > > >
> > > > Also adding some more people who can be interested in testing this approach.
> > >
> > > I am open for ideas.  If something is better, but something is either
> > > incorrectly setting up->gpios to non-NULL or the check for non-NULL is
> > > wrong.
> >
> > I wonder whether we forgot to add this assignment for the ACPI systems:
> >
>
> I unwound my patch and applied your patch instead, but it is back to
> having corrupt frames again.
>
> > diff --git a/drivers/tty/serial/8250/8250_core.c
> > b/drivers/tty/serial/8250/8250_core.c
> > index e682390..d5fdb71 100644
> > --- a/drivers/tty/serial/8250/8250_core.c
> > +++ b/drivers/tty/serial/8250/8250_core.c
> > @@ -1031,6 +1031,8 @@ int serial8250_register_8250_port(struct
> > uart_8250_port *up)
> >                         } else {
> >                                 uart->gpios = gpios;
> >                         }
> > +               } else {
> > +                       uart->gpios = NULL;
> >                 }
> >
> I did not check the value of uart->gpios after this patch, but since
> the flow control code isn't executing, I am guessing it's still not
> NULL.
> >                 serial8250_set_defaults(uart);
>
> adam
