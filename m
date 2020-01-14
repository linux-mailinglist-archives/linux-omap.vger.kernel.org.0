Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F193213AE4C
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2020 17:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgANQE0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jan 2020 11:04:26 -0500
Received: from muru.com ([72.249.23.125]:50908 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbgANQE0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 14 Jan 2020 11:04:26 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 23E5D816C;
        Tue, 14 Jan 2020 16:05:07 +0000 (UTC)
Date:   Tue, 14 Jan 2020 08:04:22 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 0/3] ARM: dts: am43x-vpfe/ov2659.patch
Message-ID: <20200114160422.GQ5885@atomide.com>
References: <20191211140720.10539-1-bparrot@ti.com>
 <20191212174123.GF35479@atomide.com>
 <c4ae58dc-3c81-f493-a665-6926baa0f04c@ti.com>
 <20191213152938.GK35479@atomide.com>
 <20200113165413.i6nbi2i7xyue4fti@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113165413.i6nbi2i7xyue4fti@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Benoit Parrot <bparrot@ti.com> [200113 16:51]:
> Tony Lindgren <tony@atomide.com> wrote on Fri [2019-Dec-13 07:29:38 -0800]:
> > * Tero Kristo <t-kristo@ti.com> [191213 07:43]:
> > > On 12/12/2019 19:41, Tony Lindgren wrote:
> > > > * Benoit Parrot <bparrot@ti.com> [191211 06:04]:
> > > > > This patch series adds the missing camera endpoint (ov2659) as well as
> > > > > the required source clocks nodes for the sensor.
> > > > > 
> > > > > On the am437x-sk-evm the camera sensor is sourced from clkout1 but that
> > > > > clock nodes/tree was removed as it was unsed at the time, we are
> > > > > re-adding the needed clock nodes here.
> > > > 
> > > > Tero, it seems I can already pick this series?
> > > 
> > > I believe it is ready if you approve the clkout1 clock patch.
> > 
> > OK yeah looks fine.
> > 
> > > > Or ou want to queue the changes to am43xx-clocks.dtsi along with all
> > > > your other clock patches?
> > > 
> > > Well, I have actually never queued any omap2+ dts patches myself, and I
> > > don't think there would be too many of those coming for next merge either.
> > 
> > OK will queue this series then. For the other ones from Benoit
> > looks like we need an immutable clock branch before I can apply
> > anything.
> 
> Tony, Tero,
> 
> Are these merged anyware now?
> I still don't see any of these on linux-next?

Tero any news on getting some immutable clock changes branch done?
Looks like there are quite a few pending clock patches right now,
probably best to set them all into a branch that I can also merge
in.

> And by "these" I mean this one and both
>  ARM: dts: dra7: add vpe nodes
>  ARM: dts: dra7: add cal nodes

Yeah looks good to me other than the clock dependency.

Regards,

Tony
