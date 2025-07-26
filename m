Return-Path: <linux-omap+bounces-4154-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B8CB12923
	for <lists+linux-omap@lfdr.de>; Sat, 26 Jul 2025 08:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81488AA7189
	for <lists+linux-omap@lfdr.de>; Sat, 26 Jul 2025 06:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60FC202C50;
	Sat, 26 Jul 2025 06:17:39 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021073.outbound.protection.outlook.com [40.107.57.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C3C1114;
	Sat, 26 Jul 2025 06:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753510659; cv=fail; b=OBGnlBwO/W+r1MRPRjdEqJrjijS1Ps8kisfmnrXohM0fac7bCv4mnu2cmqksqdc6sNagrFOeu+2hpV8dxgpaNhztIj7oT+7yiZrKi6R3au/HO15O0udDT6XGbURQBm3w5sR/+hVDnAU0/3DG/POtz6mb4J/wOwsF9fu6UP+bJ6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753510659; c=relaxed/simple;
	bh=7ukUH302t9dK0ufohkXW77O0HOPy2fwvl73hKeWg2Cg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f6IiqQJsnYo7vN6z8K1Hv1Wh2qlcI6+vdrgX0A59UsDPnqJOOMgCHGooQBHZEnyAJ1ViV9C5v2F2n8jryQOifOG9Wcricuc6HYXs/I60DtDO49SYrihgPNgB3KKFrcXOAP5RNgZM1D6FKywJELBqY5D8iopEUfnmHIlSs1vA4uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPMxqDAJ+nFAVsr0TgdS5sGBW3nqlJDlgAcOCjXO7f8PvnRnjs5muBsVwdl2bsd8vg7D5X35E2iv7KFpemeWDk/2LWuOVexqf3ArocCumU6WiAz33GbQ/gVpy16QeRkuzx2dtWhUzDlUogjPTr9yS9xSo0X2EGMV+Ka+nJhEp8okBoIaeaqHdy6EYqUaZuhZPtYCwacwr7Q2n2ikrVr200S5rhFEyLK1xxTJQcct3ROe24Ztk4JtoFluHieXEUoygALat7HnZ2j0caleAt+CWMmFU2BrnkYBoI8zCt4L3L/vTBRXvd74XNStPi3INBqqDrDUTHUU/mAHm9MmWnTRMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ukUH302t9dK0ufohkXW77O0HOPy2fwvl73hKeWg2Cg=;
 b=CvdzqNMcVi3QnCQWc8DXYqHS4hGlqvveeUFlUsMl/dsPVCuJt2AN9sgYUu6fYfZLUwNG8jDSKkNrtfkQMgEgLq0OTcfmJjvJU+giC8usbskG1rVvuFizc4kDpfDaTt9Pyjc/46435MLeCVLKXnsUf1sWhVXCVLpInVa1Y1Rfokf8WrnQGmP/Ba4bt8KJDLXGrNgBPg3d7FICYZyvYSsX2l3/gEXgX2ueqwKpa1TsWnJ8Cy9umvB3FBnvTsHJjzp15aH53tcPjg+dr6LPvXZoKYMndlzFabj6prNoVg3jHttdly5QcUIMXVB1IW3nqpepewLRqP+TcbK3dimlSBp5Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAYP287MB3739.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:150::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Sat, 26 Jul
 2025 06:17:30 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8964.023; Sat, 26 Jul 2025
 06:17:29 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Mark Brown <broonie@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Alim Akhtar <alim.akhtar@samsung.com>, =?Windows-1252?Q?Andr=E9_Apitzsch?=
	<git@apitzsch.eu>, Andrzej Hajda <andrzej.hajda@intel.com>, Arec Kao
	<arec.kao@intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bingbu
 Cao <bingbu.cao@intel.com>, Bjorn Andersson <andersson@kernel.org>, Bryan
 O'Donoghue <bod@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Daniel Scally <djrscally@gmail.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>, Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Hans de Goede
	<hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Hao Yao
	<hao.yao@intel.com>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jacopo Mondi <jacopo@jmondi.org>, Jimmy Su <jimmy.su@intel.com>, Jingjing
 Xiong <jingjing.xiong@intel.com>, Jonas Karlman <jonas@kwiboo.se>, Konrad
 Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Leon Luo
	<leonl@leopardimaging.com>, Liam Girdwood <lgirdwood@gmail.com>, Magnus Damm
	<magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Matthew
 Majewski <mattwmajewski@gmail.com>, Matthias Fend <matthias.fend@emfend.at>,
	Mikhail Rudenko <mike.rudenko@gmail.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, =?Windows-1252?Q?Niklas_S=F6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>, Pavel Machek <pavel@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Ricardo Ribalda
	<ribalda@chromium.org>, Rob Herring <robh@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shunqian Zheng
	<zhengsq@rock-chips.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Tianshu Qiu
	<tian.shu.qiu@intel.com>, Todor Tomov <todor.too@gmail.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, Tony Lindgren <tony@atomide.com>, Zhi Mao
	<zhi.mao@mediatek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 00/72] media: i2c: Reduce cargo-cult
