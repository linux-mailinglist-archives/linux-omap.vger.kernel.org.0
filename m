Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45F5917DC9D
	for <lists+linux-omap@lfdr.de>; Mon,  9 Mar 2020 10:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgCIJnl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Mar 2020 05:43:41 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43046 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgCIJnl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Mar 2020 05:43:41 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0299hQi3050123;
        Mon, 9 Mar 2020 04:43:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583747006;
        bh=RzlZesRpFJqS5mJhJut0NkSOELlsfKSMiUyjJ8TsFEc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Yt3uC7csFiagxt6uf3UP+yZDR/6dzb6qTY1gjp9YIsfRn7pkJmn2Y0c91Y+24gbdD
         RNskelBfK//xg3/y4hfTAeUubV6WlzKJJC+z6jWuJfKvUJyH9P/i3K3f5O5Lr5viGE
         amIoYITMXbruK0ayWo+/DSiveJkkP32spU5njSmI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0299hQi5019087
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Mar 2020 04:43:26 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Mar
 2020 04:43:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Mar 2020 04:43:26 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0299hN6X114936;
        Mon, 9 Mar 2020 04:43:23 -0500
Subject: Re: [PATCH] ARM: OMAP: DTS: N900: fix onenand timings
To:     Arthur Demchenkov <spinal.by@gmail.com>
CC:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Ladislav Michl <ladis@linux-mips.org>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200308191934.8263-1-spinal.by@gmail.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <abd076bf-20aa-c981-bf4f-7bdf10ec58d1@ti.com>
Date:   Mon, 9 Mar 2020 11:43:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200308191934.8263-1-spinal.by@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 08/03/2020 21:19, Arthur Demchenkov wrote:
> Commit a758f50f10cf ("mtd: onenand: omap2: Configure driver from DT")
> started using DT specified timings for GPMC, and as a result the
> OneNAND stopped working on N900 as we had wrong values in the DT.
> Fix by updating the values to bootloader timings that have been tested
> to be working on Nokia N900 with OneNAND manufacturers: Samsung,
> Numonyx.
> 
> Fixes: a758f50f10cf ("mtd: onenand: omap2: Configure driver from DT")
> Signed-off-by: Arthur Demchenkov <spinal.by@gmail.com>

Reviewed-by: Roger Quadros <rogerq@ti.com>

> ---
>   arch/arm/boot/dts/omap3-n900.dts | 44 +++++++++++++++++++++++++---------------
>   1 file changed, 28 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
> index c3c6d7d04a76..4089d97405c9 100644
> --- a/arch/arm/boot/dts/omap3-n900.dts
> +++ b/arch/arm/boot/dts/omap3-n900.dts
> @@ -854,34 +854,46 @@
>   		compatible = "ti,omap2-onenand";
>   		reg = <0 0 0x20000>;	/* CS0, offset 0, IO size 128K */
>   
> +		/*
> +		 * These timings are based on CONFIG_OMAP_GPMC_DEBUG=y reported
> +		 * bootloader set values when booted with v5.1
> +		 * (OneNAND Manufacturer: Samsung):
> +		 *
> +		 *   cs0 GPMC_CS_CONFIG1: 0xfb001202
> +		 *   cs0 GPMC_CS_CONFIG2: 0x00111100
> +		 *   cs0 GPMC_CS_CONFIG3: 0x00020200
> +		 *   cs0 GPMC_CS_CONFIG4: 0x11001102
> +		 *   cs0 GPMC_CS_CONFIG5: 0x03101616
> +		 *   cs0 GPMC_CS_CONFIG6: 0x90060000
> +		 */
>   		gpmc,sync-read;
>   		gpmc,sync-write;
>   		gpmc,burst-length = <16>;
>   		gpmc,burst-read;
>   		gpmc,burst-wrap;
>   		gpmc,burst-write;
> -		gpmc,device-width = <2>; /* GPMC_DEVWIDTH_16BIT */
> -		gpmc,mux-add-data = <2>; /* GPMC_MUX_AD */
> +		gpmc,device-width = <2>;
> +		gpmc,mux-add-data = <2>;
>   		gpmc,cs-on-ns = <0>;
> -		gpmc,cs-rd-off-ns = <87>;
> -		gpmc,cs-wr-off-ns = <87>;
> +		gpmc,cs-rd-off-ns = <102>;
> +		gpmc,cs-wr-off-ns = <102>;
>   		gpmc,adv-on-ns = <0>;
> -		gpmc,adv-rd-off-ns = <10>;
> -		gpmc,adv-wr-off-ns = <10>;
> -		gpmc,oe-on-ns = <15>;
> -		gpmc,oe-off-ns = <87>;
> +		gpmc,adv-rd-off-ns = <12>;
> +		gpmc,adv-wr-off-ns = <12>;
> +		gpmc,oe-on-ns = <12>;
> +		gpmc,oe-off-ns = <102>;
>   		gpmc,we-on-ns = <0>;
> -		gpmc,we-off-ns = <87>;
> -		gpmc,rd-cycle-ns = <112>;
> -		gpmc,wr-cycle-ns = <112>;
> -		gpmc,access-ns = <81>;
> -		gpmc,page-burst-access-ns = <15>;
> +		gpmc,we-off-ns = <102>;
> +		gpmc,rd-cycle-ns = <132>;
> +		gpmc,wr-cycle-ns = <132>;
> +		gpmc,access-ns = <96>;
> +		gpmc,page-burst-access-ns = <18>;
>   		gpmc,bus-turnaround-ns = <0>;
>   		gpmc,cycle2cycle-delay-ns = <0>;
>   		gpmc,wait-monitoring-ns = <0>;
> -		gpmc,clk-activation-ns = <5>;
> -		gpmc,wr-data-mux-bus-ns = <30>;
> -		gpmc,wr-access-ns = <81>;
> +		gpmc,clk-activation-ns = <6>;
> +		gpmc,wr-data-mux-bus-ns = <36>;
> +		gpmc,wr-access-ns = <96>;
>   		gpmc,sync-clk-ps = <15000>;
>   
>   		/*
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
