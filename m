Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037ED266583
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 19:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgIKREd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Sep 2020 13:04:33 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:55680 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgIKPCf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Sep 2020 11:02:35 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08BEmGPA089963;
        Fri, 11 Sep 2020 09:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599835697;
        bh=utgFM9WorG4OFofGm9b5aCjLlddXO94Yx+teMloJ8+U=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=XUkS/xO3at4lfOm/piZLuaB2/XlW4AlvLQpvHWo6dLE1BCI84/aX/tunBvIXAwOf2
         u14gxPDv3NnLqmIjFavvaakscCKeUVkRapJrchoqm1hgmCNItBsjvuL9Cxn2uKu0XG
         51r8CVPCTieQhopP8X7o52xHVnXkhlGWHKOYEf2Y=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08BEmGLX120810
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Sep 2020 09:48:16 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Sep 2020 09:48:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 11 Sep 2020 09:48:16 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08BEmFR2119261;
        Fri, 11 Sep 2020 09:48:15 -0500
Subject: Re: [PATCH] memory: omap-gpmc: Fix compile test on SPARC
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200911143251.399-1-krzk@kernel.org>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <bf9aa130-d5e7-d180-5a52-0cb244ffbf4f@ti.com>
Date:   Fri, 11 Sep 2020 17:48:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911143251.399-1-krzk@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Krzysztof,

On 11/09/2020 17:32, Krzysztof Kozlowski wrote:
> SPARC comes without CONFIG_OF_ADDRESS thus compile testing fails on
> linking:
> 
>    /usr/bin/sparc64-linux-gnu-ld: drivers/memory/omap-gpmc.o: in function `gpmc_probe_generic_child':
>    omap-gpmc.c:(.text.unlikely+0x14ec): undefined reference to `of_platform_device_create'
> 
> Fixes: ea0c0ad6b6eb ("memory: Enable compile testing for most of the drivers")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   drivers/memory/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> index 8072204bc21a..00e013b14703 100644
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -104,6 +104,7 @@ config TI_EMIF
>   
>   config OMAP_GPMC
>   	bool "Texas Instruments OMAP SoC GPMC driver" if COMPILE_TEST
> +	depends on OF_ADDRESS

but of_platform_device_create() is defined in platform.c which gets built
irrespective of OF_ADDRESS.

Maybe we need to just depend on CONFIG_OF ?

>   	select GPIOLIB
>   	help
>   	  This driver is for the General Purpose Memory Controller (GPMC)
> 

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
