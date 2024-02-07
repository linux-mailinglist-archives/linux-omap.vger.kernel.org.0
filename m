Return-Path: <linux-omap+bounces-529-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5657484CC32
	for <lists+linux-omap@lfdr.de>; Wed,  7 Feb 2024 14:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 893531C2119D
	for <lists+linux-omap@lfdr.de>; Wed,  7 Feb 2024 13:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D04C7C08C;
	Wed,  7 Feb 2024 13:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hIkS4nxw"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7653C7993B;
	Wed,  7 Feb 2024 13:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707314259; cv=none; b=pCDJJo9YqU8nLs7ITcED/TP4v8j3VsB5UR5WSHobjUNRDwqCZctZnLnACTngUDve2Z4ekNdQASau5ruvRxcfPqy4PcU0APaCHfQ22c6MUnqEdUDmbR3kn31zkSh0W6fLGVMWTDyw5Lqv4vAoJkCmYy65ozICFKDGzQB/pZxVo7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707314259; c=relaxed/simple;
	bh=QMGIgzK3ks407x+VtjPVEK4eOUKLE0Kww8D7ARO/WPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9Ak7j48k0AYmq/muiXg5qShRZ0UYtUx79kvu73BCZ9ENDkLDmcj9Qyi2Pc5XyPubJ8z/DgNpM1SZ04j0sVepsJ7rDwFIehFp3lCsbC0hNomaQ+j5K9WAFiBWfF8dq+z/SoUQhxJgvlEaxDrC47PTG3qO9FhI+dLEQG4WCgUj6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hIkS4nxw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 018AEA27;
	Wed,  7 Feb 2024 14:56:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707314171;
	bh=QMGIgzK3ks407x+VtjPVEK4eOUKLE0Kww8D7ARO/WPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hIkS4nxw6ve6FBd5Fy4ZqwwoWvpQfO4Qg++yrNnC4c9yu7KftLygQmqk0lzcisdtM
	 2HKf1bVJ6wa8wBIQY9EYVmUfweqqnwJhyDKicMxYV3q2v+L/aLG7U2EZIwp5z/El34
	 SzFGzO2seoakuCc1jIdWPBz4DtF2uIYBMel3kflA=
Date: Wed, 7 Feb 2024 15:57:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
	=?utf-8?Q?=22Uwe_Kleine-K=C3=B6nig=22?= <u.kleine-koenig@pengutronix.de>,
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
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
Subject: Re: [PATCH 3/4] media: platform: replace of_graph_get_next_endpoint()
Message-ID: <20240207135737.GI2827@pendragon.ideasonboard.com>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87plxanvx1.wl-kuninori.morimoto.gx@renesas.com>
 <20240206162506.GC2827@pendragon.ideasonboard.com>
 <875xz1tave.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <875xz1tave.wl-kuninori.morimoto.gx@renesas.com>

On Tue, Feb 06, 2024 at 11:45:58PM +0000, Kuninori Morimoto wrote:
> 
> Hi Laurent
> 
> Thank you for your review
> 
> > > diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> > > index 686ca8753ba2..3f8bea2e3934 100644
> > > --- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> > > +++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> > > @@ -728,7 +728,7 @@ static int s5pcsis_parse_dt(struct platform_device *pdev,
> > >  				 &state->max_num_lanes))
> > >  		return -EINVAL;
> > >  
> > > -	node = of_graph_get_next_endpoint(node, NULL);
> > > +	node = of_graph_get_endpoint_by_regs(node, 0, -1);
> > 
> > This is not correct, see
> > Documentation/devicetree/bindings/media/samsung,exynos4210-csis.yaml.
> 
> Hmm... Then, It can be like this ?
> 
> 	+ node = of_graph_get_endpoint_by_regs(node, -1, -1);

I suppose that would work, even if we should really try not to pass -1
for the port. Rob, any opinion ?

-- 
Regards,

Laurent Pinchart

