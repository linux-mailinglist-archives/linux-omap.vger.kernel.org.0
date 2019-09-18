Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9A23B66F8
	for <lists+linux-omap@lfdr.de>; Wed, 18 Sep 2019 17:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbfIRPW0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Sep 2019 11:22:26 -0400
Received: from muru.com ([72.249.23.125]:33652 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726982AbfIRPW0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Sep 2019 11:22:26 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 353C6806C;
        Wed, 18 Sep 2019 15:22:57 +0000 (UTC)
Date:   Wed, 18 Sep 2019 08:22:22 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Ankur Tyagi <ankur.tyagi@gallagher.com>, mturquette@baylibre.com,
        sboyd@kernel.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] clk: ti: Update AM3/4 GPIO number as per datasheet
Message-ID: <20190918152222.GC5610@atomide.com>
References: <20190917021521.7012-1-ankur.tyagi@gallagher.com>
 <795a3b86-64cd-c01e-c5a0-7239836d37e1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <795a3b86-64cd-c01e-c5a0-7239836d37e1@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [190917 06:49]:
> On 17/09/2019 05:15, Ankur Tyagi wrote:
> > Sitara technical reference manual numbers GPIO from 0 whereas
> > in code GPIO are numbered from 1.
> > 
> > Changes since v1:
> > - Combine changes in single patch to avoid compilation failure
> > - Update AM4 GPIO numbers as well
> 
> So this is still not quite right, split am3 / am4 to their separate patches,
> there is no need to combine those two.
> 
> Also, you still introduce a compile breakage between this patch and the DT
> patch.
> 
> Tony, any thoughts on this? I would just leave the things as is, as the
> existing setup works just fine. We just have a cosmetic issue of having the
> index off-by-one compared to TRM on the clocks layer, and it is not visible
> to user either as we have gpio0-3 nodes in the DT. Nobody except the main
> gpio node should touch the gpio clkctrl clocks.

I commented a bit on the newer version "[PATCH v3 1/2] clk: ti: am3:
Update AM3 GPIO number as per datasheet". If there's a real bug lurking
around we should fix that first.

Regards,

TOny
