Return-Path: <linux-omap+bounces-4143-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF79DB10BAC
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 15:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC206178DBF
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 13:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDC32D948D;
	Thu, 24 Jul 2025 13:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2inEA0T"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CEA1386DA;
	Thu, 24 Jul 2025 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753364250; cv=none; b=e+gyT0hX6oYidYZb7ScEazJOshdYxmQdLmpfvzL0AS+oguI+Xp8c1NamWCQIFMX0eNJHnElNAN3BUL/z7Rj+db2l70dgYKpKTNhxKAg4EdXsgr3LDx/lH0DYvrcRHRG3wvsfM+8ik6S7rTDMllFlCmCB2rgmAYt+WhnQkeyxNyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753364250; c=relaxed/simple;
	bh=kXotk+okteeCQ0RJBs23AzOIkyneq/zYLkUenh1S6tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXP4eTkyGdONQ9Oo8gY8SUfuc9H4XojvZ1MDiYZi9DpzDH2lffz1fUFSIgtw/Ke8UryBfDZ3Oh3tb7tXB2GkiKIajSkVT74Ccb6JvjvfC0VVK7s3OvGNDInQ0kysXyH726udPrMdEisDW9QFMFQfuW8ShnqXTyrKgEK3Ab/G/Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2inEA0T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB163C4CEED;
	Thu, 24 Jul 2025 13:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753364249;
	bh=kXotk+okteeCQ0RJBs23AzOIkyneq/zYLkUenh1S6tM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2inEA0TsfqJJgqci8QRcJudT4AAJlZ0bRODJvhUYqZGL4Hxotnm+Df70M4fAUt+S
	 aSQ7NZhp4cY7uz+06XoUD8y0nlBI+oAD2WvQTMB0WGIMbAqNTUH/XXdR0WNGd8HAr7
	 qjv0KwBEiJIDYzCyQKWW0e5OF5BaEgN9SP0x7TZjxjbIu53Xz0YK28cWMV6OIlzdpW
	 K8QM9pN5K4MVNo49V978oKACJTSJXL3Bf3XD742TDLBvw5wJq1k4I416lSFv5qux89
	 ZeUBFNst65RhfGLX/tHnRCvk8JYRwd4nRoY52YK0uZL7AfftSkgqHoxPa9fcxB18uh
	 VpcSWXZnRskGA==
Date: Thu, 24 Jul 2025 14:37:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
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
	Matthew Majewski <mattwmajewski@gmail.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
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
Message-ID: <b23f1603-8682-46d8-9eb6-d017f1be081f@sirena.org.uk>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ufe5/KuOroOWejBo"
Content-Disposition: inline
In-Reply-To: <PN3P287MB1829C9E8C78ADD70259A68F08B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
X-Cookie: Did I say 2?  I lied.


--ufe5/KuOroOWejBo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 24, 2025 at 01:24:24PM +0000, Tarang Raval wrote:

> > > 2. In the regulator code, you can reduce boilerplate by using
> > >    devm_regulator_bulk_get_enable().

> > devm_regulator_bulk_get_enable() doesn't seem to be a good idea. You
> > generally don't want to enable power everywhere unconditionally, and
> > sensors very often need a guaranteed power up sequence.

> The regulators are optional, we supply power to the camera sensor directly
> through dedicated power rails and there is no strict enable sequence
> required in this case.

Those dedicated power rails getting their power from....

--ufe5/KuOroOWejBo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiCNwsACgkQJNaLcl1U
h9BKWwf/d7kwgTILe2LgJL8LW/PyE6HHWWT9OLZ9efXIuFyBtRGSOTPoeL7ajshi
e/2Xhvg9hGQEmne45bJkrdXKab7z7tqSG/ZB3NzM1BZx16Htk2R/5yAQW+Yno3bP
z8sbs8YbPR67QDKGUXpw3Az8GRUsiM25uvdQ5GAxNZfF093brnUGnVn+BSJ03l0l
8RQjGzwWnK8Jb9LymfsLuIIQVwlHdwgUqCT0VxnuLh0tcMgooyR94Wov/6MSr96+
cA+gdiYqxLPOgiYKvjwQgoMFKIGCPoBtPczzFS6ExmBBQZx7JWTMF7/eqKui/ZCo
w0YDLakGJSG5TZ5LF4mspWPlde5BJQ==
=FeNU
-----END PGP SIGNATURE-----

--ufe5/KuOroOWejBo--

