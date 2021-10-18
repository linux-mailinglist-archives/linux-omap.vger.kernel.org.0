Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1958143112A
	for <lists+linux-omap@lfdr.de>; Mon, 18 Oct 2021 09:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbhJRHLk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Oct 2021 03:11:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:55868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231168AbhJRHL2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 18 Oct 2021 03:11:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCE8960F46;
        Mon, 18 Oct 2021 07:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634540954;
        bh=/FwxTPVyYlS0JwFehN3Om6/BlQClmq2iSl8vuzoG3og=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GMO4/9kiyDNgh66xZRfk464MLHi/zlU/2AupDsSc1WFzvAqvNJ+QOXBk8C87o8JzE
         9AJP/eZNf4mJtfIyWkadvwExFJ6T52b++w7MmsTouAYhKyU0C5KwlXn9a/vmtGdtQZ
         fvcnmoMR6UOBJkdPOX1zV1cJL7hyIPcwyF/W7I5gYKE7a07OWgqnrmvPRb/p4/RQiE
         u/spgHzeaPDDCUgNevX0XhypN/YZ6uxJcQ0sogNY2bFglk+bQ8RfoaxMLuQ7ZB41ro
         tZ5xdkK6mDbRE57K8SAVMoF00WGe/8z1dzVbewBFgBtHWqBvZQxRht9oFO7RsHHwTf
         9tIv2ZvaFS2aQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mcMlc-00009s-J0; Mon, 18 Oct 2021 09:09:05 +0200
Date:   Mon, 18 Oct 2021 09:09:04 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] serial: core: Add wakeup() and start_pending_tx()
 for power management
Message-ID: <YW0dkD3jYCsHYs6p@hovoldconsulting.com>
References: <20211015112626.35359-1-tony@atomide.com>
 <20211015112626.35359-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015112626.35359-2-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Oct 15, 2021 at 02:26:23PM +0300, Tony Lindgren wrote:
> If the serial driver implements PM runtime with autosuspend, the port may
> be powered down on TX. To wake up the port, let's add new wakeup() call
> for serial drivers to implement as needed. We can call wakeup() from
> __uart_start() and flow control related functions before attempting to
> write to the serial port registers.
> 
> Let's keep track of the serial port with a new runtime_suspended flag
> that the device driver runtime PM suspend and resume can manage with
> port->lock held. This is because only the device driver knows what the
> device runtime PM state as in Documentation/power/runtime_pm.rst
> under "9. Autosuspend, or automatically-delayed suspend" for locking.
> 
> To allow the serial port drivers to send out pending tx on runtime PM
> resume, let's add start_pending_tx() as suggested by Johan Hovold
> <johan@kernel.org>.
> 
> Suggested-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

So this looks somewhat like a step in the right direction, but...

