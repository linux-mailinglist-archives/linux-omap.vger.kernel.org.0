Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00BCC2C817C
	for <lists+linux-omap@lfdr.de>; Mon, 30 Nov 2020 10:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgK3Jyu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Nov 2020 04:54:50 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57092 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726337AbgK3Jyu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Nov 2020 04:54:50 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF72297E;
        Mon, 30 Nov 2020 10:54:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606730048;
        bh=w3aYJsOXXM7XDf8abBa7779sdieDtO0JkJ6elxgkOQE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pxKoPLx9zVB98tdfqR5XqrkuyXwlAI2qCCnhlk65hZppGAttSj5hXCY/PASWOmSz3
         PFUXP5X9baGJ0kot06Rf37PmyyL8Y1HsT38/owSvOvNFS1NH5x7Qt8le1VS23CNEch
         92SH8NanK5mV4dcEjX1f02jscS67xvayxXcQGeUI=
Date:   Mon, 30 Nov 2020 11:53:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        hns@goldelico.com
Subject: Re: [PATCH v4 57/80] ARM: dts: omap5: add address-cells & size-cells
 to dsi
Message-ID: <20201130095358.GI4141@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-58-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-58-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:15PM +0200, Tomi Valkeinen wrote:
> Add address-cells & size-cells to DSI nodes so that board files do not
> need to define them.

How about adding ports too, while at it ?

It would also be nice to convert the DT bindings to YAML :-)

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/boot/dts/omap5.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
> index 2bf2e5839a7f..e6f6947965ef 100644
> --- a/arch/arm/boot/dts/omap5.dtsi
> +++ b/arch/arm/boot/dts/omap5.dtsi
> @@ -517,6 +517,9 @@ dsi1: encoder@0 {
>  						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
>  							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
>  						clock-names = "fck", "sys_clk";
> +
> +						#address-cells = <1>;
> +						#size-cells = <0>;
>  					};
>  				};
>  
> @@ -549,6 +552,9 @@ dsi2: encoder@0 {
>  						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
>  							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
>  						clock-names = "fck", "sys_clk";
> +
> +						#address-cells = <1>;
> +						#size-cells = <0>;
>  					};
>  				};
>  

-- 
Regards,

Laurent Pinchart
