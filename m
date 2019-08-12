Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADFA089EE7
	for <lists+linux-omap@lfdr.de>; Mon, 12 Aug 2019 14:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfHLMyo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Aug 2019 08:54:44 -0400
Received: from muru.com ([72.249.23.125]:56986 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbfHLMyo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 12 Aug 2019 08:54:44 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E449F80CC;
        Mon, 12 Aug 2019 12:55:10 +0000 (UTC)
Date:   Mon, 12 Aug 2019 05:54:40 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] mach-omap2/devices.c: set dma mask
Message-ID: <20190812125440.GD52127@atomide.com>
References: <7d079362-3881-6890-3e1f-71aeee06f4fc@xs4all.nl>
 <3c9077dc-3092-43b6-d58f-de9983da6c44@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c9077dc-3092-43b6-d58f-de9983da6c44@xs4all.nl>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Hans Verkuil <hverkuil@xs4all.nl> [190812 12:50]:
> On 7/30/19 8:17 AM, Hans Verkuil wrote:
> > The dma_mask and coherent_dma_mask values were never set.
> > 
> > This prevented the media omap_vout driver from loading successfully.
> > 
> > Tested on a Pandaboard and Beagle XM board.
> > 
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Tony, can you pick this up? Or give an Ack so that it can be merged via
> the media subsystem if you prefer?

Sorry for the delays on this one. Please just merge
it via via the media susbsystem since you need it:

Acked-by: Tony Lindgren <tony@atomide.com>

> > ---
> >  arch/arm/mach-omap2/devices.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
> > index cc0d08dad141..5a2e198e7db1 100644
> > --- a/arch/arm/mach-omap2/devices.c
> > +++ b/arch/arm/mach-omap2/devices.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/io.h>
> >  #include <linux/clk.h>
> > +#include <linux/dma-mapping.h>
> >  #include <linux/err.h>
> >  #include <linux/slab.h>
> >  #include <linux/of.h>
> > @@ -43,11 +44,17 @@ static struct resource omap_vout_resource[2] = {
> >  };
> >  #endif
> > 
> > +static u64 omap_vout_dma_mask = DMA_BIT_MASK(32);
> > +
> >  static struct platform_device omap_vout_device = {
> >  	.name		= "omap_vout",
> >  	.num_resources	= ARRAY_SIZE(omap_vout_resource),
> >  	.resource 	= &omap_vout_resource[0],
> >  	.id		= -1,
> > +	.dev		= {
> > +		.dma_mask		= &omap_vout_dma_mask,
> > +		.coherent_dma_mask	= DMA_BIT_MASK(32),
> > +	},
> >  };
> > 
> >  int __init omap_init_vout(void)
> > 
> 
