Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55662E3471
	for <lists+linux-omap@lfdr.de>; Thu, 24 Oct 2019 15:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393658AbfJXNkE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Oct 2019 09:40:04 -0400
Received: from muru.com ([72.249.23.125]:39702 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393656AbfJXNkE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 24 Oct 2019 09:40:04 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4739380C5;
        Thu, 24 Oct 2019 13:40:38 +0000 (UTC)
Date:   Thu, 24 Oct 2019 06:40:00 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-omap@vger.kernel.org,
        aford173@gmail.com, tomi.valkeinen@ti.com
Subject: Re: [PATCH 0/4] clk: ti: re-work divider clock support
Message-ID: <20191024134000.GV5610@atomide.com>
References: <20191002120611.26121-1-t-kristo@ti.com>
 <1115e221-1523-1a60-02a3-1f1939170e64@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1115e221-1523-1a60-02a3-1f1939170e64@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [191024 08:04]:
> On 02/10/2019 15:06, Tero Kristo wrote:
> > Hi,
> > 
> > The existing divider clock support appears to have an inherent bug
> > because of the bit field width implementation and limitation of divider
> > values based on this. The limitation by bit field only is not enough,
> > as we can have divider settings which accept only certain range of
> > dividers within the full range of the bit-field.
> > 
> > Because of this, the divider clock is re-implemented to use min,max,mask
> > values instead of just the bit-field.
> 
> Queued this up for 5.4 fixes, thanks.
> 
> Tony, do you have anything against the DT patch going in with the rest of
> this or should it be dropped?

No that won't cause merge conflicts so please merge the dts change
along with the rest of the series. So for the dts change:

Acked-by: Tony Lindgren <tony@atomide.com>
