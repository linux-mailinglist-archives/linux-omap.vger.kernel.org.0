Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9CA83E9FED
	for <lists+linux-omap@lfdr.de>; Thu, 12 Aug 2021 09:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234245AbhHLHzX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Aug 2021 03:55:23 -0400
Received: from muru.com ([72.249.23.125]:42564 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231520AbhHLHzX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Aug 2021 03:55:23 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6FCF380E2;
        Thu, 12 Aug 2021 07:55:18 +0000 (UTC)
Date:   Thu, 12 Aug 2021 10:54:56 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Santosh Shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [GIT PULL 2/3] Drop pm_runtime_irq_safe() for smartreflex for
 v5.15
Message-ID: <YRTT0Oejj22qNAL+@atomide.com>
References: <pull-1628751694-126144@atomide.com>
 <pull-1628751694-126144@atomide.com-2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pull-1628751694-126144@atomide.com-2>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Tony Lindgren <tony@atomide.com> [210812 07:04]:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit fdc07ca0724dd8ad00c22909a1464dc73ed6783e:
> 
>   Merge branch 'omap-for-v5.14/ti-sysc' into omap-for-v5.15/ti-sysc (2021-07-27 12:02:24 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.15/sr-signed
> 
> for you to fetch changes up to 74953a9136cfd650dd994daded520528f737b7b3:
> 
>   soc: ti: Remove pm_runtime_irq_safe() usage for smartreflex (2021-08-06 09:53:59 +0300)
> 
> ----------------------------------------------------------------
> Drop pm_runtime_irq_safe() usage for smartreflex for v5.15
> 
> We now have cleard pm_runtime_irq_safe() usage for all TI SoCs
> in Linux next except for smartreflex and 8250_omap. This change
> removes pm_runtime_irq_safe() usage for smartreflex, the
> 8250_omap depends on pending serial layer PM changes.

Looks like Santosh already queued up this patch and sent a pull request,
so my pull request for this change can be just ignored.

Regrds,

Tony


> ----------------------------------------------------------------
> Tony Lindgren (1):
>       soc: ti: Remove pm_runtime_irq_safe() usage for smartreflex
> 
>  drivers/bus/ti-sysc.c             |  6 ++---
>  drivers/soc/ti/smartreflex.c      | 52 +++++++++++++++++----------------------
>  include/linux/power/smartreflex.h |  2 ++
>  3 files changed, 26 insertions(+), 34 deletions(-)
