Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 954B157FEF
	for <lists+linux-omap@lfdr.de>; Thu, 27 Jun 2019 12:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfF0KJe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Jun 2019 06:09:34 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:56390 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfF0KJe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Jun 2019 06:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=86sT2C5RZNFyRX03RBPoy/vTuuItxxevdJz6WedXrwM=; b=JGdVUKupW3eMIoDKOpLn5nBRI
        a+BSaNKyJ3m6YvkiyJCvu0A1tczoxqVOxhRcQYDtmPRFKBaTkhI3f8jInwKEh/ms3i/ptA8IK56UJ
        fIDTcccGbiM68yOyUb50YQgaQZaa9//9qpYeG7jEby2HgppwlBESvKY8VBgMVtoAc09NzxvTfWMeN
        RjJ/z8MmSaCBzQj4EBJj/EvVbN9ypAWCR6hYeSjloqbfNhpjglQxJzy+bUEyS+dbsuQ+Zjl+0tvWN
        hnQdtNZ/AAVu8QG4doa3Se8om4mIIEFrMPUKr4DCLKsKUcoDABJPyZdZJG8rw3yQ25XKQQEM9qxfH
        NkINpPtew==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60048)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1hgRLH-0002Gx-6T; Thu, 27 Jun 2019 11:09:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1hgRLD-0000Tg-BR; Thu, 27 Jun 2019 11:09:19 +0100
Date:   Thu, 27 Jun 2019 11:09:19 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Roger Quadros <rogerq@ti.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>, axboe@kernel.dk,
        iommu@lists.linux-foundation.org, linux-ide@vger.kernel.org,
        linux-omap@vger.kernel.org, jejb@linux.ibm.com,
        martin.petersen@oracle.com, "Nori, Sekhar" <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: SATA broken with LPAE
Message-ID: <20190627100919.jgvtkhbpbml342cp@shell.armlinux.org.uk>
References: <16f065ef-f4ac-46b4-de2a-6b5420ae873a@ti.com>
 <20190626125325.GA4744@lst.de>
 <20190627090753.b5xfpnsicynnqj5c@shell.armlinux.org.uk>
 <20190627091530.GA11809@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627091530.GA11809@lst.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jun 27, 2019 at 11:15:30AM +0200, Christoph Hellwig wrote:
> On Thu, Jun 27, 2019 at 10:07:53AM +0100, Russell King - ARM Linux admin wrote:
> > dmabounce has only ever been used with specific devices that have weird
> > setups.  Otherwise, we've never expected what you describe on ARM.  I
> > also don't recognise your assertion about the way the DMA API should
> > behave as ever having been documented as a requirement for architectures
> > to implement.
> 
> That requirement has basically always been there since at least the
> 2.6.x days.  The history here is that when 64-bit architectures showed
> up they all had iommus, so this wasn't an issue.  Next was x86 with
> highmem, which added special bounce buffering for block I/O and networking
> only.  Then ia64 showed up that didn't always have an iommu and swiotlb
> was added as a "software IOMMU".  At this point we had to bounce buffering
> schemes for block and networking, while everything else potentially
> DMAing to higher memory relied on swiotlb, which was picked up by
> basically every architecture that could have memory not covered by a
> 32-bit mask and didn't have an iommu.

If it wasn't documented...

> Except it seems arm never did
> that and has been lucky as people didn't try anything that is not
> block or networking on their extended physical address space.

Because no one knew that the requirement had been introduced, and we've
been reliant on all the code you've been stripping out.

You're now causing regressions on 32-bit ARM, so you get to fix it.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
