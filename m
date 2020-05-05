Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7321C5F8C
	for <lists+linux-omap@lfdr.de>; Tue,  5 May 2020 20:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730685AbgEESCr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 May 2020 14:02:47 -0400
Received: from muru.com ([72.249.23.125]:52904 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730069AbgEESCq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 5 May 2020 14:02:46 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 13DEC80A5;
        Tue,  5 May 2020 18:03:34 +0000 (UTC)
Date:   Tue, 5 May 2020 11:02:43 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] arm: dts: Add 32KHz clock as default clock source
Message-ID: <20200505180243.GM37466@atomide.com>
References: <20200427172604.16351-1-lokeshvutla@ti.com>
 <20200428181919.GS37466@atomide.com>
 <e49e047d-6883-6bee-7dac-a544a27f6293@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e49e047d-6883-6bee-7dac-a544a27f6293@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [200505 16:07]:
> On 4/28/20 1:19 PM, Tony Lindgren wrote:
> > * Lokesh Vutla <lokeshvutla@ti.com> [200427 17:27]:
> > > Clocksource to timer configured in pwm mode can be selected using the DT
> > > property ti,clock-source. There are few pwm timers which are not
> > > selecting the clock source and relying on default value in hardware or
> > > selected by driver. Instead of relying on default value, always select
> > > the clock source from DT.
> > > 
> > > Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> 
> Thanks Lokesh, with this patch, we should be able to pickup the dmtimer
> driver patch to finally allow dmtimer clients to use assigned-clock-parents.
> 
> Once both of these are merged, we can deprecate the ti,clock-source from the
> omap-pwm-dmtimer driver.
> 
> Reviewed-by: Suman Anna <s-anna@ti.com>

I've pushed this patch applied against v5.7-rc1 into
omap-for-v5.8/dt-timer.

Regards,

Tony
