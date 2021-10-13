Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61A9142C018
	for <lists+linux-omap@lfdr.de>; Wed, 13 Oct 2021 14:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbhJMMfq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Oct 2021 08:35:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:38736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229535AbhJMMfq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 13 Oct 2021 08:35:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 757C860EBB;
        Wed, 13 Oct 2021 12:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634128422;
        bh=NhrEwNR2bAsfs+l2bB9QBI31veQH8B8qQsugjF/0Dpk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V4gb21xzpNf8tA9BpjtOahlLhSyztgK/ALPjiTJyAzpN83BxhCpyQvKib3RfWz7kn
         F2efgMzj/P2L3Hpkd0Z0kMzWl/+PwSmZHsvAHJ/Yi3Sd2aH1xZKZmu0LRkK8LYnAna
         7rZVmO2+Q5CGH/wkF5Fg3WcFc1i+qAKR2STq2GvM=
Date:   Wed, 13 Oct 2021 14:33:40 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] serial: core: Add wakeup() and start_pending_tx()
 for power management
Message-ID: <YWbSJCEkqQ0KzQ5E@kroah.com>
References: <20210930062906.58937-1-tony@atomide.com>
 <20210930062906.58937-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930062906.58937-2-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 30, 2021 at 09:29:03AM +0300, Tony Lindgren wrote:
> If the serial driver implements PM runtime with autosuspend, the port may
> be powered down on TX. To wake up the port, let's add new wakeup() call
> for serial drivers to implement as needed. We can call wakeup() from
> __uart_start() and flow control related functions before attempting to
> write to the serial port registers.
> 
> Let's keep track of the serial port with a new runtime_suspended flag
> that the device driver runtime PM suspend and resume can manage with
> atomic_set(). This is because only the device driver knows what the
> device runtime PM state as in Documentation/power/runtime_pm.rst
> under "9. Autosuspend, or automatically-delayed suspend" for locking.
> 
> To allow the serial port drivers to send out pending tx on runtime PM
> resume, let's add start_pending_tx() as suggested by Johan Hovold
> <johan@kernel.org>.
> 
> Suggested-by: Johan Hovold <johan@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  Documentation/driver-api/serial/driver.rst |  9 ++++
>  drivers/tty/serial/serial_core.c           | 56 +++++++++++++++++++++-
>  include/linux/serial_core.h                |  3 ++
>  3 files changed, 66 insertions(+), 2 deletions(-)
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
> @@ -91,6 +91,23 @@ static inline struct uart_port *uart_port_check(struct uart_state *state)
>  	return state->uart_port;
>  }
>  
> +/*
> + * This routine can be used before register access to wake up a serial
> + * port that has been runtime PM suspended by the serial port driver.
> + * Note that the runtime_suspended flag is managed by the serial port
> + * device driver runtime PM.
> + */
> +static int uart_port_wakeup(struct uart_port *port)
> +{
> +	if (!atomic_read(&port->runtime_suspended))
> +		return 0;

And if the value changes right after you read this?

Why not use a real lock here?  Don't use an atomic if you don't need it.

thanks,

greg k-h
