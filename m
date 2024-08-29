Return-Path: <linux-omap+bounces-2050-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0050D964933
	for <lists+linux-omap@lfdr.de>; Thu, 29 Aug 2024 16:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9A181F23108
	for <lists+linux-omap@lfdr.de>; Thu, 29 Aug 2024 14:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B83B1B29BC;
	Thu, 29 Aug 2024 14:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/hg1oCh"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F1B1B151B;
	Thu, 29 Aug 2024 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943276; cv=none; b=LkBSU0ALh92+l2yNGdHCfCrIXaCX5xcOZpB99v7NOWSmWtPU7Z/QjQeUF5uNHAly5PoD1JPpdS60PT1wIUIIi3ZoYHunLma9hEF7lRbOCxjsQZNAJ0zGphfWJJIoyQXHa/Scsqyn3rflL5sjg8wJmimzbFxSq2zUiYiE+B9ZZW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943276; c=relaxed/simple;
	bh=94sqycuEg7LZE3IfoAS/UYJHpdhV1CbtJdmFG3iWS1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=II4rYzkPnCx8HXlGMKBBimi7h/9hsjUmIUORsBwuIa+PRgLfiQbDdSofqbuzIor4zHfuHH7Gz0N6aHE3kPEcNpGsuBtl9ygWOEPlVuR7crWeBQhJCm2PtiW0as3IbP+V25hgLAURIC796hY60QxcNpTPNTe2ucP3onJ6IMnhYj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/hg1oCh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB876C4CEC3;
	Thu, 29 Aug 2024 14:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724943276;
	bh=94sqycuEg7LZE3IfoAS/UYJHpdhV1CbtJdmFG3iWS1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y/hg1oCh+Ij6W4jgfibIcNLBH2y6qwXWngwcUcGr4b3eYryJduYRVobwRt6oxc42R
	 H6f1zYxHYCrS7niInBO5J0AjCy8ecFWqNseOf/cmogScebBhrEna8OTyktEs8yEjrJ
	 175Q0V6vAr2G+DQqxPtZGIdZNe+qIREnbKSj8qwgAhz5FNxTFMhz5yEsTHAxdoLS3i
	 hI3xZDeYhtA/QPLEtmCboawwvUP6HlSbtj5geHqzV/za/0DVs4yDF5mOzTCBINi1xj
	 x4gwu3HxpENBZpP5e0AkTwn4UUpF/Eb8me1jX0fvP6HHtr585Fv4o2jsG3R7yMmQpr
	 Zda3hB26yi+pQ==
Date: Thu, 29 Aug 2024 09:54:34 -0500
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
Subject: Re: [PATCH v4 9/9] media: xilinx-tpg: use new of_graph functions
Message-ID: <20240829145434.GA465065-robh@kernel.org>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
 <87y14h1b9f.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y14h1b9f.wl-kuninori.morimoto.gx@renesas.com>

On Wed, Aug 28, 2024 at 05:12:28AM +0000, Kuninori Morimoto wrote:
> Now we can use new port related functions for port parsing. Use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/xilinx/xilinx-tpg.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
> index e05e528ffc6f7..a25f216b2513c 100644
> --- a/drivers/media/platform/xilinx/xilinx-tpg.c
> +++ b/drivers/media/platform/xilinx/xilinx-tpg.c
> @@ -13,6 +13,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/xilinx-v4l2-controls.h>
>  
> @@ -744,7 +745,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
>  		}
>  

This function is looping over port nodes, why don't you make it use 
for_each_of_graph_port()?

>  		if (nports == 0) {
> -			endpoint = of_get_next_child(port, NULL);
> +			endpoint = of_graph_get_next_port_endpoint(port, NULL);
>  			if (endpoint)
>  				has_endpoint = true;
>  			of_node_put(endpoint);
> -- 
> 2.43.0
> 

