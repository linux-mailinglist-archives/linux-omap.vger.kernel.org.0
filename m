Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B48BC42A809
	for <lists+linux-omap@lfdr.de>; Tue, 12 Oct 2021 17:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbhJLPTH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Oct 2021 11:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbhJLPTG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Oct 2021 11:19:06 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2EB9C061749
        for <linux-omap@vger.kernel.org>; Tue, 12 Oct 2021 08:17:04 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id j21so71553100lfe.0
        for <linux-omap@vger.kernel.org>; Tue, 12 Oct 2021 08:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mZwXotgdRXbDRTYbxk7Ps+MfiCotYKiewGVd05wCXEg=;
        b=d0bq8nteJsZ6xxSDWZh6n16JvxPEBzNY5WvwIBJlgi7ugmnFpzYKVm7J2fFQHDYRgN
         H4fsvyfRdJf0zAVnG/QAYBLmoB2OKTKNPZsXfBQQmEHFdUws6IT3oJb2BWAXn2Xn423d
         KouB5146/dUf/+8puI1X/H4MkGVV05fsD50y/xUVUFzu5/hig+OrXzv7Zo7Gltw3m6P4
         0fTWn2z0E1gt4q/RszDsICg3+T0R1fVXfRtUZSCrT8/4y218jmNhfcJhB02ty3QeEATm
         AAhPkkfN3wpTOLHOGG5WaMVp+Wt9yzlTHmpKTebCkSGJ/DVHT45S0lX/g1ISX2s/s5/9
         3tXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mZwXotgdRXbDRTYbxk7Ps+MfiCotYKiewGVd05wCXEg=;
        b=1lS8/Bn57buR8CP7TY0MYzyXcH3LiBTEd98vg0V0breUlNORB8fxMO2c82MxyaRqKC
         /MVlZSLH+6sfCEMpd1fCPcbTPZPitJvcopueI6rkAKKfEjpuLtxJRom4nbf7rxlqKDBp
         +lBNl24pbzqzM6w+QZ0tby4So2YL43X4GCXE/S6L4bwCOYI8+OVr0/hcezq7u/RwqTAF
         oL4JBRcuaSlujiXcFSqR3VBKUVEWEmO+1YAW7bM6m+H4YFVA1lG2SDsS5tIXj8QJs7V0
         n+Mw0faA0Kls592X/e4g/Vi+YpW+VrWW0INA8hNa46cKhHVJ74GCw1fsVKrLzwbqSS9u
         nMZg==
X-Gm-Message-State: AOAM531oQiHDBVlE2NuVelNUgGUU7cqNnRBuousWSfnm0qM/YVCL8ngK
        kAjmHmv7TPbX0lt9bx259sEoQpBBUrBaG/oZvRcYoQ==
X-Google-Smtp-Source: ABdhPJzzhuOVO5eUQIR6ctxpH9Ml/c2aH/vUGWsenPtNroPFmlr98Po14oVt0BfhHGm+q9XSoWvUW3yOWA2sHZzYFho=
X-Received: by 2002:a05:651c:4c9:: with SMTP id e9mr30286160lji.229.1634051822985;
 Tue, 12 Oct 2021 08:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211012103750.38328-1-tony@atomide.com> <20211012103750.38328-5-tony@atomide.com>
In-Reply-To: <20211012103750.38328-5-tony@atomide.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 12 Oct 2021 17:16:26 +0200
Message-ID: <CAPDyKFq_jiYPrm_kcprijFfcceVVGnZpkG+4ZY_XSBXJnCT0LA@mail.gmail.com>
Subject: Re: [PATCH 4/6] mmc: sdhci-omap: Implement PM runtime functions
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

