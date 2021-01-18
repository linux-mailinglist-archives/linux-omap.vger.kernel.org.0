Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D37C72F9B71
	for <lists+linux-omap@lfdr.de>; Mon, 18 Jan 2021 09:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733243AbhARImb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Jan 2021 03:42:31 -0500
Received: from muru.com ([72.249.23.125]:55362 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbhARImb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 18 Jan 2021 03:42:31 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4C0EE80AE;
        Mon, 18 Jan 2021 08:41:49 +0000 (UTC)
Date:   Mon, 18 Jan 2021 10:41:46 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Subject: Re: [PATCHv2] drivers: bus: simple-pm-bus: Fix compatibility with
 simple-bus for auxdata
Message-ID: <YAVJyjmrbLCFjqVA@atomide.com>
References: <20210118073340.62141-1-tony@atomide.com>
 <CAK8P3a1Eec1cAOdxNQ=8LORop+ESqx_=dg1uhJwpXhknxOydsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1Eec1cAOdxNQ=8LORop+ESqx_=dg1uhJwpXhknxOydsg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arnd Bergmann <arnd@kernel.org> [210118 08:30]:
> On Mon, Jan 18, 2021 at 8:33 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > After converting am335x to probe devices with simple-pm-bus I noticed
> > that we are not passing auxdata for of_platform_populate() like we do
> > with simple-bus.
> >
> > While device tree using SoCs should no longer need platform data, there
> > are still quite a few drivers that still need it as can be seen with
> > git grep OF_DEV_AUXDATA. We want to have simple-pm-bus be usable as a
> > replacement for simple-bus also for cases where OF_DEV_AUXDATA is still
> > needed.
> >
> > Let's fix the issue by passing auxdata as platform data to simple-pm-bus.
> > That way the SoCs needing this can pass the auxdata with OF_DEV_AUXDATA.
> > And let's pass the auxdata for omaps to fix the issue for am335x.
> >
> > As an alternative solution, adding simple-pm-bus handling directly to
> > drivers/of/platform.c was considered, but we would still need simple-pm-bus
> > device driver. So passing auxdata as platform data seems like the simplest
> > solution.
> >
> > Fixes: 5a230524f879 ("ARM: dts: Use simple-pm-bus for genpd for am3 l4_wkup")
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> > Changes since v1: Updated description, added devicetree list to Cc
> 
> This looks fine to me for now
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the review.

> But I think we should take the time to discuss how to phase out auxdata
> over time. There are still a number of users, but it's not that many in the
> end. For some of them I see a clear solution, for other ones I do not:

Yes agreed we should remove the auxdata use.

> omap2: I'll leave these for Tony to comment

The three hardest ones to update (because of PM dependencies):

- PRM power managment interrupts that also pinctrl driver uses

- The enable/disable of clockdomain autoidle that at least ti-sysc uses

- Smartreflex PM dependencies to voltage controller

For the ones above, I'll try to come up with something eventually.
The others should be just straight forward driver updates needed.

The hsmmc dependencies would be ideally fixed by moving to use sdhci
driver, but at least custom voltage handling and sdio support needs
work.

Regards,

Tony
