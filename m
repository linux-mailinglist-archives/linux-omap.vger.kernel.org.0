Return-Path: <linux-omap+bounces-4779-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EF8C0B9CC
	for <lists+linux-omap@lfdr.de>; Mon, 27 Oct 2025 02:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BADFB34832D
	for <lists+linux-omap@lfdr.de>; Mon, 27 Oct 2025 01:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADC329BDBB;
	Mon, 27 Oct 2025 01:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nRdJnHz/"
X-Original-To: linux-omap@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010061.outbound.protection.outlook.com [52.101.69.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF64E29B799;
	Mon, 27 Oct 2025 01:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761529416; cv=fail; b=M0DA2A6/wj9KjHeanZrIwSbNayxVEyRLw4REo6FC72DiDuyLk9Os3Q44PG9XOToeqoLu2PZKpo9nRFkqAUP2nO4Nx2O58wGgYtxLgGAY/QsXODkIoV53f94QqXEaPFGnT0dTIP9ylWJMeLtpt/D6sf4YPMzDfSmny7PpWR0L6TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761529416; c=relaxed/simple;
	bh=ZRmCRqZq7lSzd/OL9K5H24ztVXsinWhb9BTAfJEAGys=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kpgGoGw5BXN2aS6Td1uyKqxIIw9gLyPmiZ5ALoI3tCMEXwf+GZf/7f0S6LFTRRp++oIrMPHTwykVo/Ul9r1b1BiLpKSbvA9/u81NyqaX3JxlKzGMALbacnb2Mdxx3oPqc3UhFRgCu9dwaHjPXFe1q1Sot97S9QpN6JqMQBAbgqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nRdJnHz/; arc=fail smtp.client-ip=52.101.69.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPeTJW3xPaZ+pZoqk1pAHF4fIexCMB/lOSF/BoZ6aN0fY3BG1hVmqNCpCAcdTxFsfDDkRbUex8CsDBZnjOBYd8ByZm8wR4ZcQh6hkAImAeuiZEGsYtHnJZRX5CePkBFdHHmXz7l38F5sFqzsn22vyfEA8EZYpgAwl0L7281cZt9rNr1OeN+zw/JR6Sln/VC+s89NNtqpFiAWi92SEWZ3J1Yv/ceCROONnQX1w7ZRf8t75jJZujxagxWfoMRKr4KscT8j/QlFP7tHMrdTc2qbJCkGADdrqRdBRpEF7VXvUuSmRCWaJslqhmwqjPg33NSBBI0SP6/QdEdM53qy8owIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRmCRqZq7lSzd/OL9K5H24ztVXsinWhb9BTAfJEAGys=;
 b=C5GBGduQ317YuIP9HxSPDU6vOZmgNr0DpkRuJ3rizqqsIqwCxXfzeWr1+0jba/vsZrm7nTaKnysDB6li4sRCiqxF/oca9h0EaDmjW8RbQgo/P83hjPmqczMHpEOq5FaVJyVF8fUmNuy18raGhan82oXU+oRG8DYaeKN6uih1JqgbD968l3oji5KZ1xpAywFgRFlH6naN7Ot9cmeUlsGHj/3ECWCxIb7CnrMgW2R4FpCdl5wB8x050Oj0ahMDEAdS8WkhPH7iBYo1zVM/PPtZZZsyS/UAqKs7yqkPEM4Cxpuf0vqxHOcsRk13plwDjPOnDXthEF00CdfdoA6sDa9mdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRmCRqZq7lSzd/OL9K5H24ztVXsinWhb9BTAfJEAGys=;
 b=nRdJnHz/36jLotiofXJHSai1coh8zI7cIU3byxZpu0wTRFCFP3O/DQaYHTnmU+m6SXuVHsW+KgD87cBLCCnmHyFtqCxZl2OU9f4sxoDoiw9R6/ttb/ERKpsmPuiPhaR+HwNygKN8B+5cOP/KW/9f9cTQlID7r55mcR+B8Z2isOZ3CERJ7f3Gnj7SLFoxyNNhMqfsUgR33BZ91/r1RaCkv+xRBkayA0vd7z5UfT9CqNbInaZB5iR8mPjmOGHIUW734tdZ3r9K0cZbKd60bG9FbOFDRR2byID/LrOlPYKshmmzG7cG25wyGODep35jXiUZGGYaKdxVrE0c4b/j3sU2uw==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by AM7PR04MB6886.eurprd04.prod.outlook.com (2603:10a6:20b:106::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 01:43:32 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 01:43:32 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, Shenwei Wang
	<shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, Siddharth
 Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, Andrew
 Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, Russell King -
 ARM Linux <linux@armlinux.org.uk>, Paolo Abeni <pabeni@redhat.com>, Jakub
 Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, David Miller
	<davem@davemloft.net>
Subject: RE: [PATCH v3 net-next 2/4] net: fec: use new iterator
 mdiobus_for_each_phy
Thread-Topic: [PATCH v3 net-next 2/4] net: fec: use new iterator
 mdiobus_for_each_phy
Thread-Index: AQHcReBGrZIygDrS/kOKwPNvlYk4b7TVOlOA
Date: Mon, 27 Oct 2025 01:43:31 +0000
Message-ID:
 <PAXPR04MB8510C423FA075EBC32FFABBB88FCA@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <07fc63e8-53fd-46aa-853e-96187bba9d44@gmail.com>
 <65eb9490-5666-4b4a-8d26-3fca738b1315@gmail.com>
In-Reply-To: <65eb9490-5666-4b4a-8d26-3fca738b1315@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|AM7PR04MB6886:EE_
x-ms-office365-filtering-correlation-id: ec7926b9-5f1d-401f-e63e-08de14fa3c5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RXgzb0hUMUVSdlZNUTY2Ujc2UFpKamwwOFhqUncxb1pNTGZic3BtNG1jem1o?=
 =?utf-8?B?QkpJVGRaQ1ZOOHZuazV6ZkdzcjFuRjFKemlIOUk2N0UyVzVuNEhtYWRyZjFh?=
 =?utf-8?B?Vjhrc1RCVS9MN2Nld1J5QlJwUkVDVlR4QjdmcVpLaXo2VVlIZ3pvNFhMand6?=
 =?utf-8?B?TUxBN1p3N0d6aUVYb20rL3h1Q1BtVFpOalpXOCsreUYxVGUwWmlNQWk1VWVC?=
 =?utf-8?B?VUlsdUlFVzdGTUNlbjNIRWkydFhaclgrd3dxWUtWZE5RVEhwQlppVnNGYjk1?=
 =?utf-8?B?K1c1V2ltNGw4blJtOE9CeVFYUzJGT3lBVTR3Vjl2bHlFVkRmTHRLS1ZYektH?=
 =?utf-8?B?SFljdThiRkNZcFk4RUs4SlVOQ2RMSFkwQVVjMnRsUityQklyWWpUQTkyeWFT?=
 =?utf-8?B?dFVldUZ5Y0oxMUpyd201bVBObVRFRHBoTGQ1UW9kUkpTcXFNalFoRG50VE02?=
 =?utf-8?B?MlZJcTNuQ2NJSFRSakV5UUFXRFJNVS9vclpCYUZSR3lLcXBNREg4WGw3WVBq?=
 =?utf-8?B?WVg3eXU1eE9iN2VUUWU5K0VaNW41aHUyK1RiektLWElkRUorRE1LSEVEdDJR?=
 =?utf-8?B?WUNsOTBmOElwLzdWck1YaTJ3YmZGMzYwUkt0MlA3MU5PNks1em41bzlCaG02?=
 =?utf-8?B?NWhnVjdKODVHS3ZjY0FhN25kQXljckMzdXpuZVp5SWNuN1JnZDdwMUhpMGZv?=
 =?utf-8?B?Ni9DeFhJbmpOa00wZmRLN2NuV2o5TmV5b0RuUWRxUTZMTGRkdG44QTNPTzQw?=
 =?utf-8?B?cmFSZ2hmUGdGSjRFY01PSHhMOTdwYk1KNmQ1TUErMWFvRHlWcENaRnZzUm1E?=
 =?utf-8?B?UlJhY1haVWYyb0grUkwyZllMbVdyTmF3QTJUQUxFNU5qaGhmdWxhbGxhai9t?=
 =?utf-8?B?MGtrcEhJT2RhRmFBKzRUY1VTYjlVS0JJSkRieE04L3J4bXdKdjhKbU94K3hY?=
 =?utf-8?B?QUxqQ2xuUDlhcCtQVXFrZWFML3U1bGY0aFExNVNZRWZOR2t5dlRQTUdqSXlV?=
 =?utf-8?B?cFdDTytTK3R0TzVkNkdaeEpxNHpKMUdiN3NZSEx0NFdtUnB1UEgwSG1KMHZT?=
 =?utf-8?B?d2JlRGsyMEZNQzBXL0dFK0dEb0p6dE9TcWxzZlRHZjVpMHpCY2xWcUVqbCtx?=
 =?utf-8?B?RFhuVnZjemNCVmwvRkpWaWZWUHNBb3hLNGNxODFjYWkyZE9kSVdReXRITThC?=
 =?utf-8?B?WUQxN2NDTm5sOW1XMGZSWTIrWUhCc3NucGpYQklyV1poQnU5SjRMMWFWNi9q?=
 =?utf-8?B?TWN0OTVXWnhtSmc0YUwxRGxFT1JqMlg4QS9TeGd4UXcrb2doTXloTW5tK1ZW?=
 =?utf-8?B?aHNKcjRQTmhXcEtrOG5QOGtyb2VRU3ZGL1RWR0VQRlZUTlRaRHFyTFpTUWVF?=
 =?utf-8?B?UzhSNWFRTjdjVVlGSmIzYU1yb1pwVUpLM2hGSEVwbkJCenVhZWFWNDl5Tmw1?=
 =?utf-8?B?a2xxbjI5YWFtWGU3TnN3cllBdkU5eHpCa3RWNEc3TnVWcnoyTW9UR3hBS0VV?=
 =?utf-8?B?ZmVEdkJHMW5VUVFCdFNLQkQyRG5mYms2eDN0RkI0RWtpZkk0YlJMTzJiVmRK?=
 =?utf-8?B?VlhsQlBLa3cyZUFyLytqb1hUN2JVdVZRVm5NK3VrMFdGeXpBUFBacmxrNVl6?=
 =?utf-8?B?ZUxFTnYzNS84Z055NFhnc1o5UXhHdGtRL29kNFhlbnBmTERtZVNrbytldHlT?=
 =?utf-8?B?aEJLaVF2L09hdHNQK1FXcmFFbW9aZlNIN3MvUTFOQXNWOGFMRmtSUHdzdWJL?=
 =?utf-8?B?SndJK1ZOZ25NVnJEc2ljc2JiR1c0NXhPQmN3OFRNZVpYVFZ1dGg3Q3FGa1lH?=
 =?utf-8?B?T0dCdUhrMUVvTzJWR1NHWmVVRTArSlcyMHlaWjE1cGltWlNUNjVlNEJwckR0?=
 =?utf-8?B?NVZvQVpzRm9Gb1ZCY2hXKzhQVi9pUjdwRVlOeVg2VDRyRWk4L2N5c3RQL1Ew?=
 =?utf-8?B?TmJ2Zi9EbGV6Q2VKRmpEZ2R4OUpmMTF0WlUvVXoxQ05ta2JnRVVuRXNpbzN4?=
 =?utf-8?B?L3VWZENobG16c2xKTFNQVzZteHZKL0RIOTVRaHNab1YvUHFEb05OS2RiYXU0?=
 =?utf-8?Q?Gv3Kz/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SHRIbnF6VVZ0QldzZkFMb3l5NWp1SURtN1JETURyMC92QWtjNngyU3pYc2wv?=
 =?utf-8?B?eC9BNnZXeWUzKzRrdjlBVWUrSUx0dks2d1NNZ1MwbDhwUjIrTTd6L1k3TWJ2?=
 =?utf-8?B?Uk5LckNId2R0RDEwQm5KSzZHMmFvTmR6WTFPNEVLQjJRbXBzTHpXdVNodVhl?=
 =?utf-8?B?SEhZL1c4WEFaYXRNamJqTVNyRFd2UmtCWlJieDZTSDlWd1h6WTNyVXl2Q01V?=
 =?utf-8?B?cnRNWk5qS0FDZ1BCRzkyT3QyblRSclF1dlh0V1EyeTR6RTVzRG8rVGhzZFFt?=
 =?utf-8?B?ZHhGRUtxTGpCT2dqd0NVSFlVTkJPVFEzY3ZjL3ZXNkRodm0vTE1lbEN1ZjdM?=
 =?utf-8?B?STl2czdkN3o2djRDemYyZVVKWFBPYXpBTlFGZkdNTURtbXlqQU5kNzlqYzVv?=
 =?utf-8?B?Qm1NYUxJRkpQQVd4QzdOZnJrbjJ1NUhIZzgxZ0dza0VpYW0yNXV4NnNiRkk1?=
 =?utf-8?B?Vy9XQlFHS29YUG1hclQ1QUxhV0VMaEY3S3NLcUZRaXc2L0paSW9WZGJubGds?=
 =?utf-8?B?N2laa2NnWEg0UFBWa01TZU45dHB5RVhnaHB1TjR1czhPQW1heHdYaXZZbjZa?=
 =?utf-8?B?WVJkTU8zY1dPV1pFaVlQWVd3bXRjV1ZTVU4xTys3ZjlzNUJ3T3h0OHk2Skhr?=
 =?utf-8?B?b0JGdkRDYkZaRGJBMzR5Z055QnIvd2UyOExsLzdYUG1nZloyWFNRRHJYMzhp?=
 =?utf-8?B?aUx2NEd3YnFkNWh5aUZrV2dwNHJ2anBKV3ZDOTMrQlE5akFlNEFtdXFXSVZz?=
 =?utf-8?B?Zzd2dVI0dmxCZUJvbElEanVLejljUkIvcUF0SHFLUjVlNDRSb053TkgybDlj?=
 =?utf-8?B?VHRyYXlvOXJxdEN5emVkTURWQWdZTWQzTjViejh0RmpZckdRUVh5TjhnZk1B?=
 =?utf-8?B?T3ZGTE5CbEs5V0h0dlhLUmVTWGpldTVvT0VJNVRzaGVLdG1HREY3WXpITDVZ?=
 =?utf-8?B?bVBTbnZHK3hZMXJvSi9yMEwvUitHZFZtc2J6Z0RDSXc5bVpTM21PR1krdi9l?=
 =?utf-8?B?ZktyNWpnM0l6U0F1MnhQRWxRZWdJbCs3L0p2VVg5ZmtzV3R6MC9HSDNlekV1?=
 =?utf-8?B?K1ltTGl4dVJ6a3djQklJWStLM1oxTHpybDYwVDVzQjF3Q2t1MXhHNU94WXpH?=
 =?utf-8?B?V3B6Q08zVSsvblJTbE1NaUJtdjlIZm1neXFkU2ljWmMzRHdJbnNOUWhMaU4z?=
 =?utf-8?B?UHZhSmxrZmszN2xvWlFqcTJWbU1vbEU1RzlRY3hRVlpUQVdyRGdPVUdKMERw?=
 =?utf-8?B?d2tyVDM3NUxobjVlWnErZkVDcS9kZ1NPRzc0Q0QyVDZiWDlFY3N4aUxUc21O?=
 =?utf-8?B?OVlPV0ZPT3pCc3VKRG9tZ21mS1Bkckx6K2RhSHVPN3JrWmd3M1VSVC9uY1pK?=
 =?utf-8?B?L05xd3Zack5LbEx1N1QxZ3FsOVd0OTFxbFlRMlVtMk53MjQ5emY2b1NPVSs2?=
 =?utf-8?B?YTR1b0FwVHo0clZHZ3U4dGQxK0pIL05KUnZ0M0UvNmF4TzFDU0dNSHhjS2J4?=
 =?utf-8?B?SWZUYkxLY1hPV3ovbTVWM0dhKzBWR3dXZUY3bDR1a0lJYTJWT3dwQ3gzaWhD?=
 =?utf-8?B?QXMxaDhNcTliK0lLb1hkOGxiVXdGN3lrcWc1S2NkR0RiOFc4SGNsK2J2UGRW?=
 =?utf-8?B?RjFUL1M3c1ZPdWhnMTBzMkd5cWYvemNyU2NiZnJXMU9rL0R1cjg3TVVKUVZU?=
 =?utf-8?B?b1FVL0ovRjcrWjJuRnZnTlFxVkV0RDN5Q2JGWkt1Z0xlTU5HVUxCK2xtR2p0?=
 =?utf-8?B?a2JWRk9vNkdzN1c5U3hwNm5FS0Y4cnlwZllEdjkrMVVPVk40Rmt2VkRwVlFY?=
 =?utf-8?B?NFVpRjlGNzJ2b3VsY0UrOGZpT1ZoNytONXpNZzZWYzhlZEdxci9HQTA5SGFk?=
 =?utf-8?B?RERyUXJMcjN2SUlCTUp2cWVnZkY3azdtRy84OUpaTjF4MXZoaFBYd0Q5VGtQ?=
 =?utf-8?B?S1NPd1dOckQybjcxWVZmL2tCUVhhOUgrcHh1Z1FpWXBxd2RxKytzM2M1Z2Ew?=
 =?utf-8?B?Z1F2Y1JmUEI1bmVXaUZ0VkRlTjVtbGRma0hFRmRqa3BlUDhzbnFaVWhsdkpB?=
 =?utf-8?B?UEo2NkZtSUU1M3BHaHdzTWd5c0lldlZPdVd3c0xubjFYMEpoK3NXd1VQdCtn?=
 =?utf-8?Q?K4Ow=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7926b9-5f1d-401f-e63e-08de14fa3c5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 01:43:31.9855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pY6B9z2s06JfjuiHRvrFEvfEchxchfsppy0kPtYxlg5FVoX2cg8iRS/336gY+6uenRuVKJPOjT+EyRJZfmoDEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6886

PiBVc2UgbmV3IGl0ZXJhdG9yIG1kaW9idXNfZm9yX2VhY2hfcGh5KCkgdG8gc2ltcGxpZnkgdGhl
IGNvZGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFA
Z21haWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9mZWNf
bWFpbi5jIHwgOCArKy0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9m
cmVlc2NhbGUvZmVjX21haW4uYw0KPiBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9m
ZWNfbWFpbi5jDQo+IGluZGV4IDFlZGNmYWVlNi4uYzYwZWQ4YmFjIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZmVjX21haW4uYw0KPiArKysgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZmVjX21haW4uYw0KPiBAQCAtMjU1Miw3ICsyNTUyLDYg
QEAgc3RhdGljIGludCBmZWNfZW5ldF9taWlfaW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+
ICpwZGV2KQ0KPiAgCWludCBlcnIgPSAtRU5YSU87DQo+ICAJdTMyIG1paV9zcGVlZCwgaG9sZHRp
bWU7DQo+ICAJdTMyIGJ1c19mcmVxOw0KPiAtCWludCBhZGRyOw0KPiANCj4gIAkvKg0KPiAgCSAq
IFRoZSBpLk1YMjggZHVhbCBmZWMgaW50ZXJmYWNlcyBhcmUgbm90IGVxdWFsLg0KPiBAQCAtMjY2
NywxMSArMjY2Niw4IEBAIHN0YXRpYyBpbnQgZmVjX2VuZXRfbWlpX2luaXQoc3RydWN0IHBsYXRm
b3JtX2RldmljZQ0KPiAqcGRldikNCj4gIAlvZl9ub2RlX3B1dChub2RlKTsNCj4gDQo+ICAJLyog
ZmluZCBhbGwgdGhlIFBIWSBkZXZpY2VzIG9uIHRoZSBidXMgYW5kIHNldCBtYWNfbWFuYWdlZF9w
bSB0byB0cnVlICovDQo+IC0JZm9yIChhZGRyID0gMDsgYWRkciA8IFBIWV9NQVhfQUREUjsgYWRk
cisrKSB7DQo+IC0JCXBoeWRldiA9IG1kaW9idXNfZ2V0X3BoeShmZXAtPm1paV9idXMsIGFkZHIp
Ow0KPiAtCQlpZiAocGh5ZGV2KQ0KPiAtCQkJcGh5ZGV2LT5tYWNfbWFuYWdlZF9wbSA9IHRydWU7
DQo+IC0JfQ0KPiArCW1kaW9idXNfZm9yX2VhY2hfcGh5KGZlcC0+bWlpX2J1cywgcGh5ZGV2KQ0K
PiArCQlwaHlkZXYtPm1hY19tYW5hZ2VkX3BtID0gdHJ1ZTsNCj4gDQo+ICAJbWlpX2NudCsrOw0K
PiANCj4gLS0NCj4gMi41MS4xDQo+IA0KPiANCg0KUmV2aWV3ZWQtYnk6IFdlaSBGYW5nIDx3ZWku
ZmFuZ0BueHAuY29tPg0KDQo=

