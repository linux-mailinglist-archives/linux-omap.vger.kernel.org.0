Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57357F948F
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 16:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbfKLPj4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 10:39:56 -0500
Received: from muru.com ([72.249.23.125]:41856 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727049AbfKLPj4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 Nov 2019 10:39:56 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 58E0B80F3;
        Tue, 12 Nov 2019 15:40:31 +0000 (UTC)
Date:   Tue, 12 Nov 2019 07:39:51 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Patch v2 1/3] ARM: dts: am43xx: add support for clkout1 clock
Message-ID: <20191112153951.GJ5610@atomide.com>
References: <20191112142929.23058-1-bparrot@ti.com>
 <20191112142929.23058-2-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112142929.23058-2-bparrot@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Benoit Parrot <bparrot@ti.com> [191112 14:30]:
> From: Tero Kristo <t-kristo@ti.com>
> 
> clkout1 clock node and its generation tree was missing. Add this based
> on the data on TRM and PRCM functional spec.
> 
> commit 664ae1ab2536 ("ARM: dts: am43xx: add clkctrl nodes") effectively
> reverted this commit 8010f13a40d3 ("ARM: dts: am43xx: add support for
> clkout1 clock") which is needed for the ov2659 camera sensor clock
> definition hence it is being re-applied here.
> 
> Note that because of the current dts node name dependency for mapping to
> clock domain, we must still use "clkout1-*ck" naming instead of generic
> "clock@" naming for the node. And because of this, it's probably best to
> apply the dts node addition together along with the other clock changes.
> 
> Fixes: 664ae1ab2536 ("ARM: dts: am43xx: add clkctrl nodes")
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Tested-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Hmm I don't think I did any work on this, the above should be:

Acked-by: Tony Lindgren <tony@atomide.com>

> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  arch/arm/boot/dts/am43xx-clocks.dtsi | 54 ++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/am43xx-clocks.dtsi b/arch/arm/boot/dts/am43xx-clocks.dtsi
> index 091356f2a8c1..c726cd8dbdf1 100644
> --- a/arch/arm/boot/dts/am43xx-clocks.dtsi
> +++ b/arch/arm/boot/dts/am43xx-clocks.dtsi
> @@ -704,6 +704,60 @@
>  		ti,bit-shift = <8>;
>  		reg = <0x2a48>;
>  	};
> +
> +	clkout1_osc_div_ck: clkout1-osc-div-ck {
> +		#clock-cells = <0>;
> +		compatible = "ti,divider-clock";
> +		clocks = <&sys_clkin_ck>;
> +		ti,bit-shift = <20>;
> +		ti,max-div = <4>;
> +		reg = <0x4100>;
> +	};
> +
> +	clkout1_src2_mux_ck: clkout1-src2-mux-ck {
> +		#clock-cells = <0>;
> +		compatible = "ti,mux-clock";
> +		clocks = <&clk_rc32k_ck>, <&sysclk_div>, <&dpll_ddr_m2_ck>,
> +			 <&dpll_per_m2_ck>, <&dpll_disp_m2_ck>,
> +			 <&dpll_mpu_m2_ck>;
> +		reg = <0x4100>;
> +	};
> +
> +	clkout1_src2_pre_div_ck: clkout1-src2-pre-div-ck {
> +		#clock-cells = <0>;
> +		compatible = "ti,divider-clock";
> +		clocks = <&clkout1_src2_mux_ck>;
> +		ti,bit-shift = <4>;
> +		ti,max-div = <8>;
> +		reg = <0x4100>;
> +	};
> +
> +	clkout1_src2_post_div_ck: clkout1-src2-post-div-ck {
> +		#clock-cells = <0>;
> +		compatible = "ti,divider-clock";
> +		clocks = <&clkout1_src2_pre_div_ck>;
> +		ti,bit-shift = <8>;
> +		ti,max-div = <32>;
> +		ti,index-power-of-two;
> +		reg = <0x4100>;
> +	};
> +
> +	clkout1_mux_ck: clkout1-mux-ck {
> +		#clock-cells = <0>;
> +		compatible = "ti,mux-clock";
> +		clocks = <&clkout1_osc_div_ck>, <&clk_rc32k_ck>,
> +			 <&clkout1_src2_post_div_ck>, <&dpll_extdev_m2_ck>;
> +		ti,bit-shift = <16>;
> +		reg = <0x4100>;
> +	};
> +
> +	clkout1_ck: clkout1-ck {
> +		#clock-cells = <0>;
> +		compatible = "ti,gate-clock";
> +		clocks = <&clkout1_mux_ck>;
> +		ti,bit-shift = <23>;
> +		reg = <0x4100>;
> +	};
>  };
>  
>  &prcm {
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
