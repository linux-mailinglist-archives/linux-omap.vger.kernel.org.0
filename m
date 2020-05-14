Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DCF1D3E56
	for <lists+linux-omap@lfdr.de>; Thu, 14 May 2020 22:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728465AbgENUCZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 May 2020 16:02:25 -0400
Received: from muru.com ([72.249.23.125]:54602 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727850AbgENUCZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 May 2020 16:02:25 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9C98380C0;
        Thu, 14 May 2020 20:03:12 +0000 (UTC)
Date:   Thu, 14 May 2020 13:02:19 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Tero Kristo <t-kristo@ti.com>, Jason Yan <yanaijie@huawei.com>,
        mturquette@baylibre.com, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH] clk: ti: dra7: remove two unused symbols
Message-ID: <20200514200219.GQ37466@atomide.com>
References: <20200417073523.42520-1-yanaijie@huawei.com>
 <20200417153342.GP37466@atomide.com>
 <158948631725.215346.11486245758636089798@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158948631725.215346.11486245758636089798@swboyd.mtv.corp.google.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Stephen Boyd <sboyd@kernel.org> [200514 19:59]:
> Quoting Tony Lindgren (2020-04-17 08:33:42)
> > Tero,
> > 
> > * Jason Yan <yanaijie@huawei.com> [200417 07:09]:
> > > Fix the following gcc warning:
> > > 
> > > drivers/clk/ti/clk-7xx.c:320:43: warning: \u2018dra7_gpu_sys_clk_data\u2019
> > > defined but not used [-Wunused-const-variable=]
> > >  static const struct omap_clkctrl_div_data dra7_gpu_sys_clk_data
> > > __initconst = {
> > >                                            ^~~~~~~~~~~~~~~~~~~~~
> > > drivers/clk/ti/clk-7xx.c:315:27: warning: \u2018dra7_gpu_sys_clk_parents\u2019
> > > defined but not used [-Wunused-const-variable=]
> > >  static const char * const dra7_gpu_sys_clk_parents[] __initconst = {
> > >                            ^~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Looks like this started happening with commit 957ad44ff5f2
> > ("clk: ti: add clkctrl data dra7 sgx") as I did it based on
> > omap5. But the clocks seem slightly different, care to check
> > sgx clocking against the TRM in case I also messed up something
> > else?
> 
> Is that an ack?

Acked-by: Tony Lindgren <tony@atomide.com>
