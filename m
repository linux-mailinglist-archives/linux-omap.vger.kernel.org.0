Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D010D2C14
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 16:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbfJJOFY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 10:05:24 -0400
Received: from muru.com ([72.249.23.125]:36920 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725923AbfJJOFY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Oct 2019 10:05:24 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A751B80BB;
        Thu, 10 Oct 2019 14:05:56 +0000 (UTC)
Date:   Thu, 10 Oct 2019 07:05:19 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Keerthy <j-keerthy@ti.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] clk: ti: clkctrl: Fix failed to enable error with double
 udelay timeout
Message-ID: <20191010140519.GV5610@atomide.com>
References: <20190930154001.46581-1-tony@atomide.com>
 <93a6448d-cece-a903-5c7e-ade793d62063@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93a6448d-cece-a903-5c7e-ade793d62063@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Keerthy <j-keerthy@ti.com> [191007 00:57]:
> 
> 
> On 30/09/19 9:10 PM, Tony Lindgren wrote:
> > Commit 3d8598fb9c5a ("clk: ti: clkctrl: use fallback udelay approach if
> > timekeeping is suspended") added handling for cases when timekeeping is
> > suspended. But looks like we can still get occasional "failed to enable"
> > errors on the PM runtime resume path with udelay() returning faster than
> > expected.
> > 
> > With ti-sysc interconnect target module driver this leads into device
> > failure with PM runtime failing with "failed to enable" clkctrl error.
> > 
> > Let's fix the issue with a delay of two times the desired delay as in
> > often done for udelay() to account for the inaccuracy.
> 
> Tested for DS0 and rtc+ddr modes on am43 and ds0 on am33.
> 
> Tested-by: Keerthy <j-keerthy@ti.com>

Thanks for testing. This one should be applied into v5.4-rc series
please if no more comments.

Regards,

Tony

> > Fixes: 3d8598fb9c5a ("clk: ti: clkctrl: use fallback udelay approach if timekeeping is suspended")
> > Cc: Keerthy <j-keerthy@ti.com>
> > Cc: Tero Kristo <t-kristo@ti.com>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >   drivers/clk/ti/clkctrl.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
> > --- a/drivers/clk/ti/clkctrl.c
> > +++ b/drivers/clk/ti/clkctrl.c
> > @@ -100,11 +100,12 @@ static bool _omap4_is_timeout(union omap4_timeout *time, u32 timeout)
> >   	 * can be from a timer that requires pm_runtime access, which
> >   	 * will eventually bring us here with timekeeping_suspended,
> >   	 * during both suspend entry and resume paths. This happens
> > -	 * at least on am43xx platform.
> > +	 * at least on am43xx platform. Account for flakeyness
> > +	 * with udelay() by multiplying the timeout value by 2.
> >   	 */
> >   	if (unlikely(_early_timeout || timekeeping_suspended)) {
> >   		if (time->cycles++ < timeout) {
> > -			udelay(1);
> > +			udelay(1 * 2);
> >   			return false;
> >   		}
> >   	} else {
> > 
