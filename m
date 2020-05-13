Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0DB01D1AEC
	for <lists+linux-omap@lfdr.de>; Wed, 13 May 2020 18:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389127AbgEMQXd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 May 2020 12:23:33 -0400
Received: from muru.com ([72.249.23.125]:54378 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387522AbgEMQXd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 13 May 2020 12:23:33 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BBF8E80E1;
        Wed, 13 May 2020 16:24:19 +0000 (UTC)
Date:   Wed, 13 May 2020 09:23:27 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Keerthy <j-keerthy@ti.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, robh+dt@kernel.org,
        bcousson@baylibre.com, Faiz Abbas <faiz_abbas@ti.com>
Subject: Re: [PATCH v2] arm: dts: Move am33xx and am43xx mmc nodes to
 sdhci-omap driver
Message-ID: <20200513162327.GM37466@atomide.com>
References: <20200512203804.9340-1-faiz_abbas@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512203804.9340-1-faiz_abbas@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Faiz Abbas <faiz_abbas@ti.com> [200512 13:39]:
> Move mmc nodes to be compatible with the sdhci-omap driver. The following
> modifications are required for omap_hsmmc specific properties:
> 
> ti,non-removable: convert to the generic mmc non-removable
> ti,needs-special-reset:  co-opted into the sdhci-omap driver
> ti,dual-volt: removed. Legacy property not used in am335x or am43xx
> ti,needs-special-hs-handling: removed. Legacy property not used in am335x
> or am43xx
> 
> Also since the sdhci-omap driver does not support runtime PM, explicitly
> disable the mmc3 instance in the dtsi.
> 
> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
> ---
> 
> v2: Rebased to latest mainline where all kernel dependancies have been merged.
> 
> Suspend/Resume is now supported in the sdhci-omap driver.

Great, thanks for updating it.

Keerthy, care to test for am3 and am4?

Regards,

Tony


> Tested on: am335x-evm, am335x-boneblack, am335x-sk, am335x-bone, am437x-idk,
> am43xx-gp-evm, am43xx-epos-evm.
> 
>  arch/arm/boot/dts/am335x-baltos.dtsi              | 2 +-
>  arch/arm/boot/dts/am335x-boneblack-common.dtsi    | 1 +
>  arch/arm/boot/dts/am335x-boneblack-wireless.dts   | 1 -
>  arch/arm/boot/dts/am335x-boneblue.dts             | 1 -
>  arch/arm/boot/dts/am335x-bonegreen-wireless.dts   | 1 -
>  arch/arm/boot/dts/am335x-evm.dts                  | 3 +--
>  arch/arm/boot/dts/am335x-evmsk.dts                | 2 +-
>  arch/arm/boot/dts/am335x-lxm.dts                  | 2 +-
>  arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi | 2 +-
>  arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts    | 2 +-
>  arch/arm/boot/dts/am335x-pepper.dts               | 4 ++--
>  arch/arm/boot/dts/am335x-phycore-som.dtsi         | 2 +-
>  arch/arm/boot/dts/am33xx-l4.dtsi                  | 6 ++----
>  arch/arm/boot/dts/am33xx.dtsi                     | 3 ++-
>  arch/arm/boot/dts/am4372.dtsi                     | 3 ++-
>  arch/arm/boot/dts/am437x-cm-t43.dts               | 2 +-
>  arch/arm/boot/dts/am437x-gp-evm.dts               | 4 ++--
>  arch/arm/boot/dts/am437x-l4.dtsi                  | 5 ++---
>  arch/arm/boot/dts/am437x-sk-evm.dts               | 2 +-
>  19 files changed, 22 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/am335x-baltos.dtsi b/arch/arm/boot/dts/am335x-baltos.dtsi
> index 05e7b5d4a95b..04f0b1227efe 100644
> --- a/arch/arm/boot/dts/am335x-baltos.dtsi
> +++ b/arch/arm/boot/dts/am335x-baltos.dtsi
> @@ -369,7 +369,7 @@
>  &mmc2 {
>  	status = "okay";
>  	vmmc-supply = <&wl12xx_vmmc>;
> -	ti,non-removable;
> +	non-removable;
>  	bus-width = <4>;
>  	cap-power-off-card;
>  	pinctrl-names = "default";
> diff --git a/arch/arm/boot/dts/am335x-boneblack-common.dtsi b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
> index 91f93bc89716..dd932220a8bf 100644
> --- a/arch/arm/boot/dts/am335x-boneblack-common.dtsi
> +++ b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
> @@ -22,6 +22,7 @@
>  	pinctrl-0 = <&emmc_pins>;
>  	bus-width = <8>;
>  	status = "okay";
> +	non-removable;
>  };
>  
>  &am33xx_pinmux {
> diff --git a/arch/arm/boot/dts/am335x-boneblack-wireless.dts b/arch/arm/boot/dts/am335x-boneblack-wireless.dts
> index 3124d94c0b3c..e07dd7979586 100644
> --- a/arch/arm/boot/dts/am335x-boneblack-wireless.dts
> +++ b/arch/arm/boot/dts/am335x-boneblack-wireless.dts
> @@ -75,7 +75,6 @@
>  	bus-width = <4>;
>  	non-removable;
>  	cap-power-off-card;
> -	ti,needs-special-hs-handling;
>  	keep-power-in-suspend;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mmc3_pins &wl18xx_pins>;
> diff --git a/arch/arm/boot/dts/am335x-boneblue.dts b/arch/arm/boot/dts/am335x-boneblue.dts
> index 5811fb8d4fdf..83f9452c9cd3 100644
> --- a/arch/arm/boot/dts/am335x-boneblue.dts
> +++ b/arch/arm/boot/dts/am335x-boneblue.dts
> @@ -367,7 +367,6 @@
>  	bus-width = <4>;
>  	non-removable;
>  	cap-power-off-card;
> -	ti,needs-special-hs-handling;
>  	keep-power-in-suspend;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mmc3_pins &wl18xx_pins>;
> diff --git a/arch/arm/boot/dts/am335x-bonegreen-wireless.dts b/arch/arm/boot/dts/am335x-bonegreen-wireless.dts
> index 4092cd193b8a..609c8db687ec 100644
> --- a/arch/arm/boot/dts/am335x-bonegreen-wireless.dts
> +++ b/arch/arm/boot/dts/am335x-bonegreen-wireless.dts
> @@ -75,7 +75,6 @@
>  	bus-width = <4>;
>  	non-removable;
>  	cap-power-off-card;
> -	ti,needs-special-hs-handling;
>  	keep-power-in-suspend;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mmc3_pins &wl18xx_pins>;
> diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
> index 68252dab32c3..a4fc6b168a85 100644
> --- a/arch/arm/boot/dts/am335x-evm.dts
> +++ b/arch/arm/boot/dts/am335x-evm.dts
> @@ -743,8 +743,7 @@
>  	bus-width = <4>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mmc3_pins &wlan_pins>;
> -	ti,non-removable;
> -	ti,needs-special-hs-handling;
> +	non-removable;
>  	cap-power-off-card;
>  	keep-power-in-suspend;
>  
> diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/am335x-evmsk.dts
> index 32f515a295ee..78b6e1f594c9 100644
> --- a/arch/arm/boot/dts/am335x-evmsk.dts
> +++ b/arch/arm/boot/dts/am335x-evmsk.dts
> @@ -655,7 +655,7 @@
>  &mmc2 {
>  	status = "okay";
>  	vmmc-supply = <&wl12xx_vmmc>;
> -	ti,non-removable;
> +	non-removable;
>  	bus-width = <4>;
>  	cap-power-off-card;
>  	keep-power-in-suspend;
> diff --git a/arch/arm/boot/dts/am335x-lxm.dts b/arch/arm/boot/dts/am335x-lxm.dts
> index fef582852820..dbedf729205c 100644
> --- a/arch/arm/boot/dts/am335x-lxm.dts
> +++ b/arch/arm/boot/dts/am335x-lxm.dts
> @@ -339,7 +339,7 @@
>  	pinctrl-0 = <&emmc_pins>;
>  	vmmc-supply = <&vmmcsd_fixed>;
>  	bus-width = <8>;
> -	ti,non-removable;
> +	non-removable;
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi b/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi
> index 6495a125c01f..4e90f9c23d2e 100644
> --- a/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi
> +++ b/arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi
> @@ -159,7 +159,7 @@
>  	vmmc-supply = <&vmmcsd_fixed>;
>  	bus-width = <8>;
>  	pinctrl-0 = <&mmc1_pins_default>;
> -	ti,non-removable;
> +	non-removable;
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts b/arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts
> index 244df9c5a537..f03e72cada41 100644
> --- a/arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts
> +++ b/arch/arm/boot/dts/am335x-moxa-uc-8100-me-t.dts
> @@ -451,7 +451,7 @@
>  	vmmc-supply = <&vmmcsd_fixed>;
>  	bus-width = <8>;
>  	pinctrl-0 = <&mmc2_pins_default>;
> -	ti,non-removable;
> +	non-removable;
>  	status = "okay";
>  };
>  
> diff --git a/arch/arm/boot/dts/am335x-pepper.dts b/arch/arm/boot/dts/am335x-pepper.dts
> index 6d7608d9377b..f9a027b47962 100644
> --- a/arch/arm/boot/dts/am335x-pepper.dts
> +++ b/arch/arm/boot/dts/am335x-pepper.dts
> @@ -341,7 +341,7 @@
>  	pinctrl-0 = <&emmc_pins>;
>  	vmmc-supply = <&ldo3_reg>;
>  	bus-width = <8>;
> -	ti,non-removable;
> +	non-removable;
>  };
>  
>  &mmc3 {
> @@ -351,7 +351,7 @@
>  	pinctrl-0 = <&wireless_pins>;
>  	vmmmc-supply = <&v3v3c_reg>;
>  	bus-width = <4>;
> -	ti,non-removable;
> +	non-removable;
>  	dmas = <&edma_xbar 12 0 1
>  		&edma_xbar 13 0 2>;
>  	dma-names = "tx", "rx";
> diff --git a/arch/arm/boot/dts/am335x-phycore-som.dtsi b/arch/arm/boot/dts/am335x-phycore-som.dtsi
> index 3d0672b53d77..7e46b4c02709 100644
> --- a/arch/arm/boot/dts/am335x-phycore-som.dtsi
> +++ b/arch/arm/boot/dts/am335x-phycore-som.dtsi
> @@ -69,7 +69,7 @@
>  	pinctrl-0 = <&emmc_pins>;
>  	vmmc-supply = <&vmmc_reg>;
>  	bus-width = <8>;
> -	ti,non-removable;
> +	non-removable;
>  	status = "disabled";
>  };
>  
> diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
> index 5ed7f3c58c0f..573ff076178b 100644
> --- a/arch/arm/boot/dts/am33xx-l4.dtsi
> +++ b/arch/arm/boot/dts/am33xx-l4.dtsi
> @@ -1337,10 +1337,8 @@
>  			ranges = <0x0 0x60000 0x1000>;
>  
>  			mmc1: mmc@0 {
> -				compatible = "ti,omap4-hsmmc";
> -				ti,dual-volt;
> +				compatible = "ti,am335-sdhci";
>  				ti,needs-special-reset;
> -				ti,needs-special-hs-handling;
>  				dmas = <&edma_xbar 24 0 0
>  					&edma_xbar 25 0 0>;
>  				dma-names = "tx", "rx";
> @@ -1818,7 +1816,7 @@
>  			ranges = <0x0 0xd8000 0x1000>;
>  
>  			mmc2: mmc@0 {
> -				compatible = "ti,omap4-hsmmc";
> +				compatible = "ti,am335-sdhci";
>  				ti,needs-special-reset;
>  				dmas = <&edma 2 0
>  					&edma 3 0>;
> diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
> index a35f5052d76f..3b9d4d2d35bf 100644
> --- a/arch/arm/boot/dts/am33xx.dtsi
> +++ b/arch/arm/boot/dts/am33xx.dtsi
> @@ -322,10 +322,11 @@
>  			ranges = <0x0 0x47810000 0x1000>;
>  
>  			mmc3: mmc@0 {
> -				compatible = "ti,omap4-hsmmc";
> +				compatible = "ti,am335-sdhci";
>  				ti,needs-special-reset;
>  				interrupts = <29>;
>  				reg = <0x0 0x1000>;
> +				status = "disabled";
>  			};
>  		};
>  
> diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
> index dba87bfaf33e..092b3d4404f4 100644
> --- a/arch/arm/boot/dts/am4372.dtsi
> +++ b/arch/arm/boot/dts/am4372.dtsi
> @@ -316,10 +316,11 @@
>  			ranges = <0x0 0x47810000 0x1000>;
>  
>  			mmc3: mmc@0 {
> -				compatible = "ti,omap4-hsmmc";
> +				compatible = "ti,am437-sdhci";
>  				ti,needs-special-reset;
>  				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
>  				reg = <0x0 0x1000>;
> +				status = "disabled";
>  			};
>  		};
>  
> diff --git a/arch/arm/boot/dts/am437x-cm-t43.dts b/arch/arm/boot/dts/am437x-cm-t43.dts
> index 063113a5da2d..a6b4fca8626a 100644
> --- a/arch/arm/boot/dts/am437x-cm-t43.dts
> +++ b/arch/arm/boot/dts/am437x-cm-t43.dts
> @@ -291,7 +291,7 @@
>  	pinctrl-0 = <&emmc_pins>;
>  	vmmc-supply = <&vmmc_3v3>;
>  	bus-width = <8>;
> -	ti,non-removable;
> +	non-removable;
>  };
>  
>  &spi0 {
> diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
> index 811c8cae315b..cadf47ee337f 100644
> --- a/arch/arm/boot/dts/am437x-gp-evm.dts
> +++ b/arch/arm/boot/dts/am437x-gp-evm.dts
> @@ -869,7 +869,7 @@
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&emmc_pins_default>;
>  	pinctrl-1 = <&emmc_pins_sleep>;
> -	ti,non-removable;
> +	non-removable;
>  };
>  
>  &mmc3 {
> @@ -886,7 +886,7 @@
>  	pinctrl-1 = <&mmc3_pins_sleep>;
>  	cap-power-off-card;
>  	keep-power-in-suspend;
> -	ti,non-removable;
> +	non-removable;
>  
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
> index 49c6a872052e..f4eb36d8b660 100644
> --- a/arch/arm/boot/dts/am437x-l4.dtsi
> +++ b/arch/arm/boot/dts/am437x-l4.dtsi
> @@ -1086,9 +1086,8 @@
>  			ranges = <0x0 0x60000 0x1000>;
>  
>  			mmc1: mmc@0 {
> -				compatible = "ti,omap4-hsmmc";
> +				compatible = "ti,am437-sdhci";
>  				reg = <0x0 0x1000>;
> -				ti,dual-volt;
>  				ti,needs-special-reset;
>  				dmas = <&edma 24 0>,
>  					<&edma 25 0>;
> @@ -1601,7 +1600,7 @@
>  			ranges = <0x0 0xd8000 0x1000>;
>  
>  			mmc2: mmc@0 {
> -				compatible = "ti,omap4-hsmmc";
> +				compatible = "ti,am437-sdhci";
>  				reg = <0x0 0x1000>;
>  				ti,needs-special-reset;
>  				dmas = <&edma 2 0>,
> diff --git a/arch/arm/boot/dts/am437x-sk-evm.dts b/arch/arm/boot/dts/am437x-sk-evm.dts
> index 25222497f828..2416597a4f5c 100644
> --- a/arch/arm/boot/dts/am437x-sk-evm.dts
> +++ b/arch/arm/boot/dts/am437x-sk-evm.dts
> @@ -719,7 +719,7 @@
>  	pinctrl-1 = <&mmc3_pins_sleep>;
>  	cap-power-off-card;
>  	keep-power-in-suspend;
> -	ti,non-removable;
> +	non-removable;
>  
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> -- 
> 2.17.1
> 
