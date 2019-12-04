Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0786511362B
	for <lists+linux-omap@lfdr.de>; Wed,  4 Dec 2019 21:10:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbfLDUKM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Dec 2019 15:10:12 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:44674 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbfLDUKL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Dec 2019 15:10:11 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4KA8SP060994;
        Wed, 4 Dec 2019 14:10:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575490208;
        bh=Uz5fI0J8NJ5UZT+CHleC9Mtyt2vhsOtwW5oQaddVU38=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=PlGbgDEQqimL4s0qwbQdGXDtGEN4MODdEBwJ26eSDJTKft4y0i+EjJzWeL61NQm5w
         0dQNjBWsuMRQvnboR0gIaGf4KsJFk22JgJsoxmw2ehUjKmjrmQE8yspM1wvHaSA2GJ
         im5ngtu40sIORcZROrKSnzMc64unXJuuCtPBasGQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB4KA8uu105254
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 4 Dec 2019 14:10:08 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 14:10:07 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 14:10:07 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4KA551001603;
        Wed, 4 Dec 2019 14:10:05 -0600
Subject: Re: [PATCH] ARM: dts: am335x-icev2: Add support for OSD9616P0899-10
 at i2c0
To:     Jyri Sarha <jsarha@ti.com>, <tony@atomide.com>,
        <bcousson@baylibre.com>, <devicetree@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
CC:     <peter.ujfalusi@ti.com>, <bparrot@ti.com>
References: <20191204144024.16021-1-jsarha@ti.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <edde771f-8780-e342-3e1b-e30eefac5e4f@ti.com>
Date:   Wed, 4 Dec 2019 22:10:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191204144024.16021-1-jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 04/12/2019 16:40, Jyri Sarha wrote:
> Add support for OSD9616P0899-10 96x16 passive matrix display. The
> pre-charge period parameters are taken form a OSD9616P0899-10
> document, but the display works fine with the default values too.
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>   arch/arm/boot/dts/am335x-icev2.dts | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/am335x-icev2.dts b/arch/arm/boot/dts/am335x-icev2.dts
> index 204bccfcc110..021eb57261fe 100644
> --- a/arch/arm/boot/dts/am335x-icev2.dts
> +++ b/arch/arm/boot/dts/am335x-icev2.dts
> @@ -287,6 +287,19 @@
>   		gpio-controller;
>   		#gpio-cells = <2>;
>   	};
> +
> +	/* osd9616p0899-10 */
> +	display@3c {
> +		compatible = "solomon,ssd1306fb-i2c";
> +		reg = <0x3c>;
> +		solomon,height = <16>;
> +		solomon,width = <96>;
> +		solomon,com-seq;
> +		solomon,com-invdir;
> +		solomon,page-offset = <0>;
> +		solomon,prechargep1 = <2>;
> +		solomon,prechargep2 = <13>;
> +	};
>   };
>   
>   &spi0 {
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
