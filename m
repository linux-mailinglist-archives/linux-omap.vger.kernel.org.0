Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5782F0EB7
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jan 2021 10:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbhAKJDU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Jan 2021 04:03:20 -0500
Received: from muru.com ([72.249.23.125]:42700 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728061AbhAKJDT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Jan 2021 04:03:19 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3100880BB;
        Mon, 11 Jan 2021 09:02:38 +0000 (UTC)
Date:   Mon, 11 Jan 2021 11:02:34 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 5/5] Input: omap4-keypad - implement errata check for
 lost key-up events
Message-ID: <X/wUKh4kYj2SBri5@atomide.com>
References: <20210110190529.46135-1-tony@atomide.com>
 <20210110190529.46135-6-tony@atomide.com>
 <20210111083353.GA23439@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111083353.GA23439@amd>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [210111 08:34]:
> Hi!
> 
> > We are still missing handling for errata i689 related issues for the
> > case where we never see a key up interrupt for the last pressed key.
> > 
> > To fix the issue, we must scan the key state again after the keyboard
> > controller has idled to check if a key up event was missed. This is
> > described in the omap4 silicon errata documentation for Errata ID i689
> > "1.32 Keyboard Key Up Event Can Be Missed":
> > 
> > "When a key is released for a time shorter than the debounce time,
> >  in-between 2 key press (KP1 and KP2), the keyboard state machine will go
> >  to idle mode and will never detect the key release (after KP1, and also
> >  after KP2), and thus will never generate a new IRQ indicating the key
> >  release."
> > 
> > We can use PM runtime autosuspend features to check the keyboard state
> > after it enters idle.
> 
> I thought about this and... is it reasonable?
> 
> Autosuspend is now required for correct operation. But autosuspend is
> optional feature, configurable by user, and may not be available
> depending on .config.

Well suspending hardware that has (lost) events pending is wrong. So we
need to do this delayed hardware check at least when runtime suspending
the device.

> Do we need some other solution?

Not sure if other places make sense to do this check as we need to wait
about 50ms for hardware to autoidle, and only then check if there are
events pending, and then clear the pending events. The PM runtime suspend
function seems like a natural place to do this.

If PM runtime autosuspend is disabled, the issue with last pressed key
getting stuck sometimes can still happen like it did earlier. That issue
has always been there for past 10 or so years and nobody else bothered to
fix it so I'm not too worried about it.

With this series we already fix the bigger issue anyways where rapidly
pressing the keys would have the previous key stuck. Like rapid pressing
of shift shift j would produce an upper case J instead of j.

Naturally there is nothing stopping us from adding additional other places
to call omap4_keypad_scan_keys() as needed now though if you have some
good ideas for that :)

Regards,

Tony







