Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC862E72F2
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2019 14:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727567AbfJ1N5V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Oct 2019 09:57:21 -0400
Received: from muru.com ([72.249.23.125]:40074 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727255AbfJ1N5V (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 28 Oct 2019 09:57:21 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 31E2D8043;
        Mon, 28 Oct 2019 13:57:55 +0000 (UTC)
Date:   Mon, 28 Oct 2019 06:57:16 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        linux-omap@vger.kernel.org, aford173@gmail.com
Subject: Re: [PATCH 0/4] clk: ti: re-work divider clock support
Message-ID: <20191028135716.GZ5610@atomide.com>
References: <20191002120611.26121-1-t-kristo@ti.com>
 <1115e221-1523-1a60-02a3-1f1939170e64@ti.com>
 <20191028095906.27043208C0@mail.kernel.org>
 <9361d516-a92a-39cd-dbc8-10de10fe6295@ti.com>
 <13533ed2-1a91-2255-5f69-a28e81fba0aa@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13533ed2-1a91-2255-5f69-a28e81fba0aa@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [191028 11:37]:
> On 28/10/2019 12:23, Tero Kristo wrote:
> > On 28/10/2019 11:59, Stephen Boyd wrote:
> > > Quoting Tero Kristo (2019-10-24 01:03:20)
> > > > On 02/10/2019 15:06, Tero Kristo wrote:
> > > > > Hi,
> > > > > 
> > > > > The existing divider clock support appears to have an inherent bug
> > > > > because of the bit field width implementation and limitation of divider
> > > > > values based on this. The limitation by bit field only is not enough,
> > > > > as we can have divider settings which accept only certain range of
> > > > > dividers within the full range of the bit-field.
> > > > > 
> > > > > Because of this, the divider clock is re-implemented to use
> > > > > min,max,mask
> > > > > values instead of just the bit-field.
> > > > 
> > > > Queued this up for 5.4 fixes, thanks.
> > > 
> > > Is this a regression in 5.4-rc series? Please only send fixes for code
> > > that is broken by code that went into the merge window, or is super
> > > annoying and broken but we somehow didn't notice. If not, just let it
> > > sit in -next until the next merge window and it may still be backported
> > > to stable trees anyway.
> > 
> > Tony/Tomi, how much do you care which one this hits into?
> 
> Probably no hurry with this one, as the DSS side patch is enough to avoid
> the bad divider.

OK good to hear. Yes I too think we can wait for the clock divider
changes to trickle down to next. While they are regression fixes,
this has clearly been broken for many years.

However, the following patch should be merged during -rc as
without it sometimes devices can fail:

clk: ti: clkctrl: Fix failed to enable error with double udelay timeout:

Regards,

Tony
