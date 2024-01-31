Return-Path: <linux-omap+bounces-468-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4246A8436C7
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jan 2024 07:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDBF02824FD
	for <lists+linux-omap@lfdr.de>; Wed, 31 Jan 2024 06:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9504F4501C;
	Wed, 31 Jan 2024 06:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vZsFBO1t"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03AF41776
	for <linux-omap@vger.kernel.org>; Wed, 31 Jan 2024 06:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706682625; cv=none; b=RTt09MlTNZZgfs0xJfwenYNdisxvu7iOalcfv3zUa0+TeFEGOw6sJzvGOMttE/yRomTt5LQTattpgts/0QGMosrzKaKHF0Thn9REDmpgb8zrmF3i3BfZPIc+NTL7C0TVYICYHZI4d38ApIYx87kNBzyMkr9JxZvj4PG8gnj5gJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706682625; c=relaxed/simple;
	bh=nxlnhpTP2ZY02f0uY5iRFtCEWLbVgQJy/f7OhUQYcng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VSZFyeGrNvLJ48K32uOZzC62xlvhiPzQsiFc+Eg2cOnlZuPtHjAtGP3nCaZBlNxc4bmKY2kOHZrC0EmX5rLj6CSmGSRaDTAqkVzpOocujW+t3IJOfvbOzWPAuh4YXGGjdc6yTlfNXwZo/Gyc2WJdcXlhOqcx5PKuQ8ZQE6mIWYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vZsFBO1t; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-602c714bdbeso4794477b3.1
        for <linux-omap@vger.kernel.org>; Tue, 30 Jan 2024 22:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706682621; x=1707287421; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XuBpfFrt6LIRFxGJEZUBYvlJzyC2OSdPPTTcyZFlpqs=;
        b=vZsFBO1tbcX0p4bsdYubfMJfW2LmU0Q4FUJRAJXNIm9NjKsUowy2lKBJZttjRf2E7s
         n7y4pdDx/G+wKZRElpjGreamrPgUmd4L7CAZ+sC+1Sh7ZADQsVL+nV8yW1kPrpcpU4p2
         Kqp+NYw0HPqTkjluQSYWeHok+pWSp5CT1aEelzSJkpzdgcl2+a2UNtnfYV2MCAMWsBmn
         6ZvVU6JYHoc1DyOQFQPDv00OYggDNIXWN8dO78rhTOjrz3ftgC0zkRz3BpaOk0s0eoT7
         NsKjd8gufHe1y0DZk7acaYmEl104/B1PsjYP4r77Plhs4hGW8eQHzfHNynyy2zMMKAJ6
         73Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706682621; x=1707287421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XuBpfFrt6LIRFxGJEZUBYvlJzyC2OSdPPTTcyZFlpqs=;
        b=BZhAKv9t5pR4iNrfKkpCDKYOayk2oDbUspmg6sH3JEk5ZewYpjslbnLE/BmtzWva3M
         2VwBg+XF4yBDx0IPuCvBeSSopv+X+30jAMht94/S0yBBpfm9qCdVXp8yzxuRDceXu+S3
         AfnrWbe2iPz0c7x/CZ8PaVoUX+ZPPTqYFjGr5X65++Z91xdZUDJT1c6Q5PPTAnv2KE70
         QX8etKn5GQUKNvtUSYkxODqUyS97oZcPv2A2j0ViOxCbQTmOtAgy/rhBUFAWI7SxUjW6
         +ChcnPbd5S7rMclhpt+Txqh/Rn7mVqeB0PNJDA4BIZ2pHkk8s7h27AIo191enm04p4iA
         xwbg==
X-Gm-Message-State: AOJu0YzJazfaI5R+aYGtxQBmCQEEVjFL7oatx+HZCLkE6aqK8egSjLTU
	ydj13e8JKMVCG3u8dwb8189ILrIcX7MTfcvLDMUa4CUZiVXhUHrZaBHpZnXpohSANgVO0MoNKCo
	qY00rc0wttNMKncmiOS6T+hhi/Jxf3L9SHW8cPg==
