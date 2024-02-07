Return-Path: <linux-omap+bounces-528-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA6484CC23
	for <lists+linux-omap@lfdr.de>; Wed,  7 Feb 2024 14:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C9791C20BE6
	for <lists+linux-omap@lfdr.de>; Wed,  7 Feb 2024 13:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF9A79DB5;
	Wed,  7 Feb 2024 13:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mkka2GuJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FEA59B76;
	Wed,  7 Feb 2024 13:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707314153; cv=none; b=pWLaF2+V/SZlem1SoxoptoMFiW/67IYS5x59srzEc21yN3eBebKn1vKAqMKw/tZFnLUZEPQWFUCaO2MeZTluQtFwbweMjcPTLfHOKlyNwRlJFD+8YHYXhWivkAzNRrp4guWRPjVTkM+OQfELiS3EXYxaqEHmuiAAzJTmoK0+8Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707314153; c=relaxed/simple;
	bh=V3+jKoIBUGBZBTis/sYDfzFW5Z0QpV8or9q0zkUW4ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RaZnXxOnkzgtclyF+akucewBxRYzRs46xbEN1xTTsRaJslsaWjkrRx4JikZ+PqC5dD1vBy3Fcc66b5nrpwRjwE6E1eb3DZhn9RXOA6KTgObsldjCCN20rWCF88a7RSjNU37eydslybAp6wVfgAAtUveEJnmnbb7+KQ6mrCKxqRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mkka2GuJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF0C8A27;
	Wed,  7 Feb 2024 14:54:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707314065;
	bh=V3+jKoIBUGBZBTis/sYDfzFW5Z0QpV8or9q0zkUW4ZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mkka2GuJ08eb1sItKZOfQ6+lvDhWNuhZSkErIkhowx0OfLH5FXDJCy+mUrQOWyIkT
	 n7HoPVGhYijKr2feP9hJ2+1HF7xmn6I51qe4PTkCYmt80xyiNo62xjYa24d9mOiluy
	 BHSqKP/V8J4lMwbXO/TTZY9fogWeN/PrkFfJGZnM=
Date: Wed, 7 Feb 2024 15:55:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Airlie <airlied@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Helge Deller <deller@gmx.de>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Russell King <linux@armlinux.org.uk>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tim Harvey <tharvey@gateworks.com>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/4] media: i2c: replace of_graph_get_next_endpoint()
Message-ID: <20240207135551.GH2827@pendragon.ideasonboard.com>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
 <20240206134155.GB2827@pendragon.ideasonboard.com>
 <m3il30zace.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3il30zace.fsf@t19.piap.pl>

On Wed, Feb 07, 2024 at 02:13:05PM +0100, Krzysztof Hałasa wrote:
> Laurent,
> 
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:
> 
> >> +++ b/drivers/media/i2c/adv7604.c
> >> @@ -3205,7 +3205,7 @@ static int adv76xx_parse_dt(struct adv76xx_state *state)
> >>       np = state->i2c_clients[ADV76XX_PAGE_IO]->dev.of_node;
> >>
> >>       /* Parse the endpoint. */
> >> -     endpoint = of_graph_get_next_endpoint(np, NULL);
> >> +     endpoint = of_graph_get_endpoint_by_regs(np, 0, -1);
> >
> > I think this should be port 1 for the adv7611 and port2 for the adv7612.
> > The adv7610 may need to use port 1 too, but the bindings likely need to
> > be updated.
> 
> To be honest I have no idea about ADV7611 and 7612.
> The 7610 I have on Tinyrex "mobo" seems to be single port.

One issue is that the commit that added the adv7610 compatible string to
the DT bindings (commit 901a52c43359, "media: Add ADV7610 support for
adv7604 driver - DT docs.") didn't extend the conditional rules further
down in the file that defines what ports are needed. That's why I don't
know what was intended. I believe the adv7610 should be treated like the
adv7611, given that the driver has

        { .compatible = "adi,adv7610", .data = &adv76xx_chip_info[ADV7611] },
        { .compatible = "adi,adv7611", .data = &adv76xx_chip_info[ADV7611] },

Could you send a patch to address that in the DT bindings ?

> ADV7611 seems to be mostly a 7610 in a different package (LQFP 64
> instead of some BGA 76). The driver simply treats ADV7610 as a 7611.
> 
> ADV7612 is apparently dual port (only one port can be used at a time)
> though:
> 
> [ADV7612] = {
>         .type = ADV7612,
>         .has_afe = false,
>         .max_port = ADV76XX_PAD_HDMI_PORT_A,    /* B not supported */
>         .num_dv_ports = 1,                      /* normally 2 */
> 
> 
> All related in-tree DTS entries (as of v6.8.0-rc1) seem to be ADV7612.
> 
> To me it seems all known devices use the first port only.

-- 
Regards,

Laurent Pinchart

