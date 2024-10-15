Return-Path: <linux-omap+bounces-2424-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A69B599F1E7
	for <lists+linux-omap@lfdr.de>; Tue, 15 Oct 2024 17:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B7F128289A
	for <lists+linux-omap@lfdr.de>; Tue, 15 Oct 2024 15:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACEB1EABD2;
	Tue, 15 Oct 2024 15:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmB4dJ1E"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE3F170A19;
	Tue, 15 Oct 2024 15:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729007354; cv=none; b=mRyfExr9o1afBoSQOVxFkK9pLzDBx3sFsJrscq88zcpm5UHnKb1qmen2xgJ6I87vfcpPCAggkY/mTh0K6ECZotrwJ4FLT1L8003sIAdMMew2/GiK/83sGygKic+ni0KBjsgubM+eAXhw8LoFeVXA9siCsIJCgQwSvOz9GJnfRiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729007354; c=relaxed/simple;
	bh=8rs5FX8euimoaM+3TEF5t4bWzdqlREeZB9JxJ8XE8xM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myDG40b5hioxGETLKbqLuaENTioeC8eawigIGy8yrSenqzcT7VMIiWE0JJQGh2xRiQcZoCWrFpBnIjW7BKFWA0VpYdYxm06FhBeXF3Sm8TYUSUdjom+0J/mV/q+j1FXJuiD3q8m4hat141eLQ11Tcoxc0+oqzzBSnxAZbOCEeFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmB4dJ1E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2CEC4CEC6;
	Tue, 15 Oct 2024 15:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729007354;
	bh=8rs5FX8euimoaM+3TEF5t4bWzdqlREeZB9JxJ8XE8xM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmB4dJ1EdYGO/ZUli8Icg0bDOLS/0AUWPsg/90a/xeHWFCI7amjMB6XsK9a0MT3hj
	 p4lF7AKbO6OIIg6f1FbAfYokBk7rGOFWBopSlm4fwr3yCnCq87JzoShYWAF1vXDdn0
	 pYg5PVf4V0zXkIzdl6zQk0+o8lqu4ac7jI+qRzvV+MD/RyKl4UbyMWCgacoQubTBc5
	 2ARx5JvudAYmFhS3WJ/AzMLSRlbO7DQgpnSOucWZdeT6tZVbTgu9g4pEzhYuJy6Zz+
	 IsyCW49MFuG3635ZcmrN1AurDeoiGWu5A/PO3mvr5GPkm0h5+sKN49KNcBkcncETIQ
	 b11D/Z6vhhsxg==
Date: Tue, 15 Oct 2024 10:49:12 -0500
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
Subject: Re: [PATCH v7 0/9] of: property: add
 of_graph_get_next_port/port_endpoint()
Message-ID: <20241015154912.GA1152221-robh@kernel.org>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>

On Wed, Oct 09, 2024 at 01:44:30AM +0000, Kuninori Morimoto wrote:
> 
> Hi Rob, Saravana, Tomi, Laurent, Sakari, Mark
> 
> This is v7 patch-set
> 
> Current Of-graph has "endpoint base" for loop, but doesn't have
> "port base" loop. "endpoint base" loop only is not enough.
> This patch-set add new "port base" for loop, and use it.
> 
> v6 -> v7
> 	- based on latest linus/master branch
> 	- remove "ports" base functions
> 	- use "port" base function on "endpoint" function ([3/9])
> 	- tidyup [1/9] explanation
> 
> v5 -> v6
> 	- based on latest linus/master branch
> 	- [9/9]: fixed compile warrning
> 
> v4 -> v5
> 	- tidyup comments
> 	- [8/9]: parent NULL check was removed
> 	- [9/9]: use for_each_of_graph_port()
> 
> v3 -> v4
> 	- new for_each loop includes __free()
> 	 - comment indicates to use return_ptr() or no_free_ptr() if
> 	   it need to continue to use node
> 	 - each driver based on it
> 	- care "prev" leak on of_graph_get_next_ports()
> 	- of_graph_get_next_port_endpoint() indicates WARN() if port
> 	  has non-endpoint node
> 	- tidyup each git-log
> 
> v2 -> v3
> 	- return NULL if it it doesn't have ports / port
> 	- add visible comment on of_graph_get_next_ports()
> 
> v1 -> v2
> 	- add each Reviewed-by / Acked-by
> 	- tidyup/update Kernel Docs
> 	- use prev as parameter
> 	- update git-log explanation
> 	- remove extra changes
> 
> Kuninori Morimoto (9):
>   of: property: add of_graph_get_next_port()
>   of: property: add of_graph_get_next_port_endpoint()
>   of: property: use new of_graph functions
>   ASoC: test-component: use new of_graph functions
>   ASoC: audio-graph-card: use new of_graph functions
>   ASoC: audio-graph-card2: use new of_graph functions
>   gpu: drm: omapdrm: use new of_graph functions
>   fbdev: omapfb: use new of_graph functions
>   media: xilinx-tpg: use new of_graph functions

The DT parts look fine to me now. I see Mark acked this so he's not 
expecting to take it. I can take it, but need acks on the fbdev and 
media patches.

Rob

