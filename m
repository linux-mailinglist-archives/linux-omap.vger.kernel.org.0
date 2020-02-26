Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7DF717059F
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 18:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbgBZRJn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 12:09:43 -0500
Received: from muru.com ([72.249.23.125]:57782 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727240AbgBZRJn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 Feb 2020 12:09:43 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 62B8F8022;
        Wed, 26 Feb 2020 17:10:27 +0000 (UTC)
Date:   Wed, 26 Feb 2020 09:09:39 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Lokesh Vutla <lokeshvutla@ti.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        linux-kernel@vger.kernel.org, narmstrong@baylibre.com,
        Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 1/2] clocksource: timer-ti-dm: Do not restore context on
 every timer enable
Message-ID: <20200226170939.GQ37466@atomide.com>
References: <20200224050753.17784-1-lokeshvutla@ti.com>
 <20200224050753.17784-2-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224050753.17784-2-lokeshvutla@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Lokesh Vutla <lokeshvutla@ti.com> [200224 05:09]:
> omap_dm_timer_enable() restores the entire context(including counter)
> based on 2 conditions:
> - If get_context_loss_count is populated and context is lost.
> - If get_context_loss_count is not populated update unconditionally.
> 
> Case2 has a side effect of updating the counter register even though
> context is not lost. When timer is configured in pwm mode, this is
> causing undesired behaviour in the pwm period. So restore context only
> if get_context_loss_count is populated and context is actually lost.

Sounds like this will break things. We have get_context_loss_count()
only on omap4 and later, and even that was only partially implemented
from what I recall.

To mee it seems the right thing to do here is to save and restore
context on CPU_CLUSTER_PM_ENTER and CPU_CLUSTER_PM_EXIT. And I'd
just get rid of the partially implemented custom calls to
get_context_loss_count().

See for example a recent patch on removing the legacy SDMA code
for CPU_CLUSTER_PM_ENTER in commit d2f924879e19 ("thermal:
ti-soc-thermal:  Enable addition power management").

Then if we really need to add checks for context lost at some point,
that can be implemented via reset_control_status() returning -ENOLINK
or something similar.

Regards,

Tony
