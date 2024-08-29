Return-Path: <linux-omap+bounces-2052-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF459964A4F
	for <lists+linux-omap@lfdr.de>; Thu, 29 Aug 2024 17:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54346B22111
	for <lists+linux-omap@lfdr.de>; Thu, 29 Aug 2024 15:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9564D1B3737;
	Thu, 29 Aug 2024 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pb6gtWIT"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F4B1A255C;
	Thu, 29 Aug 2024 15:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724946065; cv=none; b=Q3a7XvQD7G+jwZdmUDlXdkeByMdMSmlSLg0G7A2V1ZOxxU2qYHwvl7qGY3GB8L47KGgX39pE21SNkRBDCxQM+hZfqfPhxIHFME67FVGEnIUqK7hwv0obEGHhRKPtIOGDA6bcKuOb6xH/ls1r1LCjKpZceMv/0tHnhOy1qSO5DxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724946065; c=relaxed/simple;
	bh=/zGGPt8jYtuq/1RE9arY1RA1H+rfW2qjhyrvYnQ62ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrfKPslHzUoEwUIKVZ4X6064PaFa/UgMpPxgOqEdB9H+5n5nr3hDmZMu4qtpTLLxMXZgSHbePx68pspePszkKaB8o4zNVPlD2Tqx4adAC/a/cvDGn23u5318R4oVB2+yVnbE1kUb0+U7LpgYpzhgCSPazFZlHSnS7I6cNTKCPnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pb6gtWIT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519BEC4CEC1;
	Thu, 29 Aug 2024 15:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724946064;
	bh=/zGGPt8jYtuq/1RE9arY1RA1H+rfW2qjhyrvYnQ62ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pb6gtWIT0umdrydivzW3q3x+x8RffD3d4f4N9Pxo5JhkzOL8GdkTxGt2RfEsuuGSi
	 gE3mHFkn/f7T7k6uL9vo3yI2u6IHdmN0Djc2HAjxOkgRhb/8WyNcUIEoyUisdKE1Br
	 ghCEROt32J4MuG/nNAVHOMqq3lqSY6cFNaK47i8HiZDVeuY57YEG3cLwyCD1P5xOzQ
	 G+KkCjkmLXNb6kanoNJHrT/6bKRODeYUrHYs+tIdkaIx9Z1/kXB9zOZuQXC20gd4+x
	 T3IjAROTorQiGQtwEgGY9ag1AaUpM/U1aUQi70qibxS+PnWbwFTyMHZsQvuRrIJvO7
	 nKj26aueNEWLQ==
Date: Thu, 29 Aug 2024 10:41:02 -0500
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
Subject: Re: [PATCH v4 4/9] ASoC: rcar_snd: use new of_graph functions
Message-ID: <20240829154102.GB465065-robh@kernel.org>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
 <875xrl2pur.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875xrl2pur.wl-kuninori.morimoto.gx@renesas.com>

On Wed, Aug 28, 2024 at 05:11:56AM +0000, Kuninori Morimoto wrote:
> Now we can use new port related functions for port parsing. Use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/sh/rcar/core.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
> index 15cb5e7008f9f..281936ece760b 100644
> --- a/sound/soc/sh/rcar/core.c
> +++ b/sound/soc/sh/rcar/core.c
> @@ -1237,7 +1237,7 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
>  {
>  	struct device *dev = rsnd_priv_to_dev(priv);
>  	struct device_node *np = dev->of_node;
> -	struct device_node *ports, *node;
> +	struct device_node *node;
>  	int nr = 0;
>  	int i = 0;
>  
> @@ -1277,16 +1277,12 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
>  	/*
>  	 * Audio-Graph-Card
>  	 */
> -	for_each_child_of_node(np, ports) {
> -		if (!of_node_name_eq(ports, "ports") &&
> -		    !of_node_name_eq(ports, "port"))
> -			continue;
> -		priv->component_dais[i] = of_graph_get_endpoint_count(ports);
> +	for_each_of_graph_ports(np, ports) {
> +		priv->component_dais[i] = of_graph_get_port_count(ports);

These are not equivalent. Besides now working with multiple 'ports' 
nodes, it's possible to have a port node without an endpoint populated 
for example.

Rob

