Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F16F7BD6AF
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2019 05:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411471AbfIYD0m (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Sep 2019 23:26:42 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56070 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411455AbfIYD0m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Sep 2019 23:26:42 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8P3Qd1t086232;
        Tue, 24 Sep 2019 22:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569381999;
        bh=HTdq0vICugxqgDyZ7q91xr/oLoYW3h0w20VSkbIS5GI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=bBg072Csxmwotqx+/pvQweE2A5pjzqc9zAZrLDidNuYWbMCw7YYbAiJuaEmojxeNw
         efa9yJKT5cx8T7YsxMgINL2wT2ruOOjvYJKi3/OEbrt7mNk7iQwXJHIqLAITcbjwgZ
         1kU020560uLwXjs/F9M3E+YY9RU70emT2oVdmogA=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8P3Qd1M122809
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Sep 2019 22:26:39 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 24
 Sep 2019 22:26:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 24 Sep 2019 22:26:32 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8P3QaxL046930;
        Tue, 24 Sep 2019 22:26:37 -0500
Subject: Re: [PATCH] ARM: dts: Fix gpio0 flags for am335x-icev2
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
References: <20190924162924.9914-1-tony@atomide.com>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <32fcc8b4-614f-4465-6ccd-f4530c2553ea@ti.com>
Date:   Wed, 25 Sep 2019 08:55:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190924162924.9914-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 24/09/19 9:59 PM, Tony Lindgren wrote:
> The ti,no-idle-on-init and ti,no-reset-on-init flags need to be at
> the interconnect target module level for the modules that have it
> defined. Otherwise we get the following warnings:
> 
> dts flag should be at module level for ti,no-idle-on-init
> dts flag should be at module level for ti,no-reset-on-init
> 
> Fixes: 87fc89ced3a7 ("ARM: dts: am335x: Move l4 child devices to probe them with ti-sysc")
> Cc: Lokesh Vutla <lokeshvutla@ti.com>
> Reported-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>

Thanks and regards,
Lokesh

> ---
>  arch/arm/boot/dts/am335x-icev2.dts | 2 +-
>  arch/arm/boot/dts/am33xx-l4.dtsi   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/am335x-icev2.dts b/arch/arm/boot/dts/am335x-icev2.dts
> --- a/arch/arm/boot/dts/am335x-icev2.dts
> +++ b/arch/arm/boot/dts/am335x-icev2.dts
> @@ -432,7 +432,7 @@
>  	pinctrl-0 = <&mmc0_pins_default>;
>  };
>  
> -&gpio0 {
> +&gpio0_target {
>  	/* Do not idle the GPIO used for holding the VTT regulator */
>  	ti,no-reset-on-init;
>  	ti,no-idle-on-init;
> diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
> --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> @@ -127,7 +127,7 @@
>  			ranges = <0x0 0x5000 0x1000>;
>  		};
>  
> -		target-module@7000 {			/* 0x44e07000, ap 14 20.0 */
> +		gpio0_target: target-module@7000 {	/* 0x44e07000, ap 14 20.0 */
>  			compatible = "ti,sysc-omap2", "ti,sysc";
>  			ti,hwmods = "gpio1";
>  			reg = <0x7000 0x4>,
> 
