Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A89A1732F3
	for <lists+linux-omap@lfdr.de>; Fri, 28 Feb 2020 09:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgB1Idd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 Feb 2020 03:33:33 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38984 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgB1Idd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 28 Feb 2020 03:33:33 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01S8XUB5098184;
        Fri, 28 Feb 2020 02:33:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582878810;
        bh=HmBxRyTFJzTAD0JYDtKbf6MwsAI7h9d982ren23//Yc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vTmICa3NDZWOTuY3yUkisvV51AViT+rU8Ks05WWdD3olcO21t7BrLM0ZFDm9/+GJe
         Tosr9jWFfQUL5uCltrt8JYfd3EwOwC6UlBUL8aiwMUJLTrxgPXeOH9C9YUCyJrJEVz
         lSYTV1nkIxsdnvvvxYF6r9ZjrAiVBpl/TD9eipOw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01S8XU9x107785;
        Fri, 28 Feb 2020 02:33:30 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 28
 Feb 2020 02:33:30 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 28 Feb 2020 02:33:30 -0600
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01S8XStq118562;
        Fri, 28 Feb 2020 02:33:29 -0600
Subject: Re: [PATCH v2 3/5] ARM: dts: AM33xx-l4: Update PRUSS interconnect
 target-module node
To:     Suman Anna <s-anna@ti.com>, Tony Lindgren <tony@atomide.com>
CC:     Tero Kristo <t-kristo@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20200227222837.7329-1-s-anna@ti.com>
 <20200227222837.7329-4-s-anna@ti.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <73ed421b-6786-8f4c-86b1-db4d9cb26bb8@ti.com>
Date:   Fri, 28 Feb 2020 10:33:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200227222837.7329-4-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 28/02/2020 00:28, Suman Anna wrote:
> The PRU-ICSS present on some AM33xx SoCs has a very unique SYSC
> register. The IP also uses a hard-reset line, and requires this
> PRCM reset to be deasserted to be able to access any registers.
> Update the existing PRUSS interconnect target-module with all
> the required properties.
> 
> The PRUSS device itself shall be added as a child node to this
> interconnect node in the future. PRU-ICSS is not supported on
> AM3351/AM3352/AM3354 SoCs though in the AM33xx family, so the
> target module node should be disabled in derivative board files
> that use any of these SoCs.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>

Reviewed-by: Roger Quadros <rogerq@ti.com>

> ---
> v2: Revise patch description, no code changes
> 
>   arch/arm/boot/dts/am33xx-l4.dtsi | 21 ++++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
> index 4e2986f0c604..5ed7f3c58c0f 100644
> --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> @@ -759,12 +759,27 @@
>   			ranges = <0x0 0x200000 0x80000>;
>   		};
>   
> -		target-module@300000 {			/* 0x4a300000, ap 9 04.0 */
> -			compatible = "ti,sysc";
> -			status = "disabled";
> +		pruss_tm: target-module@300000 {	/* 0x4a300000, ap 9 04.0 */
> +			compatible = "ti,sysc-pruss", "ti,sysc";
> +			reg = <0x326000 0x4>,
> +			      <0x326004 0x4>;
> +			reg-names = "rev", "sysc";
> +			ti,sysc-mask = <(SYSC_PRUSS_STANDBY_INIT |
> +					 SYSC_PRUSS_SUB_MWAIT)>;
> +			ti,sysc-midle = <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>;
> +			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>;
> +			clocks = <&pruss_ocp_clkctrl AM3_PRUSS_OCP_PRUSS_CLKCTRL 0>;
> +			clock-names = "fck";
> +			resets = <&prm_per 1>;
> +			reset-names = "rstctrl";
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			ranges = <0x0 0x300000 0x80000>;
> +			status = "disabled";
>   		};
>   	};
>   };
> 

-- 
cheers,
-roger
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
