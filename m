Return-Path: <linux-omap+bounces-4144-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1389DB10C36
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 15:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18688188B35A
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 13:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6833B2DE6EF;
	Thu, 24 Jul 2025 13:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q6mze2Uq"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2304D2DE6E1;
	Thu, 24 Jul 2025 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365189; cv=none; b=H5MVdgSA0awDgPQrjyKCLyNW/FybCOb8E7ZO6tCaYmTK4fNIUqJVUQoX6RqYPFGIEHIcaPjcvEOFM929IVsCmJLGDpKBNouUnZBlQVl+8ubEGXyioXVwJ0tnjTEjwW434UWhderA7cXzAp9RgSoeTsU67WD7I8XP2/YCmoURZ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365189; c=relaxed/simple;
	bh=yqn7eXWGIicat6ACtQ06fChq2+bwHai2eNzsQEGAiZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFmujNQ7x0dtmyexmvoy87HPyAvVMLSGWuJVfFihC0h0F/3uruyJui8+B/jJWY39Pzd0zxrudIdndUcoRZ023s0j/ADBy1vZkYTSUWKxbeqfVDiKVzoMOZWvNsudQwyXVdr33HeJOQEMiNc1xbNbd4YjVAWHBsDrNsiO5/OtGYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q6mze2Uq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 129698BF;
	Thu, 24 Jul 2025 15:52:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753365144;
	bh=yqn7eXWGIicat6ACtQ06fChq2+bwHai2eNzsQEGAiZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q6mze2UqXFwh86Xtgaeu1xH+pGVtu3y3IGXfrWbM+IHtdZvLvV+KWdf1wPiHxCUUG
	 wS5S2sHAqnfWVi4xOY5PgiM4mfRjJBG6AOYbYILNPM0dyegcAMR3HcMAvOJldHPuDH
	 FFIaeNm6i+BIst7SC7YtTgFSfK9ibU/PTOGR506o=
Date: Thu, 24 Jul 2025 16:52:59 +0300
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
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Hao Yao <hao.yao@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Jason Chen <jason.z.chen@intel.com>, Jimmy Su <jimmy.su@intel.com>,
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
Message-ID: <20250724135259.GR11202@pendragon.ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <PN3P287MB1829DD1254FB74391A750F498B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724115202.GK11202@pendragon.ideasonboard.com>
 <PN3P287MB1829C9E8C78ADD70259A68F08B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3P287MB1829C9E8C78ADD70259A68F08B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>

