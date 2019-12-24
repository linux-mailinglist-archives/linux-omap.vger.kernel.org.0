Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 727AC129EA9
	for <lists+linux-omap@lfdr.de>; Tue, 24 Dec 2019 08:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbfLXHxD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Dec 2019 02:53:03 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40478 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbfLXHxD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Dec 2019 02:53:03 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBO7qtYc052132;
        Tue, 24 Dec 2019 01:52:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1577173975;
        bh=DSo8vFknEpkbqtsUZO2oI7O1ZVzRTdXlM9IFNn0XQ4M=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=zIOALSU7Glp1Up6yJ2SaEixzMaS7zjnhr62PGT75Ky1cqtwTp06cGoCL2wXiSkv3T
         U5IFY0Ufhv+2NUWrLLJGDNsvb6uKb2yl+N9Pp8t+WebSVXLzt3kKYNjKBJYKkjnH3w
         bslsluiA/F1zrs3lBdIgiN/0/QncbxJ5WeZkdcyk=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBO7qtRf051832;
        Tue, 24 Dec 2019 01:52:55 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 24
 Dec 2019 01:52:45 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 24 Dec 2019 01:52:45 -0600
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBO7qgPl037101;
        Tue, 24 Dec 2019 01:52:43 -0600
Subject: Re: [PATCH] bus: ti-sysc: Implement quirk handling for CLKDM_NOAUTO
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     "Andrew F . Davis" <afd@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20191210161342.15142-1-tony@atomide.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <e209a2ce-c26e-d689-48d1-7920a3052438@ti.com>
Date:   Tue, 24 Dec 2019 09:52:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191210161342.15142-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 10/12/2019 18:13, Tony Lindgren wrote:
> For dra7 dcan and dwc3 instances we need to block clockdomain autoidle.
> Let's do this with CLKDM_NOAUTO quirk flag and enable it for dcan and
> dwc3.
> 
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Roger Quadros <rogerq@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Acked-by: Roger Quadros <rogerq@ti.com>

> ---
>   drivers/bus/ti-sysc.c                 | 10 ++++++++--
>   include/linux/platform_data/ti-sysc.h |  1 +
>   2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -473,7 +473,7 @@ static void sysc_clkdm_deny_idle(struct sysc *ddata)
>   {
>   	struct ti_sysc_platform_data *pdata;
>   
> -	if (ddata->legacy_mode)
> +	if (ddata->legacy_mode || (ddata->cfg.quirks & SYSC_QUIRK_CLKDM_NOAUTO))
>   		return;
>   
>   	pdata = dev_get_platdata(ddata->dev);
> @@ -485,7 +485,7 @@ static void sysc_clkdm_allow_idle(struct sysc *ddata)
>   {
>   	struct ti_sysc_platform_data *pdata;
>   
> -	if (ddata->legacy_mode)
> +	if (ddata->legacy_mode || (ddata->cfg.quirks & SYSC_QUIRK_CLKDM_NOAUTO))
>   		return;
>   
>   	pdata = dev_get_platdata(ddata->dev);
> @@ -1245,6 +1245,12 @@ static const struct sysc_revision_quirk sysc_revision_quirks[] = {
>   	/* Quirks that need to be set based on detected module */
>   	SYSC_QUIRK("aess", 0, 0, 0x10, -1, 0x40000000, 0xffffffff,
>   		   SYSC_MODULE_QUIRK_AESS),
> +	SYSC_QUIRK("dcan", 0x48480000, 0x20, -1, -1, 0xa3170504, 0xffffffff,
> +		   SYSC_QUIRK_CLKDM_NOAUTO),
> +	SYSC_QUIRK("dwc3", 0x48880000, 0, 0x10, -1, 0x500a0200, 0xffffffff,
> +		   SYSC_QUIRK_CLKDM_NOAUTO),
> +	SYSC_QUIRK("dwc3", 0x488c0000, 0, 0x10, -1, 0x500a0200, 0xffffffff,
> +		   SYSC_QUIRK_CLKDM_NOAUTO),
>   	SYSC_QUIRK("hdq1w", 0, 0, 0x14, 0x18, 0x00000006, 0xffffffff,
>   		   SYSC_MODULE_QUIRK_HDQ1W),
>   	SYSC_QUIRK("hdq1w", 0, 0, 0x14, 0x18, 0x0000000a, 0xffffffff,
> diff --git a/include/linux/platform_data/ti-sysc.h b/include/linux/platform_data/ti-sysc.h
> --- a/include/linux/platform_data/ti-sysc.h
> +++ b/include/linux/platform_data/ti-sysc.h
> @@ -49,6 +49,7 @@ struct sysc_regbits {
>   	s8 emufree_shift;
>   };
>   
> +#define SYSC_QUIRK_CLKDM_NOAUTO		BIT(21)
>   #define SYSC_QUIRK_FORCE_MSTANDBY	BIT(20)
>   #define SYSC_MODULE_QUIRK_AESS		BIT(19)
>   #define SYSC_MODULE_QUIRK_SGX		BIT(18)
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
