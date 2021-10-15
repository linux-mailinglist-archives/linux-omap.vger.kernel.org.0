Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783CB42EDC2
	for <lists+linux-omap@lfdr.de>; Fri, 15 Oct 2021 11:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237434AbhJOJgy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Oct 2021 05:36:54 -0400
Received: from muru.com ([72.249.23.125]:44834 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236690AbhJOJgy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Oct 2021 05:36:54 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D6ECF80F1;
        Fri, 15 Oct 2021 09:35:19 +0000 (UTC)
Date:   Fri, 15 Oct 2021 12:34:46 +0300
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
Subject: Re: [PATCH 4/6] mmc: sdhci-omap: Implement PM runtime functions
Message-ID: <YWlLNn0yN2r1xDSq@atomide.com>
References: <20211012103750.38328-1-tony@atomide.com>
 <20211012103750.38328-5-tony@atomide.com>
 <CAPDyKFq_jiYPrm_kcprijFfcceVVGnZpkG+4ZY_XSBXJnCT0LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFq_jiYPrm_kcprijFfcceVVGnZpkG+4ZY_XSBXJnCT0LA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ulf Hansson <ulf.hansson@linaro.org> [211012 15:17]:
> On Tue, 12 Oct 2021 at 12:38, Tony Lindgren <tony@atomide.com> wrote:
> > @@ -1350,15 +1355,21 @@ static int sdhci_omap_probe(struct platform_device *pdev)
> >         if (ret)
> >                 goto err_cleanup_host;
> >
> > +       sdhci_omap_context_save(omap_host);
> 
> Calling sdhci_omap_context_save() here looks unnecessary. The device
> is already runtime resumed at this point.
> 
> In other words, sdhci_omap_context_save() will be called from the
> ->runtime_suspend() callback, next time the device becomes runtime
> suspended. That should be sufficient, right?

Yup this can be now dropped with omap_host->con initialized to
-EINVAL earlier.

> > @@ -1371,8 +1382,12 @@ static int sdhci_omap_remove(struct platform_device *pdev)
> >         struct device *dev = &pdev->dev;
> >         struct sdhci_host *host = platform_get_drvdata(pdev);
> >
> > +       pm_runtime_get_sync(dev);
> >         sdhci_remove_host(host, true);
> > +       pm_runtime_dont_use_autosuspend(dev);
> >         pm_runtime_put_sync(dev);
> > +       /* Ensure device gets idled despite userspace sysfs config */
> > +       pm_runtime_force_suspend(dev);
> >         pm_runtime_disable(dev);
> 
> The call to pm_runtime_disable() can be removed, as that is taken care
> of in pm_runtime_force_suspend().

OK

> > +static int __maybe_unused sdhci_omap_suspend(struct device *dev)
> > +{
> > +       struct sdhci_host *host = dev_get_drvdata(dev);
> > +       int err;
> > +
> > +       /* Enable for configuring wakeups, paired in resume */
> > +       err = pm_runtime_resume_and_get(dev);
> > +       if (err < 0)
> > +               return err;
> > +
> > +       sdhci_suspend_host(host);
> 
> As far as I can tell, sdhci_suspend_host() doesn't really make sense
> for the omap variant. What you need, is to put the device into the
> same low power state as "runtime suspend", that should be sufficient.
> 
> The system wakeup will be armed (and later then disarmed) by the PM
> core, when it calls device_wakeup_arm_wake_irqs() from the
> dpm_suspend_noirq() phase.
> 
> In other words, pointing the system suspend/resume callbacks to
> pm_runtime_force_suspend|resume() should work fine, I think.

OK sounds good to me.

Regards,

Tony
