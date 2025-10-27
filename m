Return-Path: <linux-omap+bounces-4778-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABD0C0B9C6
	for <lists+linux-omap@lfdr.de>; Mon, 27 Oct 2025 02:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAEF718949CF
	for <lists+linux-omap@lfdr.de>; Mon, 27 Oct 2025 01:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C4329BDA2;
	Mon, 27 Oct 2025 01:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="itlKP2Sr"
X-Original-To: linux-omap@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010026.outbound.protection.outlook.com [52.101.69.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5888829AAE3;
	Mon, 27 Oct 2025 01:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761529384; cv=fail; b=tbJzOZuq2qSD6P65c0xL05oT7+Bh+t1ZSuTpdMeDZAWaOBJiRhT54K56m50DTIIT16RazyUhPjPSe0AtsczisbNQhtLiqBoMHxYLSwl76QqtyKoy5BqtpTOKxnUr4o5+N9YKpxFHWVKY4ABVOg/QfYfCMNL+UzNUu39auIyNfds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761529384; c=relaxed/simple;
	bh=lxJIOZyNIl2rYf0VjCCEHYw//HjPjmMOaR3BG7Dzk8c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rZ9kIOMPA52I1NC22UOwwd3vIsQlMbAhxtrnFsdcskgbaBhN1E859Sr5gN0pRw4SO+5agsllTQrvYr6NFPjEukpa+lOkanESHq39Z11/BClNFXAFNvSW5PjG7rhPFYhcGjYOtNTrtr4AfjcCEQ2vIc0hFxno76lqdW0sRSqA+LE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=itlKP2Sr; arc=fail smtp.client-ip=52.101.69.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeslW8NE0Iyf22Ld/0VVBeLW8vxOJtDCP+56D6GfSj8/s7sBkSZlEMWZPvRg8sU9hsNRqtiE/1fh2a7eR59xwW/nKDukJ43v7Vr+8N8YTRGkiNmMitvj9zsuTDjfeuiXflkWlgeQWOq3hNX/yJNoqsBAMJDPHCnI/kt8kKL7hT66DdhCmI7GCvAMEyXFFwx7a93eldmQmF9bV0dyOA85gEEbVxwy9U9fC48kAC/QRTNRLfFtZje3bFSTn1pAqKQgqWmJwhVsi9ESuErtwxp0aYHgjHiTTu/Gk1iMRDZ5KgYOm9jsFsuQdIOB9FiiGlVcshIAThFydn33JC2I+aknrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxJIOZyNIl2rYf0VjCCEHYw//HjPjmMOaR3BG7Dzk8c=;
 b=SEDaS09k5WkVsqs2xxWyecPr0c3WS0LHzBCgpLgjTYnWSb5rkm+NGIgHxkZZDS0Af9un7u4YBkvB2pxeubtUOY3T1K/yMNOXJPUwmkhDPkstpbJt/0+0vqsFkdjs/MlwJA5n7BgTtZLjKsdAX9rE9tPBhMgfh2yOvdrYGsOfSJfgp5Ztja+FvGHJyYRYMiV2oiQzvljaqDyGTZZBVIIU965gw1s6ofqeQpG/eJ8a7/xYuL1Fsrt7iyniRwHDFzUt0WQ5d2uOUaMcqkeKnurIDhEik8q2uuISyOBCvrFVMNUHDJI4nLOO1ljZRdLSwmy6Iml8+yP0ElUatnlQfeifOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxJIOZyNIl2rYf0VjCCEHYw//HjPjmMOaR3BG7Dzk8c=;
 b=itlKP2SrjnxVXtjqLfvZw4WQwqR4+T2eijXxcFgXJcM97elDn76vji2VDTzuwXB+AhfsXtV57VdIBkSMMtARohc9a9SxxydrMUhdOsq0rwHYQU2KfK/EdfafkKF4i/VxQmDwa+6NWtdfvkhBn2nJjFdflejLo8glYIW1ueZXrGZzzCXw5bUcstAeSkVN4Ge7OQRQJbRbN5F5BVOKgs0Jj6aA4gm8FM3pkZ+WuFrR5FR1HUbix3dfYPUrjS+T/0gkMalgAHvG1U/3gdDkZWfCr3vSz8GdRZI4/TPY9+sEPyEcd8bjvyYJlmIvLbK8AHvw75TeRfEbh7PgkrwwhcX8QQ==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by AM7PR04MB6886.eurprd04.prod.outlook.com (2603:10a6:20b:106::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 01:42:59 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 01:42:59 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
CC: Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, Russell
 King - ARM Linux <linux@armlinux.org.uk>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, David
 Miller <davem@davemloft.net>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v3 net-next 1/4] net: phy: add iterator
 mdiobus_for_each_phy
Thread-Topic: [PATCH v3 net-next 1/4] net: phy: add iterator
 mdiobus_for_each_phy
Thread-Index: AQHcReAoNMdh4ObHIkGnEBDIB4NZj7TVOguA
Date: Mon, 27 Oct 2025 01:42:59 +0000
Message-ID:
 <PAXPR04MB85105CD80DD287E11CF81F1488FCA@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <07fc63e8-53fd-46aa-853e-96187bba9d44@gmail.com>
 <cd112f15-401a-43d9-8525-9ff0965a68cd@gmail.com>
In-Reply-To: <cd112f15-401a-43d9-8525-9ff0965a68cd@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|AM7PR04MB6886:EE_
x-ms-office365-filtering-correlation-id: 31a02e4e-63dc-43b4-cfe8-08de14fa28ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q1JkTlppUlZoYytTaUs0TU9mdEJzWGdyNTBaWGI4WkllZ2phZVBrVWp1WkFI?=
 =?utf-8?B?dUNYRExZQjlzbzdSaXg4VGNGYnhSY01ia24xTWdtNjFYLzhvT3hlNm5rSjRl?=
 =?utf-8?B?b0R2YzF5a0xGNDROYWlvNWRPRXk5NElxN0JkTkNodmphMHFncENUZytpK2R1?=
 =?utf-8?B?ZW94K2Z5NUMreXZ1Uk5rWDFnL1kzK3pPQXdhM214cWxQVHhRNHRoZHE3a1Nv?=
 =?utf-8?B?MjFwajV1M2xHYm9xSmEyTU1lYnNWN3RPZVlhcnBSdFZMOFZPOFZaUEJSUkwv?=
 =?utf-8?B?cUs1UFhlK0FHTmpTT1NBRS9la3V2bjBnNXYveDZEWnV2bk5zQW56ZnpsQkM5?=
 =?utf-8?B?Qm9yNUUzUkFFeUYxdWR1aE1jc3VVM2FnVW5rQXJlNW1oVGxLZFhjS2JEM2dL?=
 =?utf-8?B?SDVnWjl1NnFYNktpZThaT3J3RnJPVFZkdU9IMHBRZnFWUkIvWUxRMkdMdXc3?=
 =?utf-8?B?SFJTVWMxS3QzUVJ5WS9vMitXVTREcFRFcmtxYXJYMDZORnhlOVE0OHhtL0M0?=
 =?utf-8?B?VmI1enZXSjVmQkxDcEpBa1JGWHJ5eTgvOFl1Z2dhRlhJaWcwZTlPY3hZdVBm?=
 =?utf-8?B?b2FDMTRRUHZmZ1pZRVZhRFZkRXJydjQ0VTVsYWNqUm1WNnJnaFpiY1VNV1pC?=
 =?utf-8?B?SU83cm0vUHZQanNDTnd6Z0NXVWNnaXdhYUZzWTE3djMxSUN4ZmVzVE5Fd1ow?=
 =?utf-8?B?MXpJQzZwYTlvMlFhbitsTTM5OWJkL3JXYnNxbkJEZ1pEc1dtZHJDSjUybnZE?=
 =?utf-8?B?Y3lQQ2l4ejZ0ZzdNMVRGdVRicW1wczlSR0kwbmxSazlQRkQ5b0pyd05YY3RN?=
 =?utf-8?B?S0p1VTd1MlR6Yk51ZzlOWUtWSDhFY1RTb3pQVktDcTBUWWZ0QXMzVVFvVDd5?=
 =?utf-8?B?ZGRlbFRqSzJwbU43b3JyaEFHWlNzZnIrVEg3RkVyKzFNR1pIKzROamNkYzQ1?=
 =?utf-8?B?U3hVV0pxU3BobTc5Zy9Oa1pOZEcxWkFXT1N2WHpTU050VU9oK2tyeFJZQlBZ?=
 =?utf-8?B?YlNXQXVzUnpOaTlqa0NlWEFlb3RDWUg3WEVGaHZJdUhyeU9YOXpiVE11VjhE?=
 =?utf-8?B?aXpWUDlFUWxTV0gvSi9Vb2dZd0lSaTRnVERDYkZOenBkVytmRnp6WFg1U3ph?=
 =?utf-8?B?SnVKeFNIS3pJRFRRT0hnL2pWMlhsM1BUeEdTMXNtQTVZWGFBYWZ6WGFDMFd2?=
 =?utf-8?B?ZTRJa3hKNWh0OWlabjA0QnZzWGlBNVlZcXQ3bzdTR0JsOEZHckFxaDNRT2gy?=
 =?utf-8?B?Z01rRzVkNWVwR0VhZnNUYzdkdnNqSFhGUUVkcmQvOTVHdUxvZS9PVXF1Syt6?=
 =?utf-8?B?Ry8zSWlCd2FPOFgzMjdoOWZVdzNVN290VFQxTUZlK2NleHp1MldnTG1Qamh1?=
 =?utf-8?B?aDlST042WEpPSFptM2R1STFLN3lUT0QwWTNkN3hkTHUwMUozRGdIYzZ2aDhR?=
 =?utf-8?B?VDhNYWxHWUd3bEdmQlNVOWpCWlNkMmw5Q2cxK0xiUGZOeHRGMnhZUEQrQWdi?=
 =?utf-8?B?bllLakZsNHJHQThUOGFZS0xZa0ZyN0d5aDBnTUpSWHNNTVA5VmJ5S2EreGdO?=
 =?utf-8?B?S0NFYXJ0YSsyYzY2ZEl5Qkg3eEdaMTQrWE4wSklvL0wyVlprNGpaRlhXWGhU?=
 =?utf-8?B?V0lONVhqU0NTU2xtQTN4RTF3Zkt6WUxLcmcydFgzNmhCYng0QStqbXFCM3lZ?=
 =?utf-8?B?SVc2WEF4Lzdza1ZwV0hib1RNR0JOckNuS1hMVmZYZ0hOZTV3TWVXbXBJeVlX?=
 =?utf-8?B?azZLQkNvc0NSQ1JMRk12Yzl6dlBhRGdjK3RXZy8xYzh6ZEM4YzF2R21KRXcv?=
 =?utf-8?B?Y3JlZDNDRWtyc2diQ0pLTko1eTVrVUdKOGxXYUYvTDVrRGhpVGw3Y0psM1dL?=
 =?utf-8?B?b3M5R1pZUHZqTjVsNW80WWlHdnRkYTBGQ3Y3Mjlubkk3a0FXVGJpTGJ4cytI?=
 =?utf-8?B?MjR0T1ludlVtWnc0ZTJiRlgxMmJxYk9vOVNLSVR6UDJ6OGNUdFErL29kNUZK?=
 =?utf-8?B?dEFUWDluWnNqSHlGK0pHWENjczNIRFJBbGtFTGIwcE5oNEpvQ2RiWDFSM2li?=
 =?utf-8?Q?s3bHnS?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?czdOTW5PNUMvYlhRS2Z0OHQyRVlOamNzTnJPVERNY0tHNmJsb1FFeXEzWHhl?=
 =?utf-8?B?ZE8zZHFTQ0JWVjBhVjE1RVVTOTBtN0ZIQlN0YlpNMXRoakhDUk1Pc0oyWEhj?=
 =?utf-8?B?aGd5ekoyb1BBQ0t3Y2xXLytFQ2hFU3VjdVdNWkpWQlJHSnNNK1hORGVnUXBl?=
 =?utf-8?B?TEpLNGNNZ1djdklkcy9zTW9rOGg0em0wMWJxTWh1RC9tQU41VGk1VUtPTVNj?=
 =?utf-8?B?QU9iR1dFVCs4RDY2MmF0T2lIOEJzdzZGUjIwb3pYbGU0THVZK203S2g1THVG?=
 =?utf-8?B?OGJVVDFLWDludDRrdHUzVmpaa3B6bFIycUQ1dlptc1k2SnB0cXY2UmJ0ekx2?=
 =?utf-8?B?eG1uSnZlMllkVUduWnZ4MktpY25oRTMvL0p0c21XRFkvdmJPWVp4bDVLWE90?=
 =?utf-8?B?K1BMUTdUQXN5V1lEaVV4MElLWnhiZkFTV1llV0tKSjRnWmlxamZQcE12ckRF?=
 =?utf-8?B?ams3c2dqYXJYdVVJTzYyaXNJdGMyUFVVcFRwcUpVc01CU2gxa25saVJJb3Fs?=
 =?utf-8?B?TDhhRkJlZzB5em5GcTNUQVVxVjBRcTd2Zlh6aTkwYVExak53RnJWVWYwYzZE?=
 =?utf-8?B?Z0VlTUxRZEpvMWZ5Tng0OGIzQ3dneTVIcmFmUXo2NG5jWVBtaDNPNlkyR1I2?=
 =?utf-8?B?dVpxVWxaZzZOOXhpYXFQc3dtSTl4ejRaZWxqVFA3SHNWeWxEeUlDOVpCUmNJ?=
 =?utf-8?B?dVhEektKWWlqNDZrai9wUU4rVWhKc3VwcW9od2h5VVZEaGVKeS9uSG9zMjlj?=
 =?utf-8?B?NHlLVzBuNEhsNW9KMUs1bm1welZzS0QyelU4TGNKbWtQNVpJZ0xRV1FkTy91?=
 =?utf-8?B?L3lZeHJ4YWR6T1c5aWhtOE1GSmpKSkh1UEJuUjdHUjllRHl2dUZHMGVhdDgv?=
 =?utf-8?B?dm5DMDdGU3A2aTQxbHNzUHgreUFRY1JYS0RNRzl5OFBUNlNjRWJUQ1NqOEpJ?=
 =?utf-8?B?UDN4Q1RMczhMUlBzc3lGelQwRlM2NlNRMG5TRUd0S1RBYXdVN2lLQlRMV3la?=
 =?utf-8?B?TXpwSTdnNlV1TDBKN21wMHBIdGJiSjhGbXFrM3lQSUVKaXFtRVl6b0krRXlz?=
 =?utf-8?B?UXhVU1FlVG5HVXM1M3FLdTlzZ0xXRmxtN29jekwvM1p5UXA2V2phbExDOUd4?=
 =?utf-8?B?Q1dZcHMreTM4TG5ZdFo4MFJYTHdpRzlBMTZ6eGdJQUZGcXptaUZGTUxJZlVh?=
 =?utf-8?B?Mng5VTh1emVPZzRQUEhGd0dXMkthQ3JBNkFsamxFN0lJSnA4UlRhRXErTGxk?=
 =?utf-8?B?OWZUM3Y4Vy9vdzF0MFZ5ZW9pMWo0SmJ4aFpJK0pBRDlKNWJmZmUrK21ZbUli?=
 =?utf-8?B?dHM2RFVBWllybG9VL2NuSDVLZVVkc3F4RG02Nm1rQVlDZnlpRXBRUGtLSGNM?=
 =?utf-8?B?S1YzdDdabWlOYjFWZ0tOdEE1dmtkRUFmUCtxeS82OERwQ0tiTFlwWFgvV2Z3?=
 =?utf-8?B?eDZyS3dOMjI1YmNHMXpzNWV6a1VwaXRPWTRObHRCTTgvYjJHQ1ovR0NVcWVJ?=
 =?utf-8?B?akF4bld0d0Z4c2w0Y2IwdEhod2kzN3dHaEU3SXZ4WHo2blJaeTF1MXplTXcy?=
 =?utf-8?B?T3lUVkNFM1phMUF3YWtyQTNPSzFFckNUVHd1K1BKQWY4ZVd5RXA3eE14M0sw?=
 =?utf-8?B?VTJxbmFaODZzcllVQ1BveE5VUTR3Y1Z5NGZ2WEtQejRQdHN0cmJkMkJxeHVI?=
 =?utf-8?B?QXdNMFBjelZJeXhTUElmeHovNVNGbjRzTHBwQ1B4b2xqV1ZQS2VGKzdDTHdk?=
 =?utf-8?B?VXVCcmd4NVA1QWwwdWlmaWxwVXZPV2FNT3BDd0F3QTRLSmVxNEkrdjVJQ0o0?=
 =?utf-8?B?enJKVWZzem1DR1VvSW1RNDZSZW1McUtyM21ZQ0dyckkrYVo2YVRLeW5TaW8y?=
 =?utf-8?B?dTh1L3oxY0FRaDJLQkNYWHdrMzVwTXBJVjJKeFh5emdnREhIN210NkxTWXdp?=
 =?utf-8?B?S1IrQitSZ2I0QjV3cnM2aFNRZGRlMjhVclBDeis4QkxxQWNjUWFac1lzeWhL?=
 =?utf-8?B?bTJQU3I4cVlvOHRpM25yL1lFcDFuRnJwN0FoVTdGSEFYd2s5djQyYVI0aEpw?=
 =?utf-8?B?YTdSWDBJUTVHaThVeWF5QzNPWVZoZ01MT3JZc1k2YzE4V3VyY2Y3ZmMvUGVa?=
 =?utf-8?Q?TfqQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a02e4e-63dc-43b4-cfe8-08de14fa28ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 01:42:59.3758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rC++cISZcIvaCLG1/HMrLFyTeQkwwFBg+sRY3g8+YfDaqtCqoujkQB2sLCvhCW2Hm7GupOjSPMXBHiYYTm4K5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6886

PiBBZGQgYW4gaXRlcmF0b3IgZm9yIGFsbCBQSFkncyBvbiBhIE1JSSBidXMsIGFuZCBwaHlfZmlu
ZF9uZXh0KCkNCj4gYXMgYSBwcmVyZXF1aXNpdGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIZWlu
ZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPg0KPiAtLS0NCj4gdjM6DQo+IC0gYWRk
IG1pc3NpbmcgcmV0dXJuIHZhbHVlIGRlc2NyaXB0aW9uIGZvciBwaHlfZmluZF9uZXh0DQo+IC0t
LQ0KPiAgZHJpdmVycy9uZXQvcGh5L3BoeV9kZXZpY2UuYyB8IDE2ICsrKysrKysrKy0tLS0tLS0N
Cj4gIGluY2x1ZGUvbGludXgvcGh5LmggICAgICAgICAgfCAxMSArKysrKysrKysrLQ0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KDQpSZXZpZXdl
ZC1ieTogV2VpIEZhbmcgPHdlaS5mYW5nQG54cC5jb20+DQo=

