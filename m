Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA7B217C640
	for <lists+linux-omap@lfdr.de>; Fri,  6 Mar 2020 20:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgCFTXr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Mar 2020 14:23:47 -0500
Received: from muru.com ([72.249.23.125]:59268 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbgCFTXr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Mar 2020 14:23:47 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E22DC8027;
        Fri,  6 Mar 2020 19:24:31 +0000 (UTC)
Date:   Fri, 6 Mar 2020 11:23:43 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>, ruleh <ruleh@gmx.de>
Subject: Re: [PATCH 3/3] Input: omap4-keypad - check state again for lost
 key-up interrupts
Message-ID: <20200306192343.GN37466@atomide.com>
References: <20200228171223.11444-1-tony@atomide.com>
 <20200228171223.11444-4-tony@atomide.com>
 <20200306191021.GH217608@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306191021.GH217608@dtor-ws>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Dmitry Torokhov <dmitry.torokhov@gmail.com> [200306 19:11]:
> On Fri, Feb 28, 2020 at 09:12:23AM -0800, Tony Lindgren wrote:
> > We only have partial errata i689 implemented with Commit 6c3516fed7b6
> > ("Input: omap-keypad - fix keyboard debounce configuration"). We are
> > still missing the check for lost key-up interrupts as described in the
> > omap4 silicon errata documentation as Errata ID i689 "1.32 Keyboard Key
> > Up Event Can Be Missed":
> > 
> > "When a key is released for a time shorter than the debounce time,
> >  in-between 2 key press (KP1 and KP2), the keyboard state machine will go
> >  to idle mode and will never detect the key release (after KP1, and also
> >  after KP2), and thus will never generate a new IRQ indicating the key
> >  release."
> > 
> > Let's check the keyboard state with delayed_work after each event. And
> > if the problem state is detect, let's clear all events.
> > 
> > Cc: Arthur Demchenkov <spinal.by@gmail.com>
> > Cc: Merlijn Wajer <merlijn@wizzup.org>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Sebastian Reichel <sre@kernel.org>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >  drivers/input/keyboard/omap4-keypad.c | 56 ++++++++++++++++++++++++---
> >  1 file changed, 50 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
> > --- a/drivers/input/keyboard/omap4-keypad.c
> > +++ b/drivers/input/keyboard/omap4-keypad.c
> > @@ -71,6 +71,8 @@ struct omap4_keypad {
> >  	void __iomem *base;
> >  	bool irq_wake_enabled;
> >  	unsigned int irq;
> > +	struct delayed_work key_work;
> > +	struct mutex lock;		/* for key scan */
> 
> I think having threaded interrupt and delayed work together defeats the
> purpose of having threaded interrupt. If you want to add a delay before
> repeating scan I think you can add it directly in
> omap4_keypad_irq_thread_fn(). Or is there a concern that we will not
> rely quickly enough on additional key presses? It is unclear to me if
> additional key press within the debounce time will result in additional
> interrupt.

Well if we wait in threaded interrupt, we won't see a new interrupt.
So yes, an additional key press will still produce an interrupt.

After a key press has been detected, we need to set a timer that checks
the keyboard controller state after it has idled. Then check for a
potentially stuck state, and clear all down events if the state is
idle with keys down.

I don't think we can really use runtime PM autosuspend delay here as we
already keep the device enabled with clock autogated so there's nothing
to do. If we now added runtime PM calls, we'd end up in mode with
clocks completely disabled. Maybe some tinkering of usage counts in
the interrupt handler would allow using PM runtime though :)

Regards,

Tony

