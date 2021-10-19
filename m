Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B0D4334D5
	for <lists+linux-omap@lfdr.de>; Tue, 19 Oct 2021 13:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235396AbhJSLj7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Oct 2021 07:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235425AbhJSLjq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Oct 2021 07:39:46 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4132CC061769
        for <linux-omap@vger.kernel.org>; Tue, 19 Oct 2021 04:37:29 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x192so6679133lff.12
        for <linux-omap@vger.kernel.org>; Tue, 19 Oct 2021 04:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CdPF+nAmej64mkR0xEgrQMTU0no804stc0osvj6kTUg=;
        b=lZYxFWcKseVaD8ggpOAQFkgIWWlgAO6sN+FF9jcLwlhS3lrFVB5KyR8l8ZfmHtxL47
         szt5OrrZCFK2dSyV1ZKyfCDUrtrSTRT5ipWX9seSlWfav6OxroI2PTm8FQWCwhNl+uKu
         4J8gVG6OArjQSom9+ixsQZWRMjCE/N+nhbgwsBjDLY6sSGLfHn9dbVrDNyjD1XYqfKuq
         7dg3UbCgNhgc+O5VxwUxWCFPADhFekYCjz/IquF7jkv6Trt7+dAuzUip9z+jHPSODShn
         /Hl34ChP8MeQLItRCLKh/mJwHgiEI8Vo+FgGxjeYUteu0IEpSFSmZCZgork79wsabyvx
         8zuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CdPF+nAmej64mkR0xEgrQMTU0no804stc0osvj6kTUg=;
        b=0ysSw6suv7/srJ4NtKwLnjI1x0Kso5P65bzr+DjvvCkYwVCkF65F9F1HTmVMGvcfGG
         e5/ej6amDwvt6LVzRw66KTyCiW7qzD71Fru97z2H7nNe3UnkkxbnTz9de3aPN5KNCK2y
         6WqnrfTjj6aKtqVdbiFqmTFZcTj6GmmJMgrl7pWuISos1rvhuSTdQOxI7yP9SPvAEdKg
         jgEt+sEw6X0w05wNlXKdcxkDfQEoTkTpzyoSS7z/MPPBpZvSsptgtGwiTIxW660f3y2t
         8h28pOakrCcAqfvciH04Ebp1dNBfXYDWUcroLY5jp39jx0RahXcXG96DPOENxA4RsVal
         ga7A==
X-Gm-Message-State: AOAM532AP8rhN0r4KCccAWDaDSJm+8GTO3NjmW1KwyzJQbeyDQL3XrFb
        JdfDevt0PWtKzIWATlrcpoxE9baNT0qyjxeT7UZQMg==
X-Google-Smtp-Source: ABdhPJxKT3O/0e6XB8E3CXnzNjzfH4t/JQnxNF+xHXvwOIFdL47cQ56BLWHm9PXUgYML55dzAFoM5Me5qL51ZGBzpb8=
X-Received: by 2002:ac2:5e3c:: with SMTP id o28mr5494689lfg.184.1634643447603;
 Tue, 19 Oct 2021 04:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211015104720.52240-1-tony@atomide.com>
In-Reply-To: <20211015104720.52240-1-tony@atomide.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 19 Oct 2021 13:36:51 +0200
Message-ID: <CAPDyKFra85z7w3LkJFJ-rkb-0PwdcxRCAVTrFEWpvV7gqJAAtw@mail.gmail.com>
Subject: Re: [PATCHv4 0/6] More SoCs for sdhci-omap to deprecate omap_hsmmc
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

On Fri, 15 Oct 2021 at 12:47, Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> Here are v4 changes to add support to sdhci-omap for earlier SoCs so we
> can start deprecating the old omap_hsmmc driver.
>
> For most part these changes can be tested just by changing the old hsmmc
> devicetree compatible value for the SoC as described in the first binding
> patch. Then after some testing, I'll post patches to enable sdhci-omap
> for all the omap variants instead of omap_hsmmc.
>
> These patches are against current Linux next.
>
> Regards,
>
> Tony
>
> Changes since v3:
>
> - More runtime PM fixes and improvments as commented by Ulf
>
> - Use 0U instead of 0UL to fix compile warnings
>
> Changes since v2:
>
> - Fix up runtime PM issues and enable autosuspend based on comments
>   from Ulf
>
>   Changes since v1:
>
>   - Added Rob's ack for the binding changes
>
>   - Fix wakeirq assignment as noted by Grygorii
>
>
> Tony Lindgren (6):
>   dt-bindings: sdhci-omap: Update binding for legacy SoCs
>   mmc: sdhci-omap: Handle voltages to add support omap4
>   mmc: sdhci-omap: Add omap_offset to support omap3 and earlier
>   mmc: sdhci-omap: Implement PM runtime functions
>   mmc: sdhci-omap: Allow SDIO card power off and enable aggressive PM
>   mmc: sdhci-omap: Configure optional wakeirq
>
>  .../devicetree/bindings/mmc/sdhci-omap.txt    |   6 +-
>  drivers/mmc/host/sdhci-omap.c                 | 260 ++++++++++++++----
>  2 files changed, 204 insertions(+), 62 deletions(-)
>
> --
> 2.33.0

Applied for next, thanks!

Kind regards
Uffe
