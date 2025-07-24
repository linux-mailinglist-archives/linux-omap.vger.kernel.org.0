Return-Path: <linux-omap+bounces-4138-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E05A0B1096C
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 13:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C75203BB8E8
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 11:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361992857D1;
	Thu, 24 Jul 2025 11:43:03 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021089.outbound.protection.outlook.com [40.107.51.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38B7283C92;
	Thu, 24 Jul 2025 11:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753357382; cv=fail; b=Bo99v5yb1hdSVrTozjmOZesZvOkynvYRNuntvgzsTsLJQJR2AXiwutIPJL09MOT7yFSL9D2W9sK8q0wajNCMuDFj4tysoPU30FcDZhWvWUyyuqZIbIYZE0PBjVzskaohrXTtdlBoFbdTliWB6f4DWkcwIWEOXRy4+cnt6zs0uVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753357382; c=relaxed/simple;
	bh=HGQGiEoIqORDcnaEpJIkJzKMPXtbMpqFC2H2v6k2W8g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jYWeIJLJKe/m1o6QwRvD/kiO9XqCR0PERJtfOK11inxTXKs0LnAwNIM2DbYYvDNbWib+xrdt3wj716dJWYI1rsAB4eAcKtWZn1WzyDHR7IspppP5wbFfSqJC1oJ9qisfkSqk43ffq53yfGY1aGq4kTKO+Dhz/w1RNECKQx7nw+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7Ho82zCxAPISKqOfVv11SmhwDKJ039bpScjOWb9K9CjtnemF8i99BYnvnx2/TzGfePsR6OIqCE7uDfhecSWBLUWactudM6n1jUyyyulD5DAUOz9/afxlUpODLMDTAz5YSM8X5ak87sSLVpUJ0GxdYzVmCxBOQRY9ZgD1gTsEFjSc088rUACdueTz0u069qHIGfLEyv8+1T9uFVk5bbJOLIZO4L950ItoxyNmNGALp29UlQjvNtWAmoG36qmwVyV7RcPXF/DiR66RGJjMmuqbLrYTyv2WIpfnKaqbeSjrYIy0gH1cfSusrT8APm6kqq+dzA1GOkkkPxL+cC0uLTdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBdinZKCymhF0xOwuDx1Un1lx9U33t8+mg8OPKjgENU=;
 b=ui2UITPunlr0SbZiMwjCpZ0hJaZFH+P/uitHWk3vgvNRde7Glm6axaGH1CP6DDGaOFOPB6Je8vgD83sUhJc4HH/6VmFl3w90N1fILqChXw5Z+UfDAz8qOBabkgY4rlXKllJyGQ0sZJwWleLg8jLX+qg1Q3r3w0w/33Hc5655SHmzCBpXkf6hvAwDcmaEmOpmC/tXaqPNf2nrdKovnueaUYC61Nc1uNOHCKWiEwL4DIcQChdSNlkVgMglqTkfeKN/YDwz3RARGgSx3f6L6Z9aZZHMlYx9F+d5J10DstAznt3/F/kWJusu7DCfvgdQ0dn9LHXO1jSh43OFnwE7s7kotA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB0266.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 11:42:55 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 11:42:55 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Alim Akhtar <alim.akhtar@samsung.com>, =?iso-8859-1?Q?Andr=E9_Apitzsch?=
	<git@apitzsch.eu>, Andrzej Hajda <andrzej.hajda@intel.com>, Arec Kao
	<arec.kao@intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bingbu
 Cao <bingbu.cao@intel.com>, Bjorn Andersson <andersson@kernel.org>, Bryan
 O'Donoghue <bod@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Daniel Scally <djrscally@gmail.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>, Dongchun Zhu
	<dongchun.zhu@mediatek.com>, Fabio Estevam <festevam@gmail.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Hao Yao <hao.yao@intel.com>, Heimir Thor
 Sverrisson <heimir.sverrisson@gmail.com>, Jacopo Mondi <jacopo@jmondi.org>,
	Jason Chen <jason.z.chen@intel.com>, Jimmy Su <jimmy.su@intel.com>, Jingjing
 Xiong <jingjing.xiong@intel.com>, Jonas Karlman <jonas@kwiboo.se>, Konrad
 Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Leon Luo
	<leonl@leopardimaging.com>, Liam Girdwood <lgirdwood@gmail.com>, Magnus Damm
	<magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Mark Brown
	<broonie@kernel.org>, Matthew Majewski <mattwmajewski@gmail.com>, Matthias
 Fend <matthias.fend@emfend.at>, Mikhail Rudenko <mike.rudenko@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	=?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Ricardo Ribalda <ribalda@chromium.org>, Rob Herring
	<robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
	<shawnguo@kernel.org>, Shunqian Zheng <zhengsq@rock-chips.com>, Sylvain
 Petinot <sylvain.petinot@foss.st.com>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Todor Tomov
	<todor.too@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Tony
 Lindgren <tony@atomide.com>, Zhi Mao <zhi.mao@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 00/72] media: i2c: Reduce cargo-cult
