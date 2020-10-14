Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 969AA28E467
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 18:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388448AbgJNQ1Z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 12:27:25 -0400
Received: from netrider.rowland.org ([192.131.102.5]:41207 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2388362AbgJNQ1W (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 12:27:22 -0400
Received: (qmail 719448 invoked by uid 1000); 14 Oct 2020 12:27:21 -0400
Date:   Wed, 14 Oct 2020 12:27:21 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: Re: [patch 11/12] usb: core: Replace in_interrupt() in comments
Message-ID: <20201014162721.GE712494@rowland.harvard.edu>
References: <20201014145215.518912759@linutronix.de>
 <20201014145728.318078828@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014145728.318078828@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 14, 2020 at 04:52:26PM +0200, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <a.darwish@linutronix.de>
> 
> The usage of in_interrupt() in drivers is phased out for various reasons.
> 
> Various comments use !in_interrupt() to describe calling context for
> functions which might sleep. That's wrong because the calling context has
> to be preemptible task context, which is not what !in_interrupt()
> describes.
> 
> Replace !in_interrupt() with more accurate plain text descriptions.
> 
> The comment for usb_hcd_poll_rh_status() is misleading as this function is
> called from all kinds of contexts including preemptible task
> context. Remove it as there is obviously no restriction.
> 
> Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> 
> ---

> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -746,9 +746,6 @@ static int rh_call_control (struct usb_h
>   * Root Hub interrupt transfers are polled using a timer if the
>   * driver requests it; otherwise the driver is responsible for
>   * calling usb_hcd_poll_rh_status() when an event occurs.
> - *
> - * Completions are called in_interrupt(), but they may or may not
> - * be in_irq().

This comment should not be removed; instead it should be changed to say 
that completion handlers are called with interrupts disabled.

> @@ -1691,7 +1690,6 @@ static void usb_giveback_urb_bh(unsigned
>   * @hcd: host controller returning the URB
>   * @urb: urb being returned to the USB device driver.
>   * @status: completion status code for the URB.
> - * Context: in_interrupt()

The comment should be changed to say that the routine runs in a BH 
handler (or however you want to express it).

> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c

> @@ -934,7 +939,7 @@ int usb_get_device_descriptor(struct usb
>  /*
>   * usb_set_isoch_delay - informs the device of the packet transmit delay
>   * @dev: the device whose delay is to be informed
> - * Context: !in_interrupt()
> + * Context: can sleep

Why is this comment different from all the others?

Alan Stern
