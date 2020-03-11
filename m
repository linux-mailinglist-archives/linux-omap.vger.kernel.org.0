Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00EB7181C3B
	for <lists+linux-omap@lfdr.de>; Wed, 11 Mar 2020 16:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729646AbgCKPXw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Mar 2020 11:23:52 -0400
Received: from muru.com ([72.249.23.125]:59786 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729473AbgCKPXv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Mar 2020 11:23:51 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DBC0380CD;
        Wed, 11 Mar 2020 15:24:36 +0000 (UTC)
Date:   Wed, 11 Mar 2020 08:23:47 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Roger Quadros <rogerq@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, hch@lst.de, robin.murphy@arm.com,
        robh+dt@kernel.org, nm@ti.com, nsekhar@ti.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: dra7: Add bus_dma_limit for L3 bus
Message-ID: <20200311152347.GW37466@atomide.com>
References: <20200310115309.31354-1-rogerq@ti.com>
 <e7df4db7-6fe1-cfa4-841b-ddd395864bb8@ti.com>
 <20200310154829.GS37466@atomide.com>
 <d2e217a4-4a45-bc46-4610-84e6c8567d5f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2e217a4-4a45-bc46-4610-84e6c8567d5f@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Roger Quadros <rogerq@ti.com> [200311 07:21]:
> 
> 
> On 10/03/2020 17:48, Tony Lindgren wrote:
> > * Tero Kristo <t-kristo@ti.com> [200310 14:46]:
> > > On 10/03/2020 13:53, Roger Quadros wrote:
> > > > The L3 interconnect can access only 32-bits of address.
> > > > Add the dma-ranges property to reflect this limit.
> > > > 
> > > > This will ensure that no device under L3 is
> > > > given > 32-bit address for DMA.
> > > > 
> > > > Issue was observed only with SATA on DRA7-EVM with 4GB RAM
> > > > and CONFIG_ARM_LPAE enabled. This is because the controller
> > > > can perform 64-bit DMA and was setting the dma_mask to 64-bit.
> > > > 
> > > > Setting the correct bus_dma_limit fixes the issue.
> > > 
> > > This seems kind of messy to modify almost every DT node because of this....
> > > Are you sure this is the only way to get it done? No way to modify the sata
> > > node only which is impacted somehow?
> > > 
> > > Also, what if you just pass 0xffffffff to the dma-ranges property? That
> > > would avoid modifying every node I guess.
> > 
> > Also, I think these interconnects are not limited to 32-bit access.
> 
> But from Table 2-1. L3_MAIN Memory Map
> 
> Start address	0x0000_0000
> End address	0xFFFF_FFFF
> 
> So it is 32-bit limit, right?

Hmm so what war Robin saying earlier that DMA access seems to be
limited to lower 2GB only though?

Regards,

Tony
