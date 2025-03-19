Return-Path: <linux-omap+bounces-3444-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 016DAA685E7
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 08:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 997D67A6563
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 07:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5F424EF8B;
	Wed, 19 Mar 2025 07:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="yajIZ5Pd"
X-Original-To: linux-omap@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2081.outbound.protection.outlook.com [40.107.22.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96B520E31B;
	Wed, 19 Mar 2025 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742369998; cv=fail; b=Flvwg4zuaX/ezamz4HLGLggYo8YawxOJIENwj+/jGnzTKfrO1Pk4znKtBM7MhzLAptYuWCOi/aAzQBIizk20u6dFLENTqFnCUfUMD2qNxVwzzMIjTXZV4BoniNoCK0CPVwSDbJcWRbwfgmnL4xkk5SDDbDuYGqwlJrIHWE1/HyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742369998; c=relaxed/simple;
	bh=6Xj9tkCH8Wj7AJzPe310l65GXotMr3g5sdJAAwwOaCg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V2Ly4DbXB9xSJo9fNWCqwDnuI445VpiqpEzV6ocnwKLFO6OwCc+0aX699pNdao9DOjl7crQt/4Tcr8QozUQJ1GoJ1QliMdYXP8qMlS80YqP2YL5OiUK60lixqYeKarfKbdPCq32u8u3At7rCSNxzNtY+nbzGEkv6+RyNmTtOek0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=yajIZ5Pd; arc=fail smtp.client-ip=40.107.22.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tp//DBTt3RCmeEvfOArvEb3Dp6e+coVYp8fZbKa9VvjcU6qxO+30ZeIgw3Fb5YmOH6RAYfC8Psi47AkellN5s4Blf3+P/oADz/OvBOvLQOcJezz98uW9pUv/29Z3QDZ6bSrOG26VxTtNjWfbJBNH1y0y+UnhF/X8vnkPix0s+d7qFgHHPvC6+SsN6zJxOR8rVbERU+y30auuJ+szvIG6Sseletxm5aBxdfHlnjHgx2WrCF+XNHBkjHCZuvUFdoOY+Oz0Q3gh8tEEH8GXRd/NNW5+jssYFji00sTqdz4xv2tlT1NVTov9xSIViOja5wl2FhD/8g+p4V/IjiIYG2uaKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Xj9tkCH8Wj7AJzPe310l65GXotMr3g5sdJAAwwOaCg=;
 b=dNRqV18oSyTytJHtqT32L50VNpcy/x+DwTV7gRPdgCkIrhy6GIdzGV0d/BtAQy7JSJ67MLipWe5aBpQxKDBnH5ScFgPfNCEAzFcDetNDt0iwwJYrcIgbeAHkLjJoNFLK6OrALWinbmVEW0wOA5mmwnKlDVIDhwc4T6CKgKirk+A51kxjoneVwtj8xlYyVN/8sKnmFZRcYN7d59+UGS7e6/q84YeDR7MT+jHi3sL43mTen/3mxYg3BJXIOJ3cEKEUnHd6jXU62jnMza0v/YCOAFjrpa53sWSjTzw1ma7qHbfuFnRlFVHNBkcy3cvepG9+umID6SbfGXDYAsU5g2bWYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Xj9tkCH8Wj7AJzPe310l65GXotMr3g5sdJAAwwOaCg=;
 b=yajIZ5PdB8kHZ0ZbMsP3wY2EDNu4dwIgfOjnb+C8IoSP1zB2wvVnrmufJtxuBul8a3/F8dofAX/v9qAg94xSq8WBkcO8qPnT++OHYWijTwKFqMcTY5dIQWTGduDHFkYbqdxbGFiFLjXcSmHF8FoQlad9Sh7uIwmxLfZMeivDxSeNdfx6lx+iOhYdRRgVdoZH4LzmLzIWyZJ++KYZORj1hpA9Xe6ccsTFiTQs7/0bqnzgxt5EJ4VNb/9KYh+OBPnyMLF2Jlv1xaCmGCEBq+23Gz4w5g70hUDuO4zzIWcU6CqYxkza8L+3h/Rj/L/lUTMPOGqtctre75/4xifodnUgvg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GV1PR10MB8901.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 07:39:52 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 07:39:52 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "tony@atomide.com" <tony@atomide.com>, "andreas@kemnade.info"
	<andreas@kemnade.info>
CC: "rogerq@kernel.org" <rogerq@kernel.org>, "aaro.koskinen@iki.fi"
	<aaro.koskinen@iki.fi>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "khilman@baylibre.com" <khilman@baylibre.com>
Subject: Re: [PATCH] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg
 interconnect devices first"
Thread-Topic: [PATCH] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg
 interconnect devices first"
Thread-Index: AQHbk/znYu6FpepAZ06TMJZ5wavTxbNxckSAgAAWmQCAABYxAIAIPqYAgAA+hIA=
Date: Wed, 19 Mar 2025 07:39:52 +0000
Message-ID: <f53e999648997121fb6079b7baad56acd6c0016e.camel@siemens.com>
References: <20250313094708.1003092-1-alexander.sverdlin@siemens.com>
	 <20250313202129.0dcfc44e@akair>
	 <6348326299702a12ed4faa6ea25ee8bbe5e232aa.camel@siemens.com>
	 <20250313230148.792f224b@akair> <20250319035606.GA4957@atomide.com>
In-Reply-To: <20250319035606.GA4957@atomide.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GV1PR10MB8901:EE_
x-ms-office365-filtering-correlation-id: 9234b8da-5d33-4be9-6a39-08dd66b93c4e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WWYwT0g4QTY4MGt3SHhIUVd4Mm12bkYyL1pIbU5XSSswQVFYRit0OGFDMkx5?=
 =?utf-8?B?UDgzRDZBeHJSbGJ6MnlzUFdNMitnN2hhcjN6RWNsRTBGbWZPOHNhaE1jNk5y?=
 =?utf-8?B?SThKS1B2QmVLL215S25mRUtTMGZMMlNLa29nNE9QTEJDRXN3c0I3QXlMaThj?=
 =?utf-8?B?ZVVIR3NTdnQvV2RRQ1ltYTFYc2d2M0V4ekxIUU9UV2QyUnlxV3dOMXZEWUIr?=
 =?utf-8?B?RVVUY3FBMVV5QXBFak9VYlUzQ0l2RVBpTFZDUkdkWjNqY1VjYTBNalcrOUV0?=
 =?utf-8?B?TTRYU1lVNFhUWVFHOFhVTDRQKzYvYXFmRExRM0dISkpSWGZLNG5XV05Nc2tm?=
 =?utf-8?B?bDJlR0RzQnIwOGp2QjZqZnRrR2hXUXpacHVHRlZveHc4MjV0eUZqQ1pqT2J1?=
 =?utf-8?B?YVZhTW4vY09YUWhXODdoMG1ybkZCNnN5U1c0b3NWZkRmalJDU3VmUkpsRksr?=
 =?utf-8?B?amduVVhzdTk0RjR2a3BLVUxVQ3J5eUc1SUZ1SVAydW9oWWtFOFRPN2s5d0Vm?=
 =?utf-8?B?TngraHBSN0E1UmExVEZoOVEvbDdmWHVQYkFzRUxac2UrUmhzb2NTUjF1NFgx?=
 =?utf-8?B?UkgwZ2twaDU3NjJJWXg5ZTdWcktRT0h1STdvTk9qQkJReFl2NE55dVIyNTFL?=
 =?utf-8?B?UkVRRnQ4cHhYNmRsbnU3ZFBXeEt2Mks3RzVGVXNpb1ZBUEI3WFNUWEprR2da?=
 =?utf-8?B?bHpndnJycWIvVldmSHY5K2NCQ05pc2loTExOcENCRk9yWlBPL0ErR0NIV0xt?=
 =?utf-8?B?Q0IzZFRFVUVRK1pVbnlVNFkzMHJtU1p6NHJvZmc0TC9ua20rSGxRWHh6NWY3?=
 =?utf-8?B?ZEJFRHBRSm5WMEZFUEZCWXZFK2paL3VkYmxmQUExeldFWmhwaHZwOU1mWlJr?=
 =?utf-8?B?REdIS3dTbjNqR1V1d1Nzd1htSnYwS0ZOaU5LMlVXdi9ISnJkcWVHUFBKZ2VH?=
 =?utf-8?B?TlBqOGxHNHlEdEl2bG8vdTc2M2lLaUZDK1dFU3dPY3Z2dERwQ1l6SWFweGRw?=
 =?utf-8?B?aDlTeVFOeWFlNExndFNzWlRHanErZzMvTHpsV3RjK01iQ2dwM2E0RWJtM2po?=
 =?utf-8?B?UXpxeHc1c3RPQi9UMUJiSVJqdjRMQkVlbnRHT0FFVDVVcWlLeElyNGlSdVhB?=
 =?utf-8?B?OURyQm9IeXpHUkpDZDdCenJZMjFQamtPaXNWK3l2ckhocDh5YXZSRnhGSHJQ?=
 =?utf-8?B?UDdJM1FXRU5EamNnTnByblhWcEZ5c3RSelpCMTVQV0JiMjBDTkpTOU01UWhH?=
 =?utf-8?B?OHBsMklhcTlvK1pmZFFVRGdIVkQ3MU1ZdjFUNXJ3cGpXSFdvbFY4c1h4dExo?=
 =?utf-8?B?SktxNzM5c2VTWFBZbStKR0ROK2ZFRnYwbFEvZ2NxRkJCay9qYVlBMUJTM2RO?=
 =?utf-8?B?K3pXZjBTZ2pMbjBXQkdmNHNLbEwxY2tMMTVoVG5BM3JMay9FUVhTRlI5TEhw?=
 =?utf-8?B?QWw1NHRqSWpRMmNyRVA5KzZSTGREQjFjNnFpZlZZS0l1YWgzQW1TanB3TStO?=
 =?utf-8?B?M25iNzRPYjdXSHpoNTM0NkRSbnZmcE9yRmphOFJFYU5QZ1Y0YmF5UDhRTnNX?=
 =?utf-8?B?S2xRU2V2RjRHVmw1VlNUK1Jtd09kK2FVZFIyeFVuSGl2TjRQbmorV0FVNGdS?=
 =?utf-8?B?N2hlQTVFUUxWZjVwWEZWRUJxMUhPcllVUklnMnJxYVVtR0hQZmh5WXRkQnM4?=
 =?utf-8?B?NVo4U1NTQzJvZmxGbjMvQ0k2UWhFYVp5SGc3bGV6UzZaLzYyWXZLL3JHNm5I?=
 =?utf-8?B?MU03Y1NrUHY4a3hRcHJ1emNVcWpXUis1T3FhRGN1WGFUSTNDZ05nWVdjSzNL?=
 =?utf-8?B?Y1UwTVNtZTJMdndQOWhqeVU0UzhkYXhqSjJ2WkR6N2w1c1BqbTB5V1A0c05K?=
 =?utf-8?B?dkt6eG1GVVlDcjhyYmY5bUtVSGZJRndJb0tZSk93WHpkL0E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUMwdzdzK3gwMDM2eU1ncmtvVjRuai9aY1JCTEgyUXdBa0U1YTBlaTZieU5Q?=
 =?utf-8?B?UHVtRHNxaXpEK2R3eWFuRU5MT1J2NnRUM3ZpUXl0YTNsbUd4Wlc3UE9Cc0lu?=
 =?utf-8?B?UllRdWxxamhQS01CK2htd1YxVVJ1YVJIK3l3TmRiNFhGM09peWdoZCtJL0s0?=
 =?utf-8?B?N2R5QkcwZ01tdk4yL2NxdUd5TnFDSWxSUEpPYWRxV1ZRRUhnWjkwS0ZNY3k1?=
 =?utf-8?B?S2FhckFuUHVZenBnbTRaYk9DOFlnZTlxVTladWVjTEdJWjc0Y05Well5Sndi?=
 =?utf-8?B?SGdQMDJidU4xRVgxYmEvMlJTQnZHd2hWck5LamZoZTExemNaWm5OdUdoRjNT?=
 =?utf-8?B?eVlsZVFsUkd4d25jMEZFeWdtSzBmU0hmaFNrQTFOMnZGa1hRYlM4TkFwQk5Z?=
 =?utf-8?B?RGZ6UlFJLytPSmtkalhjSEFpb0g0cjA1TFpIWFRZUTFsMEhLZEtETjNLSkc2?=
 =?utf-8?B?cVh3YTRUR1RyRytLNTZoK2RnSXQxSDVsTVd4VTRJNzM1MXFmUjdCUVpiMFpT?=
 =?utf-8?B?dG9sd0RDM2ZLRzFHbTBEWG11bytWVWdyQzZjZ0FlcFJNOGNQRVVTczI0MFUr?=
 =?utf-8?B?WmhHTDBUOS83cVh5enBaVlhDdTVuWGhEMmtrYVNtQ0N2VDN0L3UrVGlTS0ZP?=
 =?utf-8?B?MFRiUEFDZDJpckN2VTJ0R2ZnREpsKy9ITFZMMWp4RGJVV3JnM0U4Sk02ZHdW?=
 =?utf-8?B?YkNUcXZqSnRxSTQ2aDNUYmFFK2FrL09BbmZhOUNXNmI4dHZmalJIYnN3cUFT?=
 =?utf-8?B?L2k2TXN0ajN6SVpBV0M1Z3JxMGdHRTUxUGxzbFdQek5LemFFeHpUVnVORjNH?=
 =?utf-8?B?WHVsM0hyZnV4SDFteElvTlB1VkZpdWt6UmptdGpTcTRYQ1ZzeHd6bGUwVlM4?=
 =?utf-8?B?NFdrVzJRb3Bkb1lXYllXd0NNdVpxWWZTTy8vWWNWTkM2TnhTaWE5QjUxeDYy?=
 =?utf-8?B?K29TajIwK2ZQejN5bzVjREJhR00xYVVOMEFYcGhndVVnUW8zc0JZVWZZWmtz?=
 =?utf-8?B?M2M4bkwxRW9WSFRsUE1KaVpzNFBjd0ZzYmZvN3FyNXdlcGZVVFV5dVkvbEhG?=
 =?utf-8?B?TmZuckhGbFJsNWVKN2lMZDVNbG84dDYvMVdCTzRkSHdNSE9XQkFEM1M4eUhn?=
 =?utf-8?B?c1AzVGpxVUJTSFdhdFI2ekxlNFYvSXd6aTRQNGl2Z0IxbTc5cFdiUGJFUk5O?=
 =?utf-8?B?RzV2SzBqZ0hmZWZlZVN0MjlER1oxN1EycTlvZWFnVGhBa3g0NVZsbXYzYk9N?=
 =?utf-8?B?UEtyRGpOU2NvM1ZqdnVOc1FkUE1tV3ZUMHRTOUJMV3owQ3BpZU11OEdSbnNw?=
 =?utf-8?B?QUk3TVJwWllGcnNwbXVjNzBHTE1aMFF3aE1oVUJrVGEzZzduTUx6RnE2MUxP?=
 =?utf-8?B?d2NXdEhKWVdtT3dMNUtBcjBKRWxQY1YzMzc0NFlDUS9PZS9OajJuNWRWQnFX?=
 =?utf-8?B?MjVjdDFSMjlITU9lN05Mc3BRVWhrMzNUY2xFbEdsVU1oQjlJRHNHWjNXQjF4?=
 =?utf-8?B?TFg2VEhrODQ4NWZCNVdCWUozQ2ZwendIaEJwbmY1bUt4ZmpQdkFaN293TlRY?=
 =?utf-8?B?WURId1NCeGhMSm5Wd3gzdk5tSDBNTGlLZlRINEt0T1lRNnhjRnl3c2J0STdH?=
 =?utf-8?B?b2h6UlB4bkxJa1drSEhQckZDdkd0R3NlaTcxaU1tcE1LRXMzZXFDaDdBaVhH?=
 =?utf-8?B?eG9PMmxBays5Ly8vTU1Bc0o0V1NpK3JvSFhraFQxVi8zak4yTmJiNjNMVzJ0?=
 =?utf-8?B?NDR3ZlVUUW0yK0l5T3dPb1dQYnh3c1VtUnFNSEFldFk5dXdFZ3BZdmVsb3Y2?=
 =?utf-8?B?c2RuQmp6UDNPVmxpcFkvZFYwMjU5Zlg3UnZhaWhHd0tteVlzc0pjWDd3Ty9O?=
 =?utf-8?B?RXFnUmlBUy8zVTlaWVdxQlJkNldocXEwM1NrRkxlLzZOT214SzVCeG5oWXo2?=
 =?utf-8?B?dmZ5N3YxWWhtQTBMZ3ZBbk9lT1hNYzRJa1NxelFtWEZHelB6VkhKRXRoQTd0?=
 =?utf-8?B?c3N6TFh0UmJyVXR4V2JTbld6TWpOemdzbmtwclVhYVc0amMyWUFkSU8xa3pL?=
 =?utf-8?B?NWxzNlhNUjdnWTZhZXVXTEcwQ0wrQUp4aFUyQzVpWE1ldk0yLy9uNGF0U2Y0?=
 =?utf-8?B?OFpSSnlHeEd4TXNMZzd5di96SmdoUFBBNVZKSGZWSUpFY2hYY1BXa3VGdGcr?=
 =?utf-8?Q?kEVH2Sq0TqgleqE+622KnKg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2904FB840618694DBFB1F9BC1074179F@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9234b8da-5d33-4be9-6a39-08dd66b93c4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 07:39:52.3171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9xZiOdFvAbm4c8CAD2jNh3zrmc0tQ0m9Sz5OGpNlD8pVg/arVBn2aATNQNHnHDg1L2lndOeMsctpuBuhx+dmeJhRBtisesozqUq1j+ddHH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8901

SGkgVG9ueSwNCg0KT24gV2VkLCAyMDI1LTAzLTE5IGF0IDA1OjU2ICswMjAwLCBUb255IExpbmRn
cmVuIHdyb3RlOg0KPiA+ID4gPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgNDcwMGEwMDc1NWZiNWE0
YmI1MTA5MTI4Mjk3ZDZmZDJkMTI3MmVlNi4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJdCBicmFr
ZXMgdGFyZ2V0LW1vZHVsZUAyYjMwMDA1MCAoInRpLHN5c2Mtb21hcDIiKSBwcm9iZSBvbiBBTTYy
eCBpbiBhIGNhc2UNCiAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXg0KWzFdDQoNCj4gPiA+ID4gPiB3aGVuIG1pbmltYWxseS1jb25maWd1
cmVkIHN5c3RlbSB0cmllcyB0byBuZXR3b3JrLWJvb3Q6DQo+ID4gPiA+ID4gwqDCoCANCj4gPiA+
ID4gYnJha2VzIG9yIGJyZWFrcz8gVG8gdW50ZXJzdGFuZCB0aGUgc2V2ZXJpdHkgb2YgdGhlIGlz
c3VlLi4uwqAgDQo+ID4gPiANCj4gPiA+IFRoYW5rcyBmb3IgdGhlIGNvcnJlY3Rpb24sIGl0IHNo
b3VsZCBoYXZlIGJlZW4gImJyZWFrcyIuLi4NCj4gPiA+IA0KPiA+ID4gPiA+IFvCoMKgwqAgNi44
ODg3NzZdIHByb2JlIG9mIDJiMzAwMDUwLnRhcmdldC1tb2R1bGUgcmV0dXJuZWQgNTE3IGFmdGVy
IDI1OCB1c2Vjcw0KPiA+ID4gPiA+IFvCoMKgIDE3LjEyOTYzN10gcHJvYmUgb2YgMmIzMDAwNTAu
dGFyZ2V0LW1vZHVsZSByZXR1cm5lZCA1MTcgYWZ0ZXIgNzA4IHVzZWNzDQo+ID4gPiA+ID4gW8Kg
wqAgMTcuMTM3Mzk3XSBwbGF0Zm9ybSAyYjMwMDA1MC50YXJnZXQtbW9kdWxlOiBkZWZlcnJlZCBw
cm9iZSBwZW5kaW5nOiAocmVhc29uIHVua25vd24pDQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXg0KDQpbMl0NCg0KPiA+ID4gPiA+IFvCoMKg
IDI2Ljg3ODQ3MV0gV2FpdGluZyB1cCB0byAxMDAgbW9yZSBzZWNvbmRzIGZvciBuZXR3b3JrLg0K
PiA+ID4gPiA+IA0KPiA+ID4gPiA+IEFyYml0cmFyeSAxMCBkZWZlcnJhbHMgaXMgcmVhbGx5IG5v
dCBhIHNvbHV0aW9uIHRvIGFueSBwcm9ibGVtLsKgIA0KPiA+ID4gPiANCj4gPiA+ID4gU28gdGhl
cmUgaXMgYSBwb2ludCB3aGVyZSBubyBtb3JlIHByb2JlIG9mIGFueXRoaW5nIHBlbmRpbmcgYXJl
DQo+ID4gPiA+IHRyaWdnZXJlZCBhbmQgdGhlcmVmb3JlIHRoaW5ncyBhcmUgbm90IHByb2JlZD/C
oCANCj4gPiA+IA0KPiA+ID4gQmVjYXVzZSB0aGVyZSBpcyBhIHBvaW50IGluZGVlZCAoaWYgd2Ug
Y29uZmlndXJlIHF1aXRlIG1pbmltYWwgc2V0IG9mIGRyaXZlcnMganVzdA0KPiA+ID4gZW5vdWdo
IHRvIG1vdW50IE5GUykgd2hlbiBkZWZlcnJlZCBwcm9iZXMgYXJlIG5vdCB0cmlnZ2VyZWQgYW55
IGxvbmdlci4NCj4gPiA+IA0KPiA+ID4gPiA+IFN0YWJsZSBtbWMgZW51bWVyYXRpb24gY2FuIGJl
IGFjaGlldmVyIGJ5IGZpbGxpbmcgL2FsaWFzZXMgbm9kZSBwcm9wZXJseQ0KPiA+ID4gPiA+ICg0
NzAwYTAwNzU1ZmIgY29tbWl0J3MgcmF0aW9uYWxlKS4NCj4gPiA+ID4gPiDCoMKgIA0KPiA+ID4g
PiB5ZXMsIGl0IGRvZXMgbm90IGxvb2sgbGlrZSBhIGNsZWFuIHNvbHV0aW9uLiBBbmQgd2UgaGF2
ZSB0aGUNCj4gPiA+ID4gcHJvcGVyIGFsaWFzZXMgbm9kZSBpbiBtYW55IHBsYWNlcy4gV2hhdCBJ
IGFtIGEgYml0IHdvbmRlcmluZyBhYm91dCBpcw0KPiA+ID4gPiB3aGF0IGtpbmQgb2Ygc2xlZXBp
bmcgZG9ncyB3ZSBhcmUgZ29pbmcgdG8gd2FrZSB1cCBieSB0aGlzIHJldmVydC4gU28gSQ0KPiA+
ID4gPiB0aGluayB0aGlzIHNob3VsZCBiZSB0ZXN0ZWQgYSBsb3QgZXNwLiBhYm91dCBwb3NzaWJs
ZSBwbSBpc3N1ZXMuDQo+ID4gPiA+IA0KPiA+ID4gPiBOb3QgZXZlcnkgZGVwZW5kZW5jeSBpbiB0
aGUgc3lzYyBwcm9iZSBhcmVhIGlzIHByb3Blcmx5IGRlZmluZWQuwqAgDQo+ID4gPiANCj4gPiA+
IEJ1dCB0aGUgcGF0Y2ggSSBwcm9wb3NlIHRvIHJldmVydCBpcyByZWFsbHkgbm90IGEgc29sdXRp
b24gZm9yIG1pc3NpbmcNCj4gPiA+IGRlcGVuZGVuY2llcyBvbiBzeXNjb25zLiBJJ20gZmluZSB3
aXRoIG5vdCBwcm9wYWdhdGluZyB0aGlzIHRvIHN0YWJsZSwNCj4gPiA+IGJ1dCByZXZlcnRpbmcg
aW4gbWFzdGVyIHNob3VsZCBnaXZlIGVub3VnaCB0aW1lIGZvciBvbGRlciBTb0NzIHRvIHRlc3Qs
DQo+ID4gPiBXRFlUPw0KPiA+ID4gDQo+ID4gSSBhbSBub3QgYWdhaW5zdCB5b3VyIHJldmVydCBw
cm9wb3NhbCBhbmQgbm90IGFnYWluc3QgcHJvcGFnYXRpbmcgaXQNCj4gPiB0byBzdGFibGUsIEkg
d291bGQganVzdCBsaWtlIHRvIHNlZSBzb21lIFRlc3RlZC1CeXMgYmVmb3JlIGl0IGdldHMNCj4g
PiBhcHBsaWVkIHRvIGFueXRoaW5nLiBJZiBhbnl0aGluZyBuYXN0eSBwb3BzIHVwLCBpdCBzaG91
bGQgYmUgc29sdmVkIGluIGENCj4gPiBjbGVhbmVyIHdheSB0aGVuIHdpdGggdGhlIG9mZmVuZGlu
ZyBwYXRjaC4NCj4gDQo+IFNvdW5kcyBsaWtlIGZvciB0aGUgQU02MnggcHJvYmxlbSB0aGVyZSBp
cyBzaW1wbHkgc29tZSByZXNvdXJjZSBtaXNzaW5nDQo+IHRoYXQgbmVlZHMgdG8gYmUgY29uZmln
dXJlZC4gRGlkIHlvdSB0cmFjayBkb3duIHdoaWNoIHJlc291cmNlIGlzIGNhdXNpbmcNCj4gdGhl
IGRlZmVycmVkIHByb2JlIHdpdGhvdXQgdGhlIHJldmVydD8NCg0KVGhpcyAibWlzc2luZyIgcmVz
b3VyY2UgaXMgcG9pbnRlZCBvdXQgYWJvdmUgaW4gWzFdIGFuZCBbMl0uDQpBbmQgaXQncyBtaXNz
aW5nIG9ubHkgYmVjYXVzZSBvZiB0aGUgYXJiaXRyYXJ5IDEwIGRlZmVycmFscywgd2hpY2ggc2lt
cGx5DQpkbyBub3QgaGFwcGVuIG9uIGFsbCBzeXN0ZW1zIGlmIHlvdSdkIGNvbmZpZ3VyZSBsZXNz
IGRyaXZlcnMgb3IgdGhleSBhcmUNCm9yZGVyZWQgaW4gYSB3YXkgdGhhdCAxMCBkZWZlcnJhbHMg
YXJlIG5vdCBuZWNlc3NhcnkgaW4gdGhlIERULg0KDQpJZiB5b3VyIHBhdGNoIGlzICJmaXhpbmcg
dGhlIHJvb3QgY2F1c2UiLCBjb3VsZCB5b3UgcGxlYXNlIGVsYWJvcmF0ZSB0aGUNCm51bWJlciAi
MTAiPyBXaHkgaXMgaXQgMTAgYW5kIG5vdCAxMSBvciAxMTAwMDAwMD8NCkNvdWxkIGl0IGJlICIy
IiBvciAiMSIgYXMgd2VsbD8NCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcN
Cnd3dy5zaWVtZW5zLmNvbQ0K

