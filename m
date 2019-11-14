Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C64BEFC407
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2019 11:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbfKNKYJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Nov 2019 05:24:09 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52238 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfKNKYJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 Nov 2019 05:24:09 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAEANurN005852;
        Thu, 14 Nov 2019 04:23:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573727037;
        bh=2tStGcP9xDBxKwRIpbRobeYLj2PF1b/AtmDfTiE4sb4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=j34WU2ZJOLmGiYCtNPaksHWKLeugq0tr5yZ3gnraSp+XSPTecplIWF65NvKXIt30H
         BjSyVQa6nv5dngrwfh/rqaj3Tilu9/xPg36v56pN0+CFKottI8Q8nVepdWA7qVND+F
         4SyK1LyZYhdJ9PFZy0P+tLcMtynDlSiKIB8FcF7A=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAEANuci111617
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 14 Nov 2019 04:23:56 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 04:23:55 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 04:23:55 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEANpg5030936;
        Thu, 14 Nov 2019 04:23:52 -0600
Subject: Re: [PATCH] bus: ti-sysc: Add module enable quirk for audio AESS
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20191113173702.57107-1-tony@atomide.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <4188f17f-67ce-42f8-c9c0-b7d6c74173a1@ti.com>
Date:   Thu, 14 Nov 2019 12:25:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113173702.57107-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 13/11/2019 19.37, Tony Lindgren wrote:
> We must set the autogating bit on enable for AESS (Audio Engine SubSystem)
> when probed with ti-sysc interconnect target module driver. Otherwise it
> won't idle properly.
> 
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/bus/ti-sysc.c                 | 14 +++++++++++++-
>  include/linux/platform_data/ti-sysc.h |  1 +
>  2 files changed, 14 insertions(+), 1 deletion(-)

Tested-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -1248,6 +1248,8 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
>  		   SYSC_QUIRK_SWSUP_SIDLE),
>  
>  	/* Quirks that need to be set based on detected module */
> +	SYSC_QUIRK("aess", 0, 0, 0x10, -1, 0x40000000, 0xffffffff,
> +		   SYSC_MODULE_QUIRK_AESS),
>  	SYSC_QUIRK("hdq1w", 0, 0, 0x14, 0x18, 0x00000006, 0xffffffff,
>  		   SYSC_MODULE_QUIRK_HDQ1W),
>  	SYSC_QUIRK("hdq1w", 0, 0, 0x14, 0x18, 0x0000000a, 0xffffffff,
> @@ -1276,7 +1278,6 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
>  #ifdef DEBUG
>  	SYSC_QUIRK("adc", 0, 0, 0x10, -1, 0x47300001, 0xffffffff, 0),
>  	SYSC_QUIRK("atl", 0, 0, -1, -1, 0x0a070100, 0xffffffff, 0),
> -	SYSC_QUIRK("aess", 0, 0, 0x10, -1, 0x40000000, 0xffffffff, 0),
>  	SYSC_QUIRK("cm", 0, 0, -1, -1, 0x40000301, 0xffffffff, 0),
>  	SYSC_QUIRK("control", 0, 0, 0x10, -1, 0x40000900, 0xffffffff, 0),
>  	SYSC_QUIRK("cpgmac", 0, 0x1200, 0x1208, 0x1204, 0x4edb1902,
> @@ -1408,6 +1409,14 @@ static void sysc_clk_enable_quirk_hdq1w(struct sysc *ddata)
>  	sysc_write(ddata, offset, val);
>  }
>  
> +/* AESS (Audio Engine SubSystem) needs autogating set after enable */
> +static void sysc_module_enable_quirk_aess(struct sysc *ddata)
> +{
> +	int offset = 0x7c;	/* AESS_AUTO_GATING_ENABLE */
> +
> +	sysc_write(ddata, offset, 1);
> +}
> +
>  /* I2C needs extra enable bit toggling for reset */
>  static void sysc_clk_quirk_i2c(struct sysc *ddata, bool enable)
>  {
> @@ -1490,6 +1499,9 @@ static void sysc_init_module_quirks(struct sysc *ddata)
>  		return;
>  	}
>  
> +	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_AESS)
> +		ddata->module_enable_quirk = sysc_module_enable_quirk_aess;
> +
>  	if (ddata->cfg.quirks & SYSC_MODULE_QUIRK_SGX)
>  		ddata->module_enable_quirk = sysc_module_enable_quirk_sgx;
>  
> diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
> --- a/include/linux/platform_data/ti-sysc.h
> +++ b/include/linux/platform_data/ti-sysc.h
> @@ -49,6 +49,7 @@ struct sysc_regbits {
>  	s8 emufree_shift;
>  };
>  
> +#define SYSC_MODULE_QUIRK_AESS		BIT(19)
>  #define SYSC_MODULE_QUIRK_SGX		BIT(18)
>  #define SYSC_MODULE_QUIRK_HDQ1W		BIT(17)
>  #define SYSC_MODULE_QUIRK_I2C		BIT(16)
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
