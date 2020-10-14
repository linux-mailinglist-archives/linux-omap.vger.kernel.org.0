Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D8028E449
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 18:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728751AbgJNQWK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 12:22:10 -0400
Received: from netrider.rowland.org ([192.131.102.5]:41827 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728083AbgJNQWK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 12:22:10 -0400
Received: (qmail 719232 invoked by uid 1000); 14 Oct 2020 12:22:09 -0400
Date:   Wed, 14 Oct 2020 12:22:09 -0400
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
Subject: Re: [patch 10/12] usb: gadget: udc: Remove in_interrupt()/in_irq()
 from comments
Message-ID: <20201014162209.GD712494@rowland.harvard.edu>
References: <20201014145215.518912759@linutronix.de>
 <20201014145728.208701440@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014145728.208701440@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 14, 2020 at 04:52:25PM +0200, Thomas Gleixner wrote:
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

> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -1754,8 +1754,9 @@ static int handle_control_request(struct
>  	return ret_val;
>  }
>  
> -/* drive both sides of the transfers; looks like irq handlers to
> - * both drivers except the callbacks aren't in_irq().
> +/* drive both sides of the transfers; looks like irq handlers to both
> + * drivers except that the callbacks are invoked from soft interrupt
> + * context.
>   */

You might as well fix the formatting of the multiline comment while 
you're changing its content.

Alan Stern
