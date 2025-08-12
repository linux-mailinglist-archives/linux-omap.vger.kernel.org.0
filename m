Return-Path: <linux-omap+bounces-4202-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C42D7B22367
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 11:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 578F3188EC1C
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 09:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD872E975B;
	Tue, 12 Aug 2025 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pwLWRCZB"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EE92E8E0E;
	Tue, 12 Aug 2025 09:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754991578; cv=none; b=btJmrQwI8EdSArHrBzbXrV/2cA9rsrrBLp8tEmGiyvtRoqv9qE35y3irLirglIakloCV+VKUQwyfuLrPy1qP/YT5j3cMWwJ6D55nblPqCL6EtZS49NtG0ZtJ9TbiX7Rsn/JobKevtKzxUECeaHUXbTG3ghsOLD9Y6ZmZ/70H77E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754991578; c=relaxed/simple;
	bh=8yEQgzbMpg1th6gkmT4PUb/PSLZNKd1TBi+Gpd/s9tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qf/RbLZ0q8Rf6dT7squh9l2db/mR/FaMEmNAVmjY1feyKeQJ+JvbZpN+OvvFJEyqql1e+amWwsa/pD2oADKIROToW2V9TpBau6K0MaNhZGMVtBsIy4NElJlsSuoZwQbCbhBskBAqwk5EWqGquEnanK3XBlmJ0FVu/4EHjOjYVgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pwLWRCZB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 051BA16A;
	Tue, 12 Aug 2025 11:38:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754991521;
	bh=8yEQgzbMpg1th6gkmT4PUb/PSLZNKd1TBi+Gpd/s9tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwLWRCZBeGqbxZl/v8LLIqmae3UWD1uhVug0qkGMlewVXxenZwmj4h1lhN/Flc3nO
	 jQ9eLJECUAHbRt30k+/z7N2wQwuUQ4Y1gcm/aKtI0WCU927XhdU9JSzMDdUqwv5jL0
	 jcxXfYzCM5Y8ykxu1+mN71nqQUu+o8bJ3JreUS2A=
Date: Tue, 12 Aug 2025 12:39:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
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
Message-ID: <20250812093915.GI30054@pendragon.ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <175495482477.157244.17354544707184168458.b4-ty@kernel.org>
 <20250812085112.GH30054@pendragon.ideasonboard.com>
 <ca1f08c9-244d-482b-b719-c7997913f56e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ca1f08c9-244d-482b-b719-c7997913f56e@kernel.org>

On Tue, Aug 12, 2025 at 10:58:30AM +0200, Krzysztof Kozlowski wrote:
> On 12/08/2025 10:51, Laurent Pinchart wrote:
> > On Mon, Aug 11, 2025 at 06:27:01PM -0500, Bjorn Andersson wrote:
> >> On Thu, 10 Jul 2025 20:46:56 +0300, Laurent Pinchart wrote:
> >>> This patch series build on top of Mehdi's introduction of the
> >>> devm_v4l2_sensor_clk_get() helper (see [1]) to drastically reduce
> >>> cargo-cult in camera sensor drivers.
> >>>
> >>> A large number of camera sensor drivers directly use the
> >>> "clock-frequency" property to retrieve the effective or desired external
> >>> clock rate. This is standard behaviour on ACPI platforms that don't
> >>> implement MIPI DisCo for Imaging, but usage of the property has leaked
> >>> to OF-based platforms, due to a combination of historical reasons (using
> >>> "clock-frequency" was initially considered right until before the
> >>> introduction of "assigned-clock-rates") and plain cargo-cult.
> >>>
> >>> [...]
> >>
> >> Applied, thanks!
> >>
> >> [12/72] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Replace clock-frequency in camera sensor node
> >>         commit: 5433560caa5e7e677a8d4310bbec08312be765b4
> > 
> > I'm afraid that's too soon. This will introduce a breakage without a
> > corresponding change to the camera sensor driver.
> > 
> > I will post a v2 with the patches reordered. We could merge the V4L2
> > side in a rc1-based stable branch and merge than in the arm-soc tree as
> 
> You cannot ("cannot" as not following the process) merge drivers into
> DTS branch.

Ah, I wasn't aware of that. DTS trees don't allow merging stable
branches shared with other subsystems ? Does it mean that a DTS change
that depends on a driver change always need to be delayed by one kernel
version ?

> > well, but I think we can also delay the .dts changes to the next kernel
> 
> All users of DTS will be anyway affected and commit msg should address that.

Which commit message, the one for the driver changes or the one for the
DTS changes ? I plan in the next version to indicate that the DT changes
depend on the driver changes.

> > version. Do you have a preference ?

-- 
Regards,

Laurent Pinchart

