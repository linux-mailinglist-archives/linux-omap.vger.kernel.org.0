Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 668D92A1502
	for <lists+linux-omap@lfdr.de>; Sat, 31 Oct 2020 10:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgJaJ4D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 31 Oct 2020 05:56:03 -0400
Received: from sender11-of-o52.zoho.eu ([31.186.226.238]:21395 "EHLO
        sender11-of-o52.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbgJaJ4D (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 31 Oct 2020 05:56:03 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1604138156; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=BYqKcdMUbxO15V02ggVw0/07YY2gheJftdSCqVk7ReQ5M8AyzRAMjWOKWjRbof+yBrodUvU8Y2MbRg4XyBg3bOXkXRd6zO1PbX9kXvg0n3wvhQ4H48RSC1sq24T9Y7SMUtuLBLKHpdiFY339iP7Y+4YJ59t/DHX5NN1oXJdBqO4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1604138156; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=9i9fPKm7KsJySK2nODVFKYsErwmk20SjQdTnb7ygBHI=; 
        b=F29n+yaayvDipvd1cCxBPsUJ8SSmvETOsCj5zrRjMKlSQCqRiEsk0dz+m1CgyMSC5YDeUF6Ct0/fXMR508HYyXcsOpLy4XUZ2alGWyW3HFSqaMINpm3GCQt3lZshWxwVveEm8hdcIsUoJ2ugvqJ75Wp12l1hwa2t0o1d7ktqYYc=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz> header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-95-222-213-99.hsi15.unitymediagroup.de [95.222.213.99]) by mx.zoho.eu
        with SMTPS id 1604138153023819.792851304213; Sat, 31 Oct 2020 10:55:53 +0100 (CET)
Date:   Sat, 31 Oct 2020 10:55:50 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>, tony@atomide.com
Cc:     linux-omap@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v3] ARM: dts: motorola-mapphone-common: Add dts
 configureation for the android buttons beneath the screen
Message-Id: <20201031105550.87998c17f45eea0350fc52e1@uvos.xyz>
In-Reply-To: <20201031103722.6efbf69b084ed35d2f700fe9@uvos.xyz>
References: <20201030100550.010bfe4f3cdc2f4e5a599c8b@uvos.xyz>
        <20201031071539.GM5639@atomide.com>
        <20201031103722.6efbf69b084ed35d2f700fe9@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Care to summarize here too what's currently blocking touchscreen buttons
> driver only providing the keyboard events as a separate inputdevice
> without having to mirror all the touchscreen events?

Of course. The touchscreen buttons driver has two primary tasks: it
needs to provide the input device with the keyevents of the buttons and
it needs to somehow prevent these surfaces generating regular touch
events. Currently the driver provides these on 2 different input
devices, one with just the key events and one with all the touch events
mirrored execpt those that the driver wants to filter away. 

It would seam best to avoid implementing the second input device by
using a filter in the input layer on the original touchscreen to filter
away the unwanted events. The interface is however not conducive to
this as it requires the filter immidatly decide to filter an event or
not. This however is impossible as a touch on a button is the
combination of many simultainus events and the touchscreen buttons
driver cant possibly know wather to filter an event or not until the
SYN report arrives. This could be worked around by filtering away all
events and then retransmitting the ones we dont want to filter later
using input_inject_event. The problem with this approch however is that
we cant do this from the interrupt context, and doing this later via a
workeque or similar mechanisum crates a very dificult to solve problem
where we must somehow disable the filter until our events are passed to
userpsace (to avoid retansmitting our own injected events in an endless
loop) whilst not loosing any events that might come in at any time via
an intterupt.

The above problem is likely solvable, somehow, but solveing it would
incure another problem: Registering an input filter counts as having
the device open, therby the underlying touchscreen device can not
sleep, this is unacceptable on the devices where this driver is
intended to be used, as they have power budgets in the tens of mW.
Right now this problem is solved by the fact that we can get events
from the input layer on the mirrored touchscreen devce when userspace
closes and opens this device. We can then unregister or register the
input event handler on the underlying touchscreen device accordingly.
If we directly filter the underlying touchscreen device via the method
outlined above, we loose this information as we can not get open() or
close() events on the underlying device, therby we are forced to have
the filter registerd at all times and power managment stopps working.

