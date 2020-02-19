Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6B121648AB
	for <lists+linux-omap@lfdr.de>; Wed, 19 Feb 2020 16:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbgBSPdO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Feb 2020 10:33:14 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:33393 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgBSPdM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Feb 2020 10:33:12 -0500
Received: by mail-vk1-f193.google.com with SMTP id i78so248479vke.0
        for <linux-omap@vger.kernel.org>; Wed, 19 Feb 2020 07:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B959khvT84b54sEM8tghbbUlQpBSgoiJm08ZcmwuegA=;
        b=eghvWX7js0XiGPlmhALCbzH4aN8B1C/uQ7gF+uORhm1q7dwF+lV6Z1KzWbM55YO9ZK
         j2ccaQKbuxg799MB+Mvtd+gPlhQmZV6h5ngAWdKlwCGDr0aSqFqVmonvLWw4iqBXuSCF
         iysv8VBaijhL4GAJhNMKzneyV5rjnzvuX/9mOJG6kl5zKCeFCWInymaVl0QJW+DoY9jw
         1mjn6zeqIe6NUP0FbysloUukNDeQ/gk5WSz0T0jko6RojecK5DtZbdcXayugtnRKbG+H
         nFUF+7SERBlbGjvQC5fiRNkoTksq/l/yri3meZh8u8Oez4jiceuBG5mgHLwDNfj1m331
         Pd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B959khvT84b54sEM8tghbbUlQpBSgoiJm08ZcmwuegA=;
        b=iQtDLHWZ/gkxZillsCnZAziHJ5ZrBxBY4UCXzA3HTi9OY+XfPIKxbfTNgO3azsaPAu
         YDjJLriVjQwkp8wdFVIjiuo5B16Mx/2Fwc9Q/ypo/R8/Kk4e695oOU8/lhEv9aJ/4bp3
         1D3Xoa54Y5zw5dAiMOBED8i6IgZ/kTkGds0NMYDJTbhcG2eEs+y8zfTDnQ8kYUxkHtV1
         vGcB7HbxK/iM1gcwXYJnS+7tHuHSSqahs4mlLTiWLFjsvOU1VmNFZM7HU9rlCb71RKp3
         MCmJOqWMifPp0Ilp/ScBRAm5D9uqbMfLj14/Ia2Z8f6qHk0CU94ZePjRrI6j/P/kht5R
         UuYA==
X-Gm-Message-State: APjAAAV9aj66TsrLcjsBkRr+KtAw2FXt3RQeQ7YmBFoukklJIHmy80kN
        9tDvhYLTbzjsXTflTFn6bxuNs5TDsPxpqFLULZrK8w==
X-Google-Smtp-Source: APXvYqwdCBg14mqgq6FSd4cLQdRJcTEMGjkEcuHhxoXHgUrrMs1m7Ep1Gl103JXiMIJeaNswAWo3hH8/vwap2oiAudo=
X-Received: by 2002:a1f:4541:: with SMTP id s62mr11476690vka.59.1582126390564;
 Wed, 19 Feb 2020 07:33:10 -0800 (PST)
MIME-Version: 1.0
References: <20200218141018.24456-1-faiz_abbas@ti.com>
In-Reply-To: <20200218141018.24456-1-faiz_abbas@ti.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 19 Feb 2020 16:32:34 +0100
Message-ID: <CAPDyKFqQPwugTc0GtCa=5oU1Y5s2Z=0UNiyW7KubYkZtQ_Sn9A@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-omap: Add Support for Suspend/Resume
To:     Faiz Abbas <faiz_abbas@ti.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kishon <kishon@ti.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 18 Feb 2020 at 15:08, Faiz Abbas <faiz_abbas@ti.com> wrote:
>
> Add power management ops which save and restore the driver context and
> facilitate a system suspend and resume.
>
> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
> ---
>  drivers/mmc/host/sdhci-omap.c | 59 +++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> index 882053151a47..a524c01da8de 100644
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -108,6 +108,11 @@ struct sdhci_omap_host {
>         struct pinctrl          *pinctrl;
>         struct pinctrl_state    **pinctrl_state;
>         bool                    is_tuning;
> +       /* Omap specific context save */
> +       u32                     con;
> +       u32                     hctl;
> +       u32                     sysctl;
> +       u32                     capa;
>  };
>
>  static void sdhci_omap_start_clock(struct sdhci_omap_host *omap_host);
> @@ -1233,11 +1238,65 @@ static int sdhci_omap_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static void sdhci_omap_context_save(struct sdhci_omap_host *omap_host)
> +{
> +       omap_host->con = sdhci_omap_readl(omap_host, SDHCI_OMAP_CON);
> +       omap_host->hctl = sdhci_omap_readl(omap_host, SDHCI_OMAP_HCTL);
> +       omap_host->sysctl = sdhci_omap_readl(omap_host, SDHCI_OMAP_SYSCTL);
> +       omap_host->capa = sdhci_omap_readl(omap_host, SDHCI_OMAP_CAPA);
> +}
> +
> +static void sdhci_omap_context_restore(struct sdhci_omap_host *omap_host)
> +{
> +       sdhci_omap_writel(omap_host, SDHCI_OMAP_CON, omap_host->con);
> +       sdhci_omap_writel(omap_host, SDHCI_OMAP_HCTL, omap_host->hctl);
> +       sdhci_omap_writel(omap_host, SDHCI_OMAP_SYSCTL, omap_host->sysctl);
> +       sdhci_omap_writel(omap_host, SDHCI_OMAP_CAPA, omap_host->capa);
> +}
> +
> +static int __maybe_unused sdhci_omap_suspend(struct device *dev)
> +{
> +       struct sdhci_host *host = dev_get_drvdata(dev);
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
> +
> +       sdhci_suspend_host(host);
> +
> +       sdhci_omap_context_save(omap_host);
> +
> +       pinctrl_pm_select_idle_state(dev);
> +
> +       pm_runtime_put_sync(dev);

What exactly do you want to achieve by calling pm_runtime_put_sync() here?

Restoring the usage count from the pm_runtime_get_sync() during
->probe(), makes little sense to me. This because, the PM core is
preventing the device from being runtime suspended anyway, as it calls
pm_runtime_get_noresume() in device_prepare().

Or maybe there are other reasons?

> +
> +       return 0;
> +}
> +
> +static int __maybe_unused sdhci_omap_resume(struct device *dev)
> +{
> +       struct sdhci_host *host = dev_get_drvdata(dev);
> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +       struct sdhci_omap_host *omap_host = sdhci_pltfm_priv(pltfm_host);
> +
> +       pm_runtime_get_sync(dev);
> +
> +       pinctrl_pm_select_default_state(dev);
> +
> +       sdhci_omap_context_restore(omap_host);
> +
> +       sdhci_resume_host(host);
> +
> +       return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(sdhci_omap_dev_pm_ops, sdhci_omap_suspend,
> +                        sdhci_omap_resume);
> +
>  static struct platform_driver sdhci_omap_driver = {
>         .probe = sdhci_omap_probe,
>         .remove = sdhci_omap_remove,
>         .driver = {
>                    .name = "sdhci-omap",
> +                  .pm = &sdhci_omap_dev_pm_ops,
>                    .of_match_table = omap_sdhci_match,
>                   },
>  };
> --
> 2.19.2
>

Kind regards
Uffe
