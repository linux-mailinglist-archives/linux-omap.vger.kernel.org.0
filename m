Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502741D7F78
	for <lists+linux-omap@lfdr.de>; Mon, 18 May 2020 19:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbgERRBE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 May 2020 13:01:04 -0400
Received: from muru.com ([72.249.23.125]:54854 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727006AbgERRBE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 18 May 2020 13:01:04 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A5F0B80CC;
        Mon, 18 May 2020 17:01:51 +0000 (UTC)
Date:   Mon, 18 May 2020 10:00:59 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCHv3 00/14] Update omaps to use drivers/clocksource timers
Message-ID: <20200518170059.GR37466@atomide.com>
References: <20200507172330.18679-1-tony@atomide.com>
 <340cdd4a-d996-073f-127d-89ce6c05f221@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <340cdd4a-d996-073f-127d-89ce6c05f221@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Daniel Lezcano <daniel.lezcano@linaro.org> [200518 16:59]:
> 
> Hi Tony,
> 
> On 07/05/2020 19:23, Tony Lindgren wrote:
> > Hi all,
> > 
> > Here's v3 series to udpate omaps to use drivers/clocksource timers for
> > the 32k counter and dmtimer, and to remove the old legacy platform code.
> > Please review and test.
> > 
> > I've updated the timer-ti-dm-systimer.c patch based on the comments from
> > Daniel and Rob, and added support for selecting the preferred timers to
> > use.
> > 
> > Then for merging when folks are happy with this series, Daniel if you
> > can please apply the first three patches into an immutable branch it
> > would be great.
> 
> so the clk patch also ?

Oops sorry, just first two are needed as we no longer need the
device tree binding changes :)

Regards,

Tony
