Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA45810F8B5
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2019 08:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfLCH3l (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Dec 2019 02:29:41 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57262 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfLCH3l (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Dec 2019 02:29:41 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1BA7309;
        Tue,  3 Dec 2019 08:29:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575358179;
        bh=7cZbYLONLyPLh46EPhOTsWVY7T7ktT6/ScSQB9363YY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Leqg0R6YUsSnpROUbCxEy4cfmiGkOCfTGZM43r+n1uEKkbWIRkUzyiD+ZwmPZv+2D
         bUxAHCy4NgvqVM4tmy418aSLwIEH3jYkFVeI6UtOl5Kfo6RKPrzEueYrqlskH8QzTu
         o7Tzgq8KrwIdS85VsaLK+h90k3XWrbPCAGYKMn5c=
Date:   Tue, 3 Dec 2019 09:29:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, tony@atomide.com,
        bcousson@baylibre.com, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, tomi.valkeinen@ti.com,
        peter.ujfalusi@ti.com, bparrot@ti.com
Subject: Re: [PATCH] ARM: dts: am335x-evm: Use drm simple-panel instead of
 tilcdc-panel
Message-ID: <20191203072932.GL4730@pendragon.ideasonboard.com>
References: <20191202185729.12921-1-jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191202185729.12921-1-jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Jyri,

Thank you for the patch.

On Mon, Dec 02, 2019 at 08:57:29PM +0200, Jyri Sarha wrote:
> Move to use the new drm panel support in tilcdc together with added
> "tfc,s9700rtwv43tr-01b"-panel support in drm panel-simple.
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
> "tfc,s9700rtwv43tr-01b" in panel-simple has been in for some time now
> so it is about time to get this in too.
> 
>  arch/arm/boot/dts/am335x-evm.dts | 44 +++++++++++++-------------------
>  1 file changed, 18 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
> index a00145705c9b..0e286a1c9cc5 100644
> --- a/arch/arm/boot/dts/am335x-evm.dts
> +++ b/arch/arm/boot/dts/am335x-evm.dts
> @@ -113,7 +113,7 @@
>  		};
>  	};
>  
> -	backlight {
> +	backlight: backlight {
>  		compatible = "pwm-backlight";
>  		pwms = <&ecap0 0 50000 0>;
>  		brightness-levels = <0 51 53 56 62 75 101 152 255>;
> @@ -121,35 +121,19 @@
>  	};
>  
>  	panel {
> -		compatible = "ti,tilcdc,panel";
> +		compatible = "tfc,s9700rtwv43tr-01b";
> +
>  		status = "okay";

I think this can be dropped as it's implicit.

> +
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&lcd_pins_s0>;
> -		panel-info {
> -			ac-bias           = <255>;
> -			ac-bias-intrpt    = <0>;
> -			dma-burst-sz      = <16>;
> -			bpp               = <32>;
> -			fdd               = <0x80>;
> -			sync-edge         = <0>;
> -			sync-ctrl         = <1>;
> -			raster-order      = <0>;
> -			fifo-th           = <0>;
> -		};
>  
> -		display-timings {
> -			800x480p62 {
> -				clock-frequency = <30000000>;
> -				hactive = <800>;
> -				vactive = <480>;
> -				hfront-porch = <39>;
> -				hback-porch = <39>;
> -				hsync-len = <47>;
> -				vback-porch = <29>;
> -				vfront-porch = <13>;
> -				vsync-len = <2>;
> -				hsync-active = <1>;
> -				vsync-active = <1>;
> +		backlight = <&backlight>;

I would add a blank line here.

> +		ports {
> +			port {
> +				panel_0: endpoint@0 {
> +					remote-endpoint = <&lcdc_0>;
> +				};
>  			};
>  		};

The outter ports node isn't required if there's a single port, up to
you.

>  	};
> @@ -525,6 +509,14 @@
>  	status = "okay";
>  
>  	blue-and-red-wiring = "crossed";
> +
> +	ports {
> +		port {
> +			lcdc_0: endpoint@0 {
> +				remote-endpoint = <&panel_0>;
> +			};
> +		};
> +	};

Same here.

With the above issues addressed as applicable,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  };
>  
>  &elm {

-- 
Regards,

Laurent Pinchart
