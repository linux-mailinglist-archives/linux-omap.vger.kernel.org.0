Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C723B859D0
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 07:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730860AbfHHFaL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 01:30:11 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48610 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730505AbfHHFaL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 01:30:11 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x785U5Ls031936;
        Thu, 8 Aug 2019 00:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565242205;
        bh=Om5NSalTtmTObIUv0acQzdTPhMq7gVkI73HNZY/ZgKY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NWZFklCEL489y4jXUA4v5yHSem9kWzMGtMkoPgH7BWydOYz56uP1yDcFoadSq7vVU
         IzKThsJFl2wzw9A8bb2TFnCbpPKJtaJT2Iwxu2ss6uZJo6VnGULNjncsIC4Pxjb+OI
         kK0HdBxfW6fZRvte6c+8NbyFxXLDiATXg7QvTTgc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x785U5il068308
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 8 Aug 2019 00:30:05 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 8 Aug
 2019 00:30:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 8 Aug 2019 00:30:05 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x785U2dh066424;
        Thu, 8 Aug 2019 00:30:03 -0500
Subject: Re: [PATCH 5/8] soc: ti: omap-prm: add omap4 PRM data
To:     Tero Kristo <t-kristo@ti.com>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <robh+dt@kernel.org>
CC:     <tony@atomide.com>, <s-anna@ti.com>, <devicetree@vger.kernel.org>
References: <1565164139-21886-1-git-send-email-t-kristo@ti.com>
 <1565164139-21886-6-git-send-email-t-kristo@ti.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <643cd090-a4d5-dac6-8395-c01f7fba04ab@ti.com>
Date:   Thu, 8 Aug 2019 11:00:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565164139-21886-6-git-send-email-t-kristo@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 07/08/19 1:18 PM, Tero Kristo wrote:
> Add PRM data for omap4 family of SoCs.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>   drivers/soc/ti/omap_prm.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
> index 870515e3..9b8d5945 100644
> --- a/drivers/soc/ti/omap_prm.c
> +++ b/drivers/soc/ti/omap_prm.c
> @@ -54,7 +54,27 @@ struct omap_reset_data {
>   
>   #define OMAP_PRM_NO_RSTST	BIT(0)
>   
> +struct omap_prm_data omap4_prm_data[] = {
> +	{ .name = "mpu", .base = 0x4a306300, .pwstst = 0x4 },
> +	{ .name = "tesla", .base = 0x4a306400, .pwstst = 0x4, .rstctl = 0x10, .rstst = 0x14 },
> +	{ .name = "abe", .base = 0x4a306500, .pwstst = 0x4 },
> +	{ .name = "always_on_core", .base = 0x4a306600, .pwstst = 0x4 },
> +	{ .name = "core", .base = 0x4a306700, .pwstst = 0x4, .rstctl = 0x210, .rstst = 0x214 },
> +	{ .name = "ivahd", .base = 0x4a306f00, .pwstst = 0x4, .rstctl = 0x10, .rstst = 0x14 },
> +	{ .name = "cam", .base = 0x4a307000, .pwstst = 0x4 },
> +	{ .name = "dss", .base = 0x4a307100, .pwstst = 0x4 },
> +	{ .name = "gfx", .base = 0x4a307200, .pwstst = 0x4 },
> +	{ .name = "l3init", .base = 0x4a307300, .pwstst = 0x4 },
> +	{ .name = "l4per", .base = 0x4a307400, .pwstst = 0x4 },
> +	{ .name = "cefuse", .base = 0x4a307600, .pwstst = 0x4 },
> +	{ .name = "wkup", .base = 0x4a307700, .pwstst = 0x4 },
> +	{ .name = "emu", .base = 0x4a307900, .pwstst = 0x4 },
> +	{ .name = "device", .base = 0x4a307b00, .rstctl = 0x0, .rstst = 0x4 },
> +	{ },
> +};

So at some point arch/arm/mach-omap2/powerdomains44xx_data.c
duplicated data will be removed?

> +
>   static const struct of_device_id omap_prm_id_table[] = {
> +	{ .compatible = "ti,omap4-prm-inst", .data = omap4_prm_data },
>   	{ },
>   };
>   
> 
