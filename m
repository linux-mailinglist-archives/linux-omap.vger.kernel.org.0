Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0022AB638
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 12:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729255AbgKILK4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 06:10:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729470AbgKILKy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Nov 2020 06:10:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770F2C0613CF
        for <linux-omap@vger.kernel.org>; Mon,  9 Nov 2020 03:10:54 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AECF2B2B;
        Mon,  9 Nov 2020 12:10:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1604920252;
        bh=lKyzd8LpkprWUzQt3Q3xYMJ8fBYVE6XtqZ57FELlnHs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QWRWqAI1jFLf7kSL6EWg6prsurQrLtIYmyFBa7Bzr6w1tq6KlWSxiZkT08OWD7AHj
         agakPpwn29MGvwkjXcsa0Ypn0CoNquY6CBtxkPMY+VS3TxbYlMXZWbdWokvGFK/dNO
         7h7KkPvkTznesGbcooTl6UMvYxCyq8X9icP6H97M=
Date:   Mon, 9 Nov 2020 13:10:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 51/56] ARM: omap2plus_defconfig: Update for moved DSI
 command mode panel
Message-ID: <20201109111049.GV6029@pendragon.ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-52-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-52-tomi.valkeinen@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi and Sebastian,

Thank you for the patch.

On Thu, Nov 05, 2020 at 02:03:28PM +0200, Tomi Valkeinen wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The DSI command mode panel is no longer specific
> to OMAP and thus the config option has been renamed
> slightly.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/configs/omap2plus_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> index 34793aabdb65..d329d0829fce 100644
> --- a/arch/arm/configs/omap2plus_defconfig
> +++ b/arch/arm/configs/omap2plus_defconfig
> @@ -369,7 +369,7 @@ CONFIG_DRM_OMAP=m
>  CONFIG_OMAP5_DSS_HDMI=y
>  CONFIG_OMAP2_DSS_SDI=y
>  CONFIG_OMAP2_DSS_DSI=y
> -CONFIG_DRM_OMAP_PANEL_DSI_CM=m
> +CONFIG_DRM_PANEL_DSI_CM=m

Is thi the right location, have you regenerated the defconfig from a
.config, or just renamed the option ? With the location fixed if needed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  CONFIG_DRM_TILCDC=m
>  CONFIG_DRM_PANEL_SIMPLE=m
>  CONFIG_DRM_PANEL_LG_LB035Q02=m

-- 
Regards,

Laurent Pinchart
