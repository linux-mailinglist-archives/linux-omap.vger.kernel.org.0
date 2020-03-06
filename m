Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8F2A17C5F9
	for <lists+linux-omap@lfdr.de>; Fri,  6 Mar 2020 20:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbgCFTJ4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Mar 2020 14:09:56 -0500
Received: from muru.com ([72.249.23.125]:59252 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbgCFTJ4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Mar 2020 14:09:56 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0546C8027;
        Fri,  6 Mar 2020 19:10:40 +0000 (UTC)
Date:   Fri, 6 Mar 2020 11:09:52 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>, ruleh <ruleh@gmx.de>
Subject: Re: [PATCHv2 4/3] Input: omap4-keypad - scan the keys in two phases
 to detect lost key-up
Message-ID: <20200306190952.GM37466@atomide.com>
References: <20200228171223.11444-1-tony@atomide.com>
 <20200228180243.GM37466@atomide.com>
 <20200306190433.GG217608@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306190433.GG217608@dtor-ws>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Dmitry Torokhov <dmitry.torokhov@gmail.com> [200306 19:05]:
> On Fri, Feb 28, 2020 at 10:02:43AM -0800, Tony Lindgren wrote:
> > In addition to handling errata i689 for idle with state, we must also
> > check for lost key up interrupts on fast key presses.
> > 
> > For example rapidly pressing shift-shift-j can sometimes produce a J
> > instead of j. Let's fix the issue by scanning the keyboard in two
> > phases. First we scan for any key up events that we may have missed,
> > and then we scan for key down events.
> > 
> > Cc: Arthur Demchenkov <spinal.by@gmail.com>
> > Cc: Merlijn Wajer <merlijn@wizzup.org>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Sebastian Reichel <sre@kernel.org>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >  drivers/input/keyboard/omap4-keypad.c | 48 ++++++++++++++++++---------
> >  1 file changed, 32 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
> > --- a/drivers/input/keyboard/omap4-keypad.c
> > +++ b/drivers/input/keyboard/omap4-keypad.c
> > @@ -109,6 +109,34 @@ static void kbd_write_irqreg(struct omap4_keypad *keypad_data,
> >  		     keypad_data->base + keypad_data->irqreg_offset + offset);
> >  }
> >  
> > +static void omap4_keypad_scan_state(struct omap4_keypad *keypad_data,
> > +				    unsigned char *key_state,
> > +				    bool down)
> > +{
> > +	struct input_dev *input_dev = keypad_data->input;
> > +	unsigned int col, row, code, changed;
> > +	bool key_down;
> > +
> > +	for (row = 0; row < keypad_data->rows; row++) {
> > +		changed = key_state[row] ^ keypad_data->key_state[row];
> > +		if (!changed)
> > +			continue;
> > +
> > +		for (col = 0; col < keypad_data->cols; col++) {
> > +			if (changed & (1 << col)) {
> 
> 
> Looking at all too this, key state is 64 bit value, so if we make it a
> bitmap and use "for_each_set_bit()" we can simplify this scanning code.

OK good idea, I'll take a look.

Regards,

Tony
