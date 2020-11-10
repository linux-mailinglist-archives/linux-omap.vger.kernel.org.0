Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1042AD5F7
	for <lists+linux-omap@lfdr.de>; Tue, 10 Nov 2020 13:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730069AbgKJMRW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Nov 2020 07:17:22 -0500
Received: from muru.com ([72.249.23.125]:47854 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726706AbgKJMRW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Nov 2020 07:17:22 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D862A80BA;
        Tue, 10 Nov 2020 12:17:27 +0000 (UTC)
Date:   Tue, 10 Nov 2020 14:17:18 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am437x-l4: fix compatible for cpsw switch dt
 node
Message-ID: <20201110121718.GF26857@atomide.com>
References: <20201001192023.6606-1-grygorii.strashko@ti.com>
 <d6dea06f-76f5-a29e-d4e3-eb0e65f29e9d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6dea06f-76f5-a29e-d4e3-eb0e65f29e9d@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [201029 19:13]:
> Hi Tony,
> 
> On 01/10/2020 22:20, Grygorii Strashko wrote:
> > Fix compatible the new CPSW switchdev DT node to avoid probing of legacy
> > CPSW driver which fails:
> > [    2.781009] cpsw 4a100000.switch: invalid resource
> > 
> > Fixes: 7bf8f37aea82 ("ARM: dts: am437x-l4: add dt node for new cpsw switchdev driver")
> > Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> > ---
> > Hi Tony,
> > 
> > This is follow up patch for series [1], not critical.
> > [1] https://lore.kernel.org/patchwork/cover/1304085/
> 
> Could this be merged?

Sorry for the delay, applying into fixes.

Thanks,

Tony
