Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52445391E94
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 20:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234839AbhEZSDF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 14:03:05 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36674 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234546AbhEZSDF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 14:03:05 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14QI1Qmu004711;
        Wed, 26 May 2021 13:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622052086;
        bh=i3Ct7CSYrl/F+D9zgRi2YeyJzxRL5IA4z86e3obtvpk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=T2l+7/Sh5GcuGLEOiSVBYIWvSBklTQ2mDA0BV6xDqEU4WyrIIgnWJ6yWdx0VqD4TU
         AJRXlulUOcI5lO1OPyX3oHvZ5we0bTxn8z+h1ODZaA86rBfuJJ2VfK7hKYJ4YHNYEG
         N2QjxqhZ6vHVo8VD6IkG8774JwjdrTiVGsCKTt+c=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14QI1QH7050700
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 May 2021 13:01:26 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 13:01:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 13:01:25 -0500
Received: from [10.250.35.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14QI1P7a118987;
        Wed, 26 May 2021 13:01:25 -0500
Subject: Re: [PATCH v2] ARM: dts: dra7: Fix duplicate USB4 device node
To:     Gowtham Tammana <g-tammana@ti.com>, <tony@atomide.com>,
        <bcousson@baylibre.com>
CC:     <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Nisanth Menon <nm@ti.com>
References: <20210526172038.17542-1-g-tammana@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <64bb0e71-dc6d-e21d-cfc0-cfeb787ca7c2@ti.com>
Date:   Wed, 26 May 2021 13:01:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210526172038.17542-1-g-tammana@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Gowtham,

On 5/26/21 12:20 PM, Gowtham Tammana wrote:
> With [1] USB4 device node got defined in dra74x.dtsi file. However,
> there was a prior defintion of the same in [2] which didn't get removed

I like this approach and is more in line with the original move of USB4 node
into dra74x.dtsi file.

Looks like you mixed up [1] and [2] or I misunderstand your terminology. Also,
let's be precise, it is the USB4 target-module node that got duplicated in [2],
USB4 node always existed but outside of ti-sysc control before [2] and did not
conflict with the target-module node added in [1].

> causing boot failures. 

on what boards? Is it affecting all of them?

regards
Suman

USB4 node is present only in DRA74x variants so
> keeping the entry in dra74x.dtsi and removing it from the top level
> interconnect hierarchy dra7-l4.dtsi file.
> 
> Since USB4 is only included in DRA74x variants, remove its reference
> for AM5718, DRA71x and DR72x boards.
> 
> [1]: commit 549fce068a311 ("ARM: dts: dra7: Add l4 interconnect
> hierarchy and ti-sysc data")
> [2]: commit c7b72abca61ec ("ARM: OMAP2+: Drop legacy platform data for
> dra7 dwc3")
> 
> Fixes: c7b72abca61ec ("ARM: OMAP2+: Drop legacy platform data for dra7 dwc3")
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
> v2:
>   - changed reference to commit sha instead of line numbers
>   - added Fixes: tag
>   - moved the definition to dra74.dtsi as per Suman and Tony review comments
> 
>  arch/arm/boot/dts/am5718.dtsi  |  6 +-----
>  arch/arm/boot/dts/dra7-l4.dtsi | 22 ----------------------
>  arch/arm/boot/dts/dra71x.dtsi  |  4 ----
>  arch/arm/boot/dts/dra72x.dtsi  |  4 ----
>  arch/arm/boot/dts/dra74x.dtsi  |  2 +-
>  5 files changed, 2 insertions(+), 36 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/am5718.dtsi b/arch/arm/boot/dts/am5718.dtsi
> index ebf4d3cc1cfb..6d7530a48c73 100644
> --- a/arch/arm/boot/dts/am5718.dtsi
> +++ b/arch/arm/boot/dts/am5718.dtsi
> @@ -17,17 +17,13 @@ / {
>   * VCP1, VCP2
>   * MLB
>   * ISS
> - * USB3, USB4
> + * USB3
>   */
>  
>  &usb3_tm {
>  	status = "disabled";
>  };
>  
> -&usb4_tm {
> -	status = "disabled";
> -};
> -
>  &atl_tm {
>  	status = "disabled";
>  };
> diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
> index 149144cdff35..648d23f7f748 100644
> --- a/arch/arm/boot/dts/dra7-l4.dtsi
> +++ b/arch/arm/boot/dts/dra7-l4.dtsi
> @@ -4129,28 +4129,6 @@ usb3: usb@10000 {
>  			};
>  		};
>  
> -		usb4_tm: target-module@140000 {		/* 0x48940000, ap 75 3c.0 */
> -			compatible = "ti,sysc-omap4", "ti,sysc";
> -			reg = <0x140000 0x4>,
> -			      <0x140010 0x4>;
> -			reg-names = "rev", "sysc";
> -			ti,sysc-mask = <SYSC_OMAP4_DMADISABLE>;
> -			ti,sysc-midle = <SYSC_IDLE_FORCE>,
> -					<SYSC_IDLE_NO>,
> -					<SYSC_IDLE_SMART>,
> -					<SYSC_IDLE_SMART_WKUP>;
> -			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> -					<SYSC_IDLE_NO>,
> -					<SYSC_IDLE_SMART>,
> -					<SYSC_IDLE_SMART_WKUP>;
> -			/* Domains (P, C): l3init_pwrdm, l3init_clkdm */
> -			clocks = <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS4_CLKCTRL 0>;
> -			clock-names = "fck";
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			ranges = <0x0 0x140000 0x20000>;
> -		};
> -
>  		target-module@170000 {			/* 0x48970000, ap 21 0a.0 */
>  			compatible = "ti,sysc-omap4", "ti,sysc";
>  			reg = <0x170010 0x4>;
> diff --git a/arch/arm/boot/dts/dra71x.dtsi b/arch/arm/boot/dts/dra71x.dtsi
> index cad0e4a2bd8d..9c270d8f75d5 100644
> --- a/arch/arm/boot/dts/dra71x.dtsi
> +++ b/arch/arm/boot/dts/dra71x.dtsi
> @@ -11,7 +11,3 @@
>  &rtctarget {
>  	status = "disabled";
>  };
> -
> -&usb4_tm {
> -	status = "disabled";
> -};
> diff --git a/arch/arm/boot/dts/dra72x.dtsi b/arch/arm/boot/dts/dra72x.dtsi
> index d403acc754b6..f3e934ef7d3e 100644
> --- a/arch/arm/boot/dts/dra72x.dtsi
> +++ b/arch/arm/boot/dts/dra72x.dtsi
> @@ -108,7 +108,3 @@ &pcie1_ep {
>  &pcie2_rc {
>  	compatible = "ti,dra726-pcie-rc", "ti,dra7-pcie";
>  };
> -
> -&usb4_tm {
> -	status = "disabled";
> -};
> diff --git a/arch/arm/boot/dts/dra74x.dtsi b/arch/arm/boot/dts/dra74x.dtsi
> index e1850d6c841a..60f2ab8d34d5 100644
> --- a/arch/arm/boot/dts/dra74x.dtsi
> +++ b/arch/arm/boot/dts/dra74x.dtsi
> @@ -49,7 +49,7 @@ dsp2_system: dsp_system@41500000 {
>  			reg = <0x41500000 0x100>;
>  		};
>  
> -		target-module@48940000 {
> +		usb4_tm: target-module@48940000 {
>  			compatible = "ti,sysc-omap4", "ti,sysc";
>  			reg = <0x48940000 0x4>,
>  			      <0x48940010 0x4>;
> 

