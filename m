Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C56B21C01D
	for <lists+linux-omap@lfdr.de>; Sat, 11 Jul 2020 00:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgGJWus (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 18:50:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37646 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgGJWus (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Jul 2020 18:50:48 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D55F62C0;
        Sat, 11 Jul 2020 00:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594421446;
        bh=18Z90ZunYSgLAwDlO01vtncPi5Vsgpi6t9PmK1tnIww=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FVu4uBdwnoxD7JlLZ49khmS9rUSZkmtzIeNhg+EQL9dOSpV8Vyh+EnXyqEq4RsXBC
         lq7wOAw9XYjBqRuvnzFgAsCXxVEgXK/I+27WUIRqo+OGjxSAg+YZd1HQ5cr3A7mrXc
         X7NXE5soVAm4GRTHxywhyxvzRnrwzcJXAB/dNpJ0=
Date:   Sat, 11 Jul 2020 01:50:39 +0300
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
Subject: Re: [PATCHv1 3/4] ARM: dts: omap4-droid4: add panel compatible
Message-ID: <20200710225039.GZ5964@pendragon.ideasonboard.com>
References: <20200629223315.118256-1-sebastian.reichel@collabora.com>
 <20200629223315.118256-4-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200629223315.118256-4-sebastian.reichel@collabora.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

Thank you for the patch, and for your continuous effort on this.

On Tue, Jun 30, 2020 at 12:33:14AM +0200, Sebastian Reichel wrote:
> Add Droid 4 specific compatible value in addition to the
> generic one, so that we have the ability to add panel
> specific quirks in the future.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm/boot/dts/motorola-mapphone-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> index 4ffe461c3808..0e22fdfa42aa 100644
> --- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> +++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> @@ -208,7 +208,7 @@ dsi1_out_ep: endpoint {
>  	};
>  
>  	lcd0: panel@0 {
> -		compatible = "panel-dsi-cm";
> +		compatible = "motorola,droid4-panel", "panel-dsi-cm";
>  		reg = <0>;
>  		label = "lcd0";
>  		vddi-supply = <&lcd_regulator>;

-- 
Regards,

Laurent Pinchart
