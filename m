Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A77F512775B
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2019 09:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727428AbfLTIn3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Dec 2019 03:43:29 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57998 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727191AbfLTIn3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Dec 2019 03:43:29 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBK8hQrO078594;
        Fri, 20 Dec 2019 02:43:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576831406;
        bh=Ng3XXQ6ve5B8Rt5c8JR1MWjxEvgKuTg6BU0y28dGlIs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ZG9xnL6nNEQmRquyVafnegBOKQxmkbgGCiaaLbJB39G3ITexsUJsWaR1afBKPnCpK
         MegzcDMsTQ7mxcW+CTMpTCamZw/Hms3aOknrz2tCtwo7/utVw9IIZnIn9KGIXm0DiX
         gOf7z2YjxAbTZ9Du8O1ZNJ7ACP6Uq+7aFoFP+kUA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBK8hQC0047271
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Dec 2019 02:43:26 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 20
 Dec 2019 02:43:24 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 20 Dec 2019 02:43:24 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBK8hNDh094719;
        Fri, 20 Dec 2019 02:43:23 -0600
Subject: Re: [PATCH 08/18] mfd: twl4030-audio: Make it explicitly non-modular
To:     Paul Gortmaker <paul.gortmaker@windriver.com>,
        Lee Jones <lee.jones@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
        <linux-omap@vger.kernel.org>
References: <1576702137-25905-1-git-send-email-paul.gortmaker@windriver.com>
 <1576702137-25905-9-git-send-email-paul.gortmaker@windriver.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <b9d0151b-b2cd-c75b-f146-db00b372354c@ti.com>
Date:   Fri, 20 Dec 2019 10:43:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1576702137-25905-9-git-send-email-paul.gortmaker@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 18/12/2019 22.48, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> drivers/mfd/Kconfig:config MFD_TWL4030_AUDIO
> drivers/mfd/Kconfig:    bool "TI TWL4030 Audio"
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> We explicitly disallow a driver unbind, since that doesn't have a
> sensible use case anyway, and it allows us to drop the ".remove"
> code for non-modular drivers.
> 
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> 
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: linux-omap@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  drivers/mfd/twl4030-audio.c | 21 +++------------------
>  1 file changed, 3 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mfd/twl4030-audio.c b/drivers/mfd/twl4030-audio.c
> index 4536d829b43e..7612997e3b86 100644
> --- a/drivers/mfd/twl4030-audio.c
> +++ b/drivers/mfd/twl4030-audio.c
> @@ -8,7 +8,7 @@
>   * Copyright:   (C) 2009 Nokia Corporation
>   */
>  
> -#include <linux/module.h>
> +#include <linux/init.h>
>  #include <linux/types.h>
>  #include <linux/slab.h>
>  #include <linux/kernel.h>
> @@ -258,32 +258,17 @@ static int twl4030_audio_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int twl4030_audio_remove(struct platform_device *pdev)
> -{
> -	mfd_remove_devices(&pdev->dev);
> -	twl4030_audio_dev = NULL;
> -
> -	return 0;
> -}
> -
>  static const struct of_device_id twl4030_audio_of_match[] = {
>  	{.compatible = "ti,twl4030-audio", },
>  	{ },
>  };
> -MODULE_DEVICE_TABLE(of, twl4030_audio_of_match);
>  
>  static struct platform_driver twl4030_audio_driver = {
>  	.driver		= {
>  		.name	= "twl4030-audio",
>  		.of_match_table = twl4030_audio_of_match,
> +		.suppress_bind_attrs = true,
>  	},
>  	.probe		= twl4030_audio_probe,
> -	.remove		= twl4030_audio_remove,
>  };
> -
> -module_platform_driver(twl4030_audio_driver);
> -
> -MODULE_AUTHOR("Peter Ujfalusi <peter.ujfalusi@ti.com>");
> -MODULE_DESCRIPTION("TWL4030 audio block MFD driver");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:twl4030-audio");
> +builtin_platform_driver(twl4030_audio_driver);
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
