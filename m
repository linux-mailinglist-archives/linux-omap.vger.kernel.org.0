Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF523292B7A
	for <lists+linux-omap@lfdr.de>; Mon, 19 Oct 2020 18:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730622AbgJSQ2h (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Oct 2020 12:28:37 -0400
Received: from netrider.rowland.org ([192.131.102.5]:50249 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730525AbgJSQ2g (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Oct 2020 12:28:36 -0400
Received: (qmail 902187 invoked by uid 1000); 19 Oct 2020 12:28:35 -0400
Date:   Mon, 19 Oct 2020 12:28:35 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-omap@vger.kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Duncan Sands <duncan.sands@free.fr>
Subject: Re: [patch V2 11/13] usb: gadget: udc: Remove
 in_interrupt()/in_irq() from comments
Message-ID: <20201019162835.GC898631@rowland.harvard.edu>
References: <20201019100629.419020859@linutronix.de>
 <20201019101110.744172050@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019101110.744172050@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Oct 19, 2020 at 12:06:40PM +0200, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <a.darwish@linutronix.de>
> 
> The usage of in_irq()/in_interrupt() in drivers is phased out for various
> reasons.
> 
> The context description for usb_gadget_giveback_request() is misleading as
> in_interupt() means: hard interrupt or soft interrupt or bottom half
> disabled regions. But it's also invoked from task context when endpoints
> are torn down. Remove it as it's more confusing than helpful.
> 
> Replace also the in_irq() comment with plain text.
> 
> Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> 
> ---
>  drivers/usb/gadget/udc/core.c      |    2 --
>  drivers/usb/gadget/udc/dummy_hcd.c |    6 ++++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -894,8 +894,6 @@ EXPORT_SYMBOL_GPL(usb_gadget_unmap_reque
>   * @ep: the endpoint to be used with with the request
>   * @req: the request being given back
>   *
> - * Context: in_interrupt()
> - *
>   * This is called by device controller drivers in order to return the
>   * completed request back to the gadget layer.
>   */
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -1754,8 +1754,10 @@ static int handle_control_request(struct
>  	return ret_val;
>  }
>  
> -/* drive both sides of the transfers; looks like irq handlers to
> - * both drivers except the callbacks aren't in_irq().
> +/*
> + * Drive both sides of the transfers; looks like irq handlers to both
> + * drivers except that the callbacks are invoked from soft interrupt
> + * context.
>   */
>  static void dummy_timer(struct timer_list *t)
>  {

For dummy-hcd.c:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