-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>Hi,

> Care to summarize here too what's currently blocking touchscreen buttons
> driver only providing the keyboard events as a separate inputdevice
> without having to mirror all the touchscreen events?

Of course. The touchscreen buttons driver has two primary tasks: it
needs to provide the input device with the keyevents of the buttons and
it needs to somehow prevent these surfaces generating regular touch
events. Currently the driver provides these on 2 different input
devices, one with just the key events and one with all the touch events
mirrored execpt those that the driver wants to filter away. 

It would seam best to avoid implementing the second input device by
using a filter in the input layer on the original touchscreen to filter
away the unwanted events. The interface is however not conducive to
this as it requires the filter immidatly decide to filter an event or
not. This however is impossible as a touch on a button is the
combination of many simultainus events and the touchscreen buttons
driver cant possibly know wather to filter an event or not until the
SYN report arrives. This could be worked around by filtering away all
events and then retransmitting the ones we dont want to filter later
using input_inject_event. The problem with this approch however is that
we cant do this from the interrupt context, and doing this later via a
workeque or similar mechanisum crates a very dificult to solve problem
where we must somehow disable the filter until our events are passed to
userpsace (to avoid retansmitting our own injected events in an endless
loop) whilst not loosing any events that might come in at any time via
an intterupt.

The above problem is likely solvable, somehow, but solveing it would
incure another problem: Registering an input filter counts as having
the device open, therby the underlying touchscreen device can not
sleep, this is unacceptable on the devices where this driver is
intended to be used, as they have power budgets in the tens of mW.
Right now this problem is solved by the fact that we can get events
from the input layer on the mirrored touchscreen devce when userspace
closes and opens this device. We can then unregister or register the
input event handler on the underlying touchscreen device accordingly.
If we directly filter the underlying touchscreen device via the method
outlined above, we loose this information as we can not get open() or
close() events on the underlying device, therby we are forced to have
the filter registerd at all times and power managment stopps working.

-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>

-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>

On Sat, 31 Oct 2020 10:37:22 +0100
Carl Philipp Klemm <philipp@uvos.xyz> wrote:

> Hi,
> 
> > Care to summarize here too what's currently blocking touchscreen buttons
> > driver only providing the keyboard events as a separate inputdevice
> > without having to mirror all the touchscreen events?
> 
> Of course. The touchscreen buttons driver has two primary tasks: it
> needs to provide the input device with the keyevents of the buttons and
> it needs to somehow prevent these surfaces generating regular touch
> events. Currently the driver provides these on 2 different input
> devices, one with just the key events and one with all the touch events
> mirrored execpt those that the driver wants to filter away. 
> 
> It would seam best to avoid implementing the second input device by
> using a filter in the input layer on the original touchscreen to filter
> away the unwanted events. The interface is however not conducive to
> this as it requires the filter immidatly decide to filter an event or
> not. This however is impossible as a touch on a button is the
> combination of many simultainus events and the touchscreen buttons
> driver cant possibly know wather to filter an event or not until the
> SYN report arrives. This could be worked around by filtering away all
> events and then retransmitting the ones we dont want to filter later
> using input_inject_event. The problem with this approch however is that
> we cant do this from the interrupt context, and doing this later via a
> workeque or similar mechanisum crates a very dificult to solve problem
> where we must somehow disable the filter until our events are passed to
> userpsace (to avoid retansmitting our own injected events in an endless
> loop) whilst not loosing any events that might come in at any time via
> an intterupt.
> 
> The above problem is likely solvable, somehow, but solveing it would
> incure another problem: Registering an input filter counts as having
> the device open, therby the underlying touchscreen device can not
> sleep, this is unacceptable on the devices where this driver is
> intended to be used, as they have power budgets in the tens of mW.
> Right now this problem is solved by the fact that we can get events
> from the input layer on the mirrored touchscreen devce when userspace
> closes and opens this device. We can then unregister or register the
> input event handler on the underlying touchscreen device accordingly.
> If we directly filter the underlying touchscreen device via the method
> outlined above, we loose this information as we can not get open() or
> close() events on the underlying device, therby we are forced to have
> the filter registerd at all times and power managment stopps working.
> 
> -- 
> Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>
> 
