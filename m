Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16BE416B5C0
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgBXXhd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:37:33 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60138 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727081AbgBXXhd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 18:37:33 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A762DE89;
        Tue, 25 Feb 2020 00:37:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582587451;
        bh=0NVmYM5XYByhtWU3L9BpXaNiWVEV1T5HtjKzqaXvPbk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KT6KiqzgmTUg0EA5a59/tuNZfgh75NGflxm5yTZVY+bGmR5FapAC64laNSkXwp/PD
         E5Z3lCkniJIfLf0xdN/jMkr0hy8B8l75NA5MjLpiI6fGdKkJU45kdroC5WXFmK3SAx
         WADsCbbsU0HdZar75gHUgtgRLelycMBm7Uddna3I=
Date:   Tue, 25 Feb 2020 01:37:08 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCHv2 02/56] ARM: dts: omap4-droid4: add panel compatible
Message-ID: <20200224233708.GG16163@pendragon.ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-3-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200224232126.3385250-3-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

Thank you for the patch.

On Tue, Feb 25, 2020 at 12:20:32AM +0100, Sebastian Reichel wrote:
> Add Droid 4 specific compatible value in addition to the
> generic one, so that we have the ability to add panel
> specific quirks in the future.

We need to document this compatible string in DT bindings, I don't think
this is included in this series. Furthermore, could we use a compatible
string that actually matches the panel vendor and model, instead of the
device name ?

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm/boot/dts/motorola-mapphone-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> index a5e4ba7c8dab..622383ec6a75 100644
> --- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> +++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> @@ -200,7 +200,7 @@ dsi1_out_ep: endpoint {
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
