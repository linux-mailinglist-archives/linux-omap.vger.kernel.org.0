Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC9141D88C
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 13:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350355AbhI3LVj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Sep 2021 07:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350339AbhI3LVj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Sep 2021 07:21:39 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BA5C06176A;
        Thu, 30 Sep 2021 04:19:56 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y26so23773025lfa.11;
        Thu, 30 Sep 2021 04:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=CuBe7VTii+ARJV5/n/7vopDodxCqVzGoRsKXxt3uaw4=;
        b=JAcRjj/iUrMxuV1LGjqfn9OGQIFIFvABmlDHzLB9Fnk+IxuJlcnF/uyWjuS7nOT31g
         Ig62W6rHb7jNdnnxa8MIkxrQ78YdxSyQ2b+3BxaVX9/1FQ12vqBgN6k+tIFjXBPDuUc0
         ZrkBqPGOa0BZ46Wcz1n4hPO4I0JtNG4IA2HGQ75DKTclBVwgan/pXpWy3sLSQSkVid91
         S+noo9Pms40YVwK48q6S0bn6ZfZYURP0jggNvxdX83mhUGd6g05H+MDnn5lkP5+hVcGw
         3Srq8j64v4cvUVhIEt40eMP6MvcZIAx9HQxvGLjabd9OVU0UK0M5KI/kXmFEH1fBq2Rt
         Q8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=CuBe7VTii+ARJV5/n/7vopDodxCqVzGoRsKXxt3uaw4=;
        b=iu4n7rHG/1/UsdVXAmqONjhFMwFvBbAsSo0Hqd6NoM0V32J2mLR34pTjsIDw9TR0Dq
         h01x6qiqmVRUBK5n1AGL0o0ShFEJ1HnN/fB4NZYuBQd/bNlqke+kYy9YMFc73150eK5Y
         n+FlO1iJf3yPTzF2bYVgEGae6tBc4uTPiZCNaEiMS/aDBoQXiIOEN1llEwjbsVDMy/8J
         0nIVxmHywk7o1yI5HXJLcVzG9d9+noqZedNVsJjvHYPwmvYj14zNcozZQ7d6hrPvxFC0
         fQs+0w3quYszxTF1bzu5336qGs9IgA18eix1GiiPxWuKet0aXUpj/L4/h/86iMOgQXqA
         VsDw==
X-Gm-Message-State: AOAM533WLCi7L74OpdlzVXXhNERCQjPsIBKCWb5+dgpadoPJH+nFZqqJ
        D66Iqmh7HSlqPkJu9xREIVw=
X-Google-Smtp-Source: ABdhPJx0nRBwAJ+86I/QjB/tl0HbB3qHY2gL2tdDV5jhToumrsymicQo8P+FIzD0waz19xvFuXd0MA==
X-Received: by 2002:a2e:8617:: with SMTP id a23mr5443721lji.199.1633000794938;
        Thu, 30 Sep 2021 04:19:54 -0700 (PDT)
Received: from [172.16.185.20] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id s22sm310824ljg.15.2021.09.30.04.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 04:19:54 -0700 (PDT)
Message-ID: <b7d29bf2-f7b6-1d53-2d59-9c1bb5ee4d84@gmail.com>
Date:   Thu, 30 Sep 2021 14:19:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Drew Fustini <pdp7pdp7@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Yongqin Liu <yongqin.liu@linaro.org>
References: <20210930080100.56820-1-tony@atomide.com>
From:   Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH] soc: ti: omap-prm: Fix external abort for am335x pruss
In-Reply-To: <20210930080100.56820-1-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Thanks Tony!

This was _much_ appreciated :)

On 9/30/21 11:01, Tony Lindgren wrote:
> Starting with v5.15-rc1, we may now see some am335x beaglebone black
> device produce the following error on pruss probe:
> 
> Unhandled fault: external abort on non-linefetch (0x1008) at 0xe0326000
> 
> This has started with the enabling of pruss for am335x in the dts files.
> 
> Turns out the is caused by the PRM reset handling not waiting for the
> reset bit to clear. To fix the issue, let's always wait for the reset
> bit to clear, even if there is a separate reset status register.
> 
> We attempted to fix a similar issue for dra7 iva with a udelay() in
> commit effe89e40037 ("soc: ti: omap-prm: Fix occasional abort on reset
> deassert for dra7 iva"). There is no longer a need for the udelay()
> for dra7 iva reset either with the check added for reset bit clearing.
> 
> Cc: Drew Fustini <pdp7pdp7@gmail.com>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
> Cc: Robert Nelson <robertcnelson@gmail.com>
> Cc: Yongqin Liu <yongqin.liu@linaro.org>
> Reported-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Fixes: effe89e40037 ("soc: ti: omap-prm: Fix occasional abort on reset deassert for dra7 iva")

Tested-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/soc/ti/omap_prm.c | 27 +++++++++++++++------------
>   1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
> --- a/drivers/soc/ti/omap_prm.c
> +++ b/drivers/soc/ti/omap_prm.c
> @@ -825,25 +825,28 @@ static int omap_reset_deassert(struct reset_controller_dev *rcdev,
>   	writel_relaxed(v, reset->prm->base + reset->prm->data->rstctrl);
>   	spin_unlock_irqrestore(&reset->lock, flags);
>   
> -	if (!has_rstst)
> -		goto exit;
> +	/* wait for the reset bit to clear */
> +	ret = readl_relaxed_poll_timeout_atomic(reset->prm->base +
> +						reset->prm->data->rstctrl,
> +						v, !(v & BIT(id)), 1,
> +						OMAP_RESET_MAX_WAIT);
> +	if (ret)
> +		pr_err("%s: timedout waiting for %s:%lu\n", __func__,
> +		       reset->prm->data->name, id);

If I was writing this I might drop the __func__. AFAIR dyndbg allows 
enabling the functipn names to be printed by +f. This is just a 'nit' 
though - I am happy if this fix gets in no matter how this print 
eventually looks like. I just thought I mention this as the __func__ 
catched my eye.

>   
>   	/* wait for the status to be set */
> -	ret = readl_relaxed_poll_timeout_atomic(reset->prm->base +
> +	if (has_rstst) {
> +		ret = readl_relaxed_poll_timeout_atomic(reset->prm->base +
>   						 reset->prm->data->rstst,
>   						 v, v & BIT(st_bit), 1,
>   						 OMAP_RESET_MAX_WAIT);
> -	if (ret)
> -		pr_err("%s: timedout waiting for %s:%lu\n", __func__,
> -		       reset->prm->data->name, id);
> +		if (ret)
> +			pr_err("%s: timedout waiting for %s:%lu\n", __func__,
> +			       reset->prm->data->name, id);

Same here (although that would be unrelated change as the print exists 
prior this patch).

I tested this patch on v5.15-rc3 using my BBB Rev C - it seems to fix 
the boot issue on my board! Thanks a bunch!


Best Regards
	--Matti Vaittinen


