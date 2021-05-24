Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7290B38ECE1
	for <lists+linux-omap@lfdr.de>; Mon, 24 May 2021 17:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232897AbhEXP1y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 May 2021 11:27:54 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:55828 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233651AbhEXPZw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 May 2021 11:25:52 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14OFOHHi044529;
        Mon, 24 May 2021 10:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621869857;
        bh=aElmTJOldWD/SbWcG07cVWwJ4kd2MeZx2QSqy1U2hI8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=kNoOripbcQ2BR5mCvkIzMMa1BHhQSK/5PgvrOQo4n9zU9lfFZBosENylKQW5atolL
         i2l7gbs0+8UpY8PwzesPQheLVPsL0x022Y2akWk3MJoGQHU1iqaYK5n5w5H672J7lh
         jmFfMT/UhVzAHSdkTbEVF6YGsNhEsbloCC2V99Ro=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14OFOH6S119354
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 May 2021 10:24:17 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 24
 May 2021 10:24:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 24 May 2021 10:24:17 -0500
Received: from [10.250.35.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14OFOHiK080612;
        Mon, 24 May 2021 10:24:17 -0500
Subject: Re: [PATCH] ARM: dts: DRA7x: Fix duplicate USB4 device node
To:     Gowtham Tammana <g-tammana@ti.com>, <bcousson@baylibre.com>,
        <tony@atomide.com>
CC:     <robh+dt@kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Nisanth Menon <nm@ti.com>
References: <20210521211851.14674-1-g-tammana@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <9445e5c9-819c-0aed-f96f-b1ac2ea7d13e@ti.com>
Date:   Mon, 24 May 2021 10:24:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210521211851.14674-1-g-tammana@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 5/21/21 4:18 PM, Gowtham Tammana wrote:
> USB4 device node which is defined in [1] is redefined in here
> causing boot failures. Remove the duplicated entry and instead extend it
> with child node info through corresponding label reference.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/dra7-l4.dtsi#n4132

Gowtham,
It is preferable to reference the commit SHA instead of line number references
like above (they will change). Please also use a Fixes: for this, so it can be
applied onto stable kernels as well.

> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>  arch/arm/boot/dts/dra74x.dtsi | 69 +++++++++++++----------------------
>  1 file changed, 25 insertions(+), 44 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra74x.dtsi b/arch/arm/boot/dts/dra74x.dtsi
> index e1850d6c841a..6410ddbf0fca 100644
> --- a/arch/arm/boot/dts/dra74x.dtsi
> +++ b/arch/arm/boot/dts/dra74x.dtsi
> @@ -49,50 +49,6 @@ dsp2_system: dsp_system@41500000 {
>  			reg = <0x41500000 0x100>;
>  		};
>  
> -		target-module@48940000 {
> -			compatible = "ti,sysc-omap4", "ti,sysc";
> -			reg = <0x48940000 0x4>,
> -			      <0x48940010 0x4>;
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
> -			clocks = <&l3init_clkctrl DRA7_L3INIT_USB_OTG_SS4_CLKCTRL 0>;
> -			clock-names = "fck";
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			ranges = <0x0 0x48940000 0x20000>;
> -
> -			omap_dwc3_4: omap_dwc3_4@0 {
> -				compatible = "ti,dwc3";
> -				reg = <0 0x10000>;
> -				interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
> -				#address-cells = <1>;
> -				#size-cells = <1>;
> -				utmi-mode = <2>;
> -				ranges;
> -				status = "disabled";
> -				usb4: usb@10000 {
> -					compatible = "snps,dwc3";
> -					reg = <0x10000 0x17000>;
> -					interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
> -						     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
> -						     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
> -					interrupt-names = "peripheral",
> -							  "host",
> -							  "otg";
> -					maximum-speed = "high-speed";
> -					dr_mode = "otg";
> -				};
> -			};
> -		};
> -
>  		target-module@41501000 {
>  			compatible = "ti,sysc-omap2", "ti,sysc";
>  			reg = <0x41501000 0x4>,
> @@ -224,3 +180,28 @@ &pcie1_ep {
>  &pcie2_rc {
>  	compatible = "ti,dra746-pcie-rc", "ti,dra7-pcie";
>  };
> +
> +&usb4_tm {
> +	omap_dwc3_4: omap_dwc3_4@0 {
> +		compatible = "ti,dwc3";
> +		reg = <0 0x10000>;
> +		interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		utmi-mode = <2>;
> +		ranges;
> +		status = "disabled";
> +		usb4: usb@10000 {
> +			compatible = "snps,dwc3";
> +			reg = <0x10000 0x17000>;
> +			interrupts = <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "peripheral",
> +					  "host",
> +					  "otg";
> +			maximum-speed = "high-speed";
> +			dr_mode = "otg";
> +		};
> +	};
> +};

Tony,

This can be fixed in couple of different ways, and I see there have been
different commits that have ultimately caused this.
 6b14eb4705d6 ("ARM: dts: DRA7: Move USB_OTG 4 to dra74x.dtsi")
 549fce068a31 ("ARM: dts: dra7: Add l4 interconnect hierarchy and ti-sysc data"
 bcbb63b80284 (ARM: dts: dra7: Separate AM57 dtsi files")
 c7b72abca61e ("ARM: OMAP2+: Drop legacy platform data for dra7 dwc3")

Would you prefer that we just drop the USB4 target-module reference in
dra7-l4.dtsi following the first commit?

regards
Suman

