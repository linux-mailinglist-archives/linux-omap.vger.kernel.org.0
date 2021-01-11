Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46B212F0C1D
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jan 2021 06:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725536AbhAKFNO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Jan 2021 00:13:14 -0500
Received: from muru.com ([72.249.23.125]:42590 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbhAKFNO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Jan 2021 00:13:14 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3B4C480E4;
        Mon, 11 Jan 2021 05:12:32 +0000 (UTC)
Date:   Mon, 11 Jan 2021 07:12:28 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 4/5] Input: omap4-keypad - use PM runtime autosuspend
Message-ID: <X/vePMbD4fwsNb5Y@atomide.com>
References: <20210110190529.46135-1-tony@atomide.com>
 <20210110190529.46135-5-tony@atomide.com>
 <X/vbqdQTTDg2UUaJ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/vbqdQTTDg2UUaJ@google.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Dmitry Torokhov <dmitry.torokhov@gmail.com> [210111 05:01]:
> Hi Tony,
> 
> On Sun, Jan 10, 2021 at 09:05:28PM +0200, Tony Lindgren wrote:
> > @@ -350,15 +379,12 @@ static int omap4_keypad_probe(struct platform_device *pdev)
> >  
> >  	error = omap4_keypad_check_revision(&pdev->dev,
> >  					    keypad_data);
> > -	if (!error) {
> > -		/* Ensure device does not raise interrupts */
> > -		omap4_keypad_stop(keypad_data);
> > -	}
> > -
> > -	pm_runtime_put_sync(&pdev->dev);
> 
> Why are we moving this down? The idea was to make sure the power usage
> counters are correct even if we exit probe early.

Yes you are right, omap4_keypad_close() won't help with balancing the
get if we exit early.

> Can we call pm_runtime_mark_last_busy() and pm_runtime_put_autosuspend()
> here?

Yes that should work as there's no more register access during the probe.

Regards,

Tony
