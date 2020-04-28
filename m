Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2FC1BC7AC
	for <lists+linux-omap@lfdr.de>; Tue, 28 Apr 2020 20:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728469AbgD1SWN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Apr 2020 14:22:13 -0400
Received: from muru.com ([72.249.23.125]:51662 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727827AbgD1SWN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 Apr 2020 14:22:13 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 45D2A80F3;
        Tue, 28 Apr 2020 18:23:01 +0000 (UTC)
Date:   Tue, 28 Apr 2020 11:22:09 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Lokesh Vutla <lokeshvutla@ti.com>
Cc:     daniel.lezcano@linaro.org, Tero Kristo <t-kristo@ti.com>,
        Sekhar Nori <nsekhar@ti.com>, Suman Anna <s-anna@ti.com>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Do one override clock
 parent in prepare()
Message-ID: <20200428182209.GT37466@atomide.com>
References: <20200427172831.16546-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427172831.16546-1-lokeshvutla@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Lokesh Vutla <lokeshvutla@ti.com> [200427 17:29]:
> omap_dm_timer_prepare() is setting up the parent 32KHz clock. This
> prepare() gets called by request_timer in the client's driver. Because of
> this, the timer clock parent that is set with assigned-clock-parent is being
> overwritten. So drop this default setting of parent in prepare().
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>

This works just fine for me but depends on the dts changes.

Daniel, for merging, do you want to set up an immutable branch
for the related dts change and this? I'm afraid it will conflict
with the related systimer changes for the dts otherwise.

Regards,

Tony

> ---
> - As per the discussion happened here[0], dropping the default setting.
> [0] https://patchwork.kernel.org/patch/11379875/#23309493
> 
>  drivers/clocksource/timer-ti-dm.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
> index 2531eab3d6d7..60aff087947a 100644
> --- a/drivers/clocksource/timer-ti-dm.c
> +++ b/drivers/clocksource/timer-ti-dm.c
> @@ -258,9 +258,7 @@ static int omap_dm_timer_prepare(struct omap_dm_timer *timer)
>  	__omap_dm_timer_enable_posted(timer);
>  	omap_dm_timer_disable(timer);
>  
> -	rc = omap_dm_timer_set_source(timer, OMAP_TIMER_SRC_32_KHZ);
> -
> -	return rc;
> +	return 0;
>  }
>  
>  static inline u32 omap_dm_timer_reserved_systimer(int id)
> -- 
> 2.23.0
> 
