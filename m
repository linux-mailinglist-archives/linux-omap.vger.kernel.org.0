Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1415248135
	for <lists+linux-omap@lfdr.de>; Tue, 18 Aug 2020 10:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgHRI62 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Aug 2020 04:58:28 -0400
Received: from muru.com ([72.249.23.125]:40720 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726424AbgHRI61 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 18 Aug 2020 04:58:27 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 317F7810D;
        Tue, 18 Aug 2020 08:58:25 +0000 (UTC)
Date:   Tue, 18 Aug 2020 11:58:53 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Adam Ford <aford173@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH V2] ARM: dts: omap3: Add cpu trips and cooling map for
 omap34/36 families
Message-ID: <20200818085853.GO2994@atomide.com>
References: <20200817133931.11785-1-aford173@gmail.com>
 <20200817215953.59607c11@aktux>
 <CAHCN7x+2trMJPmg1xA_j2EUfxqtZX0da-pyzvpiZE4GanVNf4Q@mail.gmail.com>
 <20200817221532.5d150648@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817221532.5d150648@aktux>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andreas Kemnade <andreas@kemnade.info> [200817 20:15]:
> On Mon, 17 Aug 2020 15:02:27 -0500
> Adam Ford <aford173@gmail.com> wrote:
> 
> > On Mon, Aug 17, 2020 at 2:59 PM Andreas Kemnade <andreas@kemnade.info> wrote:
> > >
> > > On Mon, 17 Aug 2020 08:39:31 -0500
> > > Adam Ford <aford173@gmail.com> wrote:
> > >  
> > > > The OMAP3530, OMAP3630, and DM3730 all show thresholds of 90C and 105C
> > > > depending on commercial or industrial temperature ratings.
> > > >
> > > > This patch expands the thermal information to include the limits of 90
> > > > and 105C for alert and critical.  It sets the coolings-cells for the
> > > > 34xx and 36xx CPU's which both point to omap3-cpu-thermal.dtsi.
> > > >
> > > > For boards who never use industrial temperatures, these can be
> > > > changed on their respective device trees with something like:
> > > >
> > > > &cpu_alert0 {
> > > >       temperature = <85000>; /* millicelsius */
> > > > };
> > > >
> > > > &cpu_crit {
> > > >       temperature = <90000>; /* millicelsius */
> > > > };

I think you should set the lower temperatures by default and have
only the boards known to work with higher values configure them as
needed.

> > > > OMAP3_THERMAL will need to be enabled.  It is off by default.
> > > >  
> > > hmm, I think the patch for idling core when OMAP3_THERMAL is enabled
> > > got stuck somewhere. It still seems not to work. Shouldn't that patch
> > > be applied first?  
> > 
> > I rebased the idle stuff, and now I get errors, so I haven't pushed it
> > yet.  I put a note that OMAP3_THERMAL is off by default, but this
> > patch would at least get the framing in there.  I know at least two of
> > us that use 1GHZ processors which are not supposed to run at that
> > speed above 90MHz, so the idea was to tolerate the higher current for
> > now, and when the idle stuff works, we'll enable the OMAP3_THERMAL by
> > default.
> > 
> yes, makes sense, so with this patch we have the choice to either
> optimize for low speeds and currents (by disabling OMAP3_THERMAL and
> 1GHz) or high speeds (by enabling OMAP3_THERMAL and 1 Ghz).

Maybe add something like that to the patch description too?

Regards,

Tony
