Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4914720CD
	for <lists+linux-omap@lfdr.de>; Mon, 13 Dec 2021 06:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhLMFyw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Dec 2021 00:54:52 -0500
Received: from muru.com ([72.249.23.125]:37892 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230054AbhLMFys (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 Dec 2021 00:54:48 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0F97E809F;
        Mon, 13 Dec 2021 05:55:30 +0000 (UTC)
Date:   Mon, 13 Dec 2021 07:54:46 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dev Null <devnull@uvos.xyz>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: Nokia N900 OFF mode regression between v5.10 and v5.11
Message-ID: <YbbgJnmslVRngjuh@atomide.com>
References: <43cac03a-53c2-83dd-e1b0-4d25920d9095@wizzup.org>
 <20211211085403.3c1fcb0d@aktux>
 <4fa31761-e7d2-0995-2180-c52afeb39dfa@wizzup.org>
 <20211211114306.16116dde@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211211114306.16116dde@aktux>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Andreas Kemnade <andreas@kemnade.info> [211211 10:43]:
> The patch fixing thermal power management is: 
>  
> commit 5093402e5b449b64f7bbaa09057ce40a8f3c1484
> Author: Adam Ford <aford173@gmail.com>
> Date:   Fri Sep 11 07:31:56 2020 -0500
> 
>     thermal: ti-soc-thermal: Enable addition power management
>     
>     The bandgap sensor can be idled when the processor is too, but it
>     isn't currently being done, so the power consumption of OMAP3
>     boards can elevated if the bangap sensor is enabled.
>     
>     This patch attempts to use some additional power management
>     to idle the clock to the bandgap when not needed.
> 
> Maybe there is something specific to the N900 which causes these
> issues? Well, I'll recheck on the boards I have.

My guess the issue is that omap3-thermal needs to constantly poll
for the registers to get the status and that blocks any deeper
idle states. For PM, probably omap3-thermal needs to be tagged with
status = "disabled" assuming there is some other external thermal
sensor. I'm also guessing that the old Nokia kernel never used the
integrated thermal sensor, might be worth checking though.

Regards,

Tony
