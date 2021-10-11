Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D377742862F
	for <lists+linux-omap@lfdr.de>; Mon, 11 Oct 2021 07:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbhJKFZp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Oct 2021 01:25:45 -0400
Received: from muru.com ([72.249.23.125]:43204 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231560AbhJKFZo (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Oct 2021 01:25:44 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9DC92805F;
        Mon, 11 Oct 2021 05:24:15 +0000 (UTC)
Date:   Mon, 11 Oct 2021 08:23:42 +0300
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
Message-ID: <YWPKXvPCTIir+TzG@atomide.com>
References: <20210930065733.31943-1-tony@atomide.com>
 <20210930065733.31943-5-tony@atomide.com>
 <CAPDyKFpybVPeYy-FsXnzDXNri+f7rhPmKa6vBF8NMUc3dQCZRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpybVPeYy-FsXnzDXNri+f7rhPmKa6vBF8NMUc3dQCZRw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ulf Hansson <ulf.hansson@linaro.org> [211008 14:44]:
> On Thu, 30 Sept 2021 at 08:57, Tony Lindgren <tony@atomide.com> wrote:
> >
> > Implement PM runtime functions and enable MMC_CAP_AGGRESSIVE_PM.
> 
> I suggest you split this change into two pieces. MMC_CAP_AGGRESSIVE_PM
> is about enabling runtime PM management for the eMMC/SD card device,
> which is perfectly fine to use independently of whether runtime PM is
> supported for the host device.

OK

> > @@ -1350,6 +1357,11 @@ static int sdhci_omap_probe(struct platform_device *pdev)
> >         if (ret)
> >                 goto err_cleanup_host;
> >
> > +       sdhci_omap_context_save(omap_host);
> > +       omap_host->context_valid = 1;
> 
> Looks like you can remove this flag, it's not being used.

Hmm I think it is needed as otherwise we end up trying to restore
an invalid context on probe on the first pm_runtime_get(). Do you
have some nicer solution for that in mind?

> > +
> > +       pm_runtime_put_sync(dev);
> 
> I recommend to use the PM runtime autosuspend feature, as to avoid an
> initial latency for every I/O request to the host driver. The mmc core
> already supports that, see mmc_release_host().
> 
> The typical default timeout value for autosuspend, is usually set
> ~50-200ms, by host drivers (if I recall correctly).

OK I have a patch to also enable autosuspend too, I'll add that
too for the next revision.

> > @@ -1371,6 +1383,7 @@ static int sdhci_omap_remove(struct platform_device *pdev)
> >         struct device *dev = &pdev->dev;
> >         struct sdhci_host *host = platform_get_drvdata(pdev);
> >
> > +       pm_runtime_get_sync(dev);
> >         sdhci_remove_host(host, true);
> >         pm_runtime_put_sync(dev);
> 
> There is no guarantee that this triggers a call to
> ->sdhci_omap_runtime_suspend(), which I guess is what we want.
> Userspace via sysfs may have increase the RPM usage count
> (pm_runtime_forbid(), for example.
> 
> To address this, I would call pm_runtime_disable() first and then
> explicitly put the device into low power state, rather than relying on
> runtime PM to do it. Another option could be to use
> pm_runtime_force_suspend().

OK I'll take a look.

> > @@ -1402,42 +1415,75 @@ static void sdhci_omap_context_restore(struct sdhci_omap_host *omap_host)
> >         sdhci_omap_writel(omap_host, SDHCI_OMAP_ISE, omap_host->ise);
> >  }
> >
> > -static int __maybe_unused sdhci_omap_suspend(struct device *dev)
> > +static int __maybe_unused sdhci_omap_runtime_suspend(struct device *dev)
> >  {
> >         struct sdhci_host *host = dev_get_drvdata(dev);
> >         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> >         struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
> >
> > -       sdhci_suspend_host(host);
> > -
> 
> Shouldn't you call sdhci_runtime_suspend_host() somewhere here?

I'm pretty sure I tried, but runtime resume did not seem to work after
doing that.. I'll take a look again.

> > +static int __maybe_unused sdhci_omap_suspend(struct device *dev)
> > +{
> > +       struct sdhci_host *host = dev_get_drvdata(dev);
> > +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > +       struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
> > +
> > +       if (omap_host->is_runtime_suspended)
> > +               return 0;
> 
> So if the host is already runtime suspended, it's okay to just leave it as is?

Ideally yeah there should not be anything left to do for suspesnd at
that point. But sounds like I may be missing something.

> In a way that sounds like you could call pm_runtime_force_suspend()
> instead, assuming the sdhci_omap_runtime_suspend() can be extended to
> do the right thing for system suspend as well.

OK I'll check.

> It looks a bit odd that sdhci_suspend_host() is called only when the
> host is runtime resumed. Perhaps you can elaborate a bit more on why
> this is, so I can understand better what you want to achieve here.

I guess I'm not clear on what's left for sdhci_suspend_host() to do if
the host is already runtime suspended :)

Regards,

Tony
