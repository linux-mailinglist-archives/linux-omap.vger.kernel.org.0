Return-Path: <linux-omap+bounces-4148-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B52F8B118C7
	for <lists+linux-omap@lfdr.de>; Fri, 25 Jul 2025 09:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0496170D35
	for <lists+linux-omap@lfdr.de>; Fri, 25 Jul 2025 07:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAF528A1DA;
	Fri, 25 Jul 2025 07:00:47 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021132.outbound.protection.outlook.com [40.107.57.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB39E10E4;
	Fri, 25 Jul 2025 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753426846; cv=fail; b=GHDByXGoRiREQIN4LWVofxALa8p+dztiem7b3z1iSo5zC44Q9M2iam7o8p/4SJsz5qht7drpjotdzTsFN8DuDc+SjN0LMa3QJUOEMIs0PfcFIQ4rjyzKKcS4TdHh5pve+cJ3HyUgo6Znvtb6U6En83N4ZJ84pa9osHdrceQUjw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753426846; c=relaxed/simple;
	bh=pLIs6Yhadp9ZRoynzjya3ol0bu+N9rjHZ29OG9K6yJE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gAFSFPxGoTcwfhPWEUlNq/6IwXyOnx//yBmVlebgXyoFTfrCWbbFOWYMN3194BO+orH/mnaCyROz5w9RNgh7R7HNGIu1GrCF3pZcE0oUgtshhGRRzJFCffoLDWfA+kIRpwtalqcscv31ZKK1zPabzR1TuxvLJMVIi6WBfAXziGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rT3asasxx55SHRoneykflUuSt2+37AxhwQbACXTU5HyFaWzFb0ZrgTpH1O7Zqam073s0VISUk4qlPAu1wYY0kKORh8DZnlgZv76wGHphASj3pT33oAxz+VPFjIXlYxC9w2pHfGw10RxL8TGMd2nnXwg0U0prQG5lcd/1SCwmXhF7n592z2Z793gWB4YO8DQbweC6a4N5ViKTT0GLZizzRfbli3qNu73Q/IQukCXGQsTCQehb/qTO6rCyxVDoneOqs2UQYtSUPVqLTWKyWuGaWgUBwKL43iD0X717gOAuPS6b1++ssB/QqB3dbPP2z7CfUAjIfjFb4Q+KLFUp7zsfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLIs6Yhadp9ZRoynzjya3ol0bu+N9rjHZ29OG9K6yJE=;
 b=gWf76vuSIPCnbCHmKiuNFf53g/ctuFx5OvYzN20huyjtS+0z5Dv7sQgLsXXLboDxhJ3oLOnMClRxcQHVDj4zuijLA/w2DSkBum829z3UCnBRyEYRbntkF6PnYkYaoAyEu9VTXDx//+6Upy7RUxzd46Q3Nbtoi2n2zJPnuFix3gZjh39nuEZaa5QoQiMDb+8xtc7pvA0xuUIzJY76iDNyroHl1JuR6NCBsOrudUhYSkiA2KDwZhgUd3RbixgQhWZlp7gqevqDBF71+EFC+FRsaYn+ucFpuxM4n5oLgiYBwFvpbl6mDwSDZrvaYOV//IvP3rNU5IEH2jtEu/EZ4aKYEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3P287MB0081.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 07:00:40 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 07:00:40 +0000
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
	Dongcheng Yan <dongcheng.yan@intel.com>, Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Hans de Goede
	<hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, Hao Yao
	<hao.yao@intel.com>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jacopo Mondi <jacopo@jmondi.org>, Jimmy Su <jimmy.su@intel.com>, Jingjing
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
Thread-Index:
 AQHb8cLi1z5mGUN1NkaS3NoM5ohUK7RBNANAgAALMwCAABfMAIAACf+AgAAFhHOAABmSAIAA/hWQ
Date: Fri, 25 Jul 2025 07:00:40 +0000
Message-ID:
 <PN3P287MB1829FC781EA3A94E0B8F16B98B59A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <PN3P287MB1829DD1254FB74391A750F498B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724115202.GK11202@pendragon.ideasonboard.com>
 <PN3P287MB1829C9E8C78ADD70259A68F08B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724135259.GR11202@pendragon.ideasonboard.com>
 <PN3P287MB1829E1FEE7D2468CE9915C778B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724154414.GE22016@pendragon.ideasonboard.com>
In-Reply-To: <20250724154414.GE22016@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN3P287MB0081:EE_
x-ms-office365-filtering-correlation-id: 9435c992-4754-4e44-1914-08ddcb48f75a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?C1aq+JPbiF/Qcn9gWvMYU+erhR95GH856rBJQsaFer4ZkOjR1G36RXJP?=
 =?Windows-1252?Q?ai2F1Z3EZQiF5hMV5ZtlMpRwGObVCmDscF/oRwdUGpCZ6AU8vegr6gK9?=
 =?Windows-1252?Q?hO5yWzzuW9UKyWtawmyJJSpxm4fngcWQBHFl7eroBt4M9SzjuhFbb0Td?=
 =?Windows-1252?Q?OQKVY8sNCwzAPnkfs30p1SSmYCctqWMZXoiTOguYf0vrMw5zMkZuxuwE?=
 =?Windows-1252?Q?n0CQoqL1BwpM0A6Y+K3gCfMmx1G/FpHAA8RW5STMDdlhm8pqJ7qVgXHZ?=
 =?Windows-1252?Q?LEzVI1pX12hVlScVHhFxjhKXjtyxiVZHV2fDKWitabW4jm88EEoumJUj?=
 =?Windows-1252?Q?nGISz59mEp18CIF/pIrPw1dnu/aVDV6iYQo+VI2jIoYvEL9qEa24iCaY?=
 =?Windows-1252?Q?kh66HriEXS5cjYeH9pufn5KMgmgSyzXpTDrDl4SGxfSa5Y9MDzkoGwZf?=
 =?Windows-1252?Q?R9v9yQKZJ++HV+Lhan5Aq5DvUNPapPwsMbvmAZHMn4328EOy98QFlbDp?=
 =?Windows-1252?Q?WdcgtBeGmumlaXs8dIYu3YkIWaAR0nf+Ap1L9eywKNRvgwttfPvPjHNX?=
 =?Windows-1252?Q?Olm0FOfYSnh6YsJ0wlekHmWDnNW92ZWGZr7XHjPgG7WFDbOdQ+Xz8aML?=
 =?Windows-1252?Q?8U1uc/vTRJpYAI9pZc3mQjcQ1RP+S2tKD2bDTCvfyfQiIbNs1s57DKgn?=
 =?Windows-1252?Q?Zh2VGe1bMdqVHI79JI95UPra8zv3TgrNldB279Mgf79EHbweQtEU4ARu?=
 =?Windows-1252?Q?3cbUCBujHwgVi4H3lLWbAT51/LxAXyEOY0gbfysQMHYrs8fGtyoGirF3?=
 =?Windows-1252?Q?PUm7By9VS3xI8dopKU/LB22unSeR7uVe56vNQliZna1/KXAjyMB1IPz8?=
 =?Windows-1252?Q?jzC4gQgyHBrvQVVSapau+ux+YDVvksyGxVIVkFikYmhDJWz2+61Y+Paq?=
 =?Windows-1252?Q?vasqVebq0OMoK9zOdy4FrvLbt8eqyrM4zTYo3aPDnXYayIsEld9ar1eD?=
 =?Windows-1252?Q?+gv8ko167nW/NxRh9MWjnj+D13UIbAirWgsiXaVDvaHVAfl5mjFahXra?=
 =?Windows-1252?Q?v8BCMo8sMSXMqkWYH0zIJRzYujWWZlfsRDNGGLVZERfxyGcNNeWkp2Eg?=
 =?Windows-1252?Q?MqACJL2oFF8UwZfIx7K8RRKTsuZRI5fGC8Vx3XMhqjqris4cWRkJmBNn?=
 =?Windows-1252?Q?6kwUXJqvsAdyNC1QhevNad3tA7vPp1ESfJr9Px1uqWgcQUUYWn91NxVb?=
 =?Windows-1252?Q?GMC5HaYqcQYvcqV/OHmCXuN4y5+v1DVsU7Jp9VZtpPEJfKCi78phIP6G?=
 =?Windows-1252?Q?VFxfZFdOcgbviQnUt9FKcn/QZni40kZ4jVKLXc9ex+wt0K4CZBMA//y9?=
 =?Windows-1252?Q?NY5U2YYIO9yq7Up2MKCoATOdZIN8y7uwm0PIpKIIe1x5w/lBR4cAYT3e?=
 =?Windows-1252?Q?2pzyN2HOYhqOW++6y3JgscMVCy1M4nDOgi1MWf651duRVbLy+MqDw7RX?=
 =?Windows-1252?Q?FtJ5mKYJ2DvaIpenxrT+iXmX8AXeunys1qxJ/pkgcnU/Omo077oDItnZ?=
 =?Windows-1252?Q?vdnOwnJdK9AUMkaK3ET9nohO8MubabZvq85QDA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?XJwaLyUjy0aSXzFkyVrmRtZwJ/S951tapisqrIio6hnWRND2stj1vI22?=
 =?Windows-1252?Q?42bS6dlZto7Yz0ElvqrPwZEj85RkWYH8ZZnTEkaF9SbEcEV1lCiwsizu?=
 =?Windows-1252?Q?RO+C62DlU6VYqMTjU4S12nytX1p/eyBWnshuCGyd6PHazEznQwhkn+f0?=
 =?Windows-1252?Q?qK/M9Zm8kYRBlzJdYGqAhlkrLah+HS22wR6TkeEQwfJLg3RfiJroSnuz?=
 =?Windows-1252?Q?dh8gHsuFnytZTfs+JYlcSJhYll1WNS9GRbINdKL14Ezm6/uOCwv9VY1S?=
 =?Windows-1252?Q?0WBASI5b79pWHyeBmJqDnAZvJGddzddL21cqJrm+G7tFzd9mRzfL5+g5?=
 =?Windows-1252?Q?2ubZeCSCLFiF6iZvBz4Zt8anq5Z5NnyOUAQSk3ExLo77qxxDVVb20CNk?=
 =?Windows-1252?Q?aMl7twB09eC2WnovKsidGmjUlzlW3FRgM53vZL5qLoB4Umnq/nYXSf9p?=
 =?Windows-1252?Q?whu/kvmr7SjYeI5G8SdhOVBCxZ/aS9YolX8a7CbAQPjkOoXhPbku7+wd?=
 =?Windows-1252?Q?tPNA6+v2eurjwYlQ+1s1ZRlgMZ/rXvoDAkRS4vMj6FyrgGZenbPB6VYa?=
 =?Windows-1252?Q?DhMO7RdutQ15OL/YCmo2pMgBhPoY/TQmoi0wKzz/mJh+RU7omDMd/wGt?=
 =?Windows-1252?Q?USkCEcVcC9m+6jZpH7SNOipXhXNYlEi8m/3k7LMQkOR2eaz++k+YRKsH?=
 =?Windows-1252?Q?kwSbCsgw+VZonDvH11eSIuHp5THL34pw0vJvGK65HSwAESTjgpVLOEKD?=
 =?Windows-1252?Q?tJDCcaaRh4MsBz6OSymABvwStyxBNjOnm6eJ6ldHf60gXiYpyA3ZzYZT?=
 =?Windows-1252?Q?0rzCUf260kWDRTvqUAIXNTIV6feHWNLeOCt0x0pX+4/ssKvdj9Ruh9KS?=
 =?Windows-1252?Q?l8/SsUnv+Qo4z6KPStzcpmBesjZtoIh+5jz6quINUhsZNvhAu8nvaqyo?=
 =?Windows-1252?Q?jvj329ZB4aAU/U4XaPH9AsC5MaY4h2ztaHbFoh33rXHhHDUwikV+bbRR?=
 =?Windows-1252?Q?d1Gv6qcKaWr0E4yAUYJrLCFnAEYbqSE7UY/dIZk4uG8JJ0m1ig0chd8+?=
 =?Windows-1252?Q?36zD9yb6jwxjwK/fwK+pfBDuYuE97VtWG8AMiO0RK7nyQZ05S78be3ym?=
 =?Windows-1252?Q?oBtbGwBgYSE54Hv3FTGWyfwXBS3L+mSBawRGnAe320k0apT3gCi1KlQs?=
 =?Windows-1252?Q?JCVxrN2bbwRUiPy+OvbdTptvebVd/yat3SdytPFfe386jc81uDVyOpLB?=
 =?Windows-1252?Q?3A3BQyJpiO8lGUq6kK/X+us+60Rnm0X9BSnjsAdMOSGJa/U9ns++IJ8j?=
 =?Windows-1252?Q?JuHvtyMH90sTG2iGN+ZkLquRjqt0jyWojEtRCwKTMchx9hHiAsPm0TX2?=
 =?Windows-1252?Q?AK+7fbBPcHp+Ig8iKoYVtqzruU929VIrbI9r7ANRjVxiSAn3Pp0D194s?=
 =?Windows-1252?Q?r3N9RsosYEoU1vHtmKA5Itjm+wz4H4Ey/md2stxMrX5YRyBsi6b2SzTs?=
 =?Windows-1252?Q?ovGe7YQdBG2q+TjP0I3St+L7+JZsCj1xOFT1kGJuVMN05PofcLiL9kN6?=
 =?Windows-1252?Q?ODtqbKuv0/Pz3kqjOVcGqprK1LSSIqVS8VKUmpnRMdpsXcHb3gc+62Ej?=
 =?Windows-1252?Q?bkKFyw/NaHGxyd+px0uOOIs9J3uXSnuiZ2ESEVqU4i6HSeIEC7ADL9Go?=
 =?Windows-1252?Q?nd0R+fbXYOh5AYFwCZD48W4rZKWbYfcA?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9435c992-4754-4e44-1914-08ddcb48f75a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 07:00:40.4129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: URqW0Ib7CGSCtqjsZNpNa1wszhChxnk+O5wP3kgLeIOlOABspp2+nzfYqHm9i9ainwNyxCiLfo5xoDdDICF7Q6oC7pBhFSDE7YB/zELmPKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0081

> On Thu, Jul 24, 2025 at 02:20:10PM +0000, Tarang Raval wrote:=0A=
> > > > > > 2. In the regulator code, you can reduce boilerplate by using=
=0A=
> > > > > >=A0=A0=A0 devm_regulator_bulk_get_enable().=0A=
> > > > >=0A=
> > > > > devm_regulator_bulk_get_enable() doesn't seem to be a good idea. =
You=0A=
> > > > > generally don't want to enable power everywhere unconditionally, =
and=0A=
> > > > > sensors very often need a guaranteed power up sequence.=0A=
=0A=
-----(1)=0A=
=0A=
> > > >=0A=
> > > > The regulators are optional, we supply power to the camera sensor d=
irectly=0A=
> > > > through dedicated power rails and there is no strict enable sequenc=
e=0A=
> > > > required in this case.=0A=
> > >=0A=
> > > What exactly do you mean by "this case" ? Are you talking about one=
=0A=
> > > particular sensor ? One particular camera module ?=0A=
> >=0A=
> > Laurent, by =93this case=94 I meant the common scenario where power to =
the=0A=
> > camera sensor is supplied by a PMIC regulator that is always-on. In suc=
h=0A=
> > setups, the regulator is fixed and cannot be enabled or disabled from t=
he=0A=
> > driver, the sensor is always powered.=0A=
> >=0A=
> > This is what I=92ve seen in most platforms, where the CSI input connect=
or=0A=
> > provides fixed 3.3V/1.8V power rails directly to the camera module.=0A=
> >=0A=
> > Of course, if the camera supply comes from a dedicated regulator contro=
lled=0A=
> > via a GPIO, then the driver would need to handle enable/disable sequenc=
ing=0A=
> > explicitly. But I=92m specifically referring to the first case, where t=
he power rails=0A=
> > are always-on.=0A=
> =0A=
> How does the sensor driver know which of those two cases it is dealing=0A=
> with ?=0A=
=0A=
The sensor driver typically determines this via the presence (or absence) =
=0A=
of regulator supply entries in the Device Tree. If a supply is not defined,=
=0A=
it's assumed to be always-on (e.g., provided by the board via fixed rails).=
=0A=
When defined, the driver retrieves and manages the regulator. This approach=
=0A=
allows a single driver to support both cases, by treating supplies as optio=
nal=0A=
and only enabling them when explicitly defined.=0A=
=0A=
At comment (1): you gave two reasons why we cannot use devm_regulator_bulk_=
get_enable.=0A=
=0A=
What I=92m trying to say is:=0A=
=0A=
You mentioned "generally don't want to enable power everywhere unconditiona=
lly," =0A=
but on almost every platform, the power rails are always-on.=0A=
=0A=
And regarding the second point =97 "sensors very often need a guaranteed po=
wer-up sequence" =0A=
I don=92t understand why this would be an issue. Even if we use devm_regula=
tor_bulk_get_enable,=0A=
the power-up sequence remains the same. So how is it not a good option in t=
his case?=0A=
=0A=
Best Regards,=0A=
Tarang=0A=

