Return-Path: <linux-omap+bounces-1901-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E8194E26A
	for <lists+linux-omap@lfdr.de>; Sun, 11 Aug 2024 19:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA34AB20EE6
	for <lists+linux-omap@lfdr.de>; Sun, 11 Aug 2024 17:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53611547F5;
	Sun, 11 Aug 2024 17:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vTB7zFwg"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B33200CB;
	Sun, 11 Aug 2024 17:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723396390; cv=none; b=psjaaYNIgIQcFI5UskgQHiPnv8e+Lk2Pa+jt/+kdj8Y2rDOUqHRp38vI3/lm6aaDt8eMFyzlJtjyDUmVa1FHutmWVM9IocQ7Y6UnuS7sVtLDUGbzKr9zLsINzwJiIJvsbu7kwINUCbwF66pc/k0njEmwlBic9mI6MGHFGX/unHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723396390; c=relaxed/simple;
	bh=+aZawo+zbB9UW0l4nI0hEBDnJJlZYwKtU3xpBFzC+vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwOcXcNqjjODbKNXLWqtoPylCesP/4PfBkv3B6soJh1z0uVowEULZm8jzuD4M3bc3Fc5Tz3ygqVY6JCbDdd/4BZkBgvSewUDfAWiaL22uGDQupwan1K95uQiXJADbAE0xUQN7kCyP7l3x5FknbCZJE58LW4If+UwzfSy912eYGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vTB7zFwg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE39545A;
	Sun, 11 Aug 2024 19:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723395765;
	bh=+aZawo+zbB9UW0l4nI0hEBDnJJlZYwKtU3xpBFzC+vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vTB7zFwgJvi8Urijb4zBWai/np9fTsS9pi/uBkxCg1kcdXLAAagKy/2gkO+p2zIe5
	 Sbatm5V+DVF471H7m5s/Dazapte9WYqwldt0n3xPVMO3fpvMcGyTrDZpQnGquRVeTR
	 3Gl4IWPCFBzsEnp46GWzJoG0O4ebP93i2lHgwfzc=
Date: Sun, 11 Aug 2024 20:03:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 1/9] of: property: add of_graph_get_next_port()
Message-ID: <20240811170316.GL2270@pendragon.ideasonboard.com>
References: <875xsa8gws.wl-kuninori.morimoto.gx@renesas.com>
 <874j7u8gw2.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874j7u8gw2.wl-kuninori.morimoto.gx@renesas.com>

Hi Morimoto-san,

(CC'ing Sakari)

Thank you for the patch.

On Fri, Aug 09, 2024 at 04:22:22AM +0000, Kuninori Morimoto wrote:
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
> But, it is very difficult to handle each "port" via
> for_each_of_graph_device_endpoint(). Getting "port" by using
> of_get_parent() from "endpoint" doesn't work. see below.
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
> In the same time, same reason, we want to handle "ports" same as "port".
> 
> 	node {
> =>		ports@0 {
> 			port@0 {
> 				endpoint@0 {...};
> 				endpoint@1 {...};
> 				...
> 			};
> 			port@1 {
> 				endpoint@0 {...};
> 				endpoint@1 {...};
> 				...
> 			};
> 			...
> 		};
> =>		ports@1 {
> 			...
> 		};
> 	};
> 
> Add "ports" / "port" base functions.
> For above case, we can use
> 
> 	for_each_of_graph_ports(node, ports) {
> 		for_each_of_graph_port(ports, port) {
> 			...
> 		}
> 	}
> 
> This loop works in case of "node" doesn't have "ports" also.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/of/property.c    | 88 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/of_graph.h | 46 +++++++++++++++++++++
>  2 files changed, 134 insertions(+)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 164d77cb9445..e4d5dfe70104 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -625,6 +625,76 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
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
> +		prev = of_get_child_by_name(parent, "ports");
> +
> +		/* use parent as its ports of this device if it not exist */
> +		if (!prev)
> +			prev = of_node_get(parent);
> +
> +		return prev;
> +	}
> +
> +	do {
> +		prev = of_get_next_child(parent, prev);
> +		if (!prev)
> +			break;
> +	} while (!of_node_name_eq(prev, "ports"));
> +
> +	return prev;
> +}
> +EXPORT_SYMBOL(of_graph_get_next_ports);

Having multiple "ports" nodes in a device node is not something I've
ever seen before. There may be use cases, but how widespread are they ?
I would prefer handling this in driver code instead of creating a helper
function if the use case is rare.

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

