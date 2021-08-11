Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE5D3E8A17
	for <lists+linux-omap@lfdr.de>; Wed, 11 Aug 2021 08:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234675AbhHKGMl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Aug 2021 02:12:41 -0400
Received: from muru.com ([72.249.23.125]:41494 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234548AbhHKGMk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Aug 2021 02:12:40 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8DE3380CF;
        Wed, 11 Aug 2021 06:12:37 +0000 (UTC)
Date:   Wed, 11 Aug 2021 09:12:15 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@denx.de>
Cc:     sashal@kernel.org, linux-omap@vger.kernel.org,
        Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [PATCH] bus: ti-sysc: Fix gpt12 system timer issue with reserved
 status
Message-ID: <YRNqP9rcJElbq6EB@atomide.com>
References: <20210611060224.36769-1-tony@atomide.com>
 <20210810124006.GA25121@amd>
 <YRJ2fyS6z1i/2W2e@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRJ2fyS6z1i/2W2e@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [210810 12:52]:
> * Pavel Machek <pavel@denx.de> [210810 12:40]:
> > What is going on here? First, we silently ignore errors other than
> > EBUSY. Second, sysc_check_active_timer() can't return -EBUSY: it
> > returns either 0 or -ENXIO. (I checked 5.10-stable, mainline and
> > -next-20210806).
> 
> Thanks for spotting it, looks like there's now a conflict with commit
> 65fb73676112 ("bus: ti-sysc: suppress err msg for timers used as
> clockevent/source"). It seems we should also check for -ENXIO here
> too. And yeah it makes sens to return on other errors for sure.

FYI, fix posted at [0] below.

Regards,

Tony

[0] https://lore.kernel.org/linux-omap/20210811061053.32081-1-tony@atomide.com/T/#u
