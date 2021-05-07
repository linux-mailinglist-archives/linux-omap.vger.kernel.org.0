Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 434563762FB
	for <lists+linux-omap@lfdr.de>; Fri,  7 May 2021 11:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236780AbhEGJlu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 May 2021 05:41:50 -0400
Received: from muru.com ([72.249.23.125]:52728 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231753AbhEGJlt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 7 May 2021 05:41:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1FBCD80E0;
        Fri,  7 May 2021 09:40:50 +0000 (UTC)
Date:   Fri, 7 May 2021 12:40:45 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkft-triage@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        regressions@lists.linux.dev,
        Benoit Cousson <bcousson@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: #regzb introduced: 98feab31ac49 ("ARM: OMAP2+: Drop legacy
 platform data for dra7 sata")
Message-ID: <YJULHXtTFD9wqQzq@atomide.com>
References: <CA+G9fYtTN6ug3eBAW3wMcDeESUo+ebj7L5HBe5_fj4uqDExFQg@mail.gmail.com>
 <YJPYvsdkfx4JD4vT@atomide.com>
 <CA+G9fYv48aJ6tmSaf_HtRKHse4yN40hEYSPR5=A3W6HRoJ8p_g@mail.gmail.com>
 <YJTz+D9Sp8Eyp+iw@atomide.com>
 <e896704c-c13a-739d-0723-22fec35406ed@leemhuis.info>
 <YJUJ0AMAWvNMaCRu@atomide.com>
 <fac6076d-5d2b-3165-b60a-b17a1ebbc506@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fac6076d-5d2b-3165-b60a-b17a1ebbc506@leemhuis.info>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Thorsten Leemhuis <linux@leemhuis.info> [210507 09:39]:
> On 07.05.21 11:35, Tony Lindgren wrote:
> > * Thorsten Leemhuis <linux@leemhuis.info> [210507 08:27]:
> >> Great to see that this is about to be fixed. And Naresh, many thx for
> >> giving the #regzb tag a try, even if regzbot (shameless plug for the
> >> unaware: https://linux-regtracking.leemhuis.info/post/regzbot-approach/
> >> ) is not up and running already, much appreciated!
> >
> > Hmm so the link above does not show where to git clone the regzb program
> > from? Or is that not yet published? Just wondering.
> 
> The code is still very early WIP, so not yet published, but I'll publish
> the first few bits in a week or two, even if they are not yet useful to
> anyone besides myself. ;-)

OK thanks for the update.

Tony
