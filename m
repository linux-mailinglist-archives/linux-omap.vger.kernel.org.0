Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2517C1BC7A9
	for <lists+linux-omap@lfdr.de>; Tue, 28 Apr 2020 20:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbgD1STY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Apr 2020 14:19:24 -0400
Received: from muru.com ([72.249.23.125]:51652 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728392AbgD1STY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 Apr 2020 14:19:24 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CED4980F3;
        Tue, 28 Apr 2020 18:20:10 +0000 (UTC)
Date:   Tue, 28 Apr 2020 11:19:19 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Lokesh Vutla <lokeshvutla@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>
Subject: Re: [PATCH] arm: dts: Add 32KHz clock as default clock source
Message-ID: <20200428181919.GS37466@atomide.com>
References: <20200427172604.16351-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427172604.16351-1-lokeshvutla@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Lokesh Vutla <lokeshvutla@ti.com> [200427 17:27]:
> Clocksource to timer configured in pwm mode can be selected using the DT
> property ti,clock-source. There are few pwm timers which are not
> selecting the clock source and relying on default value in hardware or
> selected by driver. Instead of relying on default value, always select
> the clock source from DT. 
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
> Tony,
> 	This is in preparation with removal of selecting clock source in
> 	prepare() api. Let me know if you prefer separate patches for
> 	each dts.

Looks just fine to me.

Tony

>  arch/arm/boot/dts/am335x-guardian.dts            | 1 +
>  arch/arm/boot/dts/am3517-evm.dts                 | 1 +
>  arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi | 1 +
>  arch/arm/boot/dts/omap3-gta04.dtsi               | 1 +
>  4 files changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/am335x-guardian.dts b/arch/arm/boot/dts/am335x-guardian.dts
> index 81e0f63e94d3..0ebe9e2c150e 100644
> --- a/arch/arm/boot/dts/am335x-guardian.dts
> +++ b/arch/arm/boot/dts/am335x-guardian.dts
> @@ -105,6 +105,7 @@
>  		ti,timers = <&timer7>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&dmtimer7_pins>;
> +		ti,clock-source = <0x01>;
>  	};
>  
>  	vmmcsd_fixed: regulator-3v3 {
> diff --git a/arch/arm/boot/dts/am3517-evm.dts b/arch/arm/boot/dts/am3517-evm.dts
> index a1fd3e63e86e..92466b9eb6ba 100644
> --- a/arch/arm/boot/dts/am3517-evm.dts
> +++ b/arch/arm/boot/dts/am3517-evm.dts
> @@ -156,6 +156,7 @@
>  		pinctrl-0 = <&pwm_pins>;
>  		ti,timers = <&timer11>;
>  		#pwm-cells = <3>;
> +		ti,clock-source = <0x01>;
>  	};
>  
>  	/* HS USB Host PHY on PORT 1 */
> diff --git a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
> index f7b82ced4080..381f0e82bb70 100644
> --- a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
> +++ b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
> @@ -65,6 +65,7 @@
>  		pinctrl-0 = <&pwm_pins>;
>  		ti,timers = <&timer10>;
>  		#pwm-cells = <3>;
> +		ti,clock-source = <0x01>;
>  	};
>  
>  };
> diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi b/arch/arm/boot/dts/omap3-gta04.dtsi
> index 409a758c99f1..ecc45862b4f3 100644
> --- a/arch/arm/boot/dts/omap3-gta04.dtsi
> +++ b/arch/arm/boot/dts/omap3-gta04.dtsi
> @@ -150,6 +150,7 @@
>  		compatible = "ti,omap-dmtimer-pwm";
>  		ti,timers = <&timer11>;
>  		#pwm-cells = <3>;
> +		ti,clock-source = <0x01>;
>  	};
>  
>  	hsusb2_phy: hsusb2_phy {
> -- 
> 2.23.0
> 
