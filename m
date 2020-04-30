Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30E91C07D1
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 22:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgD3UYm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Apr 2020 16:24:42 -0400
Received: from muru.com ([72.249.23.125]:52380 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726377AbgD3UYm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Apr 2020 16:24:42 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8A4DA8123;
        Thu, 30 Apr 2020 20:25:30 +0000 (UTC)
Date:   Thu, 30 Apr 2020 13:24:38 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-omap@vger.kernel.org
Subject: Re: [PATCH] clk: ti: clkctrl: convert subclocks to use proper names
 also
Message-ID: <20200430202438.GY37466@atomide.com>
References: <20200430083451.8562-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430083451.8562-1-t-kristo@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [200430 08:35]:
> Addition of the new internal API to get the clkctrl names missed adding
> the same conversion in place for the subclocks. This leads into missed
> parent/child relationships (i.e. orphaned clocks) with mixed node name
> handling, for example with omap4/omap5 where the l4_per clocks are using
> new naming, but rest are using old. Fix by converting the subclock
> registration to pick correct names for the clocks also.

OK, sorry for missing that part.

> Fixes: 6c3090520554 ("clk: ti: clkctrl: Fix hidden dependency to node name")
> Signed-off-by: Tero Kristo <t-kristo@ti.com>

Thanks for fixing it:

Acked-by: Tony Lindgren <tony@atomide.com>
