Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12FD311530
	for <lists+linux-omap@lfdr.de>; Fri,  5 Feb 2021 23:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhBEWYg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Feb 2021 17:24:36 -0500
Received: from muru.com ([72.249.23.125]:57766 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232614AbhBEOZb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 5 Feb 2021 09:25:31 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BE64F8061;
        Fri,  5 Feb 2021 14:46:51 +0000 (UTC)
Date:   Fri, 5 Feb 2021 16:46:35 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     "Ivan J." <parazyd@dyne.org>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] ARM: omap2plus_defconfig: Update for dropped options.
Message-ID: <YB1aS4Tn76hKM5NC@atomide.com>
References: <20210203113426.18964-1-parazyd@dyne.org>
 <20210203113426.18964-2-parazyd@dyne.org>
 <YBuankYwwMsG4MN9@atomide.com>
 <4b32f566-92ad-3c49-0453-b44df23f1384@ti.com>
 <20210205131736.3jivrc5lln4t2onr@fq>
 <YB1Ib41trny2JFDv@atomide.com>
 <8ab86ccf-7568-c173-75f6-0d572fd43fec@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ab86ccf-7568-c173-75f6-0d572fd43fec@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [210205 14:25]:
> On 05/02/2021 15:30, Tony Lindgren wrote:
> > Grgorii, maybe send a patch selecting MICREL_PHY in the Kconfig
> > for the other cases that do not use KS8851?
> 
> The KS8851 config was added like 10years ago and is used on some omap4 platforms,
> it does select MICREL_PHY.
> 
> From other side, *some* am57x, am437 platforms uses MICREL PHYs with no dependency from KS8851.
> 
> The omap2plus_defconfig is also used as base for custom configs and first thing people are doing -
> remove not needed options. As result, removal of KS8851 plus this patch will immediately
> cause MICREL_PHY=n and so breakage on existing and custom platforms.
> 
> I do not see how it can be resolved by using Kconfig changes within much-omap2.
> 
> So, sry, but NACK for this patch as it is.

We can wait on this patch no problem while we figure this out.
But certainly we need to fix things so make savedefconfig
produces valid configs that don't need to be manually edited.

> if some Kconfig dependencies need to be sorted out - probably the best way might be
> to get rid of select MICREL_PHY in KS8851/KS8851_MLL.

That will potentially break things too as the configs now expect
it to be selected :) Looks like that got changed with commit
f0791b92d2b6 ("net: ks8851: Select PHYLIB and MICREL_PHY in
Kconfig").

So why can't we do similar patches to select MICREL_PHY for
the other non-ks8851 configurations in drivers/net/ethernet
Kconfig files as needed?

Regards,

Tony

