Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A29B21C020
	for <lists+linux-omap@lfdr.de>; Sat, 11 Jul 2020 00:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgGJWwD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 18:52:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37680 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgGJWwD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Jul 2020 18:52:03 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC5C62C0;
        Sat, 11 Jul 2020 00:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594421521;
        bh=8o8fKQEy2BHLf9F6MdZuV2yJiApk96/iOHZbobVYuME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=di8NESVTJ7XLM30pYXxC9gj2TkOQDqcWjjE5Bc2Q2pYP/ofEg6BnMULXGwb28JE7r
         SjIc7TfvVJPCSSK/AvgdVfwFXS9lloKr5/S+kJpx1KxiN0HlbNukhObrikiKNOc3XF
         JoYQAhKPYYEcvIZXVov5mX8eyhLXviV22CSPIg/s=
Date:   Sat, 11 Jul 2020 01:51:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCHv1 2/4] ARM: dts: omap: add channel to DSI panels
Message-ID: <20200710225154.GA5964@pendragon.ideasonboard.com>
References: <20200629223315.118256-1-sebastian.reichel@collabora.com>
 <20200629223315.118256-3-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200629223315.118256-3-sebastian.reichel@collabora.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

Thank you for the patch.

On Tue, Jun 30, 2020 at 12:33:13AM +0200, Sebastian Reichel wrote:
> The standard binding for DSI requires, that the channel number

s/requires,/requires/

> of the panel is encoded in DT. This adds the channel number in
> all OMAP3-5 boards, in preparation for using common infrastructure.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm/boot/dts/motorola-mapphone-common.dtsi | 3 ++-
>  arch/arm/boot/dts/omap3-n950.dts                | 3 ++-
>  arch/arm/boot/dts/omap3.dtsi                    | 3 +++
>  arch/arm/boot/dts/omap4-sdp.dts                 | 6 ++++--
>  arch/arm/boot/dts/omap4.dtsi                    | 6 ++++++
>  arch/arm/boot/dts/omap5.dtsi                    | 6 ++++++
>  6 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> index 06fbffa81636..4ffe461c3808 100644
> --- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> +++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> @@ -207,8 +207,9 @@ dsi1_out_ep: endpoint {
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
> index 1296d0643943..0ebbb6c11f04 100644
> --- a/arch/arm/boot/dts/omap3.dtsi
> +++ b/arch/arm/boot/dts/omap3.dtsi
> @@ -898,6 +898,9 @@ dsi: encoder@4804fc00 {
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
> index 4400f5f8e099..c5b426616443 100644
> --- a/arch/arm/boot/dts/omap4.dtsi
> +++ b/arch/arm/boot/dts/omap4.dtsi
> @@ -551,6 +551,9 @@ dsi1: encoder@0 {
>  						clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>,
>  							 <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
>  						clock-names = "fck", "sys_clk";
> +
> +						#address-cells = <1>;
> +						#size-cells = <0>;
>  					};
>  				};
>  
> @@ -583,6 +586,9 @@ dsi2: encoder@0 {
>  						clocks = <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 8>,
>  						         <&l3_dss_clkctrl OMAP4_DSS_CORE_CLKCTRL 10>;
>  						clock-names = "fck", "sys_clk";
> +
> +						#address-cells = <1>;
> +						#size-cells = <0>;
>  					};
>  				};
>  
> diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
> index fb889c5b00c9..0855c0a4050f 100644
> --- a/arch/arm/boot/dts/omap5.dtsi
> +++ b/arch/arm/boot/dts/omap5.dtsi
> @@ -491,6 +491,9 @@ dsi1: encoder@0 {
>  						status = "disabled";
>  						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>;
>  						clock-names = "fck";
> +
> +						#address-cells = <1>;
> +						#size-cells = <0>;
>  					};
>  				};
>  
> @@ -522,6 +525,9 @@ dsi2: encoder@0 {
>  						status = "disabled";
>  						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>;
>  						clock-names = "fck";
> +
> +						#address-cells = <1>;
> +						#size-cells = <0>;
>  					};
>  				};
>  

-- 
Regards,

Laurent Pinchart
