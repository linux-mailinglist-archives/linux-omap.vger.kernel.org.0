Return-Path: <linux-omap+bounces-2055-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 546ED964A8D
	for <lists+linux-omap@lfdr.de>; Thu, 29 Aug 2024 17:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4A581F2158D
	for <lists+linux-omap@lfdr.de>; Thu, 29 Aug 2024 15:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0BCE1B3B28;
	Thu, 29 Aug 2024 15:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIDYYNtx"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB981922E6;
	Thu, 29 Aug 2024 15:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724946616; cv=none; b=g/l4RYu6441GtQ9E/zOvsuY+EIF0P6WjSQgi0pHWh7g3PoAOy0bsWSCEoQ7vHPKuvJPqyGuUbpt2VvqhtxC5EiydgbpxoogsD0ILlSp/tjz8d/GLNZMzPeqDk1r97mrbmxg5iVb8BPAilYfFGYyXlXSGRtgeKHv+OfmyW+KgBwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724946616; c=relaxed/simple;
	bh=KccHSL6fnfRyNdZ90h1lu3IkO6/vw/VRe94K7w5iAy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLRj3L+klEIlWpWZgxcoqZR+QLCfH03cNYfZg5lrLENcW6/jDxmsrUbd04XA3lXLWEGBQYJDnNDtLPeZFltUh4CZp/Ru6raI4y+O5/TIYq0LcaQAhjsByhroEgezhrOCpotto7D/9zMj938AXZHknu2VLVTd5m34MTVzjwdWWj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WIDYYNtx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADD2C4CEC1;
	Thu, 29 Aug 2024 15:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724946616;
	bh=KccHSL6fnfRyNdZ90h1lu3IkO6/vw/VRe94K7w5iAy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIDYYNtxl0pvt7YlIt1csogI9T2a15xk1/T4FECWLIFS9jXTqScuicaXrxQ/2b8Gh
	 qsK2yQRiErDgH9jEeSwnKvx2fWa5S10GuWUcyUaPJmocSQUu3N8UH/zXmZqsikYedH
	 WfwZMoOpUe/kVao3rxXw3KbmgVpfef7CVVDCXh47RDPsrAmZy5S4UunyrPI+PFdhQc
	 iaEtzw6QhCrqPYWA7OescM0zVcH1JNLwEfI6os+SWN9JskUmguFMTOpmVVHIEREJ27
	 et59OKxRrNSj+Hq3jrAB3UIhDPnWiW2bKaXH4JtpRN2qet+nJCRlKIReqetlLGq/uQ
	 niInKANx9CERA==
Date: Thu, 29 Aug 2024 10:50:14 -0500
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
Subject: Re: [PATCH v4 1/9] of: property: add of_graph_get_next_port()
Message-ID: <20240829155014.GE465065-robh@kernel.org>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
 <87a5gx2pva.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5gx2pva.wl-kuninori.morimoto.gx@renesas.com>

