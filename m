Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471D71C07D9
	for <lists+linux-omap@lfdr.de>; Thu, 30 Apr 2020 22:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgD3UZl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Apr 2020 16:25:41 -0400
Received: from muru.com ([72.249.23.125]:52388 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726377AbgD3UZl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Apr 2020 16:25:41 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B48918123;
        Thu, 30 Apr 2020 20:26:29 +0000 (UTC)
Date:   Thu, 30 Apr 2020 13:25:38 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] ARM: dts: omap4: fix node names for the l4_cm
 clkctrl nodes
Message-ID: <20200430202538.GZ37466@atomide.com>
References: <20200429143002.5050-1-t-kristo@ti.com>
 <20200429143002.5050-2-t-kristo@ti.com>
 <20200429220714.GV37466@atomide.com>
 <fef91f43-df5f-99e4-7861-05190fcc2040@ti.com>
 <cb563fb2-4909-a11a-d167-a5e982f38968@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb563fb2-4909-a11a-d167-a5e982f38968@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [200430 08:35]:
> On 30/04/2020 07:55, Tero Kristo wrote:
> > On 30/04/2020 01:07, Tony Lindgren wrote:
> > > Heh this is no longer needed since commit 6c3090520554
> > > ("clk: ti: clkctrl: Fix hidden dependency to node name")
> > > that added support for using the compatible name :)
> > > 
> > > Maybe you are using some older tree? Or else there's
> > > still something wrong somewhere.
> > 
> > I was using 5.7-rc1 as baseline so can't be that.
> > 
> > Let me try to check this one again.
> 
> Ok you can ignore this and patch #2 for omap5 for similar case. It seems
> like the patch 6c3090520554 actually forgot to fix the subclock names, and
> it causes issues in mixed clock node setup. Will post a fix against the
> clock driver shortly.

OK good to hear.

Thanks,

Tony
