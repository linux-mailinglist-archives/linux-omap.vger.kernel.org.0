Return-Path: <linux-omap+bounces-4145-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE649B10D5D
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 16:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AF241D012E3
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 14:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5029F2E5414;
	Thu, 24 Jul 2025 14:20:17 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020083.outbound.protection.outlook.com [52.101.227.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9F22E1741;
	Thu, 24 Jul 2025 14:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366817; cv=fail; b=OJhXPYgUWSJTg/GJ5fRFPIVs1wU0ZSzIHOck2nyeJXYkHE/n0ghfwby+RQ4eRI0MZzrAzAa+JKEpe9qzr66/qdlDSQCK0lESbtCpVNSpODKL2s7hNkhxt2UQYHRLwWsNlhQ/ApLIiEyUU4gzPj+2I8F+UZ0oi5Fay8xBHG5Zojs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366817; c=relaxed/simple;
	bh=f7ULJv2U5gq67cML9lc8WAMCO2FiXu88YCLAcG5SIiw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dFfBYk3P35Yo8KVtETYlAaSrJSPqTfGFEIVAse4Lk8pKOUUWDeGT9kMl++ol/gM+OLHefFkjnzJkXff6vgyrnAHrVRYRm2HYGfgzsgWunNyzdOhni5XGpPm7pNBmi4gfi7bzsGqzrlXCXM0EmqmJkVlQCKauGc0kNGbVYTolw4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6zq1xU9rLL6AyvAOD+HfviLk8FXm40flb0/cxVh2f0vZSx3CbuMAf/+UnRATkw2CcQp2U0FglYgNzolrprLorNeIWUfhaS/+V3NxeAKCJaVlPKavsGpoLReR//TPI/KacxxGi1K++QqA+Y2wpo88IqEkKTj34sT/7fhBigWYwlo7dgkBKFK8MTyB35uX6UAekS8MJjP1IZL6SKmF/cSgXzfTOSmeMTL7PVmSH/+uquKl9j361D1lXQkalk3UDxb/CcQl5w61a46/LVFjtapCneNVoiQBvcM4QZt1+K7fE/z9Bxfzh1e8LtEtKDvQ1qMmTq4RkkJ+v0qhGGX6Ufx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7ULJv2U5gq67cML9lc8WAMCO2FiXu88YCLAcG5SIiw=;
 b=I8RzJU+zSnBmFZZQIXSHwfKlzHkgWqYZgrVvN2q6JI4Obdw9ys7XO6Hb4r0hUWjdf/kBEWACAkMvu6rt/Ri4cI5kVM0nQapVPE2qEaEuyndruUXsD07Y+RsEHP/xrhYm+3P+tXqNeAyfjGcAZzq+QoXNEqRWp962qlxxOLkHg9yOQ8NAKXg290Eqf3WwXFdLWYfj3qTVqjulK1Vp4OKqVtjfUJ/5nMAOluL6R8f7bCiqVaGWjAJekDxQYkQWWVVg53hosGxM95yXTXeMTvdRlEewnNJb89cUFmVVrRUYu/kGODOdAfnOrwuCkz5NiRKjWN3OOHlIUZVXtu7uLWhvHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1756.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 14:20:10 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 14:20:10 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Alim Akhtar <alim.akhtar@samsung.com>, =?Windows-1252?Q?Andr=E9_Apitzsch?=
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
	=?Windows-1252?Q?Niklas_S=F6derlund?=
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
Thread-Index: AQHb8cLi1z5mGUN1NkaS3NoM5ohUK7RBNANAgAALMwCAABfMAIAACf+AgAAFhHM=
Date: Thu, 24 Jul 2025 14:20:10 +0000
Message-ID:
 <PN3P287MB1829E1FEE7D2468CE9915C778B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <PN3P287MB1829DD1254FB74391A750F498B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724115202.GK11202@pendragon.ideasonboard.com>
 <PN3P287MB1829C9E8C78ADD70259A68F08B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724135259.GR11202@pendragon.ideasonboard.com>
In-Reply-To: <20250724135259.GR11202@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB1756:EE_
x-ms-office365-filtering-correlation-id: 2a523b04-83e2-4f3e-c5ee-08ddcabd32be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?lD0VakQ5AXe7P3Mm5DG6esDz3g0pntPIEyDg9phTcrNIa5bJ01ALX7UE?=
 =?Windows-1252?Q?prBFkXMpHJs5Zf3Y6kyryYQqpIGITPOrsNF0AEL0ggCaZlWlX7P3U18I?=
 =?Windows-1252?Q?aq3innjVdhIvYrhUnUIxyIRkcn0Y2QGiEQRKqbaRnMlgMNTRqko3SjMW?=
 =?Windows-1252?Q?b7qG+un8RFmErXi3kkKL/H+2CMj7LXHvRPWzIRU6+FJWTJNhKfIi4l29?=
 =?Windows-1252?Q?oVtZupq/fv3vDgYAFa+ivKZfOVIW6V67NCSt+pj7BNA3lf9Lg2/Dkdn6?=
 =?Windows-1252?Q?PkKoGk+UcJ01DpH8p17gmDJkCPIDEB9SQdPPVhGgoVgCX6cCPEK4qXYq?=
 =?Windows-1252?Q?Jp6CyR+d7LIZWhk+P4eHpAGYPSw71dpf+mXKdsdaDmkM9RDiwKfm1Jyi?=
 =?Windows-1252?Q?T/PBuEk1c0fa2uQSGA188tYi2JEpPlbnR5RZjXfHTPfedgF2/EhEl5tX?=
 =?Windows-1252?Q?qCzzk4W41LNpc0HRnFbnB500hpwXVhDrDei/BXynZfNhWSPwUrJR2FnO?=
 =?Windows-1252?Q?1SXuWgB/iSM/lwn6NbgDF7SMw/uiINVasc1CLZ7XZO4difq1tokQ3Vcx?=
 =?Windows-1252?Q?xiJjm7vixbN8EjNIwABE4kj04Ctp9szb1fChez8uJngpMqPEeVFDS65X?=
 =?Windows-1252?Q?VgT1PFWb1B3rqp7uBJ7FCjXVIlDHb0Ag0H+YTxcUm0rHmXkiCUROhGlS?=
 =?Windows-1252?Q?0dbb1iIqrvklcG5WPGeC5ZZnu7HKlfF5WDWDnaSf0x7ZZFpABHeUsfIe?=
 =?Windows-1252?Q?nXynJcXzRjUCVUUGGn2gkEn28KebtjtyML97Y0nRLw6FNYxZonG+o8ay?=
 =?Windows-1252?Q?UW6EhEEZKnDp67o3P0/U8fZrOhUWKSoen/aWgWJ04wBrZad7Vcfuthmi?=
 =?Windows-1252?Q?GTQn23uEHLMBdVyxIGolzrDn6XjUVC1y/VDKal31x4HNJmbpPd7jh0HM?=
 =?Windows-1252?Q?DQhzue+Yf1VwB94gRDSm6pwKM8iGNLU+J6HBUIZVcfDG0czNY3B/4SP9?=
 =?Windows-1252?Q?0OmLX/Zk0jJYNnF9064ZAzKgus7wuFvl9P8mMC5YFKgx5VFFL+iL5O4Z?=
 =?Windows-1252?Q?Me3OkC6aVOs8NM6djDV7ACGeYLvD8yYrYafJT7jsm8D/JbLYl507pXnb?=
 =?Windows-1252?Q?O7QLKsZNcJ3asHDZieJ798aM/4fSg5sziotfeqQm5Oaw0r8sjA/RMBdZ?=
 =?Windows-1252?Q?8JCvbV4Ly7kKI5uu5fgSzZ7C7ay887iFTC+zQFTncFwB0e5K4KuVOojv?=
 =?Windows-1252?Q?jTje1rhXUXxKoAOA5SGu12ltkKQfstDY7h23L9uC21bZI1H0mDHW0VU3?=
 =?Windows-1252?Q?P2/HSa/ROAbW1spJGjsMtV+9oqzRUS5pqiUlJrGLg5sX80TZDfq5G9bz?=
 =?Windows-1252?Q?1g2usstKaarnYRRGOTEFWmAFJ32YNsfcm2AQsbTtYZhdqGplWLxwRisJ?=
 =?Windows-1252?Q?O51BSaH4PRLWjQiua0vKA/DQdgLGBfiFcWx3bJY8sc0+54f1gJhTcmcN?=
 =?Windows-1252?Q?YH29r/5dNzvzTMyUbJXGeOopx493xfNEYyy6hR0kWBKwclNLdi2Upo1m?=
 =?Windows-1252?Q?ct9OxvXkq6OcbWB/ig3HRWXz3UejxZ/GdYm4Og=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?K5H+ScCiyLm1XwhMaUmWv0wnvovAQB2yR5dQoJrryJ5L7P3YXdLA24eH?=
 =?Windows-1252?Q?M40RNfInoDvBa1CuNgZFeyuXvZhodYZG9flZJ9oDIxzzYXklcU3C1RDa?=
 =?Windows-1252?Q?K4UPF9S9N9DBxD/Kt64tcL5Kb9NYwmmj4OMCzdCIfNli3UNOW7ZjxxGa?=
 =?Windows-1252?Q?w0hqAY1ip1RW7rXLASOekGXqeAEx5E2J4Q+uPEwJ/Rd4TChic9mJJYta?=
 =?Windows-1252?Q?W4bzTitHQ1uJSqgFgLWr/NUjiEBDmSviSLqoUkCfct/dCb7u/xW8UWPv?=
 =?Windows-1252?Q?gG9GaYKq+G1w5IZ36Fr7T5M5cFU8oeWRzMLGuJJtBHuyLbkz8HMvi7/b?=
 =?Windows-1252?Q?Kt+QuHhOkacYZb9/FoyEE5P+HPscaqTygseIsLsyF6kMWPtdhQzOja/k?=
 =?Windows-1252?Q?VdqhwBYNsDhev9ePTsP6eyesUdShR5CyacEKkNtEAE7w6Da0O2Saql+r?=
 =?Windows-1252?Q?6TOh5Y6CSvtewCU1hu5wZp9NffFqfIy9LI0hVvnwYp76CRdVBd3dLbW5?=
 =?Windows-1252?Q?L3cTxPni85rUjSw6C+b5ys/ECodMSQErVJcBLcgIsvkT0wKiNXrtWUrg?=
 =?Windows-1252?Q?WlqnzQJOPfaoi2nHXkl2Hk8Yzo4dp4UxhD94aeiqF7SPAlXxBDJWX8vM?=
 =?Windows-1252?Q?/MWY/AvBoTRWnXz0peDlf5ibXFKP55pzpnlejeIPeXkgAFodaXyFWfyk?=
 =?Windows-1252?Q?wVXJthVWUSCm4hHDd7TdzdeihudjCk/c6+VUbaJitLjgPQmesAhix0xt?=
 =?Windows-1252?Q?74No+uHM+0TO7xFurSXTsxXPpmx1W7H/gUYyj3XrJNPvf3JKXQw5XSlc?=
 =?Windows-1252?Q?W8UjvcAlzd5dEe0Wshf+CJVZhz9qU2xQOB/dB+NBtv1AdJkzWme40VO/?=
 =?Windows-1252?Q?jX8D9Icjzuc6ff1grPANrf3WKqYQX8AVW87qFt55QTWpOa+NbtvEcOau?=
 =?Windows-1252?Q?sHSA8FDxy3mY+taJmMZ162bzzTkXa9Ty3PapESNcqFKNDIVUbh522aOP?=
 =?Windows-1252?Q?aHpyQ932Hwc+ps81vJfIfkekaxZrbg3X3quGQEFE1wATY/MtUOD5KsMN?=
 =?Windows-1252?Q?eYyL2mF3hLdWud2sdvxe3gK+9SolC76+JLoZL4AA9PcHVgzNXT7uIKpI?=
 =?Windows-1252?Q?/vrJJ4gE7t/fGkY158GfCFCzr4N2QDwBf2Jqcj3x4gzY29I1oO+PJjZ4?=
 =?Windows-1252?Q?EBz5sBv5mTC2IVQvvoPV6AENO6c6KjfjhKhqdQjzThrNhZO5sCfYW9Gi?=
 =?Windows-1252?Q?I6o+C3OU8lZjPeOWzHmgI58FPavWew+xfL/vBQOOrseLqNFBMNqZJsL8?=
 =?Windows-1252?Q?tamTcX7WvO6bwot7Gy3xWF8O6pehPDqBDTPtXcOtM0xEuLvDNXOZpLKI?=
 =?Windows-1252?Q?vTqj9MIFJjqSHB8euWLTR83/rZrWrBU+cYV/gRw/UX9y+kMT0QdU65FI?=
 =?Windows-1252?Q?FvpDNxC6NpUPmXAjDaxjkMkyeTy0TZe4syYoWAQdByGMF/uzc4Q0nWGL?=
 =?Windows-1252?Q?/tbHdYmRjhccyACtj6KUkWLBg4ug4ewHKpUUDvAI6WmKQ4wVxPvATEDt?=
 =?Windows-1252?Q?iF6ftqxUc/nnhG4HVAtd3mm4RnniUkB4lQD8rqPTxOICc1DI6yzGSa0Y?=
 =?Windows-1252?Q?8x3IxEgJO0VoEw/uDu1yHvT4cxQbs3Y5D7N8NQocNkbKG7WWiCYazz6B?=
 =?Windows-1252?Q?nXGQLnX3agX6frT7t93T8RBfgvrgAZLc?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a523b04-83e2-4f3e-c5ee-08ddcabd32be
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 14:20:10.5026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iXOI7gmtyrhnjas+BKPwMKtapeFl8Wo/S98aZruqesNrp4hSqFIyOcZetr4+LM5uVYnTsIvvlTUFWimC7LNT3GCasTQH1Vj28L6anockes8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1756

> > > > 2. In the regulator code, you can reduce boilerplate by using=0A=
> > > >=A0=A0=A0 devm_regulator_bulk_get_enable().=0A=
> > >=0A=
> > > devm_regulator_bulk_get_enable() doesn't seem to be a good idea. You=
=0A=
> > > generally don't want to enable power everywhere unconditionally, and=
=0A=
> > > sensors very often need a guaranteed power up sequence.=0A=
> >=0A=
> > The regulators are optional, we supply power to the camera sensor direc=
tly=0A=
> > through dedicated power rails and there is no strict enable sequence=0A=
> > required in this case.=0A=
> =0A=
> What exactly do you mean by "this case" ? Are you talking about one=0A=
> particular sensor ? One particular camera module ?=0A=
=0A=
Laurent, by =93this case=94 I meant the common scenario where power to the =
=0A=
camera sensor is supplied by a PMIC regulator that is always-on. In such =
=0A=
setups, the regulator is fixed and cannot be enabled or disabled from the =
=0A=
driver, the sensor is always powered.=0A=
=0A=
This is what I=92ve seen in most platforms, where the CSI input connector =
=0A=
provides fixed 3.3V/1.8V power rails directly to the camera module.=0A=
=0A=
Of course, if the camera supply comes from a dedicated regulator controlled=
 =0A=
via a GPIO, then the driver would need to handle enable/disable sequencing =
=0A=
explicitly. But I=92m specifically referring to the first case, where the p=
ower rails =0A=
are always-on.=0A=
=0A=
Mark, depending on the hardware, the power rails could come either from a =
=0A=
PMIC or from a regulator controlled by GPIO, but I=92m talking about the al=
ways-on =0A=
PMIC case here.=0A=
=0A=
Best Regards,=0A=
Tarang=0A=

