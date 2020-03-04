Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7771794E9
	for <lists+linux-omap@lfdr.de>; Wed,  4 Mar 2020 17:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388024AbgCDQVC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Mar 2020 11:21:02 -0500
Received: from muru.com ([72.249.23.125]:58760 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbgCDQVC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 4 Mar 2020 11:21:02 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2870080F5;
        Wed,  4 Mar 2020 16:21:46 +0000 (UTC)
Date:   Wed, 4 Mar 2020 08:20:57 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Roger Quadros <rogerq@ti.com>
Cc:     yan-liu@ti.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dra7: sata: Fix SATA with CONFIG_ARM_LPAE enabled
Message-ID: <20200304162057.GV37466@atomide.com>
References: <20200304090031.30360-1-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200304090031.30360-1-rogerq@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Roger Quadros <rogerq@ti.com> [200304 09:01]:
> Even though the TRM says that SATA IP has 36 address bits
> wired in the SoC, we see bus errors whenever any address
> greater than 32-bit is given to the controller.
> 
> This happens on dra7-EVM with 4G of RAM with CONFIG_ARM_LPAE=y.
> 
> As a workaround we limit the DMA address range to 32-bits
> for SATA.
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Reported-by: Yan Liu <yan-liu@ti.com>
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
> 
> NOTE: Currently ARM dma-mapping code doesn't account for devices
> bus_dma_limit. This is fixed in [1].
> 
> [1] https://lkml.org/lkml/2020/2/18/712

So is this dts patch safe to apply without the series above?

And should this dts patch be applied as a fix or can it wait
until the merge window?

Regards,

Tony

>  arch/arm/boot/dts/dra7.dtsi | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
> index d78b684e7fca..895462c22d1c 100644
> --- a/arch/arm/boot/dts/dra7.dtsi
> +++ b/arch/arm/boot/dts/dra7.dtsi
> @@ -642,15 +642,22 @@
>  		};
>  
>  		/* OCP2SCP3 */
> -		sata: sata@4a141100 {
> -			compatible = "snps,dwc-ahci";
> -			reg = <0x4a140000 0x1100>, <0x4a141100 0x7>;
> -			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> -			phys = <&sata_phy>;
> -			phy-names = "sata-phy";
> -			clocks = <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
> -			ti,hwmods = "sata";
> -			ports-implemented = <0x1>;
> +		sata_aux_bus {
> +			#address-cells = <1>;
> +			#size-cells = <2>;
> +			compatible = "simple-bus";
> +			ranges = <0x0 0x4a140000 0x0 0x1200>;
> +			dma-ranges = <0x0 0x0 0x1 0x00000000>;
> +			sata: sata@4a141100 {
> +				compatible = "snps,dwc-ahci";
> +				reg = <0x0 0x0 0x1100>, <0x1100 0x0 0x7>;
> +				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&sata_phy>;
> +				phy-names = "sata-phy";
> +				clocks = <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
> +				ti,hwmods = "sata";
> +				ports-implemented = <0x1>;
> +			};
>  		};
>  
>  		/* OCP2SCP1 */
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
