Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB0C7557C64
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jun 2022 15:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbiFWNA5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jun 2022 09:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbiFWNA4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jun 2022 09:00:56 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4836A4D260
        for <linux-omap@vger.kernel.org>; Thu, 23 Jun 2022 06:00:55 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id a2so33224871lfg.5
        for <linux-omap@vger.kernel.org>; Thu, 23 Jun 2022 06:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3tjemiHgMeJkPV1CMwJ5kB4pSWew/svVdoIdaBSCeU4=;
        b=fxEy8++mVy0XV6ou/XBYsSnZ1z/Xm04h6Rj1n+gZ5h84ZjDiRBQmI7X0tt1uj7FMB9
         XAKRRGOd6ny+6S0JvtXsV5NnfFdraG6Mai7ckc1FsnFtsrpeKbbd6Gvt6gLJ4s76/hqP
         T3BGMjPPuIDezsY8dzxdwBoWV/ZMFvbPnn5LeqtZr8pQDzurEj/l9/5R67lFUO3bRA7D
         k2R0NIVwyMrJ7AQzeRqv9KjLUV0oh51o7LO2MEPsniH4OwYoGmd986vKUNnjRQpEM1Xy
         SBV/r+l/69IfBhhEwKlgZkTTZq+pqVj/ej/igCAllV3V/uK0RKIAFLiuO6E5vWKaASfH
         bATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3tjemiHgMeJkPV1CMwJ5kB4pSWew/svVdoIdaBSCeU4=;
        b=IZF8zJAar0UmNGtfxcrE8U3Lg/uJPliyqQ+9Q5cNl4dddNFs2SxB5sGpLGNUKUuSPT
         1o4B58r1i0E7HPImIKoFs32rSJs4O9lM60F5W1rUi+7MRWXBiij4yPsBzOHdYfyCCbke
         03cFiirH5DM9krJ0mlISBIzGG5p8/aVi711hY5BrzP3qXEYhBf2t8/UmSG8WfptK612F
         88yvobVsxNPH25AgA+77wWQMEhlIA6QEobYlOyA4EY5MjA3gc01Dd6iebFm1r5CwElla
         RTOrKIBgChjWCY+0Kq79jFSUd7XBmYmiWlXVnwDvV0n+mH93lU18Kd/uwO++Bds8IEuv
         6iCA==
X-Gm-Message-State: AJIora9UfI2e+yDqp4HJlcVtNlYbqVaQCPqsoXsBGfAp9Br6eNkS70Ig
        2XUJoSUTQy2T7iI9iCFa0IvOxDkDKPPYxIqhmskDtg==
X-Google-Smtp-Source: AGRyM1vbEM2aoyjJ2red74wiwqVF17nxnkTnXm44urx6DpYYObs8b78IX/bBER1va8STgzEDgNC+omnkQs7A5dZiX2U=
X-Received: by 2002:a05:6512:3085:b0:479:3986:1d23 with SMTP id
 z5-20020a056512308500b0047939861d23mr5384108lfd.373.1655989253463; Thu, 23
 Jun 2022 06:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220622051215.34063-1-tony@atomide.com>
In-Reply-To: <20220622051215.34063-1-tony@atomide.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 23 Jun 2022 15:00:16 +0200
Message-ID: <CAPDyKFpNBQK3QZk-+5-4YB8=2O3sxwj5-nThd00ayp7FHSjUSA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mmc: sdhci-omap: Fix a lockdep warning for PM
 runtime init
To:     Tony Lindgren <tony@atomide.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 22 Jun 2022 at 07:12, Tony Lindgren <tony@atomide.com> wrote:
>
> We need runtime PM enabled early in probe before sdhci_setup_host() for
> sdhci_omap_set_capabilities(). But on the first runtime resume we must
> not call sdhci_runtime_resume_host() as sdhci_setup_host() has not been
> called yet. Let's check for an initialized controller like we already do
> for context restore to fix a lockdep warning.

Thanks for explaining the background to the problem. However, looking
a bit closer I am worried that the error path in ->probe() is broken
too.

It seems in the error path, at the label "err_rpm_put", there is a
call to pm_runtime_put_autosuspend(). This doesn't really guarantee
that the ->runtime_suspend() callback will be invoked, which I guess
is the assumption, don't you think?

That said, I wonder if it would not be easier to convert the ->probe()
function to make use of pm_runtime_get_noresume() and
pm_runtime_set_active() instead. In this way the ->probe() function
becomes responsible of turning on/off the resources "manually" that it
requires to probe (and when it fails to probe), while we can keep the
->runtime_suspend|resume() callbacks simpler.

Did that make sense to you?

Kind regards
Uffe

>
> Fixes: f433e8aac6b9 ("mmc: sdhci-omap: Implement PM runtime functions")
> Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>
> Changes since v1:
>
> - Add comments for why runtime PM is needed before sdhci_setup_host()
>   as suggested by Adrian
>
> ---
>  drivers/mmc/host/sdhci-omap.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -1298,8 +1298,9 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>         /*
>          * omap_device_pm_domain has callbacks to enable the main
>          * functional clock, interface clock and also configure the
> -        * SYSCONFIG register of omap devices. The callback will be invoked
> -        * as part of pm_runtime_get_sync.
> +        * SYSCONFIG register to clear any boot loader set voltage
> +        * capabilities before calling sdhci_setup_host(). The
> +        * callback will be invoked as part of pm_runtime_get_sync.
>          */
>         pm_runtime_use_autosuspend(dev);
>         pm_runtime_set_autosuspend_delay(dev, 50);
> @@ -1441,7 +1442,8 @@ static int __maybe_unused sdhci_omap_runtime_suspend(struct device *dev)
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
>
> -       sdhci_runtime_suspend_host(host);
> +       if (omap_host->con != -EINVAL)
> +               sdhci_runtime_suspend_host(host);
>
>         sdhci_omap_context_save(omap_host);
>
> @@ -1458,10 +1460,10 @@ static int __maybe_unused sdhci_omap_runtime_resume(struct device *dev)
>
>         pinctrl_pm_select_default_state(dev);
>
> -       if (omap_host->con != -EINVAL)
> +       if (omap_host->con != -EINVAL) {
>                 sdhci_omap_context_restore(omap_host);
> -
> -       sdhci_runtime_resume_host(host, 0);
> +               sdhci_runtime_resume_host(host, 0);
> +       }
>
>         return 0;
>  }
> --
> 2.36.1
