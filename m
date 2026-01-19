Return-Path: <linux-omap+bounces-5568-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F871D3B51B
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 19:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0458B3065627
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 18:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D673132FA30;
	Mon, 19 Jan 2026 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GJLz99Fu"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEFD32B9A2
	for <linux-omap@vger.kernel.org>; Mon, 19 Jan 2026 18:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768845630; cv=none; b=N6dm7BMGN20axVMGPK7u7zJtFzK34JhmwJlr6lbAI65spEIlsuanPfuKhJu+tnVAe3WDSqNm5ZIiAKlYF2+GAe/pMGKdJP/8q3rLIvq4Zoce/PAp38rg1GMHHwyVv7QtwrLUxmZUqIRxaO88zOZnXMOarVJVAJ+SLCtVkNQUhQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768845630; c=relaxed/simple;
	bh=WBf2lasmqqjrfsbF6WKQjkm17EIQ2p9rHE9R1xVmfv4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=VWlziHnTAKXhCN8TR7h8TsEsQdzJV7lzE9uwPjqFId4Hma6III9jxFUZGTXsf0ukpgdq2+xEg/gFzz5Kbq7eMT8dwGyb7f9dj2spUPLyR1HLw5yYdrCKYzL2x77KZLCN8i43erAAj0roupSMJ1S0SxZXc5wEO5rcJG8V9G2Od5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GJLz99Fu; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E7CCFC214D8;
	Mon, 19 Jan 2026 17:59:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6905960731;
	Mon, 19 Jan 2026 18:00:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA3D810B682D3;
	Mon, 19 Jan 2026 19:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768845624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WBf2lasmqqjrfsbF6WKQjkm17EIQ2p9rHE9R1xVmfv4=;
	b=GJLz99FuROhVPQbODGQoBmS8mQkJhHWgqwlB4dozNcQWeCn/sgZRLtTpvY1LDTWNwJs2Rk
	Q+XON3cIQ+yRX282TPZuXCbz7bIyLua5y6Scd4xEcjwJ06TYhC/GWP+A0al5xyhsygUfSc
	Suius3yeo98RjQHO1C7bVOYI6pwgJ2eKp4h8ub91LXxE/6q1XlcwDIVrg3i6FZcCTa1kSS
	pIeYCVaCaD/GP2lcbshIEzNpQWfS0SQLQkYGNNCuoSQIuhaiIYB2vObKV70l9D4esLxKaX
	OjKFHkZze15koeCsKB2EGcFkERJaoWpYrgDeEnLDV+3gtXrHXlDCr+FG7Vhr5Q==
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 19:00:18 +0100
Message-Id: <DFSRFUYPL99P.WTKNJRWA36F7@bootlin.com>
Subject: Re: [PATCH v4 19/25] drm/tilcdc: Convert to drm_device-based
 logging helpers
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
 <20260116-feature_tilcdc-v4-19-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-19-2c1c22143087@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> Replace dev_* logging calls with their DRM equivalents.
> This aligns with the DRM subsystem's logging infrastructure and provides
> better integration with DRM debugging mechanisms. The drm_* helpers
> automatically include device information and integrate with DRM's
> debug category filtering.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>
> Change in v4:
> - New patch.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

But please avoid adding more patches to a v2+ series unless there is a
specific need. It does not help getting it applied.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

