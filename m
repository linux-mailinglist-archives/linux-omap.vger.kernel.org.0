Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 985451BEC07
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 00:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgD2WVq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 18:21:46 -0400
Received: from muru.com ([72.249.23.125]:52136 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbgD2WVq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 29 Apr 2020 18:21:46 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 43682810A;
        Wed, 29 Apr 2020 22:22:34 +0000 (UTC)
Date:   Wed, 29 Apr 2020 15:21:42 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: ti: couple of fixes towards 5.8
Message-ID: <20200429222142.GW37466@atomide.com>
References: <20200429131341.4697-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429131341.4697-1-t-kristo@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [200429 13:14]:
> Hi,
> 
> The issues fixed by these patches have been around for a while, so they
> can be picked up for 5.8.
> 
> Patch #1 fixes a memory leak within composite clock registration, which
> is only visible on platforms actually using composite clocks;
> omap4/omap5.

OK great thanks for chasing that one down.

> Last two patches fix parenting of the l4-secure clocks for omap4/omap5,
> which was apparenly missed when the clkctrl data for these domains was
> created.

Oops sorry about that. Looks like I totally missed adding the source
clocks for those.

For the whole series:

Acked-by: Tony Lindgren <tony@atomide.com>
