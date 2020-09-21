Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7757C271B01
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 08:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgIUGnd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 02:43:33 -0400
Received: from muru.com ([72.249.23.125]:44908 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbgIUGnd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Sep 2020 02:43:33 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B1D3F807A;
        Mon, 21 Sep 2020 06:43:25 +0000 (UTC)
Date:   Mon, 21 Sep 2020 09:44:18 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Russell King <linux@armlinux.org.uk>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM/omap1: switch to use dma_direct_set_offset for
 lbus DMA offsets
Message-ID: <20200921064418.GM7101@atomide.com>
References: <20200917173229.3311382-1-hch@lst.de>
 <20200917173229.3311382-2-hch@lst.de>
 <20200918054933.GK7101@atomide.com>
 <2184547.ElGaqSPkdT@z50>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2184547.ElGaqSPkdT@z50>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Janusz Krzysztofik <jmkrzyszt@gmail.com> [200919 22:29]:
> Hi Tony,
> 
> On Friday, September 18, 2020 7:49:33 A.M. CEST Tony Lindgren wrote:
> > * Christoph Hellwig <hch@lst.de> [200917 17:37]:
> > > Switch the omap1510 platform ohci device to use dma_direct_set_offset
> > > to set the DMA offset instead of using direct hooks into the DMA
> > > mapping code and remove the now unused hooks.
> > 
> > Looks nice to me :) I still can't test this probably for few more weeks
> > though but hopefully Aaro or Janusz (Added to Cc) can test it.
> 
> Works for me on Amstrad Delta (tested with a USB ethernet adapter).
> 
> Tested-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Great, good to hear! And thanks for testing it.

Christoph, feel free to queue this along with the other patches:

Acked-by: Tony Lindgren <tony@atomide.com>

Or let me know if you want me to pick it up.

Regards,

Tony
