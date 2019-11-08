Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 707ABF5204
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2019 18:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730734AbfKHRBv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Nov 2019 12:01:51 -0500
Received: from muru.com ([72.249.23.125]:40924 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727654AbfKHRBu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 8 Nov 2019 12:01:50 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 95C9780D4;
        Fri,  8 Nov 2019 17:02:26 +0000 (UTC)
Date:   Fri, 8 Nov 2019 09:01:47 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: [GIT PULL] clk: ti: changes for 5.5 (take 2)
Message-ID: <20191108170147.GH5610@atomide.com>
References: <2e823d30-ce52-1275-c958-6b82666dc46f@ti.com>
 <20191106223026.BFE86214D8@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106223026.BFE86214D8@mail.kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Stephen Boyd <sboyd@kernel.org> [191106 22:31]:
> Quoting Tero Kristo (2019-11-04 23:20:31)
> > Hi Stephen,
> > 
> > This is a 2nd try of the TI clock changes towards 5.5. I added the 
> > divider clock revamp into this pull, and also fixed the one commend you 
> > had on the remoteproc support series.
> > 
> > Tony, this is also available as a branch as for-5.5-ti-clk-v2.
> > 
> > -Tero
> > 
> > ---
> 
> Thanks. Pulled into clk-next

Thanks. Tero, as we're already at -rc6, I'll wait on the device dts
patches that depend on this and the reset control until after v5.5-rc1.

Regards,

Tony
