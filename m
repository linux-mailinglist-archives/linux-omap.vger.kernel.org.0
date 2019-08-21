Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2238497E3B
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2019 17:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfHUPKq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Aug 2019 11:10:46 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:52529 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727134AbfHUPKq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Aug 2019 11:10:46 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i0SFy-0001Rj-L8; Wed, 21 Aug 2019 17:10:38 +0200
Message-ID: <1566400237.4193.15.camel@pengutronix.de>
Subject: Re: [PATCH 2/8] soc: ti: add initial PRM driver with reset control
 support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Keerthy <j-keerthy@ti.com>, ssantosh@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        robh+dt@kernel.org
Cc:     tony@atomide.com, devicetree@vger.kernel.org
Date:   Wed, 21 Aug 2019 17:10:37 +0200
In-Reply-To: <a4196b73-63a0-f9d8-1c43-e6c4d1c1d6a4@ti.com>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
         <1565164139-21886-3-git-send-email-t-kristo@ti.com>
         <3b76f0e0-7530-e7b5-09df-2de9956f30ee@ti.com>
         <59709a2d-f13a-bd55-8aba-864c1cf2f19e@ti.com>
         <9372957c-9ab9-b0dd-fe07-815eb2cb2f16@ti.com>
         <0f335aec-bfdf-345a-8dfb-dad70aef1af6@ti.com>
         <a4196b73-63a0-f9d8-1c43-e6c4d1c1d6a4@ti.com>
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

On Tue, 2019-08-20 at 11:47 -0500, Suman Anna wrote:
> On 8/20/19 2:37 AM, Tero Kristo wrote:
> > On 20.8.2019 2.01, Suman Anna wrote:
> > > Hi Tero,
> > > 
> > > On 8/19/19 4:32 AM, Tero Kristo wrote:
[...]
> > > > > > +{
> > > > > > +    struct omap_reset_data *reset;
> > > > > > +
> > > > > > +    /*
> > > > > > +     * Check if we have resets. If either rstctl or rstst is
> > > > > > +     * non-zero, we have reset registers in place. Additionally
> > > > > > +     * the flag OMAP_PRM_NO_RSTST implies that we have resets.
> > > > > > +     */
> > > > > > +    if (!prm->data->rstctl && !prm->data->rstst &&
> > > > > > +        !(prm->data->flags & OMAP_PRM_NO_RSTST))
> > > > > > +        return 0;
> > > > > > +
> > > > > > +    reset = devm_kzalloc(&pdev->dev, sizeof(*reset), GFP_KERNEL);
> > > > > > +    if (!reset)
> > > > > > +        return -ENOMEM;
> > > > > > +
> > > > > > +    reset->rcdev.owner = THIS_MODULE;
> > > > > > +    reset->rcdev.ops = &omap_reset_ops;
> > > > > > +    reset->rcdev.of_node = pdev->dev.of_node;
> > > > > > +    reset->rcdev.nr_resets = OMAP_MAX_RESETS;
> > > 
> > > Suggest adding a number of resets to prm->data, and using it so that we
> > > don't even entertain any resets beyond the actual number of resets.
> > 
> > Hmm why bother? Accessing a stale reset bit will just cause access to a
> > reserved bit in the reset register, doing basically nothing. Also, this
> > would not work for am3/am4 wkup, as there is a single reset bit at an
> > arbitrary position.
> 
> The generic convention seems to be defining a reset id value defined
> from include/dt-bindings/reset/ that can be used to match between the
> dt-nodes and the reset-controller driver.
> 
> Philipp,
> Any comments?

Are there only reset bits and reserved bits in the range accessible by
[0..OMAP_MAX_RESETS] or are ther bits with another function as well?
If the latter is the case, I would prefer enumerating the resets in a
dt-bindings header, with the driver containing an enum -> reg/bit
position lookup table.

In general, assuming the device tree contains no errors, this should not
matter much, but I think it is nice if the reset driver, even with a
misconfigured device tree, can't write into arbitrary bit fields.

regards
Philipp
