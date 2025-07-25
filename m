Return-Path: <linux-omap+bounces-4149-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94435B11AF4
	for <lists+linux-omap@lfdr.de>; Fri, 25 Jul 2025 11:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62D7F1CE0099
	for <lists+linux-omap@lfdr.de>; Fri, 25 Jul 2025 09:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFCB2D375B;
	Fri, 25 Jul 2025 09:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CKW1fIq9"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2B72D3726;
	Fri, 25 Jul 2025 09:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753436295; cv=none; b=fRmZ3t56QuHXsq0pRa+DNdsmN69LP3J3h0dxNCmiAKYsU3y4wcMbXYb6ZQYa8sUqixHRx3fI2k2NxWLzY/Ahn44/eGsAjfodKXNB54IXU8L7x7fg+a7XJwtaaUjmcrbZu621MtUPraydjxOVKdkcb21zpFcILYfiTXjqnSkzZp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753436295; c=relaxed/simple;
	bh=Lt6SmWWA+flk8+i/w5G+iZ55bVRytIRcfhqSwBzCORQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKj2N3T0AdHB2w+1/+aKkPZYFX4CipxeJocpZQjJA7Q0I+lfQURJLujRAk+Sr54CZ4U+ktMXmmFvQQ8hQux/hXZIMBMyvdZutgNgl3Ba7sVg23SvP8hvNRE/bifoEfIoGxRP6+Oa/hm9bVAtj+O3wP4DeJhjYqZNwkbvxwuZPlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CKW1fIq9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 976B9BA;
	Fri, 25 Jul 2025 11:37:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753436250;
	bh=Lt6SmWWA+flk8+i/w5G+iZ55bVRytIRcfhqSwBzCORQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CKW1fIq9rjDkDHEv00tM15+U8JFPSk06HUbtEB1cRbISM+C3Mi6gxyRWEvi9U+wVC
	 XciENXhxhobG6Q3w2mr7Yg9TcLzEZXqztE969GQJsgq/qUuNuyg7pVPjIhMS+ZRSFc
	 8EyxHNFROYUIPc0YFLHoZEJriSIXRX3e3MXsxIMc=
Date: Fri, 25 Jul 2025 12:38:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Hao Yao <hao.yao@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jacopo Mondi <jacopo@jmondi.org>, Jimmy Su <jimmy.su@intel.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Leon Luo <leonl@leopardimaging.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Todor Tomov <todor.too@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tony Lindgren <tony@atomide.com>, Zhi Mao <zhi.mao@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 00/72] media: i2c: Reduce cargo-cult
Message-ID: <20250725093805.GY11202@pendragon.ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <PN3P287MB1829DD1254FB74391A750F498B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724115202.GK11202@pendragon.ideasonboard.com>
 <PN3P287MB1829C9E8C78ADD70259A68F08B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724135259.GR11202@pendragon.ideasonboard.com>
 <PN3P287MB1829E1FEE7D2468CE9915C778B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724154414.GE22016@pendragon.ideasonboard.com>
 <PN3P287MB1829FC781EA3A94E0B8F16B98B59A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB1829FC781EA3A94E0B8F16B98B59A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

On Fri, Jul 25, 2025 at 07:00:40AM +0000, Tarang Raval wrote:
> > On Thu, Jul 24, 2025 at 02:20:10PM +0000, Tarang Raval wrote:
> > > > > > > 2. In the regulator code, you can reduce boilerplate by using
> > > > > > >    devm_regulator_bulk_get_enable().
> > > > > >
> > > > > > devm_regulator_bulk_get_enable() doesn't seem to be a good idea. You
> > > > > > generally don't want to enable power everywhere unconditionally, and
> > > > > > sensors very often need a guaranteed power up sequence.
> 
> -----(1)
> 
> > > > >
> > > > > The regulators are optional, we supply power to the camera sensor directly
> > > > > through dedicated power rails and there is no strict enable sequence
> > > > > required in this case.
> > > >
> > > > What exactly do you mean by "this case" ? Are you talking about one
> > > > particular sensor ? One particular camera module ?
> > >
> > > Laurent, by “this case” I meant the common scenario where power to the
> > > camera sensor is supplied by a PMIC regulator that is always-on. In such
> > > setups, the regulator is fixed and cannot be enabled or disabled from the
> > > driver, the sensor is always powered.
> > >
> > > This is what I’ve seen in most platforms, where the CSI input connector
> > > provides fixed 3.3V/1.8V power rails directly to the camera module.
> > >
> > > Of course, if the camera supply comes from a dedicated regulator controlled
> > > via a GPIO, then the driver would need to handle enable/disable sequencing
> > > explicitly. But I’m specifically referring to the first case, where the power rails
> > > are always-on.
> > 
> > How does the sensor driver know which of those two cases it is dealing
> > with ?
> 
> The sensor driver typically determines this via the presence (or absence) 
> of regulator supply entries in the Device Tree. If a supply is not defined,
> it's assumed to be always-on (e.g., provided by the board via fixed rails).

Do we have sensor drivers that check the presense of supply properties ?
Drivers generally shouldn't.

> When defined, the driver retrieves and manages the regulator. This approach
> allows a single driver to support both cases, by treating supplies as optional
> and only enabling them when explicitly defined.

I don't see what you're trying to do here. A sensor always needs
supplies, regardless of whether or not they're always on. Drivers should
get the supplies with regulator_get() (or possibly the bulk API), and
then implement the power enable/disable sequences that the sensor
requires. If all suplies are manually controllable, this will produce
the correct sequence. If the supplies are always on, it will be a no-op.
That's a single implementation in the driver, you don't need to care
about the nature of the supplies, or their presence in DT.

> At comment (1): you gave two reasons why we cannot use devm_regulator_bulk_get_enable.
> 
> What I’m trying to say is:
> 
> You mentioned "generally don't want to enable power everywhere unconditionally," 
> but on almost every platform, the power rails are always-on.

"almost every platform" doesn't sound right to me. It does happen though.

> And regarding the second point — "sensors very often need a guaranteed power-up sequence" 
> I don’t understand why this would be an issue. Even if we use devm_regulator_bulk_get_enable,
> the power-up sequence remains the same. So how is it not a good option in this case?

Because the bulk API enables all regulators in parallel, it doesn't
guarantee sequencing.

Don't use devm_regulator_bulk_get_enable() in sensor drivers, implement
power enable/disable functions that do the right thing. That's the code
pattern I want to see.

-- 
Regards,

Laurent Pinchart

