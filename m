Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10DF8CD1BF
	for <lists+linux-omap@lfdr.de>; Sun,  6 Oct 2019 13:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfJFLir (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 6 Oct 2019 07:38:47 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39636 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbfJFLir (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 6 Oct 2019 07:38:47 -0400
Received: by mail-io1-f65.google.com with SMTP id a1so22761726ioc.6;
        Sun, 06 Oct 2019 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lsGCK0tfkWyBVnAmhHyGqXbADPgrX9zD6zssESfKWXs=;
        b=jCLxt7aV5SenLPOG1NEdZo456A18orfcBQQqTdYQKgyM4n/QphrmUh0NUNpje7eaaH
         QMZXk81BDjmNBvhv3G6jRlm3qhvt9RSgQy2qwH3fXl0AXkVYyjcwz1Gsugd4nJyxA1/O
         OE/rMPZ9m27dBoEkpykCPutopT3abN8rTSXWSqTCod21CilvXRxlAYyclrNkt+5zucaR
         CN6Af65V/jQChvG4Z2KddXtlBRx2GOcTiorOUHTs1sptmO5/HAv2wk3SQ2RKLNijkGSd
         zJoYJaGEnAXlkYJ8baOA3qRbDmQ/6BwDrgahZdb2qcAzlf243trLTveEpP9rYpHb1j1E
         PMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lsGCK0tfkWyBVnAmhHyGqXbADPgrX9zD6zssESfKWXs=;
        b=KffeEe2hXV8OrUtAevF+EsllyTF+tLW1fDJ1iYvWrwZoywugEhduCsHfj2ntMLQsOu
         /rRMhqVf9PMKcu7sFN2d23i2d5m5TsJ4BQplGzAWraK6Vute0ZpGikkg98Hv7i11INI7
         C4KcAqLqLP9f0iUN/fvujEZ9JVAIS5a1voDO0+7vyNpYpDfgOGZcTTuEkNV9D9qSxzjP
         K1KxKFNsvgFm9DaNdGxYKtrn6554n41NS2amyib2R6UMPbqYL4ur8ekz5ND2BpYGtKjj
         AuroIp+F3Cldw02AfEYE84QxMPxE+vawKCxqlpI82B04mWIorexDUjfOzAYygKyCVjwP
         Gsbg==
X-Gm-Message-State: APjAAAWZcbm6mtS7Ipn+cxMCzi7xNGGsWLosozneqJ2jWhgXLdAg6kDw
        2n0NbItRSWxW7cSYbD7NQvEnawklSf99Lwrxt9s=
X-Google-Smtp-Source: APXvYqz4vM4ytEryjcAOPCtj/nM1U+6o/K0OLFhHZYmfmw3AwBlYPeddf6XmqNa03EiDnxQ/MkskE6+WN1+dwHyJWLY=
X-Received: by 2002:a02:7810:: with SMTP id p16mr22806942jac.55.1570361926034;
 Sun, 06 Oct 2019 04:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191006023254.23841-1-aford173@gmail.com> <CAGm1_ksBaEN0OWR+dTwT9SgoybtnchcCKasjXf5ybP2fZfRF7A@mail.gmail.com>
In-Reply-To: <CAGm1_ksBaEN0OWR+dTwT9SgoybtnchcCKasjXf5ybP2fZfRF7A@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 6 Oct 2019 06:38:34 -0500
Message-ID: <CAHCN7xLgTiXxLrW4njTT8Zaiib6+F4xo07wk0-sQp8h+j=E3yw@mail.gmail.com>
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

On Sun, Oct 6, 2019 at 6:21 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> Hi Adam,
>
> On Sun, Oct 6, 2019 at 4:33 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > There are two checks to see if the manual gpio is configured, but
> > these the check is seeing if the structure is NULL instead it
> > should check to see if there are CTS and/or RTS pins defined.
> >
> > This patch uses checks for those individual pins instead of
> > checking for the structure itself.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
> > index c68e2b3a1634..836e736ae188 100644
> > --- a/drivers/tty/serial/8250/8250_omap.c
> > +++ b/drivers/tty/serial/8250/8250_omap.c
> > @@ -141,7 +141,7 @@ static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
> >
> >         serial8250_do_set_mctrl(port, mctrl);
> >
> > -       if (!up->gpios) {
> > +       if (!mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_RTS)) {
> >                 /*
> >                  * Turn off autoRTS if RTS is lowered and restore autoRTS
> >                  * setting if RTS is raised
> > @@ -456,7 +456,8 @@ static void omap_8250_set_termios(struct uart_port *port,
> >         up->port.status &= ~(UPSTAT_AUTOCTS | UPSTAT_AUTORTS | UPSTAT_AUTOXOFF);
> >
> >         if (termios->c_cflag & CRTSCTS && up->port.flags & UPF_HARD_FLOW &&
> > -           !up->gpios) {
> > +           !mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_RTS) &&
> > +           !mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_CTS)) {
> >                 /* Enable AUTOCTS (autoRTS is enabled when RTS is raised) */
> >                 up->port.status |= UPSTAT_AUTOCTS | UPSTAT_AUTORTS;
> >                 priv->efr |= UART_EFR_CTS;
>
> Looks good to me but !up->gpios must remain as otherwise, we will get
> NULL pointer dereference. What do you think?

I was not seeing up->gpios ever NULL so the contents inside the check
never was executed.  When I removed the check, the performance came
back.  I looked at examples on how other devices checked for RTS and
CTS, and I noticed that the Atmel serial driver did something like the
above.

>
> Also adding some more people who can be interested in testing this approach.

I am open for ideas.  If something is better, but something is either
incorrectly setting up->gpios to non-NULL or the check for non-NULL is
wrong.

adam
>
> Cheers,
> Yegor
