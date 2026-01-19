Return-Path: <linux-omap+bounces-5563-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72145D3B04E
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 17:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0027D3029298
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 16:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED552DB78E;
	Mon, 19 Jan 2026 16:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VIjm40O9"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B962628852B
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839501; cv=none; b=EJxBFNifC9IeECzjE4XKnVNfbc87mWgmmqJZ8tWfLEChUSqOnoDTy2euwGXdTGu5T9V52A6nwkQOwxKggX5YXsp/svunQaAJeWiOrt6iAdDBIeRAJG/jPshceYO4wUnDMvrDLzLMz3FZN1n9Uh9A3IsDatgEUAV/6i9p1H3oS5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839501; c=relaxed/simple;
	bh=Jiu8fQFB+7M2IZaxcK+RFxDWZNOenFQNmVdddV8IPDM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=LuMl6NtUOejGS0H9aVZ1D6PihHO268/73NYMLd7sbIqxI7A4uksGkXiSHASL6hvJfou02gCP5hbBN+1xU50CybJMDpbwUQlcYtuDf4UgNsFvgVYh/USmZvlF/ME8p6VUwql95V/s1o+S9/gXQrBWUA7el4YfVQWF6YZyoYe6ATY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VIjm40O9; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5511AC214D8;
	Mon, 19 Jan 2026 16:17:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5FDA960731;
	Mon, 19 Jan 2026 16:18:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B71610B6B0D3;
	Mon, 19 Jan 2026 17:18:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768839497; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JqokSB/0RBOseZeyT2qAuti6f2yMS8AqAjej/iFQSJA=;
	b=VIjm40O9btn2BNORZgu1rSWFqSTOiWnukvS9ClC7/IpC3nUIk4dGSI86PLSEbDDn/FnoDX
	2PL+hO5tZrNft6PPrDOiADadKHEn7U+oictFAiyJDKpz7+z5O+WYB5H5RbUEuh7t1IL1fi
	rNCigWn/Me9UFD+pgDOy+51QMhD7KSRI4Li0vUsANhdeYAZS/7I6IiowdRHGy278RX3qNQ
	4wQBsr+3xoy0HDXRjcg0XBRh2ZagzgO1+v/1JKNFgrwZumeTlVIxY2h6PpWgUdG46xwLqk
	DTDPDowAyghuUoHioDnUAdFYv5NaEOmuL8wbW0QokAE/k6RqUrOmlCJ47QB9zg==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 17:18:12 +0100
Message-Id: <DFSP9OPJNVYB.2C96Z9GQ17BW1@bootlin.com>
Subject: Re: [PATCH v4 05/25] drm/tilcdc: Convert legacy panel binding via
 DT overlay at boot time
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-5-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-5-2c1c22143087@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> To maintain backward compatibility while removing the deprecated
> tilcdc_panel driver, add a tilcdc_panel_legacy subdriver that converts
> the legacy "ti,tilcdc,panel" devicetree binding to the standard
> panel-dpi binding at early boot.
>
> The conversion uses an embedded device tree overlay that is applied and
> modified during subsys_initcall. The process:
>
> - Apply embedded overlay to create a tilcdc-panel-dpi node with
>   port/endpoint connections to the LCDC
> - Copy all properties from the legacy panel node to the new
>   tilcdc-panel-dpi node
> - Copy display-timings from the legacy panel
> - Convert legacy panel-info properties (invert-pxl-clk, sync-edge) to
>   standard display timing properties (pixelclk-active, syncclk-active)
> - Disable the legacy panel by removing its compatible property to
>   prevent the deprecated driver from binding
>
> The result is a standard tilcdc-panel-dpi node with proper endpoints and
> timing properties, allowing the DRM panel infrastructure to work with
> legacy devicetrees without modification.
>
> Other legacy panel-info properties are not migrated as they consistently
> use default values across all mainline devicetrees and can be hardcoded
> in the tilcdc driver.
>
> This feature is optional via CONFIG_DRM_TILCDC_PANEL_LEGACY and should
> only be enabled for systems with legacy devicetrees containing
> "ti,tilcdc,panel" nodes.
>
> Suggested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Link: https://lore.kernel.org/all/1d9a9269-bfda-4d43-938b-2df6b82b9369@id=
easonboard.com/
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---

Looks very good now, thanks for the improvements!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

