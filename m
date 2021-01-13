Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE932F49D1
	for <lists+linux-omap@lfdr.de>; Wed, 13 Jan 2021 12:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbhAMLPu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Jan 2021 06:15:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727174AbhAMLPt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Jan 2021 06:15:49 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46947C061575
        for <linux-omap@vger.kernel.org>; Wed, 13 Jan 2021 03:15:09 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id x4so891211vsp.7
        for <linux-omap@vger.kernel.org>; Wed, 13 Jan 2021 03:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5F3Y1+dvzqZPxeJEhWq1oJzPV10LGp3WuH2PQnvIrno=;
        b=Bs01E+yS0to9O9W6rRtGlBZGNxNfce2hx/qfzQjInfwMBqnjKV7ikGKq2HirAXZm3o
         kuorTChMOhCfYcF8vb/UhcdtDNbF8bx9FEutmtT8sdqjr97uwj7bJ8f7oKb8rNoFUhtC
         A+nujCQ/rC7JenrVVGj6YTEpgADCf1ouOHlcbdOw729VwFEjNSja5b0wVCLb1zQQnIWH
         +CpwzE7WRWgnKoLo2hBbQq94rxnrUkmpxj7G6aED/rxX55/aZ/9brjm0W2lMDuEXlOfV
         q2g6o5lmjgcdImsSUx4FBC36NSvsBYAmygP54VAAarv4teMw+mOpyRVKvc/kwxpLFm6D
         OQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5F3Y1+dvzqZPxeJEhWq1oJzPV10LGp3WuH2PQnvIrno=;
        b=Cf2rnN9NZjfvDZuAndWtlL9RBM0Z1/HUVmkRaWVFhyVKUq7mHlcmWCi5XetJD394ST
         rm2rYC75h4PQKZtIcEfoqNhjuL3sWmgupooF13HLHePfaJsDsZ0q5DbgozvPlrqkL1DI
         iH/eooZcRYnct6LP1dg4UmU/FwtIN4AlivW1ihVGbj243JMvQGhPxLscZZH24MPudE55
         pJRmIpVOu0+wJcWeLQUMQ3n0SCGEaYcgQhSvZVrMdy9+8dZYHJmaxeO22s2ytpp180DL
         6iSkfVs4/iHtG0BhjDsbEoHNQmXKmSGh9qAbteRle+AKG2H5Z1ccADFYMQaiLKKj49U1
         /7QQ==
X-Gm-Message-State: AOAM530p0z3IHQ7z3LCS8zlWZGA6PmfDwnuw/+Lvsd4W1yJ6I4vP4n85
        fGkCjbn1bWsF1dOIlSdypW1xNcS7reSULYWFYJtH4w==
X-Google-Smtp-Source: ABdhPJymuNBcf7MceK1EWHcETSqNc+BDRBBcDPE8Si1HQfHJU2a2qnvqWQqXTbUq8gjU0N3YVjt0paoikQI9Ehnk13A=
X-Received: by 2002:a67:fe85:: with SMTP id b5mr1167502vsr.19.1610536508532;
 Wed, 13 Jan 2021 03:15:08 -0800 (PST)
MIME-Version: 1.0
References: <1610358374-81002-1-git-send-email-abaci-bugfix@linux.alibaba.com>
In-Reply-To: <1610358374-81002-1-git-send-email-abaci-bugfix@linux.alibaba.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 13 Jan 2021 12:14:32 +0100
Message-ID: <CAPDyKFpV55EErFRXQO=W=yvu-W7R1Q3GAouCYZAr=-59kuouzg@mail.gmail.com>
Subject: Re: [PATCH] host: omap_hsmmc: style: Simplify bool comparison
To:     YANG LI <abaci-bugfix@linux.alibaba.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 11 Jan 2021 at 10:46, YANG LI <abaci-bugfix@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warning:
> ./drivers/mmc/host/omap_hsmmc.c:297:6-25: WARNING: Comparison of 0/1 to
> bool variable

If you really want this change, I prefer if you can clean up all use
of "pbias_enabled" - and at the same time, do the same clean up for
"vqmmc_enabled".

Kind regards
Uffe

>
> Signed-off-by: YANG LI <abaci-bugfix@linux.alibaba.com>
> Reported-by: Abaci Robot<abaci@linux.alibaba.com>
> ---
>  drivers/mmc/host/omap_hsmmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
> index aa9cc49..91a0760 100644
> --- a/drivers/mmc/host/omap_hsmmc.c
> +++ b/drivers/mmc/host/omap_hsmmc.c
> @@ -294,7 +294,7 @@ static int omap_hsmmc_set_pbias(struct omap_hsmmc_host *host, bool power_on)
>                         host->pbias_enabled = 1;
>                 }
>         } else {
> -               if (host->pbias_enabled == 1) {
> +               if (host->pbias_enabled) {
>                         ret = regulator_disable(host->pbias);
>                         if (ret) {
>                                 dev_err(host->dev, "pbias reg disable fail\n");
> --
> 1.8.3.1
>
