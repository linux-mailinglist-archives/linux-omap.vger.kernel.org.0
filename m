Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80FB03115B6
	for <lists+linux-omap@lfdr.de>; Fri,  5 Feb 2021 23:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbhBEWjS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Feb 2021 17:39:18 -0500
Received: from muru.com ([72.249.23.125]:57568 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229884AbhBENbM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 5 Feb 2021 08:31:12 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8A4768061;
        Fri,  5 Feb 2021 13:30:39 +0000 (UTC)
Date:   Fri, 5 Feb 2021 15:30:23 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     "Ivan J." <parazyd@dyne.org>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] ARM: omap2plus_defconfig: Update for dropped options.
Message-ID: <YB1Ib41trny2JFDv@atomide.com>
References: <20210203113426.18964-1-parazyd@dyne.org>
 <20210203113426.18964-2-parazyd@dyne.org>
 <YBuankYwwMsG4MN9@atomide.com>
 <4b32f566-92ad-3c49-0453-b44df23f1384@ti.com>
 <20210205131736.3jivrc5lln4t2onr@fq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210205131736.3jivrc5lln4t2onr@fq>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ivan J. <parazyd@dyne.org> [210205 13:18]:
> On Fri, Feb 05, 2021 at 03:15:00PM +0200, Grygorii Strashko wrote:
> > 
> > 
> > On 04/02/2021 08:56, Tony Lindgren wrote:
> > > * Ivan Jelincic <parazyd@dyne.org> [210203 13:35]:
> > > > Update omap2plus_defconfig for options that have been dropped:
> > > > 
> > > > - SIMPLE_PM_BUS no longer selected.
> > > 
> > > Oh right, we now need to always select it. Will queue this for
> > > fixes after the merge window. The other one I'll be queueing
> > > for v5.13 as the merge window is about to open and I'll only
> > > queue fixes for the next few weeks :)
> > 
> > "- MICREL_PHY no longer selected."
> > 
> > I do not agree with above as MICREL_PHY is selected by KS8851, but on many boards there is no
> > explicit dependency from KS8851, but MICREL PHYs are in use.
> > So, I'd prefer to have it enabled explicitly in omap2plus_defconfig.
> > 
> > And not sure what exactly "no longer selected" means.
> 
> "no longer selected" means it went away after `make savedefconfig`.

Grgorii, maybe send a patch selecting MICREL_PHY in the Kconfig
for the other cases that do not use KS8851?

Regards,

Tony
