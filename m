Return-Path: <linux-omap+bounces-4146-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB015B10D88
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 16:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EA41188A696
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 14:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE982D5C97;
	Thu, 24 Jul 2025 14:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fug8i0k/"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3211A2B9A4;
	Thu, 24 Jul 2025 14:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367219; cv=none; b=VyRxtiRhBzs6bdyR5dL2PgRFnxwe7AGMZEbT/g6z6c7Co2UZMiZ++xnpB+AcE2MQjz8ffYLD33A16VrrVvrlrYkB0w9T2tjxwNzT1l0mNvjfNC3INq74DIHO6lJf1sW5U05r3qsAVsyA4ReoD8CRgLbrmNRT/2N/t7ek0IJAWW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367219; c=relaxed/simple;
	bh=/mTpAYJZIChae6AuIb4zYbBCuGkZjQnXLcnDiVJKu24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xy8Jzp0zUj1cyNSeuBfnxnPj6Ng0ZULUQrG+xJEhQPQ3T3Jsx9z8Qt/94y4E2uWC3qHZiWSC2O3aFHAwEsNaiX9RWu+EyDlpQqwufAdSIILqh7RLhAWowUF2A2l0LzIpafwR1UCOedyWj6rBvEof4+xj/V1Jqrdm7mWMUoim4z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fug8i0k/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B59C4CEED;
	Thu, 24 Jul 2025 14:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753367218;
	bh=/mTpAYJZIChae6AuIb4zYbBCuGkZjQnXLcnDiVJKu24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fug8i0k/gTKVhdXpopvBZdt1z757T/Tv7qNmHK9F6ryN97vrU1b39mc5nmlUB2mHv
	 lcsJYQElzOCIUbidT5jdY4Oe/IcEz2HPdNBndZPPQA7WwGbWFn+Bz2899x7eMy26RW
	 IlQ1Ah0B4Q1KQEx6vCHL9uR+9cBfV6g22HlbyGgmoPWd+RGfyUYG5tmSwwz7k8msQ9
	 NxHY55itKVIJUnDYdybY05M2vENhQ6tVQMsH+I4PU1vxixI3F354pzEK9HNY45OrEH
	 HU619r3sjxlOp7iPsxvuEOuSDumDpZ+pNaHM6iXv5sJvE3ju96+haAXEbNRcuN2pii
	 ZRkCYw3IILAbQ==
Date: Thu, 24 Jul 2025 15:26:45 +0100
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
Message-ID: <14a11ee9-7c73-437a-8863-3bdf0d689d1f@sirena.org.uk>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <PN3P287MB1829DD1254FB74391A750F498B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724115202.GK11202@pendragon.ideasonboard.com>
 <PN3P287MB1829C9E8C78ADD70259A68F08B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724135259.GR11202@pendragon.ideasonboard.com>
 <PN3P287MB1829E1FEE7D2468CE9915C778B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iTUyow5I8MkDvfop"
Content-Disposition: inline
In-Reply-To: <PN3P287MB1829E1FEE7D2468CE9915C778B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
X-Cookie: Did I say 2?  I lied.


--iTUyow5I8MkDvfop
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 02:20:10PM +0000, Tarang Raval wrote:

> Mark, depending on the hardware, the power rails could come either from a=
=20
> PMIC or from a regulator controlled by GPIO, but I=E2=80=99m talking abou=
t the always-on=20
> PMIC case here.

All of those things are regulators.  My point is that a supply being
optional means it can be physically absent from the device which does
happen but quite rarely.

--iTUyow5I8MkDvfop
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiCQqQACgkQJNaLcl1U
h9CyzAf3QqKeu0SQq54wYoLYPnKHX898ZbOzZ7bgwiBqi81x6Kmu7Tfl59xEjk9q
nsSMPACIc8uzvCmF3bWeVnIuOZjIIzZ3un/vFHlI7ePcknsXolKLnKtKDJWU+xBq
3nLQAPaSykpV1O16tM1JHhb+gNCH1MRP1UwS6JVL5gdAGSzkP5Kem0EIsvrLTVPZ
Z5jxe9oJrsVj5sZNvrVJByurlEe9ig3Yb0SK1m7yVWhesVKy/o3h/IehIWIteut7
yEFcSyS5Gz7HCJqSo6ka7Dglj5P62lWENhGw0xOcKO9v/qUnvkfk/o9A16IPtZbI
JRSFeQ4vFjPW0//oJr31tv38zDfh
=We6T
-----END PGP SIGNATURE-----

--iTUyow5I8MkDvfop--

