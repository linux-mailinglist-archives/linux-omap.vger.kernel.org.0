Return-Path: <linux-omap+bounces-2017-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 654CB95F54F
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2024 17:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6320B214A5
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2024 15:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2988193429;
	Mon, 26 Aug 2024 15:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXEis2oZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E73B189509;
	Mon, 26 Aug 2024 15:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724686813; cv=none; b=bPxmSPSK20i/87I45WW9FoGF/muklrPvDop9chvMRKn4s0GGyVwnkDMvkjXz/auTxbt7nOOHr7TE0+1Nc3rIJOpk7jK4kOq3n+alWTE/H4FPis5+jarmzLAbLMiB5t/Bkb9W6iZLOXKPg4O0pMX/E2j6KrYcA1+8Zo9fnM0T8i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724686813; c=relaxed/simple;
	bh=3nPEGv1ScbaB4qHxVjJQ7z0P5oNlCzTkuKeiIaD8G4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRXoQE+/YNanZAksxpy7ngsLsAj9pbKSmQalGOyAlvSyGgqiDetbjauvmEgFY2tz4/0erPpn56U9fQmOfpZs+2Fow1puzZLMFCioiVYHvj6XD8oKhmF2gQyPUp1QGNKZ6h5yGVkOh/lK3KAiH7497j/UAE/7y0DDo0IcIMsT1QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXEis2oZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7E6C52FC1;
	Mon, 26 Aug 2024 15:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724686812;
	bh=3nPEGv1ScbaB4qHxVjJQ7z0P5oNlCzTkuKeiIaD8G4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tXEis2oZr+7TJtq6SLWNyCtyZ3RaEWuaa3hHuJShWSnlk4zDlfSTBrLQLLmFddZew
	 yz0j/PDCq4oPjmR4v7fRrPpN1MW0KMRcFRqxLJi7DX+frL/fWFhQJSqygHgo6TAmdY
	 TA3oqAoRjxnlgbPwyWiuG3Ysd1bYMo0OPUfmuyzL7w8xlFurcr8pz/XzrOZ12at/yE
	 9WpTKkU8bcNvifnyAodtkkSNOFALcUeaqHbsCmu3tdw8wVjKV8seaPVmig2fYNSn6C
	 2M6yQcWpC3uCJrxYhdNJVVLD2Q9IubAzGQafk4T0uBAJvu8mYUxQzfKrMVzKU50db9
	 DbkRhZXNAkNjQ==
Date: Mon, 26 Aug 2024 10:40:09 -0500
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
Subject: Re: [PATCH v3 2/9] of: property: add
 of_graph_get_next_port_endpoint()
Message-ID: <20240826154009.GA300981-robh@kernel.org>
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
 <87a5h0qa0g.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5h0qa0g.wl-kuninori.morimoto.gx@renesas.com>

On Mon, Aug 26, 2024 at 02:43:28AM +0000, Kuninori Morimoto wrote:
> We already have of_graph_get_next_endpoint(), but it is not
> intuitive to use in some case.

Can of_graph_get_next_endpoint() users be replaced with your new 
helpers? I'd really like to get rid of the 3 remaining users.