On Tue, 12 Oct 2021 at 12:38, Tony Lindgren <tony@atomide.com> wrote:
>
> Implement PM runtime functions and enable autosuspend.
>
> Note that we save context in probe to avoid restoring invalid context
> on the first resume. For system suspend, we have the new PM runtime
> functions do most of the work.
>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/mmc/host/sdhci-omap.c | 78 ++++++++++++++++++++++++++++-------
>  1 file changed, 63 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -1207,6 +1207,8 @@ static const struct soc_device_attribute sdhci_omap_soc_devices[] = {
>         }
>  };
>
> +static void sdhci_omap_context_save(struct sdhci_omap_host *omap_host);
> +
>  static int sdhci_omap_probe(struct platform_device *pdev)
>  {
>         int ret;
> @@ -1252,6 +1254,7 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>         omap_host->timing = MMC_TIMING_LEGACY;
>         omap_host->flags = data->flags;
>         omap_host->omap_offset = data->omap_offset;
> +       omap_host->con = -EINVAL;
>         host->ioaddr += offset;
>         host->mapbase = regs->start + offset;
>
> @@ -1302,6 +1305,8 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>          * SYSCONFIG register of omap devices. The callback will be invoked
>          * as part of pm_runtime_get_sync.
>          */
> +       pm_runtime_use_autosuspend(dev);
> +       pm_runtime_set_autosuspend_delay(dev, 50);
>         pm_runtime_enable(dev);
>         ret = pm_runtime_resume_and_get(dev);
>         if (ret) {
> @@ -1312,7 +1317,7 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>         ret = sdhci_omap_set_capabilities(host);
>         if (ret) {
>                 dev_err(dev, "failed to set system capabilities\n");
> -               goto err_put_sync;
> +               goto err_rpm_put;
>         }
>
>         host->mmc_host_ops.start_signal_voltage_switch =
> @@ -1340,7 +1345,7 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>
>         ret = sdhci_setup_host(host);
>         if (ret)
> -               goto err_put_sync;
> +               goto err_rpm_put;
>
>         ret = sdhci_omap_config_iodelay_pinctrl_state(omap_host);
>         if (ret)
> @@ -1350,15 +1355,21 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>         if (ret)
>                 goto err_cleanup_host;
>
> +       sdhci_omap_context_save(omap_host);

Calling sdhci_omap_context_save() here looks unnecessary. The device
is already runtime resumed at this point.

In other words, sdhci_omap_context_save() will be called from the
->runtime_suspend() callback, next time the device becomes runtime
suspended. That should be sufficient, right?

> +
> +       pm_runtime_mark_last_busy(dev);
> +       pm_runtime_put_autosuspend(dev);
> +
>         return 0;
>
>  err_cleanup_host:
>         sdhci_cleanup_host(host);
>
> -err_put_sync:
> -       pm_runtime_put_sync(dev);
> -
> +err_rpm_put:
> +       pm_runtime_mark_last_busy(dev);
> +       pm_runtime_put_autosuspend(dev);
>  err_rpm_disable:
> +       pm_runtime_dont_use_autosuspend(dev);
>         pm_runtime_disable(dev);
>
>  err_pltfm_free:
> @@ -1371,8 +1382,12 @@ static int sdhci_omap_remove(struct platform_device *pdev)
>         struct device *dev = &pdev->dev;
>         struct sdhci_host *host = platform_get_drvdata(pdev);
>
> +       pm_runtime_get_sync(dev);
>         sdhci_remove_host(host, true);
> +       pm_runtime_dont_use_autosuspend(dev);
>         pm_runtime_put_sync(dev);
> +       /* Ensure device gets idled despite userspace sysfs config */
> +       pm_runtime_force_suspend(dev);
>         pm_runtime_disable(dev);

The call to pm_runtime_disable() can be removed, as that is taken care
of in pm_runtime_force_suspend().

>         sdhci_pltfm_free(pdev);
>
> @@ -1402,42 +1417,75 @@ static void sdhci_omap_context_restore(struct sdhci_omap_host *omap_host)
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
> +       sdhci_runtime_suspend_host(host);
>
>         sdhci_omap_context_save(omap_host);
>
>         pinctrl_pm_select_idle_state(dev);
>
> -       pm_runtime_force_suspend(dev);
> -
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
> +       if (omap_host->con != -EINVAL)
> +               sdhci_omap_context_restore(omap_host);
> +
> +       sdhci_runtime_resume_host(host, 0);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused sdhci_omap_suspend(struct device *dev)
> +{
> +       struct sdhci_host *host = dev_get_drvdata(dev);
> +       int err;
> +
> +       /* Enable for configuring wakeups, paired in resume */
> +       err = pm_runtime_resume_and_get(dev);
> +       if (err < 0)
> +               return err;
> +
> +       sdhci_suspend_host(host);

As far as I can tell, sdhci_suspend_host() doesn't really make sense
for the omap variant. What you need, is to put the device into the
same low power state as "runtime suspend", that should be sufficient.

The system wakeup will be armed (and later then disarmed) by the PM
core, when it calls device_wakeup_arm_wake_irqs() from the
dpm_suspend_noirq() phase.

In other words, pointing the system suspend/resume callbacks to
pm_runtime_force_suspend|resume() should work fine, I think.

> +
> +       return pm_runtime_force_suspend(dev);
> +}
> +
> +static int __maybe_unused sdhci_omap_resume(struct device *dev)
> +{
> +       struct sdhci_host *host = dev_get_drvdata(dev);
> +       int err;
> +
> +       err = pm_runtime_force_resume(dev);
> +       if (err < 0)
> +               dev_warn(dev, "force resume failed: %i\n", err);
>
>         sdhci_resume_host(host);
>
> +       /* Balance pm_runtime_resume_and_get() done in suspend */
> +       pm_runtime_put(dev);
> +
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
