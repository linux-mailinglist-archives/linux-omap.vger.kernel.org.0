Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BECBB2B9391
	for <lists+linux-omap@lfdr.de>; Thu, 19 Nov 2020 14:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgKSNVW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Nov 2020 08:21:22 -0500
Received: from muru.com ([72.249.23.125]:48942 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726105AbgKSNVW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 19 Nov 2020 08:21:22 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7F6DE80C1;
        Thu, 19 Nov 2020 13:21:27 +0000 (UTC)
Date:   Thu, 19 Nov 2020 15:21:17 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Roger Quadros <rogerq@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/7] Configure genpd domains for omap4
Message-ID: <20201119132117.GP26857@atomide.com>
References: <20201119130720.63140-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119130720.63140-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [201119 13:09]:
> Hi all,
> 
> Here are few patches to configure genpd domains for omap4 and
> enable it for dss, dsp and iva. And we also drop gpmc legacy
> platform data while at it.

These depend on the earlier patches:

PATCH 2/4] ARM: OMAP2+: Fix missing select PM_GENERIC_DOMAINS_OF
[PATCHv2 0/9] Genpd related code changes to drop am335x pdata

To make testing things easier, I've pushed out these changes also
to a temporary test branch at [0][1] below.

Regards,

Tony

[0] git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git omap-for-v5.11/tmp-testing-genpd
[1] https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/?h=omap-for-v5.11/tmp-testing-genp
