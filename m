Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56C571AE13A
	for <lists+linux-omap@lfdr.de>; Fri, 17 Apr 2020 17:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729128AbgDQPdp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Apr 2020 11:33:45 -0400
Received: from muru.com ([72.249.23.125]:49962 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728542AbgDQPdp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Apr 2020 11:33:45 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6AB2D8047;
        Fri, 17 Apr 2020 15:34:33 +0000 (UTC)
Date:   Fri, 17 Apr 2020 08:33:42 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Jason Yan <yanaijie@huawei.com>, mturquette@baylibre.com,
        sboyd@kernel.org, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH] clk: ti: dra7: remove two unused symbols
Message-ID: <20200417153342.GP37466@atomide.com>
References: <20200417073523.42520-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200417073523.42520-1-yanaijie@huawei.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tero,

* Jason Yan <yanaijie@huawei.com> [200417 07:09]:
> Fix the following gcc warning:
> 
> drivers/clk/ti/clk-7xx.c:320:43: warning: ‘dra7_gpu_sys_clk_data’
> defined but not used [-Wunused-const-variable=]
>  static const struct omap_clkctrl_div_data dra7_gpu_sys_clk_data
> __initconst = {
>                                            ^~~~~~~~~~~~~~~~~~~~~
> drivers/clk/ti/clk-7xx.c:315:27: warning: ‘dra7_gpu_sys_clk_parents’
> defined but not used [-Wunused-const-variable=]
>  static const char * const dra7_gpu_sys_clk_parents[] __initconst = {
>                            ^~~~~~~~~~~~~~~~~~~~~~~~

Looks like this started happening with commit 957ad44ff5f2
("clk: ti: add clkctrl data dra7 sgx") as I did it based on
omap5. But the clocks seem slightly different, care to check
sgx clocking against the TRM in case I also messed up something
else?

Regards,

Tony
