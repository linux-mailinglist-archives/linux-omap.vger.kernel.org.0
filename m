Return-Path: <linux-omap+bounces-4152-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B0B11DA2
	for <lists+linux-omap@lfdr.de>; Fri, 25 Jul 2025 13:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F08CD3AA1C0
	for <lists+linux-omap@lfdr.de>; Fri, 25 Jul 2025 11:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FF92E6D3D;
	Fri, 25 Jul 2025 11:31:36 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020133.outbound.protection.outlook.com [52.101.225.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E482E6103;
	Fri, 25 Jul 2025 11:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443095; cv=fail; b=rYGoa/Gw7+bOgQZWTlI+mhsxWp2Tt9lKgWzwaZZCAUTYP/HUNAj680t1cQsWIREGcWSQAftF+L1hf7GitMD2jVHumIbp5JYUXtkqD3xu7GFMYlH5vLXXLmH9YlcYhr4nc0ih5aVVuXqLC0XPjHvxXgR3OldfuZDLbolN3hGU3FQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443095; c=relaxed/simple;
	bh=4ZuTnOEZTwKmmt/RF3u7IxqVLboJurw/BtJsFPbTb6M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aB4MFWtmGl+L7r7vVMdDjjXbcKVf2e2tkFQt3reFgm0J0wZq5edRm+4pJKY5aauKLv8y6h2CqlQpKwTxROKms8fOzT/sQdi1g02fFeUHP6oeCsdKDECKbLaihTbwqH3X6hjFStstKBhFvHfUz+X5m+KXM5qTy8850T15Ej4kjBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jES1WZv05qusTisc04pm/49cQ23gPrQNeIrmF39VnpY5hTfy0hHI3Z1NKv35svDkYDGeJs8/+S6S2rCThW/a+mDRsmRPlOGuCLh1WSZMnlgT3F6UlVtmtIgeos0VqDKNbHvSy8qkBKz09zukNDSFTvuYvv1noXrrzRmgKlOCptcnCmMiek3yatihoG/qgoCujC10rIQcAjK72x5MOTjEiM5swTGHW58LKbc+/Fugtkmz9yguMVHBYZd1Z9+U3KksAo2AYNBnvwtYOb5VBut5iOmPP+Gwgn/WQb7Bs2+vDoVvr1jDNGxQ74MRXkAEFjIxo8CNX1yUVTTeRl6F0CGW0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZuTnOEZTwKmmt/RF3u7IxqVLboJurw/BtJsFPbTb6M=;
 b=b5rXF94QNqZPkc9Z2yJp1NUj+y8yjLi/JdCnH8UtLZrZmLkyo5Jzxr+/sfj7tFUFk3VRa9+4tdvW7GPkG5PhQxUoaiuO8/QRw6hACYlkEay6ucbGhRrPrmg3fLMWjsQgNLH2g+YzGacrv8zP5K9dBHYfnb65zmIL8Z4T5QokWphLzTMPcmHiLfNKZTjXpnbEz5UBpz4hHFQOHIoOWLFqn/YKJPPCmDtI+DUgr5/kKdFp5LUXFUhHsZOOFXWeI8PaMzrAIXhaVzXJhqJ/DpjaG+m48d6mzEl0C2a6YkDC7YSnTneBiMrA0Oc43I3PyqgJ7ddyBGrjpFJsgHgi/tS1TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1468.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 11:31:29 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%5]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 11:31:29 +0000
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
 AQHb8cLi1z5mGUN1NkaS3NoM5ohUK7RBNANAgAALMwCAABfMAIAACf+AgAAFhHOAABmSAIAA/hWQgAAt8oCAAArRBoAADC8AgAAEjcg=
Date: Fri, 25 Jul 2025 11:31:29 +0000
Message-ID:
 <PN3P287MB18295F0D0450CEAD51C295728B59A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
 <PN3P287MB1829DD1254FB74391A750F498B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724115202.GK11202@pendragon.ideasonboard.com>
 <PN3P287MB1829C9E8C78ADD70259A68F08B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724135259.GR11202@pendragon.ideasonboard.com>
 <PN3P287MB1829E1FEE7D2468CE9915C778B5EA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250724154414.GE22016@pendragon.ideasonboard.com>
 <PN3P287MB1829FC781EA3A94E0B8F16B98B59A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250725093805.GY11202@pendragon.ideasonboard.com>
 <PN3P287MB1829C2D2D0577D4DA82D6AF58B59A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20250725110024.GA30386@pendragon.ideasonboard.com>
