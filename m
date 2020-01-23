Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C866146F79
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2020 18:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgAWRUs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jan 2020 12:20:48 -0500
Received: from muru.com ([72.249.23.125]:52134 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726605AbgAWRUs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Jan 2020 12:20:48 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DC3E2810A;
        Thu, 23 Jan 2020 17:21:29 +0000 (UTC)
Date:   Thu, 23 Jan 2020 09:20:44 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Benoit Parrot <bparrot@ti.com>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 0/3] ARM: dts: am43x-vpfe/ov2659.patch
Message-ID: <20200123172044.GC5885@atomide.com>
References: <20191211140720.10539-1-bparrot@ti.com>
 <20191212174123.GF35479@atomide.com>
 <c4ae58dc-3c81-f493-a665-6926baa0f04c@ti.com>
 <20191213152938.GK35479@atomide.com>
 <20200113165413.i6nbi2i7xyue4fti@ti.com>
 <20200114160422.GQ5885@atomide.com>
 <e72f8de3-fd30-a216-8e6e-934a05259ed6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e72f8de3-fd30-a216-8e6e-934a05259ed6@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [200117 14:16]:
> On 14/01/2020 18:04, Tony Lindgren wrote:
> > * Benoit Parrot <bparrot@ti.com> [200113 16:51]:
> > > Tony Lindgren <tony@atomide.com> wrote on Fri [2019-Dec-13 07:29:38 -0800]:
> > > > * Tero Kristo <t-kristo@ti.com> [191213 07:43]:
> > > > > On 12/12/2019 19:41, Tony Lindgren wrote:
> > > > > > * Benoit Parrot <bparrot@ti.com> [191211 06:04]:
> > > > > > > This patch series adds the missing camera endpoint (ov2659) as well as
> > > > > > > the required source clocks nodes for the sensor.
> > > > > > > 
> > > > > > > On the am437x-sk-evm the camera sensor is sourced from clkout1 but that
> > > > > > > clock nodes/tree was removed as it was unsed at the time, we are
> > > > > > > re-adding the needed clock nodes here.
> > > > > > 
> > > > > > Tero, it seems I can already pick this series?
> > > > > 
> > > > > I believe it is ready if you approve the clkout1 clock patch.
> > > > 
> > > > OK yeah looks fine.
> > > > 
> > > > > > Or ou want to queue the changes to am43xx-clocks.dtsi along with all
> > > > > > your other clock patches?
> > > > > 
> > > > > Well, I have actually never queued any omap2+ dts patches myself, and I
> > > > > don't think there would be too many of those coming for next merge either.
> > > > 
> > > > OK will queue this series then. For the other ones from Benoit
> > > > looks like we need an immutable clock branch before I can apply
> > > > anything.
> > > 
> > > Tony, Tero,
> > > 
> > > Are these merged anyware now?
> > > I still don't see any of these on linux-next?
> > 
> > Tero any news on getting some immutable clock changes branch done?
> > Looks like there are quite a few pending clock patches right now,
> > probably best to set them all into a branch that I can also merge
> > in.
> 
> Working on that now, have been forced to prioritize work lately. I can
> probably get the branch set-up on Monday and send a pull-req out assuming it
> is not too late for 5.6 already.

Yes it might be too late, but I'm applying these too into
omap-for-v5.6/ti-sysc-dt-cam.

Regards,

Tony
