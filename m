Return-Path: <linux-omap+bounces-2012-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 907B795E826
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2024 07:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C5B2281554
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2024 05:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0512980043;
	Mon, 26 Aug 2024 05:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3UIcaK2"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811FE7DA95;
	Mon, 26 Aug 2024 05:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724651874; cv=none; b=nnRKbmbLfZDQ3D0JnRiOYjvUVhwWi44MlqnrR9uSi9gCXfsNHgUIoUwimqbRtws0iXb/AlW4uLs7iUnOFN5k/JD5Ky/KsLkkFzbEFBo4JOv0u/HKSPUX4M3CpfnXit1hPzo7ReoNbtmHynFO/R5eWdlCzn7oHFHXfOXBM9JZLWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724651874; c=relaxed/simple;
	bh=wyRlaGNpg7WUxry9pFdgw984ZNawvpL6nElCg7i5/OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YeHjwW0ZZ5eQn3nb84KUJwgnnWmlpdziQYAHbHt+GQ7xztSAdHzM+dX14Pu6RwZe/gF5HA3FYjCSppnu0dcDcmuuCJVA6MEBg8z/uA4d2Szz/4nNa9TMqpdKFwSR52ReyG/Uy6z9bjCknW7hrwfGSFSfmuxS4Ia8HhVfOFm0cvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3UIcaK2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EDFC4AF11;
	Mon, 26 Aug 2024 05:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724651874;
	bh=wyRlaGNpg7WUxry9pFdgw984ZNawvpL6nElCg7i5/OM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3UIcaK2jh/Zk1IFnUTnAXv5IMQBJ7tyIjK3F62xYaY5k6gK+aN3yXUl2WRH28kF6
	 3/gLudS9ZU4R/uCMw7Vsz9U2PZUMZ5CtUzp/z9O77SmlzDhcA/qpJUhIrbaKVK5/Pe
	 hWksA2nN3Mwd1HSK3/zVHu4Xtk4TOeKY1ahEnxcvWHdw6kv7bBMV6PAhksrtr9pEBu
	 jSgiBIArl1+OFjk7G1MCeOCNYu1LcQw3mXxsgu9sJBtGGgPIAsOJbGmiaZo2aYs588
	 ajb2ma9kiZ2dNcoI+VNhn5gKgeHy668dpSjCAaV0cLCUs7Re5Sk3tWr00gRhfGAKVu
	 YU7NHRHGLZZ5A==
Date: Mon, 26 Aug 2024 07:57:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 1/9] of: property: add of_graph_get_next_port()
Message-ID: <rlfczbgxjhnqeqskbg7q7rsvhyzznbqdjbtajl44pokpsdtdzx@ecirg7ytm6az>
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
 <87bk1gqa0k.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87bk1gqa0k.wl-kuninori.morimoto.gx@renesas.com>

On Mon, Aug 26, 2024 at 02:43:23AM +0000, Kuninori Morimoto wrote:
> We have endpoint base functions
> 	- of_graph_get_next_device_endpoint()
> 	- of_graph_get_device_endpoint_count()
> 	- for_each_of_graph_device_endpoint()

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
> +			prev = of_node_get(parent);
> +
> +			/* check wether it has port node */
> +			struct device_node *port __free(device_node) =
> +				of_get_child_by_name(prev, "port");
> +
> +			if (!port)
> +				prev = NULL;

It looks like you leak here "prev".

> +		}
> +
> +		return prev;
> +	}

Best regards,
Krzysztof


