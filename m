Return-Path: <linux-omap+bounces-481-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC8C8476E9
	for <lists+linux-omap@lfdr.de>; Fri,  2 Feb 2024 19:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94742285EE8
	for <lists+linux-omap@lfdr.de>; Fri,  2 Feb 2024 18:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B6A14C5B5;
	Fri,  2 Feb 2024 18:01:30 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F3314AD34;
	Fri,  2 Feb 2024 18:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706896890; cv=none; b=logxrat8pwAF1SZli5sHKNK9C7Lm4mBRVUjkxgg3MuI26ISwueUBJngfaaXIkYtw1X3QIHI3DZSxddkmRq6SwAwmEZec0n0rbE7kFynbHFtlcg43b/tKQ8IPxfd4Ju2/iFRf5y04UYKr8u+4RnEQydc+z/gwCVFbvup3RzRqnNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706896890; c=relaxed/simple;
	bh=nG1c1Dr5WvvpIPOp3w+4a7YAysmZsyzWk5n7RoQZn3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X1hA/hS3+2RzRZLpQY6fShoYf0qF5fCLvisNaPlKT/1En+fsNBGJtFgj4TGWUMEOf5uq1RQGzZcvakkb71gW1IrwnNjw2zljPGaIX1ZpPGgewGyVF9ydaZ8mXPrPwQGO5kPsbPdpKrdwfLk5c412eHGlufrU6EajFE2g++r986g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDE2D19F0;
	Fri,  2 Feb 2024 10:02:08 -0800 (PST)
Received: from [10.57.9.194] (unknown [10.57.9.194])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CBEC3F762;
	Fri,  2 Feb 2024 10:01:11 -0800 (PST)
Message-ID: <128e2760-6346-4c56-982b-42357a391ee4@arm.com>
Date: Fri, 2 Feb 2024 18:01:02 +0000
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/24] hwtracing: switch to use
 of_graph_get_next_device_endpoint()
Content-Language: en-GB
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 =?UTF-8?Q?Niklas_S=C3=83=C2=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=83=C2=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Andy Gross <agross@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, Bjorn Andersson
 <andersson@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Emma Anholt <emma@anholt.net>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Helge Deller <deller@gmx.de>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Jacopo Mondi <jacopo@jmondi.org>,
 James Clark <james.clark@arm.com>, Jaroslav Kysela <perex@perex.cz>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kevin Hilman <khilman@baylibre.com>,
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
 Michal Simek <michal.simek@amd.com>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Saravana Kannan <saravanak@google.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, Stefan Agner
 <stefan@agner.ch>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tim Harvey <tharvey@gateworks.com>,
 Todor Tomov <todor.too@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam
 <festevam@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Yan <leo.yan@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mike Leach <mike.leach@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>, Tom Rix <trix@redhat.com>,
 coresight@lists.linaro.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org, llvm@lists.linux.dev
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
 <87cyti6qj8.wl-kuninori.morimoto.gx@renesas.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <87cyti6qj8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/01/2024 05:05, Kuninori Morimoto wrote:
> of_graph_get_next_endpoint() is now renamed to
> of_graph_get_next_device_endpoint(). Switch to it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   drivers/hwtracing/coresight/coresight-platform.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 9d550f5697fa..944b2e66c04e 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -275,7 +275,7 @@ static int of_get_coresight_platform_data(struct device *dev,
>   	 */
>   	if (!parent) {
>   		/*
> -		 * Avoid warnings in of_graph_get_next_endpoint()
> +		 * Avoid warnings in of_graph_get_next_device_endpoint()
>   		 * if the device doesn't have any graph connections
>   		 */
>   		if (!of_graph_is_present(node))
> @@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
>   	}
>   
>   	/* Iterate through each output port to discover topology */
> -	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
> +	while ((ep = of_graph_get_next_device_endpoint(parent, ep))) {
>   		/*
>   		 * Legacy binding mixes input/output ports under the
>   		 * same parent. So, skip the input ports if we are dealing

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>