Thread-Topic: [PATCH 00/72] media: i2c: Reduce cargo-cult
Thread-Index: AQHb8cLi1z5mGUN1NkaS3NoM5ohUK7RBNANA
Date: Thu, 24 Jul 2025 11:42:55 +0000
Message-ID:
 <PN3P287MB1829DD1254FB74391A750F498B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB0266:EE_
x-ms-office365-filtering-correlation-id: 4cfe5155-5bcf-4af1-f45b-08ddcaa73ad5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?UKBSemYSQYWF6eCb9bRdeYlDdxOBg0FmEJXA7zMYcvWrrWiUDXNB595hHk?=
 =?iso-8859-1?Q?PjriPEclyAq1MF+CBhz4vnTiVVy8N0YVG6UWEtIXOCH2bPWUhaumGd6OWy?=
 =?iso-8859-1?Q?gEw6CCbdOPms/RQpQdHgl4hnYXPnX42XsJV3TrfG00lr1w1cbF4Q4aGNwx?=
 =?iso-8859-1?Q?UJHNKV3fgcnc7ff6UMNxgh9uHiN9lM2eLgaARVoVixQyifa241WO1hKwVE?=
 =?iso-8859-1?Q?JIxX82SOOpOa2+mn+SqYul7xV9ZHagGH+SftxSLmmP5j29aa4U04TU0kU8?=
 =?iso-8859-1?Q?699QBfEsM8NRFZGNN5TujV2u8E5n1ESDGeJ3SuMlwLoYZOSSmAsklob6a3?=
 =?iso-8859-1?Q?AGNLbj16i4+oQG6xmZTzpLOR/zCeacy6zJc+izn8cZ1WMZc6IPS27tosnu?=
 =?iso-8859-1?Q?mB3lp0p1VymOw3EmqcZUryyQSpY5NAC6/7v61xUUOSLToqbkfPPnqbRQ+4?=
 =?iso-8859-1?Q?+Uw6tkKg6DVUGlWoxqnIU51deGPG8Dq3brdwEWe9rglnCEY3QbIROvChUo?=
 =?iso-8859-1?Q?kZpbjWlXIkfsG10gbs/hftK3W5s2grJeOCzz0dCAwVvT2bYl0usPTpm4Sb?=
 =?iso-8859-1?Q?T6ufWkaSf6uooTu8wsn4/TnMJFurSNUd6psYgFEbR63v4rW/GsV/4HmE7K?=
 =?iso-8859-1?Q?NSwMMJdqsNVBxCH6W9pUJ2BN99ErqYPvScyOzHRVtJCoYF+hiu+2s+oZKC?=
 =?iso-8859-1?Q?+qvXmJvTqLBA3OgPke1sUCc/+xuA3c0GpOBtcOTp2sbxAM/XxXYYOrxgpg?=
 =?iso-8859-1?Q?AgnBSbc330OikUO08Fsc5gOUTK9wD1Q73HbTQUOZEWQ1SSW2ZjhEKJICsa?=
 =?iso-8859-1?Q?uCUY3/uv2AWcUI80SDWpc6lWWHxPhQ37CFs6nRcttiQUB4+hajwwl/0duv?=
 =?iso-8859-1?Q?21LmfPlbOmcqC61LMnctDqKsqWHUvpPiWhQITHZoJDOdTSwjGLNBkZ24Cb?=
 =?iso-8859-1?Q?P0BoGDVflkTpgdJw/ka6594NjiXg4N34DtOKDxNkVAlWQuRVHxKS5hgdRL?=
 =?iso-8859-1?Q?7gI+SHABkW0Dvh4/V/CljzmrqMxiNUU4SvO+NN4kzRfxPzTkTG8rC9tnkP?=
 =?iso-8859-1?Q?DahCQoxoc9yjIAFjLwmuxCdgr7GeeR9XKzVrKRwXVRnXav4oOZdUn5je1+?=
 =?iso-8859-1?Q?wNsQAaitlJTnBOFExJv/mpy3LGlJRg6d6ZguIfm+vAysOtKp0NEQuuftug?=
 =?iso-8859-1?Q?g6thn4lbFPKqKFHIsDswzEjIcKbK8BgA6mYao+bwu+O4dZkeyreHgiCYFl?=
 =?iso-8859-1?Q?1+2Naq4qX+HZo8T4njW8aryT1GjmBmGPIZ/t8h11U366vUHLcmaNB8tBp5?=
 =?iso-8859-1?Q?OWgI4y0D78x66SNqg6CCUvMSnf95OoRWU+FEA05nGvEwtXMZDRoEvip8+F?=
 =?iso-8859-1?Q?qAmT0p5d4fvdwx0MXT5rjIS5jfY8n9NXWHLBWuEUq7H62MVilxZR71r6/X?=
 =?iso-8859-1?Q?EH37tKFYY9l0bLd/gvWhyX6+6XLzrm3uiEMg1+Bow2CLnV/ZL1m2Ak5GfR?=
 =?iso-8859-1?Q?nvH4wC/K3egji6G47NZFYjj9Jqej/ey3K2tPleKUyR/XfEiT8HK9NfIfd4?=
 =?iso-8859-1?Q?12hzpBw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5t9wiVNItQRDGWHbQkBPdjBQCnA8+TFN1ABi7SrHMeuuLXBQdqDdBDsvAN?=
 =?iso-8859-1?Q?9buWb0KYc39PRFRP2FpFdGbqkrOwzMWDuSfa0EDa1glX/cQG29eM5y/70c?=
 =?iso-8859-1?Q?7MFBnP/f1AL0bN+W36C0tcj1Qwdo//psqxABONGJx8Y/qbwla67a6Z1Ljy?=
 =?iso-8859-1?Q?+r0in9AL4eEVLLTW08QFXYaaRdAulTbnxROPHJfisP7Uye5zkJGJV43i6w?=
 =?iso-8859-1?Q?B8cVLVhPAOkcAigLP9y525pNYAlyPqd7SgCgfCggN+xqlLLaa1Gr7y1/RC?=
 =?iso-8859-1?Q?p4YR81Qq2vrVMECZpp2F9DHOQ/bGZmlVkbRH8zFRlPFIO6b90C/rT9Z5AQ?=
 =?iso-8859-1?Q?T4EAtXss7B3mpfjlwtWBHxu/fDZQQuE0T4CVEBNYKCVDu2sdbnnCZQIcu8?=
 =?iso-8859-1?Q?/Ev2dxtsYh6/EAEytmMcCDDb5R5OxXgkTh+wS+QspDRBFhb0qa80RgNsUr?=
 =?iso-8859-1?Q?Xo4IKfo8XLeBc5rhMfFL2EG1iSzDI+s4yojMKzWMyOkIt+lr74Wl/LjKTU?=
 =?iso-8859-1?Q?TxI+ZCAKhO60WpembYBAqPLPAusj+Bk/XkZ1AtoTCnMtH/HoSQeaqOMAi3?=
 =?iso-8859-1?Q?p6+BF7EBWKuepiWoQc1RkNAkhxw5qvkTS1pzV/BM7AxR4lV6x+SMLfmuYQ?=
 =?iso-8859-1?Q?bZiF1BcVrBcclqr6nMyNUjrcdsgYboQeot5EX01x/wWSidcq9mFC3GOv3B?=
 =?iso-8859-1?Q?roaA+Wc7u1QBJKr58t7i3nr8b/7DM3nOALIwpjHTwWzKfnyxj5M3ML532z?=
 =?iso-8859-1?Q?YpXdzjMh1Ef+wugrzdjosctgPis7CayHG8pXcPttBm1SAVnlJJHpfJATeH?=
 =?iso-8859-1?Q?a7i+bWIM+n4S6ZOcYuySEYz96l6ZrDVOjOrByrLHA7IZRiK2JLj6ytonhe?=
 =?iso-8859-1?Q?uZQ9MWHmX7pKTJDZqRpGJW4tuQYufrfiX43EI0skzKerHAPb62WwrkfVnE?=
 =?iso-8859-1?Q?6DDSAcFCL49XjOODkWUhKNEguaZ8/vcv640Iqln2/JTeflG0OyHk/5t5fd?=
 =?iso-8859-1?Q?3QCHA8XaLFDezne6xhQ8mKpZAXTGoVqjr52+SargrbqOAiTiWwsD7+EqPl?=
 =?iso-8859-1?Q?tY2sh/Q6tgA+vv+swCrrMGlhYbh77B01oOSO3JdtmZV5HhemMm4PtzP50a?=
 =?iso-8859-1?Q?pw+JhMZ4+MajTcvWU/sVCy/B+0DLrooa5+OAkCErbkGx6t0GJ/ZnF37+VD?=
 =?iso-8859-1?Q?G/hSorcwln5M869vQnzEhUtEy3nkr1DRziF+5/QcVsvsxNjRLfIrYSEhNk?=
 =?iso-8859-1?Q?Y78i+e4VAtrmFl9azVtJbdYOdHIE58eXUW5d3Lq63FTNf8+KYv+BZiFmOg?=
 =?iso-8859-1?Q?FDiq0KUOwafHZUZshcpzgHfTtD0Vf5MFCFONnXlSMevoOmfcrm91vqAoKL?=
 =?iso-8859-1?Q?5DNgnw5T0dgZxLjSeHQ6Ubqe4/m6qzzCReNDJtT2E4FNTkr8K3BeQjnY5O?=
 =?iso-8859-1?Q?GO0GOJCe6UQbOqAQBU2XsdBO8aiNz/81+u5BdJsOM7pczTKBudLd+YT0of?=
 =?iso-8859-1?Q?f3/m7TrJdcHk76yE9+Ed7+8/7IjlZoId08RmJ2kWsWx63mcKKttpone+zm?=
 =?iso-8859-1?Q?csmdQE3PbQ7ZNlXthup3Na6GXZJ2jyod18AZqSxnoH00ifQLZi90uW9ih0?=
 =?iso-8859-1?Q?96QANE+wYg2BtcTEeJH2iNk8wKMxa0UxgL?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfe5155-5bcf-4af1-f45b-08ddcaa73ad5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 11:42:55.1460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tt9Xq5yNK6xl0WDWLx4ktvVrWJwMfLMIHZlIVMTOogOAhjtB8qVK5AQj/KUfGskt0NJDhgHNGybn2EXkMpxxX+t7DHjzzQ3Efhv8RrAQ0mw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0266

