Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59CB3F9483
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 16:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfKLPif (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 10:38:35 -0500
Received: from muru.com ([72.249.23.125]:41848 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726923AbfKLPie (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 Nov 2019 10:38:34 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8C41A80F3;
        Tue, 12 Nov 2019 15:39:10 +0000 (UTC)
Date:   Tue, 12 Nov 2019 07:38:31 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 09/10] arm64: dts: k3-am65-main Add CAL node
Message-ID: <20191112153831.GI5610@atomide.com>
References: <20191112142753.22976-1-bparrot@ti.com>
 <20191112142753.22976-10-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112142753.22976-10-bparrot@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Benoit Parrot <bparrot@ti.com> [191112 14:25]:
> Add CAL dtsi node for AM654 device. Including proper power-domains and
> clock properties.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> index 799c75fa7981..4c65ed445e8b 100644
> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
> @@ -516,4 +516,27 @@
>  		dma-coherent;
>  		interrupts = <GIC_SPI 355 IRQ_TYPE_EDGE_RISING>;
>  	};
> +
> +	cal: cal@6f03000 {
> +		compatible = "ti,am654-cal";
> +		reg = <0x0 0x06f03000 0x0 0x400>,
> +		      <0x0 0x06f03800 0x0 0x40>;
> +		reg-names = "cal_top",
> +			    "cal_rx_core0";
> +		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
> +		ti,camerrx-control = <&scm_conf 0x40c0>;
> +		clock-names = "fck";
> +		clocks = <&k3_clks 2 0>;
> +		power-domains = <&k3_pds 2 TI_SCI_PD_EXCLUSIVE>;
> +		status = "disabled";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			csi2_0: port@0 {
> +				reg = <0>;
> +			};
> +		};
> +	};
>  };

Here too just drop the status = "disabled" line. For reference, see commit
12afc0cf8121 ("ARM: dts: Drop pointless status changing for am3 musb")
in Linux next where we remove about 450 lines of pointless back and forth
noise from status = "disabled" to various board specific files setting
musb components back to status = "okay".

Regards,

Tony
