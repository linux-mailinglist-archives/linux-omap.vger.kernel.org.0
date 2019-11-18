Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 656DA1007A4
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 15:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbfKROuT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 09:50:19 -0500
Received: from muru.com ([72.249.23.125]:42688 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726668AbfKROuT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 18 Nov 2019 09:50:19 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 027A480BF;
        Mon, 18 Nov 2019 14:50:55 +0000 (UTC)
Date:   Mon, 18 Nov 2019 06:50:00 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: dra7: fix cpsw mdio fck clock
Message-ID: <20191118145000.GA35479@atomide.com>
References: <20191118122016.22215-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118122016.22215-1-grygorii.strashko@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [191118 12:20]:
> The DRA7 CPSW MDIO functional clock (gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0)
> is specified incorrectly, which is caused incorrect MDIO bus clock
> configuration MDCLK. The correct CPSW MDIO functional clock is
> gmac_main_clk (125MHz), which is the same as CPSW fck. Hence fix it.

OK. Is this dra7 only, or are the other mdio clocks changed in commit
1faa415c9c6e wrong too?

Regards,

Tony

