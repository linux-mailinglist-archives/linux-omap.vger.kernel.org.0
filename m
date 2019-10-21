Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5241DF40D
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 19:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbfJURTt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 13:19:49 -0400
Received: from muru.com ([72.249.23.125]:38582 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727328AbfJURTt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Oct 2019 13:19:49 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8EBC280CC;
        Mon, 21 Oct 2019 17:20:22 +0000 (UTC)
Date:   Mon, 21 Oct 2019 10:19:44 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 3/3] ARM: logicpd-torpedo-37xx-devkit-28: Reference
 new DRM panel
Message-ID: <20191021171944.GA5610@atomide.com>
References: <20191016135147.7743-1-aford173@gmail.com>
 <20191016135147.7743-3-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016135147.7743-3-aford173@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [191016 06:53]:
> With the removal of the panel-dpi from the omap drivers, the
> LCD no longer works.  This patch points the device tree to
> a newly created panel named "logicpd,type28"
> 
> Fixes: 8bf4b1621178 ("drm/omap: Remove panel-dpi driver")
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> V5:  No Change
> V4:  No Change
> V3:  No change
> V2:  Remove legacy 'label' from binding

I'm picking this patch into omap-for-v5.5/dt thanks.

Regards,

Tony

> diff --git a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
> index 07ac99b9cda6..cdb89b3e2a9b 100644
> --- a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
> +++ b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit-28.dts
> @@ -11,22 +11,6 @@
>  #include "logicpd-torpedo-37xx-devkit.dts"
>  
>  &lcd0 {
> -
> -	label = "28";
> -
> -	panel-timing {
> -		clock-frequency = <9000000>;
> -		hactive = <480>;
> -		vactive = <272>;
> -		hfront-porch = <3>;
> -		hback-porch = <2>;
> -		hsync-len = <42>;
> -		vback-porch = <3>;
> -		vfront-porch = <2>;
> -		vsync-len = <11>;
> -		hsync-active = <1>;
> -		vsync-active = <1>;
> -		de-active = <1>;
> -		pixelclk-active = <0>;
> -	};
> +	/* To make it work, set CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=4 */
> +	compatible = "logicpd,type28";
>  };
> -- 
> 2.17.1
> 
