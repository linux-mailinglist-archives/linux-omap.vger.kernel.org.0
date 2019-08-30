Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56148A3350
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2019 11:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfH3JCd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Aug 2019 05:02:33 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46733 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfH3JCd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Aug 2019 05:02:33 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i3cnd-0001ch-AU; Fri, 30 Aug 2019 11:02:29 +0200
Message-ID: <1567155748.3714.1.camel@pengutronix.de>
Subject: Re: [PATCHv2 02/11] soc: ti: add initial PRM driver with reset
 control support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Tero Kristo <t-kristo@ti.com>, ssantosh@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        robh+dt@kernel.org
Cc:     tony@atomide.com, s-anna@ti.com, devicetree@vger.kernel.org
Date:   Fri, 30 Aug 2019 11:02:28 +0200
In-Reply-To: <049da607-c352-4ed1-9a2d-2374d7a7e372@ti.com>
References: <20190828071941.32378-1-t-kristo@ti.com>
         <20190828071941.32378-3-t-kristo@ti.com>
         <1567084339.5345.7.camel@pengutronix.de>
         <049da607-c352-4ed1-9a2d-2374d7a7e372@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tero,

On Fri, 2019-08-30 at 10:28 +0300, Tero Kristo wrote:
> On 29/08/2019 16:12, Philipp Zabel wrote:
[...]
> > I wonder if splitting rstctrl/rstst/rstmap out into a separate structure
> > would make sense. That could be linked from omap_reset_data directly.
> > That only makes sense if there'd be enough cases where it can be reused
> > for multiple PRMs instances.
> 
> Hmm, splitting these out would make it possible to share the bits for 
> ipu:s across devices, same for dsp:s and eve:s.
> 
> However, adding too many levels of abstraction makes it kind of 
> difficult to follow what is happening with the code, and it would only 
> save maybe ~100 bytes of memory at the moment.

Good point, that is likely not worth the additional complexity.

[...]
> > What does the value read from the rstst register indicate? Is it the
> > current state of the reset line? Is it 0 until deassertion is completed,
> > and then it turns to 1?
> 
> Value of 1 indicates that the corresponding IP has been reset 
> successfully. Writing back 1 to the same bit clears it out, so the 
> status can be polled later on.

Then this should not be returned directly by reset_control_status:

/**
 * reset_control_status - returns a negative errno if not supported, a                                                                        
 * positive value if the reset line is asserted, or zero if the reset
 * line is not asserted or if the desc is NULL (optional reset).
 */

This should return 0 only if the control bit is deasserted and the
status bit is already set.

If either the control bit is asserted, or if the status bit is still
cleared, this should return 1.

[...]
> > > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +	if (!res)
> > > +		return -ENODEV;
> > 
> > This can be merged with devm_ioremap_resource below.
> 
> Well, I actually use the "res" later on to map the DT node to the 
> corresponding prm_data based on address.

Ok. I glanced over the data->base loop below after questioning whether
it is needed at all.

> > 
> > > +	match = of_match_device(omap_prm_id_table, &pdev->dev);
> > > +	if (!match)
> > > +		return -ENOTSUPP;
> > > +
> > > +	prm = devm_kzalloc(&pdev->dev, sizeof(*prm), GFP_KERNEL);
> > > +	if (!prm)
> > > +		return -ENOMEM;
> > > +
> > > +	data = match->data;
> > > +
> > > +	while (data->base != res->start) {
> > > +		if (!data->base)
> > > +			return -EINVAL;
> > > +		data++;
> > > +	}
> > 
> > Is this not something that you want to have encoded in the compatible
> > string? They all have a different register layout.
> 
> With the addition of all the prm instances later on, this changes. Most 
> of the prm instances will have same register layout then. See v1 data 
> that was posted earlier [1], but which I dropped for now to keep this 
> series isolated for reset handling only. In this patch, you see that for 
> DRA7, all the power domain handling related PRM instances have identical 
> register layout, they just differ based on base address.
>
> [1] https://www.spinics.net/lists/linux-omap/msg149872.html
> 
> It would be possible to encode all of this based on different 
> compatibles, but then the amount of different compatible strings would 
> explode... DRA7 is just one SoC.

I see only 3 different layouts in that patch. All instances with
identical layout could share the same compatible.

Either way, that is DT bindings territory, and not for me to decide. I
just found it unusual to encode the device type by its base address in
the driver.

> > 
> > > +
> > > +	prm->data = data;
> > > +
> > > +	prm->base = devm_ioremap_resource(&pdev->dev, res);
> > 
> > 	prm->base = devm_platform_ioremap_resource(pdev, 0);
> 
> I still need the "res" pointer as indicated above.

Got it. If the lookup by base address is needed, this has to stay split.

regards
Philipp
