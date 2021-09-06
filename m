Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44E3401E97
	for <lists+linux-omap@lfdr.de>; Mon,  6 Sep 2021 18:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241972AbhIFQho (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Sep 2021 12:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbhIFQhm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Sep 2021 12:37:42 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B915C061575
        for <linux-omap@vger.kernel.org>; Mon,  6 Sep 2021 09:36:37 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id p15so12215752ljn.3
        for <linux-omap@vger.kernel.org>; Mon, 06 Sep 2021 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cgr6Jz+lrB7D42Igr6LQ2k0LOWT6QRl6Zo2ea56U1/0=;
        b=qFue/ctcVup2ZBYh+V2vDeXGYUQlqSSTr0F0rtwg3ihQG1N3E0nkPHz7F4S1cPA36X
         XX6ajt0l5e6WRc1OnNJ88Rpm6B8Pvq4fIq15S2eNWK19rSp8lbBhRTGNaOs+d/6T9JNg
         KMMQ66achlkth81CmiYymoqErBfB5qgnbMzMsGnIUh7ybdTBdGBNFO0xsZrShGCerYp5
         NjEQZn2gTzmLOrPHL/UKB5lXjoC3v6bB936WCcMPL/Jb2F7yiCALaOj5JiWVREyTtXV4
         QA6oo/C8cZj+rIGHtw7QNIHz/16i4xnpriV+1DjH0V88DESYATAWCmLrhb84m+Z0mohL
         hgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cgr6Jz+lrB7D42Igr6LQ2k0LOWT6QRl6Zo2ea56U1/0=;
        b=A1H79VmRChHV25K7SlSadf+4S1AhTVuhIg0ClvTgJkue6uHeLiIwtB2g5IgSeki+4F
         BZ0NxXn5lKt5xaHsBnVOju6K9CVcS2QbMKqxD/uDiZViEGGdwPF75nEI1guc9CHTqgE8
         yjCCqc7/xP5rubir72nKtkWLZvte5/Axldnm9P092OPfICiBE6ap3qSjZMLEVTHKXJIc
         vv1LoW/ZKzqjlTgZfVyXjW0MPcuC2t83ZhpkLr+opvNdClu8Zn8/VOsZgKW1Zvfyu9mC
         vlufThJEaG6qIrdMPfwxZQhQ0BHEDzax7fnrnlWK7e5neVI7DZynRyijltL2iJYRAsg2
         t/CA==
X-Gm-Message-State: AOAM531Z5fKhMYIhLtHEqbGtb70fWaZrxhtiSjNnEK0xeRdiQW28rbVj
        9W1Pcngsqop2voAUpvA97hY9hToS38B5CiJhYNkqQw==
X-Google-Smtp-Source: ABdhPJzT5LiGUegKEZsMvc5nNqo2qWbWBytqyjX8rsodVuGLIyP1vHsR6WA8ikEELHPTINM6V/ky1ojVSaj1bOIzF8M=
X-Received: by 2002:a2e:960c:: with SMTP id v12mr12032538ljh.300.1630946195528;
 Mon, 06 Sep 2021 09:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210828085446.1878-1-caihuoqing@baidu.com>
In-Reply-To: <20210828085446.1878-1-caihuoqing@baidu.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 6 Sep 2021 18:35:58 +0200
Message-ID: <CAPDyKFqz-Go=gCYpzsN6Np3SnfKm_iCWnhORidj1PTHm_ftx7w@mail.gmail.com>
Subject: Re: [PATCH] mmc: omap_hsmmc: Make use of the helper macro SET_RUNTIME_PM_OPS()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Doug Anderson <dianders@chromium.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 28 Aug 2021 at 10:55, Cai Huoqing <caihuoqing@baidu.com> wrote:
>
> Use the helper macro SET_RUNTIME_PM_OPS() instead of the verbose
> operators ".runtime_suspend/.runtime_resume", because the
> SET_RUNTIME_PM_OPS() is a nice helper macro that could be brought
> in to make code a little clearer, a little more concise.

That makes sense to me.

>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/mmc/host/omap_hsmmc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
> index 2f8038d69f67..748303e14841 100644
> --- a/drivers/mmc/host/omap_hsmmc.c
> +++ b/drivers/mmc/host/omap_hsmmc.c
> @@ -2156,8 +2156,7 @@ static int omap_hsmmc_runtime_resume(struct device *dev)
>
>  static const struct dev_pm_ops omap_hsmmc_dev_pm_ops = {
>         SET_SYSTEM_SLEEP_PM_OPS(omap_hsmmc_suspend, omap_hsmmc_resume)
> -       .runtime_suspend = omap_hsmmc_runtime_suspend,
> -       .runtime_resume = omap_hsmmc_runtime_resume,
> +       SET_RUNTIME_PM_OPS(omap_hsmmc_runtime_suspend, omap_hsmmc_runtime_resume, NULL)
>  };

When building this driver with CONFIG_PM being unset, the compiler
will complain about unused functions. Please add "#ifdef CONFIG_PM"
around the implementation of omap_hsmmc_runtime_suspend|resume() to
address that.

>
>  static struct platform_driver omap_hsmmc_driver = {
> --
> 2.25.1
>

Kind regards
Uffe
