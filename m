Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC69130462
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2020 21:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgADU3F (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 4 Jan 2020 15:29:05 -0500
Received: from fgw23-4.mail.saunalahti.fi ([62.142.5.110]:15365 "EHLO
        fgw23-4.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726118AbgADU3F (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 4 Jan 2020 15:29:05 -0500
Received: from darkstar.musicnaut.iki.fi (85-76-82-2-nat.elisa-mobile.fi [85.76.82.2])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id d7f39843-2f30-11ea-90c5-005056bdfda7;
        Sat, 04 Jan 2020 22:29:02 +0200 (EET)
Date:   Sat, 4 Jan 2020 22:29:01 +0200
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     kyungmin.park@samsung.com, miquel.raynal@bootlin.com,
        vigneshr@ti.com, hns@goldelico.com, tony@atomide.com,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] mtd: onenand: omap2: Pass correct flags for
 prep_dma_memcpy
Message-ID: <20200104202901.GI15023@darkstar.musicnaut.iki.fi>
References: <20200104073453.16077-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200104073453.16077-1-peter.ujfalusi@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Sat, Jan 04, 2020 at 09:34:53AM +0200, Peter Ujfalusi wrote:
> The commit converting the driver to DMAengine was missing the flags for
> the memcpy prepare call.
> It went unnoticed since the omap-dma drive was ignoring them.
> 
> Fixes: 3ed6a4d1de2c5 (" mtd: onenand: omap2: Convert to use dmaengine for memcp")
> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> Hi,
> 
> Aaro reported [1] a failure on omap2-onenand pointing to
> 4689d35c765c696bdf0535486a990038b242a26b. It looks like the root cause is the
> conversion of omap2-onenand to DMAengine which missed the flags.
> 
> Basically the client is waiting for a callback without asking for it. This
> certainly causes timeout.
> 
> I have not tested the patch, but it should fix the issue.

This fixes the issue on Nokia boards.

Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Thanks,

A.
