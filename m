Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9073817C142
	for <lists+linux-omap@lfdr.de>; Fri,  6 Mar 2020 16:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgCFPIl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Mar 2020 10:08:41 -0500
Received: from muru.com ([72.249.23.125]:59046 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726533AbgCFPIl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Mar 2020 10:08:41 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9B65B8027;
        Fri,  6 Mar 2020 15:09:25 +0000 (UTC)
Date:   Fri, 6 Mar 2020 07:08:37 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Roger Quadros <rogerq@ti.com>
Cc:     Robin Murphy <robin.murphy@arm.com>, Nishanth Menon <nm@ti.com>,
        yan-liu@ti.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Rob Herring <robh+dt@kernel.org>,
        "Nori, Sekhar" <nsekhar@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH] dra7: sata: Fix SATA with CONFIG_ARM_LPAE enabled
Message-ID: <20200306150837.GB37466@atomide.com>
References: <20200304090031.30360-1-rogerq@ti.com>
 <9cc75c26-bd8c-03ea-8f8d-7784fffb7a0a@arm.com>
 <eb4e97f2-9afd-41a9-e239-88798c326a86@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb4e97f2-9afd-41a9-e239-88798c326a86@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Roger Quadros <rogerq@ti.com> [200305 16:47]:
> +Nishanth
> 
> Robin,
> 
> On 05/03/2020 18:04, Robin Murphy wrote:
> > On 04/03/2020 9:00 am, Roger Quadros wrote:
> > > Even though the TRM says that SATA IP has 36 address bits
> > > wired in the SoC, we see bus errors whenever any address
> > > greater than 32-bit is given to the controller.
> > 
> > Actually, is it really just SATA? I pulled up a couple of DRA7xx TRMs out of curiosity - thanks for having such easy-to-access documentation by the way :) - and they both give me a clear impression that the entire L3_MAIN interconnect is limited to 32-bit addresses and thus pretty much all the DMA masters should only be able to touch the lower 2GB of DRAM. Especially the bit that explicitly says "This is a high address range (Q8 – Q15) that requires an address greater than 32 bits. This space is visible only for the MPU Subsystem."
> 
> You are right that L3 interconnect can only access first 2GB of DRAM.
> Which means we should add the bus_dma_limit to the entire L3 bus
> instead of just SATA?

OK makes sense to me.

> > Is it in fact the case that the SATA driver happens to be the only one to set a >32-bit DMA mask on your system?
> 
> This looks like the case. Other device drivers might not be overriding
> dma_mask at all thus using the default 32-bit dma_mask.

OK

Regards,

Tony