In-Reply-To: <20250725110024.GA30386@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA0P287MB1468:EE_
x-ms-office365-filtering-correlation-id: b4d19f18-5097-49eb-55a5-08ddcb6ecc6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?CAJlnmkmkKaagyjDJG5EpjZ7q0QVosHfsXBq0ddC2FjD6CyG85F43smm?=
 =?Windows-1252?Q?+KfZl3bxzGFANGpKiA+UZVFhPkEC+ahva1vbF+vOxDmZFY1vnIjGgZdO?=
 =?Windows-1252?Q?d9RS68V05N73gP/2Vg32o/eI3gH9LczgHK1zE/iKqDvXU49/pA7CaezO?=
 =?Windows-1252?Q?MfcibWbV/QopcfU4rlb6J8uLXSCDwhEpetBEimKYApL0a/fPTNZHztX0?=
 =?Windows-1252?Q?KnZWUzhFhk0XZYYa3D58ZpoUqgnga2CpKv5Q7kxwDBCDDu8DRzlMxsmH?=
 =?Windows-1252?Q?hjE8lxtzopYP/XnHEIDbcpLD6+NO1Qk/7p4XXgRAUZhYsPXKjVlCoBdo?=
 =?Windows-1252?Q?0+kzFxieIltNaSatKvp/RgG4FsgzZH0+3B3SfZHZO2YhSh+Ii/3nxZFx?=
 =?Windows-1252?Q?VsFBpFBE+6PDHlGiMIrryST217N5hFrvsFL1vPHBkn2h1/YKLdk49WS2?=
 =?Windows-1252?Q?ThEZx8tZStc60IPs71rwgD8BEhxTsfsOs3sQaHN/0WroOdPUaPoQMse/?=
 =?Windows-1252?Q?zGQkuKDGqdXMDf0sfWUqwOLZoumDNBWqZc+jrA7t2wLN93R9chJcLsE/?=
 =?Windows-1252?Q?5ZDeRmQ9BDCurIyufOLfzaIajEU2YfuDa3jaRcJWlcyMPBToKj5+iOzq?=
 =?Windows-1252?Q?sDQZeKv68CcL0bh+3nse5MwUwPb7jcoOzeR4GidRuz3YxwlFUWf2IvGq?=
 =?Windows-1252?Q?nD9lZsCUtNWp6S+x3THkBXOvf69hg+BK+24kzcyOY0wis3RSD6IFseFw?=
 =?Windows-1252?Q?vXvyWJaro/bx3OAymik+Ykpv5AvApMVcIWqVxKC559HNEC8stsia0+48?=
 =?Windows-1252?Q?yV2x6Cp+a0qHyyirieGaCFr+OUrMlKkWZAplSeDmhP54XhZBqQm/l8ti?=
 =?Windows-1252?Q?t9kqeHZM1ImEai29uYWKaov5V4347lTkyHfGIGk0fn735cHKRYQjEva0?=
 =?Windows-1252?Q?bSQds1sAUG3o9uLlRY67hVMRg8uvslteIhnzNZRmL5B2fqu62pL+XGRt?=
 =?Windows-1252?Q?fJEoHU1ocNPao/YLcKBltxnr4hcNbgTVhYiu0uXqFViineX60w1qdpc7?=
 =?Windows-1252?Q?SPhDl5thVlUhKHXL+IgnHk6nd3sV/mT/h+P9B7qCE7+7Vx4QBQgOGbie?=
 =?Windows-1252?Q?Nrbf2qXGDVkQfM8c4mGFakGXqt3PCRnsu8yEyDKLDa6OTusf7R8K9Veq?=
 =?Windows-1252?Q?oNZSkyDmZUVJlRsNBrYqWW8A/A48lq9BZqOMM3MjBelcJc26tLg7HQPn?=
 =?Windows-1252?Q?VVd4VxX4FbTmJIPjnPvY0EcxW+/ypLFTTrGssXPVwiU3FbLRaMdEp5AL?=
 =?Windows-1252?Q?3hS4ZbSD8qg6c3sLXBcAySwTB6z42SF0ClYJigraUwR9StZZ+K5vMS1B?=
 =?Windows-1252?Q?U6fWHSl8Q3Wa2Tw4ejOt0mlzkkW8huyWB0R0QDfq0YSmGpbUG/H50Mws?=
 =?Windows-1252?Q?aRvF0UJAnMfjofJpeS2ate58zgxPVqjAk5MRAH2oWLFdwCvwe0LKTfHG?=
 =?Windows-1252?Q?Oe9ICJhUDP5EQBELS6emjTF9boBBxL/nIN5lKboX51sp4VgQFrigwaR9?=
 =?Windows-1252?Q?Mi7Bbh2O17wlHT0++9c++bZ9ICM7VQ+T1lnvgw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?qy34F8hJundq0OXC7yp9/40pRbgrTdY9jMj2ix4KyLo8PT7qEjeS4A4U?=
 =?Windows-1252?Q?fHtHhCOaNglGyEuazD1TP3I4UpTT09JY1LFfEUDPYkiNvgvZIgdQngNc?=
 =?Windows-1252?Q?JYQUlGkx4bP1S1BvYDJ6dP1cua3JB18e1hfmNuclPyig8SQmy6/Gi+PH?=
 =?Windows-1252?Q?BkAYSFM8f9yHej0UPXjGVL45tslai45nQxlhcnERl9CSLLpEXIUcbJeX?=
 =?Windows-1252?Q?16lTM6z/gB9yKRrKGf34H/VB778oiOzy6T2yDpyM1Rb3D7tiDwr7/L0w?=
 =?Windows-1252?Q?ufiHPe6/4nQaGsUDuAoMlzoWX5KtE9OvPxCeiZEUPfp9lfJB8zV3Z059?=
 =?Windows-1252?Q?+cmTo+6ZlE76aHyXrL5FLJTdBSpB3bf8/J1Cjy9Qn2VO0+x4ocNDbp4z?=
 =?Windows-1252?Q?oPwaI/ct7wH0RGRxLBfIyQ08tt9s5PTyYPw3cHavQtoNrKbrgtyb8z73?=
 =?Windows-1252?Q?z5zRIh10YWD3NovZvQ+Osayatd/7Pp7QylPJ6a1W6mvpAEUGGzYA4WSy?=
 =?Windows-1252?Q?m5ds8nDMOBskfIwF5u1jDEmNi/ZqMP0tgnIa80Jd74WA0K2fuE2N6sbq?=
 =?Windows-1252?Q?+BikTIbuUT7gGWd6wcoOKCwSn3d4xJ3KKIOKsCaLQv4mlzPT/qMUpjVb?=
 =?Windows-1252?Q?5Q3EwFIy13JbGCzITACYkYO0MRab9lUW60jrlMctAqV6bpGW59NPVscj?=
 =?Windows-1252?Q?vlY8vJfSG+2pvGJuGYsCY4h7tvfhefI3ckjqFuNNN5h1jtfBNA0mgCQE?=
 =?Windows-1252?Q?5eBvenAwlNbaSJ/+PlJUnKvO9sqHAC5/xbUZA1XfcUpUXs1HCvZHDATz?=
 =?Windows-1252?Q?Dq95AfmoQgtQCe3Z1LFvAxID1ZC5OrmSDEdc4EC1cowPO+eQ4BUrvQEk?=
 =?Windows-1252?Q?zoSB+EhVCy1GNucDiRcxPs2QFViDqDWZPC7IcFe72t+rMIEtcDHztzWE?=
 =?Windows-1252?Q?hpSWcaAF2IXfG3YabWmqzdZHgArN8H9BSbZoRDjJoD3Ymgnlpkpz9s2e?=
 =?Windows-1252?Q?dptLUSJf5GlAInTKPFXjG9AfiphQQDctO+JmFcC1dH2+84thChS9SLUO?=
 =?Windows-1252?Q?R2iT6WNRN4KBpyX6JnQKb5I8jFYot9kpyDpT8YcS4uI/J0NJSPaVPOBK?=
 =?Windows-1252?Q?7ukE3cTzGMOBq4tzHKS3k4v8DxIKBNTmx7IJsws3v3vdvmX0U5OOVA/i?=
 =?Windows-1252?Q?5zMep8vm9g2NQckvrf/Nmx2a4FRZLKwvxqNhcidPFM8C6OvvBkg/Y2Xg?=
 =?Windows-1252?Q?js5ks9lNzcJvg9hWEf/7j84aKEqgBesaXNpFg+6alzD0jV5fqADYH5ac?=
 =?Windows-1252?Q?nN5k4fJCEMGmgMuh2IgR45Axp0qbKHtD3pD6+x5IVM3CKv/x2HcuaPp2?=
 =?Windows-1252?Q?XjF8zewiZnFv5FYHVljI/CZK3b9lRqyftvqnLcWwXoBtOXB3egUu6ezA?=
 =?Windows-1252?Q?bg1m4KkWFSBrKAIbMRPUSG+TcPBPROcNt0oPD9zG1BXIHMEzlul/C6k3?=
 =?Windows-1252?Q?oGG8CqodSPi1ne74vILKhQA3Q0gSHyOVEyr12m3spLmG4eqy2BOErvLj?=
 =?Windows-1252?Q?Buwh3Jdcugz/a29+JBLmaVgpFV6c1P58crr97d+sV7WgFg4TW1wGJSin?=
 =?Windows-1252?Q?IiTb/r2f4ddnpafWgsF9Zf2x81OTgBiwdJS1KUW8/vrsC2I0+ZE9DCnf?=
 =?Windows-1252?Q?ssqJqTQdjHq6LsX6eaFh2QpHRCzbMrsD?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d19f18-5097-49eb-55a5-08ddcb6ecc6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 11:31:29.1163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: inJg51guWefTQBAnvwGBy1YzFVI7GNSY065MvovVk66kuh41LYSlB2we8ELptyrwZjSix6t52Fg5WXZFJZzo85HLp3uqLQ+Uy2vluuERi84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1468

