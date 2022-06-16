Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A74F854DB63
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jun 2022 09:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347281AbiFPHSN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jun 2022 03:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiFPHSN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jun 2022 03:18:13 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1AE67275E2;
        Thu, 16 Jun 2022 00:18:11 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 71086812F;
        Thu, 16 Jun 2022 07:13:19 +0000 (UTC)
Date:   Thu, 16 Jun 2022 10:18:05 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-mmc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Linux 5.18.x: sdhci issue
Message-ID: <YqrZLWp4Nyhd5v1d@atomide.com>
References: <CAGm1_ktMOwwhhgVWj3DpCib-WpRzhkjE4d4DN74mz6kdwJk6BA@mail.gmail.com>
 <YnNagtAtSudCum75@atomide.com>
 <CAGm1_ktACExigtZUYFWria8=cxhy6x6vDGpLcaZAvnE9G3Bz_A@mail.gmail.com>
 <YqmTXqXLala7Li/+@atomide.com>
 <CAGm1_kvM0p=T4L4vDpXj2quMCPqoBidztsLaAsKYCYCGpvVnng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_kvM0p=T4L4vDpXj2quMCPqoBidztsLaAsKYCYCGpvVnng@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Yegor Yefremov <yegorslists@googlemail.com> [220615 08:54]:
> Hi Tony,
> 
> On Wed, Jun 15, 2022 at 10:08 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Yegor Yefremov <yegorslists@googlemail.com> [220615 09:40]:
> > > Hi Tony, Ulf,
> > >
> > > On Thu, May 5, 2022 at 7:03 AM Tony Lindgren <tony@atomide.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > * Yegor Yefremov <yegorslists@googlemail.com> [220504 09:12]:
> > > > > Hi Tony, all,
> > > > >
> > > > > During the kernel boot I see the following error. The device is still
> > > > > working afterwards. 5.17.5 shows the same behavior. Is this a known
> > > > > issue?
> > > >
> > > > Thanks for reporting it, I was not aware of this one. Might be worth
> > > > bisecting. Adding linux-mmc and Ulf.
> > >
> > > This is my bisect result:
> > >
> > > f433e8aac6b94218394c6e7b80bb89e4e79c9549 is the first bad commit
> > > commit f433e8aac6b94218394c6e7b80bb89e4e79c9549
> > > Author: Tony Lindgren <tony@atomide.com>
> > > Date:   Fri Oct 15 13:47:18 2021 +0300
> > >
> > >     mmc: sdhci-omap: Implement PM runtime functions
> > >
> > >     Implement PM runtime functions and enable autosuspend.
> > >
> > >     Note that we save context in probe to avoid restoring invalid context
> > >     on the first resume. For system suspend, we have the new PM runtime
> > >     functions do most of the work.
> > >
> > >     Signed-off-by: Tony Lindgren <tony@atomide.com>
> > >     Link: https://lore.kernel.org/r/20211015104720.52240-5-tony@atomide.com
> > >     Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> >
> > OK thanks this makes sense based on what Arnd replied a few days ago.
> >
> > Regards,
> 
> Your patch did the trick: all warnings/errors are gone. Thanks
> everyone for the help.

OK thanks for testing, will send out a proper patch today for this.

Regards,

Tony