> ---
>  Documentation/driver-api/serial/driver.rst |  9 +++
>  drivers/tty/serial/serial_core.c           | 68 +++++++++++++++++++++-
>  include/linux/serial_core.h                |  3 +
>  3 files changed, 78 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/serial/driver.rst b/Documentation/driver-api/serial/driver.rst
> --- a/Documentation/driver-api/serial/driver.rst
> +++ b/Documentation/driver-api/serial/driver.rst
> @@ -234,6 +234,15 @@ hardware.
>  
>  	Interrupts: caller dependent.
>  
> +  wakeup(port)
> +	Wake up port if it has been runtime PM suspended.
> +
> +	Locking: port->lock taken.
> +
> +	Interrupts: locally disabled.
> +
> +	This call must not sleep
> +
>    flush_buffer(port)
>  	Flush any write buffers, reset any DMA state and stop any
>  	ongoing DMA transfers.
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -91,6 +91,35 @@ static inline struct uart_port *uart_port_check(struct uart_state *state)
>  	return state->uart_port;
>  }
>  
> +/*
> + * This routine can be used before register access to wake up a serial
> + * port that has been runtime PM suspended by the serial port driver.
> + * Note that the runtime_suspended flag is managed by the serial port
> + * device driver runtime PM.
> + */
> +static int __uart_port_wakeup(struct uart_port *port)
> +{
> +	if (!port->runtime_suspended)
> +		return 0;
> +
> +	if (port->ops->wakeup)
> +		return port->ops->wakeup(port);
> +
> +	return 0;
> +}
> +
> +static int uart_port_wakeup(struct uart_port *port)
> +{
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&port->lock, flags);
> +	ret = __uart_port_wakeup(port);
> +	spin_unlock_irqrestore(&port->lock, flags);
> +
> +	return ret;
> +}
> +
>  /*
>   * This routine is used by the interrupt handler to schedule processing in
>   * the software interrupt portion of the driver.
> @@ -123,8 +152,13 @@ static void __uart_start(struct tty_struct *tty)
>  	struct uart_state *state = tty->driver_data;
>  	struct uart_port *port = state->uart_port;
>  
> -	if (port && !uart_tx_stopped(port))
> -		port->ops->start_tx(port);
> +	if (!port || uart_tx_stopped(port))
> +		return;
> +
> +	if (__uart_port_wakeup(port) < 0)
> +		return;
> +
> +	port->ops->start_tx(port);
>  }
>  
>  static void uart_start(struct tty_struct *tty)
> @@ -138,6 +172,21 @@ static void uart_start(struct tty_struct *tty)
>  	uart_port_unlock(port, flags);
>  }
>  
> +/*
> + * This routine can be called from the serial driver runtime PM resume function
> + * to transmit buffered data if the serial port was not active on uart_write().
> + */
> +void uart_start_pending_tx(struct uart_port *port)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&port->lock, flags);
> +	if (!uart_tx_stopped(port) && uart_circ_chars_pending(&port->state->xmit))
> +		port->ops->start_tx(port);
> +	spin_unlock_irqrestore(&port->lock, flags);
> +}
> +EXPORT_SYMBOL(uart_start_pending_tx);
> +
>  static void
>  uart_update_mctrl(struct uart_port *port, unsigned int set, unsigned int clear)
>  {
> @@ -1067,6 +1116,11 @@ uart_tiocmset(struct tty_struct *tty, unsigned int set, unsigned int clear)
>  	if (!uport)
>  		goto out;
>  
> +	if (uart_port_wakeup(uport) < 0) {
> +		ret = -EAGAIN;
> +		goto out;
> +	}

...this isn't right. You should just resume the device synchronously
here and not return some random error to user space, which it is
unlikely to even handle.

Now this may require moving more of the runtime PM into serial core,
where it should have been added in the first place, due to a lot of the
serial callbacks being called with the port spin lock held.

The current implementation is just broken. Take uart_dtr_rts(), for
example, nothing makes sure that the device is active before accessing
the modem control registers there. You're currently just relying on
luck and pm_runtime_irq_safe() (which you are now trying to remove).

> +
>  	if (!tty_io_error(tty)) {
>  		uart_update_mctrl(uport, set, clear);
>  		ret = 0;
> @@ -1402,6 +1456,11 @@ uart_ioctl(struct tty_struct *tty, unsigned int cmd, unsigned long arg)
>  		goto out_up;
>  	}
>  
> +	if (uart_port_wakeup(uport) < 0) {
> +		ret = -EAGAIN;
> +		goto out_up;
> +	}
> +
>  	/*
>  	 * All these rely on hardware being present and need to be
>  	 * protected against the tty being hung up.
> @@ -1724,7 +1783,12 @@ static void uart_dtr_rts(struct tty_port *port, int raise)
>  	uport = uart_port_ref(state);
>  	if (!uport)
>  		return;
> +
> +	if (uart_port_wakeup(uport) < 0)
> +		goto out;
> +
>  	uart_port_dtr_rts(uport, raise);
> +out:
>  	uart_port_deref(uport);
>  }

Heh, here you do try to do something about dtr_rts(), but you can't just
ignore the request and wish for the best in case the device is
suspended. :) There needs to be a synchronous resume here too.

Johan