> On Fri, Jul 25, 2025 at 10:35:28AM +0000, Tarang Raval wrote:=0A=
> > > On Fri, Jul 25, 2025 at 07:00:40AM +0000, Tarang Raval wrote:=0A=
> > > > > On Thu, Jul 24, 2025 at 02:20:10PM +0000, Tarang Raval wrote:=0A=
> > > > > > > > > > 2. In the regulator code, you can reduce boilerplate by=
 using=0A=
> > > > > > > > > >=A0=A0=A0 devm_regulator_bulk_get_enable().=0A=
> > > > > > > > >=0A=
> > > > > > > > > devm_regulator_bulk_get_enable() doesn't seem to be a goo=
d idea. You=0A=
> > > > > > > > > generally don't want to enable power everywhere unconditi=
onally, and=0A=
> > > > > > > > > sensors very often need a guaranteed power up sequence.=
=0A=
> > > >=0A=
> > > > -----(1)=0A=
> > > >=0A=
> > > > > > > >=0A=
> > > > > > > > The regulators are optional, we supply power to the camera =
sensor directly=0A=
> > > > > > > > through dedicated power rails and there is no strict enable=
 sequence=0A=
> > > > > > > > required in this case.=0A=
> > > > > > >=0A=
> > > > > > > What exactly do you mean by "this case" ? Are you talking abo=
ut one=0A=
> > > > > > > particular sensor ? One particular camera module ?=0A=
> > > > > >=0A=
> > > > > > Laurent, by =93this case=94 I meant the common scenario where p=
ower to the=0A=
> > > > > > camera sensor is supplied by a PMIC regulator that is always-on=
. In such=0A=
> > > > > > setups, the regulator is fixed and cannot be enabled or disable=
d from the=0A=
> > > > > > driver, the sensor is always powered.=0A=
> > > > > >=0A=
> > > > > > This is what I=92ve seen in most platforms, where the CSI input=
 connector=0A=
