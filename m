Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF61319E4C
	for <lists+linux-omap@lfdr.de>; Fri, 12 Feb 2021 13:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbhBLMXf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Feb 2021 07:23:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbhBLMVe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 12 Feb 2021 07:21:34 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E93C0613D6
        for <linux-omap@vger.kernel.org>; Fri, 12 Feb 2021 04:20:52 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id x13so4693002vsl.8
        for <linux-omap@vger.kernel.org>; Fri, 12 Feb 2021 04:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nGSxB232htee79ty8IT/JBCRoBtyeUyGTY01WAjnJho=;
        b=XXAQCAz/miOufeHcc6m1vMcmO5KeCOhVK8931mMk9BLvJlaMbyR/G/cUCTzKtJ2/VK
         6yT+Pnm83dBHNqZVkrJHaHlXqh4CwMICvoqZFNdCI13pSbeLo5WJVL0SYo2Zb+ypYknW
         V7PjyI0G8Af8BmyGdksrLgIng2bgVoxiuubYlAdZib52GP0SDBsqxbq/pdXqWjUmXcMn
         qwNuKPAuOmPA3KZRhhJTbT+jY5QH7OA/6h0wwI4aZ/HXtigyE9Kt8lq+DYzJTom5VzMV
         sj1WJqrnrj30xBKAKP/0tRr7oKbCyq5EoFe5ZHuk5D3zEciMSdlmQKZ+oPNTPM8Lbdom
         8i0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nGSxB232htee79ty8IT/JBCRoBtyeUyGTY01WAjnJho=;
        b=BZ7LiqcuqTZ/1MlfMLU5q9REJkIM+BW/qbkEiXjVhJn5b6A1n0+wovHNaNtSMo4PS2
         QQpU+xNIz5O1Em0szeqmJMVYu/KhfHLBPFjU327c0FBewq+qKb9ojQSL1mOzt39Pm7/7
         SewMzr/PHoOZjdaTKnlcs4ZI82J7X5faS/qqb769k1v6WQeYIQ3ptLVQsGr02/hv6fR4
         gOxde4haog/+mpSON7zpIaeK0R9K4nSZL3dZz7W4KzcwHJDe6RUG/BfV/71xFD5I2osZ
         s/e7u+pDM8ZgzeOEY9lA++38Z7SEUxeA2yin/BabxvbIF6UQHKD9pv9trH5TlSEWlfYf
         be1g==
X-Gm-Message-State: AOAM530g/jydRL+q+AtvRkX6+bVIRF62LFFsuD0DXj/z8X9cZjoMLRFN
        7UpUv8H278YZ5S30wI/SxCxh5plCoJjTf8ghVKzuYg==
X-Google-Smtp-Source: ABdhPJyiT486cqMDFuWTXYxqLnKEmulgJBr9Cwe8Gmv9m5GnzeEzaRWLIBFXXVRlVTblssbDykU9rxhy6//DQs3ht1Y=
X-Received: by 2002:a67:8c6:: with SMTP id 189mr1069366vsi.55.1613132451887;
 Fri, 12 Feb 2021 04:20:51 -0800 (PST)
MIME-Version: 1.0
References: <1612777943-43609-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1612777943-43609-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 12 Feb 2021 13:20:15 +0100
Message-ID: <CAPDyKFrEXv6YqCVWSP90K+6bFwXyuEhpXPf3DDA3FdWeo9Gr+Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: omap-hsmmc: Simplify bool comparison
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 8 Feb 2021 at 10:52, Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warning:
>
> ./drivers/mmc/host/omap_hsmmc.c:297:6-25: WARNING: Comparison of 0/1 to
> bool variable.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

I already have a patch for this:

https://patchwork.kernel.org/project/linux-mmc/patch/1610704281-11036-1-git-send-email-abaci-bugfix@linux.alibaba.com/

Kind regards
Uffe


> ---
>  drivers/mmc/host/omap_hsmmc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
> index aa9cc49..a59e9c3 100644
> --- a/drivers/mmc/host/omap_hsmmc.c
> +++ b/drivers/mmc/host/omap_hsmmc.c
> @@ -285,22 +285,22 @@ static int omap_hsmmc_set_pbias(struct omap_hsmmc_host *host, bool power_on)
>                 return 0;
>
>         if (power_on) {
> -               if (host->pbias_enabled == 0) {
> +               if (!host->pbias_enabled) {
>                         ret = regulator_enable(host->pbias);
>                         if (ret) {
>                                 dev_err(host->dev, "pbias reg enable fail\n");
>                                 return ret;
>                         }
> -                       host->pbias_enabled = 1;
> +                       host->pbias_enabled = true;
>                 }
>         } else {
> -               if (host->pbias_enabled == 1) {
> +               if (host->pbias_enabled) {
>                         ret = regulator_disable(host->pbias);
>                         if (ret) {
>                                 dev_err(host->dev, "pbias reg disable fail\n");
>                                 return ret;
>                         }
> -                       host->pbias_enabled = 0;
> +                       host->pbias_enabled = false;
>                 }
>         }
>
> --
> 1.8.3.1
>
