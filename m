Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2C9678521
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jul 2019 08:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfG2GnW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Jul 2019 02:43:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:56784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726088AbfG2GnW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Jul 2019 02:43:22 -0400
Received: from localhost (unknown [122.178.221.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07343206BA;
        Mon, 29 Jul 2019 06:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564382601;
        bh=QmVZiVCVVdyuIOIXyrtNlQQDQrcJfU7dMvyEUty+IPs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bXmWlhMvHD6xcN7+Lm31x5rEuncHMBalyOq4wY58j5IQwnZlqAxmMNk07LDjFW0rW
         9PtitSv8mvAKbxYNAy+sRyyKM9BBl69xaBafwpwMD/GMF22lL2DJnwJh0KFCPVZFEW
         GL9ohHYcA81k0qzR9AA+p4+J8pfKH/mziknK4m2k=
Date:   Mon, 29 Jul 2019 12:12:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     dan.j.williams@intel.com, dmaengine@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v5 0/3] dmaengine: ti: edma: Polled completion support
Message-ID: <20190729064209.GF12733@vkoul-mobl.Dlink>
References: <20190716082655.1620-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716082655.1620-1-peter.ujfalusi@ti.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 16-07-19, 11:26, Peter Ujfalusi wrote:
> Hi,
> 
> Changes since v4:
> - Split the DMA_COMPLETE and !txstate check as Vinod suggested
> 
> Change since v3:
> - fix DMA pointer tracking for memcpy
> - completion polling is only done when it is asked by not providing
>   DMA_PREP_INTERRUPT for memcpy
> 
> Changes since v2:
> - Fix typo in the comment for patch 0
> 
> Changes since v1:
> - Cleanup patch for the array register handling
> - typo fixed in patch2 commit message
> 
> The code around the array register access was pretty confusing for the first
> look, so clean them up first then use the cleaner way in the polled handling.
> 
> When a DMA client driver does not set the DMA_PREP_INTERRUPT because it
> does not want to use interrupts for DMA completion or because it can not
> rely on DMA interrupts due to executing the memcpy when interrupts are
> disabled it will poll the status of the transfer.
> 
> Since we can not tell from any EDMA register that the transfer is
> completed, we can only know that the paRAM set has been sent to TPTC for
> processing we need to check the residue of the transfer, if it is 0 then
> the transfer is completed.
> 
> The polled completion can bve tested by applying:
> https://patchwork.kernel.org/patch/10966499/
> 
> Enabling the memcpy for EDMA and run the dmatest with polled = 1.
> 
> Or, enable the EDMA memcpy support and boot up any dra7 family device with
> display enabled. The workaround for DMM errata i878 uses polled DMA memcpy.

Applied, thanks. Fixed typo in 2nd patch while at it

-- 
~Vinod
