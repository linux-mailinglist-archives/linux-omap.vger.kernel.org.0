Return-Path: <linux-omap+bounces-4199-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BC7B2221E
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 10:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA35517BADD
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 08:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03A52E5B32;
	Tue, 12 Aug 2025 08:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C3aucEYb"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FE22E5B11;
	Tue, 12 Aug 2025 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754988701; cv=none; b=UFgyMBNFBfGbxIDrV1wXBdsoEaabvuyn0ja67RLcSnVr7pRhb8Ar2sQF/YWhGATrYHk3RTrfDsUTbxCQshT/bt3PbQegw2pgTlXYN+MUvNEdK2iLXL2tZOaOqbPekjoEIw2XhiMh92IJjTTNzyEJ9YJPdyTgSjj1eNx6SSqIFuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754988701; c=relaxed/simple;
	bh=uWunz3Mv4f9pwZDDQLQYeUZk+J7flLykw7MQNQ5U70Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j90kGCFKlORB30OCIT91C1e0sMx5BVpYo4Qd8nYr3QZ9AXgujLpZLHipwWB0HlODpF+XXyf8w/P1jluX5WDrBWqQphlYXPRWarZto/C/TcEA+t8LVObCSALS0EI0oEAXIC+SasGYB6b0gIKsxlCKGTnStyygz9qFo9AYL55AFAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C3aucEYb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 58B6C228;
	Tue, 12 Aug 2025 10:50:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754988638;
	bh=uWunz3Mv4f9pwZDDQLQYeUZk+J7flLykw7MQNQ5U70Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3aucEYbV0P7yp/axUQALhXq6bp8VBvc2J2Y7oxywS2DT0wkQcULimUysw6t2Wj9A
	 02yqs0eGLRkh/tHSmaR/e3cSXgz6j1mowZZ/U7BJU1Gh9rA6wq0grt3RYB9zU7naYg
	 AJwsTgVjQMR+YPXtsC5u0TEPyDTgoszJVunGgoA8=
Date: Tue, 12 Aug 2025 11:51:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
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
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Todor Tomov <todor.too@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tony Lindgren <tony@atomide.com>, Zhi Mao <zhi.mao@mediatek.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: (subset) [PATCH 00/72] media: i2c: Reduce cargo-cult
Message-ID: <20250812085112.GH30054@pendragon.ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <175495482477.157244.17354544707184168458.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175495482477.157244.17354544707184168458.b4-ty@kernel.org>

Hi Bjorn,

On Mon, Aug 11, 2025 at 06:27:01PM -0500, Bjorn Andersson wrote:
> On Thu, 10 Jul 2025 20:46:56 +0300, Laurent Pinchart wrote:
> > This patch series build on top of Mehdi's introduction of the
> > devm_v4l2_sensor_clk_get() helper (see [1]) to drastically reduce
> > cargo-cult in camera sensor drivers.
> > 
> > A large number of camera sensor drivers directly use the
> > "clock-frequency" property to retrieve the effective or desired external
> > clock rate. This is standard behaviour on ACPI platforms that don't
> > implement MIPI DisCo for Imaging, but usage of the property has leaked
> > to OF-based platforms, due to a combination of historical reasons (using
> > "clock-frequency" was initially considered right until before the
> > introduction of "assigned-clock-rates") and plain cargo-cult.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [12/72] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Replace clock-frequency in camera sensor node
>         commit: 5433560caa5e7e677a8d4310bbec08312be765b4

I'm afraid that's too soon. This will introduce a breakage without a
corresponding change to the camera sensor driver.

I will post a v2 with the patches reordered. We could merge the V4L2
side in a rc1-based stable branch and merge than in the arm-soc tree as
well, but I think we can also delay the .dts changes to the next kernel
version. Do you have a preference ?

-- 
Regards,

Laurent Pinchart

