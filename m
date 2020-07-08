Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A06218FF5
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jul 2020 20:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbgGHSvT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Jul 2020 14:51:19 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41878 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgGHSvS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Jul 2020 14:51:18 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 068Ip801090673;
        Wed, 8 Jul 2020 13:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594234268;
        bh=YsG/BJdDPnseIyIEYc1rtPIY9uAYMOtMWxEry2DdXs4=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=taJns0JzuccXHyzAK2SR9Ej7WBGaI1MX7nCOofGBZ7Ds9E/oksaVPkyqbaSB1iQtD
         7GFt68NfPxF0R3YQXmxyy5pS58S651hIziKr6Uaim7ezh4cSgHgQ2APaY+AV5sXtMC
         b3IjFq+mqtc3bdqDmuR/bfbpgvZlhpPLc4wpF428=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 068Ip8fR066885
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 8 Jul 2020 13:51:08 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 8 Jul
 2020 13:51:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 8 Jul 2020 13:51:08 -0500
Received: from [10.250.34.57] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 068Ip7MY049138;
        Wed, 8 Jul 2020 13:51:07 -0500
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: hardware spinlock
 core
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
        <baolin.wang7@gmail.com>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
References: <20200708033634.62197-1-grandmaster@al2klimov.de>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <d5b35655-ed7e-7a7c-c8ad-6fb4376af4fd@ti.com>
Date:   Wed, 8 Jul 2020 13:51:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200708033634.62197-1-grandmaster@al2klimov.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/7/20 10:36 PM, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>    If not .svg:
>      For each line:
>        If doesn't contain `\bxmlns\b`:
>          For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
>            If both the HTTP and HTTPS versions
>            return 200 OK and serve the same content:
>              Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Acked-by: Suman Anna <s-anna@ti.com>

> ---
>   Continuing my work started at 93431e0607e5.
>   See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
> 
>   If there are any URLs to be removed completely or at least not HTTPSified:
>   Just clearly say so and I'll *undo my change*.
>   See also: https://lkml.org/lkml/2020/6/27/64
> 
>   If there are any valid, but yet not changed URLs:
>   See: https://lkml.org/lkml/2020/6/26/837
> 
>   If you apply the patch, please let me know.
>   Rationale:
>   I'd like not to submit patches much faster than you maintainers apply them.
> 
>   drivers/hwspinlock/hwspinlock_core.c     | 2 +-
>   drivers/hwspinlock/hwspinlock_internal.h | 2 +-
>   drivers/hwspinlock/omap_hwspinlock.c     | 2 +-
>   include/linux/hwspinlock.h               | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
> index fd5f5c5a5244..09568b9246e1 100644
> --- a/drivers/hwspinlock/hwspinlock_core.c
> +++ b/drivers/hwspinlock/hwspinlock_core.c
> @@ -2,7 +2,7 @@
>   /*
>    * Hardware spinlock framework
>    *
> - * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
> + * Copyright (C) 2010 Texas Instruments Incorporated - https://www.ti.com
>    *
>    * Contact: Ohad Ben-Cohen <ohad@wizery.com>
>    */
> diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
> index 29892767bb7a..318e257bb4fb 100644
> --- a/drivers/hwspinlock/hwspinlock_internal.h
> +++ b/drivers/hwspinlock/hwspinlock_internal.h
> @@ -2,7 +2,7 @@
>   /*
>    * Hardware spinlocks internal header
>    *
> - * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
> + * Copyright (C) 2010 Texas Instruments Incorporated - https://www.ti.com
>    *
>    * Contact: Ohad Ben-Cohen <ohad@wizery.com>
>    */
> diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
> index 3b05560456ea..d4491588a49b 100644
> --- a/drivers/hwspinlock/omap_hwspinlock.c
> +++ b/drivers/hwspinlock/omap_hwspinlock.c
> @@ -2,7 +2,7 @@
>   /*
>    * OMAP hardware spinlock driver
>    *
> - * Copyright (C) 2010-2015 Texas Instruments Incorporated - http://www.ti.com
> + * Copyright (C) 2010-2015 Texas Instruments Incorporated - https://www.ti.com
>    *
>    * Contact: Simon Que <sque@ti.com>
>    *          Hari Kanigeri <h-kanigeri2@ti.com>
> diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
> index bfe7c1f1ac6d..690810acea7f 100644
> --- a/include/linux/hwspinlock.h
> +++ b/include/linux/hwspinlock.h
> @@ -2,7 +2,7 @@
>   /*
>    * Hardware spinlock public header
>    *
> - * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
> + * Copyright (C) 2010 Texas Instruments Incorporated - https://www.ti.com
>    *
>    * Contact: Ohad Ben-Cohen <ohad@wizery.com>
>    */
> 