On Thu, Jul 24, 2025 at 01:24:24PM +0000, Tarang Raval wrote:
> > On Thu, Jul 24, 2025 at 11:42:55AM +0000, Tarang Raval wrote:
> > > Hi Laurent,
> > >
> > > > This patch series build on top of Mehdi's introduction of the
> > > > devm_v4l2_sensor_clk_get() helper (see [1]) to drastically reduce
> > > > cargo-cult in camera sensor drivers.
> > > >
> > > > A large number of camera sensor drivers directly use the
> > > > "clock-frequency" property to retrieve the effective or desired external
> > > > clock rate. This is standard behaviour on ACPI platforms that don't
> > > > implement MIPI DisCo for Imaging, but usage of the property has leaked
> > > > to OF-based platforms, due to a combination of historical reasons (using
> > > > "clock-frequency" was initially considered right until before the
> > > > introduction of "assigned-clock-rates") and plain cargo-cult.
> > > >
> > > > A large number of camera sensor drivers also set the rate of the
> > > > external clock with clk_set_rate(). This behaviour is also fine on ACPI
> > > > platforms, and has also leaked to OF-based platforms for the same
> > > > reasons.
> > > >
> > > > Mehdi's "[PATCH v2 00/48] media: Add a helper for obtaining the clock
> > > > producer" series improves the situation by centralizing clock handling
> > > > for camera sensor in one helper function that implements the correct
> > > > behaviour for all types of platforms (and should later allow support of
> > > > MIPI DisCo for Imaging transparently for camera sensor drivers). It
> > > > doesn't however address direct access of the "clock-frequency" property
> > > > or direct calls to clk_set_rate() in drivers.
> > > >
> > > > This series builds on top of the new helper to replace manual handling
> > > > of the clock frequency in camera sensor drivers. It starts by addressing
> > > > the DT bindings and reprecating the clock-frequency property for camera
> > > > sensor drivers in all YAML bindings (01/72) and in the et8ek8 text
> > > > bindings (02/72). After that, patches 03/72 and 04/72 make the clocks
> > > > property mandatory in the two camera sensor DT bindings that specified
> > > > it as optional. Finally for the DT side, patches 05/72 to 14/72 replace
> > > > clock-frequency with assigned-clock-rates, or drops the property
> > > > altogether when the source clock has a fixed rate. This aligns the DT
> > > > bindings and device tree sources to the current recommended practice.
> > > >
> > > > After that, the next 5 patches are assorted drive-by changes. Patch
> > > > 15/72 drops an unused header the belonged to a long gone driver, and
> > > > patch 17/72 drops unusued support for platform data in the mt9v032
> > > > driver. Patch 18/72 is the first that addresses clock rate handling by
> > > > dropping unneeded clock rate setting in the mt9v111 driver. Patch 19/72
> > > > takes a harsher approach for the ov6650 by dropping the driver
> > > > completely as the driver hasn't been used since v5.9.
> > > >
> > > > The next part of the series replaces manual clock rate handling with
> > > > usage of the devm_v4l2_sensor_clk_get() helper in a large number of
> > > > camera sensor drivers that implement clock rate handling in a standard
> > > > way. This is done in patches 20/72 to 54/72. This interleaves the clock
> > > > rate handling changes with drive-by refactoring (in separate patches) to
> > > > make the code easier to deal with.
> > > >
> > > > The final part of the series addresses the remaining drivers that
> > > > implement non-standard behaviours. It starts in 55/72 by adding a new
> > > > devm_v4l2_sensor_clk_get_legacy() helper function for those drivers,
> > > > similar to devm_v4l2_sensor_clk_get() but with a few more quirks. This
> > > > function should not be used in any new driver. The remaining patches,
> > > > from 53/72 to 72/72, use the new helper in drivers, interleaved with
> > > > drive-by refactoring similarly to the previous part.
> > > >
> > > > Before this series, with Mehdi's series applied, 29 drivers read the
> > > > "clock-frequency" property and 18 drivers set the external clock rate.
> > > > With these series we go down to 1 and 3 respectively, namely the ccs,
> > > > mt9p031 and mt9v032 drivers. Clock handling in the CCS driver is a bit
> > > > more convoluted so I will leave to Sakari the honour of dropping the
> > > > last direct user of "clock-frequency" :-) As for the mt9p031 and mt9v032
> > > > driver, addressing the issue there is more difficult and likely not
> > > > worth it.
> > > >
> > > > [1] https://lore.kernel.org/linux-media/
> cover.1750942967.git.mehdi.djait@linux.intel.com
> > > >
> > > > Laurent Pinchart (72):
> > > >   dt-bindings: media: Deprecate clock-frequency property for camera sensors
> > > >   dt-bindings: media: et8ek8: Deprecate clock-frequency property
> > > >   dt-bindings: media: imx258: Make clocks property required
> > > >   dt-bindings: media: imx274: Make clocks property required
> > > >   ARM: dts: nxp: imx6qdl-pico: Replace clock-frequency in camera sensor node
> > > >   ARM: dts: nxp: imx6qdl-wandboard: Replace clock-frequency in camera sensor node
> > > >   ARM: dts: samsung: exynos4210-i9100: Replace clock-frequency in camera sensor node
> > > >   ARM: dts: samsung: exynos4412-midas: Replace clock-frequency in camera sensor node
> > > >   ARM: dts: ti: omap3-n900: Replace clock-frequency in camera sensor node
> > > >   ARM: dts: ti: omap3-n950: Replace clock-frequency in camera sensor node
> > > >   ARM: dts: ti: omap3-n9: Replace clock-frequency in camera sensor node
> > > >   arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Replace clock-frequency in camera sensor node
> > > >   arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Drop clock-frequency from camera sensor node
> > > >   arm64: dts: renesas: rzg2l-smarc: Drop clock-frequency from camera sensor node
> > > >   media: i2c: mt9v022: Drop unused mt9v022.h header
> > > >   media: i2c: mt9v032: Replace client->dev usage
> > > >   media: i2c: mt9v032: Drop support for platform data
> > > >   media: i2c: mt9v111: Do not set clock rate manually
> > > >   media: i2c: ov6650: Drop unused driver
> > > >   media: i2c: hi556: Replace client->dev usage
> > > >   media: i2c: hi556: Use V4L2 sensor clock helper
> > > >   media: i2c: hi847: Replace client->dev usage
> > > >   media: i2c: hi847: Use V4L2 sensor clock helper
> > > >   media: i2c: imx208: Replace client->dev usage
> > > >   media: i2c: imx208: Use V4L2 sensor clock helper
> > > >   media: i2c: imx319: Replace client->dev usage
> > > >   media: i2c: imx319: Use V4L2 sensor clock helper
> > > >   media: i2c: imx355: Replace client->dev usage
> > > >   media: i2c: imx335: Use V4L2 sensor clock helper
> > > >   media: i2c: og01a1b: Replace client->dev usage
> > > >   media: i2c: og01a1b: Use V4L2 sensor clock helper
> > > >   media: i2c: ov02c10: Replace client->dev usage
> > > >   media: i2c: ov02c10: Use V4L2 sensor clock helper
> > > >   media: i2c: ov02e10: Replace client->dev usage
> > > >   media: i2c: ov02e10: Use V4L2 sensor clock helper
> > > >   media: i2c: ov08d10: Replace client->dev usage
> > > >   media: i2c: ov08d10: Use V4L2 sensor clock helper
> > > >   media: i2c: ov08x40: Replace client->dev usage
> > > >   media: i2c: ov08x40: Use V4L2 sensor clock helper
> > > >   media: i2c: ov13858: Replace client->dev usage
> > > >   media: i2c: ov13858: Use V4L2 sensor clock helper
> > > >   media: i2c: ov13b10: Replace client->dev usage
> > > >   media: i2c: ov13b10: Use V4L2 sensor clock helper
> > > >   media: i2c: ov2740: Replace client->dev usage
> > > >   media: i2c: ov2740: Use V4L2 sensor clock helper
> > > >   media: i2c: ov4689: Use V4L2 sensor clock helper
> > > >   media: i2c: ov5670: Replace client->dev usage
> > > >   media: i2c: ov5670: Use V4L2 sensor clock helper
> > > >   media: i2c: ov5675: Replace client->dev usage
> > > >   media: i2c: ov5675: Use V4L2 sensor clock helper
> > > >   media: i2c: ov5693: Use V4L2 sensor clock helper
> > > >   media: i2c: ov7251: Use V4L2 sensor clock helper
> > > >   media: i2c: ov9734: Replace client->dev usage
> > > >   media: i2c: ov9734: Use V4L2 sensor clock helper
> > > >   media: v4l2-common: Add legacy camera sensor clock helper
> > > >   media: i2c: et8ek8: Drop support for per-mode external clock frequency
> > > >   media: i2c: et8ek8: Use V4L2 legacy sensor clock helper
> > > >   media: i2c: gc05a2: Use V4L2 legacy sensor clock helper
> > > >   media: i2c: gc08a3: Use V4L2 legacy sensor clock helper
> > > >   media: i2c: imx258: Replace client->dev usage
> > > >   media: i2c: imx258: Use V4L2 legacy sensor clock helper
> > > >   media: i2c: imx290: Use V4L2 legacy sensor clock helper
> > > >   media: i2c: ov02a10: Replace client->dev usage
> > > >   media: i2c: ov02a10: Use V4L2 legacy sensor clock helper
> > > >   media: i2c: ov2685: Use V4L2 legacy sensor clock helper
> > > >   media: i2c: ov5645: Use V4L2 legacy sensor clock helper
> > > >   media: i2c: ov5695: Use V4L2 legacy sensor clock helper
> > > >   media: i2c: ov8856: Replace client->dev usage
> > > >   media: i2c: ov8856: Use V4L2 legacy sensor clock helper
> > > >   media: i2c: s5c73m3: Use V4L2 legacy sensor clock helper
> > > >   media: i2c: s5k5baf: Use V4L2 legacy sensor clock helper
> > > >   media: i2c: s5k6a3: Use V4L2 legacy sensor clock helper
> > >
> > > If you are planning a v2 version of this patch series, please consider
> > > incorporating the following improvements:
> > >
> > > 1. In the imx219 driver, you can also replace direct client->dev usage.
> > 
> > The series doesn't touch the imx219 driver. The patches that replace
> > client->dev usage were meant to simplify the other changes. Additional
> > client->dev removal should be done on top (and likely through all camera
> > sensor drivers in one go).
> 
> Okay, great
> 
> > > 2. In the regulator code, you can reduce boilerplate by using
> > >    devm_regulator_bulk_get_enable().
> > 
> > devm_regulator_bulk_get_enable() doesn't seem to be a good idea. You
> > generally don't want to enable power everywhere unconditionally, and
> > sensors very often need a guaranteed power up sequence.
> 
> The regulators are optional, we supply power to the camera sensor directly
> through dedicated power rails and there is no strict enable sequence 
> required in this case.

What exactly do you mean by "this case" ? Are you talking about one
particular sensor ? One particular camera module ?

> However, if you feel it's better to retain explicit handling for clarity 
> and flexibility, I’m happy to stick with the current approach.

-- 
Regards,

Laurent Pinchart

