Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F177D415ECF
	for <lists+linux-omap@lfdr.de>; Thu, 23 Sep 2021 14:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241012AbhIWMva (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Sep 2021 08:51:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:54702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241000AbhIWMv3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Sep 2021 08:51:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3635C60FE6;
        Thu, 23 Sep 2021 12:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632401398;
        bh=UMepoSpw7A+fESNgPq1gBYNpjtYbMA1QMXXCmUStQ3U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bKNWDjKpLU2Z+6/d4fxh7ogVZ1YAp7XG1nxQSQRqnw0VKsA4lEkI9FFIQO7UoBL5I
         a8Vo7cXHmO1XFBZXXhm3HbUGwu4DFj5QDsdt6xURSbmHkEBklLTo0iljMuMh/ymQeR
         v9uBBcudr05ppvzu3cJmUS6IZaQL2OC3RorhnGCrDjx2SCwPB9FL9O4gKfyQt0KEZ4
         /Q8KRXQdP5pUpM8BX1IAB4O0AznADbVTmVdB8YAxo6f9onQZY2GvqsoAOsbnIC23y2
         AO/YpreQjncm+0uU3TcfrdiwL8wTAlSquD4gHIJ6a1W2rsW9xZHSLiy/qXLBC/38jC
         qkCBkVwii28eQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mTOAp-0001cS-Q2; Thu, 23 Sep 2021 14:49:59 +0200
Date:   Thu, 23 Sep 2021 14:49:59 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] serial: 8250: Implement prep_tx for power management
Message-ID: <YUx399WBrMiZDhno@hovoldconsulting.com>
References: <20210921103346.64824-1-tony@atomide.com>
 <20210921103346.64824-5-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921103346.64824-5-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 21, 2021 at 01:33:44PM +0300, Tony Lindgren wrote:
> We can use the prep_tx() call to wake up an idle serial port. This allows
> ust to remove the depedency to pm_runtime_irq_safe() for 8250_omap driver
> in the following patches.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/tty/serial/8250/8250_port.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -1650,6 +1650,29 @@ static enum hrtimer_restart serial8250_em485_handle_start_tx(struct hrtimer *t)
>  	return HRTIMER_NORESTART;
>  }
>  
> +static int serial8250_prep_tx(struct uart_port *port)
> +{
> +	struct uart_8250_port *up = up_to_u8250p(port);
> +	struct device *dev = up->port.dev;
> +	int err;
> +
> +	if (!(up->capabilities & UART_CAP_RPM))
> +		return 0;
> +
> +	if (!pm_runtime_suspended(dev)) {
> +		pm_runtime_mark_last_busy(dev);
> +		return 0;
> +	}
> +
> +	err = pm_request_resume(dev);
> +	if (err < 0) {
> +		dev_warn(dev, "prep_tx wakeup failed: %d\n", err);
> +		return err;
> +	}

How is this supposed to work without a runtime PM usage-counter
increment? What's to prevent the port from suspending again while it's
transmitting?

> +
> +	return -EINPROGRESS;
> +}

Johan
