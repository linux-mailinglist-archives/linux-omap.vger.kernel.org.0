Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C137F944C
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 16:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbfKLPbI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 10:31:08 -0500
Received: from muru.com ([72.249.23.125]:41826 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726376AbfKLPbI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 Nov 2019 10:31:08 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4077680F3;
        Tue, 12 Nov 2019 15:31:44 +0000 (UTC)
Date:   Tue, 12 Nov 2019 07:31:04 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 03/10] ARM: OMAP: DRA7xx: Make CAM clock domain SWSUP
 only
Message-ID: <20191112153104.GG5610@atomide.com>
References: <20191112142753.22976-1-bparrot@ti.com>
 <20191112142753.22976-4-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112142753.22976-4-bparrot@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Benoit Parrot <bparrot@ti.com> [191112 14:25]:
> Both CAL and VIP rely on this clock domain. But CAL DPHY require
> LVDSRX_96M_GFCLK to be active. When this domain is set to HWSUP the
> LVDSRX_96M_GFCLK is on;y active when VIP1 clock is also active.  If only
> CAL on DRA72x (which uses the VIP2 clkctrl) probes the CAM domain is
> enabled but the LVDSRX_96M_GFCLK is left gated. Since LVDSRX_96M_GFCLK
> is sourcing the input clock to the DPHY then actual frame capture cannot
> start as the phy are inactive.
> 
> So we either have to also enabled VIP1 even if we don't intend on using
> it or we need to set the CAM domain to use SWSUP only.
> 
> This patch implements the latter.

Best that Tero picks up this one too if OK:

Acked-by: Tony Lindgren <tony@atomide.com>