> 
> (X)	node {
> (Y)		ports {
> (P0)			port@0 { endpoint { remote-endpoint = ...; };};
> (P10)			port@1 { endpoint { remote-endpoint = ...; };
> (P11)				 endpoint { remote-endpoint = ...; };};
> (P2)			port@2 { endpoint { remote-endpoint = ...; };};
> 		};
> 	};
> 
> For example, if I want to handle port@1's 2 endpoints (= P10, P11),
> I want to use like below
> 
> 	P10 = of_graph_get_next_endpoint(port1, NULL);
> 	P11 = of_graph_get_next_endpoint(port1, P10);
> 
> But 1st one will be error, because of_graph_get_next_endpoint()
> requested "parent" means "node" (X) or "ports" (Y), not "port".
> Below works, but it will get P0
> 
> 	/* These will be node/ports/port@0/endpoint */
> 	P0 = of_graph_get_next_endpoint(node,  NULL);
> 	P0 = of_graph_get_next_endpoint(ports, NULL);
> 
> In other words, we can't handle P10/P11 directly via
> of_graph_get_next_endpoint() so far.
> 
> There is another non intuitive behavior on of_graph_get_next_endpoint().
> In case of if I could get P10 pointer for some way, and if I want to
> handle port@1 things, I would like use it like below
> 
> 	/*
> 	 * "ep" is now P10, and handle port1 things here,
> 	 * but we don't know how many endpoints port1 has.
> 	 *
> 	 * Because "ep" is non NULL now, we can use port1
> 	 * as of_graph_get_next_endpoint(port1, xxx)
> 	 */
> 	do {
> 		/* do something for port1 specific things here */
> 	} while (ep = of_graph_get_next_endpoint(port1, ep))
> 
> But it also not worked as I expected.
> I expect it will be P10 -> P11 -> NULL,
> but      it will be P10 -> P11 -> P2,    because
> of_graph_get_next_endpoint() will fetch "endpoint" beyond the "port".
> 
> It is not useful on generic driver.
> It uses of_get_next_child() instead for now, but it is not intuitive.
> And it doesn't check node name (= "endpoint").
> 
> To handle endpoint more intuitive, create of_graph_get_next_port_endpoint()
> 
> 	of_graph_get_next_port_endpoint(port1, NULL); // P10
> 	of_graph_get_next_port_endpoint(port1, P10);  // P11
> 	of_graph_get_next_port_endpoint(port1, P11);  // NULL
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/of/property.c    | 22 ++++++++++++++++++++++
>  include/linux/of_graph.h | 20 ++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index aec6ac9f70064..90820e43bc973 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -719,6 +719,28 @@ struct device_node *of_graph_get_next_port(struct device_node *parent,
>  }
>  EXPORT_SYMBOL(of_graph_get_next_port);
>  
> +/**
> + * of_graph_get_next_port_endpoint() - get next endpoint node in port.
> + * If it reached to end of the port, it will return NULL.
> + * @port: pointer to the target port node
> + * @prev: previous endpoint node, or NULL to get first
> + *
> + * Return: An 'endpoint' node pointer with refcount incremented. Refcount
> + * of the passed @prev node is decremented.
> + */
> +struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
> +						    struct device_node *prev)
> +{
> +	do {
> +		prev = of_get_next_child(port, prev);
> +		if (!prev)
> +			break;
> +	} while (!of_node_name_eq(prev, "endpoint"));

Really, this check is validation as no other name is valid in a 
port node. The kernel is not responsible for validation, but okay. 
However, if we are going to keep this, might as well make it WARN().

> +
> +	return prev;
> +}
> +EXPORT_SYMBOL(of_graph_get_next_port_endpoint);
> +
>  /**
>   * of_graph_get_next_endpoint() - get next endpoint node
>   * @parent: pointer to the parent device node
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index a6b91577700a8..967ee14a1ff37 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -59,6 +59,17 @@ struct of_endpoint {
>  	for (child = of_graph_get_next_port(parent, NULL); child != NULL; \
>  	     child = of_graph_get_next_port(parent, child))
>  
> +/**
> + * for_each_of_graph_port_endpoint - iterate over every endpoint in a port node
> + * @parent: parent port node
> + * @child: loop variable pointing to the current endpoint node
> + *
> + * When breaking out of the loop, of_node_put(child) has to be called manually.

No need for this requirement anymore. Use cleanup.h so this is 
automatic.

> + */
> +#define for_each_of_graph_port_endpoint(parent, child)			\
> +		for (child = of_graph_get_next_port_endpoint(parent, NULL); child != NULL; \
> +		     child = of_graph_get_next_port_endpoint(parent, child))
> +
>  #ifdef CONFIG_OF
>  bool of_graph_is_present(const struct device_node *node);
>  int of_graph_parse_endpoint(const struct device_node *node,
> @@ -72,6 +83,8 @@ struct device_node *of_graph_get_next_ports(struct device_node *parent,
>  					    struct device_node *ports);
>  struct device_node *of_graph_get_next_port(struct device_node *parent,
>  					   struct device_node *port);
> +struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
> +						    struct device_node *prev);
>  struct device_node *of_graph_get_endpoint_by_regs(
>  		const struct device_node *parent, int port_reg, int reg);
>  struct device_node *of_graph_get_remote_endpoint(
> @@ -132,6 +145,13 @@ static inline struct device_node *of_graph_get_next_port(
>  	return NULL;
>  }
>  
> +static inline struct device_node *of_graph_get_next_port_endpoint(
> +					const struct device_node *parent,
> +					struct device_node *previous)
> +{
> +	return NULL;
> +}
> +
>  static inline struct device_node *of_graph_get_endpoint_by_regs(
>  		const struct device_node *parent, int port_reg, int reg)
>  {
> -- 
> 2.43.0
> 

