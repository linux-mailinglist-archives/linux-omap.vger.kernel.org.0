Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C17921EB70E
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jun 2020 10:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgFBIIZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 Jun 2020 04:08:25 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40230 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgFBIIY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 2 Jun 2020 04:08:24 -0400
Received: by mail-lj1-f195.google.com with SMTP id n23so703182ljh.7;
        Tue, 02 Jun 2020 01:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=epAHVW2zVd0xxJxByYd83hzmtUg4fG+8BzwLS9Yfh2Y=;
        b=SKNTR6s77q9WL8G4cSn0vyA77STzEF9rmTPSGLPcpPh0rWBKfcXq2E98lZPqRSZyGb
         DPfl4zG4nQ4fFNik48pUXAWPn/MOPsisNcrko7wJpkwB3ybpjmt/5hT+RjGLiXZWMc/c
         R483aPUuiwG8jmFj38uZvm5oG9Z8/+38KP/qsK2oaKRscDAerUSFOtWLd2PdT857BuWB
         cWpSrs0VLJTVNBrKG7+r20Trk4LRyiSTQjX03Zrmp4shYiVYD5vxNO0gNaFboL4yC3S9
         NVg4/MXDyoDE2QJX5H8BxX8Qg8R49aIeWVMzPgvOKjOug57G7HPxZLrcx5JiWDNlx6GF
         bv6w==
X-Gm-Message-State: AOAM532ahYBKLe3Dw6xg6SYrF8gjJg/ponlGXE8Z5GO0O2q+aWEYgTo8
        4gKEug5ZjQzr4xEjbrMp0Ao=
X-Google-Smtp-Source: ABdhPJzs8rg9IjYOrG6EABGkprkL1AVegpE4YCJZ0VEMKyDthgQYMYck7P24EkCtFiV9hjbnwkhvYg==
X-Received: by 2002:a2e:1506:: with SMTP id s6mr12370746ljd.296.1591085300351;
        Tue, 02 Jun 2020 01:08:20 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id w1sm331970ljo.80.2020.06.02.01.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 01:08:19 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jg1xz-0004Qj-WB; Tue, 02 Jun 2020 10:08:12 +0200
Date:   Tue, 2 Jun 2020 10:08:11 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Peter Hurley <peter@hurleysoftware.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] serial: 8250_port: Fix imprecise external abort for
 mctrl if inactive
Message-ID: <20200602080811.GI19480@localhost>
References: <20200602001813.30459-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602001813.30459-1-tony@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 01, 2020 at 05:18:13PM -0700, Tony Lindgren wrote:
> We can get an imprecise external abort on uart_shutdown() at
> serial8250_do_set_mctrl() if the UART is autoidled.
> 
> We don't want to add PM runtime calls to serial8250_do_set_mctrl()
> beyond checking the usage count as it gets called from interrupts
> disabled and spinlock held from uart_update_mctrl().
> 
> We can just bail out early from serial8250_do_set_mctrl() if the UART
> is inactive. We have uart_shutdown() call uart_port_dtr_rts() with
> value of 0 just to disable DTR and RTS.

No, sorry. This is just putting another band-aid on this broken mess (I
never realised it was this bad).

As others have apparently already pointed out in the past, there are
paths that will end up calling sleeping pm_runtime_get_sync() in atomic
context (e.g serial8250_stop_tx()).

In other places this all seems to work mostly by chance by relying on
autosuspend keeping the clocks enabled long enough to not hit broken
paths (e.g. serial8250_do_set_mctrl()) which fail to enable clocks.

Note that uart_port_dtr_rts() is called from other paths, for example on
close and hangup, which would now fail to lower DTR/RTS as expected (it
still appears to work mostly by chance since there's later call in
serial8250_do_shutdown() which updates MCR to clear TIOCM_OUT2).

There's shouldn't be anything fundamental preventing you from adding the
missing resume calls to the mctrl paths even if it may require reworking
(and fixing) the whole RPM implementation (which would be a good thing
of course).

> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/tty/serial/8250/8250_port.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -2001,11 +2001,20 @@ static unsigned int serial8250_get_mctrl(struct uart_port *port)
>  	return serial8250_do_get_mctrl(port);
>  }
>  
> +/*
> + * Called from uart_update_mctrl() with spinlock held, so we don't want
> + * add PM runtime calls here beyond checking the usage count. If the
> + * UART is not active, we can just bail out early.
> + */
>  void serial8250_do_set_mctrl(struct uart_port *port, unsigned int mctrl)
>  {
>  	struct uart_8250_port *up = up_to_u8250p(port);
>  	unsigned char mcr;
>  
> +	if (up->capabilities & UART_CAP_RPM &&
> +	    !pm_runtime_get_if_in_use(up->port.dev))
> +		return;
> +
>  	if (port->rs485.flags & SER_RS485_ENABLED) {
>  		if (serial8250_in_MCR(up) & UART_MCR_RTS)
>  			mctrl |= TIOCM_RTS;
> @@ -2018,6 +2027,9 @@ void serial8250_do_set_mctrl(struct uart_port *port, unsigned int mctrl)
>  	mcr = (mcr & up->mcr_mask) | up->mcr_force | up->mcr;
>  
>  	serial8250_out_MCR(up, mcr);
> +
> +	if (up->capabilities & UART_CAP_RPM)
> +		pm_runtime_put(up->port.dev);
>  }
>  EXPORT_SYMBOL_GPL(serial8250_do_set_mctrl);

Johan
