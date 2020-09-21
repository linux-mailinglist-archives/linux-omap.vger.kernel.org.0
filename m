Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79210271B0C
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 08:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgIUGr2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 02:47:28 -0400
Received: from verein.lst.de ([213.95.11.211]:38657 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbgIUGr1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 02:47:27 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id C048A68AFE; Mon, 21 Sep 2020 08:47:23 +0200 (CEST)
Date:   Mon, 21 Sep 2020 08:47:23 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Russell King <linux@armlinux.org.uk>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM/omap1: switch to use dma_direct_set_offset for
 lbus DMA offsets
Message-ID: <20200921064723.GA18559@lst.de>
References: <20200917173229.3311382-1-hch@lst.de> <20200917173229.3311382-2-hch@lst.de> <20200918054933.GK7101@atomide.com> <2184547.ElGaqSPkdT@z50> <20200921064418.GM7101@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921064418.GM7101@atomide.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 21, 2020 at 09:44:18AM +0300, Tony Lindgren wrote:
> * Janusz Krzysztofik <jmkrzyszt@gmail.com> [200919 22:29]:
> > Hi Tony,
> > 
> > On Friday, September 18, 2020 7:49:33 A.M. CEST Tony Lindgren wrote:
> > > * Christoph Hellwig <hch@lst.de> [200917 17:37]:
> > > > Switch the omap1510 platform ohci device to use dma_direct_set_offset
> > > > to set the DMA offset instead of using direct hooks into the DMA
> > > > mapping code and remove the now unused hooks.
> > > 
> > > Looks nice to me :) I still can't test this probably for few more weeks
> > > though but hopefully Aaro or Janusz (Added to Cc) can test it.
> > 
> > Works for me on Amstrad Delta (tested with a USB ethernet adapter).
> > 
> > Tested-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> 
> Great, good to hear! And thanks for testing it.
> 
> Christoph, feel free to queue this along with the other patches:
> 
> Acked-by: Tony Lindgren <tony@atomide.com>
> 
> Or let me know if you want me to pick it up.

I'd prefer to pick it up through the dma-mapping tree, but preferably
I'd pick the whole series up once Russell has tested footwinder.
