Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBD017AA13
	for <lists+linux-omap@lfdr.de>; Thu,  5 Mar 2020 17:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbgCEQEL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Mar 2020 11:04:11 -0500
Received: from foss.arm.com ([217.140.110.172]:50626 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbgCEQEK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 5 Mar 2020 11:04:10 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06B9330E;
        Thu,  5 Mar 2020 08:04:10 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C202F3F534;
        Thu,  5 Mar 2020 08:04:08 -0800 (PST)
Subject: Re: [PATCH] dra7: sata: Fix SATA with CONFIG_ARM_LPAE enabled
To:     Roger Quadros <rogerq@ti.com>, tony@atomide.com
Cc:     yan-liu@ti.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Rob Herring <robh+dt@kernel.org>
References: <20200304090031.30360-1-rogerq@ti.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <9cc75c26-bd8c-03ea-8f8d-7784fffb7a0a@arm.com>
Date:   Thu, 5 Mar 2020 16:04:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200304090031.30360-1-rogerq@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 04/03/2020 9:00 am, Roger Quadros wrote:
> Even though the TRM says that SATA IP has 36 address bits
> wired in the SoC, we see bus errors whenever any address
> greater than 32-bit is given to the controller.

Actually, is it really just SATA? I pulled up a couple of DRA7xx TRMs 
out of curiosity - thanks for having such easy-to-access documentation 
by the way :) - and they both give me a clear impression that the entire 
L3_MAIN interconnect is limited to 32-bit addresses and thus pretty much 
all the DMA masters should only be able to touch the lower 2GB of DRAM. 
Especially the bit that explicitly says "This is a high address range 
(Q8 – Q15) that requires an address greater than 32 bits. This space is 
visible only for the MPU Subsystem."

Is it in fact the case that the SATA driver happens to be the only one 
to set a >32-bit DMA mask on your system?

Robin.

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
> 
>   arch/arm/boot/dts/dra7.dtsi | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
> index d78b684e7fca..895462c22d1c 100644
> --- a/arch/arm/boot/dts/dra7.dtsi
> +++ b/arch/arm/boot/dts/dra7.dtsi
> @@ -642,15 +642,22 @@
>   		};
>   
>   		/* OCP2SCP3 */
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
>   		};
>   
>   		/* OCP2SCP1 */
> 
