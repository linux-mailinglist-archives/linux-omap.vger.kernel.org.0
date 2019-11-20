Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF8C310424D
	for <lists+linux-omap@lfdr.de>; Wed, 20 Nov 2019 18:42:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbfKTRmz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 Nov 2019 12:42:55 -0500
Received: from muru.com ([72.249.23.125]:43080 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726675AbfKTRmy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 20 Nov 2019 12:42:54 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 48736811B;
        Wed, 20 Nov 2019 17:43:32 +0000 (UTC)
Date:   Wed, 20 Nov 2019 09:42:52 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: dra7: fix cpsw mdio fck clock
Message-ID: <20191120174252.GU35479@atomide.com>
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

* Grygorii Strashko <grygorii.strashko@ti.com> [191118 04:20]:
> The DRA7 CPSW MDIO functional clock (gmac_clkctrl DRA7_GMAC_GMAC_CLKCTRL 0)
> is specified incorrectly, which is caused incorrect MDIO bus clock
> configuration MDCLK. The correct CPSW MDIO functional clock is
> gmac_main_clk (125MHz), which is the same as CPSW fck. Hence fix it.

Thanks applying into omap-for-v5.5/dt.

Tony
