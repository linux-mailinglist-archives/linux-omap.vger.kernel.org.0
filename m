Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0003257EF4
	for <lists+linux-omap@lfdr.de>; Thu, 27 Jun 2019 11:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbfF0JIO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Jun 2019 05:08:14 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:55572 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbfF0JIN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Jun 2019 05:08:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=uzmtbQiP/E97xcrmWaFV5+3QZltHTvJjVI9b3LB5D8I=; b=DjCAxcB+VswqaopA6VxTIMIZ9
        qSanT0W4LNOdqoeCAZKQUSQc++vRTWh/+KDCE+wS+MUmcCHm2U7uziaOfuJ4PkyGoDqXnkPOZl2FO
        +QJhTNUAtOKMhZol//VV351igMHoTtWfYiEDDBDCXsUuGE7+oDvtfGRuRontP4NdJvft8e5E66lkO
        My5iCENlCjoOj28Gy7ol1MY/UpAej7M8DY8TBZtL4ktV7vebZJpi/+8vnLuIFAsHopCJEPKaVyRnk
        TuYXKPuXa4ZCt1IvxfZffYi0ZSrq7Fa7navC9bT3S9n//Q1tmRsljkVLS8atS9y9rkb2tFC2dQLLE
        O026nmgvQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60044)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1hgQNq-0001v4-IT; Thu, 27 Jun 2019 10:08:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1hgQNl-0000Qa-GQ; Thu, 27 Jun 2019 10:07:53 +0100
Date:   Thu, 27 Jun 2019 10:07:53 +0100
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
Message-ID: <20190627090753.b5xfpnsicynnqj5c@shell.armlinux.org.uk>
References: <16f065ef-f4ac-46b4-de2a-6b5420ae873a@ti.com>
 <20190626125325.GA4744@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626125325.GA4744@lst.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jun 26, 2019 at 02:53:25PM +0200, Christoph Hellwig wrote:
> Hi Roger,
> 
> it seems the arm dma direct mapping code isn't doing the right thing
> here.  On other platforms that have > 4G memory we always use swiotlb
> for bounce buffering in case a device that can't DMA to all the memory.
> 
> Arm is the odd one out and uses its own dmabounce framework instead,
> but it seems like it doesn't get used in this case.  We need to make
> sure dmabounce (or swiotlb for that matter) is set up if > 32-bit
> addressing is supported.  I'm not really an arm platform expert,
> but some of those on the Cc list are and might chime in on how to
> do that.

dmabounce has only ever been used with specific devices that have weird
setups.  Otherwise, we've never expected what you describe on ARM.  I
also don't recognise your assertion about the way the DMA API should
behave as ever having been documented as a requirement for architectures
to implement.

dmabounce comes with it some serious issues that have been known to
cause OOMs with old kernels (which have never been solved), so that
really isn't the answer.

This kind of breakage that is now being reported is exactly the problem
that I thought would happen with your patches.

32-bit ARM is in maintenance only now, there is no longer any appetite
nor funding for development work on core code.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
