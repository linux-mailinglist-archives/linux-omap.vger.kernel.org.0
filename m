Return-Path: <linux-omap+bounces-2346-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD7799514D
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 16:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27B931C23E63
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 14:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2140B1DFD98;
	Tue,  8 Oct 2024 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEtIdfI7"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EAE1DF96B;
	Tue,  8 Oct 2024 14:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728397115; cv=none; b=f6o5b/A+Kpkvl/AtYhiWFq/lvK8eiU2bYcSA/u90+Z/1En7JRIGAzIYMtAr5UZsm3idC70bA710WzcQhzIvTJvF9lbkLD/OGHnlkUBdQlFqlF2Wt8kGd90FRcTaF9EderoF2vc8io1A81i46Ek09fmbwrU91eofTOVAIzsZM0h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728397115; c=relaxed/simple;
	bh=hKT3uBzYhOP99Yta4PjZvjRY3LiXCkom9Bm+7Of9+gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEifIWUAUHC/fRqL1ufrGt/+cBnMkVuuxDxeqz/zzc8WvXO91x6epIHFbgoc6zjeYWxaPtamJ2P1KeEw7wn4LgxktW5EpCBS5au8+3WGHzkqMbKiLxM70U62nZgyimSvtP7m+6ppd2ResAZ/ZKJ9awhfI7CIb9XN/EFJufPr2LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEtIdfI7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F90C4CEC7;
	Tue,  8 Oct 2024 14:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728397115;
	bh=hKT3uBzYhOP99Yta4PjZvjRY3LiXCkom9Bm+7Of9+gI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mEtIdfI7JAqwO+FUf1BWd1bU1y9Sk2P/3tLe9klSmsW0GiR3kbwP/+4U9bbkeuAd3
	 20zEX1w/6yjKtYay5o3uOe85GcP/dH+NVfCpW768ADFq0ZgzLi3t+kq6BOowGrqAOw
	 BI875t7uwCXrZnfyQSSvBb/z7ANUoKkMLZnNXYylHa7kHpfX3W97m9jSAuL8KaMwip
	 ucZR2qizcc/rV/8uesKV4O7e7MH6ohIR+dd37r3REUSDazekYgBhRgvNdxYdDSw8vK
	 Ppet5P3dV/5Ula183x5vYrScCsi7/Nw6Yai8mQlughcajgZhqdI16bNCvBwx+6fZVC
	 IFpKVV/xQdcfA==
Date: Tue, 8 Oct 2024 09:18:34 -0500
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
Subject: Re: [PATCH v6 1/9] of: property: add of_graph_get_next_port()
Message-ID: <20241008141834.GA1254664-robh@kernel.org>
References: <877caz9tdw.wl-kuninori.morimoto.gx@renesas.com>
 <875xqj9tdf.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875xqj9tdf.wl-kuninori.morimoto.gx@renesas.com>

On Thu, Sep 26, 2024 at 12:00:12AM +0000, Kuninori Morimoto wrote:
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

As I said before. No where is this documented. We're not going to add 
common helpers for something undocumented and non-standard. Plus, this 
patch is doing a lot more than $subject says.

Rob

