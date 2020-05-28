Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 874F41E62BF
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 15:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390539AbgE1NvA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 May 2020 09:51:00 -0400
Received: from muru.com ([72.249.23.125]:56018 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390530AbgE1NvA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 28 May 2020 09:51:00 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6F64D80BF;
        Thu, 28 May 2020 13:51:50 +0000 (UTC)
Date:   Thu, 28 May 2020 06:50:57 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     arm@kernel.org, Rob Herring <robh@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lokesh Vutla <lokeshvutla@ti.com>, Keerthy <j-keerthy@ti.com>,
        Santosh Shilimkar <santosh.shilimkar@oracle.com>,
        linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
        Olof Johansson <olof@lixom.net>, linux-omap@vger.kernel.org,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: omap2: drop broken broadcast timer hack
Message-ID: <20200528135057.GO37466@atomide.com>
References: <20200528091923.2951100-1-arnd@arndb.de>
 <20200528134621.GN37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528134621.GN37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200528 13:47]:
> * Arnd Bergmann <arnd@arndb.de> [200528 09:20]:
> > The OMAP4 timer code had a special hack for using the broadcast timer
> > without SMP. Since the dmtimer is now gone, this also needs to be dropped
> > to avoid a link failure for non-SMP AM43xx configurations:
> > 
> > kernel/time/tick-broadcast.o: in function `tick_device_uses_broadcast':
> > tick-broadcast.c:(.text+0x130): undefined reference to `tick_broadcast'
> 
> Hmm this sounds like a regression though. Isn't this needed for using
> the ARM local timers on non-SMP SoC, so a separate timer from dmtimer?
> 
> I've probably removed something accidentally to cause this.

Sounds like arch/arm/mach-omap2/Makefile change needs to be removed
to always still build in timer.o. And probably timer.c needs back
the ifdef for CONFIG_SOC_HAS_REALTIME_COUNTER.

I'll take a look today.

Regards,

Tony
