Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B3728E4A8
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 18:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728252AbgJNQl2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 12:41:28 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:59870 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbgJNQl1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 12:41:27 -0400
Date:   Wed, 14 Oct 2020 18:41:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602693685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hyOdU3wkovhIW1Kvz7qShxqCzj4/rDIPSfPdvt/3zl0=;
        b=M1hAxuBsmEcPlS77v4M65R2eCSjsNXt7dkKalkKXFb+wIHDVTZPPFv/xTnHDRa0YWxn08v
        fqxqIcgsLy7SdcGRubYoMsFPS/weOcjOsXV8WG1wKRYZR/zCyck4CqqThYSrtduogR0wzA
        V9e0//aePEcPgxs4l+MB7WkHGqgYx+CnJ8x0RPxhcWTZ0y06mN0MFGpAgvCob+2l4eNJ2F
        2BYD2Gny+C9uzVb7KvlDI3qMug3+i72sIh1RjQS1WJ5vdVC1mk4BgelGzJKSzVFV6qqQkj
        yxMsrSO2Bn0478hIKMagaS9BDD6au+mMRERRXBqf3GFripjBYNH+yJyAcOvVyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602693685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hyOdU3wkovhIW1Kvz7qShxqCzj4/rDIPSfPdvt/3zl0=;
        b=DzzVOkrDLRxbubq8Q8KdxzZYR5qyTcRtmdjLLvf7N8IDEB/soAO/Wp9y8OJszxrHuEWt2W
        XqvtEEksDFZdFtBQ==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>
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
Message-ID: <20201014164123.hnqqkyrjrjytcxgz@linutronix.de>
References: <20201014145215.518912759@linutronix.de>
 <20201014145728.318078828@linutronix.de>
 <20201014162721.GE712494@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201014162721.GE712494@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2020-10-14 12:27:21 [-0400], Alan Stern wrote:
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
> > @@ -746,9 +746,6 @@ static int rh_call_control (struct usb_h
> >   * Root Hub interrupt transfers are polled using a timer if the
> >   * driver requests it; otherwise the driver is responsible for
> >   * calling usb_hcd_poll_rh_status() when an event occurs.
> > - *
> > - * Completions are called in_interrupt(), but they may or may not
> > - * be in_irq().
> 
> This comment should not be removed; instead it should be changed to say 
> that completion handlers are called with interrupts disabled.

The timer callback:
  rh_timer_func() -> usb_hcd_poll_rh_status()  

invokes the function with enabled interrupts.

> > @@ -1691,7 +1690,6 @@ static void usb_giveback_urb_bh(unsigned
> >   * @hcd: host controller returning the URB
> >   * @urb: urb being returned to the USB device driver.
> >   * @status: completion status code for the URB.
> > - * Context: in_interrupt()
> 
> The comment should be changed to say that the routine runs in a BH 
> handler (or however you want to express it).

Do you mean usb_hcd_giveback_urb() runs in BH context or that the
completion callback of the URB runs in BH context?
The completion callback of the URB may run in BH or IRQ context
depending on HCD.

> > --- a/drivers/usb/core/message.c
> > +++ b/drivers/usb/core/message.c
> 
> > @@ -934,7 +939,7 @@ int usb_get_device_descriptor(struct usb
> >  /*
> >   * usb_set_isoch_delay - informs the device of the packet transmit delay
> >   * @dev: the device whose delay is to be informed
> > - * Context: !in_interrupt()
> > + * Context: can sleep
> 
> Why is this comment different from all the others?

It says !in_interrupt() which is also true for preempt-disabled regions.
But the caller must not have preemption disabled. "can sleep" is more
obvious as what it needs.

> Alan Stern

Sebastian
