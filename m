Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0A7313BBF
	for <lists+linux-omap@lfdr.de>; Mon,  8 Feb 2021 18:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233747AbhBHR46 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Feb 2021 12:56:58 -0500
Received: from muru.com ([72.249.23.125]:58984 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235043AbhBHRy4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Feb 2021 12:54:56 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D39BD80A3;
        Mon,  8 Feb 2021 17:54:29 +0000 (UTC)
Date:   Mon, 8 Feb 2021 19:54:10 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Adam Ford <aford173@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: DM3730 Suspend-Resume with 5.11-rc6
Message-ID: <YCF6woNELPPgWDvg@atomide.com>
References: <CAHCN7xLXK774FTKVXPM1LQbg0KQm+7ASFxtiaYZsUbGKnwYfDQ@mail.gmail.com>
 <CAHCN7xKvUx7q0GL+JV8O7MEYo1zb8g2ePbHKQg8SxRmmsj+b6g@mail.gmail.com>
 <YCEBRBcfZa2D6J6X@atomide.com>
 <20210208112735.02e85c3f@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208112735.02e85c3f@aktux>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andreas Kemnade <andreas@kemnade.info> [210208 10:32]:
> On Mon, 8 Feb 2021 11:15:48 +0200
> Tony Lindgren <tony@atomide.com> wrote:
> 
> > * Adam Ford <aford173@gmail.com> [210206 22:22]:
> > > On Sat, Feb 6, 2021 at 3:57 PM Adam Ford <aford173@gmail.com> wrote:  
> > > >
> > > > I am having issues with suspend on a DM3730 running 5.11-rc6, and it
> > > > seems like core_pwrdm may be the issue.  
> > 
> > That probably just means you did not configure off mode for idle.
> > 
> 
> hmm, do you still need to configure anything for off mode? I rather
> think it might be a misbehaving peripheral, not a general off mode
> problem. So maybe try it with less modules loaded and add them step by
> step to find out the misbehaving one.

Right, that should no longer be needed. So then it's probably the
lack of configuring uart timeouts that will keep the SoC power
domains busy.

> > echo -n 1 > /sys/kernel/debug/pm_debug/enable_off_mode
> > 
> Is this line still needed? I thought I had patched it away.

Yes you're right it should no longer be needed.

Regards,

Tony
