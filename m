Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 223E326A023
	for <lists+linux-omap@lfdr.de>; Tue, 15 Sep 2020 09:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgIOHs2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Sep 2020 03:48:28 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41544 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgIOHq4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Sep 2020 03:46:56 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08F7kbBL073363;
        Tue, 15 Sep 2020 02:46:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600155997;
        bh=uoPhB0r2w4bgFxmOWAKRg8Gso4sbqPAakuGRd5hTu04=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=dmOoHylc2glM4hZTP/1K5UuqSCQTOMzuiP1kug41GomfuiDfYcTtWOl7fTrrzUkjr
         5zMkJQ+01Igm2Pg6d+MBEFHXVEm8p3XenUNngfvpMx/9BLQ09idQDcEklNupdFrErM
         tnVri1zLH70OXIQOe0MUNnDyOPG9V259Vo+58caE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08F7kbMd095332
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Sep 2020 02:46:37 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Sep 2020 02:46:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Sep 2020 02:46:37 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08F7kZtJ011661;
        Tue, 15 Sep 2020 02:46:36 -0500
Subject: Re: [PATCH] memory: omap-gpmc: Fix compile test on SPARC
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200911143251.399-1-krzk@kernel.org>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <9b369f89-dd51-9b5b-7fc5-2d27fe1e8f24@ti.com>
Date:   Tue, 15 Sep 2020 10:46:35 +0300
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



On 11/09/2020 17:32, Krzysztof Kozlowski wrote:
> SPARC comes without CONFIG_OF_ADDRESS thus compile testing fails on
> linking:
> 
>    /usr/bin/sparc64-linux-gnu-ld: drivers/memory/omap-gpmc.o: in function `gpmc_probe_generic_child':
>    omap-gpmc.c:(.text.unlikely+0x14ec): undefined reference to `of_platform_device_create'
> 
> Fixes: ea0c0ad6b6eb ("memory: Enable compile testing for most of the drivers")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Roger Quadros <rogerq@ti.com>

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
>   	select GPIOLIB
>   	help
>   	  This driver is for the General Purpose Memory Controller (GPMC)
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
