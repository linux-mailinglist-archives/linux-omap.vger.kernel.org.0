Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10211CD1AF
	for <lists+linux-omap@lfdr.de>; Sun,  6 Oct 2019 13:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbfJFLVQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 6 Oct 2019 07:21:16 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:45511 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbfJFLVP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 6 Oct 2019 07:21:15 -0400
Received: by mail-ua1-f66.google.com with SMTP id j5so3233955uak.12;
        Sun, 06 Oct 2019 04:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Vay00Id+pI6RjlClzNNciuX7zK1DGFy9uT6hpb/ERY=;
        b=ZQPLMB1krNL3hMSsyoFxqA0dQCGVmcIPPrgiSq4vwIBhevwWLF8DcRJ2LEjTpkeuir
         mpL5yr2SDwgJ6HBJZHSTUNs0mVNgVK0PZFIha/bDEF8L4H9z1DkTT5iU9wZ3Ivban7kq
         E5EXXQRsuHLBvqeXt+VHd1dKsjhgfHJgqkSg1lRBejZnA8QxY+VVXo4eg1/EoiW6QwgD
         pV4Sx6dAhLcExvhCogYHfVMAmHFpBacwbnlGNCeWIwWDUtD+LRKfQKmBdhjACdraTB9F
         5q4yoQRzERq9uakXcu9pBaGd1FxGMnZjJsG6lVre4aBwiDXJOtyr4yEO1VjXFVxH5XhQ
         UvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Vay00Id+pI6RjlClzNNciuX7zK1DGFy9uT6hpb/ERY=;
        b=lw8+GbOd07oScjnNdLL/+x5Qmm2AmsaWnwGOII56zxwQ/erI+KFibyDgOHj61k1U0D
         eau1NY7qiSySTmkEzFKNkYNvWyJJ0+hfInMtGFYlATTokL19XU49XJ8apO+61RrM/yRf
         Ydklpa+DKwQzMve5GTZwuv9st7A5w7XB8qXpM4NG2sHOLHgycXjMxjo8czGvjOuZdy7w
         AiWQ6qpMRtn27CSIJVSghuv7Og48QVrgVUHuvaLl4zyYY4uK7drJRlapHLWoyOEXyPS/
         ap6E43Gwth5y3HYErbhW4pWASAAHn0Wv+TY/OiZBEFZKlu8Gvw2sH1JgKGjlj4gAqHf3
         Jn8A==
X-Gm-Message-State: APjAAAWEoXqclJexXxPZEpBlrS/rxIMvZJ0z1j+AivjXEbpSKnZ9QnYx
        Wo3x0ITaq6gSACp+naNslOZIa5FQIsgVDpBzVDc=
X-Google-Smtp-Source: APXvYqxvszuL1sCIBfF24kyxwV0jWdJiswW5zfD1BUFs2vwgh9sZIR2O5nozVM8Rar7WLbeULc0EMmPKTUymKPDJ9Fc=
X-Received: by 2002:ab0:2397:: with SMTP id b23mr5089710uan.91.1570360874474;
 Sun, 06 Oct 2019 04:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191006023254.23841-1-aford173@gmail.com>
In-Reply-To: <20191006023254.23841-1-aford173@gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Sun, 6 Oct 2019 13:21:03 +0200
Message-ID: <CAGm1_ksBaEN0OWR+dTwT9SgoybtnchcCKasjXf5ybP2fZfRF7A@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250_omap: Fix gpio check for auto RTS and CTS
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-serial@vger.kernel.org, adam.ford@logicpd.com,
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

Hi Adam,

On Sun, Oct 6, 2019 at 4:33 AM Adam Ford <aford173@gmail.com> wrote:
>
> There are two checks to see if the manual gpio is configured, but
> these the check is seeing if the structure is NULL instead it
> should check to see if there are CTS and/or RTS pins defined.
>
> This patch uses checks for those individual pins instead of
> checking for the structure itself.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
> index c68e2b3a1634..836e736ae188 100644
> --- a/drivers/tty/serial/8250/8250_omap.c
> +++ b/drivers/tty/serial/8250/8250_omap.c
> @@ -141,7 +141,7 @@ static void omap8250_set_mctrl(struct uart_port *port, unsigned int mctrl)
>
>         serial8250_do_set_mctrl(port, mctrl);
>
> -       if (!up->gpios) {
> +       if (!mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_RTS)) {
>                 /*
>                  * Turn off autoRTS if RTS is lowered and restore autoRTS
>                  * setting if RTS is raised
> @@ -456,7 +456,8 @@ static void omap_8250_set_termios(struct uart_port *port,
>         up->port.status &= ~(UPSTAT_AUTOCTS | UPSTAT_AUTORTS | UPSTAT_AUTOXOFF);
>
>         if (termios->c_cflag & CRTSCTS && up->port.flags & UPF_HARD_FLOW &&
> -           !up->gpios) {
> +           !mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_RTS) &&
> +           !mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_CTS)) {
>                 /* Enable AUTOCTS (autoRTS is enabled when RTS is raised) */
>                 up->port.status |= UPSTAT_AUTOCTS | UPSTAT_AUTORTS;
>                 priv->efr |= UART_EFR_CTS;

Looks good to me but !up->gpios must remain as otherwise, we will get
NULL pointer dereference. What do you think?

Also adding some more people who can be interested in testing this approach.

Cheers,
Yegor
