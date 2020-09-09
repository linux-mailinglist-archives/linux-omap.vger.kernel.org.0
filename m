Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCC1262704
	for <lists+linux-omap@lfdr.de>; Wed,  9 Sep 2020 08:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgIIGDk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Sep 2020 02:03:40 -0400
Received: from muru.com ([72.249.23.125]:44370 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725772AbgIIGDk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Sep 2020 02:03:40 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id ACA1780DD;
        Wed,  9 Sep 2020 06:03:39 +0000 (UTC)
Date:   Wed, 9 Sep 2020 09:04:21 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: atmel_mxt_ts - use runtime PM instead of
 custom functions
Message-ID: <20200909060421.GD2747@atomide.com>
References: <20200318230938.31573-1-tony@atomide.com>
 <20200908085111.GA31609@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908085111.GA31609@duo.ucw.cz>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [200908 08:51]:
> Hi!
> 
> > Let's use standard runtime PM functions instead of custom start and stop
> > functions. This way we can implement runtime idle mode using runtime PM
> > autosuspend in the following patches.
> 
> This is not in recent kernel. What needs to be done here?

Well it seems that it's lossy for normal use for taps requiring a short
swipe instead. So by default the autosuspend_timeout should be disabled.
This would be still usable for cases where we want to wake up the device
using touchscreen.

Regards,

Tony
