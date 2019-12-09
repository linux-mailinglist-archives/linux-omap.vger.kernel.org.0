Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 382B2116FBA
	for <lists+linux-omap@lfdr.de>; Mon,  9 Dec 2019 15:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfLIOzy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Dec 2019 09:55:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36698 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfLIOzy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Dec 2019 09:55:54 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FE3AB2C;
        Mon,  9 Dec 2019 15:49:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575902944;
        bh=moup88+1AXSzEBbkY0ogHDXr3kUQoRsbnyHWmDnec8A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MwGX9WKtAX0NlVKPSv8B6uqYCPjfM4orkrQE9h1nZ+HmGVnku0I1OHEgtpnAqnHCA
         15aXPVvHmcZmo+/hxpMpaplTXiqilc0wAcOOG/jSJ1+cSiGK23lle39cEZ2rsn8B2J
         5Zxa43KbOSTCzccEk9I8R7kKo1hq/qRAZaGE6n1A=
Date:   Mon, 9 Dec 2019 16:48:57 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, tony@atomide.com,
        sam@ravnborg.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, tomi.valkeinen@ti.com,
        peter.ujfalusi@ti.com, bparrot@ti.com
Subject: Re: [PATCH v2 3/3] drm/tilcdc: panel: Add WARN() with a comment to
 tilcdc-panel probe
Message-ID: <20191209144857.GA12841@pendragon.ideasonboard.com>
References: <cover.1575901747.git.jsarha@ti.com>
 <54966ffd61ca46528bc55961c532001aa7463c30.1575901747.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <54966ffd61ca46528bc55961c532001aa7463c30.1575901747.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Jyri,

Thank you for the patch.

On Mon, Dec 09, 2019 at 04:42:16PM +0200, Jyri Sarha wrote:
> Add WARN() to the beginnig of tilcdc-panel probe. The obsolete

s/beginnig/beginning/

> tilcdc-panel driver should not be used anymore, since tilcdc is fully
> capable of using generic drm panels like panel-simple and panel-common
> binding.
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  drivers/gpu/drm/tilcdc/tilcdc_panel.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
> index 5584e656b857..cf8e2462a524 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
> @@ -309,6 +309,16 @@ static int panel_probe(struct platform_device *pdev)
>  	struct pinctrl *pinctrl;
>  	int ret;
>  
> +	/*
> +	 * The obsolete tilcdc-panel driver should not be used
> +         * anymore, since tilcdc is fully capable of using generic drm
> +         * panels like panel-simple and panel-common binding.

Indentation should use tabs.

> +	 */
> +
> +	WARN(true,
> +	     "tilcdc-panel is obsolte and should not be used. Please update your configuration!\n",

s/obsolte/obsolete/ or deprecated ?

You may want to explicitly state what it should be updated to :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	     dev_name(&pdev->dev));
> +
>  	/* bail out early if no DT data: */
>  	if (!node) {
>  		dev_err(&pdev->dev, "device-tree data is missing\n");

-- 
Regards,

Laurent Pinchart
