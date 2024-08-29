Return-Path: <linux-omap+bounces-2053-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEE9964A61
	for <lists+linux-omap@lfdr.de>; Thu, 29 Aug 2024 17:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 384C9283FC9
	for <lists+linux-omap@lfdr.de>; Thu, 29 Aug 2024 15:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946201B3B17;
	Thu, 29 Aug 2024 15:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfMY30LC"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6871B3745;
	Thu, 29 Aug 2024 15:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724946199; cv=none; b=SpyKsA/Mp0oPwt167KwJmEBEfjmdzOZAZAmkoBLVV6Glm+gvBxjrQ2B+USHrRuXrVnWtTl8gLaM6CePIKuv+nehO30xIBb1K0u77Om72kDtUE50pKEjB2TwZe97IufYVhTgT4Hw0ynfWCaWOJT9NU/Svy7UiaQitm1hYcDJ/THo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724946199; c=relaxed/simple;
	bh=F7RTQPtDOnRRFJUgG6erlEaYNrW5gyiWnn8+Dsb7Ze4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWfODFLwIKtnxGL0vsBd+TySdH3TWp4uzlziS0tXBBCK407V22bSqYITrhpflr+wdST1iVJTbaPPsG/pHhD68Mxu66rKvpa0V8rRCxOWJt/4C4hcgBd0vwLANl+FNkS6Ix2aLp03jSNkD9UfOCtH+ODcvM8aAzI4k7Webo0KKjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfMY30LC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BADC4CEC3;
	Thu, 29 Aug 2024 15:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724946198;
	bh=F7RTQPtDOnRRFJUgG6erlEaYNrW5gyiWnn8+Dsb7Ze4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WfMY30LC/MTR7UoIwYXTcquRzuZHFJKHbCE8dQm/pgWNLwbXbhdScutPCbrQGXNMM
	 p1aS2YIjyBgIEGx1Y3y6u6Rp/8OugXX3duxygDxmn55nCTzUMSSCjebvCivN6+jTum
	 pVHXy6F6i2nwZbdky/30D0BV9PTH8Tj2x6ppFH90oYD9fQmHMWG8JmXAh4qG8gB9+w
	 GuDOEAQbCOVMyS7gbv+j12rayTdjt7VJdyg8LsNyjav1f3tkO0jQdnWnVIr2d769Ve
	 jLKLR+zB3xGUbgCYUjeum+nAUs2MrwwelPppMrfJo81h72SmdprSVNYUMBRxi+606h
	 0uEGmag9ZB4rg==
Date: Thu, 29 Aug 2024 10:43:16 -0500
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 8/9] fbdev: omapfb: use new of_graph functions
Message-ID: <20240829154316.GC465065-robh@kernel.org>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
 <87zfox1b9m.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfox1b9m.wl-kuninori.morimoto.gx@renesas.com>

On Wed, Aug 28, 2024 at 05:12:22AM +0000, Kuninori Morimoto wrote:
> Now we can use new port related functions for port parsing. Use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |  3 +-
>  drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 66 -------------------
>  drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  9 +--
>  drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |  3 +-
>  include/video/omapfb_dss.h                    |  8 ---
>  5 files changed, 9 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
> index 7c1b7d89389aa..395b1139a5ae7 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
> @@ -20,6 +20,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/string.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  
> @@ -845,7 +846,7 @@ int dpi_init_port(struct platform_device *pdev, struct device_node *port)
>  	if (!dpi)
>  		return -ENOMEM;
>  
> -	ep = omapdss_of_get_next_endpoint(port, NULL);
> +	ep = of_graph_get_next_port_endpoint(port, NULL);
>  	if (!ep)
>  		return 0;
>  
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> index 4040e247e026e..efb7d2e4ce85d 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> @@ -15,72 +15,6 @@
>  
>  #include "dss.h"
>  
> -struct device_node *
> -omapdss_of_get_next_port(const struct device_node *parent,
> -			 struct device_node *prev)
> -{
> -	struct device_node *port = NULL;
> -
> -	if (!parent)
> -		return NULL;
> -
> -	if (!prev) {
> -		struct device_node *ports;
> -		/*
> -		 * It's the first call, we have to find a port subnode
> -		 * within this node or within an optional 'ports' node.
> -		 */
> -		ports = of_get_child_by_name(parent, "ports");
> -		if (ports)
> -			parent = ports;
> -
> -		port = of_get_child_by_name(parent, "port");
> -
> -		/* release the 'ports' node */
> -		of_node_put(ports);
> -	} else {
> -		struct device_node *ports;
> -
> -		ports = of_get_parent(prev);
> -		if (!ports)
> -			return NULL;
> -
> -		do {
> -			port = of_get_next_child(ports, prev);
> -			if (!port) {
> -				of_node_put(ports);
> -				return NULL;
> -			}
> -			prev = port;
> -		} while (!of_node_name_eq(port, "port"));
> -
> -		of_node_put(ports);
> -	}
> -
> -	return port;
> -}
> -EXPORT_SYMBOL_GPL(omapdss_of_get_next_port);
> -
> -struct device_node *
> -omapdss_of_get_next_endpoint(const struct device_node *parent,
> -			     struct device_node *prev)
> -{
> -	struct device_node *ep = NULL;
> -
> -	if (!parent)
> -		return NULL;
> -
> -	do {
> -		ep = of_get_next_child(parent, prev);
> -		if (!ep)
> -			return NULL;
> -		prev = ep;
> -	} while (!of_node_name_eq(ep, "endpoint"));
> -
> -	return ep;
> -}
> -EXPORT_SYMBOL_GPL(omapdss_of_get_next_endpoint);
> -
>  struct device_node *dss_of_port_get_parent_device(struct device_node *port)
>  {
>  	struct device_node *np;
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> index d814e4baa4b33..5cab317011eeb 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> @@ -26,6 +26,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/suspend.h>
>  #include <linux/component.h>
> @@ -922,7 +923,7 @@ static int dss_init_ports(struct platform_device *pdev)
>  	if (parent == NULL)
>  		return 0;

of_graph_get_next_port() handles parent==NULL, so you can drop this 
check. And the other cases.

Rob

