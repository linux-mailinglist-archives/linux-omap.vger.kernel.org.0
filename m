Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7FAE426CEA
	for <lists+linux-omap@lfdr.de>; Fri,  8 Oct 2021 16:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241341AbhJHOqE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Oct 2021 10:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242570AbhJHOqD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Oct 2021 10:46:03 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78A0C061755
        for <linux-omap@vger.kernel.org>; Fri,  8 Oct 2021 07:44:07 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id i24so38680653lfj.13
        for <linux-omap@vger.kernel.org>; Fri, 08 Oct 2021 07:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FTJ2jzOfmc3TfTGxqKqcv2O3a+phTUEvAqWV0+MH2I8=;
        b=s53m6uBMCKLVuMai6xOkjXRWzjdBLDWO9V6TCYwEVJt2137PhtrSymyhoMDNpkbBTN
         dTkXP50Zihn4E6SNLs1NBxsimctK1QYxpfOVPuzNH/MjjM6cDlAhFZtgB/8IDdftxwku
         5CUbrSpqPYl1GyJKo4VhKPUGQVBKubfvlReegWA+A7s3/v2CyUuaxeNs+GqZodeeJZgV
         m84zRvKn33o1ImOZ8uW2+2o9/o52yr5WEicoFX16v/w4zSsw5LwfY2PXV52S0ceL5Y9v
         zinQG5YgDeMEheB4ZV3tpNB1oQ3Iv6TLky7A5Nq7vC4bnBwQnXWN0LZm78hR4k5S6/ue
         G7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FTJ2jzOfmc3TfTGxqKqcv2O3a+phTUEvAqWV0+MH2I8=;
        b=uBcMg35RWEW/wYUjnhSSn8H/WBTtN290OdpxZwxv8QpX4sZP3eAO20EjqJQT9ZfSW9
         kOM62kZ/APvHAsdbG1ko3qELzPad7Ll8a2S9zDAv/xgKSC5WKxlFpziQ/Z/XiGXzDZ+r
         eVmgXcGPtxA1hqus3SjObj/Nh13Kv7635hXHcv6VpA0pVEKYx4F9Wdzzk5X/rbFHcaQo
         7/t4im5DBkOLptEEwqzyZHG7QuREOqsceBi1NbNEmdEt6u7FCTESdgVqXFrQcOU95mjR
         6ZewrcFZEqYbjk68QUwstGiHCFcnKS9k/Y/7M+rdFmtLVKWZYqVP3Qt2OR7ziwqh67bh
         t0QQ==
X-Gm-Message-State: AOAM531v6CXqM5meJSfQxLPH6zIY49EyZqRhgTrigXaUrUf9D+pYIORX
        8mQL291XONo4iXAk8KWGxgq5upNJJ4ADlKnR5RJHXA==
X-Google-Smtp-Source: ABdhPJzO67ce7CZQmVwkFnv5byVeOw9GUdg20sd6cp27QaBH2EPeuuev9vaX1QT+7hshqASQHLuGWvTJLwml3zHz5tY=
X-Received: by 2002:a19:6a16:: with SMTP id u22mr10587977lfu.254.1633704245995;
 Fri, 08 Oct 2021 07:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210930065733.31943-1-tony@atomide.com> <20210930065733.31943-5-tony@atomide.com>
In-Reply-To: <20210930065733.31943-5-tony@atomide.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 8 Oct 2021 16:43:29 +0200
Message-ID: <CAPDyKFpybVPeYy-FsXnzDXNri+f7rhPmKa6vBF8NMUc3dQCZRw@mail.gmail.com>
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

On Thu, 30 Sept 2021 at 08:57, Tony Lindgren <tony@atomide.com> wrote:
>
> Implement PM runtime functions and enable MMC_CAP_AGGRESSIVE_PM.

I suggest you split this change into two pieces. MMC_CAP_AGGRESSIVE_PM
is about enabling runtime PM management for the eMMC/SD card device,
which is perfectly fine to use independently of whether runtime PM is
supported for the host device.

