Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBA0C184A52
	for <lists+linux-omap@lfdr.de>; Fri, 13 Mar 2020 16:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgCMPPU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Mar 2020 11:15:20 -0400
Received: from muru.com ([72.249.23.125]:60028 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726534AbgCMPPU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 13 Mar 2020 11:15:20 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F35F48087;
        Fri, 13 Mar 2020 15:16:05 +0000 (UTC)
Date:   Fri, 13 Mar 2020 08:15:16 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Roger Quadros <rogerq@ti.com>, hch@lst.de, robh+dt@kernel.org,
        nm@ti.com, t-kristo@ti.com, nsekhar@ti.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2] ARM: dts: dra7: Add bus_dma_limit for L3 bus
Message-ID: <20200313151516.GB37466@atomide.com>
References: <20200313094717.6671-1-rogerq@ti.com>
 <fb916d06-1521-25a5-2eae-94244a3f9d06@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb916d06-1521-25a5-2eae-94244a3f9d06@arm.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Robin Murphy <robin.murphy@arm.com> [200313 15:06]:
> On 2020-03-13 9:47 am, Roger Quadros wrote:
> > The L3 interconnect's memory map is from 0x0 to
> > 0xffffffff. Out of this, System memory (SDRAM) can be
> > accessed from 0x80000000 to 0xffffffff (2GB)
> > 
> > DRA7 does support 4GB of SDRAM but upper 2GB can only be
> > accessed by the MPU subsystem.
> > 
> > Add the dma-ranges property to reflect the physical address limit
> > of the L3 bus.
> > 
> > Issues ere observed only with SATA on DRA7-EVM with 4GB RAM
> > and CONFIG_ARM_LPAE enabled. This is because the controller
> > supports 64-bit DMA and its driver sets the dma_mask to 64-bit
> > thus resulting in DMA accesses beyond L3 limit of 2G.
> > 
> > Setting the correct bus_dma_limit fixes the issue.
> 
> Neat! In principle you should no longer need the specific dma-ranges on the
> PCIe nodes, since AIUI those really only represent a subset of this general
> limitation, but given the other inheritance issue you saw it's probably
> safer to leave them as-is for now.

Also, Roger, I think omap5 needs a similar patch too, right?
At least pyra has omap5 with 4GB and SATA connector.

> FWIW,
> 
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Sorry missed that as I just pushed out the fix.

Regards,

Tony
