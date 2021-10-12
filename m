Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 565A142A0DB
	for <lists+linux-omap@lfdr.de>; Tue, 12 Oct 2021 11:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235496AbhJLJUO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Oct 2021 05:20:14 -0400
Received: from muru.com ([72.249.23.125]:43648 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232502AbhJLJUN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 Oct 2021 05:20:13 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 39EA780B3;
        Tue, 12 Oct 2021 09:18:43 +0000 (UTC)
Date:   Tue, 12 Oct 2021 12:18:09 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        DTML <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/5] mmc: sdhci-omap: Implement PM runtime functions
Message-ID: <YWVS0bkR7YWiY0yX@atomide.com>
References: <20210930065733.31943-1-tony@atomide.com>
 <20210930065733.31943-5-tony@atomide.com>
 <CAPDyKFpybVPeYy-FsXnzDXNri+f7rhPmKa6vBF8NMUc3dQCZRw@mail.gmail.com>
 <YWPKXvPCTIir+TzG@atomide.com>
 <CAPDyKFo-pmxG7EfxagqANJzCemf_Y96jdCnzzen=iOdPq-rJBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFo-pmxG7EfxagqANJzCemf_Y96jdCnzzen=iOdPq-rJBA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ulf Hansson <ulf.hansson@linaro.org> [211012 09:07]:
> On Mon, 11 Oct 2021 at 07:23, Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Ulf Hansson <ulf.hansson@linaro.org> [211008 14:44]:
> > > On Thu, 30 Sept 2021 at 08:57, Tony Lindgren <tony@atomide.com> wrote:
> > > >
> > > > Implement PM runtime functions and enable MMC_CAP_AGGRESSIVE_PM.
> > >
> > > I suggest you split this change into two pieces. MMC_CAP_AGGRESSIVE_PM
> > > is about enabling runtime PM management for the eMMC/SD card device,
> > > which is perfectly fine to use independently of whether runtime PM is
> > > supported for the host device.
> >
> > OK
> >
> > > > @@ -1350,6 +1357,11 @@ static int sdhci_omap_probe(struct platform_device *pdev)
> > > >         if (ret)
> > > >                 goto err_cleanup_host;
> > > >
> > > > +       sdhci_omap_context_save(omap_host);
> > > > +       omap_host->context_valid = 1;
> > >
> > > Looks like you can remove this flag, it's not being used.
> >
> > Hmm I think it is needed as otherwise we end up trying to restore
> > an invalid context on probe on the first pm_runtime_get(). Do you
> > have some nicer solution for that in mind?
> 
> Right, I didn't notice that, my apologies.
> 
> In any case, an option is to bring the device into full power, without
> calling pm_runtime_resume_and_get() from ->probe(). In principle,
> running the same operations as the ->runtime_resume() callback does,
> except for restoring the context then. When this is done, the
> following calls to runtime PM should do the trick (I extended it to
> support autosuspend as well):
> 
> pm_runtime_get_noresume()
> pm_runtime_set_active()
> pm_runtime_set_autosuspend_delay()
> pm_runtime_use_autosuspend()
> pm_runtime_enable()
> 
> Note that, this means that the omaps PM domain's ->runtime_resume()
> callback doesn't get invoked when powering on the device for the first
> time. Can this be a problem?

Yeah I think that would be a problem as the register access won't work :)

I changed things around to initialize omap_host->con = -ENODEV and then
check it on resume. Not an ideal solution but avoids the extra flag.

> > > > @@ -1402,42 +1415,75 @@ static void sdhci_omap_context_restore(struct sdhci_omap_host *omap_host)
> > > >         sdhci_omap_writel(omap_host, SDHCI_OMAP_ISE, omap_host->ise);
> > > >  }
> > > >
> > > > -static int __maybe_unused sdhci_omap_suspend(struct device *dev)
> > > > +static int __maybe_unused sdhci_omap_runtime_suspend(struct device *dev)
> > > >  {
> > > >         struct sdhci_host *host = dev_get_drvdata(dev);
> > > >         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > > >         struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
> > > >
> > > > -       sdhci_suspend_host(host);
> > > > -
> > >
> > > Shouldn't you call sdhci_runtime_suspend_host() somewhere here?
> >
> > I'm pretty sure I tried, but runtime resume did not seem to work after
> > doing that.. I'll take a look again.

Confusion solved for this one and it's working now.. Maybe I tried
calling sdhci_suspend_host() instead of sdhci_runtime_suspend_host()
earlier who knows.

> > > It looks a bit odd that sdhci_suspend_host() is called only when the
> > > host is runtime resumed. Perhaps you can elaborate a bit more on why
> > > this is, so I can understand better what you want to achieve here.
> >
> > I guess I'm not clear on what's left for sdhci_suspend_host() to do if
> > the host is already runtime suspended :)
> 
> I think what boils down to that is that, sdhci_suspend|resume_host()
> adds some special treatment for system wakeups (for SDIO irqs). I am
> not sure whether you may need that.

OK, will check.

> Some host drivers doesn't use sdhci_suspend|resume_host, but sticks to
> the sdhci_runtime_suspend|resume()_host() functions. Like
> sdhci-sprd.c, for example.

Hmm so is there some helper to figure out if the mmc host is active
and has a card?

Seems we could skip sdhci_suspend/resume for the inactive mmc host
instances.

Regards,

Tony
