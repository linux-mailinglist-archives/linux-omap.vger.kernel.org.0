Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC23100D6F
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 22:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfKRVKF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 16:10:05 -0500
Received: from muru.com ([72.249.23.125]:42754 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726664AbfKRVKF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 18 Nov 2019 16:10:05 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1C25380BF;
        Mon, 18 Nov 2019 21:10:41 +0000 (UTC)
Date:   Mon, 18 Nov 2019 13:10:01 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: dra7: fix cpsw mdio fck clock
Message-ID: <20191118211001.GC35479@atomide.com>
References: <20191118122016.22215-1-grygorii.strashko@ti.com>
 <20191118145000.GA35479@atomide.com>
 <3e4ebb75-52c0-883b-e2f2-1252dcbfff1f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e4ebb75-52c0-883b-e2f2-1252dcbfff1f@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [191118 21:09]:
> 
> 
> On 18/11/2019 16:50, Tony Lindgren wrote:
> > * Grygorii Strashko <grygorii.strashko@ti.com> [191118 12:20]:
> > > The DRA7 CPSW MDIO functional clock (gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0)
> > > is specified incorrectly, which is caused incorrect MDIO bus clock
> > > configuration MDCLK. The correct CPSW MDIO functional clock is
> > > gmac_main_clk (125MHz), which is the same as CPSW fck. Hence fix it.
> > 
> > OK. Is this dra7 only, or are the other mdio clocks changed in commit
> > 1faa415c9c6e wrong too?
> 
> only DRA7.

OK thanks for confirming that.

Tony
