Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5684B42A0B3
	for <lists+linux-omap@lfdr.de>; Tue, 12 Oct 2021 11:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235769AbhJLJIw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Oct 2021 05:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235867AbhJLJIl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Oct 2021 05:08:41 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC1EBC06176D
        for <linux-omap@vger.kernel.org>; Tue, 12 Oct 2021 02:06:37 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id j5so85074595lfg.8
        for <linux-omap@vger.kernel.org>; Tue, 12 Oct 2021 02:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ChqUlAKdsiUWbRik4asROZltsnHtV5wLFR2z9t60VnA=;
        b=qgowPwZS3BxR5Tc9pIDtOjb2YztzYenn/ptRVoacfkw/O+kQF94PA9JyOfsrINtOuY
         VDbnxHOuLl3B80mghrXZttK+a/ol2xOvcdqt/cdBc40rpL0q18L/CdNoKbluJS0Cqzfx
         VENn4+S9RKPV4vnNKtFmr2Y7nqNSyQ4jXt9BFOfZqMLHuCbN9uWQwJEknCkuE/hm1JLD
         /HuhO3toNxz+nPvKizRPZxJpraGLF69eBIdofyOjgT47qovEjGat2q1Chb16NguYyZ3m
         pQVz0SWFRsPbdm31aQo72Dq8z7RDkTR52zc928IT5cGlhfR9+TUW1VFjtW3XqJnwtRUf
         dPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ChqUlAKdsiUWbRik4asROZltsnHtV5wLFR2z9t60VnA=;
        b=vY1eZJaJOBhWe7BvmBFqsGltlzgnrRyL6B9YOWaApX/jqUBbHOWk2F+5VwEBJ1GUVF
         l15WaHazgW6CzedW6pmzvQu+pmGmp4v10Ln46ROCFpBQl5/oMUg01zTOK4AqN8W8fc5N
         WCfWl3O8LauaTm8kV+JihJkvh5Cwb3J0LiMPk4d5A3ezreUCwhNlr4jPY2IqlU/Kitlg
         i65ye4VA2FD2j/JT2cNMY5cm5lAEy9dF+gghz2caSUnmXXiDx2wlGEXUgWP52N72dVe3
         OAEqg1JcpTCFAi7120gKPPs+v9OXUblHKJPj+K32niyQB5lMnOBXTA+cVEMBuGWQa6Np
         P9dg==
X-Gm-Message-State: AOAM532GcFz4EV/DpnJG+3hhOR7NPDpmJFgEYHnR3dVn+zmChPGbrRm8
        g3ASqUi4Q4kkZX1Y1aj9tZvZTSl1XgpeuPXjVv/jPQ==
X-Google-Smtp-Source: ABdhPJyLeCSuVo8IR/cNrsuAUgzCRzHZ4PRZTzuS9/kNqGM9IWATvv/qeFDtJz4/Wo8P2L/q8i/AIXLko0u/Dloj3MY=
X-Received: by 2002:a05:6512:4029:: with SMTP id br41mr17875247lfb.233.1634029595999;
 Tue, 12 Oct 2021 02:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210930065733.31943-1-tony@atomide.com> <20210930065733.31943-5-tony@atomide.com>
 <CAPDyKFpybVPeYy-FsXnzDXNri+f7rhPmKa6vBF8NMUc3dQCZRw@mail.gmail.com> <YWPKXvPCTIir+TzG@atomide.com>
In-Reply-To: <YWPKXvPCTIir+TzG@atomide.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 12 Oct 2021 11:05:59 +0200
Message-ID: <CAPDyKFo-pmxG7EfxagqANJzCemf_Y96jdCnzzen=iOdPq-rJBA@mail.gmail.com>
Subject: Re: [PATCH 4/5] mmc: sdhci-omap: Implement PM runtime functions
To:     Tony Lindgren <tony@atomide.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 11 Oct 2021 at 07:23, Tony Lindgren <tony@atomide.com> wrote:
>
> * Ulf Hansson <ulf.hansson@linaro.org> [211008 14:44]:
> > On Thu, 30 Sept 2021 at 08:57, Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > Implement PM runtime functions and enable MMC_CAP_AGGRESSIVE_PM.
> >
> > I suggest you split this change into two pieces. MMC_CAP_AGGRESSIVE_PM
> > is about enabling runtime PM management for the eMMC/SD card device,
> > which is perfectly fine to use independently of whether runtime PM is
> > supported for the host device.
>
> OK
>
> > > @@ -1350,6 +1357,11 @@ static int sdhci_omap_probe(struct platform_device *pdev)
> > >         if (ret)
> > >                 goto err_cleanup_host;
> > >
> > > +       sdhci_omap_context_save(omap_host);
> > > +       omap_host->context_valid = 1;
> >
> > Looks like you can remove this flag, it's not being used.
>
> Hmm I think it is needed as otherwise we end up trying to restore
> an invalid context on probe on the first pm_runtime_get(). Do you
> have some nicer solution for that in mind?

