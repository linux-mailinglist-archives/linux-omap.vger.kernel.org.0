Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC38118D80F
	for <lists+linux-omap@lfdr.de>; Fri, 20 Mar 2020 20:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgCTTAr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Mar 2020 15:00:47 -0400
Received: from muru.com ([72.249.23.125]:32810 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbgCTTAr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 20 Mar 2020 15:00:47 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2FBDC8030;
        Fri, 20 Mar 2020 19:01:30 +0000 (UTC)
Date:   Fri, 20 Mar 2020 12:00:40 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: atmel_mxt_ts - use runtime PM autosuspend for
 idle config
Message-ID: <20200320190040.GP37466@atomide.com>
References: <20200318230938.31573-1-tony@atomide.com>
 <20200318230938.31573-3-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318230938.31573-3-tony@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200318 23:10]:
> Let's enable runtime PM autosuspend with a default value of 600 ms and
> switch to idle power config for runtime_suspend. The autosuspend timeout
> can also be configured also via userspace with value of -1 disabling the
> autosuspend.
> 
> Let's only allow autosuspend if MXT_SUSPEND_T9_CTRL is not configured for
> suspend_mode as MXT_SUSPEND_T9_CTRL mode powers off the controller.

Hmm looks like with autosuspend enabled I need a short swipe instead of
just clicking on the screen to produce a click. So we may want to default
to autosuspend timeout of -1 and have user set it when suitable and no
other fix is found.

On droid4, I've confirmed that disabling autosuspend fixes the issue FYI:

# echo on > /sys/bus/i2c/drivers/atmel_mxt_ts/1-004a/power/control

Regards,

Tony
