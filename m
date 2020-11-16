Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44F432B3F4B
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 10:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgKPJAi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 04:00:38 -0500
Received: from muru.com ([72.249.23.125]:48366 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726849AbgKPJAh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 04:00:37 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F2CD680C8;
        Mon, 16 Nov 2020 09:00:42 +0000 (UTC)
Date:   Mon, 16 Nov 2020 11:00:33 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     t-kristo@ti.com, mturquette@baylibre.com, sboyd@kernel.org,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: ti: Fix memleak in ti_fapll_synth_setup
Message-ID: <20201116090033.GA26857@atomide.com>
References: <20201113131623.2098222-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113131623.2098222-1-zhangqilong3@huawei.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Zhang Qilong <zhangqilong3@huawei.com> [201113 13:13]:
> If clk_register fails, we should goto free branch
> before function returns to prevent memleak.
> 
> Fixes: 163152cbbe321 ("clk: ti: Add support for FAPLL on dm816x")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Acked-by: Tony Lindgren <tony@atomide.com>
