Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC9B03926FE
	for <lists+linux-omap@lfdr.de>; Thu, 27 May 2021 07:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233633AbhE0Ftk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 May 2021 01:49:40 -0400
Received: from muru.com ([72.249.23.125]:60878 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232773AbhE0Ftj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 27 May 2021 01:49:39 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 51A6980AE;
        Thu, 27 May 2021 05:48:10 +0000 (UTC)
Date:   Thu, 27 May 2021 08:48:01 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Gowtham Tammana <g-tammana@ti.com>
Cc:     Suman Anna <s-anna@ti.com>, bcousson@baylibre.com,
        robh+dt@kernel.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Nisanth Menon <nm@ti.com>
Subject: Re: [PATCH v3] ARM: dts: dra7: Fix duplicate USB4 target module node
Message-ID: <YK8ykeNA9AsjB89I@atomide.com>
References: <20210526213035.15448-1-g-tammana@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526213035.15448-1-g-tammana@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Gowtham Tammana <g-tammana@ti.com> [210526 21:30]:
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

The above makes sense as usb4 is only on dra74x and should not be even
available otherwise.

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

But let's keep the target-module@140000 here as it puts it in the right
location rather than directly on the ocp. Let's mark it with
status = "disabled" in dra7-l4.dtsi, and add a comment noting it's only
available on dra74x. So similar to what you had in your v1 patch, except
disabled.

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

Then the above change can be kept.

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

And in dra74x.dtsi just set it enabled then :)

Other than that looks good to me.

Regards,

Tony