Right, I didn't notice that, my apologies.

In any case, an option is to bring the device into full power, without
calling pm_runtime_resume_and_get() from ->probe(). In principle,
running the same operations as the ->runtime_resume() callback does,
except for restoring the context then. When this is done, the
following calls to runtime PM should do the trick (I extended it to
support autosuspend as well):

pm_runtime_get_noresume()
pm_runtime_set_active()
pm_runtime_set_autosuspend_delay()
pm_runtime_use_autosuspend()
pm_runtime_enable()

Note that, this means that the omaps PM domain's ->runtime_resume()
callback doesn't get invoked when powering on the device for the first
time. Can this be a problem?

>
> > > +
> > > +       pm_runtime_put_sync(dev);
> >
> > I recommend to use the PM runtime autosuspend feature, as to avoid an
> > initial latency for every I/O request to the host driver. The mmc core
> > already supports that, see mmc_release_host().
> >
> > The typical default timeout value for autosuspend, is usually set
> > ~50-200ms, by host drivers (if I recall correctly).
>
> OK I have a patch to also enable autosuspend too, I'll add that
> too for the next revision.
>
> > > @@ -1371,6 +1383,7 @@ static int sdhci_omap_remove(struct platform_device *pdev)
> > >         struct device *dev = &pdev->dev;
> > >         struct sdhci_host *host = platform_get_drvdata(pdev);
> > >
> > > +       pm_runtime_get_sync(dev);
> > >         sdhci_remove_host(host, true);
> > >         pm_runtime_put_sync(dev);
> >
> > There is no guarantee that this triggers a call to
> > ->sdhci_omap_runtime_suspend(), which I guess is what we want.
> > Userspace via sysfs may have increase the RPM usage count
> > (pm_runtime_forbid(), for example.
> >
> > To address this, I would call pm_runtime_disable() first and then
> > explicitly put the device into low power state, rather than relying on
> > runtime PM to do it. Another option could be to use
> > pm_runtime_force_suspend().
>
> OK I'll take a look.
>
> > > @@ -1402,42 +1415,75 @@ static void sdhci_omap_context_restore(struct sdhci_omap_host *omap_host)
> > >         sdhci_omap_writel(omap_host, SDHCI_OMAP_ISE, omap_host->ise);
> > >  }
> > >
> > > -static int __maybe_unused sdhci_omap_suspend(struct device *dev)
> > > +static int __maybe_unused sdhci_omap_runtime_suspend(struct device *dev)
> > >  {
> > >         struct sdhci_host *host = dev_get_drvdata(dev);
> > >         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > >         struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
> > >
> > > -       sdhci_suspend_host(host);
> > > -
> >
> > Shouldn't you call sdhci_runtime_suspend_host() somewhere here?
>
> I'm pretty sure I tried, but runtime resume did not seem to work after
> doing that.. I'll take a look again.
>
> > > +static int __maybe_unused sdhci_omap_suspend(struct device *dev)
> > > +{
> > > +       struct sdhci_host *host = dev_get_drvdata(dev);
> > > +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > > +       struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
> > > +
> > > +       if (omap_host->is_runtime_suspended)
> > > +               return 0;
> >
> > So if the host is already runtime suspended, it's okay to just leave it as is?
>
> Ideally yeah there should not be anything left to do for suspesnd at
> that point. But sounds like I may be missing something.
>
> > In a way that sounds like you could call pm_runtime_force_suspend()
> > instead, assuming the sdhci_omap_runtime_suspend() can be extended to
> > do the right thing for system suspend as well.
>
> OK I'll check.
>
> > It looks a bit odd that sdhci_suspend_host() is called only when the
> > host is runtime resumed. Perhaps you can elaborate a bit more on why
> > this is, so I can understand better what you want to achieve here.
>
> I guess I'm not clear on what's left for sdhci_suspend_host() to do if
> the host is already runtime suspended :)

I think what boils down to that is that, sdhci_suspend|resume_host()
adds some special treatment for system wakeups (for SDIO irqs). I am
not sure whether you may need that.

Some host drivers doesn't use sdhci_suspend|resume_host, but sticks to
the sdhci_runtime_suspend|resume()_host() functions. Like
sdhci-sprd.c, for example.

Kind regards
Uffe
