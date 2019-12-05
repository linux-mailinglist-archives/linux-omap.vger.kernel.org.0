Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74307113D48
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2019 09:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfLEIqg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Dec 2019 03:46:36 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58450 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbfLEIqf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Dec 2019 03:46:35 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9DC02E5;
        Thu,  5 Dec 2019 09:46:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575535594;
        bh=8TJsjX9IMvcIxIR6rtYMP5rvFtEm/ezfomI72rg3LWM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J2J6kqttuSr10yCnUUiJ3/FHYvpSYKemAAigqbL9IXHSbbzwjC4j7BYgmgNXYvgYO
         hYBQOyku/R/oy/apxEZ0MgarfBtNn0TbupW6wVrNljclC4t0P7cMUpi5el+BiltIPw
         sh6s5PEoxgUTdR8Jpe7QUdDdEu+QzOMiFuyWA/0o=
Date:   Thu, 5 Dec 2019 10:46:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, tony@atomide.com,
        sam@ravnborg.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, tomi.valkeinen@ti.com,
        peter.ujfalusi@ti.com, bparrot@ti.com
Subject: Re: [PATCH 2/2] dt-bindings: display: Add obsolete note to
 "ti,tilcdc,panel" binding
Message-ID: <20191205084626.GB4734@pendragon.ideasonboard.com>
References: <cover.1575481630.git.jsarha@ti.com>
 <eabe78184ea7125dcff50826a0ee12a892443017.1575481630.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eabe78184ea7125dcff50826a0ee12a892443017.1575481630.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Jyri,

Thank you for the patch.

On Wed, Dec 04, 2019 at 07:53:11PM +0200, Jyri Sarha wrote:
> The "ti,tilcdc,panel" binding should not be used anymore, since tilcdc
> is fully capable of using generic drm panels like panel-simple and
> panel-common binding. However, the obsolete binding is still widely
> used in many mainline supported platforms that I do not have access to
> and who knows how many custom platforms. So I am afraid we have to
> keep the old bundled tilcdc panel driver around.
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  Documentation/devicetree/bindings/display/tilcdc/panel.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tilcdc/panel.txt b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
> index 808216310ea2..54963f9173cc 100644
> --- a/Documentation/devicetree/bindings/display/tilcdc/panel.txt
> +++ b/Documentation/devicetree/bindings/display/tilcdc/panel.txt
> @@ -1,5 +1,11 @@
>  Device-Tree bindings for tilcdc DRM generic panel output driver
>  
> +NOTE: This binding (and the related driver) is obsolete and should not
> +      be used anymore. Please refer to drm panel-common binding (and
> +      to a generic drm panel driver like panel-simple).
> +      Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +      (drivers/gpu/drm/panel/panel-simple.c)
> +

How about adding a WARN_ON() in the code when this binding is used ?
This could help getting those platforms converted.

>  Required properties:
>   - compatible: value should be "ti,tilcdc,panel".
>   - panel-info: configuration info to configure LCDC correctly for the panel

-- 
Regards,

Laurent Pinchart
