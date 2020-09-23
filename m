Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2108E275514
	for <lists+linux-omap@lfdr.de>; Wed, 23 Sep 2020 12:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgIWKFv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Sep 2020 06:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWKFu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Sep 2020 06:05:50 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE48C0613CE;
        Wed, 23 Sep 2020 03:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=R+6pH9MDXo8iBZE23VD1Qz4m/pWUZJggcrrvmXTMzlM=; b=ExALYf+eJ59NgDjFaLDDQWGEv
        kB/1C35EtyKiUIkhcLpRwt2PDcrbvVbTxhs5IFERtgqltUk4aum3IZLfl3DHn6oOk9imExkrI/DfF
        mhzaVNsUaMpkkbLQhXKHTfbSg+y1REpp59J3d6P0iUGuK+hCHce1nXIJLzjTZYeRCszvJQrLToSs/
        oNJZZEEsiAO8/Qqf+ddRW6OOUdIs6920AV7bpoyEPBvg5E6hV5Dp93UemFxEtQR7f1J/JJ2Wm7pWb
        MCUqyTvOeTNTsDJry0yRevPBt1739ZZIX6np7q6l66wqe3+7/ZHiM+bdessUmZturVDq2QUPP4Dpl
        6rGa0uQ7A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37216)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1kL1eW-0003vf-NC; Wed, 23 Sep 2020 11:05:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1kL1eQ-0003HJ-Ot; Wed, 23 Sep 2020 11:05:26 +0100
Date:   Wed, 23 Sep 2020 11:05:26 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Tony Lindgren <tony@atomide.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM/omap1: switch to use dma_direct_set_offset for
 lbus DMA offsets
Message-ID: <20200923100526.GD1559@shell.armlinux.org.uk>
References: <20200917173229.3311382-1-hch@lst.de>
 <20200917173229.3311382-2-hch@lst.de>
 <20200918054933.GK7101@atomide.com>
 <2184547.ElGaqSPkdT@z50>
 <20200921064418.GM7101@atomide.com>
 <20200921064723.GA18559@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921064723.GA18559@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 21, 2020 at 08:47:23AM +0200, Christoph Hellwig wrote:
> On Mon, Sep 21, 2020 at 09:44:18AM +0300, Tony Lindgren wrote:
> > * Janusz Krzysztofik <jmkrzyszt@gmail.com> [200919 22:29]:
> > > Hi Tony,
> > > 
> > > On Friday, September 18, 2020 7:49:33 A.M. CEST Tony Lindgren wrote:
> > > > * Christoph Hellwig <hch@lst.de> [200917 17:37]:
> > > > > Switch the omap1510 platform ohci device to use dma_direct_set_offset
> > > > > to set the DMA offset instead of using direct hooks into the DMA
> > > > > mapping code and remove the now unused hooks.
> > > > 
> > > > Looks nice to me :) I still can't test this probably for few more weeks
> > > > though but hopefully Aaro or Janusz (Added to Cc) can test it.
> > > 
> > > Works for me on Amstrad Delta (tested with a USB ethernet adapter).
> > > 
> > > Tested-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > 
> > Great, good to hear! And thanks for testing it.
> > 
> > Christoph, feel free to queue this along with the other patches:
> > 
> > Acked-by: Tony Lindgren <tony@atomide.com>
> > 
> > Or let me know if you want me to pick it up.
> 
> I'd prefer to pick it up through the dma-mapping tree, but preferably
> I'd pick the whole series up once Russell has tested footwinder.

I don't think that's going to happen very soon... seems way too much
effort to pull down the appropriate tree to build and test.  Sorry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
