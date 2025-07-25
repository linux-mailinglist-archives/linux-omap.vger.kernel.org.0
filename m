Return-Path: <linux-omap+bounces-4150-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB5FB11C96
	for <lists+linux-omap@lfdr.de>; Fri, 25 Jul 2025 12:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC181561903
	for <lists+linux-omap@lfdr.de>; Fri, 25 Jul 2025 10:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A941D2E62CD;
	Fri, 25 Jul 2025 10:35:34 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020131.outbound.protection.outlook.com [52.101.225.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448E12BD58E;
	Fri, 25 Jul 2025 10:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753439734; cv=fail; b=lXriPlJpp4KOqLa2d1T6UW+SQiXL0wYUhysqbRhXaCIG92PtVMagQ3B5kKG04c6G8AmyhD8f8Mcaz74E0biB/CYBj6gDcxZZJrj058eRjrA44zS2EtA/LtaRd3fkBbP/+G+kSPH7KhNOmvrFCuyQ6qHyIo76PncBz9LiWuDoEUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753439734; c=relaxed/simple;
	bh=Oo0hQhzuHioO8l/BPWquc1L5tUtWk9sz/T7gwdbOdOQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m5d9nJgTEBqDNBSmubb+gHncXt4w/KVD9r7/MK6HliQ0oi9Sw2NGjnkgl1sGSRkPooUVu0U7CpLhebaD1b5SgH4BI1VaMEW+RHtKT2o5xNXdhTxcAGGSbAHTwwFJJCBojGnjBqtsYUt9LZJHOGv1yYoOj88FdS7Z5Jvu457B52U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNdRmYyASDby8bFFL+9hs+tk+8V7/cAZ9muypppBemmzXEcLI0geWge0S6ciFWkgD2z7mavfYvRVM0J+HuKob5YKjI+uYFE5uQ7e9OztsjUoAXLMZlqOnYY7/J0RO2thxJpM9C2RjpSq7vkIC6H85+eAT0argibcArxpq8Ev1dl280LS8PK60XHjtpi8RDlE8+FU1cBbt4NxqwPGgyh2nHD8Q70J0cc7Ni6B7ppfEOKRn90V7Dh7Bqf0+2R4quQadZhG1ktsiki2FQVGC9Bp/Y8cM2l19G2JqNzckrdGwMg+jbEXdOp9Ldn57Kfq9pKpm90cvnKsPjxOGHta0AdGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3UpnoDvQQVW9vXXybIKg2RVhDAmnO/lwsGVxI4WZcU=;
 b=hG2Pwalm3vYqCMZad7qFvm/7ip7e/OKrTCn386EPU/CzVz2axm7aYVl2pAZ3w7R3plYXCxhov1lYNftbCjO1HWYXm0GOO+EZoNxDHgLpdnnQttRaqxt21shRfIIWOEUQnQ2I+xiutUoepgq2VP5rqqJxWNlTNgJg3YdxIhOPfsIoIE+a4VQA+2m0rr6RjtEvhWmeVmR6tbKR9eqbxdHI3jZ17CyzHuXGzl2SX5Ses5JfXsUuquK+txfsKBkF2axwHZkCQW/kx41FJa/+et5ES57N8kxdb5HC0VD1ZKhyPsLt6y4hOjgpZkBm8/nAnHQ6xQ+367IG9Fhg8i7EC6nkHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1801.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 10:35:28 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 10:35:28 +0000
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
 AQHb8cLi1z5mGUN1NkaS3NoM5ohUK7RBNANAgAALMwCAABfMAIAACf+AgAAFhHOAABmSAIAA/hWQgAAt8oCAAArRBg==
Date: Fri, 25 Jul 2025 10:35:28 +0000
Message-ID:
 <PN3P287MB1829C2D2D0577D4DA82D6AF58B59A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <PN3P287MB1829DD1254FB74391A750F498B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724115202.GK11202@pendragon.ideasonboard.com>
 <PN3P287MB1829C9E8C78ADD70259A68F08B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724135259.GR11202@pendragon.ideasonboard.com>
 <PN3P287MB1829E1FEE7D2468CE9915C778B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724154414.GE22016@pendragon.ideasonboard.com>
 <PN3P287MB1829FC781EA3A94E0B8F16B98B59A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250725093805.GY11202@pendragon.ideasonboard.com>
In-Reply-To: <20250725093805.GY11202@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB1801:EE_
x-ms-office365-filtering-correlation-id: d1a4c73a-398b-4f7c-1eb9-08ddcb66f901
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?/YnIaMkSvcuAK7ST33ux1ms13YgG/eFxQMpLF/jSWouJuJj6/k2MykX4?=
 =?Windows-1252?Q?Xd9a1voD2NOMhlZ1iEBkOfmlbe2au4Rv59QwPSFcrzn8mmOXqqQEwxg+?=
 =?Windows-1252?Q?oIRmBhofYB+yUaE1JsHxQr/bGV3uv3Spcn4R5Dhefb/HWRHyWuveAQ5j?=
 =?Windows-1252?Q?u3xU1bbNhKpWNqbGli7t6GVmWxIm7Ylm6fgklxnXAf3wRMi+rrSfj4iA?=
 =?Windows-1252?Q?OHJcEThK8mnC3Q91yRQZF4UZhBiV5govNZ05HlRbiWKNdxVp1h0jtuUt?=
 =?Windows-1252?Q?Bppa9Tqm5aM/NTFFfbP38j9vW+BwFqxFpCIDrDV0zi1SWOMadrz0JAMW?=
 =?Windows-1252?Q?ycpaHh3ZVWmH2QXiWsGV/aRXoX8rwa5Wy0VT6jkzzVWgJMgOIm7NIGxS?=
 =?Windows-1252?Q?9t6l+tS/3COBpYAl5fNQlrSSOmcoSJOnoYiXSePFAJ+G4uqCNvf+WC/3?=
 =?Windows-1252?Q?lRLFIqwvVMT7uryQpIOeOnDpi8NSmT/reJX/OA19asd2Ug9tV/9m+pxu?=
 =?Windows-1252?Q?zqb/AZxKQFpjVA9XT29XG9/f5wNuYuLBSViQ6W7ou0WZ+9I55XlCbKFD?=
 =?Windows-1252?Q?ggOAgBC896K/wxY6kwfS0a2uppwxREYsTs4LeuDURt644F/o950rs9Rq?=
 =?Windows-1252?Q?apyOiqqjqDYK+hO0nC9TavJffBSnMUJimhcuMdwd3ucGmEFw2YceiXeC?=
 =?Windows-1252?Q?dqRn86qnS/JrZdALV/qx6S8sAnkOej2FIPEAueVHZt9a7eeor7k81f68?=
 =?Windows-1252?Q?O4GMH8FDExd1RiZIwhYqUYZMlgxrkmYWwEMMyCIydDvvY7010aKk1giM?=
 =?Windows-1252?Q?SOG9VlJNQ4CczS75ZmSJaUAuq9GJBdKSbaohvxTZQCzFoB+3mPU19hro?=
 =?Windows-1252?Q?MERPEbRfpm6lcaj9dhJiysJqqJ4k+nOBeqQLZH79ZXTaispESdEcRRVF?=
 =?Windows-1252?Q?jarutd9s2xfq0xptUOGHe7NKP/Wz6cOdDcWupxfAXqEhIMWFJdPS6cgO?=
 =?Windows-1252?Q?J7L7lWLcXUgWxuY8lvDjqO2b+uxnG1NF+2NWV4kOBBd8DbndGWh+Qdju?=
 =?Windows-1252?Q?V4gKS+lf61Zd5aFLsyXLw1EMncSjpPDuiuY5TAahIxUWQXw2SPPlevqw?=
 =?Windows-1252?Q?mEceF5Z6b92vIm/ItLMaHO9plR+yyPdQJgl1kFzNgNqp2cRK8F9XwCZl?=
 =?Windows-1252?Q?P/ytOeG0znui3k1gOnGQEE6DCCtmcGvU5Np58KdJAPUFa7Zj7qajJJRZ?=
 =?Windows-1252?Q?VpVfO9zyKwkYXsZUn89D45LZPA4FV1+E8zc8RzH3tT68HVAIRDsgCVHo?=
 =?Windows-1252?Q?q2ADWWzuOsKdZJdYgnqw15W3XkvQmmuSBZoeqOtMmbc2OK//zeEPWQCW?=
 =?Windows-1252?Q?soEK5oVazxOIyc1iQ0+ptfO38nwENZGrlSZjXNVlw92el1lJI8Cnx2+f?=
 =?Windows-1252?Q?5VzksF4s1pUP8ECvea5JlNCkNBGXv+G4UfX2W+8bHR1GDb5a/yB1z4K3?=
 =?Windows-1252?Q?MAFVUiFzpV/qZiXzgP5zvHJGNRKzMBaS82mSKIjGOGO8nFmyI9FQX7Jw?=
 =?Windows-1252?Q?3aZGuIn+3+Xh8RzOjPAvlHV0goRZdjBx11NP6w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?wVsiaCj+Gy2j3tC7ucMAOKnadBhM8Y7eWA/e20WaGrkVlICGSk5CDzs9?=
 =?Windows-1252?Q?YMuMnaD29g3baHw91te08Fxs7MW/iJUt/LOqDfb+sxCm2iuz9j7+MO8O?=
 =?Windows-1252?Q?bA8gtNTsE/Es8i4PGdVbAZFqfz7hT5MbBYCz4QM5GpqHMoCS4MTFu9kb?=
 =?Windows-1252?Q?XaG1bpozVHH2VoTSNqZAJ9962PH9UC9hiOCLZomhvfGTB3Th523I3HyZ?=
 =?Windows-1252?Q?lmd42+VdY6rDrg8fty0k7IhoywxYSg21gf7I+QXAKhbAyRaBF9Cz+oXY?=
 =?Windows-1252?Q?4YxQiwZGfsrFQJqrZI4roeTRtgTPG1iXN7nwdgTJewCCD+6Q2SbjO/Dv?=
 =?Windows-1252?Q?FGsAAY25YOF/VjymTaCJ1aXKLuzElhYSQAw1zhwYuVUGkWhACabuvHxy?=
 =?Windows-1252?Q?sucX4Qcdt7Czj6C2MjNiHe6K/gCDMOeizZj5+ojyifM2gleMkKp/sbuB?=
 =?Windows-1252?Q?JumKb7IEu6zkrD4xOqiuDgoFs6+X6ikGCBqf5ta6t6VuDlPoZK8rDQzL?=
 =?Windows-1252?Q?aXgJGINnegctD7blArOHcJvDkJR3AnbV4fDR6omU6qcCj6fjFS38ESBj?=
 =?Windows-1252?Q?PKz2naTIhhvdFOX7tNJ29Zw106PJEKqvjwoyKSQwasUf9zyA5gFGRlVz?=
 =?Windows-1252?Q?evFxRLAuul6L7JB9Wc5LCDaIf9+7XCGygsOJjDaqhNcNqix3OQX8XHDX?=
 =?Windows-1252?Q?td7SiCA/2e+11lB6QL9SeV/xz9PPvNmNhA4sWFiDW1Ooj/o4kXbqe1dm?=
 =?Windows-1252?Q?CmNJlUN0+uIlE2vNJdRz5W2/X/MkrJo4Sbs53sERUFUeR2kaHSLZ3hAV?=
 =?Windows-1252?Q?J848v8ejAYpqzkR6c3V3BmYd7QiFYCWZ0WTYSfntqHcpnzb2l6qI9cix?=
 =?Windows-1252?Q?iwG5yBsSg6hMtA+XmHasXbpOWr9IfbGXjeyAFaS8S1kbys9NUbYOA2gL?=
 =?Windows-1252?Q?/bSlbAm3jLn9Ov2rzK4ZRQBjqz+nobgF/BsEIL+5/+pBtWR+45rPBdSo?=
 =?Windows-1252?Q?LK39qlofIN6c5d01Rqcq4kfTerVjQwGsSXofAIqoHrgU7NphidL2QULA?=
 =?Windows-1252?Q?czC+65MNTeWzyBR4CaT6MIWRsOCGv9VdyH98xjGVio1JfDKjT0uCtfTI?=
 =?Windows-1252?Q?G8CM5rc1Z/oZrUkuE1JwHaXwaWTKNW5byRom4bBTFYEcvgf6UsLwQHqy?=
 =?Windows-1252?Q?IlU7GD/Css8Mf5b3KzDCOzRlJNN/CUUlLHifbib6q8r9ET4FcJFpqGs/?=
 =?Windows-1252?Q?NaZL5t6IGKoOrh9GeezpEHpF2i7qWZhtp7CH9SHUpe0TBJydwLRzqmEH?=
 =?Windows-1252?Q?0vhLLnbLc+MN3tjfjSblPoZrzmo0MxcXJF0vJm0OIbM1uq4bR+A3attD?=
 =?Windows-1252?Q?67n381Bjv4aMHng+eO9N/rb9EHWJ3jYIYWJuZglBDlHXwpZ3uWgoVrZa?=
 =?Windows-1252?Q?DaJF1J1iEbmxZHn/RzKY/lDtbU6hqEFFJ45mJUoD+rl2FsdSQ/1dDwKO?=
 =?Windows-1252?Q?qMjvv3gTGstWCSDEbOpZhgWybApKWBTvMUL3UYzdsKJwIc7TV7nPxzRk?=
 =?Windows-1252?Q?k1TqdWduRwE8ZfI684nBtAI5wcRckjuGxJgl+9oKZ+65ogDClKPR+PFR?=
 =?Windows-1252?Q?8pnOBi2B8MIcFukQFcOllGW5JCNMcufhFGFAwpJX9oqa4plKTudFf945?=
 =?Windows-1252?Q?diF3kie8fMN+jdDqhlpibN8Jedcpy9bg?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a4c73a-398b-4f7c-1eb9-08ddcb66f901
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 10:35:28.0907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+69RSTqrBqvL7kNKMt9yjhHEOCnqgGqYotYv8plO6Zw3URl0RRjahM1DQnXXrf5o3Ku4PQzDckBNjzgQSHoajE4BxWHihEDoCACKNDCxw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1801

> On Fri, Jul 25, 2025 at 07:00:40AM +0000, Tarang Raval wrote:=0A=
> > > On Thu, Jul 24, 2025 at 02:20:10PM +0000, Tarang Raval wrote:=0A=
> > > > > > > > 2. In the regulator code, you can reduce boilerplate by usi=
ng=0A=
> > > > > > > >=A0=A0=A0 devm_regulator_bulk_get_enable().=0A=
> > > > > > >=0A=
> > > > > > > devm_regulator_bulk_get_enable() doesn't seem to be a good id=
ea. You=0A=
> > > > > > > generally don't want to enable power everywhere unconditional=
ly, and=0A=
> > > > > > > sensors very often need a guaranteed power up sequence.=0A=
> >=0A=
> > -----(1)=0A=
> >=0A=
> > > > > >=0A=
> > > > > > The regulators are optional, we supply power to the camera sens=
or directly=0A=
> > > > > > through dedicated power rails and there is no strict enable seq=
uence=0A=
> > > > > > required in this case.=0A=
> > > > >=0A=
> > > > > What exactly do you mean by "this case" ? Are you talking about o=
ne=0A=
> > > > > particular sensor ? One particular camera module ?=0A=
> > > >=0A=
> > > > Laurent, by =93this case=94 I meant the common scenario where power=
 to the=0A=
> > > > camera sensor is supplied by a PMIC regulator that is always-on. In=
 such=0A=
> > > > setups, the regulator is fixed and cannot be enabled or disabled fr=
om the=0A=
> > > > driver, the sensor is always powered.=0A=
> > > >=0A=
> > > > This is what I=92ve seen in most platforms, where the CSI input con=
nector=0A=
> > > > provides fixed 3.3V/1.8V power rails directly to the camera module.=
=0A=
> > > >=0A=
> > > > Of course, if the camera supply comes from a dedicated regulator co=
ntrolled=0A=
> > > > via a GPIO, then the driver would need to handle enable/disable seq=
uencing=0A=
> > > > explicitly. But I=92m specifically referring to the first case, whe=
re the power rails=0A=
> > > > are always-on.=0A=
> > >=0A=
> > > How does the sensor driver know which of those two cases it is dealin=
g=0A=
> > > with ?=0A=
> >=0A=
> > The sensor driver typically determines this via the presence (or absenc=
e)=0A=
> > of regulator supply entries in the Device Tree. If a supply is not defi=
ned,=0A=
> > it's assumed to be always-on (e.g., provided by the board via fixed rai=
ls).=0A=
> =0A=
> Do we have sensor drivers that check the presense of supply properties ?=
=0A=
> Drivers generally shouldn't.=0A=
> =0A=
> > When defined, the driver retrieves and manages the regulator. This appr=
oach=0A=
> > allows a single driver to support both cases, by treating supplies as o=
ptional=0A=
> > and only enabling them when explicitly defined.=0A=
> =0A=
> I don't see what you're trying to do here. A sensor always needs=0A=
> supplies, regardless of whether or not they're always on. Drivers should=
=0A=
> get the supplies with regulator_get() (or possibly the bulk API), and=0A=
> then implement the power enable/disable sequences that the sensor=0A=
> requires. If all suplies are manually controllable, this will produce=0A=
> the correct sequence. If the supplies are always on, it will be a no-op.=
=0A=
> That's a single implementation in the driver, you don't need to care=0A=
> about the nature of the supplies, or their presence in DT.=0A=
> =0A=
> > At comment (1): you gave two reasons why we cannot use devm_regulator_b=
ulk_get_enable.=0A=
> >=0A=
> > What I=92m trying to say is:=0A=
> >=0A=
> > You mentioned "generally don't want to enable power everywhere uncondit=
ionally,"=0A=
> > but on almost every platform, the power rails are always-on.=0A=
> =0A=
> "almost every platform" doesn't sound right to me. It does happen though.=
=0A=
> =0A=
> > And regarding the second point =97 "sensors very often need a guarantee=
d power-up sequence"=0A=
> > I don=92t understand why this would be an issue. Even if we use devm_re=
gulator_bulk_get_enable,=0A=
> > the power-up sequence remains the same. So how is it not a good option =
in this case?=0A=
> =0A=
> Because the bulk API enables all regulators in parallel, it doesn't=0A=
> guarantee sequencing.=0A=
=0A=
Except for a few drivers, almost all camera drivers use the bulk API, which=
 suggests=0A=
