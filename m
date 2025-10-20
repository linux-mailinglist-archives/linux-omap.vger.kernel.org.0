Return-Path: <linux-omap+bounces-4718-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE6BBEF1DC
	for <lists+linux-omap@lfdr.de>; Mon, 20 Oct 2025 04:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74E61189974F
	for <lists+linux-omap@lfdr.de>; Mon, 20 Oct 2025 02:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1E129B775;
	Mon, 20 Oct 2025 02:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eMl4HhHG"
X-Original-To: linux-omap@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011056.outbound.protection.outlook.com [52.101.70.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40166946A;
	Mon, 20 Oct 2025 02:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760928248; cv=fail; b=tHHVS1Lst0uLxZrwomRLXL4wz1YlBdqvWnekfNhcjG2r09aixPKzET1+N/Td6GVq83v1Np9JdrmxlqUM3rwh6tn0SxkTUR4E+sXylBDcASD/Azi3LHltRgg3aYMHV6bN1lEbN/VmVH6PYnd8IlGlQscX1qP9prDlNu/LKofIBDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760928248; c=relaxed/simple;
	bh=ZJJxI8cmJWlbvHrOxAUj6LdVhlJgQAzr9yr+KSqnoOA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oHOeFW236c1ieU6o3IpI1je8Ef2LHg9D7SFfomLRhi2h5QciRzCsbKwignzvABbDiTVyvrAIXAav0E3nXkMb0jOUg+Goq3DitlqyUYKOGZpSJdmh4Ai/2g/Sn4pIRmGmXFaDwfNRjYR3FJWZYaB9j3KK2sjXvUy1gWjWbxjl0oU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eMl4HhHG; arc=fail smtp.client-ip=52.101.70.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eY/Rna3txmTesHx3eDzXELzqjb/t/IhhXVPP+qOTMsaJV9C7Fkt2nRn2avoP6I3MetorNcAR5gMPXa3Qo7GcEaaw6dh/MD0+5AECqMAeec0ZDsBxbHfB3PbOXwp9Hq+5P9hq9RbY/kE95Xa7qLE44+yCYBhtj9NBA3q/X/DBGcRiWe2aco+zTpCqjilZx5GX2/s3bEBGhITaQfJ03NYm3ZXbkJKHaicpkB0vd4enB/kfyg4KvRyIZmj0YjYKUH5AjiutmyXZo7f8y8MRlohJm6IvSrOvyuf35mv6E25xoSDaKhuqBQiTi8/L4eLFpr4wzaa/pUe3GeLAqTnHUyXz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJJxI8cmJWlbvHrOxAUj6LdVhlJgQAzr9yr+KSqnoOA=;
 b=qw6X8spfhzXQ8hzt1RG5eSRk7541uswmo0H/sgYCdyqCniJIS6IJiy023VdJ6SEkZmjL+MCzU1Ahxj8g1eJMo7Wib/J9/+Bxs5AuOKYOyArU+P74ynE8t5KQ2ZgWa+P9gp7AVVsHkq7aQPz7FE0Sj5HooAe9JL3VRLT7LItFwP4kE84lUWSL8bNEz0A9Vc8AaCkgJasHXWSNPdkCFZ4JbWR8cmP24BwOJaoPeu4YWdPAqNC5ZMgHAuRM15SjtztlrOsM4l8sogkDR2lBYzpADTIciuvnAePW4NAmN6lEkFGl4vnsDtDHjaS6tODnbpXXnYdnu5klzHFJOV1C2rMfbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJJxI8cmJWlbvHrOxAUj6LdVhlJgQAzr9yr+KSqnoOA=;
 b=eMl4HhHGHJbjSvhpYc7URSUDM9IPNOWdE0s5RHHVw20yKfPfyOTsz4R/guim0Ya+otdUihTmwNh6gQRWosFzArqyZlvqJ+fvK8cBqMC8ZY6crZqBOPKjr0RlRW8rqjSX9Ln+Fy9I6Z0EK1l/kXKNS56dwqcLHvmYRioxhVNJVXJLhFTwXlRXbkwAq1+ZZMX/931ibsB3yLnA3/mLe9W90cW8W4yPwNsH8TOuuEO/+AxZlXTX3p8Ki4HiTjYNwUtzfPebMf1LqDaAWEKU6Wj4EsGiDgMgg90jfbYwp+NTVBkwEAkL8LgPmNTTlzBduLl45KfBU3MeFRdpXQvzzDfpDQ==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by AS8PR04MB7864.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 02:44:03 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 02:44:03 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Russell King - ARM Linux <linux@armlinux.org.uk>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>, Shenwei
 Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, Siddharth
 Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>
Subject: RE: [PATCH net-next 0/4] net: phy: add iterator phy_for_each
Thread-Topic: [PATCH net-next 0/4] net: phy: add iterator phy_for_each
Thread-Index: AQHcP6Yii8cDtrJXh0O7yn+PRvkyLrTKV0EA
Date: Mon, 20 Oct 2025 02:44:03 +0000
Message-ID:
 <PAXPR04MB85101E1D2745F80940A5D14A88F5A@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <68a7779c-acc2-45fc-b262-14d52e929b01@gmail.com>
In-Reply-To: <68a7779c-acc2-45fc-b262-14d52e929b01@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|AS8PR04MB7864:EE_
x-ms-office365-filtering-correlation-id: 6d6b2334-d754-4c34-f13c-08de0f8287fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UGduSGtkL2d4WWloclJYZm1UMHorNTdtRmR2NVVhT01LTnNKemJDWWFudkpS?=
 =?utf-8?B?WURiZWozT0JyYjNYNzB2SUY4ZHpNR2VPbHZWR2hyc3NwU1pOTWxVMkhweHVk?=
 =?utf-8?B?MmtpNzdzaDFubDg1MHNFd2c3SmxKejF3eEVKS3haYzQzUDMzdFdTOE1JMWRS?=
 =?utf-8?B?T29ZUFkvQzdRcVpOZ1psemZCdUdBdm1NVklGUGU4dUxDRmNaaDFtU1VlRmxY?=
 =?utf-8?B?OVhkbWNuRjAxL0l4OXRud3BwUytCcUEySWtXblk1c3l0MS9aOE9XM0I0VG1Q?=
 =?utf-8?B?aEdZRytiZnJuMi9mSXBRcWV3ZHFnMFY0cVRWNUFtV01DSlhpcy9vT2s5TmZC?=
 =?utf-8?B?NVVpRCtBV0NRNVRVUlhzYXI5K1pzYjVybzZWaUJRdCtleEZiQWwwUjRiWTZs?=
 =?utf-8?B?aEdEZit6d2dSZVZlNnArelZXenRDR0Z6OUNTRm1tcngwQUMvUFphcERWbERZ?=
 =?utf-8?B?N3dPZVVOamdWTHA4NXVPY1NsQURKM2Z3aFQ0RXIzd1lDNHpiSTlXZWpSM25u?=
 =?utf-8?B?bWJkN1BHZ0ZhQ0p0eWJtWXBielBOY0xWOTRZMERxMEhhYnc2Uk44Rjg2WG5z?=
 =?utf-8?B?c2NDd1FxTTFZV2l4aURKdW9xWXJKbFg0bUxXeDVjZVJiUjJ4amp5ZUJKMUI4?=
 =?utf-8?B?cS9SZUVaZzNTOUVCTHlGVG14NDgxa1owK29jUjZTam9GakNsRk9ZSkNvanFC?=
 =?utf-8?B?VzBZNXEveGhSUWNaQnI5Kzl6bmRTcXpwcXFEUGdaVmZRblplakpMbXQ0czVE?=
 =?utf-8?B?SngvajZwVWxQZFJ3a285SmplWjc2cmVYSE5vbmxGeFp6UXNPc2NNcmJReHEx?=
 =?utf-8?B?YmQ5UE9mbCtzQis2WU4yZVVaaW9PeVEvaDFyb3doMnY1dzdaVm9BR2J0Q2oy?=
 =?utf-8?B?SCt4MHZsVW9XZWptMTJCZmpyN2pDN3Y1SEFndDRqcWhpOWcrYUNHeG8rcHE2?=
 =?utf-8?B?aVJRSmhxWUk3b0x2V0xjNUl6U05lVnZCaUNqNlJUK3U2R2xHYWJlR0V0Tmtl?=
 =?utf-8?B?OGU1bHdiQ1VmZ3YzT0V1WjF6eGNvaEZ1OFBJMFBWNmxydE5FMzBpSytwVWdM?=
 =?utf-8?B?UStwN3UrR3Jsd0lVd0NTd2g1LzNLNEJseldwMFJPdXRXVEpkRjJEQnQya2Ny?=
 =?utf-8?B?KzlLV3ZnQk8ybHY5ajBvQnZGVzFQRnFpNzhoYzFJWitTRWtJSWdjdXM3MEwz?=
 =?utf-8?B?ZytHQmFyclBFZnRnNGJwNUlpQk5tZnU0WHllY2xhTUo2cHhCYmE3RTVhYW5E?=
 =?utf-8?B?elBudlBkczJYY2VsRjU4SVBkVEc2TlRib1RGdTIydURFK0JzYzBvZ3NlVTlh?=
 =?utf-8?B?U3VYREZmOEYzOFVIWFdKcWUvYXZBc3A4ZHJvLzIxdm9YV2M1Z21JS3ppd3Rm?=
 =?utf-8?B?VUtrTEp4RkRDMWlCbFR3czdJaXpXQ2c0THR1TVIrbDZkejVkKysrTmtCajQ0?=
 =?utf-8?B?T0xlNjAzM3Fqa04zaXVCR2F1WjNWNjJNRmw5dzRtaVRSNUF5TkVLQUFwd2Rk?=
 =?utf-8?B?RGVKalY3ZDNGY2RWSjNkMTF1eXQwM21nTlFteFJHN0ttOXpQL1AxeVVjY2tU?=
 =?utf-8?B?aGVOb0Jya1hDZnhoRDROcFViOTBEb3psM0wzVEJRa242bjV1Ylp2YjlRZlA2?=
 =?utf-8?B?RytYR1MvWk1YVzExOTcrVkY0TjZ0bTVwQ3kwcWloZ0J0WVRvaG9IbU56aEVw?=
 =?utf-8?B?RGhlWDdYeWxEdE45eCtBRzR2MDkwVnByQnhTT2cxQkxrNVU0M0dXSTNsNE0z?=
 =?utf-8?B?TStleG5mN2VOM3FudzRsTzZCc1JtQTJvUnV4d0QvZys1Zy9KbVJ4RndDKzE3?=
 =?utf-8?B?L0dmK01XL3Y1SWtDL2FIOEh4RVpTQ0ptUFJuTUx3NVkxbXRQOHRQV3IrQW5U?=
 =?utf-8?B?L3J4ak1FRFNNQUQ1L040UU51RDU4dDlDVlJiMlhRVllYd2E0N2YxTk1ZeHN5?=
 =?utf-8?B?YXUya0FHc0VJcXo3UGFDa2QzSExaUDdNUC9lS3YxU1ZrZWlEekloU1JzYWdF?=
 =?utf-8?B?bVlERzF3ZEJwcHlSM2FIaDFjaUI2TldKZHU5cXhXNGZvRmY2RjBBako3d09K?=
 =?utf-8?Q?ipOA7r?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVM3dW50ZjJ1dHpseG1VOW1OK29GQWRTY3hQTWowRUxzemJVSFoxa3psakE1?=
 =?utf-8?B?eGxYM2FSR2p5UUlTb3JzM0VQU3cwTmZ2aXFNd0pDdmxzWHRCa3NrQmJFVWhD?=
 =?utf-8?B?VEE1Zm5BL2ROQ3FlQlJ5cGljNGdtNjVITUNCT1BLVEJJV2lqeWpJVFdyM21Q?=
 =?utf-8?B?ZThWbVdnSU15OUkzUkdMWVF3dEFUWVNYcEpLcCtadUk4WFMxRnNDb2ZWVXp0?=
 =?utf-8?B?cWxSL3kzQXRYVHVjT3d4NDlSOEN3cWFFanV6SHpudkhyL2szM3NISlFaYVVY?=
 =?utf-8?B?Ukpzem85bGI3a2tUK05yQXQ5UUo5dXplVzVneGFYNlY2a1JZekZheWFkbS9r?=
 =?utf-8?B?MUVOMW1IdjFMTGtVcHBUcUVZNnU0alVWY2p6NzF2VkpJcjBNR2tucFk5TVNN?=
 =?utf-8?B?eExtWnFuMmNxUzdxRDNkQk9XYitOUkpiSzBoRkNESUwwTVVrb3hXNEtFR3FG?=
 =?utf-8?B?ZmdpSjgvNXBMVzYwQWFRVmNPLzdXYnJUejI2L0NIWU9SMXp0RmlVNkpvU0Jh?=
 =?utf-8?B?U3BiRVFacWl1NWtMVy9xNkJybWV1RG81VGxvaE03SkpaN21xb1Bxa2tSdzNi?=
 =?utf-8?B?QkwxYlgreTUwaWtuYnArd091YnFlQzVQRUdHQ2pVVEd2LzR5OUZzcTAwRWlX?=
 =?utf-8?B?a1pXTVhORHhDbnhJVitHaG1aRkNpeXM0SzlZUkVQQk1ZUWRnK3RKQjc2T3RO?=
 =?utf-8?B?bENqUi8vdUJDaUlqUHZZRXhpWEQrZkZtbnVLM3ZubkxJRHNFZFc1c1B5TDdC?=
 =?utf-8?B?YkV1TGpXMFExTWJ0VWpqS09uVE9adFpOV0puUTc4b3J6MVFXUkhsMlVMaW9z?=
 =?utf-8?B?ZGRuR3ppTUNlc053VDFoazZJajY4aHpDMFR5SzBtalpUcEttREFmcnpCdllE?=
 =?utf-8?B?R05RYTBFd0xkcG95MllqYThEWFdReUZHMXVvNG44b0pVaWJ5VGtsV0VJRDQ5?=
 =?utf-8?B?UFF6aWNraHJINFlUR0FpaE8wQTkvV1dMRDdidXhsRVA3aHZYNnRQT2FGMjJC?=
 =?utf-8?B?Q2gwY28yNlNqNkVJSUx3NTgzYmpoY0x3VHp3a1BZY3Q5OGdvTXVBWWkzZW5u?=
 =?utf-8?B?bEdJTW1FM3ZrZnc3akNtSmNwY3lxWDllajdBVlNsMzFWTGdDRE9tQlREaGVt?=
 =?utf-8?B?YVl4MUZIWFlZVmM5RjQrbjNPa0g2UzFpSEtEMXVjeWhvYjFMY2haaXljcjVi?=
 =?utf-8?B?K3A0ZUQ0V0RVZkEzdXN3cTMzZFc4QWxtYml4bnE4ZG52U0NLcFgvZ0pjUHYz?=
 =?utf-8?B?V3NoYVYvQ3YvQWRzWFE4ajZCek9kbTdkTjZZdWtnYTdHakIyYUhiUXpITWxx?=
 =?utf-8?B?bE5ZeDJsODFWNXpVckxFeHIrdmc1K0Fib3g1OHB0L3pIMTZtdkVYbytEKzdy?=
 =?utf-8?B?V3lrS1lIcnhlSXpGdHVaQlZRamxGaytMaGZTei9lRi82aUxSUlVMNFgwZzVX?=
 =?utf-8?B?bHpqWjNvVzFHKzlwTFB0Y2R6Q1B2dk1jMktiRVFOeEtFTysrSkptc0dTYmo3?=
 =?utf-8?B?Z0I5UWJXMVAyYkd6b3k5Zkh3d2FUeXo5ek1XekEzUm95S0xnVkg0Qk1Bb1Bj?=
 =?utf-8?B?M05lbkZVdjhUTUd1ZVZYL0Z5ckVIZ25OTWwraG9GaWx2WTladEtZVFRFYm9j?=
 =?utf-8?B?K21GVmQyeFU1aHlCRmVnbUZTY1ZlZUpmMmNLcVJVRHMxb2tpVC9jTmZETUYv?=
 =?utf-8?B?azlGWlVpeGZOS1NvTVdLNS80UWxwUEhsVGFEWExRYUp3b0dJSDR0bU1Pb0lW?=
 =?utf-8?B?aWIzMTU4ZUxCWXhzdHhQbDhlc2NzbWFWc1ZwTWk5cURUZmJJTmxIbS9iYnNM?=
 =?utf-8?B?UldZYVFiQVNDcWVQaWhsdjkwclVqS24yUUxXZ01DSml0TWJabjlTQ3cyYmlQ?=
 =?utf-8?B?SytJQjUyYVIrWm05a0wyNzRvNEhEdHhwT3JONUN0NVlzbTJ3VEZUODRpZDlL?=
 =?utf-8?B?T29JaFY0ZW5pUi9wMVpMaW92WkJUSXpaWUE0NFd3OGRzWGZXT1hueldGczd2?=
 =?utf-8?B?ZzVaTkRVMDNwUlZMNHNudVQvNmszT0cyWE1URHF6QUNYLzgyT2xCaDhEbmJ5?=
 =?utf-8?B?dXhuZEN0aXlKL0s3UGt4K1BDR3BNV2ZrSVVuMUlhUThXdE9HR0FzSGVkQUNT?=
 =?utf-8?Q?WggE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6b2334-d754-4c34-f13c-08de0f8287fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 02:44:03.4629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iqKy1YAoOuD10lDtTSzQmfnEJ0hYbhqWEnoX7BnhvpyAPNgXx1bJYqOeo0nHKgL5PYJe/HKyAUqrE1aeeZ3vLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7864

PiBBZGQgYW5kIHVzZSBhbiBpdGVyYXRvciBmb3IgYWxsIFBIWSdzIG9uIGEgTUlJIGJ1cywgYW5k
IHBoeV9maW5kX25leHQoKSBhcyBhDQo+IHByZXJlcXVpc2l0ZS4NCj4gDQo+IEhlaW5lciBLYWxs
d2VpdCAoNCk6DQo+ICAgbmV0OiBwaHk6IGFkZCBpdGVyYXRvciBwaHlfZm9yX2VhY2gNCj4gICBu
ZXQ6IGZlYzogdXNlIG5ldyBpdGVyYXRvciBwaHlfZm9yX2VhY2gNCj4gICBuZXQ6IGRhdmluY2lf
bWRpbzogdXNlIG5ldyBpdGVyYXRvciBwaHlfZm9yX2VhY2gNCj4gICBuZXQ6IHBoeTogdXNlIG5l
dyBpdGVyYXRvciBwaHlfZm9yX2VhY2ggaW4gbWRpb2J1c19wcmV2ZW50X2M0NV9zY2FuDQo+IA0K
PiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvZnJlZXNjYWxlL2ZlY19tYWluLmMgfCAgOCArKy0tLS0t
LQ0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvdGkvZGF2aW5jaV9tZGlvLmMgICAgfCAxNCArKysr
Ky0tLS0tLS0tLQ0KPiAgZHJpdmVycy9uZXQvcGh5L21kaW9fYnVzX3Byb3ZpZGVyLmMgICAgICAg
fCAxMyArKysrLS0tLS0tLS0tDQo+ICBkcml2ZXJzL25ldC9waHkvcGh5X2RldmljZS5jICAgICAg
ICAgICAgICB8IDE0ICsrKysrKystLS0tLS0tDQo+ICBpbmNsdWRlL2xpbnV4L3BoeS5oICAgICAg
ICAgICAgICAgICAgICAgICB8IDExICsrKysrKysrKystDQo+ICA1IGZpbGVzIGNoYW5nZWQsIDI4
IGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQ0KPiANCj4gLS0NCj4gMi41MS4xLmRpcnR5
DQoNCkZvciB0aGlzIHBhdGNoIHNldC4NCg0KUmV2aWV3ZWQtYnk6IFdlaSBGYW5nIDx3ZWkuZmFu
Z0BueHAuY29tPg0KDQo=

