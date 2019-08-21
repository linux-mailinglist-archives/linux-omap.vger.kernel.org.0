Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8816698595
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2019 22:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfHUU03 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Aug 2019 16:26:29 -0400
Received: from emh04.mail.saunalahti.fi ([62.142.5.110]:42434 "EHLO
        emh04.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbfHUU03 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Aug 2019 16:26:29 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-66-34-nat.elisa-mobile.fi [85.76.66.34])
        by emh04.mail.saunalahti.fi (Postfix) with ESMTP id 9459A30049;
        Wed, 21 Aug 2019 23:26:27 +0300 (EEST)
Date:   Wed, 21 Aug 2019 23:26:27 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] drm/omap: Fix port lookup for SDI output
Message-ID: <20190821202627.GD30291@darkstar.musicnaut.iki.fi>
References: <20190818140838.GC30291@darkstar.musicnaut.iki.fi>
 <20190821183226.13784-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821183226.13784-1-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Wed, Aug 21, 2019 at 09:32:26PM +0300, Laurent Pinchart wrote:
> When refactoring port lookup for DSS outputs, commit d17eb4537a7e
> ("drm/omap: Factor out common init/cleanup code for output devices")
> incorrectly hardcoded usage of DT port 0. This breaks operation for SDI
> (which uses the DT port 1) and DPI outputs other than DPI0 (which are
> not used in mainline DT sources).
> 
> Fix this by using the port number from the output omap_dss_device
> of_ports field.
> 
> Fixes: d17eb4537a7e ("drm/omap: Factor out common init/cleanup code for output devices")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Thanks, this fixes the display issue on N900.

A.

> ---
>  drivers/gpu/drm/omapdrm/dss/output.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
> index de0f882f0f7b..14b41de44ebc 100644
> --- a/drivers/gpu/drm/omapdrm/dss/output.c
> +++ b/drivers/gpu/drm/omapdrm/dss/output.c
> @@ -4,6 +4,7 @@
>   * Author: Archit Taneja <archit@ti.com>
>   */
>  
> +#include <linux/bitops.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -20,7 +21,8 @@ int omapdss_device_init_output(struct omap_dss_device *out)
>  {
>  	struct device_node *remote_node;
>  
> -	remote_node = of_graph_get_remote_node(out->dev->of_node, 0, 0);
> +	remote_node = of_graph_get_remote_node(out->dev->of_node,
> +					       ffs(out->of_ports) - 1, 0);
>  	if (!remote_node) {
>  		dev_dbg(out->dev, "failed to find video sink\n");
>  		return 0;
> -- 
> Regards,
> 
> Laurent Pinchart
> 
