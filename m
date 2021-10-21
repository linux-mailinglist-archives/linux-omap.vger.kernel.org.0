Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993E9436B7F
	for <lists+linux-omap@lfdr.de>; Thu, 21 Oct 2021 21:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbhJUTwM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Oct 2021 15:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231865AbhJUTwM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Oct 2021 15:52:12 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06DDC061764
        for <linux-omap@vger.kernel.org>; Thu, 21 Oct 2021 12:49:55 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bp15so1159179lfb.4
        for <linux-omap@vger.kernel.org>; Thu, 21 Oct 2021 12:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D1Vqa/g0rEQHkM0+hCTtJjzL8oUEQIL01Oq3eBGrPy0=;
        b=sk4VtZ/ZQ0xo/8srAxJqz4exkITYAImyJzt8zZN505xrA5j9jHjUVjd39sQ4l4w/Te
         pdVQywJvtAhrdomLdkgwCQCHlAL0fiaQsL02UDsiv9UrtXA1Tmdk+OHdxVWbxi2zgTLS
         c0sP58fM46Y2HsqJCRsfI34C7LBlqWwprDfXiykZNQMJiVVQrIBkZQ5QDooITqQT+uSa
         cPwtVFNywJf6N+fakCD0udO/oGHfKD8SAq09c9VpkVcMSXmvh5m7ZCW8vo2KjreDuWtF
         buz5drtXPe+T1Ry+IMselnxC1EVpeWkRDNWR6mGzG32bCQCf1eu7juWQ8Gu4dWsk2oji
         MovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D1Vqa/g0rEQHkM0+hCTtJjzL8oUEQIL01Oq3eBGrPy0=;
        b=ZNLw1RQN5R2Tx9z+V3AQDi4zgTs3NJRPhrhBb41LcONKFVQ2qr8Zr+63Q7aDF75vKs
         6aXV/O1vy+onHFyYkkTXIr3MQy0mwH5/HIDZb+BbMeCfguAqnICHhrmTRtzr0L5OTu9A
         O4C8e3C8ZdaPEXnH2T30vKpLREeF3v8PbplLGDnz2S6sGgd8kqGrxlNJtdXjSzUMZzrV
         gv1OwZKpWb7mIUzSPUX4PFgSuXj2anUmHedRFqw3byf5P/gA/Z6JLa7kyxpvi5E+8HBq
         oyDezCdqVCWovWw1Ys1oK6CLIJ2QmejhdgDYP+ZR+NE+a7/0GkSdqIqEosEU3ymOgEVr
         PCOA==
X-Gm-Message-State: AOAM533hGsYNWVDetU5uk49r+EH2DFBkS271Mk4qghEcxldxoPZgl07m
        bFTCJQ7AJtBlOakusGDVB+TBBfICjJU2Z1T5xoLrHQ==
X-Google-Smtp-Source: ABdhPJz8mVTqjOquYfe1jSpYa+U03zOUNSWiRhJyIdVzHvt4NYBQObSpIHUIW8oim4xnQD6nb26PaxnPuVZ6wfyeYRI=
X-Received: by 2002:a05:6512:3254:: with SMTP id c20mr6223456lfr.254.1634845794089;
 Thu, 21 Oct 2021 12:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211021134352.10135-1-tony@atomide.com> <CAPDyKFr83Kw20272=SYUY5_r1AMmbJRb=XdGaNu0-RojuXSAXQ@mail.gmail.com>
In-Reply-To: <CAPDyKFr83Kw20272=SYUY5_r1AMmbJRb=XdGaNu0-RojuXSAXQ@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 21 Oct 2021 21:49:17 +0200
Message-ID: <CAPDyKFpphTGMQBoOSx4AhojG7Hgt1aRxUcXDf+Kwv8bXrsi6ew@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-omap: Fix build if CONFIG_PM_SLEEP is not set
To:     Tony Lindgren <tony@atomide.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 21 Oct 2021 at 21:34, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 21 Oct 2021 at 15:43, Tony Lindgren <tony@atomide.com> wrote:
> >
> > Commit f433e8aac6b9 ("mmc: sdhci-omap: Implement PM runtime functions")
> > combined the use of runtime PM and system suspend functions but left the
> > ifdef CONFIG_PM_SLEEP in place causing undeclared identifier error for
> > sdhci_omap_runtime_suspend if CONFIG_PM_SLEEP is not enabled.
> >
> > Let's fix the error by removing ifdef CONFIG_PM_SLEEP and tagging the
> > reset of the PM related functions with __maybe_unused.
> >
> > Let's also remove the forward declaration for sdhci_omap_context_save(),
> > that was accidentally left from an earlier version and is no longer used.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>

Well, I decided to amend the patch and apply it. It needed a small
rebase on top of Geert's other patch too. No action needed for you.

Kind regards
Uffe

> > ---
> >  drivers/mmc/host/sdhci-omap.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> > --- a/drivers/mmc/host/sdhci-omap.c
> > +++ b/drivers/mmc/host/sdhci-omap.c
> > @@ -1210,8 +1210,6 @@ static const struct soc_device_attribute sdhci_omap_soc_devices[] = {
> >         }
> >  };
> >
> > -static void sdhci_omap_context_save(struct sdhci_omap_host *omap_host);
> > -
> >  static int sdhci_omap_probe(struct platform_device *pdev)
> >  {
> >         int ret;
> > @@ -1417,8 +1415,8 @@ static int sdhci_omap_remove(struct platform_device *pdev)
> >
> >         return 0;
> >  }
> > -#ifdef CONFIG_PM_SLEEP
>
> This above should be:
> #ifdef CONFIG_PM
>
> sdhci_runtime_suspend|resume() host is defined like this as well, so
> the below would trigger a compiler error when built with CONFIG_PM
> unset.
>
> > -static void sdhci_omap_context_save(struct sdhci_omap_host *omap_host)
> > +
> > +static void __maybe_unused sdhci_omap_context_save(struct sdhci_omap_host *omap_host)
> >  {
> >         omap_host->con = sdhci_omap_readl(omap_host, SDHCI_OMAP_CON);
> >         omap_host->hctl = sdhci_omap_readl(omap_host, SDHCI_OMAP_HCTL);
> > @@ -1429,7 +1427,7 @@ static void sdhci_omap_context_save(struct sdhci_omap_host *omap_host)
> >  }
> >
> >  /* Order matters here, HCTL must be restored in two phases */
> > -static void sdhci_omap_context_restore(struct sdhci_omap_host *omap_host)
> > +static void __maybe_unused sdhci_omap_context_restore(struct sdhci_omap_host *omap_host)
> >  {
> >         sdhci_omap_writel(omap_host, SDHCI_OMAP_HCTL, omap_host->hctl);
> >         sdhci_omap_writel(omap_host, SDHCI_OMAP_CAPA, omap_host->capa);
> > @@ -1471,7 +1469,6 @@ static int __maybe_unused sdhci_omap_runtime_resume(struct device *dev)
> >
> >         return 0;
> >  }
> > -#endif
> >
> >  static const struct dev_pm_ops sdhci_omap_dev_pm_ops = {
> >         SET_RUNTIME_PM_OPS(sdhci_omap_runtime_suspend,
>
> Kind regards
> Uffe
