Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A31A81656D7
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 06:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgBTF1Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 00:27:16 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:50814 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgBTF1Q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 Feb 2020 00:27:16 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01K5REP1127704;
        Wed, 19 Feb 2020 23:27:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582176434;
        bh=btIZ4NN5vv0pgT+HmBWd0+sEAaQDO//lYXerQgg7W0Q=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=tiBJdX8xKoQJHXZw1v1/0D6YfKpxKXvisY0O7bPOuR7a7KhvZfgsQwScgc89WQ5yv
         CJUOXQ+1TBqzkHVqtuzv75iRVaefNL/TmXrm3u8ePBIFs9TuyVD1iPK0Igggww8zgu
         AEW39onlrTPfrcmG8s/lY8pY/3De20UBfCWJi8ko=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01K5REj8130510
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 19 Feb 2020 23:27:14 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 19
 Feb 2020 23:27:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 19 Feb 2020 23:27:13 -0600
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01K5RBDQ044659;
        Wed, 19 Feb 2020 23:27:12 -0600
Subject: Re: [PATCH] ARM: dts: dra7-l4: mark timer13-16 as pwm capable
To:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>
References: <20200219162126.28671-1-grygorii.strashko@ti.com>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <da4288a3-0614-5d6b-4460-bf3b371f6c19@ti.com>
Date:   Thu, 20 Feb 2020 10:56:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20200219162126.28671-1-grygorii.strashko@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 19/02/20 9:51 PM, Grygorii Strashko wrote:
> DMTimers 13 - 16 are PWM capable and also can be used for CPTS input
> signals generation. Hence, mark them as "ti,timer-pwm".
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>

Thanks and regards,
Lokesh

> ---
>  arch/arm/boot/dts/dra7-l4.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
> index fc418834890d..2119a78e9c15 100644
> --- a/arch/arm/boot/dts/dra7-l4.dtsi
> +++ b/arch/arm/boot/dts/dra7-l4.dtsi
> @@ -3474,6 +3474,7 @@
>  				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER13_CLKCTRL 24>;
>  				clock-names = "fck";
>  				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>;
> +				ti,timer-pwm;
>  			};
>  		};
>  
> @@ -3501,6 +3502,7 @@
>  				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER14_CLKCTRL 24>;
>  				clock-names = "fck";
>  				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
> +				ti,timer-pwm;
>  			};
>  		};
>  
> @@ -3528,6 +3530,7 @@
>  				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER15_CLKCTRL 24>;
>  				clock-names = "fck";
>  				interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
> +				ti,timer-pwm;
>  			};
>  		};
>  
> @@ -3555,6 +3558,7 @@
>  				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER16_CLKCTRL 24>;
>  				clock-names = "fck";
>  				interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
> +				ti,timer-pwm;
>  			};
>  		};
>  
> 
