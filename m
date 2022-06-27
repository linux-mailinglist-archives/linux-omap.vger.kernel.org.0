Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50CB355D967
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 15:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbiF0GNi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jun 2022 02:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbiF0GNh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jun 2022 02:13:37 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 226FF2718;
        Sun, 26 Jun 2022 23:13:35 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 671878120;
        Mon, 27 Jun 2022 06:08:24 +0000 (UTC)
Date:   Mon, 27 Jun 2022 09:13:33 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/1] mmc: sdhci-omap: Fix a lockdep warning for PM
 runtime init
Message-ID: <YrlKjZHJ37PHy9af@atomide.com>
References: <20220622051215.34063-1-tony@atomide.com>
 <CAPDyKFpNBQK3QZk-+5-4YB8=2O3sxwj5-nThd00ayp7FHSjUSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpNBQK3QZk-+5-4YB8=2O3sxwj5-nThd00ayp7FHSjUSA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ulf Hansson <ulf.hansson@linaro.org> [220623 12:55]:
> On Wed, 22 Jun 2022 at 07:12, Tony Lindgren <tony@atomide.com> wrote:
> >
> > We need runtime PM enabled early in probe before sdhci_setup_host() for
> > sdhci_omap_set_capabilities(). But on the first runtime resume we must
> > not call sdhci_runtime_resume_host() as sdhci_setup_host() has not been
> > called yet. Let's check for an initialized controller like we already do
> > for context restore to fix a lockdep warning.
> 
> Thanks for explaining the background to the problem. However, looking
> a bit closer I am worried that the error path in ->probe() is broken
> too.
> 
> It seems in the error path, at the label "err_rpm_put", there is a
> call to pm_runtime_put_autosuspend(). This doesn't really guarantee
> that the ->runtime_suspend() callback will be invoked, which I guess
> is the assumption, don't you think?

OK I'll check and send a separate patch for that.

> That said, I wonder if it would not be easier to convert the ->probe()
> function to make use of pm_runtime_get_noresume() and
> pm_runtime_set_active() instead. In this way the ->probe() function
> becomes responsible of turning on/off the resources "manually" that it
> requires to probe (and when it fails to probe), while we can keep the
> ->runtime_suspend|resume() callbacks simpler.
> 
> Did that make sense to you?

Simpler would be better :) We need to call pm_runtime_get_sync() at some
point though to enable the parent device hierarchy. Just calling the
sdhci_omap runtime functions is not enough. And we still need to check
for the valid context too. Also I'm not convinced that calling
pm_runtime_get_sync() on the parent device would do the right thing on
old omap3 devices without bigger changes.. But maybe you have some better
ideas that I'm not considering.

Regards,

Tony
