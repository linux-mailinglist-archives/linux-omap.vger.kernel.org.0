Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 558A42EEDD9
	for <lists+linux-omap@lfdr.de>; Fri,  8 Jan 2021 08:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727396AbhAHH0M (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Jan 2021 02:26:12 -0500
Received: from muru.com ([72.249.23.125]:41204 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726763AbhAHH0L (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 8 Jan 2021 02:26:11 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A75A680B4;
        Fri,  8 Jan 2021 07:25:52 +0000 (UTC)
Date:   Fri, 8 Jan 2021 09:25:27 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>
Subject: Re: [PATCH 4/4] Input: omap4-keypad - simplify probe with devm
Message-ID: <X/gI55MjYj5ImKwi@atomide.com>
References: <20210106125822.31315-1-tony@atomide.com>
 <20210106125822.31315-5-tony@atomide.com>
 <20210106134336.lmbaywvn7aqohsj5@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106134336.lmbaywvn7aqohsj5@earth.universe>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sebastian Reichel <sre@kernel.org> [210106 13:44]:
> On Wed, Jan 06, 2021 at 02:58:22PM +0200, Tony Lindgren wrote:
> > -	struct resource *res;
> >  
> >  	dev_pm_clear_wake_irq(&pdev->dev);
> > -
> > -	free_irq(keypad_data->irq, keypad_data);
> > -
> >  	pm_runtime_dont_use_autosuspend(&pdev->dev);
> >  	pm_runtime_disable(&pdev->dev);
> > -
> >  	input_unregister_device(keypad_data->input);
> 
> not needed:
> 
>  * devm_input_allocate_device - allocate managed input device
>  * @dev: device owning the input device being created
>  *
>  * Returns prepared struct input_dev or %NULL.
>  *
>  * Managed input devices do not need to be explicitly unregistered or
>  * freed as it will be done automatically when owner device unbinds from
>  * its driver (or binding fails). [...]

OK thanks will drop and fix up the reported autobuild warnings
and repost. Looks like also the OMAP4_KEYPAD_AUTOIDLE_MS value
of 50 is too long, I recently changed it from 30 but now have
seen few stuck last pressed keys.

Regards,

Tony

