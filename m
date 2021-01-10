Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A174D2F0872
	for <lists+linux-omap@lfdr.de>; Sun, 10 Jan 2021 17:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbhAJQul (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 Jan 2021 11:50:41 -0500
Received: from muru.com ([72.249.23.125]:42230 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726080AbhAJQul (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 10 Jan 2021 11:50:41 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5159E80E4;
        Sun, 10 Jan 2021 16:49:59 +0000 (UTC)
Date:   Sun, 10 Jan 2021 18:49:56 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 3/4] Input: omap4-keypad - use PM runtime to check keys
 for errata
Message-ID: <X/swNKbiIQ6+7ibU@atomide.com>
References: <20210106125822.31315-1-tony@atomide.com>
 <20210106125822.31315-4-tony@atomide.com>
 <X/qf5rpxjLxSd3iq@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/qf5rpxjLxSd3iq@google.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Dmitry Torokhov <dmitry.torokhov@gmail.com> [210110 06:34]:
> Hi Tony,
> 
> On Wed, Jan 06, 2021 at 02:58:21PM +0200, Tony Lindgren wrote:
> > @@ -301,6 +348,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
> >  	}
> >  
> >  	keypad_data->irq = irq;
> > +	mutex_init(&keypad_data->lock);
> >  
> >  	error = omap4_keypad_parse_dt(&pdev->dev, keypad_data);
> >  	if (error)
> > @@ -320,6 +368,8 @@ static int omap4_keypad_probe(struct platform_device *pdev)
> >  		goto err_release_mem;
> >  	}
> >  
> > +	pm_runtime_use_autosuspend(&pdev->dev);
> > +	pm_runtime_set_autosuspend_delay(&pdev->dev, OMAP4_KEYPAD_AUTOIDLE_MS);
> 
> This, and corresponding changes in open() and close() seem like a
> separate improvement. Do you mind splitting them into a separate patch,
> and have the missing key release fix go on top of it?

Sure will do.

Thanks,

Tony
