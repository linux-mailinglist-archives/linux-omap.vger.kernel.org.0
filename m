Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A490439598C
	for <lists+linux-omap@lfdr.de>; Mon, 31 May 2021 13:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhEaLTY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 31 May 2021 07:19:24 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55392 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbhEaLTX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 31 May 2021 07:19:23 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14VBHV9B113405;
        Mon, 31 May 2021 06:17:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622459851;
        bh=Stgw8M6eouv2Eif5w4ukIcGR2/to17BybWKpiq0aHAc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=d2ydCGYKKXAk7bmV5z46f++YRiGAeksd6dnVUA29qDwpDbt5QUwwqMCTlpPZtPpAC
         uFL7H7n73WMotDvvDB6suaM2+GRxizs5x1LamjDiJTBDbBnPlSVh3YvcuwiawoX1AO
         Dthn1rEPlLgxFxGhgaSWJqeqGPoGqYgFFuPT9Y1k=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14VBHVgE063500
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 31 May 2021 06:17:31 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 31
 May 2021 06:17:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 31 May 2021 06:17:31 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14VBHSZE112040;
        Mon, 31 May 2021 06:17:29 -0500
Subject: Re: [PATCH 1/4] arm: dts: ti: drop usage of redundant compatible
To:     Lokesh Vutla <lokeshvutla@ti.com>, <thierry.reding@gmail.com>,
        <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
        Vignesh R <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>,
        <linux-pwm@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>
References: <20210526084306.6534-1-lokeshvutla@ti.com>
 <20210526084306.6534-2-lokeshvutla@ti.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <de96c176-1163-a6c4-54f2-a9924db6f9df@ti.com>
