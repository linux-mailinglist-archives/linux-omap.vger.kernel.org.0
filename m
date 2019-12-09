Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8716F116F8F
	for <lists+linux-omap@lfdr.de>; Mon,  9 Dec 2019 15:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfLIOue (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Dec 2019 09:50:34 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36592 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfLIOud (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Dec 2019 09:50:33 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CD25DAD;
        Mon,  9 Dec 2019 15:50:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575903031;
        bh=iMA0EMCIcVhf1bAexv25ojEbqExgp+n80z/z9CDFqJo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kehsnBfjJjSGCd9e2JiRW6Qz+YP1pdWYqrl+G1It+mEU+1vRCgdUGeTpw4sshrfQ+
         OgzeXaTiUXztWDwsvfVswez3dVhC9XKW78WeKIeL9vProh7XgzHh/yNNHaOkKbLp0R
         5GvWh1nvD5M6wHg43pc6pK0Nk5JVTeniBdGgcrPo=
Date:   Mon, 9 Dec 2019 16:50:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, tony@atomide.com,
        sam@ravnborg.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, tomi.valkeinen@ti.com,
        peter.ujfalusi@ti.com, bparrot@ti.com
Subject: Re: [PATCH v2 2/3] dt-bindings: display: Add obsolete note to
 "ti,tilcdc,panel" binding
Message-ID: <20191209145024.GB12841@pendragon.ideasonboard.com>
References: <cover.1575901747.git.jsarha@ti.com>
 <459ed943fe0725200062171755bcfe5f73713d50.1575901747.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <459ed943fe0725200062171755bcfe5f73713d50.1575901747.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Jyri,

Thank you for the patch.

On Mon, Dec 09, 2019 at 04:42:15PM +0200, Jyri Sarha wrote:
> The "ti,tilcdc,panel" binding should not be used anymore, since tilcdc
> is fully capable of using generic drm panels like panel-simple and
> panel-common binding. However, the obsolete binding is still widely
> used in many mainline supported platforms that I do not have access to
> and who knows how many custom platforms. So I am afraid we have to
> keep the old bundled tilcdc panel driver around.

But can't we drop the bindings instead of marking them as obsolete, even
if we keep the driver around for some time ?

Also, would it make sense to set a date for the removal of the driver,
and add it to the WARN() message in patch 3/3 ?

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
>  Required properties:
>   - compatible: value should be "ti,tilcdc,panel".
>   - panel-info: configuration info to configure LCDC correctly for the panel

-- 
Regards,

Laurent Pinchart
