Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D88CA501E8
	for <lists+linux-omap@lfdr.de>; Mon, 24 Jun 2019 08:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbfFXGGT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Jun 2019 02:06:19 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34912 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726312AbfFXGGS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Jun 2019 02:06:18 -0400
Received: by mail-pl1-f193.google.com with SMTP id p1so6272338plo.2
        for <linux-omap@vger.kernel.org>; Sun, 23 Jun 2019 23:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aGcIyULDIj+/YCJKjZCul6zq9ZyFOh+SAi/ktfFmdnA=;
        b=ojCRx10N1FWdtoFOzUCjMACQhavDUeLMd4dGW8VDGyit16iBmkUSKO2IAFGfq1Wmbt
         0uRGTWOvvWsodOBMsw/OvECQDLwMM4B6HhJzGcLD5UbCSu6BmYUm4NczknhOIEj/IuRH
         XtVJmMowfw5pB397ZN7ISh5oyHyDK3TU/4KAVg12oICmXL0IvNisLpwzbM9LGfjKCFV3
         AmU2e1hmuxFrZhIYxwhYSIr3p0Qs66yiYKY2I7doKsqcZkBsgcCpRJmL61o9GJg/fFVT
         BozhLSVASWxIsc0UwIXqdwjvHNQBC68j0zce2ZR7wOxuVHs4cqp5LPKI9Nda+PynZ5Ip
         2xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aGcIyULDIj+/YCJKjZCul6zq9ZyFOh+SAi/ktfFmdnA=;
        b=MDE8iplvaXMgMKP73xDq9z8nYtcGJFEMcieapp/P3K7rgdmM0usMgGDyd9W3o347J3
         MghU5trWTxIFWaCyiP/062bxFWvlgijgwXE4ePtw8ZKD51wtTqCkpdQExfMZt3JYWzPI
         qPnjNlBdFvEfgnk2OLGQwVdOdUgiF16RhxynThP8lxnZZbrzNb1Th0nXZCZhy+40oXPd
         sDUKIpvjtOU5hr4XP2VFFW5vgVaS8/zF9OV1r3bohiQPvBXGOlDtn6CoWXROpxhfUhGR
         D6M4puFsaV7b9fKDIi7bQ+PjFYHWHSEbipf9b08Sd+tThwK/kXq77640jsbDANiWcZYB
         lARg==
X-Gm-Message-State: APjAAAVbsSvvlj+axdlTq2WYDRGDikGaNjSAh/dN1rOuBRsVxlGfxSzh
        96gw+xbxCk8rESwhdtJTw7pavw==
X-Google-Smtp-Source: APXvYqwthf8PxT+L5Pi9Ju4TgVKwn2daZ1Xa+6cWzh6FDJ19THDBLX7OB8cN2dmP9iHMiWNEWVZ3Qw==
X-Received: by 2002:a17:902:7787:: with SMTP id o7mr458356pll.120.1561356378089;
        Sun, 23 Jun 2019 23:06:18 -0700 (PDT)
Received: from localhost ([122.172.211.128])
        by smtp.gmail.com with ESMTPSA id e10sm6598616pfi.153.2019.06.23.23.06.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 23:06:17 -0700 (PDT)
Date:   Mon, 24 Jun 2019 11:36:15 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     edubezval@gmail.com, linux-kernel@vger.kernel.org,
        Keerthy <j-keerthy@ti.com>, Zhang Rui <rui.zhang@intel.com>,
        "open list:TI BANDGAP AND THERMAL DRIVER" <linux-pm@vger.kernel.org>,
        "open list:TI BANDGAP AND THERMAL DRIVER" 
        <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 6/6] thermal/drivers/ti: Remove cooling device usage
Message-ID: <20190624060615.ptdeejny75x44wue@vireshk-i7>
References: <20190621132302.30414-1-daniel.lezcano@linaro.org>
 <20190621132302.30414-6-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621132302.30414-6-daniel.lezcano@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21-06-19, 15:23, Daniel Lezcano wrote:
> The cpufreq_cooling_unregister() function uses now the policy to
> unregister itself. The only purpose of the cooling device pointer is
> to unregister the cpu cooling device.
> 
> As there is no more need of this pointer, remove it.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> index 217b1aae8b4f..170b70b6ec61 100644
> --- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> +++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> @@ -41,7 +41,6 @@ struct ti_thermal_data {
>  	struct cpufreq_policy *policy;
>  	struct thermal_zone_device *ti_thermal;
>  	struct thermal_zone_device *pcb_tz;
> -	struct thermal_cooling_device *cool_dev;
>  	struct ti_bandgap *bgp;
>  	enum thermal_device_mode mode;
>  	struct work_struct thermal_wq;
> @@ -233,6 +232,7 @@ int ti_thermal_register_cpu_cooling(struct ti_bandgap *bgp, int id)
>  {
>  	struct ti_thermal_data *data;
>  	struct device_node *np = bgp->dev->of_node;
> +	struct thermal_cooling_device *cdev;
>  
>  	/*
>  	 * We are assuming here that if one deploys the zone
> @@ -256,9 +256,9 @@ int ti_thermal_register_cpu_cooling(struct ti_bandgap *bgp, int id)
>  	}
>  
>  	/* Register cooling device */
> -	data->cool_dev = cpufreq_cooling_register(data->policy);
> -	if (IS_ERR(data->cool_dev)) {
> -		int ret = PTR_ERR(data->cool_dev);
> +	cdev = cpufreq_cooling_register(data->policy);
> +	if (IS_ERR(cdev)) {
> +		int ret = PTR_ERR(cdev);
>  		dev_err(bgp->dev, "Failed to register cpu cooling device %d\n",
>  			ret);
>  		cpufreq_cpu_put(data->policy);

And this too..

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
