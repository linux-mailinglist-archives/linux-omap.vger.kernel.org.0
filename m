Return-Path: <linux-omap+bounces-493-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4585584A006
	for <lists+linux-omap@lfdr.de>; Mon,  5 Feb 2024 17:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A8DF1C21EAD
	for <lists+linux-omap@lfdr.de>; Mon,  5 Feb 2024 16:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698A941773;
	Mon,  5 Feb 2024 16:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4NzN+xx"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C865D3FE54;
	Mon,  5 Feb 2024 16:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707152122; cv=none; b=nIMEgsST0yfmnalMi2G0NQCrAdkqN1UyigsmawSr9F331/XItNXtgIvzNIfeK6CxPW4seSVRnb9EWKL0bvDw/+SxiT5vQrEMbN+B2oAl/V1kbXLlNPQ1K3hoLpaGxaD2WTf8tyYVRdCiLnaoPF3v/5Yv0WS+D3yjAf+NB00CaCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707152122; c=relaxed/simple;
	bh=sVWDGae8We/GTqGu3KZXsI4ao8GOXiioemxExEsLxqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhhDLcpWtO+goVeU9SsbuIwSaKsrpYvvA8BswlZSaf5Nqb/gGJh7O4ky9lutcZYsaeJsLhY7NtaiyDVnrY4jKFBs4YSNnTk+mN1h1z3G+StxvG43zgHmFb8ViC3yxSE9XhyxA0LMIX6u/p3Mrj6n2PpMi7sLsUCTjp170VDg9i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4NzN+xx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFCAC433B1;
	Mon,  5 Feb 2024 16:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707152121;
	bh=sVWDGae8We/GTqGu3KZXsI4ao8GOXiioemxExEsLxqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4NzN+xxV2kwpgpmvzwCZPjJxe0p8svapOJGajeWjpEEriWr006tLpAtpBBcG14NI
	 l7fHkZZTCCS2aZun+9xT18fkoZ/FMtKy9LlDCrv1uFwhHjeK2n19B4nBN7o649VSjD
	 kYGKpO0o3BwY+Ahh0TeOWYCXz8+otRo3yXnErLJRN29uNdXJLWcsE4UEYU9xBrYL0Y
	 5EBIyjafRZpDVbbOWCUrKL9UVViaDMskAXZEUX2zUclSY3mEzo3VIqcDhKNa3FKHrK
	 rehOGq4a9IDtDYOiom3YhLrNbFEjmM7KUgyXugv+FwASEWfoMD6zmOeVRIwz7AMYR2
	 3iJTbqU63Gc+A==
Date: Mon, 5 Feb 2024 16:55:17 +0000
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	"Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
	=?iso-8859-1?Q?=22Niklas_S=C3=B6derlund=22?= <niklas.soderlund+renesas@ragnatech.se>,
	=?iso-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?= <u.kleine-koenig@pengutronix.de>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Andy Gross <agross@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Emma Anholt <emma@anholt.net>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Helge Deller <deller@gmx.de>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Jacopo Mondi <jacopo@jmondi.org>, James Clark <james.clark@arm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Liu Ying <victor.liu@nxp.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Rob Clark <robdclark@gmail.com>, Robert Foss <rfoss@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Saravana Kannan <saravanak@google.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Stefan Agner <stefan@agner.ch>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tim Harvey <tharvey@gateworks.com>,
	Todor Tomov <todor.too@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Jonas Karlman <jonas@kwiboo.se>, Leo Yan <leo.yan@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mike Leach <mike.leach@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
	Sean Paul <sean@poorly.run>, Tom Rix <trix@redhat.com>,
	coresight@lists.linaro.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 05/24] media: i2c: switch to use
 of_graph_get_next_device_endpoint()
Message-ID: <20240205165517.GA3486840-robh@kernel.org>
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
 <87h6iu6qjs.wl-kuninori.morimoto.gx@renesas.com>
 <20240202174941.GA310089-robh@kernel.org>
 <875xz3n6ag.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875xz3n6ag.wl-kuninori.morimoto.gx@renesas.com>

On Sun, Feb 04, 2024 at 11:44:39PM +0000, Kuninori Morimoto wrote:
> 
> Hi Rob
> 
> > This is assuming there's just 1 port and 1 endpoint, but let's be 
> > specific as the bindings are (first endpoint on port 0):
> > 
> > of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
> > 
> > Note we could ask for endpoint 0 here, but the bindings generally allow 
> > for more than 1.
> > 
> > I imagine most of the other cases here are the same.
> 
> I will do it on new patch-set
> 
> > > -	for_each_endpoint_of_node(state->dev->of_node, ep_np) {
> > > +	for_each_device_endpoint_of_node(state->dev->of_node, ep_np) {
> > 
> > I would skip the rename.
> 
> It is needed to avoid confuse, because new function will add
> another endpoint loop.
> 
> see
> https://lore.kernel.org/r/20240131100701.754a95ee@booty

I've read the threads already and think you should skip the rename. Just 
put 'port' in the name of the new one. That and taking a port number 
param should be enough distinction.

Rob