>
> Note that we save context in probe to avoid restoring invalid context
> on the first resume. For system suspend, we have the new PM runtime
> functions do most of the work.
>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/mmc/host/sdhci-omap.c | 66 +++++++++++++++++++++++++++++------
>  1 file changed, 56 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -117,6 +117,9 @@ struct sdhci_omap_host {
>
>         struct pinctrl          *pinctrl;
>         struct pinctrl_state    **pinctrl_state;
> +       unsigned long           context_valid:1;
> +       unsigned long           is_runtime_suspended:1;
> +       unsigned long           needs_resume:1;
>         bool                    is_tuning;
>
>         /* Offset for omap specific registers from base */
> @@ -1207,6 +1210,8 @@ static const struct soc_device_attribute sdhci_omap_soc_devices[] = {
>         }
>  };
>
> +static void sdhci_omap_context_save(struct sdhci_omap_host *omap_host);
> +
>  static int sdhci_omap_probe(struct platform_device *pdev)
>  {
>         int ret;
> @@ -1338,6 +1343,8 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>         /* R1B responses is required to properly manage HW busy detection. */
>         mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
>
> +       mmc->caps |= MMC_CAP_AGGRESSIVE_PM;
> +
>         ret = sdhci_setup_host(host);
>         if (ret)
>                 goto err_put_sync;
> @@ -1350,6 +1357,11 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>         if (ret)
>                 goto err_cleanup_host;
>
> +       sdhci_omap_context_save(omap_host);
> +       omap_host->context_valid = 1;

Looks like you can remove this flag, it's not being used.

> +
> +       pm_runtime_put_sync(dev);

I recommend to use the PM runtime autosuspend feature, as to avoid an
initial latency for every I/O request to the host driver. The mmc core
already supports that, see mmc_release_host().

The typical default timeout value for autosuspend, is usually set
~50-200ms, by host drivers (if I recall correctly).

> +
>         return 0;
>
>  err_cleanup_host:
> @@ -1371,6 +1383,7 @@ static int sdhci_omap_remove(struct platform_device *pdev)
>         struct device *dev = &pdev->dev;
>         struct sdhci_host *host = platform_get_drvdata(pdev);
>
> +       pm_runtime_get_sync(dev);
>         sdhci_remove_host(host, true);
>         pm_runtime_put_sync(dev);

There is no guarantee that this triggers a call to
->sdhci_omap_runtime_suspend(), which I guess is what we want.
Userspace via sysfs may have increase the RPM usage count
(pm_runtime_forbid(), for example.

To address this, I would call pm_runtime_disable() first and then
explicitly put the device into low power state, rather than relying on
runtime PM to do it. Another option could be to use
pm_runtime_force_suspend().

>         pm_runtime_disable(dev);
> @@ -1402,42 +1415,75 @@ static void sdhci_omap_context_restore(struct sdhci_omap_host *omap_host)
>         sdhci_omap_writel(omap_host, SDHCI_OMAP_ISE, omap_host->ise);
>  }
>
> -static int __maybe_unused sdhci_omap_suspend(struct device *dev)
> +static int __maybe_unused sdhci_omap_runtime_suspend(struct device *dev)
>  {
>         struct sdhci_host *host = dev_get_drvdata(dev);
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
>
> -       sdhci_suspend_host(host);
> -

Shouldn't you call sdhci_runtime_suspend_host() somewhere here?

>         sdhci_omap_context_save(omap_host);
>
>         pinctrl_pm_select_idle_state(dev);
>
> -       pm_runtime_force_suspend(dev);
> +       omap_host->is_runtime_suspended = 1;
>
>         return 0;
>  }
>
> -static int __maybe_unused sdhci_omap_resume(struct device *dev)
> +static int __maybe_unused sdhci_omap_runtime_resume(struct device *dev)
>  {
>         struct sdhci_host *host = dev_get_drvdata(dev);
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
>
> -       pm_runtime_force_resume(dev);
> -
>         pinctrl_pm_select_default_state(dev);
>
> -       sdhci_omap_context_restore(omap_host);
> +       if (omap_host->context_valid)
> +               sdhci_omap_context_restore(omap_host);
> +
> +       omap_host->is_runtime_suspended = 0;

Shouldn't you call sdhci_runtime_resume_host() somewhere here?

> +
> +       return 0;
> +}
> +
> +static int __maybe_unused sdhci_omap_suspend(struct device *dev)
> +{
> +       struct sdhci_host *host = dev_get_drvdata(dev);
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
> +
> +       if (omap_host->is_runtime_suspended)
> +               return 0;

So if the host is already runtime suspended, it's okay to just leave it as is?

In a way that sounds like you could call pm_runtime_force_suspend()
instead, assuming the sdhci_omap_runtime_suspend() can be extended to
do the right thing for system suspend as well.

It looks a bit odd that sdhci_suspend_host() is called only when the
host is runtime resumed. Perhaps you can elaborate a bit more on why
this is, so I can understand better what you want to achieve here.

> +
> +       sdhci_suspend_host(host);
> +       sdhci_omap_runtime_suspend(dev);
> +       omap_host->needs_resume = 1;
>
> +       return 0;
> +}
> +
> +static int __maybe_unused sdhci_omap_resume(struct device *dev)
> +{
> +       struct sdhci_host *host = dev_get_drvdata(dev);
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
> +
> +       if (!omap_host->needs_resume)
> +               return 0;
> +
> +       sdhci_omap_runtime_resume(dev);
>         sdhci_resume_host(host);
> +       omap_host->needs_resume = 0;
>
>         return 0;
>  }
>  #endif
> -static SIMPLE_DEV_PM_OPS(sdhci_omap_dev_pm_ops, sdhci_omap_suspend,
> -                        sdhci_omap_resume);
> +
> +static const struct dev_pm_ops sdhci_omap_dev_pm_ops = {
> +       SET_RUNTIME_PM_OPS(sdhci_omap_runtime_suspend,
> +                          sdhci_omap_runtime_resume, NULL)
> +       SET_SYSTEM_SLEEP_PM_OPS(sdhci_omap_suspend, sdhci_omap_resume)
> +};
>
>  static struct platform_driver sdhci_omap_driver = {
>         .probe = sdhci_omap_probe,
> --
> 2.33.0

Kind regards
Uffe
