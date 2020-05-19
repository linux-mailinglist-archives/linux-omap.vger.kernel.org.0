Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA501D9BF3
	for <lists+linux-omap@lfdr.de>; Tue, 19 May 2020 18:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729185AbgESQGd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 May 2020 12:06:33 -0400
Received: from muru.com ([72.249.23.125]:55072 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728953AbgESQGc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 19 May 2020 12:06:32 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6559B80FA;
        Tue, 19 May 2020 16:07:22 +0000 (UTC)
Date:   Tue, 19 May 2020 09:06:30 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Fix warning for set but
 not used
Message-ID: <20200519160630.GV37466@atomide.com>
References: <20200519155157.12804-1-tony@atomide.com>
 <2f67a110-e52f-94fc-fae2-c3171a67bb8a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f67a110-e52f-94fc-fae2-c3171a67bb8a@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Daniel Lezcano <daniel.lezcano@linaro.org> [200519 16:01]:
> On 19/05/2020 17:51, Tony Lindgren wrote:
> > We can get a warning for dmtimer_clocksource_init() with 'pa' set but
> > not used. This was used in the earlier revisions of the code but no
> > longer needed, so let's remove the unused pa and of_translate_address().
> > Let's also do it for dmtimer_clockevent_init() that has a similar issue.
> > 
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> 
> Applied, thanks

Thanks! Do you already have some immutable commit I can use
as the base for the SoC and dts changes? Or do you want to
wait a bit for that?

Regards,

Tony
