Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E471CF814
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 16:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730247AbgELO5C (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 10:57:02 -0400
Received: from muru.com ([72.249.23.125]:54038 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726891AbgELO5C (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 May 2020 10:57:02 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C3C078047;
        Tue, 12 May 2020 14:57:49 +0000 (UTC)
Date:   Tue, 12 May 2020 07:56:57 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Keerthy <j-keerthy@ti.com>, Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        devicetree@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Adam Ford <aford173@gmail.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/15] dt-bindings: timer: add ti, dmtimer compatible for
 for system timers
Message-ID: <20200512145657.GH37466@atomide.com>
References: <20200429215402.18125-1-tony@atomide.com>
 <20200429215402.18125-3-tony@atomide.com>
 <20200512145215.GA23423@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512145215.GA23423@bogus>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Rob Herring <robh@kernel.org> [200512 14:53]:
> On Wed, 29 Apr 2020 14:53:49 -0700, Tony Lindgren wrote:
> > The TI dual-mode timer can be used for both clocksource and clockevent
> > system timers. We need a way to specify which dual-mode timers are
> > reserved for system timers as there are multiple instances available
> > that may require a board specific configuration.
> > 
> > Let's add a generic compatible "ti,dmtimer" that TIMER_OF_DECLARE can
> > use as suggested by Daniel Lezcano <daniel.lezcano@linaro.org>.
> > 
> > Suggested-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >  Documentation/devicetree/bindings/timer/ti,timer.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> Acked-by: Rob Herring <robh@kernel.org>

Looks like this is no longer needed with v3 set in the repost
thread:

"[PATCHv3 00/14] Update omaps to use drivers/clocksource timers"

It now does detection for the preferred system timers based on
the various timer features like you suggested.

Regards,

Tony
