Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC3C298D99
	for <lists+linux-omap@lfdr.de>; Mon, 26 Oct 2020 14:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403810AbgJZNOm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Oct 2020 09:14:42 -0400
Received: from muru.com ([72.249.23.125]:46800 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394178AbgJZNNp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Oct 2020 09:13:45 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D518F80AA;
        Mon, 26 Oct 2020 13:13:46 +0000 (UTC)
Date:   Mon, 26 Oct 2020 15:13:38 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/9] Genpd related code changes to drop am335x pdata
Message-ID: <20201026131338.GC5639@atomide.com>
References: <20201026111049.54835-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026111049.54835-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [201026 11:11]:
> Hi all,
> 
> Here are the code related changes for v5.11 merge window to drop the
> remaining am335x platform data. I'll be posting the related device tree
> changes separately.

Sorry I forgot to mention that this series depends also on a series of
fixes posted earlier at [1].

Also, the related dts changes are now posted at [2], and I've also
pushed out an initial branch for easier testing at [3].

Regards,

Tony

[1] https://lore.kernel.org/linux-omap/20201026105812.38418-1-tony@atomide.com/T/#t
[2] https://lore.kernel.org/linux-omap/20201026131007.GB5639@atomide.com/T/#t
[3] https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/?h=omap-for-v5.11/genpd