On Wed, Aug 28, 2024 at 05:11:37AM +0000, Kuninori Morimoto wrote:
> We have endpoint base functions
> 	- of_graph_get_next_device_endpoint()
> 	- of_graph_get_device_endpoint_count()
> 	- for_each_of_graph_device_endpoint()
> 
> Here, for_each_of_graph_device_endpoint() loop finds each endpoints
> 
> 	ports {
> 		port@0 {
> (1)			endpoint {...};
> 		};
> 		port@1 {
> (2)			endpoint {...};
> 		};
> 		...
> 	};
> 
> In above case, it finds endpoint as (1) -> (2) -> ...
> 
> Basically, user/driver knows which port is used for what, but not in
> all cases. For example on flexible/generic driver case, how many ports
> are used is not fixed.
> 
> For example Sound Generic Card driver which is used from many venders
> can't know how many ports are used. Because the driver is very
> flexible/generic, it is impossible to know how many ports are used,
> it depends on each vender SoC and/or its used board.
> 
> And more, the port can have multi endpoints. For example Generic Sound
> Card case, it supports many type of connection between CPU / Codec, and
> some of them uses multi endpoint in one port.
> Then, Generic Sound Card want to handle each connection via "port"
> instead of "endpoint".
> But, it is very difficult to handle each "port" via existing
> for_each_of_graph_device_endpoint(). Getting "port" via of_get_parent()
> from "endpoint" doesn't work. see below.
> 
> 	ports {
> 		port@0 {
> (1)			endpoint@0 {...};
> (2)			endpoint@1 {...};
> 		};
> 		port@1 {
> (3)			endpoint {...};
> 		};
> 		...
> 	};
> 
> In other case, we want to handle "ports" same as "port" for some reasons.
> 
> 	node {
> =>		ports@0 {
> 			port@0 { ... };
> 			port@1 { ... };
> 			...
> 		};
> =>		ports@1 {
> 			...
> 		};
> 	};
> 
> Add "ports" / "port" base functions.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/of/property.c    | 108 +++++++++++++++++++++++++++++++++++++++
>  include/linux/of_graph.h |  49 ++++++++++++++++++
>  2 files changed, 157 insertions(+)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 164d77cb94458..d99b34dd2d5b4 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -625,6 +625,97 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
>  }
>  EXPORT_SYMBOL(of_graph_get_port_by_id);
>  
> +/**
> + * of_graph_get_next_ports() - get next ports node.
> + * @parent: pointer to the parent device node
> + * @prev: previous ports node, or NULL to get first
> + *
> + * If "parent" node doesn't have "ports" node, it returns "parent" node itself as "ports" node.
> + *
> + * Return: A 'ports' node pointer with refcount incremented. Refcount
> + * of the passed @prev node is decremented.
> + */
> +struct device_node *of_graph_get_next_ports(struct device_node *parent,
> +					    struct device_node *prev)
> +{
> +	if (!parent)
> +		return NULL;
> +
> +	if (!prev) {
> +		/*
> +		 * Find "ports" node from parent
> +		 *
> +		 *	parent {
> +		 * =>		ports {
> +		 *			port {...};
> +		 *		};
> +		 *	};
> +		 */
> +		prev = of_get_child_by_name(parent, "ports");
> +
> +		/*
> +		 * Use parent as its ports if it not exist
> +		 *
> +		 * =>	parent {
> +		 *		port {...};
> +		 *	};
> +		 */
> +		if (!prev) {
> +			/* check whether "parent" has "port" node */
> +			struct device_node *port __free(device_node) = of_get_child_by_name(parent, "port");
> +
> +			if (port)
> +				prev = of_node_get(parent);
> +		}
> +
> +		return prev;
> +	}
> +
> +	/* Find next ports */
> +	do {
> +		prev = of_get_next_child(parent, prev);
> +		if (!prev)
> +			break;
> +	} while (!of_node_name_eq(prev, "ports"));
> +
> +	return prev;
> +}
> +EXPORT_SYMBOL(of_graph_get_next_ports);
> +
> +/**
> + * of_graph_get_next_port() - get next port node.
> + * @parent: pointer to the parent device node, or parent ports node
> + * @prev: previous port node, or NULL to get first
> + *
> + * Parent device node can be used as @parent whether device node has ports node or not.
> + * It will work same as ports@0 node.
> + *
> + * Return: A 'port' node pointer with refcount incremented. Refcount
> + * of the passed @prev node is decremented.
> + */
> +struct device_node *of_graph_get_next_port(struct device_node *parent,
> +					   struct device_node *prev)
> +{
> +	if (!parent)
> +		return NULL;
> +
> +	if (!prev) {
> +		struct device_node *ports __free(device_node) =
> +			of_graph_get_next_ports(parent, NULL);
> +
> +		return of_get_child_by_name(ports, "port");
> +	}
> +
> +	do {
> +		prev = of_get_next_child(parent, prev);
> +		if (!prev)
> +			break;
> +	} while (!of_node_name_eq(prev, "port"));
> +
> +	return prev;
> +}
> +EXPORT_SYMBOL(of_graph_get_next_port);

of_graph_is_present should be reimplemented using this function. So 
should part of of_graph_get_next_endpoint().

Rob

