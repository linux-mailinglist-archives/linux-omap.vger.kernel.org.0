Return-Path: <linux-omap+bounces-5223-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D03CCCD36
	for <lists+linux-omap@lfdr.de>; Thu, 18 Dec 2025 17:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB69F308862A
	for <lists+linux-omap@lfdr.de>; Thu, 18 Dec 2025 16:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742EF35F8C3;
	Thu, 18 Dec 2025 16:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="mboMVR0c"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8B935E54A;
	Thu, 18 Dec 2025 16:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766075159; cv=none; b=tJDbJ8zsbyFtdEwCwaONHpvZ/0R86b33b79+y3anvUvHwzRvprho0q8wj5k0wD7UP3+wK4A5XaPir3BQvs2RqtP1nkXaY/IzbCaD5ctj0fGjKt6jPt42l8YXevMPnbX7BAxH301hS/HwgO9GNq23B+Jv1cZaIi3PnKJKN+UIhN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766075159; c=relaxed/simple;
	bh=qwJypU9bIYmExoXtAh4Yr+ZWfamC1DWgN5kEoxbDEvo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G2OGvPxMBdElJUq/xh2NlkZKxuuZLRA4vHMdCvwrcbQFABZnhU9a8P6oJNIoZmCr3T4SOjqCo3BKCK4zY1BImc/8jLyYocVppMnTHU7590U2S82Ce5Pkk6aARRvN/9a4/T6q6qw7avjGdzq3OWDFav1yAvgghUmAbRGVdxtTEFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=mboMVR0c; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=p6SJYnp842vCkHQu4i1e9JURGgkIZOc40Ucg7D58Umw=; b=mboMVR0clmVwmOkik7DJ/d1LVk
	GKJTXr137XbyxnXLQy/exMN+xbuxmyL0eErPsCBvcU1/yNaZm8yuJXMN2TnBUjXU692kIrag3X5HN
	dOoxnwA2JdeDW3ZYbUD7ln7d0b764ixHN+w11j8NrtY+sfOEZsVS8DOgcLuu6iyF81By+Nwk3oSMW
	jXOHvbHZHtu66FqVsDPCKCQbQ4g5dEI0K+1rASggpmwLd4u+qWD7BYWQrPsYiS52kUkv1TFv6FgAC
	QRhkKNcK1sUAAb7oO7PoXDCDU+KJiCVRGvIHO3foOFZmvUQZ/aIS2nTvPbmJ29hqkVyquVhreRqSI
	xlLsk5mw==;
Date: Thu, 18 Dec 2025 16:46:20 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
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
 <jernej.skrabec@gmail.com>, "Markus Schneider-Pargmann" <msp@baylibre.com>,
 "Bajjuri Praneeth" <praneeth@ti.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v2 03/20] drm/tilcdc: Remove simulate_vesa_sync flag
Message-ID: <20251218164620.40c0599d@kemnade.info>
In-Reply-To: <DF0K3BRQKOSI.10X5SMXI1YM60@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
	<20251211-feature_tilcdc-v2-3-f48bac3cd33e@bootlin.com>
	<DF0K3BRQKOSI.10X5SMXI1YM60@bootlin.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 Dec 2025 15:20:09 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

[...]
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>  
> 
> Code looks good. Based on your testing, which covered both boards currently
> setting simulate_vesa_sync and boards not setting it:
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Still it would be good to have this series, and especially this patch,
> tested by someone having access to other TI boards.
> 
Just that I do not mix up anything:

grep tilcdc only gives:

am335x-base0033.dts:		compatible = "ti,tilcdc,slave";
am335x-guardian.dts:		compatible = "ti,tilcdc,panel";
am335x-pdu001.dts:		compatible = "ti,tilcdc,panel";
am335x-pepper.dts:		compatible = "ti,tilcdc,panel";
am335x-sbc-t335.dts:		compatible = "ti,tilcdc,panel";
am335x-sl50.dts:		compatible = "ti,tilcdc,panel";
am33xx-l4.dtsi:				compatible = "ti,am33xx-tilcdc";

so only am33xx affected? And no omap3/4/5. So apparently nothing
I can test.
@Roger: I suspect you have more of these boards than me.

Regards,
Andreas

