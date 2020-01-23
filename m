Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C612146EC1
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2020 17:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729497AbgAWQ56 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jan 2020 11:57:58 -0500
Received: from muru.com ([72.249.23.125]:52102 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726621AbgAWQ55 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Jan 2020 11:57:57 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D626E810A;
        Thu, 23 Jan 2020 16:58:39 +0000 (UTC)
Date:   Thu, 23 Jan 2020 08:57:54 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: [GIT PULL] clk: ti: changes for 5.6
Message-ID: <20200123165754.GA5885@atomide.com>
References: <71d3d7dd-115a-4584-e3d7-e13e7ea7934e@ti.com>
 <20200122002311.405E7217F4@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122002311.405E7217F4@mail.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Stephen Boyd <sboyd@kernel.org> [200122 00:24]:
> Quoting Tero Kristo (2020-01-20 23:31:27)
> > Hi Stephen,
> > 
> > Please pull these TI clock changes towards v5.6. Tony, the same branch 
> > (for-5.6-ti-clk) can be considered immutable towards your DTS changes if 
> > you wish to sync them with this.
> 
> Thanks. Pulled into clk-next

OK. I've based the pending omap4 & 5 crypto accelerator changes on
Tero's branch and pushed out omap-for-v5.6/ti-sysc-omap45-rng. Might
be too late for v5.6, but we'll see.

Thanks,

Tony
