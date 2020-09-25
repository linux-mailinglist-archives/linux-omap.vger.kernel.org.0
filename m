Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 938D5277ED6
	for <lists+linux-omap@lfdr.de>; Fri, 25 Sep 2020 06:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgIYEQI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 25 Sep 2020 00:16:08 -0400
Received: from verein.lst.de ([213.95.11.211]:54550 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726758AbgIYEQI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 25 Sep 2020 00:16:08 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 0761A68AFE; Fri, 25 Sep 2020 06:16:05 +0200 (CEST)
Date:   Fri, 25 Sep 2020 06:16:04 +0200
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
Message-ID: <20200925041604.GB9419@lst.de>
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

I've pulled it in now that the other patches are unlikely to be
tested in time for 5.10.
