Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92C04146F89
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2020 18:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgAWRWt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jan 2020 12:22:49 -0500
Received: from muru.com ([72.249.23.125]:52146 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726605AbgAWRWt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Jan 2020 12:22:49 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 82E5C810A;
        Thu, 23 Jan 2020 17:23:31 +0000 (UTC)
Date:   Thu, 23 Jan 2020 09:22:45 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Benoit Parrot <bparrot@ti.com>,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch v5 1/3] clk: ti: dra7: add vpe clkctrl data
Message-ID: <20200123172245.GD5885@atomide.com>
References: <20191211140810.10657-1-bparrot@ti.com>
 <20191211140810.10657-2-bparrot@ti.com>
 <20191230195812.0356A206CB@mail.kernel.org>
 <33a9848a-04c4-6545-f477-d6510faceb51@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33a9848a-04c4-6545-f477-d6510faceb51@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [200121 07:33]:
> On 30/12/2019 21:58, Stephen Boyd wrote:
> > Quoting Benoit Parrot (2019-12-11 06:08:08)
> > > Add clkctrl data for VPE.
> > > 
> > > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > > Acked-by: Tony Lindgren <tony@atomide.com>
> > > Acked-by: Rob Herring <robh@kernel.org>
> > > ---
> > 
> > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > 
> 
> Queued this patch towards 5.6, thanks.

And I'm picking the dts changes into
omap-for-v5.6/ti-sysc-dt-cam.

Thanks,

Tony