> > > > > > provides fixed 3.3V/1.8V power rails directly to the camera mod=
ule.=0A=
> > > > > >=0A=
> > > > > > Of course, if the camera supply comes from a dedicated regulato=
r controlled=0A=
> > > > > > via a GPIO, then the driver would need to handle enable/disable=
 sequencing=0A=
> > > > > > explicitly. But I=92m specifically referring to the first case,=
 where the power rails=0A=
> > > > > > are always-on.=0A=
> > > > >=0A=
> > > > > How does the sensor driver know which of those two cases it is de=
aling=0A=
> > > > > with ?=0A=
> > > >=0A=
> > > > The sensor driver typically determines this via the presence (or ab=
sence)=0A=
> > > > of regulator supply entries in the Device Tree. If a supply is not =
defined,=0A=
> > > > it's assumed to be always-on (e.g., provided by the board via fixed=
 rails).=0A=
> > >=0A=
> > > Do we have sensor drivers that check the presense of supply propertie=
s ?=0A=
> > > Drivers generally shouldn't.=0A=
> > >=0A=
> > > > When defined, the driver retrieves and manages the regulator. This =
approach=0A=
> > > > allows a single driver to support both cases, by treating supplies =
as optional=0A=
> > > > and only enabling them when explicitly defined.=0A=
> > >=0A=
> > > I don't see what you're trying to do here. A sensor always needs=0A=
> > > supplies, regardless of whether or not they're always on. Drivers sho=
uld=0A=
> > > get the supplies with regulator_get() (or possibly the bulk API), and=
=0A=
> > > then implement the power enable/disable sequences that the sensor=0A=
> > > requires. If all suplies are manually controllable, this will produce=
=0A=
> > > the correct sequence. If the supplies are always on, it will be a no-=
op.=0A=
> > > That's a single implementation in the driver, you don't need to care=
=0A=
> > > about the nature of the supplies, or their presence in DT.=0A=
> > >=0A=
> > > > At comment (1): you gave two reasons why we cannot use devm_regulat=
or_bulk_get_enable.=0A=
> > > >=0A=
> > > > What I=92m trying to say is:=0A=
> > > >=0A=
> > > > You mentioned "generally don't want to enable power everywhere unco=
nditionally,"=0A=
> > > > but on almost every platform, the power rails are always-on.=0A=
> > >=0A=
> > > "almost every platform" doesn't sound right to me. It does happen tho=
ugh.=0A=
> > >=0A=
> > > > And regarding the second point =97 "sensors very often need a guara=
nteed power-up sequence"=0A=
> > > > I don=92t understand why this would be an issue. Even if we use dev=
m_regulator_bulk_get_enable,=0A=
> > > > the power-up sequence remains the same. So how is it not a good opt=
ion in this case?=0A=
> > >=0A=
> > > Because the bulk API enables all regulators in parallel, it doesn't=
=0A=
> > > guarantee sequencing.=0A=
> >=0A=
> > Except for a few drivers, almost all camera drivers use the bulk API, w=
hich suggests=0A=
> > that a guaranteed power-up sequence may not be strictly required in mos=
t cases.=0A=
> >=0A=
> > > Don't use devm_regulator_bulk_get_enable() in sensor drivers, impleme=
nt=0A=
> > > power enable/disable functions that do the right thing. That's the co=
de=0A=
> > > pattern I want to see.=0A=
> >=0A=
> > Perhaps I wasnt clear in my explanation. If you look at the patch below=
, you'll=0A=
> > see that we are not changing any sequencing behavior.=0A=
>=A0=0A=
> You end up getting regulators every time power is enabled, and you don't=
=0A=
> turn the supplies off at power off time. How is that even supposed to=0A=
> work ? It completely breaks power management.=0A=
=0A=
Got it. The regulators stay enabled until the device is unbound.=0A=
=0A=
If the power rails are always on, there=92s effectively nothing to disable.=
=0A=
Why would that break power management?=0A=
=0A=
This is a little bit confusing.=0A=
=0A=
However, I now agree that we should not use it.=0A=
=0A=
Best Regards,=0A=
Tarang=