that a guaranteed power-up sequence may not be strictly required in most ca=
ses.=0A=
 =0A=
> Don't use devm_regulator_bulk_get_enable() in sensor drivers, implement=
=0A=
> power enable/disable functions that do the right thing. That's the code=
=0A=
> pattern I want to see.=0A=
=0A=
Perhaps I wasnt clear in my explanation. If you look at the patch below, yo=
u'll =0A=
see that we are not changing any sequencing behavior.=0A=
=0A=
I am not suggesting we use this API everywhere, only where it's appropriate=
 and =0A=
doesn't compromise sequencing requirements. =0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=
------=0A=
=0A=
diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c=0A=
index da618c8cbadc..4dbf7215cef4 100644=0A=
--- a/drivers/media/i2c/imx283.c=0A=
+++ b/drivers/media/i2c/imx283.c=0A=
@@ -1176,8 +1176,8 @@ static int imx283_power_on(struct device *dev)=0A=
        struct imx283 *imx283 =3D to_imx283(sd);=0A=
        int ret;=0A=
 =0A=
-       ret =3D regulator_bulk_enable(ARRAY_SIZE(imx283_supply_name),=0A=
-                                   imx283->supplies);=0A=
+       ret =3D devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(imx283_suppl=
y_name),=0A=
+                                   imx283_supply_name);=0A=
        if (ret) {=0A=
                dev_err(imx283->dev, "failed to enable regulators\n");=0A=
                return ret;=0A=
@@ -1186,7 +1186,7 @@ static int imx283_power_on(struct device *dev)=0A=
        ret =3D clk_prepare_enable(imx283->xclk);=0A=
        if (ret) {=0A=
                dev_err(imx283->dev, "failed to enable clock\n");=0A=
-               goto reg_off;=0A=
+               return ret;=0A=
        }=0A=
 =0A=
        gpiod_set_value_cansleep(imx283->reset_gpio, 0);=0A=
@@ -1195,10 +1195,6 @@ static int imx283_power_on(struct device *dev)=0A=
                     IMX283_XCLR_MIN_DELAY_US + IMX283_XCLR_DELAY_RANGE_US)=
