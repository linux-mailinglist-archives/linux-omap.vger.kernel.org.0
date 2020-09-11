Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D708265DF6
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 12:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbgIKKcy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Sep 2020 06:32:54 -0400
Received: from muru.com ([72.249.23.125]:44576 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgIKKcy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Sep 2020 06:32:54 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 901FD80A3;
        Fri, 11 Sep 2020 10:32:53 +0000 (UTC)
Date:   Fri, 11 Sep 2020 13:33:37 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     khilman@kernel.org, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Subject: Re: [PATCH] omap3: enable off mode automatically
Message-ID: <20200911103337.GH7101@atomide.com>
References: <20200911064924.26281-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911064924.26281-1-andreas@kemnade.info>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andreas Kemnade <andreas@kemnade.info> [200911 09:50]:
> --- a/arch/arm/mach-omap2/pm.h
> +++ b/arch/arm/mach-omap2/pm.h
> @@ -49,11 +49,7 @@ static inline int omap4_opp_init(void)
>  extern int omap3_pm_get_suspend_state(struct powerdomain *pwrdm);
>  extern int omap3_pm_set_suspend_state(struct powerdomain *pwrdm, int state);
>  
> -#ifdef CONFIG_PM_DEBUG
>  extern u32 enable_off_mode;
> -#else
> -#define enable_off_mode 0
> -#endif

Hmm isn't the above still needed for the other SoCs? Or is omap3 the only
user?

Otherwise looks good to me :)

Tony