Date:   Mon, 31 May 2021 14:17:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210526084306.6534-2-lokeshvutla@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 26/05/2021 11:43, Lokesh Vutla wrote:
> Commit 229110c1aa691 ("ARM: dts: am437x/am33xx/da850: Add new ECAP and
> EPWM bindings") added ti,am3352-ehrpwm compatible which is similar to
> ti,am33xx-ehrpwm but without out t,hwmod properties. But with commit
> 58bfbea5b1c68 ("ARM: dts: am437x/am33xx: Remove hwmod entries for ECAP
> and EPWM nodes") dropped support for all ti,hwmod for ehrpwm, but
> missed deprecating ti,am33xx-ehrpwm compatible. So drop ti,am33xx-ehrpwm
> from DT as it is no longer needed.
> 
> ti-ehrpwn driver still support ti,am33xx-ehrpwm in order to maintain
> backward compatibility.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   .../devicetree/bindings/pwm/pwm-tiehrpwm.txt   | 13 ++++++-------
>   arch/arm/boot/dts/am33xx-l4.dtsi               |  9 +++------
>   arch/arm/boot/dts/am437x-l4.dtsi               | 18 ++++++------------
>   arch/arm/boot/dts/da850.dtsi                   |  6 ++----
>   4 files changed, 17 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt b/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt
> index c7e28f6d28be..e124e41418d8 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt
> @@ -2,10 +2,10 @@ TI SOC EHRPWM based PWM controller
>   
>   Required properties:
>   - compatible: Must be "ti,<soc>-ehrpwm".
> -  for am33xx  - compatible = "ti,am3352-ehrpwm", "ti,am33xx-ehrpwm";
> -  for am4372  - compatible = "ti,am4372-ehrpwm", "ti-am3352-ehrpwm", "ti,am33xx-ehrpwm";
> +  for am33xx  - compatible = "ti,am3352-ehrpwm";
> +  for am4372  - compatible = "ti,am4372-ehrpwm", "ti-am3352-ehrpwm";
>     for am654   - compatible = "ti,am654-ehrpwm", "ti-am3352-ehrpwm";
> -  for da850   - compatible = "ti,da850-ehrpwm", "ti-am3352-ehrpwm", "ti,am33xx-ehrpwm";
> +  for da850   - compatible = "ti,da850-ehrpwm", "ti-am3352-ehrpwm";
>     for dra746 - compatible = "ti,dra746-ehrpwm", "ti-am3352-ehrpwm";
>   - #pwm-cells: should be 3. See pwm.yaml in this directory for a description of
>     the cells format. The only third cell flag supported by this binding is
> @@ -19,7 +19,7 @@ Optional properties:
>   Example:
>   
>   ehrpwm0: pwm@48300200 { /* EHRPWM on am33xx */
> -	compatible = "ti,am3352-ehrpwm", "ti,am33xx-ehrpwm";
> +	compatible = "ti,am3352-ehrpwm";
>   	#pwm-cells = <3>;
>   	reg = <0x48300200 0x100>;
>   	clocks = <&ehrpwm0_tbclk>, <&l4ls_gclk>;
> @@ -27,16 +27,15 @@ ehrpwm0: pwm@48300200 { /* EHRPWM on am33xx */
>   };
>   
>   ehrpwm0: pwm@48300200 { /* EHRPWM on am4372 */
> -	compatible = "ti,am4372-ehrpwm", "ti,am3352-ehrpwm", "ti,am33xx-ehrpwm";
> +	compatible = "ti,am4372-ehrpwm", "ti,am3352-ehrpwm";
>   	#pwm-cells = <3>;
>   	reg = <0x48300200 0x80>;
>   	clocks = <&ehrpwm0_tbclk>, <&l4ls_gclk>;
>   	clock-names = "tbclk", "fck";
> -	ti,hwmods = "ehrpwm0";
>   };
>   
>   ehrpwm0: pwm@1f00000 { /* EHRPWM on da850 */
> -	compatible = "ti,da850-ehrpwm", "ti,am3352-ehrpwm", "ti,am33xx-ehrpwm";
> +	compatible = "ti,da850-ehrpwm", "ti,am3352-ehrpwm";
>   	#pwm-cells = <3>;
>   	reg = <0x1f00000 0x2000>;
>   };
> diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
> index 039a9ab4c7ea..fbf3458ab246 100644
> --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> @@ -2017,8 +2017,7 @@ eqep0: counter@180 {
>   				};
>   
>   				ehrpwm0: pwm@200 {
> -					compatible = "ti,am3352-ehrpwm",
> -						     "ti,am33xx-ehrpwm";
> +					compatible = "ti,am3352-ehrpwm";
>   					#pwm-cells = <3>;
>   					reg = <0x200 0x80>;
>   					clocks = <&ehrpwm0_tbclk>, <&l4ls_gclk>;
> @@ -2078,8 +2077,7 @@ eqep1: counter@180 {
>   				};
>   
>   				ehrpwm1: pwm@200 {
> -					compatible = "ti,am3352-ehrpwm",
> -						     "ti,am33xx-ehrpwm";
> +					compatible = "ti,am3352-ehrpwm";
>   					#pwm-cells = <3>;
>   					reg = <0x200 0x80>;
>   					clocks = <&ehrpwm1_tbclk>, <&l4ls_gclk>;
> @@ -2139,8 +2137,7 @@ eqep2: counter@180 {
>   				};
>   
>   				ehrpwm2: pwm@200 {
> -					compatible = "ti,am3352-ehrpwm",
> -						     "ti,am33xx-ehrpwm";
> +					compatible = "ti,am3352-ehrpwm";
>   					#pwm-cells = <3>;
>   					reg = <0x200 0x80>;
>   					clocks = <&ehrpwm2_tbclk>, <&l4ls_gclk>;
> diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi

[...]

> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index 7cf31b6e48b7..afdf3d3747ce 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -574,8 +574,7 @@ mmc1: mmc@21b000 {
>   			status = "disabled";
>   		};
>   		ehrpwm0: pwm@300000 {
> -			compatible = "ti,da850-ehrpwm", "ti,am3352-ehrpwm",
> -				     "ti,am33xx-ehrpwm";
> +			compatible = "ti,da850-ehrpwm", "ti,am3352-ehrpwm";
>   			#pwm-cells = <3>;
>   			reg = <0x300000 0x2000>;
>   			clocks = <&psc1 17>, <&ehrpwm_tbclk>;
> @@ -584,8 +583,7 @@ ehrpwm0: pwm@300000 {
>   			status = "disabled";
>   		};
>   		ehrpwm1: pwm@302000 {
> -			compatible = "ti,da850-ehrpwm", "ti,am3352-ehrpwm",
> -				     "ti,am33xx-ehrpwm";
> +			compatible = "ti,da850-ehrpwm", "ti,am3352-ehrpwm";
>   			#pwm-cells = <3>;
>   			reg = <0x302000 0x2000>;
>   			clocks = <&psc1 17>, <&ehrpwm_tbclk>;
> 

I think, the DT changes can be split and posted standalone while bindings fixed
as part of yaml conversation.
Personally I do not see reasons for separate .txt bindings fix here as ymal conversation just
reveals inconsistency between DT bindings, DTBs and code which leads to DTBs fix.

But, of course, it's up to Rob first of all.

-- 
Best regards,
grygorii
