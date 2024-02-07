Return-Path: <linux-omap+bounces-526-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA41284CC09
	for <lists+linux-omap@lfdr.de>; Wed,  7 Feb 2024 14:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B1B11F2452E
	for <lists+linux-omap@lfdr.de>; Wed,  7 Feb 2024 13:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4290E77F17;
	Wed,  7 Feb 2024 13:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Uo1ED493"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDA17C099;
	Wed,  7 Feb 2024 13:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707313915; cv=none; b=Vky0FbwZ96AM/t8Vd/fy6VN3ZLhf3df61YL0djHJQQLVNmyDHsfSoL8kOmkZWrZITkrW0RpM493ZZ/Dco3mcXbVGSrlyBmS9+V4FY9xgasgXKnq0o+RdoQftwdAlP8AgkJFydO5/xo8Wx5YnpBC2G8gF2GenvYkUpmMb3t0EfvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707313915; c=relaxed/simple;
	bh=IrHVlnm6x2iQ3sJqDD2XcdDUYN/ea4m9XhtfLUcYLRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOtksbOKE7Nj+5uXJO9AeMc+IUqprMdl8hNPe/Lu6OtQw8BNRAD1/K+i63TnTfcayRmGhm3QtkIMDURXdiHkGBbu+T66+Hu12u/Q15UAecMMnn1kfDIHconqMNmze3s79HQX+Ye/qQfr3v1zUfUsjTesu3Umk2Rlrc/IkXWUkNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Uo1ED493; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B239CA27;
	Wed,  7 Feb 2024 14:50:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707313826;
	bh=IrHVlnm6x2iQ3sJqDD2XcdDUYN/ea4m9XhtfLUcYLRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uo1ED493OWShznBB1m74nJMBfekm23VcQoncmAmnupESyyT21h1VfXdXOR+ccLxgd
	 E4oPsPYOw7o9HYG4QWKNJOKv4Z1zSzaJA78Rw1gk+7FZaZxTx3mQ3r1+wEf6Pg1k7c
	 oVYhIDwShUBZgEJoVjoVvUf1D6jPTm6iUr10s5oU=
Date: Wed, 7 Feb 2024 15:51:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
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
Message-ID: <20240207135152.GG2827@pendragon.ideasonboard.com>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
 <20240206134155.GB2827@pendragon.ideasonboard.com>
 <9d1e99b0-892d-4a72-a9b3-886b8ed094b0@xs4all.nl>
 <m3eddoza9y.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3eddoza9y.fsf@t19.piap.pl>

On Wed, Feb 07, 2024 at 02:14:33PM +0100, Krzysztof Hałasa wrote:
> Hans,
> 
> Hans Verkuil <hverkuil-cisco@xs4all.nl> writes:
> 
> > Ideally someone would have to actually test this, perhaps with one of those
> > Renesas boards. While I do have one, it got bricked after I attempted a
> > u-boot update :-(
> 
> May be reversible, though.

Maybe Morimoto-san could help ? :-) What board did you use Hans ?

-- 
Regards,

Laurent Pinchart

