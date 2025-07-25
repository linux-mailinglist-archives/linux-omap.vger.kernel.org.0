Return-Path: <linux-omap+bounces-4153-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC87B11EC8
	for <lists+linux-omap@lfdr.de>; Fri, 25 Jul 2025 14:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22BF25438D9
	for <lists+linux-omap@lfdr.de>; Fri, 25 Jul 2025 12:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567412ECD07;
	Fri, 25 Jul 2025 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqrON0qH"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2E22EBDD6;
	Fri, 25 Jul 2025 12:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753446938; cv=none; b=c3MlaaKZpBMwaRXIv4CXT9L5Py0Cw5my7Wdbx8ug+uov8fDSgD9oPYo9FJ/ZVherK7Qua4d0bYSK/I3ovuVNVxGMIBeg70Sq4x+/bTuRHR0A1cw2l8Xal/ONilCplZ/+joF0iPbbp/Xn5gfEv2RcDEQ/2Y3ur8BIM6wTDDPkr5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753446938; c=relaxed/simple;
	bh=K6lhYOFk6FqHc5KGTJa0H9hdPo39Xa+YwkdswgKg/Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDJzx2CQB+oCEqZnU64EPaRpHJ56NFiU8sQjGmU8FcUHcxcfBTKbC49k4iC2CznGKQ3tGNJNMEGXxnVV+q4h+sw4iwEQnujIU0FFjDgr6BZMH2y9zO/ImRLrPQ5/UDVJONzfdA1xT9H4IPU2cLzFDCEK66bLy89sHPBvPtxXxA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqrON0qH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB279C4CEE7;
	Fri, 25 Jul 2025 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753446937;
	bh=K6lhYOFk6FqHc5KGTJa0H9hdPo39Xa+YwkdswgKg/Uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AqrON0qHGybb6yWX0+bT4DOdnrA/mk09GsdEcn0X1sXW9c5AIqf23HIEbLoR67j/m
	 j63CKTyReqqIIDJkTjbC1D17PSRLjeBzhC1Dd3AoN7nPF9PqoDPZbfr/lArD1p1mQS
	 VQGimphF7s17GydcxW6vIjQ9fjEtz618ZYISsTu/M96PBNUqlCCDqBpa/P3ffEKNJU
	 HmYgDF1q93vVwZj8Gsdz/9wNu9DYYEBznTk7XawtNKpAbTs9HpPTdgHVJSYc9zdB3z
	 Bp4Ad+eH69ISaUqtnyAabKNbyOrHVwomZqQYmZV7iKgHLml2Mf2l2u6OfyUhr8Gqos
	 WwZpazwV7+TWg==
Date: Fri, 25 Jul 2025 13:35:26 +0100
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
Message-ID: <aIN6DnXudHqaYXB2@finisterre.sirena.org.uk>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wxJPGBgsjwWJYupx"
Content-Disposition: inline
In-Reply-To: <PN3P287MB1829FC781EA3A94E0B8F16B98B59A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
X-Cookie: Do not cut switchbacks.


--wxJPGBgsjwWJYupx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 07:00:40AM +0000, Tarang Raval wrote:

> The sensor driver typically determines this via the presence (or absence)=
=20
> of regulator supply entries in the Device Tree. If a supply is not define=
d,
> it's assumed to be always-on (e.g., provided by the board via fixed rails=
).

No, this is broken.  The driver should unconditionally request whatever
supplies the device needs.

--wxJPGBgsjwWJYupx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiDegoACgkQJNaLcl1U
h9Bengf+NMIEHsQ9+sljtGVgIcOtgrR79nFpheWX7pGfItMxxmP7GSIOxGLN0ypY
ST0+Jq6SNod/0cZo4rpIVQmRrkYA0sPFp1r/mE7DQktfcLLpsbgtLp5BbDSLKV9w
DC+fSk/YPL5Ndorj2m77tkNiMADykQL7/tl5BTlGxZ3PbK1SwthJ0kyuXstPPGde
EbWLOMoEa8WwJ8WAy0VcrrCoTrenrocivl9bEZumrxgr1E3FBYiBtkYplaofKzl9
e2GIUDGSIn+aCFWzdxEqAGllKEGRkrCyHLIz0vnNrF/zbqQTlJO+KYeX1Onowvkc
ilP3T4bQ8j/S9g30VmVh/HJPwkAMrg==
=BxdR
-----END PGP SIGNATURE-----

--wxJPGBgsjwWJYupx--

