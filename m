Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD842166554
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 18:52:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbgBTRwy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 12:52:54 -0500
Received: from muru.com ([72.249.23.125]:56406 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728119AbgBTRwy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 Feb 2020 12:52:54 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F1F268080;
        Thu, 20 Feb 2020 17:53:38 +0000 (UTC)
Date:   Thu, 20 Feb 2020 09:52:51 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: dra7xx-clocks: Fixup IPU1 mux clock parent
 source
Message-ID: <20200220175251.GO37466@atomide.com>
References: <20200211155103.23973-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211155103.23973-1-s-anna@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [200211 07:52]:
> The IPU1 functional clock is the output of a mux clock (represented
> by ipu1_gfclk_mux previously) and the clock source for this has been
> updated to be sourced from dpll_core_h22x2_ck in commit 39879c7d963e
> ("ARM: dts: dra7xx-clocks: Source IPU1 functional clock from CORE DPLL").
> ipu1_gfclk_mux is an obsolete clock now with the clkctrl conversion,
> and this clock source parenting is lost during the new clkctrl layout
> conversion.
> 
> Remove this stale clock and fix up the clock source for this mux
> clock using the latest equivalent clkctrl clock. This restores the
> previous logic and ensures that the IPU1 continues to run at the
> same frequency of IPU2 and independent of the ABE DPLL.
> 
> Fixes: b5f8ffbb6fad ("ARM: dts: dra7: convert to use new clkctrl layout")
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> Hi Tony,
> 
> Patch on top of 5.6-rc1. Appreciate it if you can include it for the 5.6-rc
> cycle.

OK applying into fixes thanks.

Tony
