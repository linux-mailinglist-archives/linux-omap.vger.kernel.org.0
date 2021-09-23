Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED4C541656B
	for <lists+linux-omap@lfdr.de>; Thu, 23 Sep 2021 20:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242770AbhIWSwL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Sep 2021 14:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242823AbhIWSwJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Sep 2021 14:52:09 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F3CC061574
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 11:50:37 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i25so30230478lfg.6
        for <linux-omap@vger.kernel.org>; Thu, 23 Sep 2021 11:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8xSJAgeNdOuQkASPp4auEM5KTYjlWHqIVKzsoZjoOt8=;
        b=vQtXKI6RHomntOLOj6nWJV3oR50KPljfRSeNUSGusrAyfYvcgGbHE0XB6xSl8uhWM2
         a6/pzasQdKjemyul5AsDaB52WIRAYqbY5bmfC654wwia8rozFfAQW7i/9WCcpgqMw1CA
         GEA24b0rgVsfk7XRjNg6udGRsfxciKUXBleKt2GDWFBO3+Dj2r8+O8VxMrygGb7E9GLG
         dMqSXvb8NMlcTEGW/gSt/Vyeijstdw9FcGKM5dL4Nwt8Z7YYdXqiSJf7LuMlO89uyLFF
         LJrhm4Eg0OVaX3bWhkdmZM4RG996VsAteDiSI/F3pFFKCSH1HHwJUS+xDdfvo77g12Q0
         n7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8xSJAgeNdOuQkASPp4auEM5KTYjlWHqIVKzsoZjoOt8=;
        b=okfI7RIzjvjTVT3AIn0OSuFi+0vAr7l1RwMKNR6mSuAClvBDyTxZWSvD2HmTwdMEpx
         slqNy5z4RAhOUeSo7lKGLDH3mXPdb0hxVakiOIoi0W3kFjlcs7NSy6boPGJNYoIP5sJg
         mrmJiySuF338vK8A7Ty+tYJNyNu7X2K1RA7pbr+cvDoq1dltLc6+brKLfo0oSGi72I6L
         L9xQ0mrjBJwmKv5phQBMXLkDM44uyRkk02MIxW4UhgTTpiafEwMxFnkhe0+zC9XHmewS
         TlBvoovp+mSSIRM0/Z8cuPkinyQXMuft/yLqSLiF6FfRbGQB8MfW79Ex0/N1tLD9Bgig
         B9Lg==
X-Gm-Message-State: AOAM530MTJxLxRC3g+k9jNx0iNVWyJq4j8rcgmQ+kbWsZl+6GG7uoQ2a
        t75Djml7f45wBmDW9nv2fCoPeQKTv27jJOY6bIKH/w==
X-Google-Smtp-Source: ABdhPJznCmhAkWAgbT8MmO9s1KfwUTmLsZGUeCdK6M4kftzH5lpK6NuLakPJcL32CDjqyq5Id6Z8D13MImBPVxm4ni0=
X-Received: by 2002:a2e:a288:: with SMTP id k8mr6794314lja.229.1632423036129;
 Thu, 23 Sep 2021 11:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210921110029.21944-1-tony@atomide.com>
In-Reply-To: <20210921110029.21944-1-tony@atomide.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 23 Sep 2021 20:50:00 +0200
Message-ID: <CAPDyKFqeCzjjWgM-A8QEQKvGcadB0nQXLQb0ZfFbRRqB29B7pA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Prepare sdhci-omap to support more SoCs
To:     Tony Lindgren <tony@atomide.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Chunyan Zhang <zhang.chunyan@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 21 Sept 2021 at 13:00, Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> Here are changes to prepare to add support for more SoCs to start
> deprecating the old omap_hsmmc driver. I'll send another series
> of changes to add support for more SoCs.
>
> Regards,
>
> Tony
>
>
> Tony Lindgren (5):
>   mmc: sdhci-omap: Fix NULL pointer exception if regulator is not
>     configured
>   mmc: sdhci-omap: Fix context restore
>   mmc: sdhci-omap: Restore sysconfig after reset
>   mmc: sdhci-omap: Parse legacy ti,non-removable property
>   mmc: sdhci-omap: Check MMCHS_HL_HWINFO register for ADMA
>
>  drivers/mmc/host/sdhci-omap.c | 61 ++++++++++++++++++++++++++++++++---
>  1 file changed, 56 insertions(+), 5 deletions(-)
>
> --
> 2.33.0

Applied for next, thanks!

Please tell me, if there are any of these changes that you think
deserves to be tagged for stable kernels.

Kind regards
Uffe
