Return-Path: <linux-omap+bounces-471-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3A7843A83
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jan 2024 10:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0863AB29108
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jan 2024 09:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBEC69D3D;
	Wed, 31 Jan 2024 09:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IpopKANJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0116997E;
	Wed, 31 Jan 2024 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706692043; cv=none; b=Bfd3e4ROgbXAeGpGMkCUTlVSnoLzyMYq6/oNEdHVynhm/aQ22mR8jj7TQ/nJKaDrYt4a3mUFhY1LDi2PdT83qCZXsTPVQn4AD5103HC0z6ZyNoB3Qwqjwa7DL7cIzkUPZTCwdTk91X1CrutWq5GsYyCXLD662rnjmwMqr4e6TTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706692043; c=relaxed/simple;
	bh=0RuTS+kPwr4+e0G8exQO+9NVYj16oJYi6dt0lNc9JzM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lt2/W2fGTFX4rWxp5SEcFLDNBFyoSyNCPObPJELlg4lpTvFLgSVm0JGnEzjWxKcXvXSFQj1RTwzVAg+kReuxk1gTiGSklwHol3P6bUiaQRAeITqDWYP4GHF2hD838FPiyAHh+6m7n6z9yHxWaNQsx7BfZ0ywFNiHtQknr7BzUOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IpopKANJ; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94A901C0003;
	Wed, 31 Jan 2024 09:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706692038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=txVeyDCwCa0PTblW/GH4Mt4FMs2okstRsQIFGpgZpIA=;
	b=IpopKANJvPwzP+cqcm/nV8tIJeOl95Z+pm5ZBFxwXGnXRcK3j8Pw+g5PpTHYdFLZ+S68Mp
	Zsj2PczR2iFjVt4JmxgdVtBXXEmZpd6iYEY+KPRCxNu2fQPiuG18FsmsoFfZfWkaW1KPbB
	G1MSsTLhcCIWapF7QsFR2x2AIjii8HyIxhHt1myJcrQtSSLsH8641MOW1xBoMgS5kgngcd
	HpasEnyJS3TgeESvACXjoa9KiuEvYQs3iCmPPe7m0RCMy1Q343Sq2P0VW3xur3FbmOGHKH
	v498LDl6jvgqLJTyZWKLJSC9wenFYUOzH2yWAnMS8h04WN1KqPaw/M4Qidd9Fw==
Date: Wed, 31 Jan 2024 10:07:01 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Lad,  Prabhakar"
 <prabhakar.csengg@gmail.com>, "Niklas =?UTF-8?Q?S=C3=83=C2=B6derlund?="
 <niklas.soderlund+renesas@ragnatech.se>, "Uwe =?UTF-8?Q?Kleine-K=C3=83?=
 =?UTF-8?Q?=C2=B6nig?=" <u.kleine-koenig@pengutronix.de>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Alexander Stein
 <alexander.stein@ew.tq-group.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Andy Gross <agross@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, Bjorn Andersson
 <andersson@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel
 Vetter <daniel@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Emma Anholt <emma@anholt.net>, Eugen Hristev <eugen.hristev@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Frank Rowand
 <frowand.list@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Helge Deller <deller@gmx.de>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, Jacopo Mondi
 <jacopo+renesas@jmondi.org>, Jacopo Mondi <jacopo@jmondi.org>, James Clark
 <james.clark@arm.com>, Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter
 <jonathanh@nvidia.com>, Kevin Hilman <khilman@baylibre.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Liu Ying <victor.liu@nxp.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Marek Vasut <marex@denx.de>, Mark
 Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>, Michal
 Simek <michal.simek@amd.com>, Miguel Ojeda <ojeda@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Rob Clark <robdclark@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Saravana Kannan <saravanak@google.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sowjanya
 Komatineni <skomatineni@nvidia.com>, Stefan Agner <stefan@agner.ch>, Suzuki
 K Poulose <suzuki.poulose@arm.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding
 <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tim
 Harvey <tharvey@gateworks.com>, Todor Tomov <todor.too@gmail.com>, Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Alim Akhtar <alim.akhtar@samsung.com>, Fabio
 Estevam <festevam@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Jonas
 Karlman <jonas@kwiboo.se>, Leo Yan <leo.yan@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Mike Leach <mike.leach@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>, Tom Rix
 <trix@redhat.com>, coresight@lists.linaro.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 14/24] of: property: add of_graph_get_next_endpoint()
Message-ID: <20240131100701.754a95ee@booty>
In-Reply-To: <874jeu6qhv.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
	<874jeu6qhv.wl-kuninori.morimoto.gx@renesas.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Kuninori Morimoto,

On Wed, 31 Jan 2024 05:06:36 +0000
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> To handle endpoint more intuitive, create of_graph_get_next_endpoint()
> 
> 	of_graph_get_next_endpoint(port1, NULL); // A1
> 	of_graph_get_next_endpoint(port1, A1);   // A2
> 	of_graph_get_next_endpoint(port1, A2);   // NULL

The idea looks good. My only concern is about reusing the
of_graph_get_next_endpoint() name after having removed the old, different
function having the same name. This can be confusing in the first
place to who is used to the old function, and also to anybody rebasing
their patches on top of a new kernel to find their code behaving
differently.

Also, as now we'd have two similar variants of this function, it would
be good if each of them were having a name that clearly identifies in
which way they differ from the other.

So a better name for this function would probably be
of_graph_get_next_port_endpoint() I guess, to clearly differentiate from
of_graph_get_next_device_endpoint().

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

