Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86001F945E
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 16:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfKLPef (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 10:34:35 -0500
Received: from muru.com ([72.249.23.125]:41840 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726376AbfKLPef (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 Nov 2019 10:34:35 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 056FD80F3;
        Tue, 12 Nov 2019 15:35:10 +0000 (UTC)
Date:   Tue, 12 Nov 2019 07:34:31 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 05/10] ARM: dts: DRA72: Add CAL dtsi node
Message-ID: <20191112153431.GH5610@atomide.com>
References: <20191112142753.22976-1-bparrot@ti.com>
 <20191112142753.22976-6-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112142753.22976-6-bparrot@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Benoit Parrot <bparrot@ti.com> [191112 14:25]:
> This patch adds the required dtsi node to support the Camera
> Adaptation Layer (CAL) for the DRA72 family of devices.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  arch/arm/boot/dts/dra72x.dtsi | 43 +++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/dra72x.dtsi b/arch/arm/boot/dts/dra72x.dtsi
> index f5762709c853..726e46ae887d 100644
> --- a/arch/arm/boot/dts/dra72x.dtsi
> +++ b/arch/arm/boot/dts/dra72x.dtsi
> @@ -17,6 +17,49 @@
>  	};
>  };
>  
> +&l4_per2 {
> +	target-module@5b000 {			/* 0x4845b000, ap 59 46.0 */
> +		compatible = "ti,sysc-omap4", "ti,sysc";
> +		reg = <0x5b000 0x4>,
> +		      <0x5b010 0x4>;
> +		reg-names = "rev", "sysc";
> +		ti,sysc-midle = <SYSC_IDLE_FORCE>,
> +				<SYSC_IDLE_NO>;
> +		ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +				<SYSC_IDLE_NO>;
> +		clocks = <&cam_clkctrl DRA7_CAM_VIP2_CLKCTRL 0>;
> +		clock-names = "fck";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x5b000 0x1000>;
> +
> +		cal: cal@0 {
> +			compatible = "ti,dra72-cal";
> +			reg = <0x0000 0x400>,
> +			      <0x0800 0x40>,
> +			      <0x0900 0x40>;
> +			reg-names = "cal_top",
> +				    "cal_rx_core0",
> +				    "cal_rx_core1";
> +			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +			ti,camerrx-control = <&scm_conf 0xE94>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				csi2_0: port@0 {
> +					reg = <0>;
> +				};
> +				csi2_1: port@1 {
> +					reg = <1>;
> +				};
> +			};
> +		};
> +	};
> +};

Just leave out the status = "disabled" here for the SoC specific dtsi
files. The SoC internal device is there for sure, even if not pinned
out. And the dts default value is status = "okay".

Regards,

Tony
