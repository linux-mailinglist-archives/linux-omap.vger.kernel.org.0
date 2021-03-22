Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D693343D9E
	for <lists+linux-omap@lfdr.de>; Mon, 22 Mar 2021 11:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhCVKRt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Mar 2021 06:17:49 -0400
Received: from muru.com ([72.249.23.125]:45606 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229760AbhCVKR1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 22 Mar 2021 06:17:27 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4DC5C804C;
        Mon, 22 Mar 2021 10:18:17 +0000 (UTC)
Date:   Mon, 22 Mar 2021 12:17:19 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Keerthy <j-keerthy@ti.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tero Kristo <kristo@kernel.org>
Subject: Re: [PATCH 2/2] clocksource/drivers/timer-ti-dm: Handle dra7 timer
 wrap errata i940
Message-ID: <YFhurzhHvusXbvyU@atomide.com>
References: <20210304073737.15810-1-tony@atomide.com>
 <20210304073737.15810-3-tony@atomide.com>
 <1edba5bd-5408-c545-85ea-689b4171cb5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1edba5bd-5408-c545-85ea-689b4171cb5b@linaro.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Daniel Lezcano <daniel.lezcano@linaro.org> [210322 10:16]:
> On 04/03/2021 08:37, Tony Lindgren wrote:
> > There is a timer wrap issue on dra7 for the ARM architected timer.
> > In a typical clock configuration the timer fails to wrap after 388 days.
> > 
> > To work around the issue, we need to use timer-ti-dm percpu timers instead.
> > 
> > Let's configure dmtimer3 and 4 as percpu timers by default, and warn about
> > the issue if the dtb is not configured properly.
> > 
> > Let's do this as a single patch so it can be backported to v5.8 and later
> > kernels easily. 
> 
> Cc: <stable@vger.kernel.org> # v5.8+
> 
> ??

Yes please, that would be great.

Thanks,

Tony
