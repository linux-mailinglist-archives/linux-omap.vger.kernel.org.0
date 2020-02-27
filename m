Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCC7172947
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 21:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729453AbgB0UKl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Feb 2020 15:10:41 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:50160 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729771AbgB0UKl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Feb 2020 15:10:41 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 7A8B22001F;
        Thu, 27 Feb 2020 21:10:38 +0100 (CET)
Date:   Thu, 27 Feb 2020 21:10:37 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>, kernel@collabora.com,
        Tony Lindgren <tony@atomide.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv2 02/56] ARM: dts: omap4-droid4: add panel compatible
Message-ID: <20200227201037.GB27592@ravnborg.org>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-3-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224232126.3385250-3-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
        a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=ob02wDL8X72sIEBK8hwA:9
        a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22 a=E9Po1WZjFZOl8hwRPBS3:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Feb 25, 2020 at 12:20:32AM +0100, Sebastian Reichel wrote:
> Add Droid 4 specific compatible value in addition to the
> generic one, so that we have the ability to add panel
> specific quirks in the future.
> 

Yes, exactly as explained in previous mail. Thanks.

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

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
> -- 
> 2.25.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
