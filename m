Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A10072133
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2019 23:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391899AbfGWVBv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Jul 2019 17:01:51 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:53874 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731830AbfGWVBv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Jul 2019 17:01:51 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6NL1hJ8098993;
        Tue, 23 Jul 2019 16:01:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563915703;
        bh=u6SXikvGbSFU77KnFGFUWfACbpOyuISOALYakteXBb0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=O9CkEp5xCTYBUGASZzWVRrFKX6mskxwPOfQCOpkxx68DZlr3/1acoGJa82ue+d9dB
         con4HqbuGQpT43hLr52sObTQFTt8sZXgyJJMz5dZFzRpGnX6Eo4i7At8vk2v/KB6Dr
         zyCZejU/CIXstHxFU7TLFe7scnrhUV1MHBMbhpNE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6NL1hPL046625
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 23 Jul 2019 16:01:43 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 23
 Jul 2019 16:01:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 23 Jul 2019 16:01:42 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6NL1gEL050568;
        Tue, 23 Jul 2019 16:01:42 -0500
Subject: Re: [PATCH 5/8] ARM: dts: Drop bogus ahclkr clocks for dra7 mcasp 3
 to 8
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190723112811.44381-1-tony@atomide.com>
 <20190723112811.44381-6-tony@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <2c750847-700e-c835-ee53-a656b363c36c@ti.com>
Date:   Tue, 23 Jul 2019 16:01:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190723112811.44381-6-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 7/23/19 6:28 AM, Tony Lindgren wrote:
> The ahclkr clkctrl clock bit 28 only exists for mcasp 1 and 2 on dra7.
> Otherwise we get the following warning on beagle-x15:
> 
> ti-sysc 48468000.target-module: could not add child clock ahclkr: -19
> 
> Fixes: 5241ccbf2819 ("ARM: dts: Add missing ranges for dra7 mcasp l3 ports")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/boot/dts/dra7-l4.dtsi | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
> --- a/arch/arm/boot/dts/dra7-l4.dtsi
> +++ b/arch/arm/boot/dts/dra7-l4.dtsi
> @@ -2818,9 +2818,8 @@
>  					<SYSC_IDLE_SMART>;
>  			/* Domains (P, C): l4per_pwrdm, l4per2_clkdm */
>  			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 0>,
> -				 <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 24>,
> -				 <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 28>;
> -			clock-names = "fck", "ahclkx", "ahclkr";
> +				 <&l4per2_clkctrl DRA7_L4PER2_MCASP3_CLKCTRL 24>;
> +			clock-names = "fck", "ahclkx";
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			ranges = <0x0 0x68000 0x2000>,
> @@ -2854,9 +2853,8 @@
>  					<SYSC_IDLE_SMART>;
>  			/* Domains (P, C): l4per_pwrdm, l4per2_clkdm */
>  			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 0>,
> -				 <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 24>,
> -				 <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 28>;
> -			clock-names = "fck", "ahclkx", "ahclkr";
> +				 <&l4per2_clkctrl DRA7_L4PER2_MCASP4_CLKCTRL 24>;
> +			clock-names = "fck", "ahclkx";
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			ranges = <0x0 0x6c000 0x2000>,
> @@ -2890,9 +2888,8 @@
>  					<SYSC_IDLE_SMART>;
>  			/* Domains (P, C): l4per_pwrdm, l4per2_clkdm */
>  			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 0>,
> -				 <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 24>,
> -				 <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 28>;
> -			clock-names = "fck", "ahclkx", "ahclkr";
> +				 <&l4per2_clkctrl DRA7_L4PER2_MCASP5_CLKCTRL 24>;
> +			clock-names = "fck", "ahclkx";
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			ranges = <0x0 0x70000 0x2000>,
> @@ -2926,9 +2923,8 @@
>  					<SYSC_IDLE_SMART>;
>  			/* Domains (P, C): l4per_pwrdm, l4per2_clkdm */
>  			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 0>,
> -				 <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 24>,
> -				 <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 28>;
> -			clock-names = "fck", "ahclkx", "ahclkr";
> +				 <&l4per2_clkctrl DRA7_L4PER2_MCASP6_CLKCTRL 24>;
> +			clock-names = "fck", "ahclkx";
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			ranges = <0x0 0x74000 0x2000>,
> @@ -2962,9 +2958,8 @@
>  					<SYSC_IDLE_SMART>;
>  			/* Domains (P, C): l4per_pwrdm, l4per2_clkdm */
>  			clocks = <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 0>,
> -				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 24>,
> -				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 28>;
> -			clock-names = "fck", "ahclkx", "ahclkr";
> +				 <&l4per2_clkctrl DRA7_L4PER2_MCASP7_CLKCTRL 24>;
> +			clock-names = "fck", "ahclkx";

The equivalent change to MCASP8 is missing.

regards
Suman

>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			ranges = <0x0 0x78000 0x2000>,
> 