Thread-Topic: [PATCH 00/72] media: i2c: Reduce cargo-cult
Thread-Index:
 AQHb8cLi1z5mGUN1NkaS3NoM5ohUK7RBNANAgAALMwCAABfMAIAACf+AgAAFhHOAABmSAIAA/hWQgABffwCAASZizQ==
Date: Sat, 26 Jul 2025 06:17:29 +0000
Message-ID:
 <PN3P287MB182926629766BC0E506AF1C58B58A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <PN3P287MB1829DD1254FB74391A750F498B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724115202.GK11202@pendragon.ideasonboard.com>
 <PN3P287MB1829C9E8C78ADD70259A68F08B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724135259.GR11202@pendragon.ideasonboard.com>
 <PN3P287MB1829E1FEE7D2468CE9915C778B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724154414.GE22016@pendragon.ideasonboard.com>
 <PN3P287MB1829FC781EA3A94E0B8F16B98B59A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <aIN6DnXudHqaYXB2@finisterre.sirena.org.uk>
In-Reply-To: <aIN6DnXudHqaYXB2@finisterre.sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAYP287MB3739:EE_
x-ms-office365-filtering-correlation-id: 6dc1e4da-936f-4659-2048-08ddcc0c19a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?B2AEs+4xurFItcsUSXSPioeAchJsezG5o6hfZMaNep5jTOg/IoMxgY8/?=
 =?Windows-1252?Q?ArnEMnuy9NNIbbgeqqggtHsBI7wwQJ7/dyBoR5mmlZ/DDo41SwtNCvOx?=
 =?Windows-1252?Q?0HdRoA9G9F9jQrQqNY/bAa5JI4i2f+yfYt6PHAKt8Vra5eDq7tLvgPQq?=
 =?Windows-1252?Q?l9WgaqiHyljpEdHMU0OUOSyXwGEaFrVrpunYCfYw4c7vfcj1+ljdB7Wr?=
 =?Windows-1252?Q?7AFpc3VLFPCAdtu03p2gUXrIKJamdW2gwVKe5sdMBA9q2UYfHHK+J20Q?=
 =?Windows-1252?Q?sCRHywIe4Z9EvlLE2TeZuFCBmrr5/ygd9D1007xcFCfyeE2PDiEiFEMD?=
 =?Windows-1252?Q?twfIONm3YSBiAwiYb0EepZpfhPpfUNWP3mYZxoJklScToj7PF4p9VYxi?=
 =?Windows-1252?Q?uC4AfSLmfOnac7MymMJ0arlR/e+FJsc81BS+Axpde+FsxxxNXeDWtCc2?=
 =?Windows-1252?Q?vccCUaMGM1UhIR5s1Y2eUrENQ2HuvCb5dFl81eoP2xT4ETdUJcXXsnmX?=
 =?Windows-1252?Q?bQGleHki6RGkcX7nAlTctbCbSN0gfVuKGJ6YC/q7MzH/efy+I5snAUch?=
 =?Windows-1252?Q?r3YmXfSQZSzUDhMuHYZJxwd+2i3nWAMorqHrxwFH/uBmB3DKv0eHFe/p?=
 =?Windows-1252?Q?/a5mGR/Ywz4g2KI4RfOyEmuC7+b6RT9D1f03rZ46XhF8K/TuLN7ltN0u?=
 =?Windows-1252?Q?UDYfLWePTMCMJUTWZH+xOGNzHmz5JrjJPYQp447UpwVvzBi8MnjqP7ic?=
 =?Windows-1252?Q?0yqM5eXgywD8/nm8Zb4/Uwm+M+xF0fWnjJT2eB7B1zUfUXZadG0iUbg+?=
 =?Windows-1252?Q?4IBgyWq5J0+6dbqSnFeqpRdrq6PXrtwoEBflz+DZxkbVYX142BszBHkQ?=
 =?Windows-1252?Q?2uOLsc9N6XMqiaAo5hxEvv7HeOzILeRje4d3WBDnri9BVs5PNj0qkJHc?=
 =?Windows-1252?Q?bvg0rZH5rJwbtxtwQlS7rRB3Xn7gjS1PLyQF7P01sIQDASgYAH63h0Ka?=
 =?Windows-1252?Q?Mfc2OGOZdIJisNxjsbtXBp6xswqtGWU9W3OPhRBy9a9EP4OJCi/YHW0i?=
 =?Windows-1252?Q?PzUXA1v+LN/+MSXZ7bB5JbJOkakzJ1K8AgTd45lnN9fb1NPLjfMxqPvY?=
 =?Windows-1252?Q?AQIk39mqT0rQGsOZgUsrDjcm/C3uBlVKjoX82ikDKyklyxdj9f2V52/j?=
 =?Windows-1252?Q?Q+Vi9qYNRKG2pSvJrsTd92aykAWAIvjXghHkvyJaNkQvYEE1YwHaJela?=
 =?Windows-1252?Q?iRrfl8z7n7H8C4MeoZu9AeV4Hr/2q8WZakfM86847ZFrm/QmFnTSgCUm?=
 =?Windows-1252?Q?pTuJBlASEu3owqT2TzrsLkHt/GgVwhBDNk93dNuR1+gEFY+tkcQ6mGMp?=
 =?Windows-1252?Q?Xij5ha0OhhtI0lQqamR+V2Lcb9qIBzJaWVpUwu+a7smxY2Hc+9i5FV7+?=
 =?Windows-1252?Q?YTAdFjcEOKLZiSDe3XPE8GXC7vvvvgCfswRfGgf4h7V6HxpYZcmIG8He?=
 =?Windows-1252?Q?mlewatRjUpaavDFU12x+gu6jVXXVYZzqg+cNVE0Bd3ShnzB8BK1ZghFZ?=
 =?Windows-1252?Q?FY4TixdN/hs0brPQ1aXBsreD2VgxichbGNBWsQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?06YCfefU5miru5E2t/j1WViDexcciEXFXV2sxuPFzhAglnjuaujQLke1?=
 =?Windows-1252?Q?6Kxw3MCY7aMVX/EQgvnYZAbai/KMoNb1Oezy6j6xTwBacCOOjVNB2aeU?=
 =?Windows-1252?Q?Wy45DgP7HpEXDzxOHSiEDnGas4zaxx185kBlmvLWDb5fwDBAZVyLjc6F?=
 =?Windows-1252?Q?h9MJBaGuYy99YXi8lvMUEz7Nxl8FOsq0AMaKERVkHCa+5lJUnUljSjYw?=
 =?Windows-1252?Q?el8FhN2QBVXrsK5D9bbCLP3je53Eiv7Vxv++2Z4Xj+NDwHy4cu+KoTlY?=
 =?Windows-1252?Q?FaMBjRPm5cNjZ00BRDXb3+RX99OEALD4kKdwJ2CgrdjXCce2PueiFISQ?=
 =?Windows-1252?Q?uAr5TSirDpqIPLsChARgcaXeDfLF+zQow1gqH3bLxltgHVO7zdexHjEc?=
 =?Windows-1252?Q?hDa4V7W9Mo6AeILq7ZHuVdW5QAAhetWbRinlvohmzeujzw8heTrnzkj+?=
 =?Windows-1252?Q?7rEmh8HZoy4JugBlyrW2laomCBbyTDTsaXBb3UmgZM3ommuH69+fV4Ng?=
 =?Windows-1252?Q?1ogB0sXGJ2f4UDXF43wRYBIFD5A/u51BUu1yuygDwWbVQwqrSTcPMgZV?=
 =?Windows-1252?Q?gsaeAb+UYIHW8HlfGnb+vShjZXkoWLHxSFgDXpq7oYB67FbR9XP5fmvn?=
 =?Windows-1252?Q?p650jmvh8rEkwAER37LP1Mm0Mu75bqCzKMQuCR8DDqxrFaDjThZKeN69?=
 =?Windows-1252?Q?wviTNo2WgoV8V0zgrwVJw9cUPVp79qBP6AGLvZHADPMX8Q9QKITwbe9u?=
 =?Windows-1252?Q?w5hQ2Iu1juLiYCnTmQKreMDT5QuqNL/zpsXRJ8yrxBmCrGgO2bnJ06Rp?=
 =?Windows-1252?Q?WZdALU6rIDVBLp3CMC/odYUnDqOi2WzgKp2Hx4G7WvjvdJU6olh/DcNy?=
 =?Windows-1252?Q?Baqyq8prptFmrX5tgWno46/kGFQMNRSpS+xn+CG9Dwtj3gHtJ9GqEbhr?=
 =?Windows-1252?Q?/eWej57cFlXAV3gWpmXA/5I4XKr8Mom++/t5foSttgS0m6rtaV/RLm5r?=
 =?Windows-1252?Q?Mv2uD7IpnkFeTlXXRHORp+s/bP/nrA6K5TsKa8IMci3h+sNdPoHq8rHT?=
 =?Windows-1252?Q?Mpt9k6yZ03aM6ptZHWmTov5VuIg8YMW88AJ8hb7RUBhvPfeBOWmknNX7?=
 =?Windows-1252?Q?Qn4mesRD/LR9P+YgueBxQN74leoAoDJD53jVHuZOlttWlyoaJQW7E3r2?=
 =?Windows-1252?Q?YcvdZfx811t74ySRmAx4x/3JcxGw4o9blg4AtB0DAr4frxBycOcqrQHB?=
 =?Windows-1252?Q?Gza62Yp9yGMRErlb94WSui9MRQLHxD95d5AH+oYQggkfTfmw7FYM+jVH?=
 =?Windows-1252?Q?ewNKF7jgRH1OpcPXxC0zizwCSVZCd5zZQGJmIJUrorwBs54P20K5SEQc?=
 =?Windows-1252?Q?I4Gxy3rX89OpbTIFb6BY8sHuduor33TaF7/ha67sVGiGzWsUSxV8U8/B?=
 =?Windows-1252?Q?Kxsoa/K+0jp1fHVaadyCx11syaTvXvf2xwU9t8576otMuKVDRKUfsfMJ?=
 =?Windows-1252?Q?PiawyUAI/j/V9DmtVO4P73Ln6y4sm5aCtw6/ruNM2W0LPhJX05ci8PJC?=
 =?Windows-1252?Q?Y2/1qSutUy0w34srxUCH6P2dk0EQE/JFNvROyN9xCnLljMQf9joYg5Vi?=
 =?Windows-1252?Q?nzadTAtJL5S+Lk0KQWQe3NhW6r1QKyLU3LfTDm23u9MlXeIcSjjXn9hJ?=
 =?Windows-1252?Q?0j8jrZJ+obU2slvFH9Dgds98rBFoBkLW?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc1e4da-936f-4659-2048-08ddcc0c19a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2025 06:17:29.7959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s7VhihaOKupwyyVYbi8/JHPfdk1qdSg33iPtpzsuXbwr6+BeTJwk4GeyUu7x/8fNItltWgxlllMsUmxYa4jvjh94y+zMnKiMndLQbkVQQ2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3739

> > The sensor driver typically determines this via the presence (or absenc=
e)=0A=
> > of regulator supply entries in the Device Tree. If a supply is not defi=
ned,=0A=
> > it's assumed to be always-on (e.g., provided by the board via fixed rai=
ls).=0A=
>=0A=
> No, this is broken. =A0The driver should unconditionally request whatever=
=0A=
> supplies the device needs.=0A=
=0A=
Yes, that=92s clear from Laurent=92s explanation:=0A=
=0A=
"A sensor always needs=0A=
 supplies, regardless of whether or not they're always on. Drivers should=
=0A=
 get the supplies with regulator_get() (or possibly the bulk API)"=0A=
=0A=
Thanks, Mark, for the clarification.=0A=
=0A=
Best Regards,=0A=
Tarang=

