Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36B21724CE0
	for <lists+linux-omap@lfdr.de>; Tue,  6 Jun 2023 21:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239561AbjFFTQA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Jun 2023 15:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239367AbjFFTPw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Jun 2023 15:15:52 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EBF31731;
        Tue,  6 Jun 2023 12:15:32 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6b28fc7a6dcso1621927a34.0;
        Tue, 06 Jun 2023 12:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686078931; x=1688670931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yuPtWZvp2QpKXhFtUsbMkf/CJ0DL6f0lTisyz0LpYrs=;
        b=Nn/LfaLNGwNoKYxkJX2B0EavoB/Fj4u7tESdR2M762voP98S8mYso1BX1oK0+panaH
         xiAQei3U7qdBZTlnRjxJDZIVA9kUBffKCGg37Eu+Ew8XRQfnslXHT9iYnsWMq3y83Z9G
         l3bTr7rnDN9/cN+3jqn7N8wTj//AuEpTazVz5C2os7U25mmZxkhIugjXryY83KHosWsU
         HV0qPyZal7C9QEo0ixbIYZqxkKlwhsLr1k9n7NEkA70aoblIQDttPu40keCYqAr34uJk
         dfB/vj6ZIxfZ6yP+MmETaoJSRvaTWRsXpCoaHU3RdcowMMnIzDGBzLc8gS5tEAn1DVZB
         DbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686078931; x=1688670931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuPtWZvp2QpKXhFtUsbMkf/CJ0DL6f0lTisyz0LpYrs=;
        b=e3ONpsXIw+MwMkOslzs6mYqfXwI82f1OWC3+wqGfjX+HN51Z+3f0frbRi71vuvv1AV
         5gZkUnWgVjH3EMppEwULPm9DjJAJDt+7+xGUhA345Twq087ozbfnLGYeBKv3pCEw10e4
         UCcpavdH1n27BtZI3yqz6khGbJ5sY/6RBAQ8rjUeIk5FEjZylH0tneAPfMqoCh7mAAgS
         44oloL4fW1lN4Q4eKvBmOz5ORdm/OBjWC7hC8pGS+xgPUJjSgnxrGA7qfiUe3RtMzFDS
         57S785yBpdh3gHmV/VcbXGXPrEsb9O7fqvNBlgZzcpDf9+lpC24tdoXVTaE1qXaxqiEz
         ebew==
X-Gm-Message-State: AC+VfDx5H7raRuzXIH1ZrGLW8Nt2M7thkP/Qnc7uM+QERXCPGme1ZKF5
        W+1YhWHoxvP5dO8fwPL3+sU=
X-Google-Smtp-Source: ACHHUZ6OW8K0CTNvK5+CMzRzg6se3je+OeCfn5sg+JmCERCtPTBR5ROXGar/DNfnHt46cUaQNBUNNw==
X-Received: by 2002:a05:6359:61b:b0:127:a734:9d0 with SMTP id eh27-20020a056359061b00b00127a73409d0mr640197rwb.30.1686078931445;
        Tue, 06 Jun 2023 12:15:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f59e:5ad5:28cc:2003])
        by smtp.gmail.com with ESMTPSA id s1-20020a17090a13c100b00258f9597e9fsm6723827pjf.45.2023.06.06.12.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 12:15:30 -0700 (PDT)
Date:   Tue, 6 Jun 2023 12:15:28 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, soc@kernel.org,
        linux-omap@vger.kernel.org, linux-input@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] Input: ads7846 - Fix usage of match data
Message-ID: <ZH+F0LtkqPoLg4mm@google.com>
References: <20230606191304.3804174-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606191304.3804174-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 06, 2023 at 09:13:04PM +0200, Linus Walleij wrote:
> device_get_match_data() returns the match data directly, fix
> this up and fix the probe crash.
> 
> Fixes: 767d83361aaa ("Input: ads7846 - Convert to use software nodes")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
> This patch needs to be applied to the SoC tree where the
> offending patch is residing.
> ---
>  drivers/input/touchscreen/ads7846.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
> index 40eb27f1b23f..fe6fe8acd8a6 100644
> --- a/drivers/input/touchscreen/ads7846.c
> +++ b/drivers/input/touchscreen/ads7846.c
> @@ -1117,20 +1117,13 @@ MODULE_DEVICE_TABLE(of, ads7846_dt_ids);
>  static const struct ads7846_platform_data *ads7846_get_props(struct device *dev)
>  {
>  	struct ads7846_platform_data *pdata;
> -	const struct platform_device_id *pdev_id;
>  	u32 value;
>  
> -	pdev_id = device_get_match_data(dev);
> -	if (!pdev_id) {
> -		dev_err(dev, "Unknown device model\n");
> -		return ERR_PTR(-EINVAL);
> -	}
> -
>  	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>  	if (!pdata)
>  		return ERR_PTR(-ENOMEM);
>  
> -	pdata->model = (unsigned long)pdev_id->driver_data;
> +	pdata->model = (u32)device_get_match_data(dev);
>  
>  	device_property_read_u16(dev, "ti,vref-delay-usecs",
>  				 &pdata->vref_delay_usecs);
> -- 
> 2.34.1
> 

-- 
Dmitry
