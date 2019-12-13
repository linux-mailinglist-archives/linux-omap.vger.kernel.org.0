Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76A6A11E5F5
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 15:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbfLMO5h (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Dec 2019 09:57:37 -0500
Received: from muru.com ([72.249.23.125]:47058 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727497AbfLMO5h (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 13 Dec 2019 09:57:37 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 935CC80BF;
        Fri, 13 Dec 2019 14:58:14 +0000 (UTC)
Date:   Fri, 13 Dec 2019 06:57:32 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        dri-devel@lists.freedesktop.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] ARM: dts: am437x-gp-evm: add HDMI support
Message-ID: <20191213145732.GH35479@atomide.com>
References: <20191125131100.9839-1-tomi.valkeinen@ti.com>
 <20191212172104.GY35479@atomide.com>
 <20191212173110.GA35479@atomide.com>
 <d09526b2-8435-bef2-0489-0c3c8173d451@ti.com>
 <20191213104204.GB4860@pendragon.ideasonboard.com>
 <2f5cfca4-d36d-da2d-59ba-b76669daeded@ti.com>
 <20191213114207.GC4860@pendragon.ideasonboard.com>
 <36d8dde1-1a76-5a5f-2a41-8bc52dfcf2fa@ti.com>
 <20191213122845.GD4860@pendragon.ideasonboard.com>
 <3900f4b3-4604-cb64-ebdd-ae168ef1d2fb@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3900f4b3-4604-cb64-ebdd-ae168ef1d2fb@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [191213 12:34]:
> On 13/12/2019 14:28, Laurent Pinchart wrote:
> 
> > > So... In the DT file, we would have multiple endpoints in the same output port in DSS, one going to
> > > the panel, one to the SiI9022? omapdrm could then create two encoders, one abstracting the DPI
> > > output and the connection to the panel, one abstracting the DPI output and SiI9022?
> > 
> > That's the idea, yes.
> > 
> > > And then someone would need to handle the GPIO, and set it based on the output used. These kind of
> > > gpios are always difficult, as they don't belong anywhere =).
> > 
> > https://lore.kernel.org/lkml/20191211061911.238393-5-hsinyi@chromium.org/
> > 
> > Still, the infrastructure in omapdrm would need quite a bit of work.
> > We're just about to get a helper layer for linear pipelines merged, and
> > we already need to go one step further :-)
> 
> Alright, sounds like this will be doable in the future. So let's drop this
> and the epos HDMI patches for now.

Oh OK. Sounds like no other solution is usable right now short of
separate dts files like you've done.

> This does sound like quite a bit of work, as you say, so I have no idea when
> we can get there (on the omapdrm side). In the minimum we should first get
> the big omapdrm rework done, in order to avoid nasty conflicts.
> 
> Thanks for educating me =).

Sounds a nice plan though :)

Thanks,

Tony
