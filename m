Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFE4621C024
	for <lists+linux-omap@lfdr.de>; Sat, 11 Jul 2020 00:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgGJWwZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 18:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgGJWwZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Jul 2020 18:52:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7724BC08C5DC;
        Fri, 10 Jul 2020 15:52:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A1542C0;
        Sat, 11 Jul 2020 00:52:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594421541;
        bh=Uv148u6uM7FIYHIFcS/h08G7WSplqkJxSWEBYainTAM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NCoG72tL5z1oiZLLC7FSIPy8IMXJI7/Rh2jgE4E0nCH/V3Nj9ue5UggGsNatbOrrF
         SitdJo1hjWGVb+NEsUyFcyq3WTu1RAHaKA9Ka4z5s//Cj/bZaOBT+KezgeAxVlytTi
         8psojw2VeoDniE83wLIREj0V7Y6qSaf1uVMzIpQc=
Date:   Sat, 11 Jul 2020 01:52:14 +0300
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
Subject: Re: [PATCHv1 4/4] ARM: dts: omap4-droid4: add panel orientation
Message-ID: <20200710225214.GB5964@pendragon.ideasonboard.com>
References: <20200629223315.118256-1-sebastian.reichel@collabora.com>
 <20200629223315.118256-5-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200629223315.118256-5-sebastian.reichel@collabora.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

Thank you for the patch.

On Tue, Jun 30, 2020 at 12:33:15AM +0200, Sebastian Reichel wrote:
> Add information about panel orientation, so that the
> system boots into a properly rotated shell.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm/boot/dts/motorola-mapphone-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> index 0e22fdfa42aa..e672e714fcbe 100644
> --- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> +++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> @@ -218,6 +218,7 @@ lcd0: panel@0 {
>  
>  		width-mm = <50>;
>  		height-mm = <89>;
> +		rotation = <90>;
>  
>  		panel-timing {
>  			clock-frequency = <0>;		/* Calculated by dsi */

-- 
Regards,

Laurent Pinchart