This also makes me quite uncomfortable. Iterating over all ports of a
device node that contains multiple "ports" children seems an ill-defined
use case.

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
> +
>  /**
>   * of_graph_get_next_endpoint() - get next endpoint node
>   * @parent: pointer to the parent device node
> @@ -823,6 +893,24 @@ unsigned int of_graph_get_endpoint_count(const struct device_node *np)
>  }
>  EXPORT_SYMBOL(of_graph_get_endpoint_count);
>  
> +/**
> + * of_graph_get_port_count() - get the number of port in a device node
> + * @np: pointer to the parent device node
> + *
> + * Return: count of port of this device node
> + */
> +unsigned int of_graph_get_port_count(struct device_node *np)
> +{
> +	struct device_node *port = NULL;
> +	int num = 0;

As the counter can never be negative, you can make this an unsigned int.

> +
> +	for_each_of_graph_port(np, port)
> +		num++;
> +
> +	return num;
> +}
> +EXPORT_SYMBOL(of_graph_get_port_count);
> +
>  /**
>   * of_graph_get_remote_node() - get remote parent device_node for given port/endpoint
>   * @node: pointer to parent device_node containing graph port/endpoint
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index a4bea62bfa29..a6b91577700a 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -37,14 +37,41 @@ struct of_endpoint {
>  	for (child = of_graph_get_next_endpoint(parent, NULL); child != NULL; \
>  	     child = of_graph_get_next_endpoint(parent, child))
>  
> +/**
> + * for_each_of_graph_ports - iterate over every ports in a device node
> + * @parent: parent device node containing ports
> + * @child: loop variable pointing to the current ports node
> + *
> + * When breaking out of the loop, of_node_put(child) has to be called manually.
> + */
> +#define for_each_of_graph_ports(parent, child)				\
> +	for (child = of_graph_get_next_ports(parent, NULL); child != NULL; \
> +	     child = of_graph_get_next_ports(parent, child))
> +
> +/**
> + * for_each_of_graph_port - iterate over every port in a device or ports node
> + * @parent: parent device or ports node containing port
> + * @child: loop variable pointing to the current port node
> + *
> + * When breaking out of the loop, of_node_put(child) has to be called manually.
> + */
> +#define for_each_of_graph_port(parent, child)			\
> +	for (child = of_graph_get_next_port(parent, NULL); child != NULL; \
> +	     child = of_graph_get_next_port(parent, child))

I think I've proposed something similar a looooong time ago, and was
told that iterating over ports is not something that drivers should do.
The situation may have changed since though.

Sakari, any opinion on this ?

> +
>  #ifdef CONFIG_OF
>  bool of_graph_is_present(const struct device_node *node);
>  int of_graph_parse_endpoint(const struct device_node *node,
>  				struct of_endpoint *endpoint);
>  unsigned int of_graph_get_endpoint_count(const struct device_node *np);
> +unsigned int of_graph_get_port_count(struct device_node *np);
>  struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
>  struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>  					struct device_node *previous);
> +struct device_node *of_graph_get_next_ports(struct device_node *parent,
> +					    struct device_node *ports);
> +struct device_node *of_graph_get_next_port(struct device_node *parent,
> +					   struct device_node *port);
>  struct device_node *of_graph_get_endpoint_by_regs(
>  		const struct device_node *parent, int port_reg, int reg);
>  struct device_node *of_graph_get_remote_endpoint(
> @@ -73,6 +100,11 @@ static inline unsigned int of_graph_get_endpoint_count(const struct device_node
>  	return 0;
>  }
>  
> +static inline unsigned int of_graph_get_port_count(struct device_node *np)
> +{
> +	return 0;
> +}
> +
>  static inline struct device_node *of_graph_get_port_by_id(
>  					struct device_node *node, u32 id)
>  {
> @@ -86,6 +118,20 @@ static inline struct device_node *of_graph_get_next_endpoint(
>  	return NULL;
>  }
>  
> +static inline struct device_node *of_graph_get_next_ports(
> +					struct device_node *parent,
> +					struct device_node *previous)
> +{
> +	return NULL;
> +}
> +
> +static inline struct device_node *of_graph_get_next_port(
> +					struct device_node *parent,
> +					struct device_node *previous)
> +{
> +	return NULL;
> +}
> +
>  static inline struct device_node *of_graph_get_endpoint_by_regs(
>  		const struct device_node *parent, int port_reg, int reg)
>  {

-- 
Regards,

Laurent Pinchart

