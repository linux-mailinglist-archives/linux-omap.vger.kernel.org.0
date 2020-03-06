Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5532C17C5E1
	for <lists+linux-omap@lfdr.de>; Fri,  6 Mar 2020 20:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgCFTEn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Mar 2020 14:04:43 -0500
Received: from muru.com ([72.249.23.125]:59234 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbgCFTEm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Mar 2020 14:04:42 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6DCAF8027;
        Fri,  6 Mar 2020 19:05:27 +0000 (UTC)
Date:   Fri, 6 Mar 2020 11:04:38 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 1/2] Input: omap4-keypad - Configure interrupt as level
Message-ID: <20200306190438.GL37466@atomide.com>
References: <20200227020407.17276-1-tony@atomide.com>
 <20200306185805.GF217608@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306185805.GF217608@dtor-ws>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Dmitry Torokhov <dmitry.torokhov@gmail.com> [200306 18:58]:
> Hi Tony,
> 
> On Wed, Feb 26, 2020 at 06:04:06PM -0800, Tony Lindgren wrote:
> > The interrupt should be level high for SoC internal devices.
> > Otherwise interrupts may not be seen after a wake-up event.
> > 
> > Cc: Arthur Demchenkov <spinal.by@gmail.com>
> > Cc: Merlijn Wajer <merlijn@wizzup.org>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Sebastian Reichel <sre@kernel.org>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >  drivers/input/keyboard/omap4-keypad.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
> > --- a/drivers/input/keyboard/omap4-keypad.c
> > +++ b/drivers/input/keyboard/omap4-keypad.c
> > @@ -344,7 +344,8 @@ static int omap4_keypad_probe(struct platform_device *pdev)
> >  	}
> >  
> >  	error = request_threaded_irq(keypad_data->irq, omap4_keypad_irq_handler,
> > -				     omap4_keypad_irq_thread_fn, IRQF_ONESHOT,
> > +				     omap4_keypad_irq_thread_fn,
> > +				     IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> 
> Can't we rely on DT/platform to configure this properly?

Oops yeah you're right, and we already have that set with
IRQ_TYPE_LEVEL_HIGH in dts.

Sorry I was again diffing against the old v3.0.8 vendor kernel
trying to figure out what they were doing for the lost keys
and spotted this change :)

So this patch can be just ignored.

Regards,

Tony