;=0A=
 =0A=
        return 0;=0A=
-=0A=
-reg_off:=0A=
-       regulator_bulk_disable(ARRAY_SIZE(imx283_supply_name), imx283->supp=
lies);=0A=
-       return ret;=0A=
 }=0A=
 =0A=
 static int imx283_power_off(struct device *dev)=0A=
@@ -1207,24 +1203,11 @@ static int imx283_power_off(struct device *dev)=0A=
        struct imx283 *imx283 =3D to_imx283(sd);=0A=
 =0A=
        gpiod_set_value_cansleep(imx283->reset_gpio, 1);=0A=
-       regulator_bulk_disable(ARRAY_SIZE(imx283_supply_name), imx283->supp=
lies);=0A=
        clk_disable_unprepare(imx283->xclk);=0A=
 =0A=
        return 0;=0A=
 }=0A=
 =0A=
-static int imx283_get_regulators(struct imx283 *imx283)=0A=
-{=0A=
-       unsigned int i;=0A=
-=0A=
-       for (i =3D 0; i < ARRAY_SIZE(imx283_supply_name); i++)=0A=
-               imx283->supplies[i].supply =3D imx283_supply_name[i];=0A=
-=0A=
-       return devm_regulator_bulk_get(imx283->dev,=0A=
-                                      ARRAY_SIZE(imx283_supply_name),=0A=
-                                      imx283->supplies);=0A=
-}=0A=
-=0A=
 /* Verify chip ID */=0A=
 static int imx283_identify_module(struct imx283 *imx283)=0A=
 {=0A=
@@ -1480,12 +1463,6 @@ static int imx283_probe(struct i2c_client *client)=
=0A=
                return -EINVAL;=0A=
        }=0A=
 =0A=
-       ret =3D imx283_get_regulators(imx283);=0A=
-       if (ret) {=0A=
-               return dev_err_probe(imx283->dev, ret,=0A=
-                               "failed to get regulators\n");=0A=
-       }=0A=
-=0A=
        ret =3D imx283_parse_endpoint(imx283);=0A=
        if (ret) {=0A=
                dev_err(imx283->dev, "failed to parse endpoint configuratio=
n\n");=

