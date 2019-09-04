Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD3E5A8D32
	for <lists+linux-omap@lfdr.de>; Wed,  4 Sep 2019 21:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731538AbfIDQgb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Sep 2019 12:36:31 -0400
Received: from muru.com ([72.249.23.125]:59672 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731520AbfIDQga (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 4 Sep 2019 12:36:30 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 77FD480F3;
        Wed,  4 Sep 2019 16:37:00 +0000 (UTC)
Date:   Wed, 4 Sep 2019 09:36:27 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL 1/2] ti-sysc driver changes for v5.3
Message-ID: <20190904163627.GS52127@atomide.com>
References: <pull-1566599057-142651@atomide.com>
 <CAK8P3a1Hh8nFe7h0Jr7tf_aoarvwr3utD7LrFf9rV_OePL-+Zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1Hh8nFe7h0Jr7tf_aoarvwr3utD7LrFf9rV_OePL-+Zg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arnd Bergmann <arnd@arndb.de> [190904 15:27]:
> On Sat, Aug 24, 2019 at 12:24 AM Tony Lindgren <tony@atomide.com> wrote:
> > Driver changes for ti-sysc for v5.4
> >
> > Few changes to prepare for using a reset driver for PRM rstctrl mostly
> > to deal with the clocks for reset. Then few minor clean-up patches and
> > SPDX license identifier changes, and add a MAINTAINERs file entry.
> 
> Pulled this one into an arm/late branch, together with the three
> other pull requests that depend on this one.
> 
> Don't worry about the arm/late name, I expect to send this off
> together with the other branches, it's just easier for me to
> describe what's in each of the top-level branches this way.

OK sure thanks.

Tony
