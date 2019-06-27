Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A075E57F10
	for <lists+linux-omap@lfdr.de>; Thu, 27 Jun 2019 11:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfF0JQD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Jun 2019 05:16:03 -0400
Received: from verein.lst.de ([213.95.11.211]:50889 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbfF0JQD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 27 Jun 2019 05:16:03 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 73FAB68B20; Thu, 27 Jun 2019 11:15:30 +0200 (CEST)
Date:   Thu, 27 Jun 2019 11:15:30 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Christoph Hellwig <hch@lst.de>, Roger Quadros <rogerq@ti.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>, axboe@kernel.dk,
        iommu@lists.linux-foundation.org, linux-ide@vger.kernel.org,
        linux-omap@vger.kernel.org, jejb@linux.ibm.com,
        martin.petersen@oracle.com, "Nori, Sekhar" <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: SATA broken with LPAE
Message-ID: <20190627091530.GA11809@lst.de>
References: <16f065ef-f4ac-46b4-de2a-6b5420ae873a@ti.com> <20190626125325.GA4744@lst.de> <20190627090753.b5xfpnsicynnqj5c@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627090753.b5xfpnsicynnqj5c@shell.armlinux.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jun 27, 2019 at 10:07:53AM +0100, Russell King - ARM Linux admin wrote:
> dmabounce has only ever been used with specific devices that have weird
> setups.  Otherwise, we've never expected what you describe on ARM.  I
> also don't recognise your assertion about the way the DMA API should
> behave as ever having been documented as a requirement for architectures
> to implement.

That requirement has basically always been there since at least the
2.6.x days.  The history here is that when 64-bit architectures showed
up they all had iommus, so this wasn't an issue.  Next was x86 with
highmem, which added special bounce buffering for block I/O and networking
only.  Then ia64 showed up that didn't always have an iommu and swiotlb
was added as a "software IOMMU".  At this point we had to bounce buffering
schemes for block and networking, while everything else potentially
DMAing to higher memory relied on swiotlb, which was picked up by
basically every architecture that could have memory not covered by a
32-bit mask and didn't have an iommu.  Except it seems arm never did
that and has been lucky as people didn't try anything that is not
block or networking on their extended physical address space.
