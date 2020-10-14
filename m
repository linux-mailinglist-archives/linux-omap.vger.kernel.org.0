Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A49D28E616
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 20:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgJNSNW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 14:13:22 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34563 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728656AbgJNSNV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 14:13:21 -0400
Received: (qmail 724401 invoked by uid 1000); 14 Oct 2020 14:13:20 -0400
Date:   Wed, 14 Oct 2020 14:13:20 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
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
Message-ID: <20201014181320.GA723420@rowland.harvard.edu>
References: <20201014145215.518912759@linutronix.de>
 <20201014145728.318078828@linutronix.de>
 <20201014162721.GE712494@rowland.harvard.edu>
 <20201014164123.hnqqkyrjrjytcxgz@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014164123.hnqqkyrjrjytcxgz@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 14, 2020 at 06:41:23PM +0200, Sebastian Andrzej Siewior wrote:
> On 2020-10-14 12:27:21 [-0400], Alan Stern wrote:
> > > --- a/drivers/usb/core/hcd.c
> > > +++ b/drivers/usb/core/hcd.c
> > > @@ -746,9 +746,6 @@ static int rh_call_control (struct usb_h
> > >   * Root Hub interrupt transfers are polled using a timer if the
> > >   * driver requests it; otherwise the driver is responsible for
> > >   * calling usb_hcd_poll_rh_status() when an event occurs.
> > > - *
> > > - * Completions are called in_interrupt(), but they may or may not
> > > - * be in_irq().
> > 
> > This comment should not be removed; instead it should be changed to say 
> > that completion handlers are called with interrupts disabled.
> 
> The timer callback:
>   rh_timer_func() -> usb_hcd_poll_rh_status()  
> 
> invokes the function with enabled interrupts.

Well, it doesn't change the interrupt settings.  It might call 
usb_hcd_poll_rh_status() with interrupts enabled or disabled, depending 
on how it was called originally.

But that wasn't what I meant.  usb_hcd_poll_rh_status() calls 
usb_hcd_giveback_urb() with interrupts disabled always, and that routine 
may call __usb_hcd_giveback_urb(), which calls

	urb->complete(urb);

In this case the completion handler would be invoked with interrupts 
disabled.  Alternatively, __usb_hcd_giveback_urb() may be invoked from a 
BH handler, in which case the completion handler will run in softirq 
context with interrupts enabled.

So I guess it would be best to say that completion handlers may be 
called with interrupts enabled or disabled.  Or you might want to put 
such a comment in __usb_hcd_giveback_urb().

> > > @@ -1691,7 +1690,6 @@ static void usb_giveback_urb_bh(unsigned
> > >   * @hcd: host controller returning the URB
> > >   * @urb: urb being returned to the USB device driver.
> > >   * @status: completion status code for the URB.
> > > - * Context: in_interrupt()
> > 
> > The comment should be changed to say that the routine runs in a BH 
> > handler (or however you want to express it).
> 
> Do you mean usb_hcd_giveback_urb() runs in BH context or that the
> completion callback of the URB runs in BH context?

Actually I meant that usb_hcd_giveback_urb_bh() runs in BH context.  
Sorry, I got confused about the location of this hunk.

To be explicit: The comment for usb_hcd_giveback_urb() should say that 
the function expects to be called with interrupts disabled (whether the 
context is task, atomic, BH, interrupt, etc. doesn't matter).

> The completion callback of the URB may run in BH or IRQ context
> depending on HCD.
> 
> > > --- a/drivers/usb/core/message.c
> > > +++ b/drivers/usb/core/message.c
> > 
> > > @@ -934,7 +939,7 @@ int usb_get_device_descriptor(struct usb
> > >  /*
> > >   * usb_set_isoch_delay - informs the device of the packet transmit delay
> > >   * @dev: the device whose delay is to be informed
> > > - * Context: !in_interrupt()
> > > + * Context: can sleep
> > 
> > Why is this comment different from all the others?
> 
> It says !in_interrupt() which is also true for preempt-disabled regions.
> But the caller must not have preemption disabled. "can sleep" is more
> obvious as what it needs.

But all the other comments in this patch say:

 * Context: task context, might sleep.

Why doesn't this comment say the same thing?

Alan Stern