Hi Laurent,=0A=
=0A=
> This patch series build on top of Mehdi's introduction of the=0A=
> devm_v4l2_sensor_clk_get() helper (see [1]) to drastically reduce=0A=
> cargo-cult in camera sensor drivers.=0A=
> =0A=
> A large number of camera sensor drivers directly use the=0A=
> "clock-frequency" property to retrieve the effective or desired external=
=0A=
> clock rate. This is standard behaviour on ACPI platforms that don't=0A=
> implement MIPI DisCo for Imaging, but usage of the property has leaked=0A=
> to OF-based platforms, due to a combination of historical reasons (using=
=0A=
> "clock-frequency" was initially considered right until before the=0A=
> introduction of "assigned-clock-rates") and plain cargo-cult.=0A=
> =0A=
> A large number of camera sensor drivers also set the rate of the=0A=
> external clock with clk_set_rate(). This behaviour is also fine on ACPI=
=0A=
> platforms, and has also leaked to OF-based platforms for the same=0A=
> reasons.=0A=
> =0A=
> Mehdi's "[PATCH v2 00/48] media: Add a helper for obtaining the clock=0A=
> producer" series improves the situation by centralizing clock handling=0A=
> for camera sensor in one helper function that implements the correct=0A=
> behaviour for all types of platforms (and should later allow support of=
=0A=
> MIPI DisCo for Imaging transparently for camera sensor drivers). It=0A=
> doesn't however address direct access of the "clock-frequency" property=
=0A=
> or direct calls to clk_set_rate() in drivers.=0A=
> =0A=
> This series builds on top of the new helper to replace manual handling=0A=
> of the clock frequency in camera sensor drivers. It starts by addressing=
=0A=
> the DT bindings and reprecating the clock-frequency property for camera=
=0A=
> sensor drivers in all YAML bindings (01/72) and in the et8ek8 text=0A=
> bindings (02/72). After that, patches 03/72 and 04/72 make the clocks=0A=
> property mandatory in the two camera sensor DT bindings that specified=0A=
> it as optional. Finally for the DT side, patches 05/72 to 14/72 replace=
=0A=
> clock-frequency with assigned-clock-rates, or drops the property=0A=
> altogether when the source clock has a fixed rate. This aligns the DT=0A=
> bindings and device tree sources to the current recommended practice.=0A=
> =0A=
> After that, the next 5 patches are assorted drive-by changes. Patch=0A=
> 15/72 drops an unused header the belonged to a long gone driver, and=0A=
> patch 17/72 drops unusued support for platform data in the mt9v032=0A=
> driver. Patch 18/72 is the first that addresses clock rate handling by=0A=
> dropping unneeded clock rate setting in the mt9v111 driver. Patch 19/72=
=0A=
> takes a harsher approach for the ov6650 by dropping the driver=0A=
> completely as the driver hasn't been used since v5.9.=0A=
> =0A=
> The next part of the series replaces manual clock rate handling with=0A=
> usage of the devm_v4l2_sensor_clk_get() helper in a large number of=0A=
> camera sensor drivers that implement clock rate handling in a standard=0A=
> way. This is done in patches 20/72 to 54/72. This interleaves the clock=
=0A=
> rate handling changes with drive-by refactoring (in separate patches) to=
=0A=
> make the code easier to deal with.=0A=
> =0A=
> The final part of the series addresses the remaining drivers that=0A=
> implement non-standard behaviours. It starts in 55/72 by adding a new=0A=
> devm_v4l2_sensor_clk_get_legacy() helper function for those drivers,=0A=
> similar to devm_v4l2_sensor_clk_get() but with a few more quirks. This=0A=
> function should not be used in any new driver. The remaining patches,=0A=
> from 53/72 to 72/72, use the new helper in drivers, interleaved with=0A=
> drive-by refactoring similarly to the previous part.=0A=
> =0A=
> Before this series, with Mehdi's series applied, 29 drivers read the=0A=
> "clock-frequency" property and 18 drivers set the external clock rate.=0A=
> With these series we go down to 1 and 3 respectively, namely the ccs,=0A=
> mt9p031 and mt9v032 drivers. Clock handling in the CCS driver is a bit=0A=
> more convoluted so I will leave to Sakari the honour of dropping the=0A=
> last direct user of "clock-frequency" :-) As for the mt9p031 and mt9v032=
=0A=
> driver, addressing the issue there is more difficult and likely not=0A=
> worth it.=0A=
> =0A=
> [1] https://lore.kernel.org/linux-media/cover.1750942967.git.mehdi.djait@=
linux.intel.com=0A=
> =0A=
> Laurent Pinchart (72):=0A=
> =A0 dt-bindings: media: Deprecate clock-frequency property for camera=0A=
> =A0=A0=A0 sensors=0A=
> =A0 dt-bindings: media: et8ek8: Deprecate clock-frequency property=0A=
> =A0 dt-bindings: media: imx258: Make clocks property required=0A=
> =A0 dt-bindings: media: imx274: Make clocks property required=0A=
> =A0 ARM: dts: nxp: imx6qdl-pico: Replace clock-frequency in camera sensor=
=0A=
> =A0=A0=A0 node=0A=
> =A0 ARM: dts: nxp: imx6qdl-wandboard: Replace clock-frequency in camera=
=0A=
> =A0=A0=A0 sensor node=0A=
> =A0 ARM: dts: samsung: exynos4210-i9100: Replace clock-frequency in camer=
a=0A=
> =A0=A0=A0 sensor node=0A=
> =A0 ARM: dts: samsung: exynos4412-midas: Replace clock-frequency in camer=
a=0A=
> =A0=A0=A0 sensor node=0A=
> =A0 ARM: dts: ti: omap3-n900: Replace clock-frequency in camera sensor=0A=
> =A0=A0=A0 node=0A=
> =A0 ARM: dts: ti: omap3-n950: Replace clock-frequency in camera sensor=0A=
> =A0=A0=A0 node=0A=
> =A0 ARM: dts: ti: omap3-n9: Replace clock-frequency in camera sensor node=
=0A=
> =A0 arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Replace=0A=
> =A0=A0=A0 clock-frequency in camera sensor node=0A=
> =A0 arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Drop=0A=
> =A0=A0=A0 clock-frequency from camera sensor node=0A=
> =A0 arm64: dts: renesas: rzg2l-smarc: Drop clock-frequency from camera=0A=
> =A0=A0=A0 sensor node=0A=
> =A0 media: i2c: mt9v022: Drop unused mt9v022.h header=0A=
> =A0 media: i2c: mt9v032: Replace client->dev usage=0A=
> =A0 media: i2c: mt9v032: Drop support for platform data=0A=
> =A0 media: i2c: mt9v111: Do not set clock rate manually=0A=
> =A0 media: i2c: ov6650: Drop unused driver=0A=
> =A0 media: i2c: hi556: Replace client->dev usage=0A=
> =A0 media: i2c: hi556: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: hi847: Replace client->dev usage=0A=
> =A0 media: i2c: hi847: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: imx208: Replace client->dev usage=0A=
> =A0 media: i2c: imx208: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: imx319: Replace client->dev usage=0A=
> =A0 media: i2c: imx319: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: imx355: Replace client->dev usage=0A=
> =A0 media: i2c: imx335: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: og01a1b: Replace client->dev usage=0A=
> =A0 media: i2c: og01a1b: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: ov02c10: Replace client->dev usage=0A=
> =A0 media: i2c: ov02c10: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: ov02e10: Replace client->dev usage=0A=
> =A0 media: i2c: ov02e10: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: ov08d10: Replace client->dev usage=0A=
> =A0 media: i2c: ov08d10: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: ov08x40: Replace client->dev usage=0A=
> =A0 media: i2c: ov08x40: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: ov13858: Replace client->dev usage=0A=
> =A0 media: i2c: ov13858: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: ov13b10: Replace client->dev usage=0A=
> =A0 media: i2c: ov13b10: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: ov2740: Replace client->dev usage=0A=
> =A0 media: i2c: ov2740: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: ov4689: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: ov5670: Replace client->dev usage=0A=
> =A0 media: i2c: ov5670: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: ov5675: Replace client->dev usage=0A=
> =A0 media: i2c: ov5675: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: ov5693: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: ov7251: Use V4L2 sensor clock helper=0A=
> =A0 media: i2c: ov9734: Replace client->dev usage=0A=
> =A0 media: i2c: ov9734: Use V4L2 sensor clock helper=0A=
> =A0 media: v4l2-common: Add legacy camera sensor clock helper=0A=
> =A0 media: i2c: et8ek8: Drop support for per-mode external clock frequenc=
y=0A=
> =A0 media: i2c: et8ek8: Use V4L2 legacy sensor clock helper=0A=
> =A0 media: i2c: gc05a2: Use V4L2 legacy sensor clock helper=0A=
> =A0 media: i2c: gc08a3: Use V4L2 legacy sensor clock helper=0A=
> =A0 media: i2c: imx258: Replace client->dev usage=0A=
> =A0 media: i2c: imx258: Use V4L2 legacy sensor clock helper=0A=
> =A0 media: i2c: imx290: Use V4L2 legacy sensor clock helper=0A=
> =A0 media: i2c: ov02a10: Replace client->dev usage=0A=
> =A0 media: i2c: ov02a10: Use V4L2 legacy sensor clock helper=0A=
> =A0 media: i2c: ov2685: Use V4L2 legacy sensor clock helper=0A=
> =A0 media: i2c: ov5645: Use V4L2 legacy sensor clock helper=0A=
> =A0 media: i2c: ov5695: Use V4L2 legacy sensor clock helper=0A=
> =A0 media: i2c: ov8856: Replace client->dev usage=0A=
> =A0 media: i2c: ov8856: Use V4L2 legacy sensor clock helper=0A=
> =A0 media: i2c: s5c73m3: Use V4L2 legacy sensor clock helper=0A=
> =A0 media: i2c: s5k5baf: Use V4L2 legacy sensor clock helper=0A=
> =A0 media: i2c: s5k6a3: Use V4L2 legacy sensor clock helper=0A=
=0A=
If you are planning a v2 version of this patch series, please consider=0A=
incorporating the following improvements:=0A=
=0A=
1. In the imx219 driver, you can also replace direct client->dev usage.=0A=
2. In the regulator code, you can reduce boilerplate by using =0A=
   devm_regulator_bulk_get_enable().=0A=
=0A=
Otherwise, I will submit a separate patch series on top of yours to =0A=
address these points.=0A=
=0A=
Best Regards,=0A=
Tarang=

