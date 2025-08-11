Return-Path: <linux-omap+bounces-4182-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E91CB21940
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 01:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1B426222F8
	for <lists+linux-omap@lfdr.de>; Mon, 11 Aug 2025 23:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E6028000F;
	Mon, 11 Aug 2025 23:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S48kvZrX"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FEE20FAA4;
	Mon, 11 Aug 2025 23:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754954848; cv=none; b=Ci0oFfhSKFY0VeH0N3LFtMCUtHZlN9Wo6X9z9KPlvxV53OpmLUgV87PnWhouJMGOdH/owK48OvGWoGgT4KgycDwMsvbVUvcp+gGfNNeG1d70sQHnVpE9n2VW8UBKammWh+QEV91LSPy0mkLxwrwN8ZdOEymv/pIbszC30ZVmeho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754954848; c=relaxed/simple;
	bh=4F0GRrehYPOcCThNRJA3iC3eYSb/ULzVTrykDE/yncE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qPnITE7pN1s//qaWdt+Sfdf1D6nebrk/fiATZ2L4nvMUlpp+k8SGbL6Q35k2pKFIedkC8hYzdsdZvoCZtdzyTc89roBQphyvADHu7kVfD1OxZSYf5OXHQeOkKtma5NoEi7i7m7mbQDnRHMurE0CBMvEpvrthx/cy9wlcNyn2ELs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S48kvZrX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22BC9C4CEF7;
	Mon, 11 Aug 2025 23:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954847;
	bh=4F0GRrehYPOcCThNRJA3iC3eYSb/ULzVTrykDE/yncE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S48kvZrXP9VG4CTt7zBeg/XgN0GTF0GdFwM4hjSAC9fJOFSMSEMM6GSLa/sj1MXBT
	 BrXJnP6polHMUDD1GFXtHQ7LPx5df1S73bSjNUYxKOUcwrbU07tn05FVm5uXGiiwtz
	 rFXk9sqdkIOhbj60mhNMpHdU4XiJoSMiOtEnRDENIui2baifWG4XayjC+1ljtbZJB6
	 6EREINkAwoY5slez1UqMiBrcVDTtiBECIuKEg6nsdqhsfSIdAxZ0w5GACJVe4WlKtV
	 bivlYiUkBOWRLjJA2M+IuT7ke34uVXbmnF7Eh7ZqjGBL4Qzps/G9DlWUJYoadCdKlH
	 oWccBbYIg68Lg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
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
	Hans Verkuil <hverkuil@kernel.org>,
	Hao Yao <hao.yao@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Jason Chen <jason.z.chen@intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
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
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
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
	Tony Lindgren <tony@atomide.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: (subset) [PATCH 00/72] media: i2c: Reduce cargo-cult
Date: Mon, 11 Aug 2025 18:27:01 -0500
Message-ID: <175495482477.157244.17354544707184168458.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 10 Jul 2025 20:46:56 +0300, Laurent Pinchart wrote:
> This patch series build on top of Mehdi's introduction of the
> devm_v4l2_sensor_clk_get() helper (see [1]) to drastically reduce
> cargo-cult in camera sensor drivers.
> 
> A large number of camera sensor drivers directly use the
> "clock-frequency" property to retrieve the effective or desired external
> clock rate. This is standard behaviour on ACPI platforms that don't
> implement MIPI DisCo for Imaging, but usage of the property has leaked
> to OF-based platforms, due to a combination of historical reasons (using
> "clock-frequency" was initially considered right until before the
> introduction of "assigned-clock-rates") and plain cargo-cult.
> 
> [...]

Applied, thanks!

[12/72] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Replace clock-frequency in camera sensor node
        commit: 5433560caa5e7e677a8d4310bbec08312be765b4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

