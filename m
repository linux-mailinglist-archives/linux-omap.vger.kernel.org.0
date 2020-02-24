Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8CE16B5C8
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgBXXio (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:38:44 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60172 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727081AbgBXXio (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:38:44 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BA3DE89;
        Tue, 25 Feb 2020 00:38:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582587522;
        bh=gQik+6A83Y5v/DI1YfW29cbToK9kZ2L+cXWvkS/IwZM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A07WiEFpnj809ZTJAF9/jhzS4h24ARnnAALjBp87OamDJfgbDwJmzAObkARHODwxm
         YaQdMp8p/k19pbhsnfCUzsmHUO9rMNAAXbjqi/m+m9NfbkdwX/lXDLn5Nr65MLTPba
         EeE1DHKzqJq7GYOTD7K1bunWrdmyuOo1pLoZYlGw=
Date:   Tue, 25 Feb 2020 01:38:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCHv2 01/56] ARM: dts: omap: add channel to DSI panels
Message-ID: <20200224233821.GH16163@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200224232126.3385250-2-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

Thank you for the patch.

On Tue, Feb 25, 2020 at 12:20:31AM +0100, Sebastian Reichel wrote:
> The standard binding for DSI requires, that the channel number
> of the panel is encoded in DT. This adds the channel number in
> all OMAP3-5 boards, in preparation for using common infrastructure.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../devicetree/bindings/display/panel/panel-dsi-cm.txt      | 4 +++-
>  arch/arm/boot/dts/motorola-mapphone-common.dtsi             | 3 ++-
>  arch/arm/boot/dts/omap3-n950.dts                            | 3 ++-
>  arch/arm/boot/dts/omap3.dtsi                                | 3 +++
>  arch/arm/boot/dts/omap4-sdp.dts                             | 6 ++++--
>  arch/arm/boot/dts/omap4.dtsi                                | 6 ++++++
>  arch/arm/boot/dts/omap5.dtsi                                | 6 ++++++
>  7 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> index dce48eb9db57..f92d5c9adfc5 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> @@ -3,6 +3,7 @@ Generic MIPI DSI Command Mode Panel
>  
>  Required properties:
>  - compatible: "panel-dsi-cm"
> +- reg: DSI channel number
>  
>  Optional properties:
>  - label: a symbolic name for the panel
> @@ -15,9 +16,10 @@ Required nodes:
>  Example
>  -------
>  
> -lcd0: display {
> +lcd0: panel@0 {
>  	compatible = "tpo,taal", "panel-dsi-cm";
>  	label = "lcd0";
> +	reg = <0>;
>  
>  	reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
>  

While at it, how about converting this to yaml ?

> diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> index 85665506f4f8..a5e4ba7c8dab 100644
> --- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> +++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> @@ -199,8 +199,9 @@ dsi1_out_ep: endpoint {
>  		};
>  	};
>  
> -	lcd0: display {
> +	lcd0: panel@0 {
>  		compatible = "panel-dsi-cm";
> +		reg = <0>;
>  		label = "lcd0";
>  		vddi-supply = <&lcd_regulator>;
>  		reset-gpios = <&gpio4 5 GPIO_ACTIVE_HIGH>;	/* gpio101 */
> diff --git a/arch/arm/boot/dts/omap3-n950.dts b/arch/arm/boot/dts/omap3-n950.dts
> index 31d47a1fad84..80cf4e1177da 100644
> --- a/arch/arm/boot/dts/omap3-n950.dts
> +++ b/arch/arm/boot/dts/omap3-n950.dts
> @@ -225,8 +225,9 @@ dsi_out_ep: endpoint {
>  		};
>  	};
>  
> -	lcd0: display {
> +	lcd0: panel@0 {
>  		compatible = "nokia,himalaya", "panel-dsi-cm";
> +		reg = <0>;
>  		label = "lcd0";
>  
>  		pinctrl-names = "default";
> diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
> index 634ea16a711e..409d434a9b18 100644
> --- a/arch/arm/boot/dts/omap3.dtsi
> +++ b/arch/arm/boot/dts/omap3.dtsi
> @@ -820,6 +820,9 @@ dsi: encoder@4804fc00 {
>  				ti,hwmods = "dss_dsi1";
>  				clocks = <&dss1_alwon_fck>, <&dss2_alwon_fck>;
>  				clock-names = "fck", "sys_clk";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  			};
>  
>  			rfbi: encoder@48050800 {
> diff --git a/arch/arm/boot/dts/omap4-sdp.dts b/arch/arm/boot/dts/omap4-sdp.dts
> index 91480ac1f328..8a8307517dab 100644
> --- a/arch/arm/boot/dts/omap4-sdp.dts
> +++ b/arch/arm/boot/dts/omap4-sdp.dts
> @@ -662,8 +662,9 @@ dsi1_out_ep: endpoint {
>  		};
>  	};
>  
> -	lcd0: display {
> +	lcd0: panel@0 {
>  		compatible = "tpo,taal", "panel-dsi-cm";
> +		reg = <0>;
>  		label = "lcd0";
>  
>  		reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;	/* 102 */
> @@ -687,8 +688,9 @@ dsi2_out_ep: endpoint {
>  		};
>  	};
>  
> -	lcd1: display {
> +	lcd1: panel@0 {
>  		compatible = "tpo,taal", "panel-dsi-cm";
> +		reg = <0>;
>  		label = "lcd1";
>  
>  		reset-gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>;	/* 104 */
> diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
> index 9a87440d0b9d..a75734065cac 100644
> --- a/arch/arm/boot/dts/omap4.dtsi
> +++ b/arch/arm/boot/dts/omap4.dtsi
> @@ -465,6 +465,9 @@ dsi1: encoder@58004000 {
>  				clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>,
>  					 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
>  				clock-names = "fck", "sys_clk";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  			};
>  
>  			dsi2: encoder@58005000 {
> @@ -479,6 +482,9 @@ dsi2: encoder@58005000 {
>  				clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>,
>  					 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
>  				clock-names = "fck", "sys_clk";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  			};
>  
>  			hdmi: encoder@58006000 {
> diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
> index d0ecf54d5a23..5c7462e04716 100644
> --- a/arch/arm/boot/dts/omap5.dtsi
> +++ b/arch/arm/boot/dts/omap5.dtsi
> @@ -333,6 +333,9 @@ dsi1: encoder@58004000 {
>  				clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
>  					 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
>  				clock-names = "fck", "sys_clk";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  			};
>  
>  			dsi2: encoder@58005000 {
> @@ -347,6 +350,9 @@ dsi2: encoder@58005000 {
>  				clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
>  					 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
>  				clock-names = "fck", "sys_clk";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
>  			};
>  
>  			hdmi: encoder@58060000 {

-- 
Regards,

Laurent Pinchart
