Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB4BE362E8E
	for <lists+linux-omap@lfdr.de>; Sat, 17 Apr 2021 10:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235455AbhDQIhc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 17 Apr 2021 04:37:32 -0400
Received: from muru.com ([72.249.23.125]:55464 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229631AbhDQIhb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 17 Apr 2021 04:37:31 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 050CA80CD;
        Sat, 17 Apr 2021 08:38:22 +0000 (UTC)
Date:   Sat, 17 Apr 2021 11:37:01 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Dario Binacchi <dariobin@libero.it>
Cc:     Tero Kristo <kristo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bin Meng <bmeng.cn@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 0/2] fdt: translate address if #size-cells = <0>
Message-ID: <YHqeLe/mqzu5OZpg@atomide.com>
References: <1727466283.11523.1617746554330@mail1.libero.it>
 <CAL_JsqLd+BxW9T99Sx9vgEkxdbMFe+tL7X_nZ7ExvRxVd_9GNQ@mail.gmail.com>
 <1044574275.383115.1617779265390@mail1.libero.it>
 <CAL_JsqLcus=Y5nOuV1wiAiVb1mTq9N8xqJpGJD6ip+Ec_6YDyw@mail.gmail.com>
 <a197b5d8-621b-6655-e571-2877d007cd4c@kernel.org>
 <116337570.107804.1617913442196@mail1.libero.it>
 <8f232b81-4c83-54db-bcbd-2cae78ede814@kernel.org>
 <333530206.539702.1618169440615@mail1.libero.it>
 <a17dec03-d98c-0aac-0bbb-eeaa11f156f3@kernel.org>
 <1627640615.696710.1618432773724@mail1.libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1627640615.696710.1618432773724@mail1.libero.it>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Dario Binacchi <dariobin@libero.it> [210414 20:40]:
> > Il 12/04/2021 09:41 Tero Kristo <kristo@kernel.org> ha scritto:
> > The change on the DT itself would be pretty large, removing all clock 
> > nodes and modifying any existing handles towards the clock nodes, and 
> > this would impact all OMAP architectures.
> > 
> > Anyways, it is mostly up-to Tony how he wants to see the DT change, as 
> > he is the maintainer for the OMAP family DT data.

While I think all the clocks should use a similar binding to the clkctrl
binding, I don't know if it makes sense to start changing things around
at such a large scale.

Certainly if somebody does the patches and they can be tested to not cause
regressions, sure why not :)

> > I am just raising the opinion here that from kernel point of view, 
> > adding the missing size cells seems unnecessary, and I can't see why 
> > u-boot can't be changed to support the existing broken DT. It is broken 
> > now, and it will be broken with the addition of the size cells in place, 
> > and the actual "neat" end result would be to get rid of the clock nodes 
> > completely.
> 
> I'll fix U-boot.
> Thanks for your explanations.
> Hope for SSC patch review from you and/or some TI MAINTAINER.

Best to fix the issues first, then make any clean-up patches a separate
series.

Regards,

Tony
