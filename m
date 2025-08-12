Return-Path: <linux-omap+bounces-4206-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08384B239CD
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 22:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D625C68351F
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 20:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBF72F0698;
	Tue, 12 Aug 2025 20:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S8nHmjS/"
X-Original-To: linux-omap@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E502F066F;
	Tue, 12 Aug 2025 20:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029443; cv=none; b=gP036ceeZ2d4XhDZ0oMTKnvzSW+Nl21yDC2+s3jpThzdf684T9rK31sjTBVnB+J/RkvgAQD9HyP6w22QOxOu1JijpqrEGNfEd+8fbalbvBlZS+kP/oNUFvhBWDe4HsSMya52EZDrbYEgxvmjmvGPEgTgzDlSQievvErH23il9/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029443; c=relaxed/simple;
	bh=y3/6BwugXLBKiQaYfKuU9CxTQhT3nKf7WIMviYHgs5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhPk3QCEEOUhg9qQ9h8VARVjhKpjTPiyaxe+gOqaUwM6uDjv3VG6txmYNIt+gQD1DZk5216ix99YCPuzKV35Ts+IhTVbfFI9ZL17PP65YHbWLg9W8LtK9vaZo2Lm7rn/fpXLY8r1ZRRuo2imcIjph0u3WgQyfit5mKrhEO6cPgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S8nHmjS/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A8CE7446;
	Tue, 12 Aug 2025 22:09:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755029386;
	bh=y3/6BwugXLBKiQaYfKuU9CxTQhT3nKf7WIMviYHgs5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S8nHmjS//v3WDOHDDPQx7XNg+fuw2xNK+9V0L7/Q9JK7KAPPNNlYGxa7Smck/BbXz
	 1FBdzu7Wn7BV16W9VEmOwxRHGoeANl3NYpiilOCdrgmnH+4qyCZo13MmvsNeDEL3jG
	 RvCD6A32cgVXBkCzW1/lobOwYjYwMMtkdiTLpHOk=
Date: Tue, 12 Aug 2025 23:10:20 +0300
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
Message-ID: <20250812201020.GB12797@pendragon.ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <175495482477.157244.17354544707184168458.b4-ty@kernel.org>
 <20250812085112.GH30054@pendragon.ideasonboard.com>
 <ca1f08c9-244d-482b-b719-c7997913f56e@kernel.org>
 <20250812093915.GI30054@pendragon.ideasonboard.com>
 <e91ed87c-7e2c-4c43-b405-ce3470697a2a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e91ed87c-7e2c-4c43-b405-ce3470697a2a@kernel.org>

On Tue, Aug 12, 2025 at 12:28:28PM +0200, Krzysztof Kozlowski wrote:
> On 12/08/2025 11:39, Laurent Pinchart wrote:
> >>>>
> >>>> [12/72] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Replace clock-frequency in camera sensor node
> >>>>         commit: 5433560caa5e7e677a8d4310bbec08312be765b4
> >>>
> >>> I'm afraid that's too soon. This will introduce a breakage without a
> >>> corresponding change to the camera sensor driver.
> >>>
> >>> I will post a v2 with the patches reordered. We could merge the V4L2
> >>> side in a rc1-based stable branch and merge than in the arm-soc tree as
> >>
> >> You cannot ("cannot" as not following the process) merge drivers into
> >> DTS branch.
> > 
> > Ah, I wasn't aware of that. DTS trees don't allow merging stable
> > branches shared with other subsystems ? Does it mean that a DTS change
> 
> Not with driver subsystems. Why? Because it breaks encapsulation of
> hardware description being entirely independent of given Linux driver
> implementation.
> 
> BTW, it is already documented in maintainer-soc in ABI stability (I will
> fix "devicetree" ambiguity to DTS) and driver branch dependencies.

I've just read that document, and didn't interpret it as stricly
forbidding merging a driver branch in the arm-soc tree. The rule makes
sense though, as it makes it easier to ensure that backward
compatibility isn't broken by accident. The downside is that it can slow
down merging patches in some cases.

> > that depends on a driver change always need to be delayed by one kernel
> > version ?
> 
> This is one solution, although as I mentioned later it still affects all
> other users of DTS, so it has its own drawbacks.
> 
> Other solution is to keep both properties for more than one cycle.
> 
> >>> well, but I think we can also delay the .dts changes to the next kernel
> >>
> >> All users of DTS will be anyway affected and commit msg should address that.
> > 
> > Which commit message, the one for the driver changes or the one for the
> > DTS changes ? I plan in the next version to indicate that the DT changes
> > depend on the driver changes.
> 
> DTS changes, so the soc maintainers can judge whether they care about
> other DTS users or they do not.

-- 
Regards,

Laurent Pinchart