X-Google-Smtp-Source: AGHT+IFCSuHGBgOcgNRm+Jyx9Rk92WC70s7Qe1r45Ekea56q3x+YWZYnfOl+X2xsR2ea9MpX12ltkU9QLuvg4lUUs5g=
X-Received: by 2002:a81:6d16:0:b0:5ff:8152:64b with SMTP id
 i22-20020a816d16000000b005ff8152064bmr311187ywc.15.1706682621572; Tue, 30 Jan
 2024 22:30:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com> <87le866qke.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87le866qke.wl-kuninori.morimoto.gx@renesas.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jan 2024 08:30:10 +0200
Message-ID: <CAA8EJpoRhS_yvJJUuC3YkWRAKT7e03k+-K=6QKfL_6TkB1XoxA@mail.gmail.com>
Subject: Re: [PATCH v3 02/24] of: property: use unsigned int return on of_graph_get_endpoint_count()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=83=C2=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	=?UTF-8?B?VXdlIEtsZWluZS1Lw4PCtm5pZw==?= <u.kleine-koenig@pengutronix.de>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Alexey Brodkin <abrodkin@synopsys.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Andy Gross <agross@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Bjorn Andersson <andersson@kernel.org>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Emma Anholt <emma@anholt.net>, 
	Eugen Hristev <eugen.hristev@collabora.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Frank Rowand <frowand.list@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Helge Deller <deller@gmx.de>, Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, Jacopo Mondi <jacopo@jmondi.org>, 
	James Clark <james.clark@arm.com>, Jaroslav Kysela <perex@perex.cz>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kevin Hilman <khilman@baylibre.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Marek Vasut <marex@denx.de>, 
	Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Tretter <m.tretter@pengutronix.de>, Michal Simek <michal.simek@amd.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Rob Clark <robdclark@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Saravana Kannan <saravanak@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Tim Harvey <tharvey@gateworks.com>, Todor Tomov <todor.too@gmail.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Fabio Estevam <festevam@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Leo Yan <leo.yan@linaro.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mike Leach <mike.leach@linaro.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>, Tom Rix <trix@redhat.com>, 
	coresight@lists.linaro.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jan 2024 at 07:05, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> The return type and the variable of of_graph_get_endpoint_count()
> should be unsigned. Tidyup it.

'the variable'?

I'd have added a few words telling that return type can be unsigned
because there is no error reporting for this function.

>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/of/property.c    | 2 +-
>  include/linux/of_graph.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 4e879faa1710..25d73409aeee 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -817,7 +817,7 @@ EXPORT_SYMBOL(of_graph_get_remote_port);
>   *
>   * Return: count of endpoint of this device node
>   */
> -int of_graph_get_endpoint_count(const struct device_node *np)
> +unsigned int of_graph_get_endpoint_count(const struct device_node *np)
>  {
>         struct device_node *endpoint;
>         int num = 0;
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index 4d7756087b6b..a4bea62bfa29 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -41,7 +41,7 @@ struct of_endpoint {
>  bool of_graph_is_present(const struct device_node *node);
>  int of_graph_parse_endpoint(const struct device_node *node,
>                                 struct of_endpoint *endpoint);
> -int of_graph_get_endpoint_count(const struct device_node *np);
> +unsigned int of_graph_get_endpoint_count(const struct device_node *np);
>  struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
>  struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>                                         struct device_node *previous);
> @@ -68,7 +68,7 @@ static inline int of_graph_parse_endpoint(const struct device_node *node,
>         return -ENOSYS;
>  }
>
> -static inline int of_graph_get_endpoint_count(const struct device_node *np)
> +static inline unsigned int of_graph_get_endpoint_count(const struct device_node *np)
>  {
>         return 0;
>  }
> --
> 2.25.1
>


--
With best wishes
Dmitry

