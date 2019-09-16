Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71BE8B3EFC
	for <lists+linux-omap@lfdr.de>; Mon, 16 Sep 2019 18:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729041AbfIPQ3m (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Sep 2019 12:29:42 -0400
Received: from muru.com ([72.249.23.125]:33416 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727928AbfIPQ3m (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Sep 2019 12:29:42 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 847BF80EA;
        Mon, 16 Sep 2019 16:30:13 +0000 (UTC)
Date:   Mon, 16 Sep 2019 09:29:39 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [RFC v2] ARM: dts: omap36xx: Enable thermal throttling
Message-ID: <20190916162939.GG52127@atomide.com>
References: <CAHCN7xJZk-7+6=13arKHdTkNoEANeZr2hUZu+AbDzw5m9vQLWQ@mail.gmail.com>
 <20190916154554.GA52127@atomide.com>
 <CAHCN7xKsmdcXTb+Wy4BDDqCzpDuetF2GK7cqvKuCTtWfOj62Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xKsmdcXTb+Wy4BDDqCzpDuetF2GK7cqvKuCTtWfOj62Jw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190916 16:01]:
> On Mon, Sep 16, 2019 at 10:45 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > Hi,
> >
> > * Adam Ford <aford173@gmail.com> [190913 21:12]:
> > > Tony,
> > >
> > > Go ahead and discard both the original and v2 of this.  Based on
> > > feedback from others, it seems like the other series I did which
> > > configured the temp sensor for all omap3 should be sufficient.
> >
> > Yeah OK I've tagged all the RFC threads as read now.
> >
> > > Once there has been enough time for people to review the other RFC,
> > > I'll resubmit with a more proper patch giving some of the credit to
> > > Nikolaus for convincing me to do this.
> >
> > Yes please do :) At least I've already lost track of
> > all the pending patches related to cpufreq and thermal
> > and voltage stuff. So several complete non-rfc sets
> > is probably what everybody is waiting for to review.
> 
> AFAICT, Niklaus' patch series for cpufreq is no longer in RFC status.
> 
> https://patchwork.kernel.org/patch/11141655/

OK that looks good to me and I just acked the patches
I did not already ack earlier.

> Once his patches have been applied, I'll rebase and resubmit without
> the RFC against whatever branch you want.

Yes so hopefully we'll an immutable cpufreq branch
we can all use as a base.

Regards,

Tony
